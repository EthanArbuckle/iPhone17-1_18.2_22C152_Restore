uint64_t _uuidpath_pathcache_compare_key(int a1, uint64_t a2, unsigned __int8 *uu2)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), uu2);
}

void *_os_trace_uuid_map_destroy(void **a1)
{
  result = _os_trace_uuid_map_clear(a1);
  if (a1)
  {
    v3 = a1[2];
    if (v3)
    {
      do
      {
        v4 = (void *)*v3;
        operator delete(v3);
        v3 = v4;
      }
      while (v4);
    }
    v5 = *a1;
    *a1 = 0;
    if (v5) {
      operator delete(v5);
    }
    JUMPOUT(0x1A622CE80);
  }
  return result;
}

void *_os_trace_uuid_map_clear(void *result)
{
  if (result)
  {
    v1 = result;
    if (result[3])
    {
      result = (void *)result[2];
      if (result)
      {
        do
        {
          v2 = (void *)*result;
          operator delete(result);
          result = v2;
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

void std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(void **__p)
{
  if (__p)
  {
    v1 = __p;
    do
    {
      v2 = (void **)*v1;
      if (*((char *)v1 + 39) < 0) {
        operator delete(v1[2]);
      }
      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

void *_os_procinfo_map_clear(void *result, uint64_t (*a2)(void))
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      for (uint64_t i = (void *)result[2]; i; uint64_t i = (void *)*i)
        result = (void *)a2(i[4]);
    }
    if (v3[3])
    {
      result = (void *)v3[2];
      if (result)
      {
        do
        {
          v5 = (void *)*result;
          operator delete(result);
          result = v5;
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

void _catalog_procinfo_free(unsigned int **a1)
{
  v2 = (void (*)(void))MEMORY[0x1E4F14838];
  hashtable_destroy(a1[7], MEMORY[0x1E4F14838]);
  hashtable_destroy(a1[8], v2);
  free(a1);
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
        uint64_t v6 = *(void **)(*((void *)a1 + 2) + 8 * i);
        if (v6)
        {
          do
          {
            v7 = (void *)*v6;
            if (a2) {
              a2(v6[2]);
            }
            free(v6);
            --a1[1];
            uint64_t v6 = v7;
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

unint64_t os_log_fmt_compose(size_t a1, char *__s, uint64_t a3, unsigned int a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, int a8, uint64_t a9, unsigned __int16 a10, uint64_t a11)
{
  v129[2] = *MEMORY[0x1E4F143B8];
  unsigned int v111 = (*a6 >> 5) & 3;
  v122 = a6 + 2;
  unsigned __int16 v121 = a6[1];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  while (1)
  {
    unint64_t result = strcspn(__s, "%");
    unint64_t v17 = result;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v18 = *(unsigned int *)(a1 + 8);
      if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v18 - 1))
      {
        unint64_t result = os_trace_blob_add_slow(a1, __s, result);
      }
      else
      {
        unint64_t result = (unint64_t)memcpy((void *)(*(void *)a1 + v18), __s, result);
        unsigned int v19 = *(_DWORD *)(a1 + 8) + v17;
        *(_DWORD *)(a1 + 8) = v19;
        if (!*(unsigned char *)(a1 + 22)) {
          *(unsigned char *)(*(void *)a1 + v19) = 0;
        }
      }
    }
    v20 = &__s[v17];
    if (!__s[v17]) {
      break;
    }
    unint64_t result = (unint64_t)os_log_fmt_delimit(&__s[v17], a3, (uint64_t)&v117);
    if (result)
    {
      if (BYTE8(v117)) {
        return _os_log_fmt_decode_give_up(a1, v117, WORD6(v117), v21, v22, v23, v24, v25);
      }
      unint64_t v26 = result;
      os_log_fmt_read_aster_if_necessary((uint64_t)&v117, &v121, &v122);
      v116 = 0;
      unsigned __int16 v115 = 0;
      unsigned __int16 v28 = v121;
      if (v121)
      {
        v29 = v122;
        unsigned __int16 v28 = --v121;
        v122 += v122[1] + 2;
      }
      else
      {
        v29 = 0;
      }
      BOOL v114 = 0;
      uint64_t data = os_log_fmt_get_data((uint64_t)&v117, v111, a4, v29, v28, a5, (unint64_t *)&v116, &v115, v27, &v114, a7, a8, a9, a10);
      switch((int)data)
      {
        case 0:
          if ((BYTE8(v117) & 0x40) == 0) {
            goto LABEL_21;
          }
          BOOL v48 = v114;
          if ((BYTE8(v117) & 0x80) != 0)
          {
            if (_os_log_fmt_builtin_annotated(a1, a5, (uint64_t)&v117, (uint64_t)v29, (uint64_t)v116, v115, v114)) {
              goto LABEL_107;
            }
LABEL_21:
            if ((BYTE8(v117) & 0x10) != 0) {
              _os_log_fmt_compose_scalar(a1, (uint64_t)&v117, a5, v116, v115);
            }
            else {
              _os_log_fmt_compose_data(a1, (uint64_t)&v117, v29, (const char *)v116, v115, v114);
            }
            goto LABEL_107;
          }
          v110 = v116;
          unsigned int v109 = v115;
          v49 = (const char *)v119;
          size_t v50 = HIWORD(v117);
          if (!ctf_is_type((const char *)v119, HIWORD(v117)))
          {
            if (_os_log_fmt_plugin_annotated(a1, a5, (uint64_t)&v117, v29, v110, v109, v48)) {
              goto LABEL_107;
            }
            goto LABEL_21;
          }
          if (!a11 || v48) {
            goto LABEL_21;
          }
          __source = (char *)*((void *)&v119 + 1);
          unint64_t v51 = (unsigned __int16)v118;
          if (!ctf_is_type(v49, v50))
          {
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_128:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_129:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_130:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_131:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_132:
            _os_assert_log();
            _os_crash();
            __break(1u);
          }
          int v52 = *v49;
          if (v52 > 115)
          {
            if (v52 == 117)
            {
LABEL_60:
              if (v50 >= 0xFE) {
                goto LABEL_130;
              }
              strncpy(__dst, v49, v50);
              __dst[v50] = 32;
              v56 = &__dst[v50 + 1];
              if (254 - v50 >= v51 + 1) {
                size_t v55 = v51 + 1;
              }
              else {
                size_t v55 = 254 - v50;
              }
            }
            else
            {
              if (v52 != 116) {
                goto LABEL_65;
              }
              if (strncmp(v49, "type", 4uLL)) {
                goto LABEL_131;
              }
              uint64_t v54 = 254;
              if (v51 < 0xFE) {
                uint64_t v54 = v51;
              }
              size_t v55 = v54 + 1;
              v56 = __dst;
            }
            strlcpy(v56, __source, v55);
            goto LABEL_65;
          }
          if (v52 == 101 || v52 == 115) {
            goto LABEL_60;
          }
LABEL_65:
          uint64_t v57 = a11;
          if (*(void *)(a11 + 32)) {
            goto LABEL_128;
          }
          __sa = 0;
          uint64_t p_sa = (uint64_t)&__sa;
          uint64_t v125 = 0x2000000000;
          uint64_t v126 = 0;
          if ((((*(_WORD *)(a11 + 26) & 0xE) - 4) & 0xFFFFFFF7) != 0)
          {
            v129[0] = 0;
            int v58 = *(_DWORD *)(a11 + 16);
            uint64_t v59 = *(void *)(a11 + 8);
            if (v58) {
              v60 = (unsigned int *)uuidpath_map_header_fd(v58, v59, v129);
            }
            else {
              v60 = uuidpath_map_header(0, v59, v129);
            }
            v69 = v60;
            if (v60)
            {
              uint64_t v70 = v60[3];
              uint64_t v71 = *(void *)(p_sa + 24);
              int v107 = a8;
              uint64_t v106 = a5;
              if (v70 && !v71)
              {
                uint64_t v72 = 0;
                v73 = (unsigned __int16 *)&v69[2 * v70 + 4];
                v74 = v69 + 5;
                v75 = v69 + 5;
                while (1)
                {
                  unsigned int v76 = *v75;
                  v75 += 2;
                  v77 = v69;
                  uint64_t v71 = _ctf_open_buffer(v73, v76, v61, v62, v63, v64, v65, v66);
                  v69 = v77;
                  *(void *)(p_sa + 24) = v71;
                  if (++v72 >= (unint64_t)v77[3]) {
                    break;
                  }
                  v73 = (unsigned __int16 *)((char *)v73 + *v74);
                  v74 = v75;
                  if (v71) {
                    goto LABEL_83;
                  }
                }
              }
              if (v71)
              {
LABEL_83:
                size_t v78 = v129[0];
                uint64_t v57 = a11;
                *(void *)(a11 + 40) = v69;
                *(void *)(a11 + 48) = v78;
                a8 = v107;
              }
              else
              {
                munmap(v69, v129[0]);
                a8 = v107;
                uint64_t v57 = a11;
              }
              a5 = v106;
            }
          }
          else
          {
            v67 = *(__n128 **)a11;
            if (*(void *)a11)
            {
              uint64_t v68 = *(unsigned int *)(a11 + 16);
            }
            else
            {
              v129[1] = 0;
              v129[0] = 0;
              if ((_dyld_get_shared_cache_uuid() & 1) == 0) {
                goto LABEL_132;
              }
              v67 = (__n128 *)v129;
              uint64_t v68 = 0xFFFFFFFFLL;
            }
            dsc_map_impl = _os_trace_uuiddb_get_dsc_map_impl(v68, 0, v67, 1);
            if (dsc_map_impl)
            {
              v80 = *(void **)(a11 + 8);
              __src[0] = MEMORY[0x1E4F143A8];
              __src[1] = 0x40000000;
              __src[2] = __ctf_metadata_open_ctf_block_invoke;
              __src[3] = &unk_1E5A42B90;
              __src[4] = &__sa;
              _os_trace_uuiddb_dsc_foreach_range_with_uuid((uint64_t)dsc_map_impl, v80, (uint64_t)__src);
            }
          }
          uint64_t v81 = p_sa;
          *(void *)(v57 + 32) = *(void *)(p_sa + 24);
          v82 = *(const char ***)(v81 + 24);
          _Block_object_dispose(&__sa, 8);
          if (!v82) {
            goto LABEL_21;
          }
          v129[0] = 0;
          if ((BYTE8(v117) & 0x10) != 0)
          {
            v129[0] = os_log_fmt_read_scalar((uint64_t)&v117, v110, v109);
            v110 = (unsigned __int8 *)v129;
          }
          uint64_t v125 = 0;
          __sa = (char *)__src;
          uint64_t p_sa = 0x40000000000;
          uint64_t v83 = ctf_lookup_by_name(v82, __dst);
          if (v83 == -1 || !ctf_type_parse((uint64_t)v82, v83, (uint64_t)&__sa, (uint64_t)v110, v109))
          {
            char v95 = 0;
          }
          else
          {
            unint64_t v91 = strlen(__sa);
            if ((*(_WORD *)(a1 + 20) & 2) == 0)
            {
              int v92 = v91;
              uint64_t v93 = *(unsigned int *)(a1 + 8);
              if (v91 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v93 - 1))
              {
                os_trace_blob_add_slow(a1, __sa, v91);
              }
              else
              {
                memcpy((void *)(*(void *)a1 + v93), __sa, v91);
                unsigned int v94 = *(_DWORD *)(a1 + 8) + v92;
                *(_DWORD *)(a1 + 8) = v94;
                if (!*(unsigned char *)(a1 + 22)) {
                  *(unsigned char *)(*(void *)a1 + v94) = 0;
                }
              }
            }
            char v95 = 1;
          }
          if ((v125 & 0x100000000) != 0)
          {
            v96 = __sa;
            __sa = (char *)3954044928;
            WORD2(v125) = 0;
            free(v96);
          }
          uint64_t v97 = *(void *)(a11 + 32);
          if (!v97) {
            goto LABEL_129;
          }
          ctf_close(v97, v84, v85, v86, v87, v88, v89, v90);
          v98 = *(void **)(a11 + 40);
          if (v98) {
            munmap(v98, *(void *)(a11 + 48));
          }
          *(void *)(a11 + 32) = 0;
          if ((v95 & 1) == 0) {
            goto LABEL_21;
          }
LABEL_107:
          __s = &v20[v26];
          break;
        case 5:
          v42 = v116;
          uint64_t v43 = v115;
          BOOL v44 = v114;
          os_trace_blob_addf(a1, "<mask.%.*s: ", v34, data, v35, v36, v37, v38, SBYTE2(v118));
          if (v43 || v44)
          {
            os_trace_blob_add_base64(a1, (uint64_t)v42, v43);
          }
          else if ((*(_WORD *)(a1 + 20) & 2) == 0)
          {
            uint64_t v45 = *(unsigned int *)(a1 + 8);
            if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v45 - 1) <= 5)
            {
              os_trace_blob_add_slow(a1, "(null)", 6uLL);
            }
            else
            {
              uint64_t v46 = *(void *)a1 + v45;
              *(_WORD *)(v46 + 4) = 10604;
              *(_DWORD *)uint64_t v46 = 1819635240;
              unsigned int v47 = *(_DWORD *)(a1 + 8) + 6;
              *(_DWORD *)(a1 + 8) = v47;
              if (!*(unsigned char *)(a1 + 22)) {
                *(unsigned char *)(*(void *)a1 + v47) = 0;
              }
            }
          }
          if ((*(_WORD *)(a1 + 20) & 2) == 0)
          {
            uint64_t v53 = *(unsigned int *)(a1 + 8);
            if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == v53)
            {
              uint64_t v99 = a1;
              v100 = ">";
              size_t v101 = 1;
LABEL_113:
              os_trace_blob_add_slow(v99, v100, v101);
            }
            else
            {
              *(unsigned char *)(*(void *)a1 + v53) = 62;
              unsigned int v41 = *(_DWORD *)(a1 + 8) + 1;
LABEL_46:
              *(_DWORD *)(a1 + 8) = v41;
              if (!*(unsigned char *)(a1 + 22)) {
                *(unsigned char *)(*(void *)a1 + v41) = 0;
              }
            }
          }
          goto LABEL_107;
        case 6:
        case 7:
          _os_log_fmt_compose_masked_partial_redacted(a1, v116, v115, v114, v35, v36, v37, v38);
          goto LABEL_107;
        default:
          switch((int)data)
          {
            case 1:
              if ((*(_WORD *)(a1 + 20) & 2) == 0)
              {
                uint64_t v39 = *(unsigned int *)(a1 + 8);
                if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v39 - 1) > 8)
                {
                  uint64_t v40 = *(void *)a1 + v39;
                  *(void *)uint64_t v40 = *(void *)"<private>";
                  *(unsigned char *)(v40 + 8) = 62;
                  unsigned int v41 = *(_DWORD *)(a1 + 8) + 9;
                  goto LABEL_46;
                }
                uint64_t v99 = a1;
                v100 = "<private>";
                size_t v101 = 9;
                goto LABEL_113;
              }
              break;
            case 2:
              _os_log_fmt_decode_error(a1);
              break;
            case 3:
              _os_log_fmt_decode_cmd_mismatch(a1, v117, WORD6(v117), v29, v115, v115, v37, v38);
              break;
            case 4:
              _os_log_fmt_decode_bad_range(a1, v117, WORD6(v117), *((unsigned __int16 *)v29 + 1), *((unsigned __int16 *)v29 + 2), v115, v37, v38);
              break;
            case 8:
            case 9:
            case 10:
              _os_log_fmt_decode_masked_unknown(a1, SBYTE2(v118), v120, data, v35, v115, v37, v38);
              break;
            default:
              goto LABEL_107;
          }
          goto LABEL_107;
      }
    }
    else
    {
      char v30 = v20[1];
      if (!v30) {
        break;
      }
      LOBYTE(__src[0]) = v20[1];
      if ((*(unsigned char *)(a1 + 20) & 2) == 0)
      {
        uint64_t v31 = *(unsigned int *)(a1 + 8);
        if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == v31)
        {
          os_trace_blob_add_slow(a1, __src, 1uLL);
        }
        else
        {
          *(unsigned char *)(*(void *)a1 + v31) = v30;
          unsigned int v32 = *(_DWORD *)(a1 + 8) + 1;
          *(_DWORD *)(a1 + 8) = v32;
          if (!*(unsigned char *)(a1 + 22)) {
            *(unsigned char *)(*(void *)a1 + v32) = 0;
          }
        }
      }
      __s = v20 + 2;
    }
  }
  uint64_t v102 = *(unsigned int *)(a1 + 8) - 1;
  uint64_t v103 = MEMORY[0x1E4F14390];
  while (v102 != -1)
  {
    unsigned int v104 = *(char *)(*(void *)a1 + v102);
    if ((v104 & 0x80000000) != 0) {
      unint64_t result = __maskrune(v104, 0x4000uLL);
    }
    else {
      unint64_t result = *(_DWORD *)(v103 + 4 * v104 + 60) & 0x4000;
    }
    --v102;
    if (!result)
    {
      unsigned int v105 = v102 + 2;
      goto LABEL_123;
    }
  }
  unsigned int v105 = 0;
LABEL_123:
  *(_DWORD *)(a1 + 8) = v105;
  if (!*(unsigned char *)(a1 + 22)) {
    *(unsigned char *)(*(void *)a1 + v105) = 0;
  }
  return result;
}

uint64_t os_log_fmt_read_aster_if_necessary(uint64_t result, _WORD *a2, unsigned __int8 **a3)
{
  __int16 v3 = *(_WORD *)(result + 8);
  if ((v3 & 2) == 0)
  {
LABEL_10:
    if ((v3 & 8) == 0) {
      return result;
    }
    goto LABEL_14;
  }
  if (!*a2)
  {
    uint64_t v6 = (_DWORD *)(result + 20);
    goto LABEL_13;
  }
  v4 = *a3;
  --*a2;
  v5 = v4 + 2;
  *a3 = &v4[v4[1] + 2];
  uint64_t v6 = (_DWORD *)(result + 20);
  if (v4[1] == 4)
  {
    unsigned int v7 = *v4;
    if (v7 < 0x10 || (v7 & 0xF0) == 16)
    {
      *uint64_t v6 = *v5;
      goto LABEL_10;
    }
  }
LABEL_13:
  *uint64_t v6 = 0;
  if ((v3 & 8) == 0) {
    return result;
  }
LABEL_14:
  if ((v3 & 4) != 0 || (v3 & 0x10) == 0 && *(unsigned char *)(result + 10) != 18)
  {
    if (*a2)
    {
      v10 = *a3;
      --*a2;
      v11 = (int *)(v10 + 2);
      *a3 = &v10[v10[1] + 2];
      v12 = (int *)(result + 24);
      if (v10[1] == 4)
      {
        unsigned int v13 = *v10;
        if (v13 < 0x10 || (v13 & 0xF0) == 16)
        {
          int v15 = *v11;
LABEL_31:
          int *v12 = v15;
          return result;
        }
      }
    }
    else
    {
      v12 = (int *)(result + 24);
    }
    int v15 = -1;
    goto LABEL_31;
  }
  if (*a2)
  {
    v9 = *a3;
    if ((**a3 & 0xF0) == 0x10)
    {
      --*a2;
      *a3 = &v9[v9[1] + 2];
    }
  }
  *(_WORD *)(result + 8) = v3 & 0xFFF7;
  return result;
}

uint64_t os_log_fmt_get_data(uint64_t result, unsigned int a2, unsigned int a3, unsigned __int8 *a4, int a5, unsigned __int16 a6, unint64_t *a7, _WORD *a8, int8x8_t a9, BOOL *a10, uint64_t a11, unsigned __int16 a12, uint64_t a13, unsigned __int16 a14)
{
  if (!a4) {
    goto LABEL_52;
  }
  int v14 = *a4 & 0xF0;
  if (v14 == 224)
  {
    uint64_t v15 = *(void *)(result + 56);
    if (v15 > 0x656D616E6C69616CLL)
    {
      if (v15 > 0x6F6363616C69616CLL)
      {
        if (v15 == 0x6F6363616C69616DLL || v15 == 0x7075626D6C69616DLL) {
          goto LABEL_30;
        }
        uint64_t v16 = 0x726464616C69616DLL;
      }
      else
      {
        if (v15 == 0x656D616E6C69616DLL || v15 == 0x6A6275736C69616DLL) {
          goto LABEL_30;
        }
        uint64_t v16 = 0x6D6D75736C69616DLL;
      }
    }
    else
    {
      if (v15 <= 0x786F626C69616CLL)
      {
        if (v15)
        {
          if (v15 != 1752392040)
          {
            uint64_t v16 = 0x68736168766564;
            goto LABEL_29;
          }
LABEL_30:
          LOBYTE(v20) = 8;
          goto LABEL_69;
        }
LABEL_68:
        LOBYTE(v20) = 3;
        goto LABEL_69;
      }
      if (v15 == 0x786F626C69616DLL || v15 == 0x35646D6E69616C70) {
        goto LABEL_30;
      }
      uint64_t v16 = 0x617474616C69616DLL;
    }
LABEL_29:
    if (v15 != v16)
    {
      LOBYTE(v20) = 10;
      goto LABEL_69;
    }
    goto LABEL_30;
  }
  if ((*a4 & 1) == 0)
  {
    unsigned int v18 = a12;
    goto LABEL_10;
  }
  uint64_t v21 = *a4 & 7;
  if ((0xD8uLL >> v21)) {
    goto LABEL_68;
  }
  unsigned int v22 = privacy_flags2opt[v21];
  if (v22 > a3)
  {
LABEL_22:
    LOBYTE(v20) = 1;
    goto LABEL_69;
  }
  a11 = a13;
  unsigned int v18 = a14;
  if (a2 - 1 >= 3)
  {
    if (a2) {
      goto LABEL_10;
    }
    if (a13)
    {
      BOOL v19 = 0;
      goto LABEL_35;
    }
    goto LABEL_22;
  }
  if (v14 != 128 && v22 > a2) {
    goto LABEL_22;
  }
LABEL_10:
  BOOL v19 = a11 == 0;
  if (!a11 && v18)
  {
LABEL_12:
    LOBYTE(v20) = 4;
LABEL_69:
    *a7 = 0;
    *a8 = 0;
    return v20;
  }
LABEL_35:
  *a10 = 0;
  unsigned int v23 = *a4;
  if ((v23 & 0xFFFFFFF1) != 0)
  {
    if ((v23 & 0xFFFFFFE1) == 0 || a4[1] != 4) {
      goto LABEL_68;
    }
    uint64_t v24 = *((unsigned __int16 *)a4 + 1);
    if (v24 > v18) {
      goto LABEL_12;
    }
    int v25 = v18 - v24;
    __int16 v26 = *((_WORD *)a4 + 2);
    if (v25 < (v26 & 0x7FFF)) {
      goto LABEL_12;
    }
    int v27 = v26;
    if (v23 <= 0xF && v26 < 0)
    {
LABEL_52:
      LOBYTE(v20) = 2;
      goto LABEL_69;
    }
    unint64_t v20 = a11 + v24;
    if (v19) {
      unint64_t v20 = 0;
    }
    unsigned int v28 = (v26 >> 15) & 1;
    *a10 = v26 < 0;
    unsigned int v29 = *((_WORD *)a4 + 2) & 0x7FFF;
    if (!a5 && v27 < 0 && (*((_WORD *)a4 + 2) & 0x7FFF) == 0)
    {
      if (v25 < 0x8000)
      {
        unsigned int v29 = 0;
      }
      else
      {
        unsigned int v28 = 0;
        *a10 = 0;
        unsigned int v29 = 0x8000;
      }
    }
    if (*a4 >= 0xF0u)
    {
      uint64_t v31 = *(void *)(result + 56);
      if (v31 > 0x656D616E6C69616CLL)
      {
        if (v31 <= 0x6F6363616C69616CLL)
        {
          if (v31 == 0x656D616E6C69616DLL || v31 == 0x6A6275736C69616DLL) {
            goto LABEL_93;
          }
          uint64_t v33 = 0x6D6D75736C69616DLL;
          goto LABEL_86;
        }
        if (v31 != 0x6F6363616C69616DLL)
        {
          if (v31 == 0x726464616C69616DLL)
          {
            *a7 = v20;
            *a8 = v29;
            LOBYTE(v20) = 7;
            return v20;
          }
          uint64_t v32 = 0x7075626D6C69616DLL;
LABEL_91:
          if (v31 == v32) {
            goto LABEL_92;
          }
LABEL_105:
          LOBYTE(v20) = 9;
          goto LABEL_69;
        }
      }
      else
      {
        if (v31 <= 0x786F626C69616CLL)
        {
          if (!v31) {
            goto LABEL_68;
          }
          if (v31 != 1752392040)
          {
            uint64_t v32 = 0x68736168766564;
            goto LABEL_91;
          }
LABEL_92:
          *a7 = v20;
          *a8 = v29;
          LOBYTE(v20) = 5;
          return v20;
        }
        if (v31 != 0x786F626C69616DLL)
        {
          if (v31 == 0x35646D6E69616C70) {
            goto LABEL_92;
          }
          uint64_t v33 = 0x617474616C69616DLL;
LABEL_86:
          if (v31 != v33) {
            goto LABEL_105;
          }
        }
      }
LABEL_93:
      *a7 = v20;
      *a8 = v29;
      LOBYTE(v20) = 6;
      return v20;
    }
  }
  else
  {
    unint64_t v20 = (unint64_t)(a4 + 2);
    unsigned int v29 = a4[1];
    unsigned int v28 = a4[1] == 0;
    *a10 = v28;
  }
  if (v28 && *a4 < 0x10u) {
    goto LABEL_52;
  }
  *a7 = v20;
  *a8 = v29;
  int v30 = *a4;
  if ((v30 & 0xF0) != 0x10 && *a4 < 0x10u == (*(_WORD *)(result + 8) & 0x10) >> 4)
  {
    if ((*(_WORD *)(result + 8) & 0x10) == 0 || (a9.i32[0] = v29, vaddlv_u8((uint8x8_t)vcnt_s8(a9)) == 1))
    {
      switch(*(unsigned char *)(result + 10))
      {
        case 1:
        case 2:
          if (v29 > 4) {
            break;
          }
          goto LABEL_103;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
          if (v29 >= 5) {
            break;
          }
          goto LABEL_103;
        case 9:
        case 0xA:
          if (v29 > a6) {
            break;
          }
          goto LABEL_103;
        case 0xB:
        case 0xC:
          if (v29 >= 9) {
            break;
          }
          goto LABEL_103;
        case 0xD:
          if (v29 != a6) {
            break;
          }
          goto LABEL_103;
        case 0xE:
        case 0xF:
          if (v29 != 8) {
            break;
          }
          goto LABEL_103;
        case 0x10:
          if ((v30 & 0xF0) != 0x20) {
            break;
          }
          goto LABEL_103;
        case 0x11:
          if ((v30 & 0xF0) != 0x50) {
            break;
          }
          goto LABEL_103;
        case 0x12:
          unint64_t v20 = 0x30303000000uLL >> (8 * ((v30 >> 4) - 2));
          if ((v30 >> 4) - 2 >= 7) {
            LOBYTE(v20) = 3;
          }
          return v20;
        case 0x13:
          if ((v30 & 0xF0) != 0x30) {
            break;
          }
LABEL_103:
          LOBYTE(v20) = 0;
          return v20;
        default:
          qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
          qword_1E953C318 = v30 & 0xFFFFFFF0;
          __break(1u);
          return result;
      }
    }
  }
  LOBYTE(v20) = 3;
  return v20;
}

char *os_log_fmt_delimit(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t result = a1 + 1;
  uint64_t v5 = v6;
  if (v6 == 37)
  {
    *(void *)(a3 + 56) = 0;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 8) = 0u;
    *(void *)a3 = a1;
    if (a1[1] != 123)
    {
      unsigned int v11 = 0;
LABEL_49:
      unsigned int v24 = 0;
      while (1)
      {
        while (1)
        {
          int v26 = *result++;
          int v25 = v26;
LABEL_51:
          if ((v25 - 49) >= 9) {
            break;
          }
          do
          {
            int v27 = *result++;
            int v25 = v27;
          }
          while ((v27 - 48) < 0xA);
          if (v25 != 36) {
            goto LABEL_51;
          }
          v11 |= 1u;
          *(_WORD *)(a3 + 8) = v11;
        }
        switch(v25)
        {
          case ' ':
          case '#':
          case '\'':
          case '+':
          case '-':
          case '0':
            continue;
          case '*':
            if ((v11 & 8) != 0)
            {
              v11 |= 1u;
              *(_WORD *)(a3 + 8) = v11;
            }
            uint64_t v33 = result;
            do
            {
              int v35 = *v33++;
              char v34 = v35;
            }
            while ((v35 - 48) < 0xA);
            if (v34 == 36) {
              v11 |= 1u;
            }
            else {
              v11 |= (v11 >> 1) & 1 | 2;
            }
            if (v34 == 36) {
              unint64_t result = v33;
            }
            *(_WORD *)(a3 + 8) = v11;
            continue;
          case '.':
            int v28 = *result++;
            int v25 = v28;
            if (v28 != 42)
            {
              *(_DWORD *)(a3 + 24) = 0;
              int v29 = v25 - 48;
              if ((v25 - 48) <= 9)
              {
                int v30 = 0;
                do
                {
                  int v30 = v29 + 10 * v30;
                  *(_DWORD *)(a3 + 24) = v30;
                  int v31 = *result++;
                  int v25 = v31;
                  int v29 = v31 - 48;
                }
                while ((v31 - 48) < 0xA);
              }
              int v32 = (v11 >> 3) & 1 | v11;
              unsigned int v11 = v32 | 8;
              *(_WORD *)(a3 + 8) = v32 | 8;
              goto LABEL_51;
            }
            uint64_t v36 = result;
            do
            {
              int v38 = *v36++;
              char v37 = v38;
            }
            while ((v38 - 48) < 0xA);
            if (v37 == 36)
            {
              v11 |= 1u;
              *(_WORD *)(a3 + 8) = v11;
              unint64_t result = v36;
            }
            else
            {
              int v39 = v11 | ((v11 & 0xC) != 0);
              unsigned int v11 = v39 | 0xC;
              *(_WORD *)(a3 + 8) = v39 | 0xC;
            }
            break;
          case '@':
            char v45 = 18;
            goto LABEL_134;
          case 'A':
          case 'E':
          case 'F':
          case 'G':
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            if ((v24 & 8) != 0) {
              char v40 = 15;
            }
            else {
              char v40 = 14;
            }
            goto LABEL_136;
          case 'C':
            LOBYTE(v24) = 16;
            goto LABEL_111;
          case 'D':
            LOWORD(v24) = v24 | 0x10;
            goto LABEL_115;
          case 'L':
            v24 |= 8u;
            continue;
          case 'O':
          case 'U':
            LOWORD(v24) = v24 | 0x10;
            goto LABEL_91;
          case 'P':
            if (a2 != 2) {
              return 0;
            }
            if ((v11 & 8) == 0) {
              *(_WORD *)(a3 + 8) = v11 | 1;
            }
            char v45 = 19;
            goto LABEL_134;
          case 'S':
            LOBYTE(v24) = 16;
            goto LABEL_131;
          case 'X':
          case 'o':
          case 'u':
          case 'x':
LABEL_91:
            if ((v24 & 0x2000) != 0) {
              char v41 = 2;
            }
            else {
              char v41 = 6;
            }
            if ((v24 & 0x40) != 0) {
              char v42 = 4;
            }
            else {
              char v42 = v41;
            }
            if ((v24 & 0x10) != 0) {
              char v43 = 10;
            }
            else {
              char v43 = v42;
            }
            if ((v24 & 0x20) != 0) {
              char v44 = 12;
            }
            else {
              char v44 = v43;
            }
            if ((v24 & 0xC00) != 0) {
              char v44 = 10;
            }
            if ((v24 & 0x1000) != 0) {
              char v45 = 12;
            }
            else {
              char v45 = v44;
            }
            *(_WORD *)(a3 + 8) = v11 | 0x30;
            goto LABEL_134;
          case 'c':
LABEL_111:
            if ((v24 & 0x10) != 0) {
              char v40 = 7;
            }
            else {
              char v40 = 5;
            }
            goto LABEL_136;
          case 'd':
          case 'i':
LABEL_115:
            if ((v24 & 0x1000) != 0) {
              goto LABEL_123;
            }
            if ((v24 & 0x400) != 0 || (v24 & 0x800) != 0) {
              goto LABEL_124;
            }
            if ((v24 & 0x20) != 0)
            {
LABEL_123:
              char v40 = 11;
            }
            else if ((v24 & 0x10) != 0)
            {
LABEL_124:
              char v40 = 9;
            }
            else if ((v24 & 0x40) != 0)
            {
              char v40 = 3;
            }
            else if ((v24 & 0x2000) != 0)
            {
              char v40 = 1;
            }
            else
            {
              char v40 = 5;
            }
LABEL_136:
            *(unsigned char *)(a3 + 10) = v40;
            __int16 v46 = v11 | 0x10;
LABEL_137:
            *(_WORD *)(a3 + 8) = v46;
LABEL_138:
            *(_WORD *)(a3 + 12) = (_WORD)result - (_WORD)a1;
            return (char *)(unsigned __int16)((_WORD)result - (_WORD)a1);
          case 'h':
            if ((v24 & 0x40) != 0) {
              unsigned int v24 = v24 & 0xFFFFDFBF | 0x2000;
            }
            else {
              v24 |= 0x40u;
            }
            continue;
          case 'j':
            v24 |= 0x1000u;
            continue;
          case 'l':
            if ((v24 & 0x10) != 0) {
              unsigned int v24 = v24 & 0xFFFFFFCF | 0x20;
            }
            else {
              v24 |= 0x10u;
            }
            continue;
          case 'm':
            char v40 = 8;
            goto LABEL_136;
          case 'n':
            __int16 v46 = v11 | 1;
            goto LABEL_137;
          case 'p':
            *(unsigned char *)(a3 + 10) = 13;
            __int16 v46 = v11 | 0x30;
            goto LABEL_137;
          case 'q':
            v24 |= 0x20u;
            continue;
          case 's':
LABEL_131:
            if ((v24 & 0x10) != 0) {
              char v45 = 17;
            }
            else {
              char v45 = 16;
            }
LABEL_134:
            *(unsigned char *)(a3 + 10) = v45;
            goto LABEL_138;
          case 't':
            v24 |= 0x800u;
            continue;
          case 'z':
            v24 |= 0x400u;
            continue;
          default:
            return 0;
        }
      }
    }
    if (a2 == 2)
    {
      unint64_t result = strchr(result, 125);
      if (result)
      {
        v9 = result;
        v10 = a1 + 2;
        if (a1[2] == 125)
        {
          unsigned int v11 = 0;
LABEL_48:
          unint64_t result = v9 + 1;
          goto LABEL_49;
        }
        unsigned int v11 = 0;
        do
        {
          v12 = (char *)&v10[strspn(v10, ", ")];
          size_t v13 = strcspn(v12, ",}");
          switch(v13)
          {
            case 0uLL:
              goto LABEL_48;
            case 6uLL:
              if (*(_DWORD *)v12 != 1818391920 || *((_WORD *)v12 + 2) != 25449) {
                goto LABEL_26;
              }
              v11 |= 0x100u;
              goto LABEL_38;
            case 7uLL:
              if (*(_DWORD *)v12 != 1986622064 || *(_DWORD *)(v12 + 3) != 1702125942) {
                goto LABEL_26;
              }
              v11 |= 0x200u;
              goto LABEL_38;
            case 9uLL:
              if (*(void *)v12 != 0x76697469736E6573 || v12[8] != 101) {
                goto LABEL_26;
              }
              v11 |= 0x400u;
LABEL_38:
              *(_WORD *)(a3 + 8) = v11;
              break;
            default:
LABEL_26:
              if (!memchr(v12, 61, v13))
              {
                if (!strncmp(v12, "mask.", 5uLL))
                {
                  if (v13 - 6 <= 7)
                  {
                    uint64_t v19 = 0;
                    uint64_t v20 = 0;
                    v11 |= 0x800u;
                    *(_WORD *)(a3 + 8) = v11;
                    uint64_t v21 = v12 + 5;
                    *(void *)(a3 + 48) = v12 + 5;
                    *(_WORD *)(a3 + 18) = v13 - 5;
                    do
                    {
                      uint64_t v22 = *v21++;
                      v20 |= v22 << v19;
                      v19 += 8;
                    }
                    while (8 * (unsigned __int16)(v13 - 5) != v19);
                    *(void *)(a3 + 56) = v20;
                  }
                }
                else
                {
                  int v17 = v11 | 0x40;
                  *(_WORD *)(a3 + 8) = v11 | 0x40;
                  if (!strncmp(v12, "builtin:", 8uLL))
                  {
                    v11 |= 0xC0u;
                    *(_WORD *)(a3 + 8) = v11;
                    *(_WORD *)(a3 + 14) = 7;
                    *(void *)(a3 + 32) = "builtin";
                    *(void *)(a3 + 40) = v12 + 8;
                    *(_WORD *)(a3 + 16) = v13 - 8;
                  }
                  else
                  {
                    unsigned int v18 = (char *)memchr(v12, 58, v13);
                    if (v18)
                    {
                      if ((v11 & 0x80) != 0)
                      {
                        v17 ^= 0x80u;
                        *(_WORD *)(a3 + 8) = v17;
                      }
                      *(_WORD *)(a3 + 14) = (_WORD)v18 - (_WORD)v12;
                      *(void *)(a3 + 32) = v12;
                      *(void *)(a3 + 40) = v18 + 1;
                      *(_WORD *)(a3 + 16) = (_WORD)v12 + v13 - ((_WORD)v18 + 1);
                      unsigned int v11 = v17;
                    }
                    else
                    {
                      v11 |= 0xC0u;
                      *(_WORD *)(a3 + 8) = v11;
                      *(_WORD *)(a3 + 14) = 7;
                      *(void *)(a3 + 32) = "builtin";
                      *(void *)(a3 + 40) = v12;
                      *(_WORD *)(a3 + 16) = v13;
                    }
                  }
                }
              }
              break;
          }
          v10 = &v12[v13];
        }
        while (*v10 != 125);
        if ((v11 & 0x400) != 0)
        {
          int v23 = 64767;
        }
        else
        {
          if ((v11 & 0x200) == 0) {
            goto LABEL_48;
          }
          int v23 = 65279;
        }
        v11 &= v23;
        *(_WORD *)(a3 + 8) = v11;
        goto LABEL_48;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: Should start with '%'";
    qword_1E953C318 = v5;
    __break(1u);
  }
  return result;
}

unint64_t _os_log_fmt_compose_scalar(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, int a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t scalar = os_log_fmt_read_scalar(a2, a4, a5);
  __int16 v9 = *(_WORD *)(a2 + 8);
  if ((v9 & 2) == 0)
  {
    unsigned int v10 = 0;
    if ((v9 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v31 = *(_DWORD *)(a2 + 20);
  unsigned int v10 = 1;
  if ((v9 & 4) != 0) {
LABEL_5:
  }
    *(&v31 + v10++) = *(_DWORD *)(a2 + 24);
LABEL_6:
  MEMORY[0x1F4188790]();
  v12 = (char *)&v31 - v11;
  unint64_t result = _os_log_fmt_compose_format_copy((unsigned char *)&v31 - v11, *(void **)a2, *(_WORD *)(a2 + 12));
  uint64_t v20 = *(unsigned __int8 *)(a2 + 10);
  switch(*(unsigned char *)(a2 + 10))
  {
    case 0:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
      qword_1E953C318 = v20;
      __break(1u);
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_7;
    case 8:
      int v25 = strerror(scalar);
      unint64_t result = strlen(v25);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        int v26 = result;
        uint64_t v27 = *(unsigned int *)(a1 + 8);
        if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
        {
          return os_trace_blob_add_slow(a1, v25, result);
        }
        else
        {
          unint64_t result = (unint64_t)memcpy((void *)(*(void *)a1 + v27), v25, result);
          unsigned int v28 = *(_DWORD *)(a1 + 8) + v26;
          *(_DWORD *)(a1 + 8) = v28;
          if (!*(unsigned char *)(a1 + 22)) {
            *(unsigned char *)(*(void *)a1 + v28) = 0;
          }
        }
      }
      return result;
    case 9:
    case 0xA:
    case 0xD:
      if (a3 == 8 || v20 == 13) {
        goto LABEL_34;
      }
      unsigned int v21 = result;
      uint64_t v22 = result;
      uint64_t v23 = result - 1;
      unsigned int v24 = v12[v23];
      if (a3 == 4)
      {
        if ((v24 & 0x80000000) != 0) {
          unint64_t result = __maskrune(v12[v23], 0x8000uLL);
        }
        else {
          unint64_t result = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v24 + 60) & 0x8000;
        }
        if (result) {
          unint64_t result = __tolower(v24);
        }
        else {
          v12[v21 - 2] = v24;
        }
        v12[v23] = result;
LABEL_7:
        if (v10 != 2)
        {
          if (v10 != 1)
          {
            if (v10) {
              return result;
            }
            return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, scalar);
          }
LABEL_38:
          HIWORD(v30) = HIWORD(scalar);
          return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, v31);
        }
      }
      else
      {
        if ((v24 & 0x80000000) != 0) {
          unint64_t result = __maskrune(v12[v23], 0x8000uLL);
        }
        else {
          unint64_t result = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v24 + 60) & 0x8000;
        }
        if (result)
        {
          v12[v21] = 108;
          unint64_t result = __tolower(v24);
          LOBYTE(v24) = result;
          uint64_t v22 = v21 + 1;
          unsigned int v29 = 2;
        }
        else
        {
          v12[v21 - 2] = 108;
          unsigned int v29 = 1;
        }
        v12[v23] = 108;
        v12[v22] = v24;
        v12[v29 + (unint64_t)v21] = 0;
LABEL_34:
        if (v10 != 2)
        {
          if (v10 != 1)
          {
            if (v10) {
              return result;
            }
            return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, scalar);
          }
          goto LABEL_38;
        }
      }
      return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, v31);
    case 0xB:
    case 0xC:
    case 0xE:
    case 0xF:
      goto LABEL_34;
    default:
      return result;
  }
}

uint64_t os_log_fmt_read_scalar(uint64_t a1, unsigned __int8 *a2, int a3)
{
  int v3 = *(unsigned __int8 *)(a1 + 10);
  if (v3 == 15 || v3 == 14) {
    return *(void *)a2;
  }
  if ((*(_WORD *)(a1 + 8) & 0x20) != 0)
  {
    switch(a3)
    {
      case 1:
        uint64_t result = *a2;
        break;
      case 2:
        uint64_t result = *(unsigned __int16 *)a2;
        break;
      case 4:
        uint64_t result = *(unsigned int *)a2;
        break;
      case 8:
        return *(void *)a2;
      default:
LABEL_14:
        uint64_t result = _os_crash();
        __break(1u);
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        uint64_t result = (char)*a2;
        break;
      case 2:
        uint64_t result = *(__int16 *)a2;
        break;
      case 4:
        uint64_t result = *(int *)a2;
        break;
      case 8:
        return *(void *)a2;
      default:
        goto LABEL_14;
    }
  }
  return result;
}

uint64_t os_trace_blob_addf(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*(unsigned char *)(a1 + 22))
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    return 0;
  }
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0;
  }
  int v12 = *(_DWORD *)(a1 + 8);
  int v11 = *(_DWORD *)(a1 + 12);
  *__error() = 0;
  uint64_t v13 = vsnprintf((char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), (v11 - v12), a2, &a9);
  if ((v13 & 0x80000000) != 0)
  {
    uint64_t v14 = 0;
    *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
  }
  else
  {
    uint64_t v14 = v13;
    uint64_t v15 = (v11 + ~v12);
    if (v13 > v15)
    {
      if (*(_DWORD *)(a1 + 12) < *(_DWORD *)(a1 + 16))
      {
        uint64_t v15 = os_trace_blob_grow(a1, v13);
        *__error() = 0;
        vsnprintf((char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), (v15 + 1), a2, &a9);
      }
      if (v14 > v15)
      {
        *(_WORD *)(a1 + 20) |= 2u;
        uint64_t v14 = v15;
      }
    }
    *(_DWORD *)(a1 + 8) += v14;
  }
  return v14;
}

uint64_t _os_log_fmt_compose_format_copy(unsigned char *a1, void *__s, unsigned __int16 a3)
{
  unsigned __int16 v3 = a3;
  size_t v6 = a3;
  unsigned int v7 = memchr(__s, 125, a3);
  if (v7)
  {
    v3 += (_WORD)__s - (_WORD)v7;
    size_t v6 = v3;
    memcpy(a1, v7, v3);
    *a1 = 37;
  }
  else
  {
    memcpy(a1, __s, v6);
  }
  a1[v6] = 0;
  return v3;
}

uint64_t catalog_chunk_parse_procinfo_subsystem(unsigned __int16 **a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  int v7 = a5;
  int v11 = a1;
  int v12 = *a1;
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
            int v26 = *v11;
            if (a2)
            {
              if (a2 < (unint64_t)v26 || a2 - (unint64_t)v26 < 4) {
                return 0;
              }
            }
            int *v11 = v26 + 2;
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
              int v31 = (void *)_os_trace_calloc();
              *(_WORD *)int v31 = *v26;
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
    int v35 = v11;
    do
    {
      uint64_t v18 = *v11;
      if (a2)
      {
        if (a2 < (unint64_t)v18 || a2 - (unint64_t)v18 < 6) {
          return 0;
        }
      }
      int *v11 = v18 + 3;
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
        int v11 = v35;
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
  int *v11 = (unsigned __int16 *)v33;
  return 1;
}

void *_os_trace_str_map_entry(void *result, char *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v2 = result;
    std::string::basic_string[abi:nn180100]<0>(__p, a2);
    unsigned __int16 v3 = std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>(v2, (uint64_t)__p);
    v4 = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      if (v4)
      {
LABEL_4:
        uint64_t result = v4 + 16;
        if ((char)v4[39] < 0) {
          return (void *)*result;
        }
        return result;
      }
    }
    else if (v3)
    {
      goto LABEL_4;
    }
    return 0;
  }
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>(void *a1, uint64_t a2)
{
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = (uint64_t *)a2;
  }
  else {
    uint64_t v5 = *(uint64_t **)a2;
  }
  if (v4 >= 0) {
    unint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    unint64_t v6 = *(void *)(a2 + 8);
  }
  unint64_t v7 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v5, v6);
  int8x8_t v8 = (int8x8_t)a1[1];
  if (!*(void *)&v8) {
    return 0;
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
  uint64_t v13 = *(unsigned __int8 ***)(*a1 + 8 * v12);
  if (!v13) {
    return 0;
  }
  for (unint64_t i = *v13; i; unint64_t i = *(unsigned __int8 **)i)
  {
    unint64_t v15 = *((void *)i + 1);
    if (v9 == v15)
    {
      if (std::equal_to<std::string>::operator()[abi:nn180100](i + 16, (unsigned __int8 *)a2)) {
        return i;
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
        return 0;
      }
    }
  }
  return i;
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
    size_t v50 = a1 + 4;
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

uint64_t hashtable_insert(int *a1, void *a2, uint64_t a3)
{
  unsigned int v6 = ((unsigned int (**)(void *))hash_fn_array)[*((unsigned __int8 *)a1 + 8)](a2);
  unsigned int v7 = *a1;
  if (!*((void *)a1 + 2)) {
    goto LABEL_8;
  }
  int v8 = (void *)(*((void *)a1 + 2)
                + 8
                * (((unsigned int (**)(void *))hash_fn_array)[*((unsigned __int8 *)a1 + 8)](a2) % *a1));
  int v9 = (uint64_t (*)(void, void *))hashkey_compare_array[*((unsigned __int8 *)a1 + 8)];
  while (1)
  {
    int v8 = (void *)*v8;
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

uint64_t hash_uint16(unsigned __int16 *a1)
{
  return *a1;
}

BOOL hashkey_compare_uint16(unsigned __int16 a1, unsigned __int16 *a2)
{
  return *a2 == a1;
}

uint64_t ___os_trace_formatters_list_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  char v4 = 0;
  uint64_t v5 = 0;
  char v6 = 1;
  do
  {
    char v7 = v6;
    if ((v4 & 1) != 0 || !*(unsigned char *)(v3 + 56))
    {
      size_t v8 = strlen((&plugin_dirs)[2 * v5]);
      int v9 = *(const char **)(a2 + 40);
      uint64_t result = strncmp(v9, (&plugin_dirs)[2 * v5], v8);
      if (!result)
      {
        uint64_t result = _os_trace_formatter_record(*(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 24), (char *)&v9[v8], v5, (uint64_t *)(*(void *)(*(void *)(v3 + 40) + 8) + 24), (void *)(*(void *)(*(void *)(v3 + 48) + 8) + 24));
        *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = result;
      }
    }
    char v6 = 0;
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while ((v7 & 1) != 0);
  return result;
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
    char v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    char v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

BOOL ctf_is_type(const char *a1, size_t a2)
{
  unint64_t v4 = 0;
  BOOL v5 = 1;
  do
  {
    if (strlen(BUILTIN_LIBRARY[v4]) == a2 && !strncmp(a1, BUILTIN_LIBRARY[v4], a2)) {
      break;
    }
    BOOL v5 = v4++ < 3;
  }
  while (v4 != 4);
  return v5;
}

unint64_t _os_log_fmt_plugin_annotated(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned int a6, char a7)
{
  v28[256] = *MEMORY[0x1E4F143B8];
  plugin = os_log_fmt_get_plugin(*(const char **)(a3 + 32), *(unsigned __int16 *)(a3 + 14));
  unint64_t v15 = (unint64_t)plugin;
  if (plugin)
  {
    if (plugin[3] && (id v16 = os_log_fmt_object_for_data(a3, *a4 >> 4, a5, a6, a2)) != 0)
    {
      uint64_t v17 = v16;
      uint64_t v27 = 1;
      BYTE4(v27) = a7;
      __strlcpy_chk();
      uint64_t v18 = (void *)(*(uint64_t (**)(void *, void *, uint64_t *))(v15 + 24))(v28, v17, &v27);
      uint64_t v19 = (void *)[v18 string];
      unint64_t v15 = v19 != 0;
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = (char *)[v20 _fastCStringContents:1];
        if (v21)
        {
          os_trace_blob_addns(a1, v21, 0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          unint64_t v22 = [v20 lengthOfBytesUsingEncoding:4];
          v28[0] = v22;
          unsigned int v23 = *(_DWORD *)(a1 + 8);
          unint64_t v24 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1;
          if (v22 > v24)
          {
            os_trace_blob_grow(a1, v22);
            unsigned int v23 = *(_DWORD *)(a1 + 8);
            unint64_t v24 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1;
            if (v22 > v24) {
              *(_WORD *)(a1 + 20) |= 2u;
            }
          }
          objc_msgSend(v20, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", *(void *)a1 + v23, v24, v28, 4, 1, 0, objc_msgSend(v20, "length"), 0);
          unsigned int v25 = *(_DWORD *)(a1 + 8) + LODWORD(v28[0]);
          *(_DWORD *)(a1 + 8) = v25;
          if (!*(unsigned char *)(a1 + 22)) {
            *(unsigned char *)(*(void *)a1 + v25) = 0;
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v15;
}

#error "1A1132C8C: call analysis failed (funcsize=18)"

id os_log_fmt_object_for_data(uint64_t a1, int a2, unsigned __int8 *a3, unsigned int a4, uint64_t a5)
{
  if (os_log_fmt_object_for_data_onceToken != -1) {
    dispatch_once(&os_log_fmt_object_for_data_onceToken, &__block_literal_global_1675);
  }
  if ((*(_WORD *)(a1 + 8) & 0x10) != 0) {
    uint64_t scalar = os_log_fmt_read_scalar(a1, a3, a4);
  }
  else {
    uint64_t scalar = 0;
  }
  switch(*(unsigned char *)(a1 + 10))
  {
    case 1:
      id v18 = objc_alloc((Class)os_log_fmt_object_for_data__NSNumber);
      return (id)[v18 initWithChar:(char)scalar];
    case 2:
      id v19 = objc_alloc((Class)os_log_fmt_object_for_data__NSNumber);
      return (id)[v19 initWithUnsignedChar:scalar];
    case 3:
      id v20 = objc_alloc((Class)os_log_fmt_object_for_data__NSNumber);
      return (id)[v20 initWithShort:(__int16)scalar];
    case 4:
      id v21 = objc_alloc((Class)os_log_fmt_object_for_data__NSNumber);
      return (id)[v21 initWithUnsignedShort:(unsigned __int16)scalar];
    case 5:
    case 7:
    case 8:
      goto LABEL_44;
    case 6:
      goto LABEL_23;
    case 9:
      if (a5 == 4)
      {
LABEL_44:
        id v23 = objc_alloc((Class)os_log_fmt_object_for_data__NSNumber);
        id result = (id)[v23 initWithInt:scalar];
      }
      else
      {
        if (a5 == 8) {
          goto LABEL_41;
        }
LABEL_47:
        id v24 = objc_alloc((Class)os_log_fmt_object_for_data__NSNumber);
        id result = (id)[v24 initWithLongLong:scalar];
      }
      break;
    case 0xA:
    case 0xD:
      if (a5 == 4)
      {
LABEL_23:
        id v17 = objc_alloc((Class)os_log_fmt_object_for_data__NSNumber);
        id result = (id)[v17 initWithUnsignedInt:scalar];
      }
      else if (a5 == 8)
      {
LABEL_41:
        id v22 = objc_alloc((Class)os_log_fmt_object_for_data__NSNumber);
        id result = (id)[v22 initWithLong:scalar];
      }
      else
      {
LABEL_13:
        id v13 = objc_alloc((Class)os_log_fmt_object_for_data__NSNumber);
        id result = (id)[v13 initWithUnsignedLongLong:scalar];
      }
      break;
    case 0xB:
      goto LABEL_47;
    case 0xC:
      goto LABEL_13;
    case 0xE:
    case 0xF:
      id v14 = objc_alloc((Class)os_log_fmt_object_for_data__NSNumber);
      return (id)[v14 initWithDouble:*(double *)&scalar];
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      if (a2 == 3)
      {
        id v11 = objc_alloc((Class)os_log_fmt_object_for_data__NSData);
        return (id)[v11 initWithBytes:a3 length:a4];
      }
      else
      {
        unint64_t v15 = (objc_class *)os_log_fmt_object_for_data__NSString;
        if (a4)
        {
          id v16 = objc_alloc((Class)os_log_fmt_object_for_data__NSString);
          return (id)[v16 initWithBytes:a3 length:a4 - 1 encoding:4];
        }
        else
        {
          return objc_alloc_init(v15);
        }
      }
    default:
      return 0;
  }
  return result;
}

void *os_log_fmt_get_plugin(const char *a1, size_t a2)
{
  if (_dyld_dlsym_blocked()) {
    return 0;
  }
  if (qword_1EB4FD188 != -1) {
    dispatch_once_f(&qword_1EB4FD188, 0, (dispatch_function_t)_os_trace_formatters_list);
  }
  unint64_t v4 = qword_1EB4FD180;
  if (!qword_1EB4FD180) {
    return 0;
  }
  unint64_t v5 = 0;
  uint64_t v6 = _formatters;
  while (1)
  {
    unint64_t v7 = (v4 + v5) >> 1;
    uint64_t v8 = *(const char **)(v6 + 40 * v7 + 8);
    int v9 = strncasecmp(a1, v8, a2);
    if (!v9) {
      break;
    }
LABEL_9:
    if (v9 < 0) {
      unint64_t v4 = (v4 + v5) >> 1;
    }
    else {
      unint64_t v5 = v7 + 1;
    }
    if (v5 >= v4) {
      return 0;
    }
  }
  if (v8[a2])
  {
    int v9 = -v8[a2];
    goto LABEL_9;
  }
  int v10 = (void *)(v6 + 40 * v7);
  if (*v10 != -1) {
    dispatch_once_f((dispatch_once_t *)(v6 + 40 * v7), (void *)(v6 + 40 * v7), (dispatch_function_t)_os_trace_load_formatter);
  }
  return v10;
}

unint64_t os_trace_blob_addns(uint64_t a1, char *__src, unint64_t a3)
{
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0;
  }
  unint64_t v3 = a3;
  unint64_t v4 = __src;
  int v6 = *(_DWORD *)(a1 + 8);
  if (!*(unsigned char *)(a1 + 22)) {
    ++v6;
  }
  int v7 = *(_DWORD *)(a1 + 16);
  if (v7)
  {
    unint64_t v8 = (v7 - v6);
  }
  else
  {
    int v9 = *(_DWORD *)(a1 + 12);
    LODWORD(v8) = v9 - v6;
    if (v9) {
      unint64_t v8 = v8;
    }
    else {
      unint64_t v8 = 0;
    }
  }
  if (v8 < a3) {
    unint64_t v3 = v8;
  }
  if (*__src)
  {
    size_t v10 = 0;
    uint64_t v11 = MEMORY[0x1E4F14390];
    while (1)
    {
      size_t v12 = 0;
      size_t v13 = v3 - v10;
      if (v3 != v10)
      {
        while (v4[v12] >= 1 && (*(_DWORD *)(v11 + 4 * v4[v12] + 60) & 0x4200) != 0x200)
        {
          if (v13 == ++v12)
          {
            size_t v12 = v3 - v10;
            break;
          }
        }
      }
      if (v12 >= v13) {
        size_t v14 = v3 - v10;
      }
      else {
        size_t v14 = v12;
      }
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        uint64_t v15 = *(unsigned int *)(a1 + 8);
        if (v14 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v15 - 1))
        {
          os_trace_blob_add_slow(a1, v4, v14);
        }
        else
        {
          memcpy((void *)(*(void *)a1 + v15), v4, v14);
          unsigned int v16 = *(_DWORD *)(a1 + 8) + v14;
          *(_DWORD *)(a1 + 8) = v16;
          if (!*(unsigned char *)(a1 + 22)) {
            *(unsigned char *)(*(void *)a1 + v16) = 0;
          }
        }
      }
      size_t v17 = v14 + v10;
      if (v3 == v14 + v10) {
        return v3;
      }
      id v18 = &v4[v14];
      int v19 = *v18;
      if (!*v18) {
        return v17;
      }
      if ((v19 & 0x80) == 0) {
        break;
      }
      size_t v24 = _os_trace_utf8_len(v18, v3 - (v14 + v10));
      if (v24 == -1)
      {
        size_t v10 = v17 + 4;
        if (v17 + 4 > v3) {
          return v17;
        }
        int v28 = v19 & 0x7F;
        if ((*(_DWORD *)(v11 + 4 * (v19 & 0x7F) + 60) & 0x200) == 0)
        {
          qmemcpy(&v37, "\\M-", 3);
          HIBYTE(v37) = v19 & 0x7F;
          if ((*(unsigned char *)(a1 + 20) & 2) == 0)
          {
            uint64_t v29 = *(unsigned int *)(a1 + 8);
            if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) > 3)
            {
              uint64_t v30 = *(void *)a1;
              int v31 = v37;
              goto LABEL_53;
            }
            p_srca = (__int16 *)&v37;
LABEL_64:
            uint64_t v34 = a1;
            size_t v35 = 4;
LABEL_65:
            os_trace_blob_add_slow(v34, p_srca, v35);
          }
LABEL_56:
          unint64_t v4 = v18 + 1;
          goto LABEL_57;
        }
        if (v28 == 127) {
          char v32 = 63;
        }
        else {
          char v32 = v28 + 64;
        }
        qmemcpy(&__srca, "\\M^", 3);
        HIBYTE(__srca) = v32;
        if ((*(unsigned char *)(a1 + 20) & 2) != 0) {
          goto LABEL_56;
        }
        uint64_t v29 = *(unsigned int *)(a1 + 8);
        if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) <= 3)
        {
          p_srca = (__int16 *)&__srca;
          goto LABEL_64;
        }
        uint64_t v30 = *(void *)a1;
        int v31 = __srca;
LABEL_53:
        *(_DWORD *)(v30 + v29) = v31;
        unsigned int v23 = *(_DWORD *)(a1 + 8) + 4;
LABEL_54:
        *(_DWORD *)(a1 + 8) = v23;
        if (!*(unsigned char *)(a1 + 22)) {
          *(unsigned char *)(*(void *)a1 + v23) = 0;
        }
        goto LABEL_56;
      }
      size_t v25 = v24;
      if (v24 == -2) {
        return v17;
      }
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        uint64_t v26 = *(unsigned int *)(a1 + 8);
        if (v24 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v26 - 1))
        {
          os_trace_blob_add_slow(a1, v18, v24);
        }
        else
        {
          memcpy((void *)(*(void *)a1 + v26), v18, v24);
          unsigned int v27 = *(_DWORD *)(a1 + 8) + v25;
          *(_DWORD *)(a1 + 8) = v27;
          if (!*(unsigned char *)(a1 + 22)) {
            *(unsigned char *)(*(void *)a1 + v27) = 0;
          }
        }
      }
      size_t v10 = v25 + v17;
      if (v25 + v17 == v3) {
        return v3;
      }
      unint64_t v4 = &v18[v25];
LABEL_57:
      size_t v17 = v10;
      if (!*v4) {
        return v17;
      }
    }
    size_t v10 = v17 + 3;
    if (v17 + 3 > v3) {
      return v17;
    }
    char v20 = v19 + 64;
    if (v19 == 127) {
      char v20 = 63;
    }
    __int16 v39 = 24156;
    char v40 = v20;
    if ((*(unsigned char *)(a1 + 20) & 2) != 0) {
      goto LABEL_56;
    }
    uint64_t v21 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v21 - 1) <= 2)
    {
      p_srca = &v39;
      uint64_t v34 = a1;
      size_t v35 = 3;
      goto LABEL_65;
    }
    uint64_t v22 = *(void *)a1 + v21;
    *(_WORD *)uint64_t v22 = v39;
    *(unsigned char *)(v22 + 2) = v40;
    unsigned int v23 = *(_DWORD *)(a1 + 8) + 3;
    goto LABEL_54;
  }
  return 0;
}

_DWORD *_os_log_fmt_compose_data(uint64_t a1, uint64_t a2, unsigned char *a3, const char *a4, unsigned int a5, int a6)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1F4188790]();
  size_t v13 = (char *)&__src - v12;
  id result = (_DWORD *)_os_log_fmt_compose_format_copy((unsigned char *)&__src - v12, *v14, *(_WORD *)(a2 + 12));
  if ((*a3 & 0xF0) == 0x30)
  {
    LOBYTE(__src) = 39;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v22 = *(unsigned int *)(a1 + 8);
      if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == v22)
      {
        id result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
        if (a5)
        {
LABEL_7:
          uint64_t v24 = 0;
          do
          {
            unint64_t v25 = a4[v24];
            __int16 v26 = *(_WORD *)(a1 + 20);
            if (v24)
            {
              LOBYTE(__src) = 32;
              if ((v26 & 2) == 0)
              {
                uint64_t v27 = *(unsigned int *)(a1 + 8);
                if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == v27)
                {
                  id result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
                }
                else
                {
                  *(unsigned char *)(*(void *)a1 + v27) = 32;
                  unsigned int v28 = *(_DWORD *)(a1 + 8) + 1;
                  *(_DWORD *)(a1 + 8) = v28;
                  if (!*(unsigned char *)(a1 + 22)) {
                    *(unsigned char *)(*(void *)a1 + v28) = 0;
                  }
                }
              }
              __int16 v26 = *(_WORD *)(a1 + 20);
            }
            char v29 = a0123456789abcd_0[v25 >> 4];
            LOBYTE(__src) = v29;
            if ((v26 & 2) == 0)
            {
              uint64_t v30 = *(unsigned int *)(a1 + 8);
              if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == v30)
              {
                id result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
              }
              else
              {
                *(unsigned char *)(*(void *)a1 + v30) = v29;
                unsigned int v31 = *(_DWORD *)(a1 + 8) + 1;
                *(_DWORD *)(a1 + 8) = v31;
                if (!*(unsigned char *)(a1 + 22)) {
                  *(unsigned char *)(*(void *)a1 + v31) = 0;
                }
              }
            }
            char v32 = a0123456789abcd_0[v25 & 0xF];
            LOBYTE(__src) = v32;
            if ((*(_WORD *)(a1 + 20) & 2) == 0)
            {
              uint64_t v33 = *(unsigned int *)(a1 + 8);
              if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == v33)
              {
                id result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
              }
              else
              {
                *(unsigned char *)(*(void *)a1 + v33) = v32;
                unsigned int v34 = *(_DWORD *)(a1 + 8) + 1;
                *(_DWORD *)(a1 + 8) = v34;
                if (!*(unsigned char *)(a1 + 22)) {
                  *(unsigned char *)(*(void *)a1 + v34) = 0;
                }
              }
            }
            ++v24;
          }
          while (a5 != v24);
        }
LABEL_54:
        if (a6)
        {
          char v40 = "…'";
          return (_DWORD *)os_trace_blob_addns(a1, v40, 0xFFFFFFFFFFFFFFFFLL);
        }
        LOBYTE(__src) = 39;
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          uint64_t v41 = *(unsigned int *)(a1 + 8);
          if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == v41)
          {
            return (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
          }
          else
          {
            *(unsigned char *)(*(void *)a1 + v41) = 39;
            unsigned int v42 = *(_DWORD *)(a1 + 8) + 1;
            *(_DWORD *)(a1 + 8) = v42;
            if (!*(unsigned char *)(a1 + 22)) {
              *(unsigned char *)(*(void *)a1 + v42) = 0;
            }
          }
        }
        return result;
      }
      *(unsigned char *)(*(void *)a1 + v22) = 39;
      unsigned int v23 = *(_DWORD *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v23;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v23) = 0;
      }
    }
    if (a5) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
  if (*(unsigned char *)(a2 + 10) == 18) {
    v13[result - 1] = 115;
  }
  __int16 v35 = *(_WORD *)(a2 + 8);
  if ((v35 & 2) != 0)
  {
    int __src = *(_DWORD *)(a2 + 20);
    unsigned int v36 = 1;
    if (a5) {
      goto LABEL_31;
    }
LABEL_34:
    if (a6) {
      a4 = (const char *)&_CTF_NULLSTR;
    }
    else {
      a4 = "(null)";
    }
    if ((v35 & 4) != 0)
    {
      unsigned int v37 = v36 + 1;
      *(&__src + v36) = 0x7FFFFFFF;
    }
    else
    {
      unsigned int v37 = v36;
    }
    goto LABEL_45;
  }
  unsigned int v36 = 0;
  if (!a5) {
    goto LABEL_34;
  }
LABEL_31:
  if ((v35 & 8) == 0)
  {
    *(_DWORD *)&v13[result - 1] = 7547438;
    unsigned int v37 = v36 + 1;
    *(&__src + v36) = a5;
    goto LABEL_45;
  }
  unsigned int v37 = v36 + 1;
  uint64_t v38 = v36;
  if ((v35 & 4) == 0)
  {
    id result = strrchr(v13, 46);
    _DWORD *result = 7547438;
LABEL_43:
    *(&__src + v38) = a5;
    goto LABEL_45;
  }
  unsigned int v39 = *(_DWORD *)(a2 + 24);
  if (v39 > a5) {
    goto LABEL_43;
  }
  *(&__src + v38) = v39;
LABEL_45:
  switch(v37)
  {
    case 2u:
      id result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, __src);
      break;
    case 1u:
      HIBYTE(v43) = HIBYTE(a4);
      id result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, __src);
      break;
    case 0u:
      id result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, (char)a4);
      break;
  }
  if (a6)
  {
    char v40 = "<…>";
    return (_DWORD *)os_trace_blob_addns(a1, v40, 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

uint64_t hash_uint64(void *a1)
{
  unint64_t v1 = *a1 + ~(*a1 << 32);
  unint64_t v2 = 9 * (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) ^ (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) >> 8));
  unint64_t v3 = (v2 ^ (v2 >> 15)) + ~((v2 ^ (v2 >> 15)) << 27);
  return (v3 >> 31) ^ v3;
}

BOOL hashkey_compare_uint64(uint64_t a1, void *a2)
{
  return *a2 == a1;
}

unint64_t _timesync_continuous_to_wall_time(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  if (*a2 != *(void *)(a1 + 64) || a2[1] != *(void *)(a1 + 72)) {
    goto LABEL_8;
  }
  unint64_t v8 = *(void *)(a1 + 112);
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9 && *(_WORD *)v9 == 29524)
  {
    if (v8 > a3 || *(void *)(v9 + 8) <= a3)
    {
LABEL_7:
      if (v8 <= a3)
      {
LABEL_13:
        return _timesync_advance_and_calculate(a1, a3, a4);
      }
LABEL_8:
      _timesync_reset(a1);
      while (*a2 != *(void *)(a1 + 64) || a2[1] != *(void *)(a1 + 72))
      {
        if (_timesync_advance_boot((void *)a1)) {
          return -1;
        }
      }
      goto LABEL_13;
    }
  }
  else if (v8 > a3)
  {
    goto LABEL_7;
  }
  if (a4)
  {
    *a4 = *(void *)(a1 + 128);
    unint64_t v8 = *(void *)(a1 + 112);
  }
  return (a3 - v8) * *(unsigned int *)(a1 + 80) / *(unsigned int *)(a1 + 84) + *(void *)(a1 + 120);
}

uint64_t _parse_log_message(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = *(void **)(a1 + 328);
  unsigned __int16 v28 = 0;
  __int16 v5 = *(_WORD *)(a2 + 2);
  if (v5)
  {
    if (!(*(void *)(a2 + 16) >> 51)) {
      return 0;
    }
    LODWORD(v6) = 8;
    unsigned __int16 v28 = 8;
    unint64_t v7 = *(void *)(a2 + 24);
    *(void *)(a1 + 56) = v7;
    *(void *)(a1 + 64) = _os_activity_map_find_parent(*(void **)(a1 + 320), v7);
    __int16 v5 = *(_WORD *)(a2 + 2);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
  else
  {
    LODWORD(v6) = 0;
    if ((v5 & 0x10) == 0) {
      goto LABEL_3;
    }
  }
  unint64_t v6 = (v6 + 8);
  if (*(unsigned __int16 *)(a2 + 22) < v6) {
    return 0;
  }
  unsigned __int16 v28 = v6;
  if ((v5 & 0x100) != 0)
  {
LABEL_9:
    if ((unint64_t)v6 + 4 > *(unsigned __int16 *)(a2 + 22)) {
      return 0;
    }
    unsigned __int16 v28 = v6 + 4;
    uint64_t v8 = a2 + v6;
    unint64_t v9 = *(unsigned __int16 *)(v8 + 24);
    uint64_t v10 = *(unsigned __int16 *)(v8 + 26);
    if ((v10 + v9) <= 0x1000)
    {
      uint64_t v11 = v4[10];
      if (4096 - v11 <= v9)
      {
        *(void *)(a1 + 232) = v11 + v4[9] + v9 - 4096;
        *(void *)(a1 + 240) = v10;
        *(void *)(a1 + 184) += v10;
      }
    }
  }
LABEL_13:
  uint64_t result = _parse_location((void *)a1, a2, &v28);
  if (!result) {
    return result;
  }
  LOWORD(v13) = v28;
  if ((*(_WORD *)(a2 + 2) & 0x200) != 0)
  {
    LOWORD(v13) = v28 + 2;
    if ((unint64_t)v28 + 2 > *(unsigned __int16 *)(a2 + 22)) {
      return 0;
    }
    uint64_t v14 = v4[11];
    __int16 v29 = *(_WORD *)(a2 + v28 + 24);
    uint64_t v15 = hashtable_lookup(*(void *)(v14 + 64), (uint64_t)&v29);
    if (v15)
    {
      *(void *)(a1 + 248) = *(void *)(v15 + 8);
      *(void *)(a1 + 256) = *(void *)(v15 + 16);
    }
  }
  if ((*(_WORD *)(a2 + 2) & 0x400) != 0)
  {
    if (*(unsigned __int16 *)(a2 + 22) <= (unint64_t)(unsigned __int16)v13) {
      return 0;
    }
    uint64_t v16 = (unsigned __int16)v13;
    LOWORD(v13) = v13 + 1;
    *(unsigned char *)(a1 + 268) = *(unsigned char *)(a2 + v16 + 24);
  }
  if (*(unsigned char *)a2 == 6)
  {
    uint64_t v17 = (unsigned __int16)v13;
    unint64_t v13 = (unsigned __int16)v13 + 8;
    if (v13 > *(unsigned __int16 *)(a2 + 22)) {
      return 0;
    }
    uint64_t v18 = a2 + 24;
    uint64_t v19 = *(void *)(a2 + 24 + v17);
    *(unsigned char *)(a1 + 271) = *(unsigned char *)(a2 + 1) & 0x3F;
    *(unsigned char *)(a1 + 270) = *(unsigned char *)(a2 + 1) & 0xC0;
    *(void *)(a1 + 272) = v19;
    *(void *)(a1 + 8) = 1536;
    if (*(__int16 *)(a2 + 2) < 0)
    {
      uint64_t v20 = (unsigned __int16)v13;
      unint64_t v13 = (unsigned __int16)v13 + 4;
      unint64_t v21 = *(void *)(a2 + 16);
      if (v13 > HIWORD(v21)) {
        return 0;
      }
      int v22 = *(_DWORD *)(v18 + v20);
      if ((*(_WORD *)(a2 + 2) & 0x20) != 0)
      {
        unint64_t v24 = HIWORD(v21);
        uint64_t v25 = (unsigned __int16)v13;
        unint64_t v13 = (unsigned __int16)v13 + 2;
        if (v13 > v24) {
          return 0;
        }
        unint64_t v23 = (unint64_t)*(unsigned __int16 *)(v18 + v25) << 31;
      }
      else
      {
        unint64_t v23 = 0;
      }
      unint64_t v26 = v23 | v22 & 0x7FFFFFFF;
      if (v22 < 0) {
        v26 |= 0x8000000000000000;
      }
      *(void *)(a1 + 280) = v26;
    }
  }
  if ((*(_WORD *)(a2 + 2) & 0x800) == 0) {
    goto LABEL_35;
  }
  uint64_t v27 = (unsigned __int16)v13;
  unint64_t v13 = (unsigned __int16)v13 + 4;
  if (v13 > *(unsigned __int16 *)(a2 + 22)) {
    return 0;
  }
  *(_DWORD *)(a1 + 264) = *(_DWORD *)(a2 + v27 + 24);
LABEL_35:
  *(void *)(a1 + 192) = a2 + (unsigned __int16)v13 + 24;
  *(void *)(a1 + 200) = *(unsigned __int16 *)(a2 + 22) - (unint64_t)(unsigned __int16)v13;
  uint64_t result = 1;
  if ((*(_WORD *)(a2 + 2) & 0x1000) != 0) {
    *(unsigned char *)(a1 + 296) = 1;
  }
  return result;
}

uint64_t _parse_location(void *a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4 = *(void *)(a1[41] + 88);
  int v5 = *(_DWORD *)(a2 + 4);
  if (*(_WORD *)(v4 + 2)) {
    unsigned int v6 = 4;
  }
  else {
    unsigned int v6 = 6;
  }
  switch(*(_WORD *)(a2 + 2) & 0xE)
  {
    case 2:
    case 4:
    case 6:
      unsigned int v6 = 4;
      break;
    case 8:
      break;
    case 0xA:
      unsigned int v6 = 20;
      break;
    case 0xC:
      unsigned int v6 = 6;
      break;
    default:
      unsigned int v6 = 0;
      break;
  }
  uint64_t v7 = (unsigned __int16)*a3;
  unint64_t v8 = v7 + v6;
  unint64_t v9 = *(void *)(a2 + 16);
  if (v8 > HIWORD(v9))
  {
    uint64_t v17 = 0;
    unint64_t v22 = HIWORD(v9);
LABEL_36:
    *a3 = v22;
    return v17;
  }
  *a3 = v8;
  if (!v6) {
    return 0;
  }
  uint64_t v10 = (unsigned int *)(a2 + 24 + v7);
  if (v6 == 6)
  {
    uint64_t v11 = 0;
    unint64_t v12 = (unint64_t)*((unsigned __int16 *)v10 + 2) << 32;
  }
  else
  {
    unint64_t v12 = 0;
    if (v6 == 4) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v10 + 1;
    }
  }
  uint64_t v13 = *v10;
  if ((*(_WORD *)(a2 + 2) & 0x20) == 0)
  {
    unint64_t v14 = 0;
    goto LABEL_20;
  }
  unint64_t v15 = *(void *)(a2 + 16);
  if ((unint64_t)(unsigned __int16)v8 + 2 > HIWORD(v15))
  {
    uint64_t v17 = 0;
    unint64_t v22 = HIWORD(v15);
    goto LABEL_36;
  }
  *a3 = v8 + 2;
  unint64_t v14 = (unint64_t)*(unsigned __int16 *)(a2 + 24 + (unsigned __int16)v8) << 31;
LABEL_20:
  unint64_t v16 = v14 | v5 & 0x7FFFFFFF;
  if (v5 >= 0) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = v16 | 0x8000000000000000;
  }
  a1[20] = v17;
  if (v17)
  {
    a1[42] |= 1uLL;
    uint64_t v17 = 1;
    unint64_t v18 = v12 | v13;
    switch(*(_WORD *)(a2 + 2) & 0xE)
    {
      case 2:
        a1[19] = v18;
        uint64_t v11 = (unsigned int *)(v4 + 24);
        goto LABEL_31;
      case 4:
      case 0xC:
        a1[19] = v18;
        uint64_t v11 = (unsigned int *)(v4 + 40);
        a1[14] = v4 + 40;
        uint64_t v19 = 13;
        goto LABEL_32;
      case 8:
        uint64_t v20 = (void *)_catalog_procinfo_lookup_pc(v4, v12 | v13);
        if (!v20) {
          return 0;
        }
        uint64_t v11 = (unsigned int *)(v20 + 2);
        a1[19] = v18 - *v20;
        goto LABEL_31;
      case 0xA:
        a1[19] = v18;
LABEL_31:
        uint64_t v19 = 14;
LABEL_32:
        a1[v19] = v11;
        uint64_t v17 = v11 != 0;
        break;
      default:
        return v17;
    }
  }
  return v17;
}

void *_os_activity_map_find_parent(void *result, unint64_t a2)
{
  if (result)
  {
    int8x8_t v2 = (int8x8_t)result[1];
    if (v2)
    {
      uint8x8_t v3 = (uint8x8_t)vcnt_s8(v2);
      v3.i16[0] = vaddlv_u8(v3);
      if (v3.u32[0] > 1uLL)
      {
        unint64_t v4 = a2;
        if (*(void *)&v2 <= a2) {
          unint64_t v4 = a2 % *(void *)&v2;
        }
      }
      else
      {
        unint64_t v4 = (*(void *)&v2 - 1) & a2;
      }
      int v5 = *(void **)(*result + 8 * v4);
      if (v5)
      {
        for (unint64_t i = (void *)*v5; i; unint64_t i = (void *)*i)
        {
          unint64_t v7 = i[1];
          if (v7 == a2)
          {
            if (i[2] == a2) {
              return (void *)i[3];
            }
          }
          else
          {
            if (v3.u32[0] > 1uLL)
            {
              if (v7 >= *(void *)&v2) {
                v7 %= *(void *)&v2;
              }
            }
            else
            {
              v7 &= *(void *)&v2 - 1;
            }
            if (v7 != v4) {
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

uint64_t _timesync_advance_boot(void *a1)
{
  unint64_t v1 = (unsigned __int16 *)a1[6];
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = a1[8];
  uint64_t v4 = a1[9];
  while (*v1 != 48048 || *((void *)v1 + 1) == v3 && *((void *)v1 + 2) == v4)
  {
    _timesync_advance((uint64_t)a1);
    unint64_t v1 = (unsigned __int16 *)a1[6];
    if (!v1) {
      return 0xFFFFFFFFLL;
    }
  }
  _timesync_advance((uint64_t)a1);
  return 0;
}

unsigned __int8 *_uuidpath_pathcache_add(uint64_t a1, const unsigned __int8 *a2, unint64_t a3)
{
  if (a3 >= 0x10 && (*(unsigned char *)(a1 + 8) & 1) != 0)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    unint64_t v5 = 8 * v4 + 16;
    if (v5 < a3)
    {
      if (v4)
      {
        unsigned int v6 = (unsigned int *)(a1 + 20);
        while (1)
        {
          unsigned int v7 = *v6;
          v6 += 2;
          BOOL v8 = __CFADD__(v5, v7);
          v5 += v7;
          if (v8) {
            break;
          }
          if (!--v4) {
            goto LABEL_8;
          }
        }
      }
      else
      {
LABEL_8:
        size_t v9 = a3 - v5;
        if (a3 > v5)
        {
          uint64_t v10 = (const void *)(a1 + v5);
          size_t v11 = strnlen((const char *)(a1 + v5), a3 - v5);
          if (v11 < v9)
          {
            size_t v12 = v11;
            goto LABEL_12;
          }
        }
      }
    }
  }
  size_t v12 = 0;
  uint64_t v10 = &_CTF_NULLSTR;
LABEL_12:
  uint64_t v13 = (unsigned __int8 *)_os_trace_malloc();
  uuid_copy(v13 + 24, a2);
  memcpy(v13 + 40, v10, v12 + 1);
  unint64_t v14 = _uuidpath_pathcache();
  inserted = (unsigned __int8 *)rb_tree_insert_node(v14, v13);
  if (v13 != inserted) {
    free(v13);
  }
  return inserted;
}

void _resolve_uuid_slow(uint64_t a1)
{
  unint64_t v1 = *(const void **)(a1 + 40);
  if (!v1) {
    return;
  }
  uint64_t v3 = (void *)(a1 + 112);
  if (!*(void *)(a1 + 112)) {
    return;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 328) + 96);
  if (v4)
  {
    if (!*(void *)(a1 + 160)) {
      return;
    }
  }
  uuidpath_lookup_fd(*(_DWORD *)(a1 + 352), v1, (void *)(a1 + 48));
  if (*(void *)(a1 + 8) == 2560 || (*(unsigned char *)(a1 + 168) & 2) != 0)
  {
    if (uuidpath_lookup_fd(*(_DWORD *)(a1 + 352), *(const void **)(a1 + 112), (void *)(a1 + 120))
      || (*(unsigned char *)(a1 + 168) & 2) == 0)
    {
      goto LABEL_19;
    }
    uint64_t v8 = *(unsigned int *)(a1 + 352);
    size_t v9 = *(__n128 **)(a1 + 104);
    unint64_t v10 = *(void *)(a1 + 152);
    uint64_t v13 = 0;
    uuidpath_sharedcache_resolve_fd(v8, v9, 0, v10, 0, 0, 0, 0, a1 + 120, &v13, 0);
LABEL_18:
    *(void *)(a1 + 152) -= v13;
    goto LABEL_19;
  }
  if (v4)
  {
    uint64_t v13 = 0;
    int v5 = *(__int16 *)(v4 + 2);
    unsigned int v6 = (const char **)(a1 + 288);
    if (v5 >= 0) {
      unsigned int v6 = 0;
    }
    if (*(unsigned char *)v4 == 6) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = 0;
    }
    if ((v5 & 6 | 8) != 0xC)
    {
      uuidpath_resolve_fd(*(_DWORD *)(a1 + 352), *(const void **)(a1 + 112), *(void *)(a1 + 160), *(void *)(a1 + 280), (const char **)(a1 + 176), v7, (void *)(a1 + 120), 0);
      goto LABEL_19;
    }
    uuidpath_sharedcache_resolve_fd(*(unsigned int *)(a1 + 352), *(__n128 **)(a1 + 112), *(void *)(a1 + 160), *(void *)(a1 + 152), *(void *)(a1 + 280), (const char **)(a1 + 176), v7, v3, a1 + 120, &v13, 0);
    goto LABEL_18;
  }
LABEL_19:
  size_t v11 = *(void **)(a1 + 384);
  if (v11)
  {

    *(void *)(a1 + 384) = 0;
  }
  size_t v12 = *(void **)(a1 + 392);
  if (v12)
  {

    *(void *)(a1 + 392) = 0;
  }
  if (*(void *)(a1 + 48)) {
    *(void *)(a1 + 384) = (id)objc_msgSend(NSString, "stringWithUTF8String:");
  }
  if (*(void *)(a1 + 120)) {
    *(void *)(a1 + 392) = (id)objc_msgSend(NSString, "stringWithUTF8String:");
  }
  *(void *)(a1 + 336) |= 2uLL;
}

BOOL uuidpath_lookup_fd(int a1, const void *a2, void *a3)
{
  unsigned int v6 = _uuidpath_pathcache();
  node = (char *)rb_tree_find_node(v6, a2);
  if (!node)
  {
    size_t v12 = 0;
    uint64_t v8 = _uuidpath_headercache_lookup((const unsigned __int8 *)a2, &v12);
    if (v8)
    {
LABEL_8:
      node = (char *)_uuidpath_pathcache_add((uint64_t)v8, (const unsigned __int8 *)a2, v12);
      goto LABEL_9;
    }
    if (a1 == -3) {
      size_t v9 = (char *)uuidpath_map_header(0, (uint64_t)a2, &v12);
    }
    else {
      size_t v9 = (char *)uuidpath_map_header_fd(a1, (uint64_t)a2, &v12);
    }
    uint64_t v8 = v9;
    if (v9)
    {
      _uuidpath_headercache_add((const unsigned __int8 *)a2, (uint64_t)v9, v12);
      goto LABEL_8;
    }
    node = 0;
  }
LABEL_9:
  unint64_t v10 = node + 40;
  if (!node) {
    unint64_t v10 = 0;
  }
  *a3 = v10;
  return node != 0;
}

rb_tree_t *_uuidpath_pathcache()
{
  if (_uuidpath_pathcache_onceToken != -1) {
    dispatch_once(&_uuidpath_pathcache_onceToken, &__block_literal_global_22);
  }
  v0 = (rb_tree_t *)pthread_getspecific(_uuidpath_pathcache_key);
  if (!v0)
  {
    v0 = (rb_tree_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x80040A284212CuLL);
    rb_tree_init(v0, (const rb_tree_ops_t *)&_uuidpath_pathcache_ops);
    pthread_setspecific(_uuidpath_pathcache_key, v0);
  }
  return v0;
}

uint64_t uuidpath_sharedcache_resolve_fd(uint64_t a1, __n128 *a2, unint64_t a3, unint64_t a4, unint64_t a5, const char **a6, const char **a7, void *a8, unint64_t a9, void *a10, const char **a11)
{
  int v17 = a1;
  v35[1] = *MEMORY[0x1E4F143B8];
  dsc_map_impl = _os_trace_uuiddb_get_dsc_map_impl(a1, 0, a2, 1);
  if (dsc_map_impl)
  {
    uint64_t v19 = (uint64_t)dsc_map_impl;
    if (!a6 || (uint64_t v20 = _os_trace_uuiddb_dsc_map_resolve_string((uint64_t)dsc_map_impl, a3), (*a6 = v20) != 0))
    {
      if (a7) {
        *a7 = _os_trace_uuiddb_dsc_map_resolve_string(v19, a5);
      }
      if (!a8 && !a9 && !a10 || (_os_trace_uuiddb_dsc_map_resolve_entry(v19, a4, a8, (void *)a9, a10) & 1) != 0) {
        return 1;
      }
      if (a11)
      {
        uint64_t result = 0;
        unint64_t v22 = "<Invalid shared cache code pointer offset>";
        goto LABEL_20;
      }
      return 0;
    }
    if (a11)
    {
      uint64_t result = 0;
      unint64_t v22 = "<Invalid shared cache format string offset>";
      goto LABEL_20;
    }
    return 0;
  }
  if (headercache_once == -1)
  {
    if (!a2) {
      goto LABEL_14;
    }
  }
  else
  {
    dispatch_once(&headercache_once, &__block_literal_global_881);
    if (!a2)
    {
LABEL_14:
      if (a11)
      {
        uint64_t result = 0;
        unint64_t v22 = "<Invalid shared cache is NULL>";
LABEL_20:
        *a11 = v22;
        return result;
      }
      return 0;
    }
  }
  if (uuid_is_null((const unsigned __int8 *)a2)) {
    goto LABEL_14;
  }
  unint64_t v23 = pthread_getspecific(headercache_key);
  if (!v23)
  {
    unint64_t v23 = malloc_type_calloc(1uLL, 0xC8uLL, 0x1020040FD027848uLL);
    pthread_setspecific(headercache_key, v23);
  }
  if (uuid_compare((const unsigned __int8 *)v23 + 24, (const unsigned __int8 *)a2))
  {
    v35[0] = 0;
    unint64_t v24 = uuidpath_map_header_fd(v17, (uint64_t)a2, v35);
    if (!v24)
    {
      if (a11) {
        *a11 = "<Invalid - Unable to find matching cache information>";
      }
      return 0;
    }
    uint64_t v25 = v24;
    if ((v24[8] & 2) == 0)
    {
      if (a11) {
        *a11 = "<Invalid - Not shared cache information>";
      }
      munmap(v24, v35[0]);
      return 0;
    }
    unint64_t v26 = (void *)*((void *)v23 + 1);
    if (v26) {
      munmap(v26, *((void *)v23 + 2));
    }
    size_t v27 = v35[0];
    *((void *)v23 + 1) = v25;
    *((void *)v23 + 2) = v27;
    uuid_copy((unsigned __int8 *)v23 + 24, (const unsigned __int8 *)a2);
  }
  else
  {
    uint64_t v25 = (unsigned char *)*((void *)v23 + 1);
    if (!v25)
    {
      if (a11)
      {
        uint64_t result = 0;
        unint64_t v22 = "<Invalid - Unable to find matching cache information>";
        goto LABEL_20;
      }
      return 0;
    }
  }
  uint64_t v28 = *((unsigned int *)v25 + 3);
  if (!v28)
  {
LABEL_42:
    if (a11)
    {
      uint64_t result = 0;
      unint64_t v22 = "<Invalid shared cache offset>";
      goto LABEL_20;
    }
    return 0;
  }
  uint64_t v29 = 0;
  unint64_t v30 = a3 & 0x7FFFFFFFFFFFFFFFLL;
  unsigned int v31 = v25 + 48;
  while (1)
  {
    unint64_t v32 = *(v31 - 1) - *((void *)v25 + 2);
    if (v30 >= v32 && v30 <= *v31 + v32) {
      break;
    }
    ++v29;
    v31 += 4;
    if (v28 == v29) {
      goto LABEL_42;
    }
  }
  uint64_t v33 = &v25[32 * v29 + 24];
  if (a8) {
    *a8 = v33;
  }
  if (!((unint64_t)a6 | a9)) {
    return 1;
  }
  return uuidpath_resolve_fd(v17, v33, (v30 - v32) | a3 & 0x8000000000000000, 0, a6, 0, (void *)a9, a11);
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

uint64_t *_os_trace_uuiddb_get_dsc_map_impl(uint64_t a1, char *a2, __n128 *a3, int a4)
{
  BOOL v8 = 0;
  while (1)
  {
    uint64_t v9 = _os_trace_uuiddb_get_dsc_map_impl__dsc_map_head;
    if (_os_trace_uuiddb_get_dsc_map_impl__dsc_map_head)
    {
      unint64_t v10 = (void *)_os_trace_uuiddb_get_dsc_map_impl__dsc_map_head;
      while (v10[4] != a3->n128_u64[0] || v10[5] != a3->n128_u64[1])
      {
        unint64_t v10 = (void *)*v10;
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
    *BOOL v8 = v9;
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
  BOOL v8 = v11;
  if (!a2 || close(a1) != -1)
  {
    if (!v8) {
      return v8;
    }
    goto LABEL_18;
  }
  int v13 = *__error();
  uint64_t result = (uint64_t *)*__error();
  if (v13 != 9)
  {
    _os_assumes_log();
    if (!v8) {
      return v8;
    }
    goto LABEL_18;
  }
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = (uint64_t)result;
  __break(1u);
  return result;
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
  unint64_t v15 = (void *)(v8 + 32 * v10);
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

uint64_t _os_trace_str_map_for_each(uint64_t result, uint64_t a2)
{
  if (result)
  {
    for (unint64_t i = *(uint64_t **)(result + 16); i; unint64_t i = (uint64_t *)*i)
    {
      unsigned int v4 = i + 2;
      if (*((char *)i + 39) < 0) {
        unsigned int v4 = (void *)*v4;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t))(a2 + 16))(a2, v4, i[5]);
    }
  }
  return result;
}

char *_uuidpath_headercache_lookup(const unsigned __int8 *a1, void *a2)
{
  if (headercache_once != -1) {
    dispatch_once(&headercache_once, &__block_literal_global_25);
  }
  uint64_t result = (char *)pthread_getspecific(headercache_key);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = 0;
    for (unint64_t i = (const unsigned __int8 *)(result + 56); uuid_compare(i, a1); i += 32)
    {
      if (++v6 == 5) {
        return 0;
      }
    }
    uint64_t v8 = &v5[32 * v6];
    uint64_t result = (char *)*((void *)v8 + 5);
    *a2 = *((void *)v8 + 6);
  }
  return result;
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
  v5[3] = &unk_1E5A41C58;
  v5[5] = &v7;
  v5[6] = a2;
  v5[4] = v6;
  hashtable_iterate(v2, (uint64_t)v5);
  uint64_t v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

unsigned int *hashtable_iterate(unsigned int *result, uint64_t a2)
{
  if (*((void *)result + 2))
  {
    uint64_t v2 = result;
    unint64_t v3 = *result;
    if (v3)
    {
      for (unint64_t i = 0; i < v3; ++i)
      {
        uint64_t v6 = *(void **)(*((void *)v2 + 2) + 8 * i);
        if (v6)
        {
          do
          {
            int v7 = *((unsigned __int8 *)v2 + 8);
            if (v7 == 1) {
              uint64_t v8 = v6 + 1;
            }
            else {
              uint64_t v8 = 0;
            }
            if (v7 == 2) {
              uint64_t v9 = v6 + 1;
            }
            else {
              uint64_t v9 = v8;
            }
            uint64_t result = (unsigned int *)(*(uint64_t (**)(uint64_t, void *, void))(a2 + 16))(a2, v9, v6[2]);
            uint64_t v6 = (void *)*v6;
          }
          while (v6);
          unint64_t v3 = *v2;
        }
      }
    }
  }
  return result;
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

void *uuidpath_map_header_fd(int a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = 0;
  }
  if (a2)
  {
    _os_trace_uuiddb_get_pathsuffix(a2, 1, __str, 0x400uLL);
    uint64_t result = (void *)_os_trace_mmap_at();
    if (!result) {
      return result;
    }
    munmap(result, 0);
  }
  return 0;
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
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
    qword_1E953C318 = a2;
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
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_1E953C318 = __size;
    __break(1u);
    goto LABEL_17;
  }
  __str[(int)result] = 47;
  uint64_t v9 = &__str[v8];
  do
  {
    char *v9 = a0123456789abcd_0[(unint64_t)*(unsigned __int8 *)(v6 + v7) >> 4];
    v9[1] = a0123456789abcd_0[*(unsigned char *)(v6 + v7) & 0xF];
    v9 += 2;
    ++v7;
  }
  while (v7 != 16);
  char *v9 = 0;
  return result;
}

void _uuidpath_headercache_add(const unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a1 && !uuid_is_null(a1))
  {
    if (headercache_once != -1) {
      dispatch_once(&headercache_once, &__block_literal_global_28);
    }
    uint64_t v6 = (int *)pthread_getspecific(headercache_key);
    if (!v6)
    {
      uint64_t v6 = (int *)malloc_type_calloc(1uLL, 0xC8uLL, 0x1020040FD027848uLL);
      pthread_setspecific(headercache_key, v6);
    }
    uint64_t v7 = *v6;
    uint64_t v8 = &v6[8 * v7];
    uint64_t v9 = (void *)*((void *)v8 + 5);
    if (v9)
    {
      munmap(v9, *((void *)v8 + 6));
      uint64_t v7 = *v6;
    }
    uint64_t v10 = &v6[8 * v7];
    *((void *)v10 + 5) = a2;
    *((void *)v10 + 6) = a3;
    uuid_copy((unsigned __int8 *)v10 + 56, a1);
    if (*v6 == 4) {
      int v11 = 0;
    }
    else {
      int v11 = *v6 + 1;
    }
    *uint64_t v6 = v11;
  }
}

uint64_t uuidpath_resolve_fd(int a1, const void *a2, unint64_t a3, unint64_t a4, const char **a5, const char **a6, void *a7, void *a8)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  unint64_t v51 = 0;
  if (a2)
  {
    if (!a5)
    {
      if (a7)
      {
        unint64_t v16 = _uuidpath_pathcache();
        node = (char *)rb_tree_find_node(v16, a2);
        if (node)
        {
          *a7 = node + 40;
          return 1;
        }
      }
    }
    unint64_t v18 = _uuidpath_headercache_lookup((const unsigned __int8 *)a2, &v51);
    if (v18) {
      goto LABEL_9;
    }
    uint64_t v19 = (char *)uuidpath_map_header_fd(a1, (uint64_t)a2, &v51);
    if (v19)
    {
      unint64_t v18 = v19;
      _uuidpath_headercache_add((const unsigned __int8 *)a2, (uint64_t)v19, v51);
LABEL_9:
      uint64_t v20 = _uuidpath_pathcache_add((uint64_t)v18, (const unsigned __int8 *)a2, v51);
      if (a7 && v20)
      {
        *a7 = v20 + 40;
        if (!a5) {
          return 1;
        }
      }
      else if (!a5)
      {
        return 1;
      }
      if ((a3 & 0x8000000000000000) != 0)
      {
        *a5 = "%s";
        return 1;
      }
      uint64_t v22 = *((unsigned int *)v18 + 3);
      if (!v22) {
        goto LABEL_58;
      }
      uint64_t v23 = 0;
      LOBYTE(v24) = 0;
      BOOL v25 = a6 == 0;
      uint64_t v26 = (uint64_t)&v18[8 * v22 + 16];
      int64_t v27 = v51;
      while (1)
      {
        uint64_t v28 = &v18[8 * v23];
        int v30 = *((_DWORD *)v28 + 5);
        uint64_t v29 = (unsigned int *)(v28 + 20);
        unint64_t v31 = *(v29 - 1);
        unint64_t v32 = (v30 + v31);
        if ((v24 & 1) == 0)
        {
          uint64_t v33 = a3 - v31;
          if (a3 < v31 || v32 <= a3)
          {
            int v24 = 0;
            if (v25) {
              goto LABEL_47;
            }
            goto LABEL_34;
          }
          if (v33 > v27 || v33 < 0) {
            unsigned int v36 = "<format string calculation error>";
          }
          else {
            unsigned int v36 = (const char *)(v26 + v33);
          }
          *a5 = v36;
        }
        int v24 = 1;
        if (v25) {
          goto LABEL_47;
        }
LABEL_34:
        uint64_t v37 = a4 - v31;
        if (a4 >= v31 && v32 > a4)
        {
          if (v37 > v27 || v37 < 0) {
            char v40 = "<signpost name calculation error>";
          }
          else {
            char v40 = (const char *)(v26 + v37);
          }
          *a6 = v40;
LABEL_47:
          if (v24) {
            return 1;
          }
          if (++v23 >= (unint64_t)*((unsigned int *)v18 + 3)) {
            goto LABEL_58;
          }
          BOOL v25 = 1;
          goto LABEL_50;
        }
        if (++v23 >= (unint64_t)*((unsigned int *)v18 + 3))
        {
          if (v24)
          {
            if (!a8) {
              return 0;
            }
LABEL_60:
            memset(out, 0, 37);
            uuid_unparse_upper((const unsigned __int8 *)a2, out);
            _uuidpath_error_message(a3, a8, "Invalid bounds %d for %s", v46, v47, v48, v49, v50, a4);
            return 0;
          }
LABEL_58:
          if (!a8) {
            return 0;
          }
          LOBYTE(a4) = a3;
          goto LABEL_60;
        }
        BOOL v25 = 0;
LABEL_50:
        v26 += *v29;
      }
    }
    if (a8)
    {
      memset(out, 0, 37);
      uuid_unparse_upper((const unsigned __int8 *)a2, out);
      _uuidpath_error_message(a3, a8, "Invalid image <%s>", v41, v42, v43, v44, v45, (char)out);
    }
    return 0;
  }
  else
  {
    if (!a8) {
      return 0;
    }
    uint64_t result = 0;
    *a8 = "Invalid image UUID (NULL)";
  }
  return result;
}

void _os_trace_uuiddb_dsc_map_create(uint64_t a1, __n128 *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  _os_trace_uuiddb_get_pathsuffix((uint64_t)a2, 3, __b, 0x400uLL);
  uint64_t v3 = _os_trace_mmap_at();
  if (v3)
  {
    unint64_t v4 = (void *)v3;
    _os_trace_uuiddb_dsc_validate_hdr(v3, 0xAAAAAAAAuLL, a2);
    if (!v5 && munmap(v4, 0xAAAAAAAAAAAAAAAALL) == -1)
    {
      __error();
      _os_assumes_log();
    }
  }
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
        unint64_t v15 = (unsigned int *)(a1 + 28);
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
        int v30 = (unsigned int *)(a1 + 16 * v7 + 40);
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
        __int16 v35 = (_DWORD *)(v32 + 16);
        unsigned int v36 = (void *)(a1 + 24);
        do
        {
          *((void *)v35 - 2) = *((unsigned int *)v36 - 1);
          *((void *)v35 - 1) = *v36;
          *__int16 v35 = *((_DWORD *)v36 - 2);
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
    uint64_t v26 = (_DWORD *)(a1 + 32);
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

void __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__()
{
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventProxy was retained outside of iteration";
  __break(1u);
}

void sub_1A1138908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  _Block_object_dispose((const void *)(v48 - 224), 8);
  _Block_object_dispose((const void *)(v48 - 176), 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Unwind_Resume(a1);
}

unint64_t _oie_get_next_major_time(void *a1, char a2, void *a3)
{
  int v5 = a1;
  int v6 = v5;
  if ((a2 & 8) != 0) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = -1;
  }
  uint64_t v8 = [v5[1] firstObject];
  uint64_t v9 = v8;
  if (v8)
  {
    if ((a2 & 8) != 0)
    {
      if ([v8 endTime] < v7) {
        goto LABEL_11;
      }
      uint64_t v10 = [v9 endTime];
    }
    else
    {
      if ([v8 oldestTime] > v7) {
        goto LABEL_11;
      }
      uint64_t v10 = [v9 oldestTime];
    }
    unint64_t v7 = v10;
  }
LABEL_11:
  uint64_t v11 = [v6[3] firstObject];
  BOOL v12 = v11;
  if (!v11) {
    goto LABEL_18;
  }
  if ((a2 & 8) != 0)
  {
    if ([v11 endTime] < v7) {
      goto LABEL_18;
    }
    uint64_t v13 = [v12 endTime];
  }
  else
  {
    if ([v11 oldestTime] > v7) {
      goto LABEL_18;
    }
    uint64_t v13 = [v12 oldestTime];
  }
  unint64_t v7 = v13;
LABEL_18:
  BOOL v14 = [v6[4] firstObject];
  unint64_t v15 = v14;
  if (!v14) {
    goto LABEL_29;
  }
  if ((a2 & 8) != 0)
  {
    if ([v14 endTime] < v7) {
      goto LABEL_29;
    }
  }
  else if ([v14 oldestTime] > v7)
  {
    goto LABEL_29;
  }
  uint64_t v16 = (void *)[v15 bootUUID];
  if (*v16 == *a3 && v16[1] == a3[1])
  {
    if ((a2 & 8) != 0) {
      uint64_t v17 = [v15 endTime];
    }
    else {
      uint64_t v17 = [v15 oldestTime];
    }
    unint64_t v7 = v17;
  }
LABEL_29:
  unint64_t v18 = [v6[2] firstObject];
  uint64_t v19 = v18;
  if (v18)
  {
    if ((a2 & 8) != 0)
    {
      uint64_t v25 = [v18 oldestTime];
      uint64_t v26 = v25 - 1;
      if (v25 - 1 <= v7) {
        uint64_t v26 = v7;
      }
      if (v25) {
        unint64_t v7 = v26;
      }
    }
    else
    {
      uint64_t v20 = [v18 endTime];
      uint64_t v21 = v20 + 1;
      uint64_t v22 = v20 == -1;
      uint64_t v23 = v22 << 63 >> 63;
      uint64_t v24 = v23 ^ v22;
      if (v7 < v20 + 1) {
        uint64_t v21 = v7;
      }
      if (v23 < 0) {
        uint64_t v21 = v7;
      }
      if (!v24) {
        unint64_t v7 = v21;
      }
    }
  }
  uint64_t v27 = [v6[5] firstObject];
  unint64_t v28 = v27;
  if (v27)
  {
    if ((a2 & 8) != 0)
    {
      uint64_t v34 = [v27 oldestTime];
      uint64_t v35 = v34 - 1;
      if (v34 - 1 <= v7) {
        uint64_t v35 = v7;
      }
      if (v34) {
        unint64_t v7 = v35;
      }
    }
    else
    {
      uint64_t v29 = [v27 endTime];
      uint64_t v30 = v29 + 1;
      uint64_t v31 = v29 == -1;
      uint64_t v32 = v31 << 63 >> 63;
      uint64_t v33 = v32 ^ v31;
      if (v7 < v29 + 1) {
        uint64_t v30 = v7;
      }
      if (v32 < 0) {
        uint64_t v30 = v7;
      }
      if (!v33) {
        unint64_t v7 = v30;
      }
    }
  }

  return v7;
}

uint64_t __enumerateAndDecompressSubchunk_block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = enumerateAndDecompressSubchunk(*(void *)(a1 + 32), a2, [*(id *)(a1 + 40) data], *(void *)(a1 + 48));
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

uint64_t enumerateAndDecompressSubchunk(void *a1, _DWORD *a2, uint64_t a3, void *a4)
{
  unint64_t v7 = a1;
  id v8 = a4;
  uint64_t v9 = v8;
  uint64_t v10 = 1;
  unsigned int v11 = *a2 - 24577;
  if (v11 <= 0xF)
  {
    if (((1 << v11) & 0x880F) != 0)
    {
      uint64_t v10 = (*((uint64_t (**)(id, _DWORD *, uint64_t))v8 + 2))(v8, a2, a3);
    }
    else if (*a2 == 24589)
    {
      uint64_t v13 = [v7 _decompressedBufferForChunk:a2 subchunk:v7[2]];
      uint64_t v27 = 0;
      unint64_t v28 = &v27;
      uint64_t v29 = 0x2020000000;
      char v30 = 1;
      uint64_t v14 = [v13 data];
      unint64_t v15 = [v13 size];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      uint64_t v21 = __enumerateAndDecompressSubchunk_block_invoke;
      uint64_t v22 = &unk_1E5A42440;
      uint64_t v26 = &v27;
      uint64_t v23 = v7;
      id v16 = v13;
      id v24 = v16;
      id v25 = v9;
      uint64_t v17 = v20;
      unint64_t v18 = 0;
      do
      {
        if (v15 - v18 < 0x10) {
          break;
        }
        unint64_t v19 = *(void *)(v14 + v18 + 8);
        if (v15 - v18 - 16 < v19) {
          break;
        }
        if (!((unsigned int (*)(void *))v21)(v17)) {
          break;
        }
        unint64_t v18 = (v18 + v19 + 23) & 0xFFFFFFFFFFFFFFF8;
      }
      while (v18 - 1 < v15);

      uint64_t v10 = *((unsigned char *)v28 + 24) != 0;
      _Block_object_dispose(&v27, 8);
    }
  }

  return v10;
}

void sub_1A1138F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___oie_advance_cursor_open_subchunk_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  switch(*(_DWORD *)a2)
  {
    case 0x6001:
    case 0x600C:
      [*(id *)(*(void *)(a1 + 32) + 136) insertTracepoints:a2 chunkOffset:a3 chunkSetStartAddr:a4 subchunk:*(void *)(a1 + 40) options:*(unsigned int *)(a1 + 48)];
      break;
    case 0x6002:
      goto LABEL_4;
    case 0x6003:
      unint64_t v10 = 0;
      if (_oie_validate_subchunk_ttl(*(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a2 + 28), &v10)&& *(void *)(a2 + 32) >= v10)
      {
        [*(id *)(*(void *)(a1 + 32) + 136) insertStatedumpChunk:a2 chunkOffset:a3 chunkSetStartAddr:a4 subchunk:*(void *)(a1 + 40)];
      }
      break;
    case 0x6004:
      unint64_t v10 = 0;
      if (_oie_validate_subchunk_ttl(*(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a2 + 28), &v10)&& *(void *)(a2 + 32) >= v10)
      {
        [*(id *)(*(void *)(a1 + 32) + 136) insertSimpleChunk:a2 chunkOffset:a3 chunkSetStartAddr:a4 subchunk:*(void *)(a1 + 40) options:*(unsigned int *)(a1 + 48)];
      }
      break;
    case 0x6005:
    case 0x6006:
    case 0x6007:
    case 0x6008:
    case 0x6009:
    case 0x600A:
    case 0x600B:
      return 1;
    default:
      if (*(_DWORD *)a2 == 24592)
      {
LABEL_4:
        id v8 = [[_OSLogEnumeratorOversizeChunk alloc] initWithSubchunk:*(void *)(a1 + 40) chunk:a2];
        [*(id *)(*(void *)(a1 + 32) + 56) addObject:v8];
      }
      break;
  }
  return 1;
}

uint64_t _OSLogIndexOrderForClosing(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  if ((a3 & 8) == 0)
  {
    uint64_t v7 = [v5 endTime];
    if (v7 != [v6 endTime])
    {
      unint64_t v8 = [v5 endTime];
      if (v8 < [v6 endTime]) {
        uint64_t v9 = -1;
      }
      else {
        uint64_t v9 = 1;
      }
      goto LABEL_11;
    }
LABEL_7:
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = [v5 oldestTime];
  if (v10 == [v6 oldestTime]) {
    goto LABEL_7;
  }
  unint64_t v11 = [v5 oldestTime];
  if (v11 > [v6 oldestTime]) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = 1;
  }
LABEL_11:

  return v9;
}

__CFString *_compose_log_message(uint64_t a1)
{
  v52[128] = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(a1 + 168) & 2) == 0)
  {
    if ((*(void *)(a1 + 336) & 3) == 1) {
      _resolve_uuid_slow(a1);
    }
    uint64_t v51 = 0x10000;
    uint64_t v49 = (uint64_t)v52;
    uint64_t v50 = 0x40000000000;
    uint64_t v2 = *(char **)(a1 + 192);
    if (!v2)
    {
      if (!*(void *)(a1 + 176)) {
        return @"<compose failure [missing precomposed log]>";
      }
      uint64_t v21 = NSString;
      return (__CFString *)objc_msgSend(v21, "stringWithUTF8String:");
    }
    unint64_t v3 = *(void *)(a1 + 200);
    if (!(v3 >> 16) && !(*(void *)(a1 + 240) >> 16))
    {
      if (*(void *)(a1 + 8) == 768)
      {
        if (v3 - 1733 >= 0xFFFFFFFFFFFFF93CLL)
        {
          id v5 = &v2[v3 - 1];
          uint64_t v4 = *v5;
          if ((_WORD)v3 + ~(_WORD)v4 + 2 * (_WORD)v4 != 0xFFFE)
          {
            MEMORY[0x1F4188790]();
            pubuint64_t data = (unsigned __int8 *)&v39 - v6;
            bzero((char *)&v39 - v6, v8);
            *pubuint64_t data = 0;
            pubdata[1] = v4;
            if (v4)
            {
              uint64_t v9 = -v4;
              uint64_t v10 = &v2[v3 + ~v4];
              uint64_t v40 = pubdata;
              unint64_t v11 = pubdata + 2;
              BOOL v12 = @"<compose failure [corrupt log]>";
              while (1)
              {
                size_t v13 = v5[v9] & 0x3F;
                if (&v2[v13] > v10) {
                  return v12;
                }
                unsigned char *v11 = 0;
                v11[1] = v13;
                uint64_t v14 = v11 + 2;
                memcpy(v11 + 2, v2, v13);
                unint64_t v11 = &v14[v13];
                v2 += v13;
                if (__CFADD__(v9++, 1))
                {
                  pubuint64_t data = v40;
                  goto LABEL_30;
                }
              }
            }
            goto LABEL_30;
          }
        }
      }
      else
      {
        pubuint64_t data = *(unsigned __int8 **)(a1 + 208);
        if (pubdata
          || (pubuint64_t data = os_log_fmt_extract_pubdata(*(unsigned char **)(a1 + 192), (unsigned __int16)*(void *)(a1 + 200), (void *)(a1 + 216), (unsigned __int16 *)(a1 + 224))) != 0)
        {
LABEL_30:
          objc_msgSend((id)a1, "set_unreliableIdentifier:", 0);
          if ((*(void *)(a1 + 8) | 0x200) == 0x600 && (*pubdata & 0x10) != 0) {
            objc_msgSend((id)a1, "set_unreliableIdentifier:", 1);
          }
          uint64_t v22 = *(char **)(a1 + 176);
          if (v22) {
            goto LABEL_36;
          }
          uint64_t v48 = 0;
          uint64_t v23 = _os_log_resolve_format(*(__n128 **)(a1 + 112), *(void *)(a1 + 72), *(void *)(a1 + 160), &v48);
          *(void *)(a1 + 176) = v23;
          if (v23)
          {
            uint64_t v22 = (char *)v23;
LABEL_36:
            if (*(void *)(a1 + 8) == 768) {
              uint64_t v24 = 1;
            }
            else {
              uint64_t v24 = 2;
            }
            int v25 = *(unsigned __int8 *)(a1 + 364);
            if (*(_DWORD *)(a1 + 168)) {
              uint64_t v26 = 4;
            }
            else {
              uint64_t v26 = 8;
            }
            uint64_t v27 = *(void *)(a1 + 216);
            int v28 = *(unsigned __int16 *)(a1 + 224);
            uint64_t v29 = *(void *)(a1 + 232);
            uint64_t v30 = *(void *)(a1 + 240);
            int v31 = *(_DWORD *)(a1 + 352);
            uint64_t v32 = *(void *)(a1 + 72);
            long long v41 = *(_OWORD *)(a1 + 104);
            int v43 = 0;
            uint64_t v44 = v32;
            int v42 = v31;
            uint64_t v46 = 0;
            uint64_t v47 = 0;
            uint64_t v45 = 0;
            if (v25) {
              unsigned int v33 = 3;
            }
            else {
              unsigned int v33 = 1;
            }
            os_log_fmt_compose((size_t)&v49, v22, v24, v33, v26, pubdata, v27, v28, v29, v30, (uint64_t)&v41);
            char v34 = BYTE4(v51);
            uint64_t v35 = (char *)v49;
            uint64_t v49 = 3954044928;
            WORD2(v51) = 0;
            uint64_t v36 = v50;
            if ((v34 & 1) == 0) {
              uint64_t v35 = (char *)_os_trace_memdup();
            }
            if (*(void *)(a1 + 8) == 1536 && !*(void *)(a1 + 288))
            {
              old_signpost_name_end = _find_old_signpost_name_end(v35, *(const char **)(a1 + 176));
              if (old_signpost_name_end)
              {
                v36 += (uint64_t)&v35[~(unint64_t)old_signpost_name_end];
                uint64_t v38 = _os_trace_memdup();
                free(v35);
                uint64_t v35 = (char *)v38;
              }
            }
            BOOL v12 = (__CFString *)[[NSString alloc] initWithBytesNoCopy:v35 length:v36 encoding:4 freeWhenDone:1];
            *(void *)(a1 + 408) = v12;
            if (!v12)
            {
              free(v35);
              return @"<compose failure [illegible log arguments]>";
            }
            return v12;
          }
          uint64_t v21 = NSString;
          return (__CFString *)objc_msgSend(v21, "stringWithUTF8String:");
        }
      }
    }
    return @"<compose failure [corrupt log]>";
  }
  uint64_t v16 = *(void *)(*(void *)(a1 + 328) + 56);
  if (*(_DWORD *)v16 != 24580) {
    return 0;
  }
  if (*(_DWORD *)(v16 + 4)) {
    return 0;
  }
  if (*(void *)(v16 + 8) < 0x49uLL) {
    return 0;
  }
  uint64_t v17 = _simple_support_validate_payload(v16, 0);
  if (!v17) {
    return 0;
  }
  uint64_t v18 = v17 + *(unsigned int *)(v17 + 4) + 12;
  unint64_t v19 = NSString;
  return (__CFString *)[v19 stringWithUTF8String:v18];
}

void _oltb_allocate_row(void *a1)
{
  uint64_t v2 = a1;
  if (!v2[40])
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v1 = v2;

  unint64_t v3 = v1;
  if (!v1[40])
  {
LABEL_17:
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v4 = v3;

  uint64_t v5 = v4[2];
  uint64_t v6 = v4[4] - v4[3];

  if (!(v6 + v5))
  {
    unint64_t v7 = v4[4];
    if (v7) {
      uint64_t v8 = v7 >> 1;
    }
    else {
      uint64_t v8 = 1024;
    }
    uint64_t v9 = v4;
    _oltb_consolidate(v9);
    uint64_t v10 = v4[3] + v8;
    unint64_t v11 = (void *)_os_trace_malloc();
    BOOL v12 = v11;
    size_t v13 = (void *)v9[1];
    if (v13)
    {
      uint64_t v14 = v4[3];
      if (v14)
      {
        memcpy(v11, v13, 104 * v14);
        size_t v13 = (void *)v9[1];
      }
    }
    free(v13);
    v9[1] = v12;
    v4[4] = v10;
  }
  uint64_t v15 = v4[2];
  if (v15)
  {
    v4[2] = v15 - 1;
LABEL_15:

    return;
  }
  unint64_t v1 = (unsigned char *)v4[3];
  if ((unint64_t)v1 < v4[4])
  {
    v4[3] = v1 + 1;
    goto LABEL_15;
  }
LABEL_18:
  qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: oltb table overflow";
  qword_1E953C318 = (uint64_t)v1;
  __break(1u);
}

uint64_t _OSLogEventUnpackChunk(int *a1, uint64_t a2, uint64_t a3)
{
  *(void *)a3 = a1;
  unint64_t v3 = (void *)(a3 + 16);
  int v4 = *a1;
  switch(*a1)
  {
    case 24577:
      unint64_t v5 = *((void *)a1 + 1);
      unint64_t v6 = v5 - 16;
      if (v5 < 0x10) {
        goto LABEL_22;
      }
      unint64_t v7 = (unsigned __int16 *)(a1 + 8);
      BOOL v8 = *((unsigned char *)a1 + 29) != 0;
      goto LABEL_16;
    case 24578:
      unint64_t v11 = *((void *)a1 + 1);
      unint64_t v6 = v11 - 32;
      if (v11 < 0x20) {
        goto LABEL_22;
      }
      BOOL v8 = 0;
      unint64_t v7 = (unsigned __int16 *)(a1 + 12);
      goto LABEL_16;
    case 24579:
      unint64_t v12 = *((void *)a1 + 1);
      unint64_t v6 = v12 - 48;
      if (v12 < 0x30) {
        goto LABEL_22;
      }
      BOOL v8 = 0;
      unint64_t v7 = (unsigned __int16 *)(a1 + 16);
      goto LABEL_16;
    case 24580:
      unint64_t v13 = *((void *)a1 + 1);
      unint64_t v6 = v13 - 72;
      if (v13 < 0x48) {
        goto LABEL_22;
      }
      BOOL v8 = 0;
      unint64_t v7 = (unsigned __int16 *)(a1 + 22);
      goto LABEL_16;
    case 24581:
    case 24582:
    case 24583:
    case 24584:
    case 24585:
    case 24586:
    case 24587:
      goto LABEL_7;
    case 24588:
      unint64_t v14 = *((void *)a1 + 1);
      unint64_t v6 = v14 - 16;
      if (v14 < 0x10) {
        goto LABEL_22;
      }
      BOOL v8 = 0;
      unint64_t v7 = (unsigned __int16 *)a1 + 15;
      goto LABEL_16;
    default:
      if (v4 != 24592)
      {
LABEL_7:
        uint64_t v10 = 0;
        *(_OWORD *)(a3 + 24) = 0u;
        *(_OWORD *)(a3 + 8) = 0u;
        return v10;
      }
      unint64_t v9 = *((void *)a1 + 1);
      unint64_t v6 = v9 - 16;
      if (v9 < 0x10) {
        goto LABEL_22;
      }
      BOOL v8 = 0;
      unint64_t v7 = (unsigned __int16 *)(a1 + 8);
LABEL_16:
      if (v6 - 4097 < 0xFFFFFFFFFFFFF00FLL) {
        goto LABEL_17;
      }
      unint64_t v15 = *v7;
      if (v6 < v15)
      {
LABEL_22:
        uint64_t v10 = 0;
        *(void *)(a3 + 8) = 0;
        *(void *)(a3 + 32) = 0;
        return v10;
      }
      uint64_t v17 = v7[1];
      if (v17 > 0xFFF) {
        goto LABEL_17;
      }
      if (!v8)
      {
        if (v6 == 4096)
        {
          void *v3 = (char *)v7 + v17;
          uint64_t v18 = (unsigned __int16)(4096 - v17);
          goto LABEL_45;
        }
LABEL_17:
        void *v3 = 0;
        *(void *)(a3 + 24) = 0;
        goto LABEL_18;
      }
      if (v6 > v15 + (unsigned __int16)(4096 - v17)) {
        goto LABEL_17;
      }
      uint64_t v18 = (unsigned __int16)(4096 - v17);
      void *v3 = (char *)v7 + v15;
LABEL_45:
      *(void *)(a3 + 24) = v18;
LABEL_18:
      *(void *)(a3 + 8) = v7;
      *(void *)(a3 + 32) = 0;
      if ((v4 - 24577) < 4)
      {
        if (a2) {
          *(void *)(a3 + 32) = _os_procinfo_map_lookup(*(void **)(a2 + 40), *((void *)a1 + 2), a1[6]);
        }
        return 1;
      }
      if (v4 == 24592)
      {
        int v16 = 0;
        goto LABEL_31;
      }
      uint64_t v10 = 0;
      if (v4 == 24588)
      {
        int v16 = *((unsigned __int8 *)a1 + 29);
LABEL_31:
        if (a2)
        {
          uint64_t v19 = *(void *)(a2 + 40);
          if (v19)
          {
            uint64_t v20 = (void *)(v19 + 16);
            while (1)
            {
              uint64_t v20 = (void *)*v20;
              if (!v20) {
                break;
              }
              if (v20[2] == *((void *)a1 + 2))
              {
                uint64_t v21 = v20[4];
                *(void *)(a3 + 32) = v21;
                if (v21) {
                  BOOL v22 = v16 == 0;
                }
                else {
                  BOOL v22 = 1;
                }
                if (!v22)
                {
                  int v23 = *(__int16 *)(v21 + 2);
                  if (v23 < 0)
                  {
                    __int16 v25 = v23 & 0x7FFF;
                    *(_WORD *)(v21 + 2) = v25;
                    if (v16 == 4) {
                      *(_WORD *)(v21 + 2) = v25 | 1;
                    }
                  }
                }
                return 1;
              }
            }
          }
        }
        return 1;
      }
      return v10;
  }
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
      BOOL v8 = *(uint64_t ***)(*result + 8 * v7);
      if (v8)
      {
        for (unint64_t i = *v8; i; unint64_t i = (uint64_t *)*i)
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

unsigned char *os_log_fmt_extract_pubdata(unsigned char *result, int a2, void *a3, unsigned __int16 *a4)
{
  *a3 = 0;
  *a4 = 0;
  if (!a2) {
    return &os_log_fmt_extract_pubdata_empty_hdr;
  }
  if (a2 == 1) {
    return 0;
  }
  uint64_t v4 = result + 2;
  unsigned __int16 v5 = a2 - 2;
  if (result[1])
  {
    int v6 = 0;
    while (v5 >= 2u)
    {
      unint64_t v7 = v4[1] + 2;
      if (v7 > v5) {
        break;
      }
      v4 += v7;
      v5 -= v7;
      if (result[1] <= (unsigned __int16)++v6) {
        goto LABEL_10;
      }
    }
    return 0;
  }
LABEL_10:
  *a3 = v4;
  *a4 = v5;
  return result;
}

uint64_t _OSLogIndexOrderForOpening(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  if ((a3 & 8) == 0)
  {
    uint64_t v7 = [v5 oldestTime];
    if (v7 != [v6 oldestTime])
    {
      unint64_t v8 = [v5 oldestTime];
      if (v8 < [v6 oldestTime]) {
        uint64_t v9 = -1;
      }
      else {
        uint64_t v9 = 1;
      }
      goto LABEL_11;
    }
LABEL_7:
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = [v5 endTime];
  if (v10 == [v6 endTime]) {
    goto LABEL_7;
  }
  unint64_t v11 = [v5 endTime];
  if (v11 > [v6 endTime]) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = 1;
  }
LABEL_11:

  return v9;
}

void sub_1A113A3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___oie_advance_cursor_open_store_block_invoke(void *a1, int *a2, uint64_t a3, uint64_t a4)
{
  int v5 = *a2;
  if (*a2 <= 24587)
  {
    if (v5 == 4096)
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    }
    else if (v5 == 24587)
    {
      if (*(void *)(*(void *)(a1[6] + 8) + 24))
      {
        unint64_t v8 = -[_OSLogEnumeratorCatalog initWithStore:index:fileHeader:range:chunk:]([_OSLogEnumeratorCatalog alloc], "initWithStore:index:fileHeader:range:chunk:", a1[4], *(void *)(a1[5] + 120), *(void *)(*(void *)(a1[6] + 8) + 24), a3, a4, a2);
        uint64_t v9 = *(void *)(a1[7] + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        if (*(void *)(*(void *)(a1[7] + 8) + 40)) {
          objc_msgSend(*(id *)(a1[5] + 24), "addObject:");
        }
      }
    }
  }
  else if ((v5 - 24588) < 2 || v5 == 24592)
  {
    if (*(void *)(*(void *)(a1[6] + 8) + 24))
    {
      uint64_t v7 = *(void **)(*(void *)(a1[7] + 8) + 40);
      if (v7) {
        objc_msgSend(v7, "unionWithRange:", a3, a4);
      }
    }
  }
  return 1;
}

void _catalog_lite_read_limits(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 22);
  unint64_t v4 = *(void *)(a1 + 8) + a1 + 16;
  if (*(_DWORD *)(a1 + 4) == 17)
  {
    uint64_t v5 = *(unsigned __int16 *)(a1 + 24);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    int v16 = (void (*)(void *))___catalog_lite_read_limits_block_invoke;
    uint64_t v17 = &__block_descriptor_56_e12_v24__0_8__16l;
    uint64_t v18 = a2;
    uint64_t v19 = a3;
    unint64_t v20 = v4;
    unint64_t v21 = a1 + v3 + 40;
    for (unint64_t i = v15; v5; --v5)
    {
      if (v4 < v21 || v4 - v21 < 0x18) {
        break;
      }
      v21 += 24;
      v16(i);
    }
  }
  else
  {
    uint64_t v8 = a1 + v3;
    uint64_t v9 = *(unsigned __int16 *)(v8 + 24);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    unint64_t v11 = ___catalog_lite_read_limits_block_invoke_2;
    unint64_t v12 = &__block_descriptor_48_e12_v24__0_8__16l;
    uint64_t v13 = a2;
    uint64_t v14 = a3;
    unint64_t v21 = v8 + 32;
    for (unint64_t i = v10; v9; --v9)
    {
      if (v4 < v21) {
        break;
      }
      if (v4 - v21 < 0x20) {
        break;
      }
      v21 += 32;
      ((void (*)(void *))v11)(i);
    }
  }
}

void *___catalog_lite_read_limits_block_invoke(void *result, uint64_t a2, unint64_t *a3)
{
  uint64_t v3 = (void *)result[4];
  if (*(void *)a2 < *v3) {
    void *v3 = *(void *)a2;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = (unint64_t *)result[5];
  if (v4 > *v5) {
    unint64_t *v5 = v4;
  }
  id v6 = (unsigned int *)(a2 + 2 * *(unsigned int *)(a2 + 24) + 28);
  unint64_t v7 = result[6];
  if ((unint64_t)v6 <= v7)
  {
    unint64_t v8 = (unint64_t)v6 + 2 * *v6 + 4;
    if (v8 <= v7)
    {
      unint64_t v7 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 & 7) == 0) {
        unint64_t v7 = v8;
      }
    }
  }
  *a3 = v7;
  return result;
}

uint64_t ___oie_advance_cursor_open_catalog_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  [v3 addObject:v4];
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:v4];

  return 1;
}

uint8_t *_tracev3_chunk_decompress(uint64_t a1, uint64_t a2, compression_algorithm *a3, size_t *a4)
{
  compression_algorithm v7 = COMPRESSION_LZ4;
  size_t v8 = 0x10000;
  if (a2)
  {
    unsigned int v9 = *(_DWORD *)(a2 + 32);
    BOOL v10 = v9 == 0;
    if (v9) {
      size_t v8 = v9;
    }
    else {
      size_t v8 = 0x10000;
    }
    if (v9) {
      compression_algorithm v7 = *(_DWORD *)(a2 + 36);
    }
    else {
      compression_algorithm v7 = COMPRESSION_LZ4;
    }
    if (!v7)
    {
      unint64_t v11 = (uint8_t *)(a1 + 16);
      size_t v12 = *(void *)(a1 + 8);
      if (!a3) {
        goto LABEL_20;
      }
LABEL_19:
      *a3 = v7;
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v10 = 1;
  }
  unint64_t v11 = (uint8_t *)_os_trace_malloc();
  size_t v13 = compression_decode_buffer(v11, v8, (const uint8_t *)(a1 + 16), *(void *)(a1 + 8), 0, v7);
  size_t v12 = v13;
  if (!v13)
  {
    free(v11);
    unint64_t v11 = 0;
LABEL_18:
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v10) {
    goto LABEL_18;
  }
  if (v13 == v8)
  {
    size_t v12 = v8;
    if (a3) {
      goto LABEL_19;
    }
  }
  else
  {
    _os_assumes_log();
    if (a3) {
      goto LABEL_19;
    }
  }
LABEL_20:
  if (a4) {
    *a4 = v12;
  }
  return v11;
}

void _oltb_consolidate(void *a1)
{
  unint64_t v1 = a1;
  if (v1[40])
  {
    size_t v13 = v1;

    for (uint64_t i = v13[2]; i; uint64_t i = v13[2])
    {
      uint64_t v3 = i - 1;
      uint64_t v4 = v13[1];
      uint64_t v5 = v4 + 104 * v3;
      uint64_t v6 = v13[3] - 1;
      v13[2] = v3;
      v13[3] = v6;
      compression_algorithm v7 = (long long *)(v4 + 104 * v6);
      uint64_t v8 = *((void *)v7 + 12);
      long long v9 = v7[3];
      long long v10 = v7[5];
      *(_OWORD *)(v5 + 64) = v7[4];
      *(_OWORD *)(v5 + 80) = v10;
      *(_OWORD *)(v5 + 48) = v9;
      long long v11 = *v7;
      long long v12 = v7[2];
      *(_OWORD *)(v5 + 16) = v7[1];
      *(_OWORD *)(v5 + 32) = v12;
      *(_OWORD *)uint64_t v5 = v11;
      *(void *)(v5 + 96) = v8;
    }
  }
  else
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
  }
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
  _os_trace_str_map_destroy(*(void *)(a1 + 24));
  uint64_t v4 = *(void ***)(a1 + 40);
  _os_procinfo_map_clear(v4, 0);
  if (v4)
  {
    uint64_t v5 = v4[2];
    if (v5)
    {
      do
      {
        uint64_t v6 = (void *)*v5;
        operator delete(v5);
        uint64_t v5 = v6;
      }
      while (v6);
    }
    compression_algorithm v7 = *v4;
    char *v4 = 0;
    if (v7) {
      operator delete(v7);
    }
    MEMORY[0x1A622CE80](v4, 0x10A0C408EF24B1CLL);
  }
  free((void *)a1);
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

void _os_trace_str_map_destroy(uint64_t a1)
{
  _os_trace_str_map_clear(a1);
  if (a1)
  {
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(*(void ***)(a1 + 16));
    uint64_t v2 = *(void **)a1;
    *(void *)a1 = 0;
    if (v2) {
      operator delete(v2);
    }
    JUMPOUT(0x1A622CE80);
  }
}

void sub_1A113BA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va2, a8);
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v14 = va_arg(va2, void);
  uint64_t v16 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

uint64_t ___os_trace_formatters_list_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcasecmp(*(const char **)(a2 + 8), *(const char **)(a3 + 8));
}

uint64_t _catalog_for_each_uuid(uint64_t result, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(result + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  uint64_t v5 = ___catalog_for_each_uuid_block_invoke;
  uint64_t v6 = &unk_1E5A41C08;
  uint64_t v7 = a2;
  for (uint64_t i = *(void **)(v2 + 16); i; uint64_t i = (void *)*i)
    __n128 result = ((uint64_t (*)(void *, void *, void))v5)(v4, i + 2, i[4]);
  return result;
}

uint64_t ___catalog_for_each_uuid_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___os_log_fdscandir_trace_block_invoke_2(uint64_t a1, const dirent **a2, const dirent **a3)
{
  int v5 = strncmp((*a2)->d_name, "logdata.Persistent.", 0x13uLL);
  int v6 = strncmp((*a3)->d_name, "logdata.Persistent.", 0x13uLL);
  if ((v5 == 0) != (v6 == 0)) {
    return (v5 != 0) - (v6 != 0);
  }
  return alphasort(a2, a3);
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
    int v6 = (uint64_t *)__p;
  }
  else {
    int v6 = (uint64_t *)__p[0];
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
  uint64_t v14 = *(unsigned __int8 ***)(*v4 + 8 * v13);
  if (!v14 || (unint64_t v15 = *v14) == 0)
  {
LABEL_26:
    uint64_t v17 = v4 + 2;
    uint64_t v18 = operator new(0x30uLL);
    *uint64_t v18 = 0;
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
        *uint64_t v18 = *v38;
      }
      else
      {
        uint64_t v39 = (void *)*v17;
        *uint64_t v18 = *v17;
        *uint64_t v17 = v18;
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
          uint64_t v26 = operator new(8 * *(void *)&prime);
          uint64_t v27 = (void *)*v4;
          uint64_t *v4 = (uint64_t)v26;
          if (v27) {
            operator delete(v27);
          }
          uint64_t v28 = 0;
          v4[1] = (uint64_t)prime;
          do
            *(void *)(*v4 + 8 * v28++) = 0;
          while (*(void *)&prime != v28);
          uint64_t v29 = (void *)*v17;
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
            uint64_t v35 = (void *)*v29;
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
                  void *v29 = *v35;
                  *uint64_t v35 = **(void **)(*v4 + 8 * v36);
                  **(void **)(*v4 + 8 * v36) = v35;
                  uint64_t v35 = v29;
                }
                unint64_t v36 = v30;
LABEL_63:
                uint64_t v29 = v35;
                uint64_t v35 = (void *)*v35;
                unint64_t v30 = v36;
              }
              while (v35);
            }
          }
          unint64_t v10 = (unint64_t)prime;
          goto LABEL_67;
        }
        int v43 = (void *)*v4;
        uint64_t *v4 = 0;
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
    unint64_t v15 = *(unsigned __int8 **)v15;
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
    unint64_t v13 = __catalog_chunk_parse_subchunk_v2_block_invoke;
    uint64_t v14 = &__block_descriptor_tmp_72;
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
    unint64_t v13 = __catalog_chunk_parse_subchunk_legacy_block_invoke;
    uint64_t v14 = &__block_descriptor_tmp_75;
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

void _timesync_range_copy()
{
  uint64_t v0 = _os_trace_zalloc();
  *(void *)uint64_t v0 = 0;
  *(_OWORD *)(v0 + 8) = xmmword_1A118ACC0;
  operator new();
}

BOOL catalog_chunk_parse_entries(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a4)
  {
    BOOL v10 = 0;
    for (unint64_t i = 0; i != a4; v10 = i >= a4)
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

uint64_t __catalog_chunk_parse_uuid_v2_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    _chunk_print_uuid(a2, (unsigned __int8 *)a3);
  }
  return 1;
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
  unint64_t v16 = operator new(0x28uLL);
  *unint64_t v16 = 0;
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
          unint64_t v23 = operator new(8 * *(void *)&prime);
          unint64_t v24 = *(void **)a1;
          *(void *)a1 = v23;
          if (v24) {
            operator delete(v24);
          }
          uint64_t v25 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v25++) = 0;
          while (*(void *)&prime != v25);
          uint64_t v26 = (void *)*((void *)a1 + 2);
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
            unint64_t v32 = (void *)*v26;
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
                  *uint64_t v26 = *v32;
                  *unint64_t v32 = **(void **)(*(void *)a1 + 8 * v33);
                  **(void **)(*(void *)a1 + 8 * v33) = v32;
                  unint64_t v32 = v26;
                }
                unint64_t v33 = v27;
LABEL_59:
                uint64_t v26 = v32;
                unint64_t v32 = (void *)*v32;
                unint64_t v27 = v33;
              }
              while (v32);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_63;
        }
        uint64_t v39 = *(void **)a1;
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
  uint64_t v34 = *(void **)a1;
  uint64_t v35 = *(void **)(*(void *)a1 + 8 * v11);
  if (v35)
  {
    *unint64_t v16 = *v35;
LABEL_76:
    *uint64_t v35 = v16;
    goto LABEL_77;
  }
  uint64_t v36 = *((void *)a1 + 2);
  *unint64_t v16 = v36;
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
    uint64_t v35 = (void *)(*(void *)a1 + 8 * v37);
    goto LABEL_76;
  }
LABEL_77:
  ++*((void *)a1 + 3);
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
  unint64_t v20 = (unsigned int **)v19;
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
      for (unint64_t i = *v15; i; unint64_t i = (uint64_t *)*i)
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
  uint64_t v19 = operator new(0x28uLL);
  *uint64_t v19 = 0;
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
          uint64_t v26 = operator new(8 * *(void *)&prime);
          uint64_t v27 = *(void **)v7;
          *(void *)uint64_t v7 = v26;
          if (v27) {
            operator delete(v27);
          }
          uint64_t v28 = 0;
          *((int8x8_t *)v7 + 1) = prime;
          do
            *(void *)(*(void *)v7 + 8 * v28++) = 0;
          while (*(void *)&prime != v28);
          long long v29 = (void *)*((void *)v7 + 2);
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
            uint64_t v35 = (void *)*v29;
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
                  void *v29 = *v35;
                  *uint64_t v35 = **(void **)(*(void *)v7 + 8 * v36);
                  **(void **)(*(void *)v7 + 8 * v36) = v35;
                  uint64_t v35 = v29;
                }
                unint64_t v36 = v30;
LABEL_61:
                long long v29 = v35;
                uint64_t v35 = (void *)*v35;
                unint64_t v30 = v36;
              }
              while (v35);
            }
          }
          unint64_t v12 = (unint64_t)prime;
          goto LABEL_65;
        }
        int v42 = *(void **)v7;
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
    *uint64_t v19 = *v38;
LABEL_78:
    *uint64_t v38 = v19;
    goto LABEL_79;
  }
  uint64_t v39 = *((void *)v7 + 2);
  *uint64_t v19 = v39;
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
      float v21 = (void *)*a1;
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
        unint64_t v24 = (unsigned __int8 *)v23;
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
  int v13 = (unsigned __int16 *)(a3 + 3);
  *a4 = (unint64_t)(a3 + 3);
  if (*(unsigned char *)(a1 + 48))
  {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n", a2, "startts", v9, "endts", v10, "uncomp sz", v11, "comp algo", v12);
    BOOL v14 = *(unsigned char *)(a1 + 48) != 0;
    int v13 = (unsigned __int16 *)*a4;
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
  BOOL v22 = (unsigned __int16 *)*a4;
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
      unint64_t v24 = (unsigned __int16 *)*a4;
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
  void *v2 = 0;
  v2[1] = v5;
  void *v5 = v2;
  *(void *)(a1 + 72) = v2;
  *(void *)(a1 + 80) = v6 + 1;
  return v2;
}

void _OSLogRemovePreferences(unsigned int a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(xdict, "operation", 3uLL);
  xpc_dictionary_set_uint64(xdict, "prefs_type", a1);
  id v4 = v3;
  uint64_t v5 = (const char *)[v4 UTF8String];

  xpc_dictionary_set_string(xdict, "prefs_name", v5);
  _OSLogPreferencesSendMessage(xdict);
}

void _OSLogInstallPreferences(unsigned int a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F98];
  id v6 = a2;
  uint64_t v7 = [v5 dataWithPropertyList:a3 format:200 options:0 error:0];
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "operation", 2uLL);
  xpc_dictionary_set_uint64(v8, "prefs_type", a1);
  id v9 = v6;
  uint64_t v10 = (const char *)[v9 UTF8String];

  xpc_dictionary_set_string(v8, "prefs_name", v10);
  id v11 = v7;
  xpc_dictionary_set_data(v8, "prefs_data", (const void *)[v11 bytes], objc_msgSend(v11, "length"));
  _OSLogPreferencesSendMessage(v8);
}

void _OSLogPreferencesSendMessage(void *a1)
{
  id v1 = a1;
  connection = xpc_connection_create_mach_service("com.apple.logd.admin", 0, 2uLL);
  xpc_connection_set_event_handler(connection, &__block_literal_global_192);
  xpc_connection_activate(connection);
  xpc_object_t v2 = xpc_connection_send_message_with_reply_sync(connection, v1);
}

uint64_t _uuidpath_pathcache_compare_nodes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), (const unsigned __int8 *)(a3 + 24));
}

char *___os_log_fdscandir_trace_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = strrchr((char *)(a2 + 21), 46);
  if (result)
  {
    if ((*(unsigned __int8 *)(a2 + 20) | 8) == 8)
    {
      id v4 = result;
      if (!strcmp(result, ".tracev3")
        || !strcmp(v4, ".log")
        || !strcmp(v4, ".txt")
        || !strcmp(v4, ".plist")
        || !strcmp(v4, ".timesync"))
      {
        return (char *)1;
      }
      else
      {
        return (char *)(strcmp(v4, ".jsonl") == 0);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void _timesync_db_close(int *a1)
{
  _timesync_munmap_file((uint64_t)a1);
  if (close(*a1) == -1)
  {
    int v2 = *__error();
    uint64_t v3 = *__error();
    if (v2 == 9)
    {
      qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1E953C318 = v3;
      __break(1u);
      return;
    }
    _os_assumes_log();
  }
  free(a1);
}

id _findOldestTimeRef(uint64_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _timesync_range_contains(a1, (void *)[v6 UUID], objc_msgSend(v6, "continuousTime"));
  if (v5)
  {
    xpc_object_t v8 = v5;
    if (v7)
    {
      int v9 = _timesync_range_compare((void **)a1, (void *)[v6 UUID], objc_msgSend(v6, "continuousTime"), objc_msgSend(v5, "UUID"), objc_msgSend(v5, "continuousTime"));
      xpc_object_t v8 = v6;
      if (v9 != -1) {
        xpc_object_t v8 = v5;
      }
    }
    goto LABEL_6;
  }
  xpc_object_t v8 = v6;
  if (v7)
  {
LABEL_6:
    id v10 = v8;
    goto LABEL_8;
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

uint64_t _timesync_db_openat(int a1, const char *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)_os_trace_zalloc();
  int v5 = openat(a1, a2, 0);
  *(_DWORD *)id v4 = v5;
  if (v5 == -1)
  {
    __error();
    _os_assumes_log();
  }
  else
  {
    uint64_t v19 = 0;
    unint64_t v20 = &v19;
    uint64_t v21 = 0x2000000000;
    int v22 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2000000000;
    uint64_t v18 = -1;
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x2000000000;
    uint64_t v14 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 0x40000000;
    void v10[2] = ___timesync_tidy_and_count_files_block_invoke;
    v10[3] = &unk_1E5A41EA8;
    v10[4] = &v19;
    v10[5] = &v15;
    v10[6] = &v11;
    _timesync_foreach_reg_file_at(v5, (uint64_t)v10);
    int v6 = *((_DWORD *)v20 + 6);
    if (v6 >= 1)
    {
      v4[1] = v16[3];
      void v4[2] = v12[3];
    }
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
    if (v6 >= 1 && (_timesync_reset((uint64_t)v4) & 0x80000000) == 0) {
      return (uint64_t)v4;
    }
  }
  int v7 = *__error();
  if ((*(_DWORD *)v4 & 0x80000000) != 0 || close(*(_DWORD *)v4) != -1)
  {
LABEL_10:
    free(v4);
    id v4 = 0;
    *__error() = v7;
    return (uint64_t)v4;
  }
  int v9 = *__error();
  uint64_t result = *__error();
  if (v9 != 9)
  {
    _os_assumes_log();
    goto LABEL_10;
  }
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = result;
  __break(1u);
  return result;
}

uint64_t _timesync_foreach_reg_file_at(int a1, uint64_t a2)
{
  int v3 = dup(a1);
  if (v3 == -1)
  {
LABEL_15:
    __error();
    return _os_assumes_log();
  }
  int v4 = v3;
  if (lseek(v3, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  int v5 = fdopendir(v4);
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = MEMORY[0x1E4F14390];
LABEL_6:
    while (1)
    {
      xpc_object_t v8 = readdir(v6);
      if (!v8) {
        break;
      }
      if ((v8->d_type | 8) == 8)
      {
        uint64_t v9 = 0;
        d_name = v8->d_name;
        while ((d_name[v9] & 0x80000000) == 0
             && (*(_DWORD *)(v7 + 4 * d_name[v9] + 60) & 0x10000) != 0)
        {
          if (++v9 == 16)
          {
            if (strcmp(&v8->d_name[16], ".timesync")
              || ((*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, d_name) & 1) != 0)
            {
              goto LABEL_6;
            }
            goto LABEL_14;
          }
        }
      }
    }
LABEL_14:
    uint64_t result = closedir(v6);
    if (result == -1) {
      goto LABEL_15;
    }
  }
  else
  {
    int v12 = *__error();
    if (close(v4) == -1)
    {
      int v13 = *__error();
      uint64_t result = *__error();
      if (v13 == 9)
      {
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log();
    }
    uint64_t result = (uint64_t)__error();
    *(_DWORD *)uint64_t result = v12;
  }
  return result;
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

uint64_t OSLogCaptureInflightBuffersToFile(int a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = OSLogLogdAdminConnection();
  int v13 = (_xpc_connection_s *)v6;
  if (a1 < 0)
  {
    uint64_t v17 = 1;
  }
  else
  {
    if (v6)
    {
      memset(&v40, 0, sizeof(v40));
      int v14 = fstat(a1, &v40);
      if (v14)
      {
        int v15 = 0;
        int v16 = 0;
      }
      else
      {
        int v15 = v40.st_mode & 0xFFF;
        int v14 = fchmod(a1, v40.st_mode & 0xFFD | 2);
        int v16 = v15;
      }
      if (v14 == -1)
      {
        __error();
        _os_assumes_log();
        int v16 = v15;
      }
      xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_fd(v18, "snapshot_file_descriptor", a1);
      xpc_dictionary_set_uint64(v18, "logd_snapshot_flags", a2);
      xpc_dictionary_set_uint64(v18, "operation", 1uLL);
      xpc_object_t v25 = xpc_connection_send_message_with_reply_sync(v13, v18);
      if (v16 && fchmod(a1, v16) == -1)
      {
        __error();
        _os_assumes_log();
        if (v25)
        {
LABEL_13:
          if (MEMORY[0x1A622E220](v25) != MEMORY[0x1E4F145A8])
          {
            int int64 = xpc_dictionary_get_int64(v25, "st");
            int v27 = int64;
            if (int64)
            {
              char v28 = strerror(int64);
              _OSLogWarningMessage(v5, "snapshot failed: %s (%d)", v29, v30, v31, v32, v33, v34, v28);
              uint64_t v17 = 0;
              *__error() = v27;
            }
            else
            {
              uint64_t v17 = 1;
            }
            goto LABEL_23;
          }
          xpc_object_t v35 = (xpc_object_t)MEMORY[0x1E4F14520];
          unint64_t v36 = __error();
          if (v25 == v35)
          {
            uint64_t v17 = 0;
            int v37 = 1;
LABEL_22:
            *unint64_t v36 = v37;
LABEL_23:

            goto LABEL_24;
          }
LABEL_21:
          uint64_t v17 = 0;
          int v37 = 2;
          goto LABEL_22;
        }
      }
      else if (v25)
      {
        goto LABEL_13;
      }
      _OSLogWarningMessage(v5, "snapshot failed: no reply from logd", v19, v20, v21, v22, v23, v24, v39);
      unint64_t v36 = __error();
      goto LABEL_21;
    }
    _OSLogWarningMessage(v5, "snapshot failed: no connection to logd", v7, v8, v9, v10, v11, v12, v39);
    uint64_t v17 = 0;
    *__error() = 2;
  }
LABEL_24:

  return v17;
}

id OSLogLogdAdminConnection()
{
  if (OSLogLogdAdminConnection_once != -1) {
    dispatch_once(&OSLogLogdAdminConnection_once, &__block_literal_global_2161);
  }
  uint64_t v0 = (void *)OSLogLogdAdminConnection_xconn;
  return v0;
}

uint64_t _enumerateArchiveIntoSource(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = a4;
  uint64_t v11 = [v8 diagnosticsDirectoryReference];
  int v12 = [v11 fileDescriptor];

  int v13 = dup(v12);
  if (v13 == -1)
  {
    __error();
    _os_assumes_log();
LABEL_23:
    char v39 = __error();
    stat v40 = _OSLogPOSIXError(11, *v39);
    v10[2](v10, 0, v40);

    uint64_t v37 = 0;
LABEL_24:

    return v37;
  }
  int v14 = v13;
  if (lseek(v13, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  int v15 = fdopendir(v14);
  if (!v15)
  {
    int v38 = *__error();
    if (close(v14) == -1)
    {
      int v41 = *__error();
      uint64_t result = *__error();
      if (v41 == 9) {
        goto LABEL_29;
      }
      _os_assumes_log();
    }
    *__error() = v38;
    goto LABEL_23;
  }
  int v16 = v15;
  int v42 = v10;
  _enumerateDirectoryIntoSource(v7, v12, v15, 0, v8, v9);
  closedir(v16);
  uint64_t v17 = 0;
  while (1)
  {
    xpc_object_t v18 = (&_enumerateArchiveIntoSource_dirs)[v17];
    int v19 = openat(v12, v18, 0x100000);
    if (v19 == -1)
    {
      uint64_t v23 = __error();
      if (v17 * 8 && *v23 == 2) {
        goto LABEL_17;
      }
      uint64_t v24 = [MEMORY[0x1E4F28F90] currentProgress];
      xpc_object_t v25 = v24;
      if (v9)
      {
        [v24 fractionCompleted];
        double v27 = v26;
        char v28 = __error();
        uint64_t v29 = _OSLogPOSIXError(18, *v28);
        (*((void (**)(id, void *, double))v9 + 2))(v9, v29, v27);
      }
      goto LABEL_16;
    }
    int v20 = v19;
    uint64_t v21 = fdopendir(v19);
    if (!v21) {
      break;
    }
    uint64_t v22 = v21;
    _enumerateDirectoryIntoSource(v7, v20, v21, v18, v8, v9);
    closedir(v22);
LABEL_17:
    v17 += 2;
    if (v17 == 8)
    {
      uint64_t v37 = 1;
      uint64_t v10 = v42;
      goto LABEL_24;
    }
  }
  uint64_t v30 = [MEMORY[0x1E4F28F90] currentProgress];
  xpc_object_t v25 = v30;
  if (v9)
  {
    [v30 fractionCompleted];
    double v32 = v31;
    uint64_t v33 = __error();
    uint64_t v34 = _OSLogPOSIXError(18, *v33);
    (*((void (**)(id, void *, double))v9 + 2))(v9, v34, v32);
  }
  if (close(v20) != -1)
  {
LABEL_16:

    goto LABEL_17;
  }
  int v35 = *__error();
  uint64_t result = *__error();
  if (v35 != 9)
  {
    _os_assumes_log();
    goto LABEL_16;
  }
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = result;
  __break(1u);
LABEL_29:
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = result;
  __break(1u);
  return result;
}

void _enumerateDirectoryIntoSource(void *a1, int a2, DIR *a3, const char *a4, void *a5, void *a6)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v31 = a1;
  id v32 = a5;
  uint64_t v10 = a6;
  uint64_t v11 = readdir(a3);
  if (v11)
  {
    int v12 = v11;
    uint64_t v29 = (void *)*MEMORY[0x1E4F28798];
    p_vtable = OSLogPersistence.vtable;
    do
    {
      d_name = (stat *)v12->d_name;
      int v15 = strrchr(v12->d_name, 46);
      if (v15 && !strcmp(v15, ".tracev3"))
      {
        int d_type = v12->d_type;
        if (!v12->d_type)
        {
          memset(&v34, 0, sizeof(v34));
          if (!fstatat(a2, v12->d_name, &v34, 0) && (v34.st_mode & 0xF000) == 0x8000) {
            v12->int d_type = 8;
          }
          int d_type = v12->d_type;
        }
        if (d_type == 8)
        {
          if (a4)
          {
            d_name = &v34;
            snprintf((char *)&v34, 0x400uLL, "%s/%s", a4, v12->d_name);
          }
          uint64_t v17 = (void *)[objc_alloc((Class)(p_vtable + 387)) initWithCollection:v32 subpath:d_name];
          xpc_object_t v18 = [_OSLogIndexFile alloc];
          id v33 = 0;
          int v19 = [(_OSLogIndexFile *)v18 initWithTraceFile:v17 error:&v33];
          id v20 = v33;
          uint64_t v21 = v20;
          if (v19)
          {
            [v31 _insertIndexFile:v19];
          }
          else
          {
            uint64_t v22 = p_vtable;
            uint64_t v23 = [v20 domain];
            BOOL v24 = v23 == v29 && [v21 code] == 34;

            p_vtable = v22;
            if (v10 && !v24)
            {
              xpc_object_t v25 = [MEMORY[0x1E4F28F90] currentProgress];
              [v25 fractionCompleted];
              double v27 = v26;
              char v28 = _OSLogInternalError(17, v21);
              v10[2](v10, v28, v27);

              p_vtable = v22;
            }
          }
        }
      }
      int v12 = readdir(a3);
    }
    while (v12);
  }
}

uint64_t _calculateTimeRefForBook(void *a1, const char *a2)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [v3 diagnosticsDirectoryReference];
  int v5 = [v4 fileDescriptor];

  int v6 = openat(v5, a2, 0);
  if (v6 == -1)
  {
    int v15 = 0;
  }
  else
  {
    int v7 = v6;
    int v8 = _os_trace_fdscandir_b();
    if (v8 >= 1)
    {
      id v9 = 0;
      uint64_t v10 = 8 * v8;
      do
      {
        uint64_t v11 = (char *)(*v9 + 21);
        int v12 = strrchr(v11, 46);
        if (v12)
        {
          if (!strcmp(v12, ".tracev3"))
          {
            uint64_t v13 = openat(v7, v11, 0);
            if (v13 != -1)
            {
              int v14 = v13;
              v22[0] = 0;
              v22[1] = 0;
              uint64_t v21 = 0;
              if (_OSLogFileFindExhaustivePoint(v13, (uint64_t)v22, (uint64_t)&v21) && *__error() == 2)
              {
                int v15 = 0;
              }
              else
              {
                int v16 = [_OSLogEventStoreTimeRef alloc];
                int v15 = [(_OSLogEventStoreTimeRef *)v16 initWithUUID:v22 continuous:v21];
              }
              if (close(v14) == -1)
              {
                int v17 = *__error();
                uint64_t v18 = *__error();
                if (v17 == 9)
                {
                  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
                  qword_1E953C318 = v18;
                  __break(1u);
                }
                _os_assumes_log();
                if (v15) {
                  goto LABEL_19;
                }
              }
              else if (v15)
              {
                goto LABEL_19;
              }
            }
          }
        }
        ++v9;
      }
      while ((void *)v10 != v9);
    }
    int v15 = 0;
LABEL_19:
    _os_trace_scandir_free_namelist();
    if (close(v7) == -1)
    {
      int v19 = *__error();
      uint64_t result = *__error();
      if (v19 == 9)
      {
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log();
    }
  }

  return (uint64_t)v15;
}

uint64_t _OSLogFileFindExhaustivePoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  size_t v18 = 0;
  int v5 = (char *)_os_trace_mmap();
  if (!v5) {
    goto LABEL_9;
  }
  size_t v6 = v18;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  uint64_t v13 = ___OSLogFileFindExhaustivePoint_block_invoke;
  int v14 = &unk_1E5A42D18;
  int v15 = &v19;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  int v7 = v12;
  unint64_t v8 = 0;
  do
  {
    if (v6 - v8 < 0x10) {
      break;
    }
    unint64_t v9 = *(void *)&v5[v8 + 8];
    if (v6 - v8 - 16 < v9) {
      break;
    }
    if (!((unsigned int (*)(void *))v13)(v7)) {
      break;
    }
    unint64_t v8 = (v8 + v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  }
  while (v8 - 1 < v6);

  munmap(v5, v18);
  uint64_t v10 = *((unsigned int *)v20 + 6);
  if (v10)
  {
    *__error() = v10;
LABEL_9:
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  _Block_object_dispose(&v19, 8);
  return v10;
}

void sub_1A1142B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _os_log_index_metadata_determine_oldest()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  _timesync_range_create_impl();
}

unint64_t _timesync_range_contains(uint64_t *a1, void *a2, unint64_t a3)
{
  int v5 = (void *)*a1;
  unint64_t result = _os_trace_uuid_map_lookup((void *)*a1, a2);
  if (result)
  {
    if (v5) {
      unint64_t v7 = v5[3];
    }
    else {
      unint64_t v7 = 0;
    }
    return result == 1 && a1[1] <= a3 || v7 == result && a1[2] >= a3 || result > 1 && v7 > result;
  }
  return result;
}

uint64_t _timesync_range_compare(void **a1, void *a2, unint64_t a3, void *a4, unint64_t a5)
{
  unint64_t v9 = *a1;
  unint64_t v10 = _os_trace_uuid_map_lookup(*a1, a2);
  if (!v10)
  {
    _os_assumes_log();
    unint64_t v9 = *a1;
  }
  unint64_t v11 = _os_trace_uuid_map_lookup(v9, a4);
  if (!v11) {
    _os_assumes_log();
  }
  if (a3 >= a5) {
    int v12 = a3 > a5;
  }
  else {
    int v12 = -1;
  }
  if (v10 <= v11) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 1;
  }
  if (v10 >= v11) {
    return v13;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

char *_timesync_range_intersect(char *result, void *a2, unint64_t a3, void *a4, unint64_t a5)
{
  unint64_t v8 = result;
  unint64_t v9 = *(void ***)result;
  if (*(void *)result)
  {
    unint64_t v10 = (char *)v9[3];
    if (!a2) {
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v10 = 0;
    if (!a2)
    {
LABEL_10:
      unint64_t v11 = 0;
      goto LABEL_11;
    }
  }
  unint64_t result = (char *)_os_trace_uuid_map_lookup(*(void **)result, a2);
  if (!result) {
    goto LABEL_10;
  }
  unint64_t v11 = result - 1;
  if (result == (char *)1 && *((void *)v8 + 1) > a3) {
    a3 = *((void *)v8 + 1);
  }
  *((void *)v8 + 1) = a3;
LABEL_11:
  int v12 = v10;
  if (a4)
  {
    unint64_t result = (char *)_os_trace_uuid_map_lookup(v9, a4);
    int v12 = v10;
    if (result)
    {
      if (v10 == result && *((void *)v8 + 2) < a5) {
        a5 = *((void *)v8 + 2);
      }
      *((void *)v8 + 2) = a5;
      int v12 = result;
    }
  }
  if (v11 || v12 != v10)
  {
    if (v12 > v11)
    {
      if (v11) {
        memmove(v8 + 24, &v8[16 * (void)v11 + 24], 16 * (v12 - v11));
      }
      _os_trace_uuid_map_destroy(v9);
      operator new();
    }
    if (v9) {
      size_t v13 = 16 * (void)v9[3];
    }
    else {
      size_t v13 = 0;
    }
    *((void *)v8 + 1) = 0;
    *((void *)v8 + 2) = 0;
    bzero(v8 + 24, v13);
    return (char *)_os_trace_uuid_map_clear(v9);
  }
  return result;
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

void _timesync_range_create_impl()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = _os_trace_zalloc();
  *(void *)uint64_t v0 = 0;
  *(_OWORD *)(v0 + 8) = xmmword_1A118ACC0;
  operator new();
}

uint64_t _timesync_advance(uint64_t result)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(unsigned __int16 **)(result + 48);
  if (!v1) {
    return result;
  }
  int v2 = (void *)result;
  if (*v1 == 48048)
  {
    _timesync_process_boot_entry(result);
    id v3 = (unsigned __int16 *)v2[6];
  }
  else
  {
    long long v4 = *(_OWORD *)v1;
    *(_OWORD *)(result + 120) = *((_OWORD *)v1 + 1);
    *(_OWORD *)(result + 104) = v4;
    id v3 = v1;
  }
  v8[0] = v2[4] - (void)v3 + v2[5];
  while (1)
  {
    unint64_t result = (uint64_t)_timesync_next_entry(v1, v8);
    uint64_t v1 = (unsigned __int16 *)result;
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
  unint64_t result = _timesync_munmap_file((uint64_t)v2);
  unint64_t v5 = v2[2];
  unint64_t v6 = v2[3] + 1;
  v2[3] = v6;
  if (v6 <= v5)
  {
    unint64_t result = _timesync_mmap_file(v2);
    if ((result & 0x80000000) == 0)
    {
      uint64_t v1 = (unsigned __int16 *)v2[6];
      v8[0] = v2[4];
      if (!v1) {
        goto LABEL_17;
      }
      goto LABEL_10;
    }
  }
  uint64_t v1 = 0;
LABEL_17:
  v2[6] = v1;
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
  unint64_t v5 = (char *)a1 + v3;
  if (v4 >= 1) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t _os_trace_uuid_map_lookup(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (v2)
  {
    uint64_t v3 = a2[1];
    uint64_t v4 = __ROR8__(v3 + 16, 16);
    unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v4)));
    unint64_t v6 = (0x9DDFEA08EB382D69 * (v5 ^ (v5 >> 47))) ^ v3;
    uint8x8_t v7 = (uint8x8_t)vcnt_s8(v2);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = v6;
      if (v6 >= *(void *)&v2) {
        unint64_t v8 = v6 % *(void *)&v2;
      }
    }
    else
    {
      unint64_t v8 = v6 & (*(void *)&v2 - 1);
    }
    unint64_t v9 = *(void **)(*a1 + 8 * v8);
    if (v9)
    {
      for (unint64_t i = (void *)*v9; i; unint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v6 == v11)
        {
          if (i[2] == *a2 && i[3] == v3) {
            return i[4];
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= *(void *)&v2) {
              v11 %= *(void *)&v2;
            }
          }
          else
          {
            v11 &= *(void *)&v2 - 1;
          }
          if (v11 != v8) {
            return 0;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t _timesync_process_boot_entry(uint64_t result)
{
  uint64_t v1 = *(long long **)(result + 48);
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
  unint64_t result = _os_crash();
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
    void *v3 = 0;
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

__n128 ___timesync_range_create_impl_block_invoke_2(uint64_t a1, __n128 *a2, uint64_t a3)
{
  __n128 result = *a2;
  *(__n128 *)(*(void *)(a1 + 32) + 16 * a3 + 8) = *a2;
  return result;
}

BOOL ___timesync_range_create_impl_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return *(void *)(a1 + 32) >= a3;
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

void _os_trace_formatters_list()
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  size_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  unint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = 0;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v0 = getenv("OS_ACTIVITY_FORMATTER");
  if (!v0 || strcmp(v0, "disable"))
  {
    uint64_t v1 = 0;
    char v2 = 1;
    do
    {
      char v3 = v2;
      uint64_t v4 = opendir((&plugin_dirs)[2 * v1]);
      uint64_t v5 = v4;
      if (v4)
      {
        for (unint64_t i = readdir(v4); i; unint64_t i = readdir(v5))
        {
          if (i->d_type == 8)
          {
            uint64_t v7 = _os_trace_formatter_record(v18[3], i->d_name, v1, v14 + 3, v10 + 3);
            v18[3] = v7;
          }
        }
        closedir(v5);
      }
      char v2 = 0;
      uint64_t v1 = 1;
    }
    while ((v3 & 1) != 0);
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    if (_dyld_get_shared_cache_uuid()) {
      dyld_shared_cache_iterate_text();
    }
    qsort_b((void *)v18[3], v14[3], 0x28uLL, &__block_literal_global_63);
    uint64_t v8 = v14[3];
    _formatters = v18[3];
    qword_1EB4FD180 = v8;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_1A1144630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

uint64_t _os_trace_formatter_record(uint64_t a1, char *__s1, uint64_t a3, uint64_t *a4, void *a5)
{
  if (!strncmp(__s1, "liblog_", 7uLL) && !strchr(__s1, 47))
  {
    uint64_t v11 = strrchr(__s1, 46);
    if (v11)
    {
      uint64_t v12 = v11;
      if (!strcmp(v11, ".dylib"))
      {
        uint64_t v13 = strndup(__s1 + 7, v12 - (__s1 + 7));
        uint64_t v14 = *a4;
        if (*a4)
        {
          uint64_t v15 = 8;
          uint64_t v16 = *a4;
          while (strcasecmp(*(const char **)(a1 + v15), v13))
          {
            v15 += 40;
            if (!--v16) {
              goto LABEL_10;
            }
          }
          free(v13);
        }
        else
        {
LABEL_10:
          if (v14 == *a5)
          {
            *a5 = v14 + 8;
            a1 = _os_trace_realloc();
            uint64_t v14 = *a4;
          }
          *a4 = v14 + 1;
          uint64_t v17 = (void *)(a1 + 40 * v14);
          *uint64_t v17 = 0;
          v17[1] = v13;
          v17[3] = 0;
          v17[4] = 0;
          v17[2] = a3;
        }
      }
    }
  }
  return a1;
}

uint64_t ___uuidpath_pathcache_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_uuidpath_pathcache_key, (void (__cdecl *)(void *))_uuidpath_pathcache_free);
}

uint64_t ___uuidpath_headercache_lookup_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&headercache_key, (void (__cdecl *)(void *))_uuidpath_headercache_free);
}

void sub_1A1144F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

id _OSLogGetSimplePredicate(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = a1;
  uint64_t v11 = [[_OSLogSimplePredicate alloc] initWithPredicate:v10 supportedKeys:v9 supportedOperators:v8 supportedCompoundTypes:v7];

  uint64_t v12 = [(_OSLogSimplePredicate *)v11 predicate];

  return v12;
}

void _invalidate(void *a1, uint64_t a2, void *a3)
{
  id v8 = a1;
  id v5 = a3;
  [v8 setInvalidated:1];
  unint64_t v6 = [v8 invalidationHandler];

  if (v6)
  {
    id v7 = [v8 invalidationHandler];
    ((void (**)(void, uint64_t, id))v7)[2](v7, a2, v5);

    [v8 setInvalidationHandler:0];
  }
}

uint64_t _os_activity_map_destroy(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void **)result;
    char v2 = *(void **)(result + 16);
    if (v2)
    {
      do
      {
        char v3 = (void *)*v2;
        operator delete(v2);
        char v2 = v3;
      }
      while (v3);
    }
    uint64_t v4 = *v1;
    long long *v1 = 0;
    if (v4) {
      operator delete(v4);
    }
    JUMPOUT(0x1A622CE80);
  }
  return result;
}

void *_os_trace_load_formatter(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  snprintf(__str, 0x400uLL, "%sliblog_%s.dylib", (&plugin_dirs)[2 * *(void *)(a1 + 16)], *(const char **)(a1 + 8));
  __n128 result = dlopen(__str, 6);
  *(void *)(a1 + 16) = result;
  if (result)
  {
    *(void *)(a1 + 24) = dlsym(result, "OSLogCopyFormattedString");
    __n128 result = dlsym(*(void **)(a1 + 16), "OSStateCreateStringWithData");
    *(void *)(a1 + 32) = result;
  }
  return result;
}

id _index_log()
{
  if (_index_log_o != -1) {
    dispatch_once(&_index_log_o, &__block_literal_global_435);
  }
  uint64_t v0 = (void *)_index_log_h;
  return v0;
}

Class __os_log_fmt_object_for_data_block_invoke()
{
  os_log_fmt_object_for_data__NSString = (uint64_t)objc_getClass("NSString");
  os_log_fmt_object_for_data__NSNumber = (uint64_t)objc_getClass("NSNumber");
  Class result = objc_getClass("NSData");
  os_log_fmt_object_for_data__NSData = (uint64_t)result;
  return result;
}

void __OSLogLogdAdminConnection_block_invoke()
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.logd.admin", 0, 2uLL);
  uint64_t v1 = (void *)OSLogLogdAdminConnection_xconn;
  OSLogLogdAdminConnection_xconn = (uint64_t)mach_service;

  if (OSLogLogdAdminConnection_xconn)
  {
    xpc_connection_set_event_handler((xpc_connection_t)OSLogLogdAdminConnection_xconn, &__block_literal_global_62);
    char v2 = (_xpc_connection_s *)OSLogLogdAdminConnection_xconn;
    xpc_connection_activate(v2);
  }
}

void ___index_log_block_invoke()
{
  uint64_t v0 = getenv("INDEX_SIGNPOSTS");
  if (v0 && !strcmp(v0, "1"))
  {
    os_log_t v1 = os_log_create("com.apple.loggingsupport", "Index");
  }
  else
  {
    os_log_t v1 = (os_log_t)MEMORY[0x1E4F14508];
    id v2 = MEMORY[0x1E4F14508];
  }
  char v3 = (void *)_index_log_h;
  _index_log_h = (uint64_t)v1;
}

uint64_t _catalog_uuid_add(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  return _os_trace_uuid_map_insert((float *)v2, a2, v3);
}

unsigned int *_catalog_procinfo_for_each_uuidinfo(uint64_t a1, uint64_t a2)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int **)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  void v4[2] = ___catalog_procinfo_for_each_uuidinfo_block_invoke;
  v4[3] = &unk_1E5A41C30;
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
    id v5 = (void *)(*(void *)(v3 + 16)
                  + 8
                  * (((unsigned int (**)(void *))hash_fn_array)[*(unsigned __int8 *)(v3 + 8)](v10)
                   % *(_DWORD *)v3));
    uint64_t v6 = (unsigned int (*)(void, void *))hashkey_compare_array[*(unsigned __int8 *)(v3 + 8)];
    while (1)
    {
      uint64_t v7 = v5;
      id v5 = (void *)*v5;
      if (!v5) {
        break;
      }
      if (v6(v5[1], v10))
      {
        void *v7 = *v5;
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
  id v5 = _os_procinfo_map_lookup(*(void **)(a1 + 40), *(void *)(a2 + 8), *(_DWORD *)(a2 + 16));
  if (v5) {
    return (uint64_t)v5;
  }
  uint64_t v6 = _os_trace_calloc();
  id v5 = (void *)v6;
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a2;
  long long v7 = *(_OWORD *)(a2 + 16);
  long long v8 = *(_OWORD *)(a2 + 32);
  long long v9 = *(_OWORD *)(a2 + 48);
  *(void *)(v6 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(v6 + 32) = v8;
  *(_OWORD *)(v6 + 48) = v9;
  *(_OWORD *)(v6 + 16) = v7;
  id v10 = *v4;
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

uint64_t ___catalog_for_each_procinfo_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *_catalog_subchunk_update_times(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 80)) {
    uint64_t result = **(void ***)(*(void *)(a1 + 72) + 8);
  }
  else {
    uint64_t result = _catalog_subchunk_entry_alloc(a1);
  }
  if (result[2] > a2) {
    result[2] = a2;
  }
  if (result[3] < a2) {
    result[3] = a2;
  }
  return result;
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
    id v5 = (int *)v4[6];
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
  uint64_t v0 = (void *)_os_trace_calloc();
  v0[8] = 0;
  v0[9] = v0 + 8;
  v0[1] = -1;
  operator new();
}

uint64_t _catalog_update_earliest_fhbuf_ts(uint64_t result, unint64_t a2)
{
  if (*(void *)(result + 8) > a2) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

uint64_t __catalog_chunk_parse_uuid_legacy_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    _chunk_print_uuid(a2, (unsigned __int8 *)a3);
  }
  return 1;
}

uint64_t __catalog_chunk_parse_procinfo_legacy_block_invoke(uint64_t a1, unint64_t a2, unsigned __int16 *a3, unsigned __int16 **a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v8)
  {
    long long v9 = (void *)(v8 + 16);
    while (1)
    {
      long long v9 = (void *)*v9;
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

uint64_t __catalog_chunk_parse_subchunk_legacy_block_invoke(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v8 = _catalog_subchunk_entry_alloc(*(void *)(a1 + 32));
  uint64_t v9 = *a3;
  uint64_t v10 = a3[1];
  void v8[2] = *a3;
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

__n128 __catalog_chunk_unparse_uuid_block_invoke(uint64_t a1, __n128 *a2, unsigned __int16 a3)
{
  __n128 result = *a2;
  *(__n128 *)(**(void **)(a1 + 32) + 16 * a3) = *a2;
  return result;
}

char *__catalog_chunk_unparse_subsystem_block_invoke(uint64_t a1, const char *a2, unsigned __int16 a3)
{
  if ((unint64_t)a3 >= *(void *)(*(void *)(a1 + 32) + 32))
  {
    _os_assert_log();
    __n128 result = (char *)_os_crash();
    __break(1u);
  }
  else
  {
    long long v3 = (char *)(**(void **)(a1 + 40) + a3);
    return strcpy(v3, a2);
  }
  return result;
}

void __catalog_chunk_unparse_procinfo_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = _os_trace_uuid_map_lookup(*(void **)(a1[4] + 16), (void *)(a2 + 24));
  if (v4 >= 0x10000)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  __int16 v5 = v4;
  if (uuid_is_null((const unsigned __int8 *)(a2 + 40)))
  {
    LOWORD(v6) = -1;
    goto LABEL_5;
  }
  unint64_t v6 = _os_trace_uuid_map_lookup(*(void **)(a1[4] + 16), (void *)(a2 + 40));
  if (v6 >= 0x10000)
  {
LABEL_11:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
LABEL_5:
  long long v7 = (uint64_t *)a1[5];
  uint64_t v8 = *v7;
  uint64_t v9 = *(void *)(a2 + 8);
  int v10 = *(_DWORD *)(a2 + 4);
  int v11 = *(_DWORD *)(a2 + 16);
  unsigned int v12 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)uint64_t v8 = *(_DWORD *)a2;
  *(_WORD *)(v8 + 4) = v5;
  *(_WORD *)(v8 + 6) = v6;
  *(void *)(v8 + 8) = v9;
  *(_DWORD *)(v8 + 16) = v11;
  *(_DWORD *)(v8 + 20) = v10;
  *(void *)(v8 + 24) = v12;
  uint64_t *v7 = v8 + 32;
  unint64_t v13 = (void **)a1[5];
  uint64_t v14 = a1[6];
  BOOL v15 = (void **)a1[4];
  uint64_t v16 = *v13;
  if ((unint64_t)(v14 - (void)*v13) >= 8)
  {
    *uint64_t v16 = *(unsigned int *)(*(void *)(a2 + 56) + 4);
    *unint64_t v13 = v16 + 1;
    unint64_t v17 = *(unsigned int **)(a2 + 56);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 0x40000000;
    unint64_t v23 = __catalog_chunk_unparse_procinfo_uuidinfo_block_invoke;
    BOOL v24 = &__block_descriptor_tmp_80;
    uint64_t v25 = v15;
    double v26 = v13;
    hashtable_iterate(v17, (uint64_t)&v21);
    unint64_t v13 = (void **)a1[5];
    uint64_t v14 = a1[6];
    BOOL v15 = (void **)a1[4];
  }
  uint64_t v18 = *v13;
  if ((unint64_t)(v14 - (void)*v13) >= 8)
  {
    *uint64_t v18 = *(unsigned int *)(*(void *)(a2 + 64) + 4);
    *unint64_t v13 = v18 + 1;
    uint64_t v19 = *(unsigned int **)(a2 + 64);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 0x40000000;
    unint64_t v23 = __catalog_chunk_unparse_procinfo_subsystem_block_invoke;
    BOOL v24 = &__block_descriptor_tmp_81;
    uint64_t v25 = v13;
    double v26 = v15;
    hashtable_iterate(v19, (uint64_t)&v21);
    unint64_t v13 = (void **)a1[5];
  }
  size_t v20 = (((unint64_t)*v13 + 7) & 0xFFFFFFFFFFFFFFF8) - (void)*v13;
  bzero(*v13, v20);
  *(void *)a1[5] += v20;
}

uint64_t __catalog_chunk_unparse_subchunk_procinfos_block_invoke(uint64_t result, _WORD *a2)
{
  uint64_t v2 = *(_WORD ***)(result + 32);
  long long v3 = *v2;
  _WORD *v3 = *a2;
  void *v2 = v3 + 1;
  return result;
}

uint64_t __catalog_chunk_unparse_subchunk_subcats_block_invoke(uint64_t result, _WORD *a2)
{
  uint64_t v2 = *(_WORD ***)(result + 32);
  long long v3 = *v2;
  _WORD *v3 = *a2;
  void *v2 = v3 + 1;
  return result;
}

unint64_t __catalog_chunk_unparse_procinfo_uuidinfo_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t result = _os_trace_uuid_map_lookup(*(void **)(*(void *)(a1 + 32) + 16), a3 + 2);
  unint64_t v6 = result;
  if (result >= 0x10000) {
    unint64_t result = _os_assumes_log();
  }
  long long v7 = **(void ***)(a1 + 40);
  uint64_t v8 = *a3;
  v7[1] = *((unsigned __int16 *)v7 + 4) | (unint64_t)(*a3 << 16);
  void *v7 = a3[1];
  if (v6 >= 0x10000)
  {
    _os_assert_log();
    unint64_t result = _os_crash();
    __break(1u);
  }
  else
  {
    v7[1] = (v8 << 16) | (unsigned __int16)v6;
    **(void **)(a1 + 40) += 16;
  }
  return result;
}

unint64_t __catalog_chunk_unparse_procinfo_subsystem_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = **(_WORD ***)(a1 + 32);
  _WORD *v5 = *(_WORD *)a3;
  unint64_t v6 = *(char **)(a3 + 8);
  if (!v6 || !*(void *)(a3 + 16))
  {
    _os_assumes_log();
    unint64_t v6 = *(char **)(a3 + 8);
  }
  long long v7 = _os_trace_str_map_lookup(*(void **)(*(void *)(a1 + 40) + 24), v6);
  __int16 v8 = (__int16)v7;
  if ((unint64_t)v7 >= 0x10000) {
    _os_assumes_log();
  }
  v5[1] = v8;
  unint64_t result = (unint64_t)_os_trace_str_map_lookup(*(void **)(*(void *)(a1 + 40) + 24), *(char **)(a3 + 16));
  __int16 v10 = result;
  if (result >= 0x10000) {
    unint64_t result = _os_assumes_log();
  }
  v5[2] = v10;
  **(void **)(a1 + 32) += 6;
  return result;
}

void _tracev3_chunk_decompress_and_enumerate_chunks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = 0xAAAAAAAAAAAAAAAALL;
  int v8 = -1431655766;
  unint64_t v4 = _tracev3_chunk_decompress(a1, a2, (compression_algorithm *)&v8, v9);
  if (v4)
  {
    unint64_t v5 = 0;
    unint64_t v6 = v9[0];
    do
    {
      if (v6 - v5 < 0x10) {
        break;
      }
      unint64_t v7 = *(void *)&v4[v5 + 8];
      if (v6 - v5 - 16 < v7) {
        break;
      }
      if (!(*(unsigned int (**)(uint64_t))(a3 + 16))(a3)) {
        break;
      }
      unint64_t v5 = (v5 + v7 + 23) & 0xFFFFFFFFFFFFFFF8;
    }
    while (v5 - 1 < v6);
  }
  if (v8) {
    free(v4);
  }
}

void _os_activity_map_insert(float **a1, unint64_t a2, uint64_t a3)
{
  unint64_t v5 = *a1;
  if (!*a1) {
    operator new();
  }
  unint64_t v6 = *((void *)v5 + 1);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = a2;
      if (v6 <= a2) {
        unint64_t v8 = a2 % v6;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & a2;
    }
    uint64_t v9 = *(void **)(*(void *)v5 + 8 * v8);
    if (v9)
    {
      for (unint64_t i = (void *)*v9; i; unint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == a2)
        {
          if (i[2] == a2) {
            return;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= v6) {
              v11 %= v6;
            }
          }
          else
          {
            v11 &= v6 - 1;
          }
          if (v11 != v8) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  }
  unsigned int v12 = operator new(0x20uLL);
  void *v12 = 0;
  v12[1] = a2;
  void v12[2] = a2;
  v12[3] = a3;
  float v13 = (float)(unint64_t)(*((void *)v5 + 3) + 1);
  float v14 = v5[8];
  if (!v6 || (float)(v14 * (float)v6) < v13)
  {
    BOOL v15 = 1;
    if (v6 >= 3) {
      BOOL v15 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v6);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      int8x8_t prime = (int8x8_t)v17;
    }
    else {
      int8x8_t prime = (int8x8_t)v16;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v6 = *((void *)v5 + 1);
    if (*(void *)&prime > v6) {
      goto LABEL_32;
    }
    if (*(void *)&prime < v6)
    {
      unint64_t v25 = vcvtps_u32_f32((float)*((unint64_t *)v5 + 3) / v5[8]);
      if (v6 < 3 || (uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
      {
        unint64_t v25 = std::__next_prime(v25);
      }
      else
      {
        uint64_t v27 = 1 << -(char)__clz(v25 - 1);
        if (v25 >= 2) {
          unint64_t v25 = v27;
        }
      }
      if (*(void *)&prime <= v25) {
        int8x8_t prime = (int8x8_t)v25;
      }
      if (*(void *)&prime >= v6)
      {
        unint64_t v6 = *((void *)v5 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v19 = operator new(8 * *(void *)&prime);
          size_t v20 = *(void **)v5;
          *(void *)unint64_t v5 = v19;
          if (v20) {
            operator delete(v20);
          }
          uint64_t v21 = 0;
          *((int8x8_t *)v5 + 1) = prime;
          do
            *(void *)(*(void *)v5 + 8 * v21++) = 0;
          while (*(void *)&prime != v21);
          uint64_t v22 = (void *)*((void *)v5 + 2);
          if (v22)
          {
            unint64_t v23 = v22[1];
            uint8x8_t v24 = (uint8x8_t)vcnt_s8(prime);
            v24.i16[0] = vaddlv_u8(v24);
            if (v24.u32[0] > 1uLL)
            {
              if (v23 >= *(void *)&prime) {
                v23 %= *(void *)&prime;
              }
            }
            else
            {
              v23 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)v5 + 8 * v23) = v5 + 4;
            uint64_t v28 = (void *)*v22;
            if (*v22)
            {
              do
              {
                unint64_t v29 = v28[1];
                if (v24.u32[0] > 1uLL)
                {
                  if (v29 >= *(void *)&prime) {
                    v29 %= *(void *)&prime;
                  }
                }
                else
                {
                  v29 &= *(void *)&prime - 1;
                }
                if (v29 != v23)
                {
                  if (!*(void *)(*(void *)v5 + 8 * v29))
                  {
                    *(void *)(*(void *)v5 + 8 * v29) = v22;
                    goto LABEL_57;
                  }
                  *uint64_t v22 = *v28;
                  *uint64_t v28 = **(void **)(*(void *)v5 + 8 * v29);
                  **(void **)(*(void *)v5 + 8 * v29) = v28;
                  uint64_t v28 = v22;
                }
                unint64_t v29 = v23;
LABEL_57:
                uint64_t v22 = v28;
                uint64_t v28 = (void *)*v28;
                unint64_t v23 = v29;
              }
              while (v28);
            }
          }
          unint64_t v6 = (unint64_t)prime;
          goto LABEL_61;
        }
        stat v34 = *(void **)v5;
        *(void *)unint64_t v5 = 0;
        if (v34) {
          operator delete(v34);
        }
        unint64_t v6 = 0;
        *((void *)v5 + 1) = 0;
      }
    }
LABEL_61:
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= a2) {
        unint64_t v8 = a2 % v6;
      }
      else {
        unint64_t v8 = a2;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & a2;
    }
  }
  long long v30 = *(void **)v5;
  id v31 = *(void **)(*(void *)v5 + 8 * v8);
  if (v31)
  {
    void *v12 = *v31;
LABEL_74:
    *id v31 = v12;
    goto LABEL_75;
  }
  uint64_t v32 = *((void *)v5 + 2);
  void *v12 = v32;
  *((void *)v5 + 2) = v12;
  v30[v8] = v5 + 4;
  if (v32)
  {
    unint64_t v33 = *(void *)(v32 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v33 >= v6) {
        v33 %= v6;
      }
    }
    else
    {
      v33 &= v6 - 1;
    }
    id v31 = (void *)(*(void *)v5 + 8 * v33);
    goto LABEL_74;
  }
LABEL_75:
  ++*((void *)v5 + 3);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void *_os_trace_str_map_lookup(void *result, char *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    std::string::basic_string[abi:nn180100]<0>(__p, a2);
    long long v3 = std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>(v2, (uint64_t)__p);
    unint64_t v4 = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      if (v4) {
        return (void *)*((void *)v4 + 5);
      }
    }
    else if (v3)
    {
      return (void *)*((void *)v4 + 5);
    }
    return 0;
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
      uint64_t result = _os_trace_prefsdir_path();
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t ___timesync_convert_tracev3_block_invoke(uint64_t a1, unsigned __int8 *src)
{
  if (*(_DWORD *)src == 4096 && *((void *)src + 1) >= 0xA8uLL)
  {
    long long v3 = *(void **)(a1 + 32);
    if (*(void *)((char *)v3 + 4) != *((void *)src + 18) || *(void *)((char *)v3 + 12) != *((void *)src + 19))
    {
      unint64_t v4 = v3[4];
      unint64_t v5 = v3[5];
      uint64_t v6 = v3[3];
      if (v4 >= v5)
      {
        uint64_t v7 = 2 * v5;
        uint64_t v6 = _os_trace_realloc();
        v3[3] = v6;
        v3[5] = v7;
        unint64_t v4 = v3[4];
      }
      v3[4] = v4 + 1;
      uint64_t v8 = v6 + (v4 << 6);
      uint64_t v9 = *((void *)src + 4);
      int v10 = *((_DWORD *)src + 10);
      uint64_t v11 = *((void *)src + 2);
      uint64_t v12 = *((void *)src + 8);
      uint64_t v13 = *(void *)(src + 44);
      *(void *)uint64_t v8 = 0;
      *(void *)(v8 + 8) = 0;
      *(void *)(v8 + 16) = 0;
      *(void *)(v8 + 24) = v9;
      *(_DWORD *)(v8 + 32) = v10;
      *(void *)(v8 + 40) = v13;
      *(void *)(v8 + 48) = v11;
      *(void *)(v8 + 56) = v12;
      uuid_copy((unsigned __int8 *)(v3[3] + (v4 << 6) + 8), src + 144);
    }
  }
  return 1;
}

uint64_t ___timesync_converter_close_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (*a2 == *a3)
  {
    unint64_t v3 = a2[7];
    unint64_t v4 = a3[7];
    BOOL v5 = v3 == v4;
    if (v3 < v4) {
      unsigned int v6 = -1;
    }
    else {
      unsigned int v6 = 1;
    }
    if (v5) {
      return 0;
    }
    else {
      return v6;
    }
  }
  else if (*a2 < *a3)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 1;
  }
}

uint64_t ___timesync_converter_close_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a3 + 24);
  if (v3 == v4)
  {
    int v5 = *(_DWORD *)(a2 + 32);
    int v6 = *(_DWORD *)(a3 + 32);
    BOOL v7 = v5 == v6;
    if (v5 < v6) {
      unsigned int v8 = -1;
    }
    else {
      unsigned int v8 = 1;
    }
    if (v7) {
      return 0;
    }
    else {
      return v8;
    }
  }
  else if (v3 < v4)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 1;
  }
}

uint64_t _timesync_validate(uint64_t a1, uint64_t a2, unint64_t *a3, void *a4)
{
  int v6 = (char *)_os_trace_mmap_at();
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
    int v10 = &v6[i];
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
      int v10 = &v7[v8];
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
          BOOL v15 = &v7[v8];
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
              qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
              qword_1E953C318 = result;
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
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = result;
  __break(1u);
  return result;
}

uint64_t _timesync_db_open(const char *a1)
{
  return _timesync_db_openat(-2, a1);
}

uint64_t _timesync_db_dup(int *a1)
{
  return _timesync_db_openat(*a1, ".");
}

uint64_t _timesync_mach_timebase(uint64_t result, void *a2)
{
  *a2 = *(void *)(result + 80);
  return result;
}

unint64_t _timesync_wall_time_to_continuous(uint64_t a1, unint64_t a2, unint64_t a3, _OWORD *a4)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  *a4 = *(_OWORD *)_timesync_range_find_startboot(a1, a2, a3, v5);
  return v5[0];
}

void _timesync_range_create()
{
}

void _timesync_range_create_true_max()
{
}

void _timesync_range_create_since_last_boot()
{
  uint64_t v0 = _os_trace_zalloc();
  *(void *)uint64_t v0 = 0;
  *(_OWORD *)(v0 + 8) = xmmword_1A118ACC0;
  operator new();
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
  *(_OWORD *)uint64_t v3 = xmmword_1A118ADB0;
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

uint64_t _os_trace_uuiddb_get_path(const char *a1, uint64_t a2, int a3, char *__str)
{
  if (!a1)
  {
    if (_os_trace_shared_paths_init_once != -1) {
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    }
    a1 = (const char *)_os_trace_uuidtext_path;
  }
  int v7 = snprintf(__str, 0x400uLL, "%s/", a1);
  return _os_trace_uuiddb_get_pathsuffix(a2, a3, &__str[v7], 1024 - v7);
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
    _os_trace_uuiddb_get_pathsuffix(a2, a3, &__b[v6], 1024 - v6);
    return access(__b, 0) == 0;
  }
  if (_os_trace_uuiddb_path_sandbox_can_read_data_once != -1) {
    dispatch_once(&_os_trace_uuiddb_path_sandbox_can_read_data_once, &__block_literal_global_94);
  }
  if (_os_trace_uuiddb_path_sandbox_can_read_data_can_read)
  {
    memset(__b, 170, sizeof(__b));
    _os_trace_uuiddb_get_path(0, a2, a3, __b);
    return access(__b, 0) == 0;
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
    int v10 = result;
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    v29[0] = 0xAAAAAAAAAAAAAAAALL;
    v29[1] = 0xAAAAAAAAAAAAAAAALL;
    unsigned int v11 = fts_read(v10);
    if (v11)
    {
      unsigned int v12 = v11;
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
                int v25 = v24 > 0x36 ? -1 : dword_1A118ADC0[v24];
                unsigned int v26 = v12->fts_name[1] - 48;
                int v27 = v26 > 0x36 ? -1 : dword_1A118ADC0[v26];
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
            qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: unexpected fts entry";
            qword_1E953C318 = fts_info;
            __break(1u);
            return result;
        }
        while (1)
        {
          unsigned int v19 = v12->fts_name[v17] - 48;
          int v20 = v19 > 0x36 ? -1 : dword_1A118ADC0[v19];
          unsigned int v21 = v12->fts_name[v17 + 1] - 48;
          int v22 = v21 > 0x36 ? -1 : dword_1A118ADC0[v21];
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
        unsigned int v12 = fts_read(v10);
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

uint64_t *_os_trace_uuiddb_get_dsc_map_fd(uint64_t a1, __n128 *a2)
{
  return _os_trace_uuiddb_get_dsc_map_impl(a1, 0, a2, 1);
}

void _os_trace_uuiddb_dsc_map_destroy(uint64_t a1)
{
  uint64_t v2 = *(_WORD **)(a1 + 8);
  if (v2[2] == 1)
  {
    free(*(void **)(a1 + 16));
    free(*(void **)(a1 + 24));
    uint64_t v2 = *(_WORD **)(a1 + 8);
  }
  if (munmap(v2, *(unsigned int *)(a1 + 48)) == -1)
  {
    __error();
    _os_assumes_log();
  }
  free((void *)a1);
}

void _os_trace_uuiddb_dsc_run_block_on_map(char *a1, __n128 *a2, uint64_t a3)
{
  int v5 = a1;
  if (!a1)
  {
    if (_os_trace_shared_paths_init_once != -1) {
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    }
    int v5 = (char *)_os_trace_uuidtext_path;
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
      qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1E953C318 = v12;
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
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a3 + 16))(a3, v3 + *(unsigned int *)(v9 + v7 + 8), *(unsigned int *)(v9 + v7 + 12));
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
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, *(void *)(v4 + 24) + v6 - 16, v2 + *(unsigned int *)(*(void *)(v4 + 24) + v6));
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
  uint64_t result = (char *)sysctlbyname("kern.bootargs", __b, &v1, 0, 0);
  if (!result)
  {
    if (strstr(__b, "libtrace_kic=0")) {
      _os_trace_kic_mode_kic = 0;
    }
    uint64_t result = strstr(__b, "libtrace_kic=1");
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
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = result;
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
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_1E953C318 = v1;
    __break(1u);
LABEL_10:
    uint64_t result = __error();
    uint64_t v2 = *result;
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_1E953C318 = v2;
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

void os_trace_blob_add_base64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  time_t v6 = (void *)MEMORY[0x1A622D720]();
  tm v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a2 length:a3];
  id v8 = [v7 base64EncodedStringWithOptions:0];
  char v9 = [v8 UTF8String];
  os_trace_blob_addf(a1, "'%s%s'", v10, v11, v12, v13, v14, v15, v9);
}

unsigned char *os_log_fmt_convert_trace(unsigned char *a1, char *a2, uint64_t a3)
{
  int v3 = a1;
  size_t v5 = &a2[a3 - 1];
  uint64_t v4 = *v5;
  *a1 = 0;
  a1[1] = v4;
  if (v4)
  {
    uint64_t v6 = -v4;
    tm v7 = &a2[a3 + ~v4];
    id v8 = a1 + 2;
    while (1)
    {
      size_t v9 = v5[v6] & 0x3F;
      uint64_t v10 = &a2[v9];
      if (&a2[v9] > v7) {
        break;
      }
      *id v8 = 0;
      v8[1] = v9;
      uint64_t v11 = v8 + 2;
      memcpy(v8 + 2, a2, v9);
      id v8 = &v11[v9];
      a2 = v10;
      if (__CFADD__(v6++, 1)) {
        return v3;
      }
    }
    return 0;
  }
  return v3;
}

void _os_log_fmt_compose_masked_partial_redacted(uint64_t a1, unsigned __int8 *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  uint64_t v10 = a1;
  if (!a3 && (a4 & 1) == 0)
  {
    if ((*(_WORD *)(a1 + 20) & 2) != 0) {
      return;
    }
    uint64_t v11 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v11 - 1) > 7)
    {
      *(void *)(*(void *)a1 + v11) = 0x3E296C6C756E283CLL;
      unsigned int v12 = *(_DWORD *)(a1 + 8) + 8;
      goto LABEL_71;
    }
    uint64_t v45 = "<(null)>";
    size_t v46 = 8;
    goto LABEL_78;
  }
  if (a3 <= 3)
  {
    if ((*(_WORD *)(a1 + 20) & 2) != 0) {
      return;
    }
    uint64_t v13 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v13 - 1) > 4)
    {
      uint64_t v14 = *(void *)a1 + v13;
      *(unsigned char *)(v14 + 4) = 62;
      *(_DWORD *)uint64_t v14 = -1501502916;
      unsigned int v12 = *(_DWORD *)(a1 + 8) + 5;
      goto LABEL_71;
    }
    uint64_t v45 = "<…>";
    size_t v46 = 5;
    goto LABEL_78;
  }
  unint64_t v15 = a3;
  unint64_t v16 = *a2;
  char v17 = a2[1];
  unint64_t v18 = a2[2];
  int v19 = a2[3];
  BOOL v21 = v19 != 2 || v18 == 0;
  if (!a4 && !*a2 && v21)
  {
    int v22 = (char *)(a2 + 4);
    unint64_t v23 = a3 - 4;
    os_trace_blob_addns(a1, v22, v23);
    return;
  }
  BOOL v24 = v19 == 1;
  if ((*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v25 = *(unsigned int *)(a1 + 8);
    if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == v25)
    {
      os_trace_blob_add_slow(a1, "<", 1uLL);
    }
    else
    {
      *(unsigned char *)(*(void *)a1 + v25) = 60;
      unsigned int v26 = *(_DWORD *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v26;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v26) = 0;
      }
    }
  }
  unint64_t v27 = v16 + 4;
  if (v15 > v16 + 4)
  {
    if (v15 - (v16 + 4) < v18) {
      unint64_t v18 = v15 - (v16 + 4);
    }
    if (v19 == 2) {
      a3 = v18;
    }
    else {
      a3 = v15 - (v16 + 4);
    }
    if (a3)
    {
      if (v19 == 1 && (*(_WORD *)(v10 + 20) & 2) == 0)
      {
        uint64_t v28 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v28 - 1) <= 2)
        {
          unint64_t v47 = a3;
          os_trace_blob_add_slow(v10, "…", 3uLL);
          a3 = v47;
        }
        else
        {
          uint64_t v29 = *(void *)v10 + v28;
          *(unsigned char *)(v29 + 2) = -90;
          *(_WORD *)uint64_t v29 = -32542;
          unsigned int v30 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v30;
          if (!*(unsigned char *)(v10 + 22)) {
            *(unsigned char *)(*(void *)v10 + v30) = 0;
          }
        }
      }
      if (os_trace_blob_addns(v10, (char *)&a2[v27], a3))
      {
        if (((v19 | 2) == 2 || v8) && (*(_WORD *)(v10 + 20) & 2) == 0)
        {
          uint64_t v31 = *(unsigned int *)(v10 + 8);
          if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v31 - 1) <= 2)
          {
            os_trace_blob_add_slow(v10, "…", 3uLL);
          }
          else
          {
            uint64_t v32 = *(void *)v10 + v31;
            *(unsigned char *)(v32 + 2) = -90;
            *(_WORD *)uint64_t v32 = -32542;
            unsigned int v33 = *(_DWORD *)(v10 + 8) + 3;
            *(_DWORD *)(v10 + 8) = v33;
            if (!*(unsigned char *)(v10 + 22)) {
              *(unsigned char *)(*(void *)v10 + v33) = 0;
            }
          }
        }
        BOOL v24 = 1;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
    if (v19 == 2
      && (a3 = v15 - (v18 + v27), v15 != v18 + v27)
      && os_trace_blob_addns(v10, (char *)&a2[v18 + v27], a3))
    {
      if ((*(_WORD *)(v10 + 20) & 2) == 0)
      {
        uint64_t v34 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v34 - 1) <= 2)
        {
          os_trace_blob_add_slow(v10, "…", 3uLL);
        }
        else
        {
          uint64_t v35 = *(void *)v10 + v34;
          *(unsigned char *)(v35 + 2) = -90;
          *(_WORD *)uint64_t v35 = -32542;
          unsigned int v36 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v36;
          if (!*(unsigned char *)(v10 + 22)) {
            *(unsigned char *)(*(void *)v10 + v36) = 0;
          }
        }
      }
    }
    else if (!v24)
    {
      goto LABEL_59;
    }
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      uint64_t v37 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v37 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }
      else
      {
        *(_WORD *)(*(void *)v10 + v37) = 8236;
        unsigned int v38 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v38;
        if (!*(unsigned char *)(v10 + 22)) {
          *(unsigned char *)(*(void *)v10 + v38) = 0;
        }
      }
    }
  }
LABEL_59:
  os_trace_blob_addf(v10, "length=%u", a3, a4, a5, a6, a7, a8, v17);
  unint64_t v39 = v15 - 4;
  if (v39 >= v16) {
    uint64_t v40 = v16;
  }
  else {
    uint64_t v40 = v39;
  }
  if (v40)
  {
    uint64_t v41 = (uint64_t)(a2 + 4);
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      uint64_t v42 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v42 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }
      else
      {
        *(_WORD *)(*(void *)v10 + v42) = 8236;
        unsigned int v43 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v43;
        if (!*(unsigned char *)(v10 + 22)) {
          *(unsigned char *)(*(void *)v10 + v43) = 0;
        }
      }
    }
    os_trace_blob_add_base64(v10, v41, v40);
  }
  if ((*(_WORD *)(v10 + 20) & 2) == 0)
  {
    uint64_t v44 = *(unsigned int *)(v10 + 8);
    if (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - 1 != v44)
    {
      *(unsigned char *)(*(void *)v10 + v44) = 62;
      unsigned int v12 = *(_DWORD *)(v10 + 8) + 1;
LABEL_71:
      *(_DWORD *)(v10 + 8) = v12;
      if (!*(unsigned char *)(v10 + 22)) {
        *(unsigned char *)(*(void *)v10 + v12) = 0;
      }
      return;
    }
    uint64_t v45 = ">";
    a1 = v10;
    size_t v46 = 1;
LABEL_78:
    os_trace_blob_add_slow(a1, v45, v46);
  }
}

uint64_t _os_log_fmt_builtin_annotated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7)
{
  unint64_t v10 = 0;
  uint64_t v11 = *(const char **)(a3 + 40);
  size_t v12 = *(unsigned __int16 *)(a3 + 16);
  unint64_t v13 = 17;
  while (1)
  {
    unint64_t v14 = (v13 + v10) >> 1;
    unint64_t v15 = (&_os_log_fmt_builtin_annotated_functions)[2 * v14];
    int v16 = strncmp(v11, v15, v12);
    if (!v16) {
      break;
    }
LABEL_5:
    if (v16 < 0) {
      unint64_t v13 = (v13 + v10) >> 1;
    }
    else {
      unint64_t v10 = v14 + 1;
    }
    if (v10 >= v13) {
      return 0;
    }
  }
  if (v15[v12])
  {
    int v16 = -v15[v12];
    goto LABEL_5;
  }
  unint64_t v18 = (&_os_log_fmt_builtin_annotated_functions)[2 * v14 + 1];
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))v18)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t _os_log_fmt_builtin_uuid_t(size_t a1, int a2, uint64_t a3, unsigned char *a4, unsigned __int8 *uu, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a3 + 10) == 19 && a6 <= 0x10 && (a6 == 16 || (a7 & 1) != 0))
  {
    if (a6 != 16 && a7)
    {
      _os_log_fmt_decode_error(a1);
    }
    else
    {
      memset(v14, 0, sizeof(v14));
      uuid_unparse_upper(uu, v14);
      unint64_t v9 = strlen(v14);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        int v10 = v9;
        uint64_t v11 = *(unsigned int *)(a1 + 8);
        if (v9 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v11 - 1))
        {
          os_trace_blob_add_slow(a1, v14, v9);
        }
        else
        {
          memcpy((void *)(*(void *)a1 + v11), v14, v9);
          unsigned int v12 = *(_DWORD *)(a1 + 8) + v10;
          *(_DWORD *)(a1 + 8) = v12;
          if (!*(unsigned char *)(a1 + 22)) {
            *(unsigned char *)(*(void *)a1 + v12) = 0;
          }
        }
      }
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_timeval(tm *a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a3 + 10) == 19 && a6 <= 0x10 && (a6 == 16 || (a7 & 1) != 0))
  {
    if (a6 != 16 && a7) {
      _os_log_fmt_decode_error((size_t)a1);
    }
    else {
      os_trace_blob_add_localtime(a1, *(void *)a5, *(_DWORD *)(a5 + 8), 1u);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_timespec(tm *a1, uint64_t a2, uint64_t a3, unsigned char *a4, time_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a3 + 10) == 19 && a6 <= 0x10 && (a6 == 16 || (a7 & 1) != 0))
  {
    if (a6 != 16 && a7) {
      _os_log_fmt_decode_error((size_t)a1);
    }
    else {
      os_trace_blob_add_localtime(a1, *a5, a5[1], 0);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_time(tm *a1, uint64_t a2, uint64_t a3, unsigned char *a4, time_t *a5, uint64_t a6)
{
  if (!_os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0)) {
    goto LABEL_8;
  }
  if (a6 == 4)
  {
    time_t v14 = *(int *)a5;
    goto LABEL_6;
  }
  if (a6 != 8)
  {
LABEL_8:
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1;
  }
  time_t v14 = *a5;
LABEL_6:
  os_trace_blob_add_localtime(a1, v14, 0, 3u);
  return 1;
}

BOOL _os_log_fmt_spec_is_integer(unsigned __int8 a1, int a2)
{
  int v2 = a2 ^ 1;
  if (a1 - 1 < 0xC) {
    int v2 = 1;
  }
  if (v2) {
    return a1 - 1 < 0xC;
  }
  else {
    return a1 == 13;
  }
}

uint64_t _os_log_fmt_builtin_trace_mode(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, int *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0);
  if (a6 != 4 || !is_integer)
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
    return 1;
  }
  int v18 = *a5;
  os_trace_blob_addf(a1, "0x%X", v12, v13, v14, v15, v16, v17, *a5);
  uint64_t v19 = 0;
  char v20 = 1;
  do
  {
    if ((_os_log_fmt_builtin_trace_mode_masks[v19] & v18) == 0) {
      goto LABEL_20;
    }
    if (v20) {
      BOOL v21 = "(";
    }
    else {
      BOOL v21 = ", ";
    }
    if (v20) {
      size_t v22 = 3;
    }
    else {
      size_t v22 = 2;
    }
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v23 = *(unsigned int *)(a1 + 8);
      if (v22 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1))
      {
        os_trace_blob_add_slow(a1, v21, v22);
      }
      else
      {
        memcpy((void *)(*(void *)a1 + v23), v21, v22);
        unsigned int v24 = *(_DWORD *)(a1 + 8) + v22;
        *(_DWORD *)(a1 + 8) = v24;
        if (!*(unsigned char *)(a1 + 22)) {
          *(unsigned char *)(*(void *)a1 + v24) = 0;
        }
      }
    }
    uint64_t v25 = *(char **)&_os_log_fmt_builtin_trace_mode_masks[v19 + 2];
    unint64_t v26 = strlen(v25);
    if ((*(_WORD *)(a1 + 20) & 2) != 0) {
      goto LABEL_18;
    }
    int v27 = v26;
    uint64_t v28 = *(unsigned int *)(a1 + 8);
    if (v26 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v28 - 1))
    {
      os_trace_blob_add_slow(a1, v25, v26);
LABEL_18:
      char v20 = 0;
      goto LABEL_20;
    }
    memcpy((void *)(*(void *)a1 + v28), v25, v26);
    unsigned int v29 = *(_DWORD *)(a1 + 8) + v27;
    *(_DWORD *)(a1 + 8) = v29;
    char v20 = *(unsigned char *)(a1 + 22);
    if (v20) {
      goto LABEL_18;
    }
    *(unsigned char *)(*(void *)a1 + v29) = 0;
LABEL_20:
    v19 += 4;
  }
  while (v19 != 28);
  if ((v20 & 1) == 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v30 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 1)
    {
      os_trace_blob_add_slow(a1, ")", 2uLL);
    }
    else
    {
      *(_WORD *)(*(void *)a1 + v30) = 10528;
      unsigned int v31 = *(_DWORD *)(a1 + 8) + 2;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v31) = 0;
      }
    }
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_mach_errno(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, kern_return_t *a5, uint64_t a6)
{
  kern_return_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  BOOL is_integer = _os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0);
  if (a6 == 4 && is_integer)
  {
    uint64_t v15 = *a5;
    if ((*a5 - 1100) > 6) {
      mach_error_string(v15 & 0xFFFFC1FF);
    }
    else {
      bootstrap_strerror(*a5);
    }
    os_trace_blob_addf(a1, "[%#x: %s]", v16, v17, v18, v19, v20, v21, v15);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_iec_bytes(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6)
{
  return 1;
}

uint64_t _os_log_fmt_builtin_scaled(uint64_t a1, unsigned int a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6, void *a7)
{
  if (_os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0))
  {
    unint64_t scalar = os_log_fmt_read_scalar(a3, a5, a6);
    double v24 = 0.0;
    int v25 = 0;
    if (*a7 && a7[1] && scalar >= 0x3E8)
    {
      int v25 = 0;
      do
      {
        int v26 = scalar;
        uint64_t v27 = a7[v25 + 2];
        ++v25;
        scalar /= a2;
      }
      while (v27 && scalar > 0x3E7);
      double v24 = (double)(v26 - scalar * a2) * 100.0;
    }
    unsigned int v28 = vcvtad_u64_f64(v24 / (double)a2);
    if (v28 == 100) {
      unint64_t v29 = scalar + 1;
    }
    else {
      unint64_t v29 = scalar;
    }
    if (v28 == 100) {
      unsigned int v28 = 0;
    }
    if (!v25) {
      return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
    }
    if (v29 <= 9 && -10 * (v28 / 0xA) != -v28) {
      return os_trace_blob_addf(a1, "%llu.%02u %s", v18, v19, v20, v21, v22, v23, v29);
    }
    if (v28 && v29 <= 0x63) {
      return os_trace_blob_addf(a1, "%llu.%01u %s", v18, v19, v20, v21, v22, v23, v29);
    }
    else {
      return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
    }
  }
  else
  {
    uint64_t v32 = *(void *)a3;
    uint64_t v33 = *(unsigned __int16 *)(a3 + 12);
    return _os_log_fmt_decode_cmd_mismatch(a1, v32, v33, a4, a6, v14, v15, v16);
  }
}

uint64_t _os_log_fmt_builtin_iec_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6)
{
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_signal(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, _DWORD *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0);
  if (a6 == 4 && is_integer)
  {
    uint64_t v18 = *a5;
    if (v18 < 0x20) {
      os_trace_blob_addf(a1, "[sig%s: %s]", v12, v13, v14, v15, v16, v17, *(void *)(MEMORY[0x1E4F14AB0] + 8 * v18));
    }
    else {
      os_trace_blob_addf(a1, "[%d: Unknown signal]", v12, v13, v14, v15, v16, v17, *a5);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_mode(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned int *a5, uint64_t a6)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0);
  if (a6 == 4 && is_integer)
  {
    unsigned int v15 = *a5;
    __src[0] = aPcDBLSW[(unsigned __int16)*a5 >> 12];
    if ((v15 & 0x40) != 0) {
      __int8 v16 = 120;
    }
    else {
      __int8 v16 = 45;
    }
    if ((v15 & 0x40) != 0) {
      __int8 v17 = 115;
    }
    else {
      __int8 v17 = 83;
    }
    if ((v15 & 8) != 0) {
      __int8 v18 = 120;
    }
    else {
      __int8 v18 = 45;
    }
    if ((v15 & 8) != 0) {
      __int8 v19 = 115;
    }
    else {
      __int8 v19 = 83;
    }
    int8x16_t v20 = (int8x16_t)vdupq_n_s32(v15);
    v21.i16[0] = 11565;
    v21.i8[3] = 45;
    v21.i8[4] = 45;
    v21.i16[3] = 11565;
    v21.i8[2] = v16;
    v21.i8[5] = v18;
    v22.i16[0] = 30578;
    v22.i8[2] = v17;
    v22.i8[3] = 114;
    v22.i8[4] = 119;
    v22.i8[5] = v19;
    v22.i16[3] = 30578;
    *(int8x8_t *)&__src[1] = vbsl_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_1A118ACD0)), (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_1A118ACE0)))), v21, v22);
    if (v15) {
      char v23 = 120;
    }
    else {
      char v23 = 45;
    }
    if (v15) {
      char v24 = 116;
    }
    else {
      char v24 = 84;
    }
    if ((v15 & 0x200) != 0) {
      char v25 = v24;
    }
    else {
      char v25 = v23;
    }
    __src[9] = v25;
    if ((*(unsigned char *)(a1 + 20) & 2) == 0)
    {
      uint64_t v26 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v26 - 1) <= 9)
      {
        os_trace_blob_add_slow(a1, __src, 0xAuLL);
      }
      else
      {
        uint64_t v27 = *(void *)a1 + v26;
        *(void *)uint64_t v27 = *(void *)__src;
        *(_WORD *)(v27 + 8) = *(_WORD *)&__src[8];
        unsigned int v28 = *(_DWORD *)(a1 + 8) + 10;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(unsigned char *)(a1 + 22)) {
          *(unsigned char *)(*(void *)a1 + v28) = 0;
        }
      }
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_errno(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, int *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0);
  if (a6 == 4 && is_integer)
  {
    int v18 = *a5;
    if (*a5)
    {
      strerror(*a5);
      os_trace_blob_addf(a1, "[%d: %s]", v19, v20, v21, v22, v23, v24, v18);
    }
    else
    {
      os_trace_blob_addf(a1, "[%d: %s]", v12, v13, v14, v15, v16, v17, 0);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_bytes(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6)
{
  return 1;
}

uint64_t _os_log_fmt_builtin_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6)
{
  return 1;
}

uint64_t _os_log_fmt_builtin_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6)
{
  if (!_os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 1))
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1;
  }
  uint64_t scalar = os_log_fmt_read_scalar(a3, a5, a6);
  __int16 v15 = *(_WORD *)(a1 + 20);
  if (**(unsigned char **)(a3 + 40) == 66)
  {
    if (scalar) {
      uint64_t v16 = "YES";
    }
    else {
      uint64_t v16 = "NO";
    }
    if (scalar) {
      size_t v17 = 3;
    }
    else {
      size_t v17 = 2;
    }
    if ((v15 & 2) != 0) {
      return 1;
    }
LABEL_18:
    uint64_t v18 = *(unsigned int *)(a1 + 8);
    if (v17 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v18 - 1))
    {
      os_trace_blob_add_slow(a1, v16, v17);
    }
    else
    {
      memcpy((void *)(*(void *)a1 + v18), v16, v17);
      unsigned int v19 = *(_DWORD *)(a1 + 8) + v17;
      *(_DWORD *)(a1 + 8) = v19;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v19) = 0;
      }
    }
    return 1;
  }
  if (scalar) {
    uint64_t v16 = "true";
  }
  else {
    uint64_t v16 = "false";
  }
  if (scalar) {
    size_t v17 = 4;
  }
  else {
    size_t v17 = 5;
  }
  if ((v15 & 2) == 0) {
    goto LABEL_18;
  }
  return 1;
}

char *_find_old_signpost_name_end(char *a1, const char *a2)
{
  uint64_t result = strchr(a1, 32);
  if (!result)
  {
    size_t v5 = strlen(a1);
    if (!strncmp(a1, a2, v5) && !a1[v5] && a2[v5] == 32)
    {
      if (a2[v5 + 1]) {
        return 0;
      }
      else {
        return &a1[v5 - 1];
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _parse_activity_swap(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 514;
  __int16 v4 = *(_WORD *)(a2 + 2);
  if ((v4 & 1) == 0)
  {
    LODWORD(v5) = 0;
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v5 = (v5 + 8);
    if (*(unsigned __int16 *)(a2 + 22) < v5) {
      return 0;
    }
    goto LABEL_7;
  }
  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0;
  }
  unint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = _os_activity_map_find_parent(*(void **)(a1 + 320), v6);
  __int16 v4 = *(_WORD *)(a2 + 2);
  LODWORD(v5) = 8;
  if ((v4 & 0x10) != 0) {
    goto LABEL_6;
  }
LABEL_7:
  if ((v4 & 0x200) == 0) {
    return 1;
  }
  if ((unint64_t)v5 + 8 <= *(unsigned __int16 *)(a2 + 22))
  {
    *(void *)(a1 + 192) = *(void *)(a2 + v5 + 24);
    return 1;
  }
  return 0;
}

uint64_t _parse_activity_create(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 513;
  __int16 v3 = *(_WORD *)(a2 + 2);
  if ((v3 & 1) == 0)
  {
    LODWORD(v4) = 0;
    if ((v3 & 0x10) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v5 = v4;
    unint64_t v4 = v4 + 8;
    if (v4 > *(unsigned __int16 *)(a2 + 22)) {
      return 0;
    }
    *(void *)(a1 + 200) = *(void *)(a2 + v5 + 24);
    if ((*(_WORD *)(a2 + 2) & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0;
  }
  *(void *)(a1 + 192) = *(void *)(a2 + 24);
  __int16 v3 = *(_WORD *)(a2 + 2);
  LODWORD(v4) = 8;
  if ((v3 & 0x10) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v3 & 0x200) != 0)
  {
LABEL_9:
    uint64_t v6 = v4;
    unint64_t v4 = v4 + 8;
    if (v4 <= *(unsigned __int16 *)(a2 + 22))
    {
      *(void *)(a1 + 64) = *(void *)(a2 + v6 + 24);
      goto LABEL_11;
    }
    return 0;
  }
LABEL_11:
  if ((unint64_t)v4 + 8 > *(unsigned __int16 *)(a2 + 22)) {
    return 0;
  }
  __int16 v10 = v4 + 8;
  *(void *)(a1 + 56) = *(void *)(a2 + v4 + 24);
  uint64_t result = _parse_location((void *)a1, a2, &v10);
  if (result)
  {
    unint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 64);
      if (v9)
      {
        if (*(unsigned char *)(a1 + 365)) {
          _os_activity_map_insert((float **)(a1 + 320), v8, v9);
        }
      }
    }
    else
    {
      *(void *)(a1 + 176) = "Default/remote activity";
    }
    return 1;
  }
  return result;
}

uint64_t _parse_activity_useraction(uint64_t a1, uint64_t a2)
{
  __int16 v8 = 0;
  *(void *)(a1 + 8) = 515;
  __int16 v4 = *(_WORD *)(a2 + 2);
  if ((v4 & 1) == 0)
  {
    unint64_t v5 = 8;
    if ((v4 & 0x10) == 0) {
      return _parse_location((void *)a1, a2, &v8);
    }
    goto LABEL_6;
  }
  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0;
  }
  __int16 v8 = 8;
  unint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = _os_activity_map_find_parent(*(void **)(a1 + 320), v6);
  unint64_t v5 = 16;
  if ((*(_WORD *)(a2 + 2) & 0x10) != 0)
  {
LABEL_6:
    if (v5 <= *(unsigned __int16 *)(a2 + 22))
    {
      __int16 v8 = v5;
      return _parse_location((void *)a1, a2, &v8);
    }
    return 0;
  }
  return _parse_location((void *)a1, a2, &v8);
}

uint64_t _parse_trace(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v9 = 0;
  *(void *)(a1 + 8) = 768;
  __int16 v4 = *(_WORD *)(a2 + 2);
  if (v4)
  {
    if (!(*(void *)(a2 + 16) >> 51)) {
      return 0;
    }
    unsigned __int16 v9 = 8;
    unint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 56) = v6;
    *(void *)(a1 + 64) = _os_activity_map_find_parent(*(void **)(a1 + 320), v6);
    unint64_t v5 = 16;
    if ((*(_WORD *)(a2 + 2) & 0x10) == 0) {
      goto LABEL_8;
    }
LABEL_6:
    if (v5 <= *(unsigned __int16 *)(a2 + 22))
    {
      unsigned __int16 v9 = v5;
      goto LABEL_8;
    }
    return 0;
  }
  unint64_t v5 = 8;
  if ((v4 & 0x10) != 0) {
    goto LABEL_6;
  }
LABEL_8:
  uint64_t result = _parse_location((void *)a1, a2, &v9);
  if (result)
  {
    uint64_t v8 = v9;
    *(void *)(a1 + 192) = a2 + v9 + 24;
    *(void *)(a1 + 200) = *(unsigned __int16 *)(a2 + 22) - v8;
    return 1;
  }
  return result;
}

BOOL _parse_loss(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 1792;
  unint64_t v2 = *(void *)(a2 + 16) >> 51;
  if (v2 >= 3)
  {
    unint64_t v4 = *(void *)(a2 + 24);
    unint64_t v5 = *(void *)(a2 + 32);
    int v6 = *(_DWORD *)(a2 + 40);
    *(void *)(a1 + 216) = 0;
    tm v7 = (void *)(a1 + 216);
    *(void *)(a1 + 192) = v4;
    *(void *)(a1 + 200) = 0;
    *(void *)(a1 + 208) = 0;
    *(void *)(a1 + 224) = v5;
    *(void *)(a1 + 232) = 0;
    *(void *)(a1 + 240) = 0;
    *(void *)(a1 + 248) = 0;
    *(_DWORD *)(a1 + 256) = v6;
    uint64_t v8 = *(void *)(a1 + 328);
    uint64_t v9 = *(void *)(v8 + 40);
    uint64_t v10 = *(void *)(a1 + 344);
    if (v10)
    {
      unint64_t v11 = _timesync_continuous_to_wall_time(v10, (void *)(v9 + 144), v4, v7);
      unint64_t v12 = v11 / 0x3B9ACA00;
      unint64_t v13 = v11 % 0x3B9ACA00 / 0x3E8;
      uint64_t v14 = *(void *)(a1 + 328);
      uint64_t v15 = *(void *)(a1 + 344);
      *(void *)(a1 + 200) = v12;
      *(void *)(a1 + 208) = v13;
      uint64_t v16 = (void *)(a1 + 248);
      uint64_t v17 = *(void *)(v14 + 40);
      if (v15)
      {
        unint64_t v18 = _timesync_continuous_to_wall_time(v15, (void *)(v17 + 144), v5, v16);
        unint64_t v19 = v18 / 0x3B9ACA00;
        int v20 = v18 % 0x3B9ACA00 / 0x3E8;
LABEL_19:
        *(void *)(a1 + 232) = v19;
        *(void *)(a1 + 240) = v20;
        return v2 > 2;
      }
      uint64_t v23 = *(void *)(a1 + 356);
    }
    else
    {
      uint64_t v21 = *(void *)(v9 + 32);
      int v22 = *(_DWORD *)(v9 + 40);
      uint64_t v23 = *(void *)(a1 + 356);
      *(void *)(a1 + 216) = v23;
      unint64_t v24 = *(void *)(v9 + 64);
      if (v24 != v4)
      {
        uint64_t v26 = *(unsigned int *)(v9 + 16);
        unint64_t v25 = *(unsigned int *)(v9 + 20);
        if (v24 >= v4)
        {
          unint64_t v28 = (v24 - v4) * v26 / v25;
          v21 -= v28 / 0x3B9ACA00;
          v22 -= v28 % 0x3B9ACA00 / 0x3E8;
          if (v22 < 0)
          {
            --v21;
            v22 += 1000000;
          }
        }
        else
        {
          unint64_t v27 = (v4 - v24) * v26 / v25;
          v21 += v27 / 0x3B9ACA00;
          v22 += v27 % 0x3B9ACA00 / 0x3E8;
          if (v22 > 999999)
          {
            ++v21;
            v22 -= 1000000;
          }
        }
      }
      *(void *)(a1 + 200) = v21;
      *(void *)(a1 + 208) = v22;
      uint64_t v16 = (void *)(a1 + 248);
      uint64_t v17 = *(void *)(v8 + 40);
    }
    unint64_t v19 = *(void *)(v17 + 32);
    int v20 = *(_DWORD *)(v17 + 40);
    *uint64_t v16 = v23;
    unint64_t v29 = *(void *)(v17 + 64);
    if (v29 != v5)
    {
      uint64_t v31 = *(unsigned int *)(v17 + 16);
      unint64_t v30 = *(unsigned int *)(v17 + 20);
      if (v29 >= v5)
      {
        unint64_t v33 = (v29 - v5) * v31 / v30;
        v19 -= v33 / 0x3B9ACA00;
        v20 -= v33 % 0x3B9ACA00 / 0x3E8;
        if (v20 < 0)
        {
          --v19;
          v20 += 1000000;
        }
      }
      else
      {
        unint64_t v32 = (v5 - v29) * v31 / v30;
        v19 += v32 / 0x3B9ACA00;
        v20 += v32 % 0x3B9ACA00 / 0x3E8;
        if (v20 > 999999)
        {
          ++v19;
          v20 -= 1000000;
        }
      }
    }
    goto LABEL_19;
  }
  return v2 > 2;
}

void logdev_notification_callback(int a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = [OSLogDevice alloc];
  uint64_t v9 = [NSString stringWithUTF8String:a2];
  unint64_t v13 = [(OSLogDevice *)v8 initWithMobileDevice:a3 andUDID:v9];

  if (a1 == 2) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = a1 == 1;
  }
  unint64_t v11 = [v7 deviceDelegate];
  unint64_t v12 = [NSString stringWithUTF8String:a2];
  [v11 activityStream:v7 deviceUDID:v12 deviceID:v13 status:v10 error:0];
}

void __watchForSims_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"device"];
  _simDeviceUpdate(v3, *(void **)(a1 + 32));
}

void _simDeviceUpdate(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = [v4 deviceDelegate];
  if ([v3 state] == 3)
  {
    int v6 = (void *)_knownSimulators;
    id v7 = [v3 UDID];
    uint64_t v8 = [v7 UUIDString];
    uint64_t v9 = [v6 objectForKey:v8];

    if (v9)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v10 = [v3 UDID];
      unint64_t v11 = [v10 UUIDString];
      int v23 = 138412546;
      uint64_t v24 = (uint64_t)v11;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "duplicate sim seen: %@, already have %@", (uint8_t *)&v23, 0x16u);
    }
    else
    {
      uint64_t v9 = [[OSLogDevice alloc] initWithSimualatedDevice:v3];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        uint64_t v24 = (uint64_t)v9;
        _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "sim added: %@", (uint8_t *)&v23, 0xCu);
      }
      int v20 = (void *)_knownSimulators;
      uint64_t v21 = [v3 UDID];
      int v22 = [v21 UUIDString];
      [v20 setObject:v9 forKey:v22];

      uint64_t v10 = [(OSLogDevice *)v9 uid];
      [v5 activityStream:v4 deviceUDID:v10 deviceID:v9 status:0 error:0];
    }

    goto LABEL_17;
  }
  uint64_t v12 = [v3 state];
  unint64_t v13 = (void *)_knownSimulators;
  uint64_t v14 = [v3 UDID];
  uint64_t v15 = [v14 UUIDString];
  uint64_t v9 = [v13 objectForKey:v15];

  if (v12 == 4)
  {
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        uint64_t v24 = (uint64_t)v9;
        _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "sim removed: %@", (uint8_t *)&v23, 0xCu);
      }
      uint64_t v16 = [(OSLogDevice *)v9 uid];
      [v5 activityStream:v4 deviceUDID:v16 deviceID:v9 status:1 error:0];

      uint64_t v17 = (void *)_knownSimulators;
      unint64_t v18 = [v3 UDID];
      unint64_t v19 = [v18 UUIDString];
      [v17 removeObjectForKey:v19];

      goto LABEL_17;
    }
  }
  else if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v23 = 134218242;
      uint64_t v24 = [v3 state];
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "sim state %lu: %@", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __watchForSims_block_invoke()
{
  if (_coreSimulatorFrameworkPath_once != -1) {
    dispatch_once(&_coreSimulatorFrameworkPath_once, &__block_literal_global_188);
  }
  id v0 = (id)_coreSimulatorFrameworkPath_path;
  if (v0)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithPath:v0];
    unint64_t v2 = v1;
    if (v1)
    {
      watchForSims_SimServiceContextClass = [v1 classNamed:@"SimServiceContext"];
      if (watchForSims_SimServiceContextClass)
      {
        uint64_t v3 = objc_opt_new();
        id v4 = (void *)_knownSimulators;
        _knownSimulators = v3;
      }
    }
  }
  return MEMORY[0x1F41817F8]();
}

void ___coreSimulatorFrameworkPath_block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = [&unk_1EF44AB68 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(&unk_1EF44AB68);
        }
        unint64_t v5 = *(void **)(*((void *)&v6 + 1) + 8 * i);
        if ([v0 fileExistsAtPath:v5])
        {
          objc_storeStrong((id *)&_coreSimulatorFrameworkPath_path, v5);
          goto LABEL_11;
        }
      }
      uint64_t v2 = [&unk_1EF44AB68 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_1A114F354(void *a1)
{
}

void logdev_message_callback(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v3 = +[OSActivityEvent activityEventFromStreamEntry:a1];
    if (v3)
    {
      id v4 = [v7 predicate];

      if (!v4
        || ([v7 predicate],
            unint64_t v5 = objc_claimAutoreleasedReturnValue(),
            char v6 = [v5 evaluateWithObject:v3],
            v5,
            (v6 & 1) != 0))
      {
        [v7 streamEvent:v3 error:0];
      }
    }
  }
  else
  {
    [v7 streamEvent:0 error:0];
  }
}

void sub_1A114FE10(void *a1)
{
}

void sub_1A11512A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ___catalog_lite_read_limits_block_invoke_2(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *(void **)(result + 32);
  if (*(void *)a2 < *v3) {
    void *v3 = *(void *)a2;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(unint64_t **)(result + 40);
  if (v4 < *v5) {
    unint64_t *v5 = v4;
  }
  uint64_t v6 = a2 + *(unsigned __int16 *)(a2 + 24) + 26;
  if ((v6 & 7) != 0) {
    uint64_t v6 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  *a3 = v6;
  return result;
}

void enumerateOldChunkTracepointLimits(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (*(_DWORD *)a1 == 24589)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __enumerateOldChunkTracepointLimits_block_invoke;
    v18[3] = &__block_descriptor_48_e767_B16__0__tracev3_chunk_s__tracev3_chunk_preamble_s_IIQ_____tracev3_chunk_header_s__mach_timebase_info_II_QqiiiI_tracev3_subchunk_preamble_s_II__tracev3_subchunk_continuous_s_Q__tracev3_subchunk_preamble_s_II__tracev3_subchunk_systeminfo_s_ii_16c__32c___tracev3_subchunk_preamble_s_II__tracev3_subchunk_generation_s__16C_ii__tracev3_subchunk_preamble_s_II__tracev3_subchunk_timezone_s__48c____tracev3_chunk_catalog_s_SSSS_0C___tracev3_chunk_catalog_v2_s_SSSSS_3S_Q_0C___tracev3_chunk_log_preamble_s_QIC_3C___tracev3_chunk_firehose_s_QICC_2C__0C___tracev3_chunk_firehose_old_s_QiCC_0C___tracev3_chunk_oversize_s_QIC_3C_QISS_0C___tracev3_chunk_oversize_old_s_QISS_0C___tracev3_chunk_statedump_s_QIC_3C_QQ_16C__0C___tracev3_chunk_simple_s_QICC_2C_QQQ_16C__16C__0C___0C___8l;
    v18[4] = a2;
    v18[5] = a3;
    _tracev3_chunk_decompress_and_enumerate_chunks(a1, 0, (uint64_t)v18);
    return;
  }
  if (*(_DWORD *)a1 == 24588)
  {
    unint64_t v3 = *(void *)(a1 + 8);
    unint64_t v4 = v3 - 16;
    if (v3 >= 0x10)
    {
      unint64_t v5 = (unsigned __int16 *)(a1 + 30);
      if (v3 - 4113 > 0xFFFFFFFFFFFFF00ELL)
      {
        unint64_t v6 = *v5;
        if (v4 < v6) {
          return;
        }
      }
      else
      {
        unint64_t v6 = *v5;
      }
      id v7 = (uint64_t *)(a1 + 46);
      unint64_t v8 = (unint64_t)v5 + v6;
      if (v6 > 0x1000) {
        unint64_t v8 = a1 + 46;
      }
      while ((unint64_t)(v7 + 3) < v8)
      {
        unint64_t v9 = v7[2];
        uint64_t v10 = HIWORD(v9);
        if (!HIWORD(v9) || v10 > (uint64_t)(v8 - (void)(v7 + 3))) {
          break;
        }
        uint64_t v12 = v10 + 24;
        uint64_t v13 = (HIWORD(v9) & 0xFFF8) + 32;
        if ((v9 & 0x7000000000000) == 0) {
          uint64_t v13 = v12;
        }
        uint64_t v14 = (uint64_t *)((char *)v7 + v13);
        uint64_t v15 = *v7;
        id v7 = v14;
        if (v15)
        {
          unint64_t v16 = (v9 & 0xFFFFFFFFFFFFLL) + *(void *)(a1 + 38);
          unint64_t v17 = *a2;
          if (*a2 >= v16) {
            unint64_t v17 = v16;
          }
          *a2 = v17;
          if (*a3 > v16) {
            unint64_t v16 = *a3;
          }
          *a3 = v16;
          id v7 = v14;
        }
      }
    }
  }
}

uint64_t __enumerateOldChunkTracepointLimits_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
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

uint64_t _oie_validate_subchunk_ttl(void *a1, void *a2, int a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  unint64_t v9 = v8;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  uint64_t v12 = 5;
  if (a3 != 30) {
    uint64_t v12 = 0;
  }
  if (a3 != 14) {
    uint64_t v11 = v12;
  }
  if (a3 != 7) {
    uint64_t v10 = v11;
  }
  uint64_t v13 = 1;
  uint64_t v14 = 2;
  if (a3 != 3) {
    uint64_t v14 = 0;
  }
  if (a3 != 1) {
    uint64_t v13 = v14;
  }
  if (a3 <= 6) {
    uint64_t v10 = v13;
  }
  uint64_t v15 = v7[v10 + 8];
  if (!v15) {
    goto LABEL_20;
  }
  unint64_t v16 = *(void **)v15;
  id v17 = [v8 catalog];
  unint64_t v18 = _os_trace_uuid_map_lookup(v16, (void *)[v17 bootUUID]);

  if (v18)
  {
    if (v18 <= 1) {
      uint64_t v19 = *(void *)(v15 + 8);
    }
    else {
      uint64_t v19 = 0;
    }
    *a4 = v19;
LABEL_20:
    uint64_t v20 = 1;
    goto LABEL_21;
  }
  uint64_t v20 = 0;
LABEL_21:

  return v20;
}

void sub_1A11531FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _OSLogError(uint64_t a1)
{
  size_t v9[2] = *MEMORY[0x1E4F143B8];
  switch(a1)
  {
    case 4:
    case 5:
    case 11:
    case 12:
    case 13:
      id v7 = @"_OSLogErrorInternalCode";
      uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = v1;
      uint64_t v2 = @"The log archive is corrupt or incomplete and cannot be read";
      uint64_t v3 = 2;
      break;
    case 7:
      id v7 = @"_OSLogErrorInternalCode";
      uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:7];
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = v1;
      uint64_t v2 = @"A system resource shortage prevented the operation from completing successfully";
      uint64_t v3 = 6;
      break;
    case 8:
      id v7 = @"_OSLogErrorInternalCode";
      uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:8];
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = v1;
      uint64_t v2 = @"The log archive format requires upgrading in order to be opened";
      uint64_t v3 = 4;
      break;
    case 9:
      id v7 = @"_OSLogErrorInternalCode";
      uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:9];
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = v1;
      uint64_t v2 = @"The log archive upgrade process failed";
      uint64_t v3 = 5;
      break;
    case 10:
      id v7 = @"_OSLogErrorInternalCode";
      uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:10];
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = v1;
      uint64_t v2 = @"The log archive version is unsupported by this library";
      uint64_t v3 = 3;
      break;
    case 14:
      id v7 = @"_OSLogErrorInternalCode";
      uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:14];
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = v1;
      uint64_t v2 = @"Client lacks entitlement to perform operation";
      uint64_t v3 = 9;
      break;
    case 15:
      id v7 = @"_OSLogErrorInternalCode";
      uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:15];
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = v1;
      uint64_t v2 = @"Connection to logd failed";
      uint64_t v3 = 10;
      break;
    case 16:
    case 17:
    case 18:
      id v7 = @"_OSLogErrorInternalCode";
      uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = v1;
      uint64_t v2 = @"The log archive contains partial or missing metadata";
      uint64_t v3 = 7;
      break;
    default:
      id v7 = @"_OSLogErrorInternalCode";
      uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = v1;
      uint64_t v2 = @"The specified URL did not refer to a valid log archive";
      uint64_t v3 = 1;
      break;
  }
  v9[1] = v2;
  unint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v7 count:2];

  unint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OSLogErrorDomain" code:v3 userInfo:v4];

  return v5;
}

id _OSLogPOSIXError(uint64_t a1, uint64_t a2)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a1 - 4) > 0xE) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = qword_1A118AF90[a1 - 4];
  }
  v11[0] = @"_OSLogErrorInternalCode";
  unint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
  v12[0] = v4;
  v11[1] = @"_OSLogErrorPOSIXErrno";
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
  v12[1] = v5;
  void v11[2] = *MEMORY[0x1E4F28568];
  uint64_t v6 = v3 - 1;
  if ((unint64_t)(v3 - 1) >= 0xA || ((0x37Fu >> v6) & 1) == 0)
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: unimplemented log error case";
    qword_1E953C318 = v3;
    __break(1u);
  }
  id v7 = (void *)v5;
  void v12[2] = off_1E5A42558[v6];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  unint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OSLogErrorDomain" code:v3 userInfo:v8];

  return v9;
}

id _OSLogInternalError(uint64_t a1, void *a2)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = qword_1A118AF90[a1 - 4];
  v10[0] = @"_OSLogErrorInternalCode";
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
  v11[0] = v5;
  v10[1] = @"_OSLogErrorInternalError";
  uint64_t v6 = v3;
  if (!v3)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v6;
  void v10[2] = *MEMORY[0x1E4F28568];
  if ((unint64_t)(v4 - 1) >= 0xA)
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: unimplemented log error case";
    qword_1E953C318 = v4;
    __break(1u);
  }
  void v11[2] = off_1E5A425A8[v4 - 1];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  if (!v3) {

  }
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OSLogErrorDomain" code:v4 userInfo:v7];

  return v8;
}

void sub_1A1155AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t _cmp_uuid_key(int a1, uint64_t a2, unsigned __int8 *uu2)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), uu2);
}

uint64_t _cmp_uuid_node(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), (const unsigned __int8 *)(a3 + 24));
}

void sub_1A1155F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__830(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__831(uint64_t a1)
{
}

void sub_1A11564B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _uuidpath_error_message(uint64_t a1, void *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (_uuidpath_error_message_onceToken != -1) {
    dispatch_once(&_uuidpath_error_message_onceToken, &__block_literal_global_18);
  }
  uint64_t v12 = pthread_getspecific(_uuidpath_error_message_threadKey);
  uint64_t v13 = v12;
  if (v12 && *v12 == a1 && *((_DWORD *)v12 + 2) < 5u)
  {
    uint64_t v14 = (unsigned int *)v12;
  }
  else
  {
    uint64_t v14 = (unsigned int *)malloc_type_calloc(1uLL, 0x38uLL, 0x1010040662321C7uLL);
    *(void *)uint64_t v14 = a1;
    pthread_setspecific(_uuidpath_error_message_threadKey, v14);
    if (v13) {
      _uuidpath_error_message_free(v13);
    }
  }
  uint64_t result = vasprintf((char **)&v14[2 * v14[2] + 4], a3, &a9);
  uint64_t v16 = v14[2];
  *a2 = *(void *)&v14[2 * v16 + 4];
  v14[2] = v16 + 1;
  return result;
}

void _uuidpath_error_message_free(void *a1)
{
  unint64_t v2 = *((unsigned int *)a1 + 2);
  if (v2)
  {
    for (unint64_t i = 0; i < v2; ++i)
    {
      uint64_t v4 = (void *)a1[i + 2];
      if (v4)
      {
        free(v4);
        unint64_t v2 = *((unsigned int *)a1 + 2);
      }
    }
  }
  free(a1);
}

uint64_t ___uuidpath_error_message_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_uuidpath_error_message_threadKey, (void (__cdecl *)(void *))_uuidpath_error_message_free);
}

uint64_t ___uuidpath_headercache_add_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&headercache_key, (void (__cdecl *)(void *))_uuidpath_headercache_free);
}

void _uuidpath_headercache_free(void *a1)
{
  unint64_t v2 = (void *)a1[1];
  if (v2) {
    munmap(v2, a1[2]);
  }
  for (uint64_t i = 0; i != 20; i += 4)
  {
    uint64_t v4 = (void *)a1[i + 5];
    if (v4) {
      munmap(v4, a1[i + 6]);
    }
  }
  free(a1);
}

void _uuidpath_pathcache_free(rb_tree_t *a1)
{
  unint64_t v2 = rb_tree_iterate(a1, 0, 1u);
  if (v2)
  {
    id v3 = v2;
    do
    {
      uint64_t v4 = rb_tree_iterate(a1, v3, 1u);
      rb_tree_remove_node(a1, v3);
      free(v3);
      id v3 = v4;
    }
    while (v4);
  }
  free(a1);
}

uint64_t ___uuidpath_sharedcache_resolve_fd_legacy_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&headercache_key, (void (__cdecl *)(void *))_uuidpath_headercache_free);
}

_DWORD *uuidpath_map_header(const char *a1, uint64_t a2, size_t *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *a3 = 0;
  if (!a2) {
    return 0;
  }
  if (!a1)
  {
    if (_os_trace_uuiddb_path_sandbox_can_read_data_once != -1) {
      dispatch_once(&_os_trace_uuiddb_path_sandbox_can_read_data_once, &__block_literal_global_94);
    }
    if (_os_trace_uuiddb_path_sandbox_can_read_data_can_read)
    {
      _os_trace_uuiddb_get_path(0, a2, 1, __str);
      goto LABEL_8;
    }
    return 0;
  }
  int v5 = snprintf(__str, 0x400uLL, "%s/", a1);
  _os_trace_uuiddb_get_pathsuffix(a2, 1, &__str[v5], 1024 - v5);
LABEL_8:
  uint64_t result = (_DWORD *)_os_trace_mmap_at();
  if (result && (*a3 < 0x10 || *result != 1719109785 || result[1] != 2))
  {
    munmap(result, *a3);
    uint64_t result = 0;
    *a3 = 0;
  }
  return result;
}

uint64_t uuidpath_resolve(char *a1, const void *a2, unint64_t a3, unint64_t a4, const char **a5, const char **a6, void *a7, void *a8)
{
  uint64_t v15 = a1;
  if (!a1)
  {
    if (_os_trace_shared_paths_init_once != -1) {
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    }
    uint64_t v15 = (const char *)_os_trace_uuidtext_path;
  }
  int v16 = open(v15, 0);
  if (v16 == -1)
  {
    if (a8)
    {
      __error();
      _uuidpath_error_message(a3, a8, "Unable to open source path <%s> (%d)", v20, v21, v22, v23, v24, (char)v15);
      return 0;
    }
    return (uint64_t)a8;
  }
  int v17 = v16;
  a8 = (void *)uuidpath_resolve_fd(v16, a2, a3, a4, a5, a6, a7, a8);
  if (close(v17) != -1) {
    return (uint64_t)a8;
  }
  int v18 = *__error();
  uint64_t result = *__error();
  if (v18 != 9)
  {
    _os_assumes_log();
    return (uint64_t)a8;
  }
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = result;
  __break(1u);
  return result;
}

const char *_os_log_resolve_format(__n128 *a1, int a2, unint64_t a3, const char **a4)
{
  uint64_t v11 = 0;
  unsigned int v5 = BYTE2(a2) & 0xE;
  if (v5 > 0xC) {
    goto LABEL_10;
  }
  int v6 = 1 << v5;
  if ((v6 & 0x504) != 0)
  {
    char v7 = uuidpath_resolve(0, a1, a3, 0, &v11, 0, 0, 0);
    if (!a4 || (v7 & 1) != 0) {
      return v11;
    }
    goto LABEL_11;
  }
  if ((v6 & 0x1010) == 0)
  {
LABEL_10:
    if (!a4) {
      return v11;
    }
LABEL_11:
    unint64_t v9 = "<compose failure [UUID]>";
    goto LABEL_12;
  }
  char v8 = uuidpath_sharedcache_resolve_fd(0xFFFFFFFFLL, a1, a3, 0, 0, &v11, 0, 0, 0, 0, 0);
  if (a4 && (v8 & 1) == 0)
  {
    unint64_t v9 = "<compose failure [shared UUID]>";
LABEL_12:
    *a4 = v9;
  }
  return v11;
}

uint64_t OSLogLookupPathWithUUID(const void *a1, void *a2, void *a3)
{
  return uuidpath_resolve(0, a1, 0, 0, 0, 0, a2, a3);
}

void sub_1A1157E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A11582A0(void *a1)
{
  objc_begin_catch(a1);
  v1[9] = 8;
  [v1 invalidate];
  objc_end_catch();
  JUMPOUT(0x1A1158274);
}

void sub_1A11582C4(_Unwind_Exception *a1)
{
}

uint64_t os_trace_blob_grow(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  if (*(unsigned char *)(a1 + 22)) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = v3 + 1;
  }
  size_t v5 = v4 + a2;
  if (__CFADD__(v4, a2) || HIDWORD(v5))
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    unsigned int v7 = *(_DWORD *)(a1 + 16);
  }
  else
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((v6 & 0x80000000) != 0)
    {
      unsigned int v7 = *(_DWORD *)(a1 + 16);
    }
    else
    {
      if (2 * v6 > v5) {
        LODWORD(v5) = 2 * v6;
      }
      if (*(_DWORD *)(a1 + 16) >= v5) {
        unsigned int v7 = v5;
      }
      else {
        unsigned int v7 = *(_DWORD *)(a1 + 16);
      }
    }
  }
  if (v7 > v6)
  {
    char v8 = *(const void **)a1;
    if (*(_WORD *)(a1 + 20))
    {
      *(void *)a1 = _os_trace_realloc();
    }
    else
    {
      unint64_t v9 = (void *)_os_trace_malloc();
      *(void *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }
    *(_DWORD *)(a1 + 12) = v7;
  }
  return v7 - v4;
}

size_t os_trace_blob_add_slow(uint64_t a1, void *__src, size_t __n)
{
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0;
  }
  size_t v3 = __n;
  unsigned int v6 = *(_DWORD *)(a1 + 12);
  size_t v7 = *(char *)(a1 + 22) + v6 - *(_DWORD *)(a1 + 8) - 1;
  if (v7 < __n)
  {
    if (v6 < *(_DWORD *)(a1 + 16)) {
      size_t v7 = os_trace_blob_grow(a1, __n);
    }
    if (v7 < v3)
    {
      *(_WORD *)(a1 + 20) |= 2u;
      size_t v3 = v7;
    }
  }
  memcpy((void *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), __src, v3);
  unsigned int v8 = *(_DWORD *)(a1 + 8) + v3;
  *(_DWORD *)(a1 + 8) = v8;
  if (!*(unsigned char *)(a1 + 22)) {
    *(unsigned char *)(*(void *)a1 + v8) = 0;
  }
  return v3;
}

void os_trace_blob_add_unsafe_bytes(uint64_t a1, char *__src, unint64_t a3)
{
  if ((*(_WORD *)(a1 + 20) & 2) == 0)
  {
    unint64_t v3 = a3;
    int v6 = *(_DWORD *)(a1 + 8);
    if (!*(unsigned char *)(a1 + 22)) {
      ++v6;
    }
    int v7 = *(_DWORD *)(a1 + 16);
    if (v7)
    {
      unsigned int v8 = v7 - v6;
      if (!a3) {
        return;
      }
      goto LABEL_10;
    }
    int v9 = *(_DWORD *)(a1 + 12);
    unsigned int v8 = v9 - v6;
    if (!v9) {
      unsigned int v8 = 0;
    }
    if (a3)
    {
LABEL_10:
      if (!v8) {
        return;
      }
      unint64_t v10 = 0;
      unint64_t v11 = v8;
      while (1)
      {
        if (!*__src) {
          return;
        }
        if (v3 >= v11 - v10) {
          int64_t v12 = v11 - v10;
        }
        else {
          int64_t v12 = v3;
        }
        if (v12)
        {
          if (_os_trace_unsafe_ascii_once != -1) {
            dispatch_once(&_os_trace_unsafe_ascii_once, &__block_literal_global_1072);
          }
          if (v12 >= 1)
          {
            if (((*(void *)((char *)_os_trace_unsafe_ascii_tbl
                             + (((unint64_t)*__src >> 3) & 0x18)) >> *__src) & 1) != 0)
            {
              int64_t v12 = 0;
            }
            else
            {
              uint64_t v13 = 1;
              while (v13 < v12)
              {
                unint64_t v14 = __src[v13++];
                if ((*(void *)((char *)_os_trace_unsafe_ascii_tbl + ((v14 >> 3) & 0x18)) >> v14))
                {
                  int64_t v12 = v13 - 1;
                  break;
                }
              }
            }
          }
        }
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          uint64_t v15 = *(unsigned int *)(a1 + 8);
          if (v12 > (unint64_t)(*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v15 - 1))
          {
            os_trace_blob_add_slow(a1, __src, v12);
          }
          else
          {
            memcpy((void *)(*(void *)a1 + v15), __src, v12);
            unsigned int v16 = *(_DWORD *)(a1 + 8) + v12;
            *(_DWORD *)(a1 + 8) = v16;
            if (!*(unsigned char *)(a1 + 22)) {
              *(unsigned char *)(*(void *)a1 + v16) = 0;
            }
          }
        }
        unint64_t v17 = v3 - v12;
        if (!v17) {
          return;
        }
        unint64_t v18 = v12 + v10;
        if (v18 == v11) {
          return;
        }
        uint64_t v19 = &__src[v12];
        int v20 = *v19;
        if (!*v19) {
          return;
        }
        if ((v20 & 0x80) == 0) {
          break;
        }
        size_t v25 = _os_trace_utf8_len(v19, v17);
        if (v25 == -1)
        {
          unint64_t v10 = v18 + 4;
          if (v10 > v11) {
            return;
          }
          int v29 = v20 & 0x7F;
          if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * (v20 & 0x7F) + 60) & 0x200) == 0)
          {
            qmemcpy(&v37, "\\M-", 3);
            HIBYTE(v37) = v20 & 0x7F;
            if ((*(unsigned char *)(a1 + 20) & 2) == 0)
            {
              uint64_t v30 = *(unsigned int *)(a1 + 8);
              if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) > 3)
              {
                uint64_t v31 = *(void *)a1;
                int v32 = v37;
                goto LABEL_59;
              }
              p_srca = (__int16 *)&v37;
LABEL_71:
              uint64_t v35 = a1;
              size_t v36 = 4;
LABEL_72:
              os_trace_blob_add_slow(v35, p_srca, v36);
            }
LABEL_62:
            int __src = v19 + 1;
            unint64_t v3 = v17 - 1;
            goto LABEL_63;
          }
          if (v29 == 127) {
            char v33 = 63;
          }
          else {
            char v33 = v29 + 64;
          }
          qmemcpy(&__srca, "\\M^", 3);
          HIBYTE(__srca) = v33;
          if ((*(unsigned char *)(a1 + 20) & 2) != 0) {
            goto LABEL_62;
          }
          uint64_t v30 = *(unsigned int *)(a1 + 8);
          if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 3)
          {
            p_srca = (__int16 *)&__srca;
            goto LABEL_71;
          }
          uint64_t v31 = *(void *)a1;
          int v32 = __srca;
LABEL_59:
          *(_DWORD *)(v31 + v30) = v32;
          unsigned int v24 = *(_DWORD *)(a1 + 8) + 4;
LABEL_60:
          *(_DWORD *)(a1 + 8) = v24;
          if (!*(unsigned char *)(a1 + 22)) {
            *(unsigned char *)(*(void *)a1 + v24) = 0;
          }
          goto LABEL_62;
        }
        size_t v26 = v25;
        if (v25 == -2) {
          return;
        }
        unint64_t v10 = v25 + v18;
        if (v10 > v11) {
          return;
        }
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          uint64_t v27 = *(unsigned int *)(a1 + 8);
          if (v25 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
          {
            os_trace_blob_add_slow(a1, v19, v25);
          }
          else
          {
            memcpy((void *)(*(void *)a1 + v27), v19, v25);
            unsigned int v28 = *(_DWORD *)(a1 + 8) + v26;
            *(_DWORD *)(a1 + 8) = v28;
            if (!*(unsigned char *)(a1 + 22)) {
              *(unsigned char *)(*(void *)a1 + v28) = 0;
            }
          }
        }
        int __src = &v19[v26];
        unint64_t v3 = v17 - v26;
LABEL_63:
        if (!v3 || v10 >= v11) {
          return;
        }
      }
      unint64_t v10 = v18 + 3;
      if (v10 > v11) {
        return;
      }
      char v21 = v20 + 64;
      if (v20 == 127) {
        char v21 = 63;
      }
      __int16 v39 = 24156;
      char v40 = v21;
      if ((*(unsigned char *)(a1 + 20) & 2) != 0) {
        goto LABEL_62;
      }
      uint64_t v22 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v22 - 1) <= 2)
      {
        p_srca = &v39;
        uint64_t v35 = a1;
        size_t v36 = 3;
        goto LABEL_72;
      }
      uint64_t v23 = *(void *)a1 + v22;
      *(_WORD *)uint64_t v23 = v39;
      *(unsigned char *)(v23 + 2) = v40;
      unsigned int v24 = *(_DWORD *)(a1 + 8) + 3;
      goto LABEL_60;
    }
  }
}

uint64_t _os_trace_utf8_len(char *a1, unint64_t a2)
{
  char v2 = *a1;
  if ((*a1 & 0xF8) == 0xF0)
  {
    unint64_t v3 = 4;
  }
  else if ((v2 & 0xF0) == 0xE0)
  {
    unint64_t v3 = 3;
  }
  else
  {
    if ((v2 & 0xE0) != 0xC0) {
      return -1;
    }
    unint64_t v3 = 2;
  }
  if (v3 <= a2)
  {
    uint64_t v4 = 1;
    while ((a1[v4] & 0xC0) == 0x80)
    {
      if (v3 == ++v4) {
        return v3;
      }
    }
    return -1;
  }
  return -2;
}

void __os_trace_safe_ascii_strcspn_block_invoke()
{
  uint64_t v0 = 0;
  uint64_t v1 = MEMORY[0x1E4F14390];
  do
  {
    if ((v0 - 1) > 0x7E || (*(_DWORD *)(v1 + 4 * v0 + 60) & 0x4200) == 0x200) {
      _os_trace_unsafe_ascii_tbl[v0 >> 6] |= 1 << v0;
    }
    ++v0;
  }
  while (v0 != 256);
}

tm *os_trace_blob_add_localtime(tm *result, time_t a2, char a3, unsigned int a4)
{
  time_t v20 = a2;
  if (BYTE2(result->tm_year))
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
  }
  else
  {
    uint64_t v4 = (uint64_t)result;
    if ((result->tm_year & 2) == 0)
    {
      memset(&v19, 0, sizeof(v19));
      uint64_t result = localtime_r(&v20, &v19);
      if (result)
      {
        os_trace_blob_addf(v4, "%04d-%02d-%02d %02d:%02d:%02d", v7, v8, v9, v10, v11, v12, LOBYTE(v19.tm_year) + 108);
        if (a4 <= 2) {
          os_trace_blob_addf(v4, off_1E5A42858[a4], v13, v14, v15, v16, v17, v18, a3);
        }
        return (tm *)os_trace_blob_addf(v4, "%+05ld", v13, v14, v15, v16, v17, v18, (v19.tm_gmtoff / 60 % 60) + 100 * (v19.tm_gmtoff / 3600));
      }
    }
  }
  return result;
}

uint64_t ctf_type_parse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = ctf_type_resolve(a1, a2);
  if (v10 == -1)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v11 = v10;
  if (ctf_type_size(a1, a2) > a5) {
    return 0;
  }
  int v12 = ctf_type_kind(a1, v11);
  if (v12 >= 31)
  {
LABEL_10:
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
    return result;
  }
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))ctf_formatters[v12];
  if (!v13) {
    return 0;
  }
  return v13(a1, a2, a3, a4, a5);
}

uint64_t ctf_enum(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned int a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = ctf_type_size(a1, a2);
  if (v10 > a5)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  switch(v10)
  {
    case 1:
      unint64_t v11 = *a4;
      goto LABEL_7;
    case 2:
      unint64_t v11 = *(unsigned __int16 *)a4;
      goto LABEL_7;
    case 4:
      unint64_t v11 = *(unsigned int *)a4;
      goto LABEL_7;
    case 8:
      unint64_t v11 = *(void *)a4;
      if (HIDWORD(v11))
      {
        _os_assumes_log();
        char v27 = v11;
        goto LABEL_16;
      }
LABEL_7:
      if (ctf_enum_name(a1, a2, v11))
      {
        char v27 = v11;
        uint64_t v18 = "[%#llx %s]";
LABEL_9:
        os_trace_blob_addf(a3, v18, v12, v13, v14, v15, v16, v17, v27);
        return 1;
      }
      if (!v11)
      {
        char v27 = 0;
LABEL_16:
        uint64_t v18 = "%#llx";
        goto LABEL_9;
      }
      uint64_t v30 = 0;
      v28[2] = 1;
      v29[0] = &v31;
      v29[1] = (void *)0x40000000000;
      v28[1] = v29;
      v28[0] = v11;
      if (ctf_enum_iter(a1, a2, (uint64_t (*)(char *, void, uint64_t))ctf_enum_flag_parse, (uint64_t)v28) == 1)os_trace_blob_addf(a3, "[%#llx %s]", v20, v21, v22, v23, v24, v25, v11); {
      else
      }
        os_trace_blob_addf(a3, "%#llx", v20, v21, v22, v23, v24, v25, v11);
      if ((v30 & 0x100000000) != 0)
      {
        size_t v26 = v29[0];
        v29[0] = (void *)3954044928;
        WORD2(v30) = 0;
        free(v26);
      }
      return 1;
    default:
      _os_assumes_log();
      return 0;
  }
}

BOOL ctf_enum_flag_parse(char *__s, int a2, uint64_t a3)
{
  int v3 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 & a2) != 0)
  {
    if (!*(unsigned char *)(a3 + 16))
    {
      uint64_t v7 = *(void *)(a3 + 8);
      char __src = 124;
      if ((*(_WORD *)(v7 + 20) & 2) == 0)
      {
        uint64_t v8 = *(unsigned int *)(v7 + 8);
        if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == v8)
        {
          os_trace_blob_add_slow(v7, &__src, 1uLL);
        }
        else
        {
          *(unsigned char *)(*(void *)v7 + v8) = 124;
          unsigned int v9 = *(_DWORD *)(v7 + 8) + 1;
          *(_DWORD *)(v7 + 8) = v9;
          if (!*(unsigned char *)(v7 + 22)) {
            *(unsigned char *)(*(void *)v7 + v9) = 0;
          }
        }
      }
    }
    *(unsigned char *)(a3 + 16) = 0;
    uint64_t v10 = *(void *)(a3 + 8);
    unint64_t v11 = strlen(__s);
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      int v12 = v11;
      uint64_t v13 = *(unsigned int *)(v10 + 8);
      if (v11 > (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v13 - 1))
      {
        os_trace_blob_add_slow(v10, __s, v11);
      }
      else
      {
        memcpy((void *)(*(void *)v10 + v13), __s, v11);
        unsigned int v14 = *(_DWORD *)(v10 + 8) + v12;
        *(_DWORD *)(v10 + 8) = v14;
        if (!*(unsigned char *)(v10 + 22)) {
          *(unsigned char *)(*(void *)v10 + v14) = 0;
        }
      }
    }
    int v3 = *(_DWORD *)a3 ^ a2;
    *(_DWORD *)a3 = v3;
  }
  return v3 == 0;
}

BOOL ctf_recursive(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  v14[0] = a1;
  v14[1] = a3;
  v14[2] = a4;
  uint64_t v15 = 0x10000;
  LOWORD(v15) = a5;
  char __src = 123;
  if ((*(_WORD *)(a3 + 20) & 2) == 0)
  {
    uint64_t v8 = *(unsigned int *)(a3 + 8);
    if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 == v8)
    {
      os_trace_blob_add_slow(a3, &__src, 1uLL);
    }
    else
    {
      *(unsigned char *)(*(void *)a3 + v8) = 123;
      unsigned int v9 = *(_DWORD *)(a3 + 8) + 1;
      *(_DWORD *)(a3 + 8) = v9;
      if (!*(unsigned char *)(a3 + 22)) {
        *(unsigned char *)(*(void *)a3 + v9) = 0;
      }
    }
  }
  int v10 = ctf_member_iter(a1, a2, (uint64_t (*)(const char *, void, unint64_t, uint64_t))ctf_member_parse, (uint64_t)v14);
  char __src = 125;
  if ((*(_WORD *)(a3 + 20) & 2) == 0)
  {
    uint64_t v11 = *(unsigned int *)(a3 + 8);
    if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 == v11)
    {
      os_trace_blob_add_slow(a3, &__src, 1uLL);
    }
    else
    {
      *(unsigned char *)(*(void *)a3 + v11) = 125;
      unsigned int v12 = *(_DWORD *)(a3 + 8) + 1;
      *(_DWORD *)(a3 + 8) = v12;
      if (!*(unsigned char *)(a3 + 22)) {
        *(unsigned char *)(*(void *)a3 + v12) = 0;
      }
    }
  }
  return v10 == 0;
}

uint64_t ctf_member_parse(char a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v9 = ctf_type_size(*(void *)a4, a2);
  if ((unint64_t)(v9 - 1) >= 0xFFFF)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = v9;
  if (!*(unsigned char *)(a4 + 26))
  {
    uint64_t v16 = *(void *)(a4 + 8);
    if ((*(_WORD *)(v16 + 20) & 2) == 0)
    {
      uint64_t v17 = *(unsigned int *)(v16 + 8);
      if ((*(char *)(v16 + 22) + *(_DWORD *)(v16 + 12) - v17 - 1) <= 1) {
        goto LABEL_11;
      }
      *(_WORD *)(*(void *)v16 + v17) = 8236;
      unsigned int v18 = *(_DWORD *)(v16 + 8) + 2;
      *(_DWORD *)(v16 + 8) = v18;
      if (!*(unsigned char *)(v16 + 22)) {
        *(unsigned char *)(*(void *)v16 + v18) = 0;
      }
    }
  }
  while (1)
  {
    *(unsigned char *)(a4 + 26) = 0;
    os_trace_blob_addf(*(void *)(a4 + 8), "%s = ", v10, v11, v12, v13, v14, v15, a1);
    uint64_t v19 = *(void *)(a4 + 16);
    uint64_t v20 = v19 + (a3 >> 3);
    if (v20 + v4 <= v19 + (unint64_t)*(unsigned __int16 *)(a4 + 24)) {
      break;
    }
LABEL_10:
    _os_assert_log();
    uint64_t v16 = _os_crash();
    __break(1u);
LABEL_11:
    os_trace_blob_add_slow(v16, ", ", 2uLL);
  }
  return ctf_type_parse(*(void *)a4, a2, *(void *)(a4 + 8), v20, (unsigned __int16)v4) - 1;
}

uint64_t ctf_array(uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  v38[0] = 0;
  v38[1] = 0;
  uint64_t v39 = 0;
  if (ctf_array_info(a1, a2, (uint64_t)v38))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v5 = v38[0];
  if (ctf_type_kind((uint64_t)a1, v38[0]) != 1) {
    goto LABEL_17;
  }
  int v37 = 0;
  uint64_t __src = 0;
  if (ctf_type_encoding(a1, v5, (unsigned int *)&__src))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_52;
  }
  if ((__src & 2) == 0)
  {
LABEL_17:
    uint64_t v22 = ctf_type_size((uint64_t)a1, v5);
    if ((unint64_t)(v22 - 1) < 0xFFFF)
    {
      LODWORD(v6) = v22;
      unint64_t v7 = v39;
      if ((int)v39 * (int)v22 <= a5)
      {
        LOBYTE(__src) = 91;
        if ((*(_WORD *)(a3 + 20) & 2) != 0) {
          goto LABEL_23;
        }
        uint64_t v23 = *(unsigned int *)(a3 + 8);
        if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 != v23)
        {
          *(unsigned char *)(*(void *)a3 + v23) = 91;
          unsigned int v24 = *(_DWORD *)(a3 + 8) + 1;
          *(_DWORD *)(a3 + 8) = v24;
          if (!*(unsigned char *)(a3 + 22)) {
            *(unsigned char *)(*(void *)a3 + v24) = 0;
          }
LABEL_23:
          if (v7)
          {
LABEL_24:
            unsigned int v25 = 0;
            unint64_t v26 = 0;
            while ((ctf_type_parse((uint64_t)a1, v5, a3, a4 + v25, (unsigned __int16)v6) & 1) != 0)
            {
              if (v26 < (v7 - 1) && (*(_WORD *)(a3 + 20) & 2) == 0)
              {
                uint64_t v27 = *(unsigned int *)(a3 + 8);
                if ((*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - v27 - 1) <= 1)
                {
                  os_trace_blob_add_slow(a3, ", ", 2uLL);
                }
                else
                {
                  *(_WORD *)(*(void *)a3 + v27) = 8236;
                  unsigned int v28 = *(_DWORD *)(a3 + 8) + 2;
                  *(_DWORD *)(a3 + 8) = v28;
                  if (!*(unsigned char *)(a3 + 22)) {
                    *(unsigned char *)(*(void *)a3 + v28) = 0;
                  }
                }
              }
              ++v26;
              v25 += v6;
              if (v7 == v26) {
                goto LABEL_44;
              }
            }
            if ((*(_WORD *)(a3 + 20) & 2) != 0) {
              goto LABEL_37;
            }
            uint64_t v29 = *(unsigned int *)(a3 + 8);
            if ((*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - v29 - 1) > 6)
            {
              uint64_t v30 = (_DWORD *)(*(void *)a3 + v29);
              *(_DWORD *)((char *)v30 + 3) = 1047687026;
              *uint64_t v30 = 1920099644;
              unsigned int v31 = *(_DWORD *)(a3 + 8) + 7;
              *(_DWORD *)(a3 + 8) = v31;
              if (*(unsigned char *)(a3 + 22))
              {
LABEL_37:
                uint64_t v32 = 0;
                goto LABEL_45;
              }
              uint64_t v32 = 0;
              *(unsigned char *)(*(void *)a3 + v31) = 0;
LABEL_45:
              LOBYTE(__src) = 93;
              if ((*(_WORD *)(a3 + 20) & 2) == 0)
              {
                uint64_t v33 = *(unsigned int *)(a3 + 8);
                if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 == v33)
                {
                  os_trace_blob_add_slow(a3, &__src, 1uLL);
                }
                else
                {
                  *(unsigned char *)(*(void *)a3 + v33) = 93;
                  unsigned int v34 = *(_DWORD *)(a3 + 8) + 1;
                  *(_DWORD *)(a3 + 8) = v34;
                  if (!*(unsigned char *)(a3 + 22)) {
                    *(unsigned char *)(*(void *)a3 + v34) = 0;
                  }
                }
              }
              return v32;
            }
LABEL_52:
            os_trace_blob_add_slow(a3, "<error>", 7uLL);
            goto LABEL_37;
          }
LABEL_44:
          uint64_t v32 = 1;
          goto LABEL_45;
        }
LABEL_43:
        os_trace_blob_add_slow(a3, &__src, 1uLL);
        if (v7) {
          goto LABEL_24;
        }
        goto LABEL_44;
      }
LABEL_42:
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_43;
    }
LABEL_41:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_42;
  }
  unint64_t v6 = v39;
  if (v39 <= a5)
  {
    if (v39)
    {
      unint64_t v7 = 0;
      uint64_t v18 = MEMORY[0x1E4F14390];
      while (1)
      {
        unsigned int v19 = *(char *)(a4 + v7);
        if (!*(unsigned char *)(a4 + v7)) {
          break;
        }
        if ((v19 & 0x80000000) != 0) {
          int v20 = __maskrune(v19, 0x40000uLL);
        }
        else {
          int v20 = *(_DWORD *)(v18 + 4 * v19 + 60) & 0x40000;
        }
        ++v7;
        if (v20) {
          BOOL v21 = v7 >= v6;
        }
        else {
          BOOL v21 = 1;
        }
        if (v21) {
          goto LABEL_17;
        }
      }
      os_trace_blob_addf(a3, "\"%.*s\"", v12, v13, v14, v15, v16, v17, v6);
      return 1;
    }
    goto LABEL_17;
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t ctf_pointer(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned int a5)
{
  uint64_t v8 = ctf_type_size(a1, a2);
  if (v8 > a5)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  else
  {
    if (v8 == 8)
    {
      os_trace_blob_addf(a3, "0x%llx", v9, v10, v11, v12, v13, v14, *a4);
      return 1;
    }
    if (v8 == 4)
    {
      os_trace_blob_addf(a3, "0x%x", v9, v10, v11, v12, v13, v14, *(_DWORD *)a4);
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t ctf_float(uint64_t a1, uint64_t a2, uint64_t a3, double *a4, unsigned int a5)
{
  uint64_t v8 = ctf_type_size(a1, a2);
  if (v8 > a5)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  else
  {
    if (v8 == 8)
    {
      double v15 = *a4;
      goto LABEL_6;
    }
    if (v8 == 4)
    {
      double v15 = *(float *)a4;
LABEL_6:
      os_trace_blob_addf(a3, "%.20g", v9, v10, v11, v12, v13, v14, SLOBYTE(v15));
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t ctf_integer(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned int a5)
{
  uint64_t v8 = ctf_type_size(a1, a2);
  if (v8 > a5)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    JUMPOUT(0x1A115ADDCLL);
  }
  uint64_t v15 = v8;
  uint64_t result = 0;
  switch(v15)
  {
    case 1:
      LOBYTE(v17) = *a4;
      goto LABEL_6;
    case 2:
      LOWORD(v17) = *(_WORD *)a4;
      goto LABEL_6;
    case 4:
      int v17 = *(_DWORD *)a4;
LABEL_6:
      os_trace_blob_addf(a3, "%#x", v9, v10, v11, v12, v13, v14, v17);
      goto LABEL_8;
    case 8:
      os_trace_blob_addf(a3, "%#llx", v9, v10, v11, v12, v13, v14, *(void *)a4);
LABEL_8:
      uint64_t result = 1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _convertUUIDStringToUUID(const char *a1, unsigned __int8 *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (strlen(a1) == 32
    && (*a1 & 0x80000000) == 0
    && (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * *(unsigned __int8 *)a1 + 60) & 0x10000) != 0)
  {
    unint64_t v4 = 0;
    while (v4 != 31)
    {
      unint64_t v5 = v4;
      int v6 = a1[v4 + 1];
      if ((v6 & 0x80000000) == 0)
      {
        int v7 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v6 + 60);
        unint64_t v4 = v5 + 1;
        if ((v7 & 0x10000) != 0) {
          continue;
        }
      }
      if (v5 <= 0x1E) {
        goto LABEL_11;
      }
      break;
    }
    snprintf(__str, 0x25uLL, "%.8s-%.4s-%.4s-%.4s-%.12s", a1, a1 + 8, a1 + 12, a1 + 16, a1 + 20);
    uuid_parse(__str, a2);
    return 1;
  }
  else
  {
LABEL_11:
    _os_assumes_log();
    return 0;
  }
}

BOOL _simple_support_validate_chunk(uint64_t a1)
{
  return *(_DWORD *)a1 == 24580 && !*(_DWORD *)(a1 + 4) && *(void *)(a1 + 8) > 0x48uLL;
}

uint64_t _simple_support_validate_payload(uint64_t a1, unint64_t *a2)
{
  unint64_t v2 = *(void *)(a1 + 8) - 72;
  if (v2 < 0xC) {
    return 0;
  }
  uint64_t v3 = *(unsigned int *)(a1 + 92);
  uint64_t v4 = *(unsigned int *)(a1 + 96);
  unint64_t v5 = v3 + v4 + 12;
  if (v2 < v5
    || !v4
    || *(unsigned char *)(a1 + 100 + v3 + (v4 - 1))
    || v3 && *(unsigned char *)(a1 + 100 + (v3 - 1)))
  {
    return 0;
  }
  uint64_t result = a1 + 88;
  if (a2) {
    *a2 = v5;
  }
  return result;
}

void logging_support_test_oslog(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    uint64_t v3 = a1;
    _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LoggingSupportTest: %s", (uint8_t *)&v2, 0xCu);
  }
}

void sub_1A115D76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _os_log_set_nscf_formatter(uint64_t result)
{
  _NSCF_function = result;
  return result;
}

uint64_t _os_log_get_nscf_formatter()
{
  return _NSCF_function;
}

uint64_t requiresLogicalExpression(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    if ([v2 compoundPredicateType] == 2)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      uint64_t v3 = objc_msgSend(v2, "subpredicates", 0);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4)
      {
        uint64_t v5 = *(void *)v9;
        while (2)
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v9 != v5) {
              objc_enumerationMutation(v3);
            }
            if (requiresLogicalExpression(*(void *)(*((void *)&v8 + 1) + 8 * i)))
            {
              uint64_t v4 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL __ctf_metadata_open_ctf_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _ctf_open_buffer(a2, a3, a3, a4, a5, a6, a7, a8);
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t _ctf_open_buffer(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a1 != 53233 || *((unsigned char *)a1 + 2) != 4) {
    return 0;
  }
  long long v10 = ".SUNW_ctf";
  long long v11 = xmmword_1A118AD30;
  uint64_t v12 = a1;
  uint64_t v13 = a2;
  long long v14 = xmmword_1A118AD40;
  int v9 = 0;
  return ctf_bufopen((long long *)&v10, 0, 0, &v9, a5, a6, a7, a8);
}

void sub_1A1160C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _logHandle()
{
  if (_logHandle_onceToken != -1) {
    dispatch_once(&_logHandle_onceToken, &__block_literal_global_233);
  }
  uint64_t v0 = (void *)_logHandle_handle;
  return v0;
}

uint64_t ___logHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.loggingsupport", "os_log_statistics");
  uint64_t v1 = _logHandle_handle;
  _logHandle_handle = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1A116125C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2074(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2075(uint64_t a1)
{
}

uint64_t _state_support_decode_data(uint64_t a1)
{
  if ((*(_DWORD *)a1 - 2) >= 2)
  {
    if (*(_DWORD *)a1 == 1 && *(_DWORD *)(a1 + 4))
    {
      int v6 = (void *)MEMORY[0x1A622D720]();
      int v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a1 + 200 length:*(unsigned int *)(a1 + 4) freeWhenDone:0];
      long long v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:0];
      uint64_t v5 = [v8 description];

      return v5;
    }
    return 0;
  }
  size_t v2 = strlen((const char *)(a1 + 8));
  plugin = os_log_fmt_get_plugin((const char *)(a1 + 8), v2);
  if (!plugin) {
    return 0;
  }
  uint64_t v4 = (uint64_t (*)(uint64_t, void, uint64_t))plugin[4];
  if (!v4) {
    return 0;
  }
  return v4(a1 + 72, *(unsigned int *)(a1 + 4), a1 + 200);
}

#error "1A11615FC: call analysis failed (funcsize=18)"

BOOL _state_support_validate_chunk(uint64_t a1)
{
  return *(_DWORD *)a1 == 24579 && !*(_DWORD *)(a1 + 4) && *(void *)(a1 + 8) > 0x30uLL;
}

uint64_t _state_support_validate_payload(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if ((unint64_t)(v1 - 48) < 0xC8) {
    return 0;
  }
  if (v1 - 248 >= (unint64_t)*(unsigned int *)(a1 + 68)) {
    return a1 + 64;
  }
  return 0;
}

unsigned char *_state_support_create_message(uint64_t a1, void *a2)
{
  if (*(_DWORD *)a1 != 24579) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 4)) {
    return 0;
  }
  unint64_t v3 = *(void *)(a1 + 8);
  BOOL v4 = v3 >= 0xF8;
  unint64_t v5 = v3 - 248;
  if (!v4 || v5 < *(unsigned int *)(a1 + 68)) {
    return 0;
  }
  uint64_t v9 = (void *)_state_support_decode_data(a1 + 64);
  long long v10 = (const void *)(a1 + 200);
  size_t v11 = strnlen((const char *)(a1 + 200), 0x3FuLL);
  uint64_t v12 = [v9 lengthOfBytesUsingEncoding:4];
  if (v11 | v12)
  {
    size_t v13 = v11 + 1;
    uint64_t v14 = (unsigned char *)_os_trace_malloc();
    int v6 = v14;
    if (v11)
    {
      memcpy(v14, v10, v11);
      v6[v11] = 10;
      v6[v13] = 0;
    }
    else
    {
      size_t v13 = 0;
    }
    if (v12) {
      [v9 getCString:&v6[v13] maxLength:v12 + 1 encoding:4];
    }
  }
  else
  {
    size_t v13 = 0;
    int v6 = 0;
  }
  if (a2) {
    *a2 = v13 + v12;
  }

  return v6;
}

uint64_t _OSLogUUIDMapAddFromCatalog(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = ___OSLogUUIDMapAddFromCatalog_block_invoke;
  v8[3] = &__block_descriptor_40_e69_v16__0__catalog_procinfo_s_SSiQII_16C__16C___hashtable___hashtable__8l;
  uint64_t v4 = *(void *)(a1 + 40);
  v8[4] = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 0x40000000;
  long long v10 = ___catalog_for_each_procinfo_block_invoke;
  size_t v11 = &unk_1E5A41C80;
  uint64_t v12 = v8;
  if (v4)
  {
    for (uint64_t i = *(void **)(v4 + 16); i; uint64_t i = (void *)*i)
      ((void (*)(void *, void))v10)(v9, i[4]);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___OSLogUUIDMapAddFromCatalog_block_invoke_3;
  v7[3] = &__block_descriptor_40_e15_v24__0Q8_16C_16l;
  void v7[4] = a2;
  return _catalog_for_each_uuid(a1, (uint64_t)v7);
}

void _OSLogGenerateXattrs(uint64_t a1, unint64_t a2, uint64_t a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  uint64_t v9 = ___OSLogGenerateXattrs_block_invoke;
  long long v10 = &__block_descriptor_40_e767_B16__0__tracev3_chunk_s__tracev3_chunk_preamble_s_IIQ_____tracev3_chunk_header_s__mach_timebase_info_II_QqiiiI_tracev3_subchunk_preamble_s_II__tracev3_subchunk_continuous_s_Q__tracev3_subchunk_preamble_s_II__tracev3_subchunk_systeminfo_s_ii_16c__32c___tracev3_subchunk_preamble_s_II__tracev3_subchunk_generation_s__16C_ii__tracev3_subchunk_preamble_s_II__tracev3_subchunk_timezone_s__48c____tracev3_chunk_catalog_s_SSSS_0C___tracev3_chunk_catalog_v2_s_SSSSS_3S_Q_0C___tracev3_chunk_log_preamble_s_QIC_3C___tracev3_chunk_firehose_s_QICC_2C__0C___tracev3_chunk_firehose_old_s_QiCC_0C___tracev3_chunk_oversize_s_QIC_3C_QISS_0C___tracev3_chunk_oversize_old_s_QISS_0C___tracev3_chunk_statedump_s_QIC_3C_QQ_16C__0C___tracev3_chunk_simple_s_QICC_2C_QQQ_16C__16C__0C___0C___8l;
  uint64_t v11 = a3;
  unint64_t v5 = v8;
  unint64_t v6 = 0;
  do
  {
    if (a2 - v6 < 0x10) {
      break;
    }
    unint64_t v7 = *(void *)(a1 + v6 + 8);
    if (a2 - v6 - 16 < v7) {
      break;
    }
    if (!((unsigned int (*)(void *))v9)(v5)) {
      break;
    }
    unint64_t v6 = (v6 + v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  }
  while (v6 - 1 < a2);
}

void _OSLogWarningMessage(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = a1;
    vsnprintf(__str, 0x100uLL, a2, &a9);
    v10[2](v10, __str);
  }
}

uint64_t OSLogCreateArchive(const char *a1, uint64_t a2, int64_t a3, BOOL a4, void *a5)
{
  id v9 = a5;
  long long v10 = _InitArchiveDictionary(a1, a2, a3, a4);
  uint64_t ArchiveWithDictionary = OSLogCreateArchiveWithDictionary(v10, v9);

  return ArchiveWithDictionary;
}

id _InitArchiveDictionary(const char *a1, uint64_t a2, int64_t a3, BOOL a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "path", a1);
  if (a2) {
    xpc_dictionary_set_uint64(v8, "base_size", a2);
  }
  xpc_dictionary_set_int64(v8, "base_time", a3);
  xpc_dictionary_set_BOOL(v8, "livedata", a4);
  return v8;
}

uint64_t OSLogCreateArchiveWithDictionary(void *a1, void *a2)
{
  v72[5] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  string = xpc_dictionary_get_string(v3, "path");
  if (string) {
    unint64_t v6 = string;
  }
  else {
    unint64_t v6 = ".";
  }
  unint64_t v70 = 0;
  if (strcasestr(v6, ".logarchive"))
  {
    unint64_t v7 = strdup(v6);
    unint64_t v70 = v7;
  }
  else
  {
    asprintf(&v70, "%s/system_logs.logarchive", v6);
    unint64_t v7 = v70;
  }
  int v8 = mkdir(v7, 0x1FFu);
  char v9 = (char)v70;
  if (!v8)
  {
    int v18 = open(v70, 0);
    if (v18 == -1)
    {
      char v21 = (char)v70;
      uint64_t v22 = __error();
      strerror(*v22);
      __error();
      _OSLogWarningMessage(v4, "failed to open directory: %s: %s (%d)", v23, v24, v25, v26, v27, v28, v21);
      goto LABEL_9;
    }
    int v19 = v18;
    if (xpc_dictionary_get_int64(v3, "base_time") < 1) {
      uint64_t int64 = 0;
    }
    else {
      uint64_t int64 = xpc_dictionary_get_int64(v3, "base_time");
    }
    if ((uint64_t)xpc_dictionary_get_uint64(v3, "ttl_time") < 1) {
      uuint64_t int64 = 0;
    }
    else {
      uuint64_t int64 = xpc_dictionary_get_uint64(v3, "ttl_time");
    }
    if ((uint64_t)xpc_dictionary_get_uint64(v3, "sp_time") < 1) {
      uint64_t v30 = 0;
    }
    else {
      uint64_t v30 = xpc_dictionary_get_uint64(v3, "sp_time");
    }
    if ((uint64_t)xpc_dictionary_get_uint64(v3, "hv_time") <= 0)
    {
      if (uint64) {
        uint64_t v33 = uint64;
      }
      else {
        uint64_t v33 = int64;
      }
      if (v30) {
        uint64_t v34 = v30;
      }
      else {
        uint64_t v34 = int64;
      }
    }
    else
    {
      uint64_t v31 = xpc_dictionary_get_uint64(v3, "hv_time");
      uint64_t v32 = v31;
      if (uint64) {
        uint64_t v33 = uint64;
      }
      else {
        uint64_t v33 = int64;
      }
      if (v30) {
        uint64_t v34 = v30;
      }
      else {
        uint64_t v34 = int64;
      }
      if (v31)
      {
        if (int64) {
          goto LABEL_41;
        }
        goto LABEL_38;
      }
    }
    uint64_t v32 = int64;
    if (int64) {
      goto LABEL_41;
    }
LABEL_38:
    if ((uint64_t)xpc_dictionary_get_uint64(v3, "base_time") < 1) {
      uint64_t int64 = 0;
    }
    else {
      uint64_t int64 = xpc_dictionary_get_uint64(v3, "base_time");
    }
LABEL_41:
    uint64_t v35 = xpc_dictionary_get_value(v3, "livedata");
    size_t v36 = &unk_1EF44AF10;
    if (v35 && !xpc_dictionary_get_BOOL(v3, "livedata")) {
      size_t v36 = &unk_1EF44AF28;
    }

    v71[0] = _OSLogConstructPersistStart;
    int v37 = [MEMORY[0x1E4F28ED0] numberWithLong:int64];
    v72[0] = v37;
    v71[1] = _OSLogConstructSpecialStart;
    unsigned int v38 = [MEMORY[0x1E4F28ED0] numberWithLong:v33];
    v72[1] = v38;
    v71[2] = _OSLogConstructSignpostStart;
    uint64_t v39 = [MEMORY[0x1E4F28ED0] numberWithLong:v34];
    v72[2] = v39;
    v71[3] = _OSLogConstructHighVolumeStart;
    char v40 = [MEMORY[0x1E4F28ED0] numberWithLong:v32];
    v71[4] = @"_OSLogConstructSkipMemoryStores";
    v72[3] = v40;
    v72[4] = v36;
    uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:5];
    uint64_t v42 = (void *)[v41 mutableCopy];

    unsigned int v43 = xpc_dictionary_get_value(v3, "base_size");

    if (v43)
    {
      uint64_t v44 = xpc_dictionary_get_uint64(v3, "base_size");
      uint64_t v45 = [MEMORY[0x1E4F28ED0] numberWithLong:v44];
      [v42 setObject:v45 forKeyedSubscript:OSLogConstructPersistSizeLimit];
    }
    else
    {
      uint64_t v44 = -1;
    }
    size_t v46 = xpc_dictionary_get_value(v3, "ttl_size");

    if (v46)
    {
      uint64_t v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", xpc_dictionary_get_uint64(v3, "ttl_size"));
    }
    else
    {
      if (v44 == -1) {
        goto LABEL_52;
      }
      uint64_t v47 = [MEMORY[0x1E4F28ED0] numberWithLong:v44];
    }
    uint64_t v48 = (void *)v47;
    [v42 setObject:v47 forKeyedSubscript:OSLogConstructSpecialSizeLimit];

LABEL_52:
    uint64_t v49 = xpc_dictionary_get_value(v3, "sp_size");

    if (v49)
    {
      uint64_t v50 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", xpc_dictionary_get_uint64(v3, "sp_size"));
    }
    else
    {
      if (v44 == -1) {
        goto LABEL_57;
      }
      uint64_t v50 = [MEMORY[0x1E4F28ED0] numberWithLong:v44];
    }
    uint64_t v51 = (void *)v50;
    [v42 setObject:v50 forKeyedSubscript:OSLogConstructSignpostSizeLimit];

LABEL_57:
    unint64_t v52 = xpc_dictionary_get_value(v3, "hv_size");

    if (v52)
    {
      uint64_t v53 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", xpc_dictionary_get_uint64(v3, "hv_size"));
    }
    else
    {
      if (v44 == -1) {
        goto LABEL_62;
      }
      uint64_t v53 = [MEMORY[0x1E4F28ED0] numberWithLong:v44];
    }
    uint64_t v54 = (void *)v53;
    [v42 setObject:v53 forKeyedSubscript:OSLogConstructHighVolumeSizeLimit];

LABEL_62:
    uint64_t v55 = xpc_dictionary_get_string(v3, "predicate");
    if (v55)
    {
      uint64_t v56 = [NSString stringWithUTF8String:v55];
      [v42 setObject:v56 forKeyedSubscript:@"OSLogConstructPredicate"];

      uint64_t v57 = [NSString stringWithUTF8String:v70];
      [v42 setObject:v57 forKeyedSubscript:@"OSLogConstructTargetDir"];
    }
    free(v70);
    uint64_t v58 = getenv("SUDO_UID");
    uint64_t v59 = getenv("SUDO_GID");
    int v60 = 0;
    if (v58)
    {
      uint64_t v61 = v59;
      int v62 = 0;
      if (v59)
      {
        int v60 = strtoul(v58, 0, 10);
        int v62 = strtoul(v61, 0, 10);
      }
    }
    else
    {
      int v62 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __OSLogCreateArchiveWithDictionary_block_invoke;
    aBlock[3] = &unk_1E5A42DC0;
    id v63 = v4;
    aBlock[4] = v63;
    int v67 = v19;
    int v68 = v60;
    int v69 = v62;
    uint64_t v64 = _Block_copy(aBlock);
    OSLogConstructArchive(v42, v63, v64);
  }
  long long v10 = __error();
  strerror(*v10);
  __error();
  _OSLogWarningMessage(v4, "failed to create directory: %s: %s (%d)", v11, v12, v13, v14, v15, v16, v9);
LABEL_9:
  free(v70);
  uint64_t v17 = *__error();

  return v17;
}

uint64_t __OSLogCreateArchiveWithDictionary_block_invoke(uint64_t a1, int a2, const char *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  memset(&v60, 0, sizeof(v60));
  if (fstat(a2, &v60))
  {
    uint64_t v6 = *__error();
    if (fcntl(a2, 50, v61) == -1)
    {
      __error();
      _os_assumes_log();
    }
    unint64_t v7 = *(void **)(a1 + 32);
    strerror(v6);
    _OSLogWarningMessage(v7, "unable to stat temp fd: %s: %s (%d)", v8, v9, v10, v11, v12, v13, (char)v61);
    return v6;
  }
  if (!strcmp(a3, "."))
  {
    if (fcopyfile(a2, *(_DWORD *)(a1 + 40), 0, 4u))
    {
      uint64_t v24 = *(void **)(a1 + 32);
      uint64_t v25 = __error();
      char v26 = strerror(*v25);
      __error();
      _OSLogWarningMessage(v24, "failed to copyfile on root node: %s (%d)", v27, v28, v29, v30, v31, v32, v26);
      return *__error();
    }
    goto LABEL_16;
  }
  int v14 = *(_DWORD *)(a1 + 40);
  if ((v60.st_mode & 0xF000) != 0x4000)
  {
    int v33 = openat(v14, a3, 2562, 420);
    if (v33 == -1) {
      goto LABEL_24;
    }
    int v34 = v33;
    if (!fcopyfile(a2, v33, 0, 0xEu))
    {
      if (*(void *)(a1 + 44) && fchown(v34, *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48)) == -1)
      {
        __error();
        _os_assumes_log();
      }
      if (close(v34) != -1) {
        return 0;
      }
      int v56 = *__error();
      uint64_t v57 = *__error();
      if (v56 == 9)
      {
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = v57;
        __break(1u);
LABEL_33:
        if (*(void *)(a1 + 44) && fchown(v34, *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48)) == -1)
        {
          __error();
          _os_assumes_log();
        }
        if (close(v34) != -1) {
          return 0;
        }
        int v58 = *__error();
        uint64_t result = *__error();
        if (v58 == 9) {
          goto LABEL_42;
        }
      }
LABEL_38:
      _os_assumes_log();
      return 0;
    }
    uint64_t v35 = __error();
    uint64_t v6 = *v35;
    a1 = *(void *)(a1 + 32);
    strerror(*v35);
    _OSLogWarningMessage((void *)a1, "failed to copyfile: %s: %s (%d)", v36, v37, v38, v39, v40, v41, (char)a3);
    if (close(v34) != -1) {
      return v6;
    }
    int v42 = *__error();
    uint64_t v43 = *__error();
    if (v42 != 9)
    {
LABEL_23:
      _os_assumes_log();
      return v6;
    }
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E953C318 = v43;
    __break(1u);
LABEL_16:
    if (!*(void *)(a1 + 44) || fchown(*(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48)) != -1) {
      return 0;
    }
    __error();
    goto LABEL_38;
  }
  if (mkdirat(v14, a3, 0x1FFu))
  {
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = __error();
    strerror(*v16);
    __error();
    char v59 = (char)a3;
    uint64_t v23 = "failed to mkdir: %s: %s (%d)";
LABEL_25:
    _OSLogWarningMessage(v15, v23, v17, v18, v19, v20, v21, v22, v59);
    return *__error();
  }
  int v44 = openat(*(_DWORD *)(a1 + 40), a3, 0);
  if (v44 == -1)
  {
LABEL_24:
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v55 = __error();
    strerror(*v55);
    __error();
    char v59 = (char)a3;
    uint64_t v23 = "failed to open: %s: %s (%d)";
    goto LABEL_25;
  }
  int v34 = v44;
  if (!fcopyfile(a2, v44, 0, 4u)) {
    goto LABEL_33;
  }
  uint64_t v45 = __error();
  uint64_t v6 = *v45;
  size_t v46 = *(void **)(a1 + 32);
  strerror(*v45);
  _OSLogWarningMessage(v46, "failed to copyfile: %s: %s (%d)", v47, v48, v49, v50, v51, v52, (char)a3);
  if (close(v34) != -1) {
    return v6;
  }
  int v53 = *__error();
  uint64_t result = *__error();
  if (v53 != 9) {
    goto LABEL_23;
  }
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = result;
  __break(1u);
LABEL_42:
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = result;
  __break(1u);
  return result;
}

void OSLogConstructArchive(void *a1, void *a2, void *a3)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v70 = a2;
  a3;
  id v6 = [v5 objectForKey:@"OSLogConstructPredicate"];
  [v5 objectForKey:@"OSLogConstructTargetDir"];
  objc_claimAutoreleasedReturnValue();
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  unint64_t v7 = 0x1E4F28000;
  if (v6) {
    goto LABEL_44;
  }
  id v76 = v70;
  int is_development_build = _os_trace_is_development_build();
  uint64_t v9 = [NSString stringWithUTF8String:_os_trace_prefsdir_path()];
  v98 = v9;
  if (is_development_build)
  {
    uint64_t v10 = [NSString stringWithUTF8String:_os_trace_intprefsdir_path()];
    uint64_t v99 = v10;
    uint64_t v11 = [NSString stringWithUTF8String:_os_trace_sysprefsdir_path()];
    v100 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:3];
  }
  else
  {
    uint64_t v10 = [NSString stringWithUTF8String:_os_trace_sysprefsdir_path()];
    uint64_t v99 = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:2];
  }

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = v12;
  uint64_t v78 = [obj countByEnumeratingWithState:&v94 objects:v93 count:16];
  if (!v78)
  {
LABEL_41:
    id v6 = 0;
    goto LABEL_43;
  }
  uint64_t v77 = *(void *)v95;
  v75 = (void *)*MEMORY[0x1E4F281F8];
  key = (void *)*MEMORY[0x1E4F1CD10];
LABEL_7:
  uint64_t v82 = 0;
  while (1)
  {
    if (*(void *)v95 != v77) {
      objc_enumerationMutation(obj);
    }
    uint64_t v13 = *(void **)(*((void *)&v94 + 1) + 8 * v82);
    int v14 = (void *)MEMORY[0x1E4F1CB10];
    v92[0] = v13;
    v92[1] = @"com.apple.LoggingSupport.collect_override.plist";
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
    uint64_t v81 = [v14 fileURLWithPathComponents:v15];

    id v85 = 0;
    v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v81 error:&v85];
    id v16 = v85;
    v80 = v16;
    if (!v16) {
      break;
    }
    uint64_t v17 = [v16 domain];
    if (v17 != v75)
    {

LABEL_34:
      char v51 = [v13 UTF8String];
      id v52 = [v80 description];
      [v52 UTF8String];
      _OSLogWarningMessage(v76, "Unable to read plist %s: %s", v53, v54, v55, v56, v57, v58, v51);

      goto LABEL_39;
    }
    BOOL v50 = [v80 code] == 260;

    if (!v50) {
      goto LABEL_34;
    }
LABEL_39:

    if (++v82 == v78)
    {
      uint64_t v78 = [obj countByEnumeratingWithState:&v94 objects:v93 count:16];
      if (!v78) {
        goto LABEL_41;
      }
      goto LABEL_7;
    }
  }
  id v84 = v76;
  id v74 = v79;
  uint64_t v24 = [v74 valueForKeyPath:@"Events"];
  unint64_t v73 = v24;
  if (v24)
  {
    CFDictionaryRef v25 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
    CFDictionaryRef v26 = v25;
    if (v25)
    {
      uint64_t v83 = CFDictionaryGetValue(v25, key);
      CFRelease(v26);
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v27 = v24;
      id v28 = 0;
      uint64_t v29 = [v27 countByEnumeratingWithState:&v101 objects:buf count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v102 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void **)(*((void *)&v101 + 1) + 8 * i);
            uint64_t v39 = [v32 valueForKeyPath:@"Predicates"];
            if (v39)
            {
              size_t v46 = [v32 valueForKeyPath:@"Builds"];
              if (v46)
              {
                char v69 = (char)v83;
                uint64_t v47 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES %@"];
                uint64_t v48 = [v46 filteredArrayUsingPredicate:v47];
                if ([v48 count])
                {
                  if (v28)
                  {
                    char v69 = (char)v28;
                    uint64_t v49 = [NSString stringWithFormat:@"%@ && %@"];

                    id v28 = (id)v49;
                  }
                  else
                  {
                    id v28 = v39;
                  }
                }
              }
              else
              {
              }
            }
            else
            {
              _OSLogWarningMessage(v84, "Unable to find local predicates. Please make sure you use the 'Predicates' key.", v33, v34, v35, v36, v37, v38, v69);
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v101 objects:buf count:16];
        }
        while (v29);
      }

LABEL_38:
      id v6 = v28;

      if (v6)
      {

LABEL_43:
        unint64_t v7 = 0x1E4F28000uLL;
        if (v6)
        {
LABEL_44:
          [*(id *)(v7 + 3936) predicateWithFormat:v6 argumentArray:MEMORY[0x1E4F1CBF0]];
          objc_claimAutoreleasedReturnValue();
        }
        id v60 = v70;
        OSLogLogdAdminConnection();
        int v67 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        if (v67)
        {
          xpc_object_t v68 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v68, "operation", 0xAuLL);
          xpc_connection_send_message(v67, v68);
        }
        else
        {
          _OSLogWarningMessage(v60, "Coprocessors flush failed: no connection to logd", v61, v62, v63, v64, v65, v66, v69);
        }

        operator new();
      }
      goto LABEL_39;
    }
    char v59 = "Unable to identify build version. Quitting";
  }
  else
  {
    char v59 = "Unable to find local events. Please make sure you use the 'Events' key";
  }
  _OSLogWarningMessage(v84, v59, v18, v19, v20, v21, v22, v23, v69);
  uint64_t v83 = 0;
  id v28 = 0;
  goto LABEL_38;
}

void sub_1A1164834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37)
{
  _Unwind_Resume(a1);
}

uint64_t _OSLogCreateTempDirectory(void *a1, mode_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (issetugid()) {
    id v4 = 0;
  }
  else {
    id v4 = getenv("TMPDIR");
  }
  id v5 = "/tmp";
  if (v4) {
    id v5 = v4;
  }
  snprintf(__str, 0x400uLL, "%s/oslogarchive.XXXXXX", v5);
  if (!mkdtemp(__str))
  {
    int v17 = *__error();
    uint64_t v18 = __error();
    strerror(*v18);
    _OSLogWarningMessage(v3, "failed to create temporary directory: %d (%s)", v19, v20, v21, v22, v23, v24, v17);
    goto LABEL_16;
  }
  uint64_t v6 = open(__str, 2048);
  if (v6 == -1)
  {
    __error();
    CFDictionaryRef v25 = __error();
    strerror(*v25);
    _OSLogWarningMessage(v3, "failed to open temporary directory: %s (%d - %s)", v26, v27, v28, v29, v30, v31, (char)__str);
    goto LABEL_16;
  }
  uint64_t v7 = v6;
  if (rmdir(__str) == -1)
  {
    __error();
    _os_assumes_log();
  }
  if (!fchmod(v7, a2)) {
    goto LABEL_17;
  }
  uint64_t v8 = __error();
  strerror(*v8);
  __error();
  _OSLogWarningMessage(v3, "failed to set permissions: %s: %s (%d)", v9, v10, v11, v12, v13, v14, (char)__str);
  if (close(v7) != -1)
  {
LABEL_16:
    uint64_t v7 = 0xFFFFFFFFLL;
LABEL_17:

    return v7;
  }
  int v15 = *__error();
  uint64_t result = *__error();
  if (v15 != 9)
  {
    _os_assumes_log();
    __error();
    _os_assumes_log();
    goto LABEL_16;
  }
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = result;
  __break(1u);
  return result;
}

uint64_t OSLogStateCaptureForAllPIDs(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  *(_OWORD *)uint64_t v27 = xmmword_1A118AD60;
  size_t v26 = 0;
  uint64_t v2 = sysctl(v27, 4u, 0, &v26, 0, 0);
  if (v2)
  {
    uint64_t v9 = v2;
    _OSLogWarningMessage(v1, "Failed to get process list length", v3, v4, v5, v6, v7, v8, v25);
  }
  else
  {
    uint64_t v10 = (_DWORD *)_os_trace_malloc();
    uint64_t v9 = sysctl(v27, 4u, v10, &v26, 0, 0);
    if (v9)
    {
      _OSLogWarningMessage(v1, "Failed to get process list", v11, v12, v13, v14, v15, v16, v25);
      int v17 = 0;
    }
    else
    {
      size_t v18 = v26;
      size_t v19 = v26 / 0x288;
      uint64_t v20 = _os_trace_calloc();
      int v17 = (void *)v20;
      if (v18 >= 0x288)
      {
        if (v19 <= 1) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = v19;
        }
        uint64_t v22 = v10 + 10;
        uint64_t v23 = (_DWORD *)v20;
        do
        {
          *v23++ = *v22;
          v22 += 162;
          --v21;
        }
        while (v21);
      }
      _os_state_request_for_pidlist();
      usleep(0x16E360u);
    }
    free(v10);
    free(v17);
  }

  return v9;
}

uint64_t _OSLogCopyTraceFile(uint64_t a1, uint64_t a2, void **a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10)
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  uint64_t v18 = _os_trace_mmap();
  size_t v19 = (_DWORD *)v18;
  if (v18)
  {
    if (*(_DWORD *)v18 == 4096 && *(void *)(v18 + 8) > 0x27uLL)
    {
      uint64_t v20 = _os_trace_uuid_map_lookup(*a3, (void *)(v18 + 144));
      if (!v20)
      {
        uint64_t v31 = 0;
LABEL_14:
        if (munmap(v19, 0) == -1)
        {
          __error();
          _os_assumes_log();
        }
        goto LABEL_21;
      }
      unint64_t v21 = v20;
      uint64_t v22 = tmpfile();
      if (v22)
      {
        uint64_t v23 = v22;
        unsigned int fd = fileno(v22);
        if (v16)
        {
          uint64_t v24 = [NSString stringWithUTF8String:a2];
          char v25 = [v24 lastPathComponent];

          id v116 = v25;
          id v113 = v15;
          id v26 = v16;
          id v111 = v17;
          size_t v141 = 0;
          v142 = &v141;
          uint64_t v143 = 0x3032000000;
          v144 = __Block_byref_object_copy__2260;
          v145 = __Block_byref_object_dispose__2261;
          id v146 = 0;
          v139[0] = 0;
          v139[1] = v139;
          v139[2] = 0x3032000000;
          v139[3] = __Block_byref_object_copy__2260;
          v139[4] = __Block_byref_object_dispose__2261;
          id v110 = v26;
          id v140 = v110;
          v137[0] = 0;
          v137[1] = v137;
          v137[2] = 0x2020000000;
          char v138 = 0;
          uint64_t v159 = 0;
          uint64_t v158 = 0;
          long long v156 = 0u;
          long long v157 = 0u;
          long long v154 = 0u;
          long long v155 = 0u;
          long long v152 = 0u;
          long long v153 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          *(void *)&long long value = 0;
          uint64_t v160 = a10;
          *((void *)&value + 1) = -1;
          DWORD1(v155) = 0x10000;
          *((void *)&v154 + 1) = _os_trace_malloc();
          *((void *)&v156 + 1) = 0;
          *(void *)&long long v157 = v19;
          LODWORD(v158) = fd;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = ___OSLogCopyTraceFile_implWithRepack_block_invoke;
          aBlock[3] = &unk_1E5A42E38;
          aBlock[4] = v139;
          void aBlock[5] = &value;
          uint64_t v27 = _Block_copy(aBlock);
          uint64_t v28 = (void *)*((void *)&v155 + 1);
          *((void *)&v155 + 1) = v27;

          uint64_t v124 = MEMORY[0x1E4F143A8];
          uint64_t v125 = 3221225472;
          uint64_t v126 = (uint64_t)___OSLogCopyTraceFile_implWithRepack_block_invoke_2;
          v127 = &unk_1E5A42E60;
          v133 = v19;
          p_long long value = &value;
          v131 = &v141;
          id v114 = v113;
          id v130 = v114;
          v132 = v137;
          id v112 = v111;
          id v128 = v112;
          id v117 = v116;
          id v129 = v117;
          v135 = a3;

          if (*((void *)&v148 + 1)
            && (uint64_t v29 = (id *)(v142 + 5),
                obuint64_t j = (id)v142[5],
                char v30 = _repack_ttl_compact_close_catalog((uint64_t)&value, &obj),
                objc_storeStrong(v29, obj),
                (v30 & 1) == 0))
          {
            uint64_t v77 = [(id)v142[5] userInfo];
            id v78 = [v77 description];
            char v79 = [v78 UTF8String];
            _OSLogWarningMessage(v114, "failed to close catalog: %s", v80, v81, v82, v83, v84, v85, v79);

            uint64_t v31 = 0;
          }
          else
          {
            uint64_t v31 = v159;
          }
          _repack_context_cleanup((uint64_t)&value);

          _Block_object_dispose(v137, 8);
          _Block_object_dispose(v139, 8);

          _Block_object_dispose(&v141, 8);
        }
        else
        {
          uint64_t v115 = *(void *)(a10 + 16);
          uint64_t v54 = (uint64_t (**)(id, uint64_t, void))v14;
          id v55 = v15;
          uint64_t v124 = 0;
          uint64_t v125 = (uint64_t)&v124;
          uint64_t v126 = 0x2020000000;
          v127 = 0;
          long long v118 = v55;
          if (v21 <= 1 && v19[1] > 0x10u)
          {
            *(void *)&long long value = MEMORY[0x1E4F143A8];
            *((void *)&value + 1) = 3221225472;
            *(void *)&long long v148 = ___OSLogCopyTraceFile_impl_block_invoke;
            *((void *)&v148 + 1) = &unk_1E5A42E10;
            long long v150 = (unint64_t)a3;
            *(void *)&long long v151 = v19;
            *((void *)&v151 + 1) = v19;
            *(void *)&long long v152 = v115;
            id v86 = v55;
            *((void *)&v152 + 1) = a2;
            *(void *)&long long v153 = __PAIR64__(fd, a1);
            *(void *)&long long v149 = v86;
            *((void *)&v149 + 1) = &v124;

            uint64_t v31 = *(void *)(v125 + 24);
          }
          else
          {
            int v56 = _OSLogUUIDMapAddFromFile((uint64_t)v19, 0, v115, v55);
            if (v56)
            {
              if (fcntl(a1, 50, &value) == -1)
              {
                __error();
                _os_assumes_log();
              }
              strerror(v56);
              _OSLogWarningMessage(v118, "failed to index uuids: '%s' to '%s': %s (%d)", v57, v58, v59, v60, v61, v62, (char)&value);
            }
            *(void *)(v125 + 24) = 0;
            if (_OSLogFileFindExhaustivePoint(a1, a4, a5) && *__error() != 2)
            {
              int v63 = *__error();
              if (fcntl(a1, 50, &value) == -1)
              {
                __error();
                _os_assumes_log();
              }
              strerror(v63);
              _OSLogWarningMessage(v118, "failed to find sparse boundary: %s: %s (%d)", v64, v65, v66, v67, v68, v69, (char)&value);
              *(void *)(v125 + 24) = 0;
            }
            if (*(void *)(v125 + 24))
            {
              if (lseek(a1, 0, 0) == -1)
              {
                __error();
                _os_assumes_log();
              }
              int v70 = v54[2](v54, a1, a2);
              if (v70)
              {
                if (fcntl(a1, 50, &value) == -1)
                {
                  __error();
                  _os_assumes_log();
                }
                strerror(v70);
                _OSLogWarningMessage(v118, "failed copy: '%s' to '%s': %s (%d)", v71, v72, v73, v74, v75, v76, (char)&value);
                uint64_t v31 = -1;
                *(void *)(v125 + 24) = -1;
              }
              else
              {
                uint64_t v31 = *(void *)(v125 + 24);
              }
            }
            else
            {
              uint64_t v31 = 0;
            }
          }
          _Block_object_dispose(&v124, 8);
        }
        if ((v31 & 0x8000000000000000) == 0 && lseek(fd, 0, 2) >= 1)
        {
          if (_OSLogFileFindExhaustivePoint(fd, a4, a5) && *__error() != 2)
          {
            int v87 = *__error();
            if (fcntl(a1, 50, &value) == -1)
            {
              __error();
              _os_assumes_log();
            }
            strerror(v87);
            _OSLogWarningMessage(v15, "failed to find sparse boundary: %s: %s (%d)", v88, v89, v90, v91, v92, v93, (char)&value);
            uint64_t v31 = -1;
          }
          size_t v141 = 0;
          uint64_t v94 = _os_trace_mmap();
          long long v95 = (void *)v94;
          if (v94)
          {
            long long value = 0u;
            *(void *)&long long v148 = 0;
            LODWORD(value) = 1;
            *((void *)&v148 + 1) = -1;
            *(void *)&long long v149 = 0;
            _OSLogGenerateXattrs(v94, v141, (uint64_t)&value);
            if (munmap(v95, v141) == -1)
            {
              __error();
              _os_assumes_log();
            }
            if (fsetxattr(fd, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0) == -1)
            {
              __error();
              _os_assumes_log();
            }
          }
          if (fcopyfile(a1, fd, 0, 2u))
          {
            int v96 = *__error();
            if (fcntl(a1, 50, &value) == -1)
            {
              __error();
              _os_assumes_log();
            }
            strerror(v96);
            _OSLogWarningMessage(v15, "fcopyfile (stat only): '%s' to '%s': %s (%d)", v97, v98, v99, v100, v101, v102, (char)&value);
            uint64_t v31 = -1;
          }
          if (lseek(fd, 0, 0) == -1)
          {
            __error();
            _os_assumes_log();
          }
          int v103 = (*((uint64_t (**)(id, void, uint64_t))v14 + 2))(v14, fd, a2);
          if (v103)
          {
            if (fcntl(a1, 50, &value) == -1)
            {
              __error();
              _os_assumes_log();
            }
            strerror(v103);
            _OSLogWarningMessage(v15, "copy handler failed: '%s' to '%s': %s (%d)", v104, v105, v106, v107, v108, v109, (char)&value);
            uint64_t v31 = -1;
          }
        }
        if (fclose(v23) == -1)
        {
          __error();
          _os_assumes_log();
        }
        goto LABEL_14;
      }
      size_t v46 = __error();
      char v47 = strerror(*v46);
      __error();
      _OSLogWarningMessage(v15, "failed to create tmpfile: %s (%d)", v48, v49, v50, v51, v52, v53, v47);
    }
    else
    {
      if (fcntl(a1, 50, &value) == -1)
      {
        __error();
        _os_assumes_log();
      }
      _OSLogWarningMessage(v15, "File started with invalid header: '%s'", v32, v33, v34, v35, v36, v37, (char)&value);
    }
    uint64_t v31 = -1;
    goto LABEL_14;
  }
  int v38 = *__error();
  if (v38 == 34)
  {
    uint64_t v31 = 0;
  }
  else
  {
    if (fcntl(a1, 50, &value) == -1)
    {
      __error();
      _os_assumes_log();
    }
    strerror(v38);
    _OSLogWarningMessage(v15, "could not mmap(): %s: %s (%d)", v39, v40, v41, v42, v43, v44, (char)&value);
    uint64_t v31 = -1;
  }
LABEL_21:

  return v31;
}

void sub_1A116579C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

int *_OSLogCopyBook(int a1, const char *a2, uint64_t a3, char *a4, void *a5, void *a6, uint64_t a7, void *a8, void *a9)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  uint64_t v60 = 0;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2020000000;
  int v63 = 0;
  if (!a3) {
    goto LABEL_14;
  }
  int v20 = openat(a1, a2, 0);
  if (v20 == -1)
  {
    int v29 = *__error();
    *((_DWORD *)v61 + 6) = v29;
    if (v29 != 2)
    {
      strerror(v29);
      _OSLogWarningMessage(v19, "failed to open '%s': %s", v31, v32, v33, v34, v35, v36, (char)a2);
      goto LABEL_19;
    }
LABEL_14:
    uint64_t v30 = 0;
LABEL_20:
    _Block_object_dispose(&v60, 8);

    return (int *)v30;
  }
  uint64_t TempDirectory = _OSLogCreateTempDirectory(v19, 0x1FFu);
  if (TempDirectory == -1)
  {
    *((_DWORD *)v61 + 6) = *__error();
    if (close(v20) != -1) {
      goto LABEL_19;
    }
    if (*__error() != 9) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
  int v22 = (*((uint64_t (**)(id, uint64_t, const char *))v18 + 2))(v18, TempDirectory, a2);
  *((_DWORD *)v61 + 6) = v22;
  if (v22)
  {
    if (fcntl(TempDirectory, 50, &v65) == -1)
    {
      __error();
      _os_assumes_log();
    }
    strerror(*((_DWORD *)v61 + 6));
    _OSLogWarningMessage(v19, "copy handler failed for directory fd: '%s' to '%s': %s (%d)", v23, v24, v25, v26, v27, v28, (char)&v65);
    if (close(v20) == -1)
    {
      if (*__error() == 9)
      {
        uint64_t v38 = *__error();
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = v38;
        __break(1u);
LABEL_31:
        uint64_t v39 = *__error();
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = v39;
        __break(1u);
LABEL_32:
        uint64_t v40 = *__error();
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = v40;
        __break(1u);
        goto LABEL_33;
      }
      __error();
      _os_assumes_log();
    }
    if (close(TempDirectory) != -1)
    {
LABEL_19:
      uint64_t v30 = *((unsigned int *)v61 + 6);
      goto LABEL_20;
    }
    if (*__error() != 9)
    {
LABEL_12:
      __error();
      _os_assumes_log();
      goto LABEL_19;
    }
    goto LABEL_31;
  }
  v64[0] = 0;
  v64[1] = 0;
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = ___OSLogCopyBook_block_invoke;
  v43[3] = &unk_1E5A42E88;
  uint64_t v52 = a4;
  uint64_t v53 = v64;
  uint64_t v51 = a2;
  uint64_t v48 = &v65;
  id v46 = v18;
  id v47 = v19;
  id v44 = v16;
  id v45 = v17;
  uint64_t v49 = &v56;
  uint64_t v54 = a7;
  uint64_t v55 = a3;
  uint64_t v50 = &v60;
  _OSLogEnumerateFiles(v47, v20, v43);
  if (close(TempDirectory) == -1)
  {
    if (*__error() == 9)
    {
LABEL_33:
      uint64_t v41 = *__error();
      qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1E953C318 = v41;
      __break(1u);
      goto LABEL_34;
    }
    __error();
    _os_assumes_log();
  }
  if (close(v20) != -1)
  {
LABEL_27:
    if (v57[3] >= 1) {
      _timesync_range_intersect(a4, v64, v66[3], 0, 0);
    }
    uint64_t v30 = *((unsigned int *)v61 + 6);

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v65, 8);
    goto LABEL_20;
  }
  if (*__error() != 9)
  {
    __error();
    _os_assumes_log();
    goto LABEL_27;
  }
LABEL_34:
  uint64_t result = __error();
  uint64_t v42 = *result;
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = v42;
  __break(1u);
  return result;
}

void sub_1A1165CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

int *_OSLogCopyDirectory(int a1, uint64_t a2, void *a3, void *a4, char a5)
{
  v37[128] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a3;
  id v10 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 0;
  uint64_t TempDirectory = _OSLogCreateTempDirectory(v10, 0x1FFu);
  if (TempDirectory == -1)
  {
    uint64_t v20 = *__error();
    *((_DWORD *)v34 + 6) = v20;
    goto LABEL_14;
  }
  int v12 = v9[2](v9, TempDirectory, a2);
  uint64_t v13 = v34;
  *((_DWORD *)v34 + 6) = v12;
  if (!v12)
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    *((_DWORD *)v13 + 6) = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = ___OSLogCopyDirectory_block_invoke;
    v24[3] = &unk_1E5A42EB0;
    char v32 = a5;
    uint64_t v29 = a2;
    uint64_t v27 = &v33;
    uint64_t v25 = v9;
    int v31 = TempDirectory;
    id v26 = v10;
    uint64_t v28 = v37;
    uint64_t v30 = 0;
    _OSLogEnumerateFiles(v26, a1, v24);
    if (close(TempDirectory) == -1)
    {
      if (*__error() == 9) {
        goto LABEL_16;
      }
      __error();
      _os_assumes_log();
    }
    uint64_t v20 = *((unsigned int *)v34 + 6);

    _Block_object_dispose(v37, 8);
    goto LABEL_14;
  }
  if (fcntl(TempDirectory, 50, v37) == -1)
  {
    __error();
    _os_assumes_log();
  }
  strerror(*((_DWORD *)v34 + 6));
  _OSLogWarningMessage(v10, "copy handler failed for directory fd: '%s' to '%s': %s (%d)", v14, v15, v16, v17, v18, v19, (char)v37);
  if (close(TempDirectory) != -1) {
    goto LABEL_8;
  }
  if (*__error() != 9)
  {
    __error();
    _os_assumes_log();
LABEL_8:
    uint64_t v20 = *((unsigned int *)v34 + 6);
LABEL_14:
    _Block_object_dispose(&v33, 8);

    return (int *)v20;
  }
  uint64_t v22 = *__error();
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = v22;
  __break(1u);
LABEL_16:
  uint64_t result = __error();
  uint64_t v23 = *result;
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = v23;
  __break(1u);
  return result;
}

void sub_1A1166030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t _OSLogUUIDMapCopySet(int a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  uint64_t v16 = ___OSLogUUIDMapCopySet_block_invoke;
  uint64_t v17 = &unk_1E5A42ED8;
  int v22 = a1;
  uint64_t v20 = &v27;
  unint64_t v21 = &v23;
  id v9 = v7;
  id v18 = v9;
  id v10 = v8;
  id v19 = v10;
  uint64_t v11 = *(const unsigned __int8 **)(a2 + 16);
  if (v11)
  {
    do
    {
      v16((uint64_t)v15, v11 + 16, *((void *)v11 + 4));
      uint64_t v11 = *(const unsigned __int8 **)v11;
    }
    while (v11);
    uint64_t v12 = v24[3];
  }
  else
  {
    uint64_t v12 = 0;
  }
  _os_trace_str_map_destroy(v12);
  uint64_t v13 = *((unsigned int *)v28 + 6);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

uint64_t _OSLogArchiveCreateInfoPlist(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v14 = a1;
  id v111 = a8;
  id v98 = a9;
  uint64_t v109 = a2;
  if (*(void *)a2) {
    uint64_t v107 = *(void *)(*(void *)a2 + 24);
  }
  else {
    uint64_t v107 = 0;
  }
  memset(out, 0, 37);
  memset(v148, 0, 37);
  uuid_unparse_upper((const unsigned __int8 *)(a3 + 24), out);
  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v16 = [v14 objectForKeyedSubscript:@"ttl01"];

  if (v16)
  {
    uint64_t v17 = [v14 objectForKeyedSubscript:@"ttl01"];
    [v15 setObject:v17 forKeyedSubscript:@"ttl01"];
  }
  id v18 = [v14 objectForKeyedSubscript:@"ttl03"];

  if (v18)
  {
    id v19 = [v14 objectForKeyedSubscript:@"ttl03"];
    [v15 setObject:v19 forKeyedSubscript:@"ttl03"];
  }
  uint64_t v20 = [v14 objectForKeyedSubscript:@"ttl07"];

  if (v20)
  {
    unint64_t v21 = [v14 objectForKeyedSubscript:@"ttl07"];
    [v15 setObject:v21 forKeyedSubscript:@"ttl07"];
  }
  int v22 = [v14 objectForKeyedSubscript:@"ttl14"];

  if (v22)
  {
    uint64_t v23 = [v14 objectForKeyedSubscript:@"ttl14"];
    [v15 setObject:v23 forKeyedSubscript:@"ttl14"];
  }
  uint64_t v24 = [v14 objectForKeyedSubscript:@"ttl30"];

  if (v24)
  {
    uint64_t v25 = [v14 objectForKeyedSubscript:@"ttl30"];
    [v15 setObject:v25 forKeyedSubscript:@"ttl30"];
  }
  long long v120 = v15;
  id v112 = v14;
  unsigned __int16 v121 = [v14 objectForKeyedSubscript:@"Identifier"];
  if (!v121)
  {
    uint64_t v26 = [MEMORY[0x1E4F29128] UUID];
    unsigned __int16 v121 = [v26 UUIDString];
  }
  v146[0] = @"OldestTimeRef";
  v144[0] = @"UUID";
  uint64_t v27 = [NSString stringWithUTF8String:out];
  v145[0] = v27;
  v144[1] = @"ContinuousTime";
  uint64_t v28 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(a3 + 8)];
  v145[1] = v28;
  v144[2] = @"WallTime";
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, (void *)(a3 + 24), *(void *)(a3 + 8), 0));
  v145[2] = v29;
  int v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:3];
  v146[1] = @"TTL";
  v147[0] = v30;
  v147[1] = v15;
  uint64_t v119 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v146 count:2];

  uuid_unparse_upper((const unsigned __int8 *)(a4 + 24), out);
  v142 = @"OldestTimeRef";
  v140[0] = @"UUID";
  uint64_t v31 = [NSString stringWithUTF8String:out];
  v141[0] = v31;
  v140[1] = @"ContinuousTime";
  char v32 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(a4 + 8)];
  v141[1] = v32;
  v140[2] = @"WallTime";
  uint64_t v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, (void *)(a4 + 24), *(void *)(a4 + 8), 0));
  v141[2] = v33;
  uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v140 count:3];
  uint64_t v143 = v34;
  long long v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];

  uuid_unparse_upper((const unsigned __int8 *)(a5 + 24), out);
  char v138 = @"OldestTimeRef";
  v136[0] = @"UUID";
  uint64_t v35 = [NSString stringWithUTF8String:out];
  v137[0] = v35;
  v136[1] = @"ContinuousTime";
  int v36 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(a5 + 8)];
  v137[1] = v36;
  v136[2] = @"WallTime";
  uint64_t v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, (void *)(a5 + 24), *(void *)(a5 + 8), 0));
  v137[2] = v37;
  uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:v136 count:3];
  v139 = v38;
  id v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];

  if (a6)
  {
    uuid_unparse_upper((const unsigned __int8 *)(a6 + 24), out);
    v134 = @"OldestTimeRef";
    v132[0] = @"UUID";
    uint64_t v39 = [NSString stringWithUTF8String:out];
    v133[0] = v39;
    v132[1] = @"ContinuousTime";
    uint64_t v40 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(a6 + 8)];
    v133[1] = v40;
    v132[2] = @"WallTime";
    uint64_t v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, (void *)(a6 + 24), *(void *)(a6 + 8), 0));
    v133[2] = v41;
    uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:v132 count:3];
    v135 = v42;
    id v114 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
  }
  else
  {
    id v114 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  uuid_unparse_upper((const unsigned __int8 *)(v109 + 24), out);
  uint64_t v43 = (unsigned __int8 *)(v109 + 24 + 16 * v107 - 16);
  uuid_unparse_upper(v43, v148);
  v131[0] = &unk_1EF44AF40;
  v130[0] = @"OSArchiveVersion";
  v130[1] = @"OSLoggingSupportProject";
  id v44 = strdup("libtrace-1612.62.2\n");
  if (v44)
  {
    id v45 = v44;
    id v46 = strchr(v44, 10);
    if (v46) {
      *id v46 = 0;
    }
    id v47 = [NSString alloc];
    size_t v48 = strlen(v45);
    uint64_t v49 = v47;
    unint64_t v50 = 0x1E4F29000;
    id v44 = (char *)[v49 initWithBytesNoCopy:v45 length:v48 encoding:4 freeWhenDone:1];
  }
  else
  {
    unint64_t v50 = 0x1E4F29000uLL;
  }
  uint64_t v108 = v44;
  v131[1] = v44;
  v130[2] = @"OSLoggingSupportVersion";
  uint64_t v106 = [MEMORY[0x1E4F28ED0] numberWithDouble:1612.62];
  v131[2] = v106;
  v130[3] = @"ArchiveIdentifier";
  uint64_t v105 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v104 = [v105 UUIDString];
  v131[3] = v104;
  v131[4] = v121;
  v130[4] = @"SourceIdentifier";
  v130[5] = @"EndTimeRef";
  v128[0] = @"UUID";
  int v103 = [*(id *)(v50 + 24) stringWithUTF8String:v148];
  v129[0] = v103;
  v128[1] = @"ContinuousTime";
  uint64_t v102 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(v109 + 16)];
  v129[1] = v102;
  v128[2] = @"WallTime";
  uint64_t v101 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, v43, *(void *)(v109 + 16), 0));
  v129[2] = v101;
  uint64_t v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v129 forKeys:v128 count:3];
  v131[5] = v100;
  v130[6] = @"PersistMetadata";
  uint64_t v126 = @"OldestTimeRef";
  v124[0] = @"UUID";
  uint64_t v99 = [*(id *)(v50 + 24) stringWithUTF8String:out];
  v125[0] = v99;
  v124[1] = @"ContinuousTime";
  uint64_t v51 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(v109 + 8)];
  v125[1] = v51;
  v124[2] = @"WallTime";
  uint64_t v52 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, (void *)(v109 + 24), *(void *)(v109 + 8), 0));
  v125[2] = v52;
  uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:3];
  v127 = v53;
  uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
  v131[6] = v54;
  v131[7] = v119;
  v130[7] = @"SpecialMetadata";
  v130[8] = @"SignpostMetadata";
  v131[8] = v118;
  v131[9] = v116;
  v130[9] = @"HighVolumeMetadata";
  v130[10] = @"LiveMetadata";
  v131[10] = v114;
  v130[11] = @"PersistSizeLimit";
  uint64_t v55 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*a7];
  v131[11] = v55;
  v130[12] = @"SpecialSizeLimit";
  uint64_t v56 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a7[3]];
  v131[12] = v56;
  v130[13] = @"SignpostSizeLimit";
  uint64_t v57 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a7[6]];
  v131[13] = v57;
  v130[14] = @"HighVolumeSizeLimit";
  uint64_t v58 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a7[9]];
  v131[14] = v58;
  uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v131 forKeys:v130 count:15];
  uint64_t v60 = (void *)[v59 mutableCopy];

  if (a11) {
    [v60 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"CollectedWithPredicate"];
  }
  uint64_t v122 = 0;
  uint64_t v61 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v60 format:100 options:0 error:&v122];
  uint64_t v62 = tmpfile();
  if (!v62)
  {
    uint64_t v81 = __error();
    char v82 = strerror(*v81);
    __error();
    uint64_t v73 = v98;
    _OSLogWarningMessage(v98, "unable to create Info.plist tempfile: %s (%d)", v83, v84, v85, v86, v87, v88, v82);
    uint64_t v80 = 0xFFFFFFFFLL;
    uint64_t v66 = v111;
    uint64_t v68 = (void *)v119;
    goto LABEL_43;
  }
  int v63 = v62;
  fileno(v62);
  id v64 = v61;
  [v64 bytes];
  [v64 length];
  if (_os_trace_write() < 0)
  {
    uint64_t v89 = __error();
    char v97 = strerror(*v89);
    __error();
    uint64_t v73 = v98;
    _OSLogWarningMessage(v98, "failed to write to tempfile: %s (%d)", v90, v91, v92, v93, v94, v95, v97);
    uint64_t v66 = v111;
    uint64_t v68 = (void *)v119;
    if (fclose(v63) != -1)
    {
LABEL_36:
      uint64_t v80 = 0xFFFFFFFFLL;
      goto LABEL_43;
    }
LABEL_39:
    __error();
    _os_assumes_log();
    goto LABEL_36;
  }
  int v65 = fileno(v63);
  uint64_t v66 = v111;
  if (fchmod(v65, 0x1A4u) == -1)
  {
    __error();
    _os_assumes_log();
  }
  int v67 = fileno(v63);
  uint64_t v68 = (void *)v119;
  if (lseek(v67, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  uint64_t v69 = fileno(v63);
  int v70 = (*((uint64_t (**)(id, uint64_t, const char *))v111 + 2))(v111, v69, "Info.plist");
  if (v70)
  {
    int v71 = v70;
    int v72 = fileno(v63);
    if (fcntl(v72, 50, v123) == -1)
    {
      __error();
      _os_assumes_log();
    }
    strerror(v71);
    uint64_t v73 = v98;
    _OSLogWarningMessage(v98, "failed copy handler: '%s' to 'Info.plist': %s (%d)", v74, v75, v76, v77, v78, v79, (char)v123);
    if (fclose(v63) != -1) {
      goto LABEL_36;
    }
    goto LABEL_39;
  }
  if (fclose(v63) == -1)
  {
    __error();
    _os_assumes_log();
  }
  uint64_t v80 = 0;
  uint64_t v73 = v98;
LABEL_43:

  return v80;
}

uint64_t _OSLogUUIDMapCopyUUID(int a1, const unsigned __int8 *a2, int a3, uint64_t **a4, void *a5, void *a6)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  if (uuid_is_null(a2)) {
    goto LABEL_4;
  }
  _os_trace_uuiddb_get_pathsuffix((uint64_t)a2, a3, __str, 0x400uLL);
  _os_trace_uuiddb_get_pathsuffix((uint64_t)a2, a3 | 0x10, __s, 0x400uLL);
  if (_os_trace_str_map_lookup(*a4, __s))
  {
LABEL_3:
    if (_os_trace_str_map_lookup(*a4, __str))
    {
LABEL_4:
      uint64_t v13 = 0;
LABEL_5:

      return v13;
    }
    goto LABEL_13;
  }
  uint64_t TempDirectory = _OSLogCreateTempDirectory(v12, 0x1EDu);
  if (TempDirectory == -1)
  {
    uint64_t v13 = *__error();
    goto LABEL_5;
  }
  int v16 = TempDirectory;
  uint64_t v17 = (*((uint64_t (**)(id, uint64_t, char *))v11 + 2))(v11, TempDirectory, __s);
  if (!v17)
  {
    _os_trace_str_map_insert(a4, __s, 1);
    if (close(v16) == -1)
    {
      int v41 = *__error();
      uint64_t result = *__error();
      if (v41 == 9)
      {
LABEL_31:
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = result;
        __break(1u);
        goto LABEL_32;
      }
      _os_assumes_log();
    }
    goto LABEL_3;
  }
  uint64_t v13 = v17;
  if (fcntl(v16, 50, v43) == -1)
  {
    __error();
    _os_assumes_log();
  }
  strerror(v13);
  _OSLogWarningMessage(v12, "failed copy handler: '%s' to '%s': %s (%d)", v18, v19, v20, v21, v22, v23, (char)v43);
  if (close(v16) != -1) {
    goto LABEL_5;
  }
  a4 = (uint64_t **)*__error();
  uint64_t v24 = *__error();
  if (a4 != 9)
  {
LABEL_19:
    _os_assumes_log();
    goto LABEL_5;
  }
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = v24;
  __break(1u);
LABEL_13:
  uint64_t v25 = openat(a1, __str, 0);
  if (v25 == -1)
  {
    uint64_t v13 = *__error();
    if (fcntl(a1, 50, v43) == -1)
    {
      __error();
      _os_assumes_log();
    }
    strerror(v13);
    _OSLogWarningMessage(v12, "uuid text missing: %s/%s: %s (%d)", v35, v36, v37, v38, v39, v40, (char)v43);
    goto LABEL_5;
  }
  int v26 = v25;
  uint64_t v27 = (*((uint64_t (**)(id, uint64_t, char *))v11 + 2))(v11, v25, __str);
  if (v27)
  {
    uint64_t v13 = v27;
    if (fcntl(v26, 50, v43) == -1)
    {
      __error();
      _os_assumes_log();
    }
    strerror(v13);
    _OSLogWarningMessage(v12, "failed copy handler: '%s' to '%s': %s (%d)", v28, v29, v30, v31, v32, v33, (char)v43);
    if (close(v26) != -1) {
      goto LABEL_5;
    }
    int v34 = *__error();
    uint64_t result = *__error();
    if (v34 != 9) {
      goto LABEL_19;
    }
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E953C318 = result;
    __break(1u);
    goto LABEL_31;
  }
  _os_trace_str_map_insert(a4, __str, 1);
  if (close(v26) != -1) {
    goto LABEL_4;
  }
  int v42 = *__error();
  uint64_t result = *__error();
  if (v42 != 9)
  {
    _os_assumes_log();
    goto LABEL_4;
  }
LABEL_32:
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = result;
  __break(1u);
  return result;
}

void _OSLogEnumerateFiles(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  int v7 = _os_trace_fdscandir_b();
  if (v7 < 1)
  {
LABEL_16:
    _os_trace_scandir_free_namelist();

    return;
  }
  for (unsigned int i = v7; ; --i)
  {
    uint64_t v9 = i - 1;
    uint64_t v10 = openat(a2, (const char *)(*(void *)(8 * v9) + 21), 0);
    if (v10 != -1) {
      break;
    }
    if (*__error() != 2)
    {
      uint64_t v15 = *(void *)(8 * v9) + 21;
      int v16 = __error();
      strerror(*v16);
      __error();
      _OSLogWarningMessage(v5, "failed to open: '%s': %s (%d)", v17, v18, v19, v20, v21, v22, v15);
    }
    if (i < 2) {
      goto LABEL_16;
    }
LABEL_13:
    ;
  }
  uint64_t v11 = v10;
  id v12 = (void *)MEMORY[0x1A622D720]();
  char v13 = (*((uint64_t (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v11, *(void *)(8 * v9) + 21);
  if (close(v11) != -1)
  {
LABEL_5:
    if (i > 1) {
      char v14 = v13;
    }
    else {
      char v14 = 0;
    }
    if ((v14 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  int v23 = *__error();
  uint64_t v24 = *__error();
  if (v23 != 9)
  {
    _os_assumes_log();
    goto LABEL_5;
  }
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = v24;
  __break(1u);
}

uint64_t _OSLogUUIDMapAddFromFile(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  uint64_t v15 = (unsigned int (*)(void *))___OSLogUUIDMapAddFromFile_block_invoke;
  int v16 = &unk_1E5A42DE8;
  id v8 = v7;
  id v17 = v8;
  uint64_t v18 = &v20;
  uint64_t v19 = a3;
  uint64_t v9 = v14;
  unint64_t v10 = 0;
  do
  {
    if (a2 - v10 < 0x10) {
      break;
    }
    unint64_t v11 = *(void *)(a1 + v10 + 8);
    if (a2 - v10 - 16 < v11) {
      break;
    }
    if (!v15(v9)) {
      break;
    }
    unint64_t v10 = (v10 + v11 + 23) & 0xFFFFFFFFFFFFFFF8;
  }
  while (v10 - 1 < a2);

  uint64_t v12 = *((unsigned int *)v21 + 6);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void sub_1A1167BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2260(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2261(uint64_t a1)
{
}

uint64_t OSLogCreateArchiveWithPredicate(const char *a1, uint64_t a2, int64_t a3, BOOL a4, const char *a5, void *a6)
{
  id v11 = a6;
  uint64_t v12 = _InitArchiveDictionary(a1, a2, a3, a4);
  xpc_dictionary_set_string(v12, "predicate", a5);
  uint64_t ArchiveWithDictionary = OSLogCreateArchiveWithDictionary(v12, v11);

  return ArchiveWithDictionary;
}

int64_t OSLogFlushBuffers()
{
  OSLogLogdAdminConnection();
  os_log_t v0 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v1, "operation", 0xBuLL);
    xpc_object_t v2 = xpc_connection_send_message_with_reply_sync(v0, v1);
    uint64_t v3 = v2;
    if (v2)
    {
      if (MEMORY[0x1A622E220](v2) == MEMORY[0x1E4F145A8])
      {
        int64_t int64 = 22;
      }
      else if (xpc_dictionary_get_uint64(v3, "errorcode"))
      {
        int64_t int64 = 1;
      }
      else
      {
        int64_t int64 = xpc_dictionary_get_int64(v3, "st");
      }
    }
    else
    {
      int64_t int64 = 96;
    }
  }
  else
  {
    int64_t int64 = 53;
  }

  return int64;
}

char *os_trace_copy_formatted_message(uint64_t a1)
{
  v24[128] = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0x10000;
  v22[0] = v24;
  v22[1] = 0x40000000000;
  xpc_object_t v2 = *(char **)(a1 + 96);
  if (!v2)
  {
    uint64_t v20 = *(const char **)(a1 + 88);
    if (!v20) {
      uint64_t v20 = "<compose failure [missing precomposed trace]>";
    }
    return strdup(v20);
  }
  uint64_t v3 = *(void *)(a1 + 104);
  if ((unint64_t)(v3 - 1733) < 0xFFFFFFFFFFFFF93CLL) {
    goto LABEL_17;
  }
  id v5 = &v2[v3 - 1];
  uint64_t v4 = *v5;
  if ((_WORD)v3 + ~(_WORD)v4 + 2 * (_WORD)v4 == 0xFFFE) {
    goto LABEL_17;
  }
  MEMORY[0x1F4188790]();
  id v7 = (unsigned __int8 *)&v22[-1] - v6;
  bzero((char *)&v22[-1] - v6, v8);
  unsigned __int8 *v7 = 0;
  v7[1] = v4;
  if (v4)
  {
    uint64_t v9 = -v4;
    unint64_t v10 = &v2[v3 + ~v4];
    id v11 = v7 + 2;
    while (1)
    {
      size_t v12 = v5[v9] & 0x3F;
      if (&v2[v12] > v10) {
        break;
      }
      unsigned char *v11 = 0;
      v11[1] = v12;
      char v13 = v11 + 2;
      memcpy(v11 + 2, v2, v12);
      id v11 = &v13[v12];
      v2 += v12;
      if (__CFADD__(v9++, 1)) {
        goto LABEL_9;
      }
    }
LABEL_17:
    uint64_t v20 = "<compose failure [corrupt trace]>";
    return strdup(v20);
  }
LABEL_9:
  uint64_t v21 = 0;
  uint64_t v15 = *(char **)(a1 + 88);
  if (!v15)
  {
    int v16 = _os_log_resolve_format(*(__n128 **)(a1 + 24), *(void *)a1, *(void *)(a1 + 72), &v21);
    if (!v16)
    {
      uint64_t v20 = v21;
      return strdup(v20);
    }
    uint64_t v15 = (char *)v16;
    *(void *)(a1 + 88) = v16;
  }
  if (*(_DWORD *)(a1 + 80)) {
    uint64_t v17 = 4;
  }
  else {
    uint64_t v17 = 8;
  }
  os_log_fmt_compose((size_t)v22, v15, 1, 3u, v17, v7, 0, 0, 0, 0, 0);
  char v18 = BYTE4(v23);
  uint64_t result = (char *)v22[0];
  v22[0] = 3954044928;
  WORD2(v23) = 0;
  if ((v18 & 1) == 0) {
    return (char *)_os_trace_memdup();
  }
  return result;
}

char *os_log_copy_formatted_message(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0x10000;
  v15[0] = &v17;
  v15[1] = 0x40000000000;
  xpc_object_t v2 = *(unsigned __int8 **)(a1 + 96);
  if (!v2)
  {
    id v5 = *(const char **)(a1 + 88);
    if (!v5) {
      id v5 = "<compose failure [missing precomposed log]>";
    }
    return strdup(v5);
  }
  unint64_t v3 = *(void *)(a1 + 104);
  if (v3 >> 16) {
    goto LABEL_6;
  }
  unint64_t v4 = *(void *)(a1 + 120);
  if (v4 >> 16) {
    goto LABEL_6;
  }
  if ((unsigned __int16)*(void *)(a1 + 104))
  {
    if ((unsigned __int16)*(void *)(a1 + 104) == 1)
    {
LABEL_6:
      id v5 = "<compose failure [corrupt log]>";
      return strdup(v5);
    }
    uint64_t v7 = (uint64_t)(v2 + 2);
    LOWORD(v3) = v3 - 2;
    if (v2[1])
    {
      int v8 = 0;
      while ((unsigned __int16)v3 >= 2u)
      {
        unint64_t v9 = *(unsigned __int8 *)(v7 + 1) + 2;
        if (v9 > (unsigned __int16)v3) {
          break;
        }
        v7 += v9;
        LOWORD(v3) = v3 - v9;
        if (v2[1] <= (unsigned __int16)++v8) {
          goto LABEL_17;
        }
      }
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    xpc_object_t v2 = (unsigned __int8 *)&os_log_fmt_extract_pubdata_empty_hdr;
  }
LABEL_17:
  char v14 = 0;
  unint64_t v10 = *(char **)(a1 + 88);
  if (!v10)
  {
    id v11 = _os_log_resolve_format(*(__n128 **)(a1 + 24), *(void *)a1, *(void *)(a1 + 72), &v14);
    if (!v11)
    {
      id v5 = v14;
      return strdup(v5);
    }
    unint64_t v10 = (char *)v11;
    *(void *)(a1 + 88) = v11;
    unint64_t v4 = *(void *)(a1 + 120);
  }
  if (*(_DWORD *)(a1 + 80)) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 8;
  }
  os_log_fmt_compose((size_t)v15, v10, 2, 3u, v12, v2, v7, (unsigned __int16)v3, *(void *)(a1 + 112), v4, 0);
  char v13 = BYTE4(v16);
  uint64_t result = (char *)v15[0];
  v15[0] = 3954044928;
  WORD2(v16) = 0;
  if ((v13 & 1) == 0) {
    return (char *)_os_trace_memdup();
  }
  return result;
}

uint64_t _chunk_support_convert_tracepoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = *(void *)(a2 + 64);
  *(_OWORD *)(a2 + 4) = 0u;
  *(_OWORD *)(a2 + 20) = 0u;
  *(_OWORD *)(a2 + 36) = 0u;
  *(_OWORD *)(a2 + 84) = 0u;
  *(_OWORD *)(a2 + 100) = 0u;
  *(_OWORD *)(a2 + 116) = 0u;
  *(_OWORD *)(a2 + 132) = 0u;
  *(_OWORD *)(a2 + 148) = 0u;
  *(_OWORD *)(a2 + 164) = 0u;
  *(_OWORD *)(a2 + 180) = 0u;
  *(_OWORD *)(a2 + 196) = 0u;
  *(_OWORD *)(a2 + 212) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 68) = 0u;
  *(_OWORD *)(a2 + 52) = 0u;
  *(_DWORD *)a2 = 1024;
  uint64_t v7 = *(void *)(a3 + 56);
  if (v7)
  {
    *(_DWORD *)(a2 + 4) = *(_DWORD *)(v7 + 4);
    *(void *)(a2 + 8) = *(void *)(v7 + 8);
    *(void *)(a2 + 24) = v7 + 24;
    uuidpath_lookup_fd(*(_DWORD *)(a3 + 4), (const void *)(v7 + 24), (void *)(a2 + 32));
    if (*(_WORD *)(v7 + 2)) {
      *(_DWORD *)(a2 + 136) = 1;
    }
  }
  uint64_t v8 = *(void *)(a3 + 32);
  if (*(_DWORD *)v8 == 24580) {
    return 0;
  }
  if (*(_DWORD *)v8 == 24579)
  {
    if (!*(_DWORD *)(v8 + 4) && *(void *)(v8 + 8) >= 0x31uLL)
    {
      *(_DWORD *)a2 = 2560;
      unint64_t v9 = *(void *)(v8 + 32);
      *(void *)(a2 + 40) = *(void *)(v8 + 40);
      unint64_t v10 = *(unsigned int **)(a3 + 24);
      *(void *)(a2 + 64) = v9;
      uint64_t v11 = *(void *)(a3 + 88);
      if (v11)
      {
        unint64_t v12 = _timesync_continuous_to_wall_time(v11, (void *)(*(void *)(a3 + 24) + 128), v9, (void *)(a2 + 112));
        *(void *)(a2 + 96) = v12 / 0x3B9ACA00;
        *(_DWORD *)(a2 + 104) = v12 % 0x3B9ACA00 / 0x3E8;
      }
      else
      {
        uint64_t v30 = *((void *)v10 + 2);
        int v31 = v10[6];
        unint64_t v32 = *((void *)v10 + 6);
        if (v32 != v9)
        {
          uint64_t v34 = *v10;
          unint64_t v33 = v10[1];
          if (v32 >= v9)
          {
            unint64_t v61 = (v32 - v9) * v34 / v33;
            v30 -= v61 / 0x3B9ACA00;
            v31 -= v61 % 0x3B9ACA00 / 0x3E8;
            if (v31 < 0)
            {
              --v30;
              v31 += 1000000;
            }
          }
          else
          {
            unint64_t v35 = (v9 - v32) * v34 / v33;
            v30 += v35 / 0x3B9ACA00;
            v31 += v35 % 0x3B9ACA00 / 0x3E8;
            if (v31 > 999999)
            {
              ++v30;
              v31 -= 1000000;
            }
          }
        }
        *(void *)(a2 + 96) = v30;
        *(void *)(a2 + 104) = v31;
        *(void *)(a2 + 112) = *(void *)(a3 + 16);
      }
      uint64_t v62 = v8 + 48;
      if (!uuidpath_lookup_fd(*(_DWORD *)(a3 + 4), (const void *)(v8 + 48), (void *)(a2 + 88)))
      {
        uint64_t v62 = *(void *)(a2 + 24);
        *(void *)(a2 + 88) = *(void *)(a2 + 32);
      }
      *(void *)(a2 + 80) = v62;
      uint64_t result = (uint64_t)_state_support_create_message(*(void *)(a3 + 32), (void *)(a2 + 152));
      *(void *)(a2 + 144) = result;
      if (result) {
        return *(void *)(a3 + 56) != 0;
      }
      return result;
    }
    return 0;
  }
  uint64_t v13 = *(void *)(a3 + 64);
  if (v13)
  {
    if (v13 == -1)
    {
      char v14 = *(unsigned int **)(a3 + 24);
      *(void *)(a2 + 64) = v6;
      uint64_t v15 = *(void *)(a3 + 88);
      if (v15)
      {
        uint64_t v16 = (void *)(*(void *)(a3 + 24) + 128);
        char v17 = (void *)(a2 + 112);
        unint64_t v18 = v6;
LABEL_16:
        unint64_t v20 = _timesync_continuous_to_wall_time(v15, v16, v18, v17);
        *(void *)(a2 + 96) = v20 / 0x3B9ACA00;
        *(_DWORD *)(a2 + 104) = v20 % 0x3B9ACA00 / 0x3E8;
        goto LABEL_32;
      }
      uint64_t v21 = *((void *)v14 + 2);
      int v22 = v14[6];
      unint64_t v23 = *((void *)v14 + 6);
      if (v23 != v6)
      {
        uint64_t v25 = *v14;
        unint64_t v24 = v14[1];
        uint64_t v26 = v23 - v6;
        if (v23 < v6)
        {
          uint64_t v27 = v6 - v23;
          goto LABEL_23;
        }
        goto LABEL_29;
      }
    }
    else
    {
      unint64_t v18 = (*(void *)(a1 + 16) & 0xFFFFFFFFFFFFLL) + *(void *)(v13 + 8);
      uint64_t v19 = *(unsigned int **)(a3 + 24);
      *(void *)(a2 + 64) = v18;
      uint64_t v15 = *(void *)(a3 + 88);
      if (v15)
      {
        uint64_t v16 = (void *)(*(void *)(a3 + 24) + 128);
        char v17 = (void *)(a2 + 112);
        goto LABEL_16;
      }
      uint64_t v21 = *((void *)v19 + 2);
      int v22 = v19[6];
      unint64_t v28 = *((void *)v19 + 6);
      if (v28 != v18)
      {
        uint64_t v25 = *v19;
        unint64_t v24 = v19[1];
        uint64_t v26 = v28 - v18;
        if (v28 < v18)
        {
          uint64_t v27 = v18 - v28;
LABEL_23:
          unint64_t v29 = v27 * v25 / v24;
          v21 += v29 / 0x3B9ACA00;
          v22 += v29 % 0x3B9ACA00 / 0x3E8;
          if (v22 > 999999)
          {
            ++v21;
            v22 -= 1000000;
          }
          goto LABEL_31;
        }
LABEL_29:
        unint64_t v36 = v26 * v25 / v24;
        v21 -= v36 / 0x3B9ACA00;
        v22 -= v36 % 0x3B9ACA00 / 0x3E8;
        if (v22 < 0)
        {
          --v21;
          v22 += 1000000;
        }
      }
    }
LABEL_31:
    *(void *)(a2 + 96) = v21;
    *(void *)(a2 + 104) = v22;
    *(void *)(a2 + 112) = *(void *)(a3 + 16);
  }
LABEL_32:
  *(void *)(a2 + 56) = *(void *)a1;
  *(void *)(a2 + 72) = *(void *)(a1 + 8);
  unsigned int v37 = *(void *)a1;
  if (v37 <= 6 && ((1 << v37) & 0x58) != 0) {
    unsigned int v38 = *(void *)a1 << 8;
  }
  else {
    unsigned int v38 = bswap32(*(void *)a1) >> 16;
  }
  *(_DWORD *)a2 = v38;
  if (!v7) {
    return 0;
  }
  uint64_t result = 0;
  switch(*(unsigned char *)a1)
  {
    case 2:
      int v40 = *(unsigned __int8 *)(a1 + 1);
      switch(v40)
      {
        case 1:
          return _chunk_support_parse_activity_create(a2, a1, a3);
        case 3:
          return _chunk_support_parse_useraction(a2, a1, a3);
        case 2:
          return _chunk_support_parse_activity_swap(a2, a1, a3);
        default:
          return 0;
      }
    case 3:
      unsigned __int16 v64 = 0;
      *(_DWORD *)a2 = 768;
      __int16 v41 = *(_WORD *)(a1 + 2);
      if (v41)
      {
        if (!(*(void *)(a1 + 16) >> 51)) {
          return 0;
        }
        unsigned __int16 v64 = 8;
        unint64_t v59 = *(void *)(a1 + 24);
        *(void *)(a2 + 40) = v59;
        *(void *)(a2 + 48) = _os_activity_map_find_parent(*(void **)(a3 + 8), v59);
        __int16 v41 = *(_WORD *)(a1 + 2);
        unint64_t v42 = 16;
      }
      else
      {
        unint64_t v42 = 8;
      }
      if ((v41 & 0x10) != 0)
      {
        if (v42 > *(unsigned __int16 *)(a1 + 22)) {
          return 0;
        }
        unsigned __int16 v64 = v42;
      }
      uint64_t result = _chunk_support_parse_location(a1, &v64, a2 + 56, a3);
      if (result)
      {
        uint64_t v60 = v64;
        *(void *)(a2 + 152) = a1 + v64 + 24;
        unint64_t v58 = *(unsigned __int16 *)(a1 + 22) - v60;
        goto LABEL_87;
      }
      return result;
    case 4:
      goto LABEL_47;
    case 6:
      *(_DWORD *)a2 = 1536;
LABEL_47:
      unsigned __int16 v63 = 0;
      __int16 v43 = *(_WORD *)(a1 + 2);
      if (v43)
      {
        if (!(*(void *)(a1 + 16) >> 51)) {
          return 0;
        }
        LODWORD(v44) = 8;
        unsigned __int16 v63 = 8;
        unint64_t v46 = *(void *)(a1 + 24);
        *(void *)(a2 + 40) = v46;
        *(void *)(a2 + 48) = _os_activity_map_find_parent(*(void **)(a3 + 8), v46);
        __int16 v43 = *(_WORD *)(a1 + 2);
        if ((v43 & 0x10) == 0) {
          goto LABEL_56;
        }
      }
      else
      {
        LODWORD(v44) = 0;
        if ((v43 & 0x10) == 0) {
          goto LABEL_56;
        }
      }
      unint64_t v44 = (v44 + 8);
      if (*(unsigned __int16 *)(a1 + 22) < v44) {
        return 0;
      }
      unsigned __int16 v63 = v44;
LABEL_56:
      if ((v43 & 0x100) == 0) {
        goto LABEL_62;
      }
      if ((unint64_t)v44 + 4 > *(unsigned __int16 *)(a1 + 22)) {
        return 0;
      }
      unsigned __int16 v63 = v44 + 4;
      uint64_t v47 = a1 + v44;
      unint64_t v48 = *(unsigned __int16 *)(v47 + 24);
      uint64_t v49 = *(unsigned __int16 *)(v47 + 26);
      if ((v49 + v48) <= 0x1000)
      {
        uint64_t v50 = *(void *)(a3 + 80);
        if (4096 - v50 <= v48 && (*(unsigned char *)a3 & 0x80) == 0)
        {
          *(void *)(a2 + 168) = *(void *)(a3 + 72) + v50 - 4096 + v48;
          *(void *)(a2 + 176) = v49;
        }
      }
LABEL_62:
      uint64_t result = _chunk_support_parse_location(a1, &v63, a2 + 56, a3);
      if (!result) {
        return result;
      }
      LOWORD(v51) = v63;
      if ((*(_WORD *)(a1 + 2) & 0x200) == 0) {
        goto LABEL_67;
      }
      LOWORD(v51) = v63 + 2;
      if ((unint64_t)v63 + 2 > *(unsigned __int16 *)(a1 + 22)) {
        return 0;
      }
      uint64_t v52 = *(void *)(a3 + 56);
      __int16 v65 = *(_WORD *)(a1 + v63 + 24);
      uint64_t v53 = hashtable_lookup(*(void *)(v52 + 64), (uint64_t)&v65);
      if (v53)
      {
        *(void *)(a2 + 184) = *(void *)(v53 + 8);
        *(void *)(a2 + 192) = *(void *)(v53 + 16);
      }
LABEL_67:
      __int16 v54 = *(_WORD *)(a1 + 2);
      if ((v54 & 0x400) == 0) {
        goto LABEL_70;
      }
      if (*(unsigned __int16 *)(a1 + 22) <= (unint64_t)(unsigned __int16)v51) {
        return 0;
      }
      LOWORD(v51) = v51 + 1;
LABEL_70:
      if (*(unsigned char *)a1 == 6)
      {
        uint64_t v55 = (unsigned __int16)v51;
        unint64_t v51 = (unsigned __int16)v51 + 8;
        if (v51 > *(unsigned __int16 *)(a1 + 22)) {
          return 0;
        }
        *(void *)(a2 + 208) = *(void *)(a1 + v55 + 24);
        *(unsigned char *)(a2 + 224) = *(unsigned char *)(a1 + 1) & 0x3F;
        *(unsigned char *)(a2 + 225) = *(unsigned char *)(a1 + 1) & 0xC0;
        __int16 v54 = *(_WORD *)(a1 + 2);
        if (v54 < 0)
        {
          unint64_t v51 = (unsigned __int16)v51 + 4;
          unint64_t v56 = *(void *)(a1 + 16);
          if (v51 > HIWORD(v56)) {
            return 0;
          }
          if ((v54 & 0x20) != 0)
          {
            unint64_t v51 = (unsigned __int16)v51 + 2;
            if (v51 > HIWORD(v56)) {
              return 0;
            }
          }
        }
      }
      if ((v54 & 0x800) == 0) {
        goto LABEL_79;
      }
      uint64_t v57 = (unsigned __int16)v51;
      unint64_t v51 = (unsigned __int16)v51 + 4;
      if (v51 > *(unsigned __int16 *)(a1 + 22)) {
        return 0;
      }
      *(_DWORD *)(a2 + 200) = *(_DWORD *)(a1 + v57 + 24);
LABEL_79:
      *(void *)(a2 + 152) = a1 + (unsigned __int16)v51 + 24;
      unint64_t v58 = *(unsigned __int16 *)(a1 + 22) - (unint64_t)(unsigned __int16)v51;
LABEL_87:
      *(void *)(a2 + 160) = v58;
LABEL_88:
      uint64_t result = 1;
      break;
    case 7:
      *(_DWORD *)a2 = 1792;
      if (*(void *)(a1 + 16) >> 51 < 3uLL) {
        return 0;
      }
      int v45 = *(_DWORD *)(a1 + 40);
      *(_OWORD *)(a2 + 144) = *(_OWORD *)(a1 + 24);
      *(_DWORD *)(a2 + 160) = v45;
      goto LABEL_88;
    default:
      return result;
  }
  return result;
}

uint64_t _chunk_support_parse_activity_swap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = 514;
  __int16 v5 = *(_WORD *)(a2 + 2);
  if ((v5 & 1) == 0)
  {
    LODWORD(v6) = 0;
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v6 = (v6 + 8);
    if (*(unsigned __int16 *)(a2 + 22) < v6) {
      return 0;
    }
    goto LABEL_7;
  }
  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0;
  }
  unint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = _os_activity_map_find_parent(*(void **)(a3 + 8), v7);
  __int16 v5 = *(_WORD *)(a2 + 2);
  LODWORD(v6) = 8;
  if ((v5 & 0x10) != 0) {
    goto LABEL_6;
  }
LABEL_7:
  if ((v5 & 0x200) == 0) {
    return 1;
  }
  if ((unint64_t)v6 + 8 <= *(unsigned __int16 *)(a2 + 22))
  {
    *(void *)(a1 + 144) = *(void *)(a2 + v6 + 24);
    return 1;
  }
  return 0;
}

uint64_t _chunk_support_parse_activity_create(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = 513;
  __int16 v5 = *(_WORD *)(a2 + 2);
  if ((v5 & 1) == 0)
  {
    LODWORD(v6) = 0;
    if ((v5 & 0x10) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v7 = v6;
    unint64_t v6 = v6 + 8;
    if (v6 > *(unsigned __int16 *)(a2 + 22)) {
      return 0;
    }
    *(void *)(a1 + 160) = *(void *)(a2 + v7 + 24);
    if ((*(_WORD *)(a2 + 2) & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0;
  }
  *(void *)(a1 + 152) = *(void *)(a2 + 24);
  __int16 v5 = *(_WORD *)(a2 + 2);
  LODWORD(v6) = 8;
  if ((v5 & 0x10) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v5 & 0x200) != 0)
  {
LABEL_9:
    uint64_t v8 = v6;
    unint64_t v6 = v6 + 8;
    if (v6 <= *(unsigned __int16 *)(a2 + 22))
    {
      *(void *)(a1 + 48) = *(void *)(a2 + v8 + 24);
      goto LABEL_11;
    }
    return 0;
  }
LABEL_11:
  if ((unint64_t)v6 + 8 > *(unsigned __int16 *)(a2 + 22)) {
    return 0;
  }
  __int16 v12 = v6 + 8;
  *(void *)(a1 + 40) = *(void *)(a2 + v6 + 24);
  uint64_t result = _chunk_support_parse_location(a2, &v12, a1 + 56, a3);
  if (result)
  {
    unint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 48);
      if (v11) {
        _os_activity_map_insert((float **)(a3 + 8), v10, v11);
      }
    }
    else
    {
      *(void *)(a1 + 144) = "Default/remote activity";
    }
    return 1;
  }
  return result;
}

uint64_t _chunk_support_parse_useraction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v10 = 0;
  *(_DWORD *)a1 = 515;
  __int16 v6 = *(_WORD *)(a2 + 2);
  if ((v6 & 1) == 0)
  {
    unint64_t v7 = 8;
    if ((v6 & 0x10) == 0) {
      return _chunk_support_parse_location(a2, &v10, a1 + 56, a3);
    }
    goto LABEL_6;
  }
  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0;
  }
  __int16 v10 = 8;
  unint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = _os_activity_map_find_parent(*(void **)(a3 + 8), v8);
  unint64_t v7 = 16;
  if ((*(_WORD *)(a2 + 2) & 0x10) != 0)
  {
LABEL_6:
    if (v7 <= *(unsigned __int16 *)(a2 + 22))
    {
      __int16 v10 = v7;
      return _chunk_support_parse_location(a2, &v10, a1 + 56, a3);
    }
    return 0;
  }
  return _chunk_support_parse_location(a2, &v10, a1 + 56, a3);
}

uint64_t _chunk_support_parse_location(uint64_t a1, _WORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a4 + 56);
  int v9 = *(_DWORD *)(a1 + 4);
  if (*(_WORD *)(v8 + 2)) {
    unsigned int v10 = 4;
  }
  else {
    unsigned int v10 = 6;
  }
  switch(*(_WORD *)(a1 + 2) & 0xE)
  {
    case 2:
    case 4:
    case 6:
      unsigned int v10 = 4;
      break;
    case 8:
      break;
    case 0xA:
      unsigned int v10 = 20;
      break;
    case 0xC:
      unsigned int v10 = 6;
      break;
    default:
      unsigned int v10 = 0;
      break;
  }
  uint64_t v11 = (unsigned __int16)*a2;
  unint64_t v12 = v11 + v10;
  unint64_t v13 = *(void *)(a1 + 16);
  if (v12 > HIWORD(v13))
  {
    uint64_t v23 = 0;
    unint64_t v29 = HIWORD(v13);
LABEL_39:
    *a2 = v29;
    return v23;
  }
  *a2 = v12;
  if (!v10) {
    return 0;
  }
  char v14 = (unsigned int *)(a1 + 24 + v11);
  if (v10 == 6)
  {
    uint64_t v15 = 0;
    unint64_t v16 = (unint64_t)*((unsigned __int16 *)v14 + 2) << 32;
  }
  else
  {
    unint64_t v16 = 0;
    if (v10 == 4) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = v14 + 1;
    }
  }
  uint64_t v17 = *v14;
  if ((*(_WORD *)(a1 + 2) & 0x20) == 0)
  {
    unint64_t v18 = 0;
    goto LABEL_20;
  }
  unint64_t v19 = *(void *)(a1 + 16);
  if ((unint64_t)(unsigned __int16)v12 + 2 > HIWORD(v19))
  {
    uint64_t v23 = 0;
    unint64_t v29 = HIWORD(v19);
    goto LABEL_39;
  }
  *a2 = v12 + 2;
  unint64_t v18 = (unint64_t)*(unsigned __int16 *)(a1 + 24 + (unsigned __int16)v12) << 31;
LABEL_20:
  unint64_t v20 = v18 | v9 & 0x7FFFFFFF;
  if (v9 >= 0) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = v20 | 0x8000000000000000;
  }
  *(void *)(a3 + 72) = v21;
  if (!v21) {
    return 0;
  }
  int v22 = *(_WORD *)(a1 + 2) & 0xE;
  uint64_t v23 = 1;
  unint64_t v24 = v16 | v17;
  switch(v22)
  {
    case 2:
      *(void *)(a3 + 64) = v24;
      uint64_t v15 = (const void *)(v8 + 24);
      goto LABEL_29;
    case 4:
    case 12:
      *(void *)(a3 + 24) = v8 + 40;
      uint64_t v25 = a3 + 24;
      *(void *)(v25 + 40) = v24;
      return uuidpath_sharedcache_resolve_fd(*(unsigned int *)(a4 + 4), (__n128 *)(v8 + 40), v21, v16 | v17, 0, (const char **)(v25 + 64), 0, (void *)v25, v25 + 8, 0, 0);
    case 8:
      uint64_t v27 = (void *)_catalog_procinfo_lookup_pc(v8, v16 | v17);
      if (!v27) {
        return 0;
      }
      uint64_t v15 = v27 + 2;
      *(void *)(a3 + 64) = v24 - *v27;
      unint64_t v21 = *(void *)(a3 + 72);
LABEL_29:
      *(void *)(a3 + 24) = v15;
      break;
    case 10:
      *(void *)(a3 + 64) = v24;
      *(void *)(a3 + 24) = v15;
      if (!v15) {
        return 0;
      }
      break;
    default:
      return v23;
  }
  int v28 = *(_DWORD *)(a4 + 4);
  return uuidpath_resolve_fd(v28, v15, v21, 0, (const char **)(a3 + 88), 0, (void *)(a3 + 32), 0);
}

tm *_chunk_support_context_init(uint64_t a1)
{
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)(a1 + 4) = -1;
  time_t v6 = time(0);
  memset(&v5, 0, sizeof(v5));
  uint64_t result = localtime_r(&v6, &v5);
  int tm_isdst = v5.tm_isdst;
  unint64_t v4 = ((unsigned __int128)(v5.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v5.tm_gmtoff;
  *(_DWORD *)(a1 + 16) = (v4 >> 5) + (v4 >> 63) + 60 * v5.tm_isdst;
  *(_DWORD *)(a1 + 20) = tm_isdst;
  return result;
}

uint64_t _chunk_support_context_clear(uint64_t a1)
{
  _os_activity_map_destroy(*(void *)(a1 + 8));
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    _catalog_destroy(v2);
  }
  uint64_t result = *(unsigned int *)(a1 + 4);
  if (result != -1)
  {
    uint64_t result = close(result);
    if (result == -1)
    {
      int v4 = *__error();
      uint64_t result = *__error();
      if (v4 == 9)
      {
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = result;
        __break(1u);
      }
      else
      {
        return _os_assumes_log();
      }
    }
  }
  return result;
}

void *_chunk_support_context_update(void *result, int *a2)
{
  uint64_t v2 = result;
  unint64_t v3 = 0;
  result[4] = a2;
  int v4 = *a2;
  switch(*a2)
  {
    case 24577:
      unint64_t v5 = *((void *)a2 + 1);
      unint64_t v6 = v5 - 16;
      if (v5 < 0x10) {
        goto LABEL_12;
      }
      unint64_t v3 = (unsigned __int16 *)(a2 + 8);
      BOOL v7 = *((unsigned char *)a2 + 29) != 0;
      goto LABEL_19;
    case 24578:
      unint64_t v10 = *((void *)a2 + 1);
      unint64_t v6 = v10 - 32;
      if (v10 < 0x20) {
        goto LABEL_12;
      }
      BOOL v7 = 0;
      unint64_t v3 = (unsigned __int16 *)(a2 + 12);
      goto LABEL_19;
    case 24579:
      unint64_t v11 = *((void *)a2 + 1);
      unint64_t v6 = v11 - 48;
      if (v11 < 0x30) {
        goto LABEL_12;
      }
      BOOL v7 = 0;
      unint64_t v3 = (unsigned __int16 *)(a2 + 16);
      goto LABEL_19;
    case 24580:
      unint64_t v12 = *((void *)a2 + 1);
      unint64_t v6 = v12 - 72;
      if (v12 < 0x48)
      {
LABEL_12:
        result[8] = 0;
        goto LABEL_25;
      }
      BOOL v7 = 0;
      unint64_t v3 = (unsigned __int16 *)(a2 + 22);
      goto LABEL_19;
    case 24581:
    case 24582:
    case 24583:
    case 24584:
    case 24585:
    case 24586:
    case 24587:
      goto LABEL_23;
    case 24588:
      unint64_t v8 = *((void *)a2 + 1);
      if (v8 <= 0xF)
      {
        result[8] = 0;
        goto LABEL_29;
      }
      BOOL v7 = 0;
      unint64_t v3 = (unsigned __int16 *)a2 + 15;
      goto LABEL_18;
    default:
      if (v4 != 24592) {
        goto LABEL_23;
      }
      unint64_t v8 = *((void *)a2 + 1);
      if (v8 <= 0xF)
      {
        int v9 = 0;
        result[8] = 0;
        goto LABEL_31;
      }
      BOOL v7 = 0;
      unint64_t v3 = (unsigned __int16 *)(a2 + 8);
LABEL_18:
      unint64_t v6 = v8 - 16;
LABEL_19:
      if (v6 - 4097 < 0xFFFFFFFFFFFFF00FLL) {
        goto LABEL_23;
      }
      unint64_t v13 = *v3;
      if (v6 < v13)
      {
        unint64_t v3 = 0;
        goto LABEL_24;
      }
      uint64_t v14 = v3[1];
      if (v14 > 0xFFF) {
        goto LABEL_23;
      }
      if (!v7)
      {
        if (v6 == 4096)
        {
          result[9] = (char *)v3 + v14;
          result[10] = (unsigned __int16)(4096 - v14);
          goto LABEL_24;
        }
LABEL_23:
        result[9] = 0;
        result[10] = 0;
        goto LABEL_24;
      }
      if (v6 > v13 + (unsigned __int16)(4096 - v14)) {
        goto LABEL_23;
      }
      result[9] = (char *)v3 + v13;
      result[10] = (unsigned __int16)(4096 - v14);
LABEL_24:
      result[8] = v3;
      if ((v4 - 24577) < 4)
      {
LABEL_25:
        uint64_t v15 = result[5];
        if (v15)
        {
          uint64_t result = _os_procinfo_map_lookup(*(void **)(v15 + 40), *((void *)a2 + 2), a2[6]);
          v2[7] = result;
          return result;
        }
        goto LABEL_43;
      }
      if (v4 == 24592)
      {
        int v9 = 0;
      }
      else
      {
        if (v4 != 24588) {
          return result;
        }
LABEL_29:
        int v9 = *((unsigned __int8 *)a2 + 29);
      }
LABEL_31:
      uint64_t v16 = result[5];
      if (!v16 || (uint64_t v17 = *(void *)(v16 + 40)) == 0)
      {
LABEL_43:
        result[7] = 0;
        return result;
      }
      unint64_t v18 = (void *)(v17 + 16);
      do
      {
        unint64_t v18 = (void *)*v18;
        if (!v18) {
          goto LABEL_43;
        }
      }
      while (v18[2] != *((void *)a2 + 2));
      uint64_t v19 = v18[4];
      result[7] = v19;
      if (v19) {
        BOOL v20 = v9 == 0;
      }
      else {
        BOOL v20 = 1;
      }
      if (!v20)
      {
        int v21 = *(__int16 *)(v19 + 2);
        if (v21 < 0)
        {
          __int16 v22 = v21 & 0x7FFF;
          *(_WORD *)(v19 + 2) = v22;
          if (v9 == 4) {
            *(_WORD *)(v19 + 2) = v22 | 1;
          }
        }
      }
      return result;
  }
}

BOOL ___os_activity_stream_mapped_file_block_invoke(void *a1, uint64_t a2)
{
  int v3 = *(_DWORD *)a2;
  if (a1[5] == a2)
  {
    if (v3 != 4096 || *(void *)(a2 + 8) <= 0x27uLL) {
      return 0;
    }
LABEL_17:
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = _chunk_support_stream((int *)a2, a1[6]);
    return *(unsigned char *)(*(void *)(a1[4] + 8) + 24) != 0;
  }
  if (v3 > 7679)
  {
    switch(v3)
    {
      case 24577:
      case 24578:
      case 24579:
      case 24580:
        if (!*(_DWORD *)(a2 + 4)) {
          goto LABEL_17;
        }
        break;
      case 24581:
      case 24582:
      case 24583:
      case 24584:
      case 24585:
      case 24586:
      case 24590:
      case 24591:
        return *(unsigned char *)(*(void *)(a1[4] + 8) + 24) != 0;
      case 24587:
        if ((*(_DWORD *)(a2 + 4) - 14) <= 3) {
          goto LABEL_17;
        }
        break;
      case 24588:
      case 24592:
        if ((*(_DWORD *)(a2 + 4) - 14) < 4) {
          goto LABEL_17;
        }
        break;
      case 24589:
        goto LABEL_17;
      default:
        if (v3 == 7680 || v3 == 0x2000) {
          goto LABEL_17;
        }
        break;
    }
    return *(unsigned char *)(*(void *)(a1[4] + 8) + 24) != 0;
  }
  if (v3 > 7167)
  {
    BOOL v5 = v3 == 7168;
    int v6 = 7424;
  }
  else
  {
    BOOL v5 = v3 == 4096;
    int v6 = 6912;
  }
  if (v5 || v3 == v6) {
    goto LABEL_17;
  }
  return *(unsigned char *)(*(void *)(a1[4] + 8) + 24) != 0;
}

BOOL _chunk_support_stream(int *a1, uint64_t a2)
{
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2000000000;
  char v36 = 1;
  *(void *)(a2 + 32) = a1;
  switch(*a1)
  {
    case 24577:
    case 24588:
      _chunk_support_context_update((void *)a2, a1);
      uint64_t v8 = *(void *)(a2 + 104);
      if (v8)
      {
        int v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
        *((unsigned char *)v34 + 24) = v9;
        if (!v9) {
          goto LABEL_5;
        }
      }
      else if (!*((unsigned char *)v34 + 24))
      {
        goto LABEL_5;
      }
      if (!*(void *)(a2 + 96)) {
        goto LABEL_5;
      }
      uint64_t v16 = *(unsigned __int16 **)(a2 + 64);
      if (!v16) {
        goto LABEL_5;
      }
      memset(v31, 0, sizeof(v31));
      unint64_t v18 = v16 + 8;
      uint64_t v17 = *v16;
      uint64_t v19 = (char *)v16 + v17;
      if (v17 > 0x1000) {
        unint64_t v20 = (unint64_t)v18;
      }
      else {
        unint64_t v20 = (unint64_t)v19;
      }
      while ((unint64_t)(v18 + 12) < v20)
      {
        int v21 = v18;
        unint64_t v22 = *((void *)v18 + 2);
        uint64_t v23 = HIWORD(v22);
        if (!HIWORD(v22) || v23 > (uint64_t)(v20 - (void)(v18 + 12))) {
          break;
        }
        if ((v22 & 0x7000000000000) != 0) {
          uint64_t v25 = (HIWORD(v22) & 0xFFF8) + 32;
        }
        else {
          uint64_t v25 = v23 + 24;
        }
        unint64_t v18 = (unsigned __int16 *)((char *)v18 + v25);
        if (*(void *)v21
          && _chunk_support_convert_tracepoint((uint64_t)v21, (uint64_t)v31, a2)
          && ((*(uint64_t (**)(void, _OWORD *, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 96) + 16))(*(void *)(a2 + 96), v31, 0, v26, v27, v28, v29, v30) & 1) == 0)
        {
          *((unsigned char *)v34 + 24) = 0;
          goto LABEL_5;
        }
      }
      goto LABEL_5;
    case 24578:
    case 24579:
    case 24580:
    case 24592:
      _chunk_support_context_update((void *)a2, a1);
      goto LABEL_3;
    case 24581:
    case 24582:
    case 24583:
    case 24584:
    case 24585:
    case 24586:
    case 24590:
    case 24591:
      goto LABEL_5;
    case 24587:
      uint64_t v10 = *(void *)(a2 + 40);
      if (v10) {
        _catalog_destroy(v10);
      }
      uint64_t v11 = _catalog_create_with_chunk(a1, 0);
      *(void *)(a2 + 40) = v11;
      if (v11) {
        uint64_t v12 = *(void *)(v11 + 64);
      }
      else {
        uint64_t v12 = 0;
      }
      *(void *)(a2 + 48) = v12;
      goto LABEL_3;
    case 24589:
      uint64_t v13 = *(void *)(a2 + 104);
      if (v13)
      {
        char v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v13, a2);
        *((unsigned char *)v34 + 24) = v14;
      }
      uint64_t v15 = *(void **)(a2 + 48);
      if (v15)
      {
        if ((*(unsigned char *)(a2 + 1) & 8) == 0)
        {
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 0x40000000;
          v32[2] = ___chunk_support_stream_block_invoke;
          v32[3] = &unk_1E5A42F68;
          v32[4] = &v33;
          v32[5] = a2;
          _tracev3_chunk_decompress_and_enumerate_chunks((uint64_t)a1, (uint64_t)v15, (uint64_t)v32);
          uint64_t v15 = *(void **)(a2 + 48);
        }
        if (*v15) {
          *(void *)(a2 + 48) = *v15;
        }
LABEL_5:
        BOOL v6 = *((unsigned char *)v34 + 24) != 0;
      }
      else
      {
        BOOL v6 = 1;
      }
      _Block_object_dispose(&v33, 8);
      return v6;
    default:
      if (*a1 != 4096) {
        goto LABEL_5;
      }
      *(void *)(a2 + 24) = a1 + 4;
LABEL_3:
      uint64_t v4 = *(void *)(a2 + 104);
      if (v4)
      {
        char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
        *((unsigned char *)v34 + 24) = v5;
      }
      goto LABEL_5;
  }
}

BOOL ___chunk_support_stream_block_invoke(uint64_t a1, int *a2)
{
  _chunk_support_context_update(*(void **)(a1 + 40), a2);
  BOOL result = 1;
  unsigned int v5 = *a2 - 24577;
  BOOL v6 = v5 > 0xF;
  int v7 = (1 << v5) & 0x880F;
  if (!v6 && v7 != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _chunk_support_stream(a2, *(void *)(a1 + 40));
    return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 0;
  }
  return result;
}

uint64_t _os_activity_stream_entry_decode(void *a1, int *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (MEMORY[0x1A622E220]() != MEMORY[0x1E4F14590]) {
    return 0xFFFFFFFFLL;
  }
  *((_OWORD *)a2 + 13) = 0u;
  *((_OWORD *)a2 + 14) = 0u;
  *((_OWORD *)a2 + 11) = 0u;
  *((_OWORD *)a2 + 12) = 0u;
  *((_OWORD *)a2 + 9) = 0u;
  *((_OWORD *)a2 + 10) = 0u;
  *((_OWORD *)a2 + 7) = 0u;
  *((_OWORD *)a2 + 8) = 0u;
  *((_OWORD *)a2 + 5) = 0u;
  *((_OWORD *)a2 + 6) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  a2[1] = xpc_dictionary_get_uint64(a1, "pid");
  *((void *)a2 + 1) = xpc_dictionary_get_uint64(a1, "procid");
  a2[4] = xpc_dictionary_get_uint64(a1, "uid");
  *((void *)a2 + 3) = xpc_dictionary_get_uuid(a1, "procuuid");
  string = xpc_dictionary_get_string(a1, "procpath");
  *((void *)a2 + 4) = string;
  if (!string)
  {
    BOOL v6 = (const void *)*((void *)a2 + 3);
    if (v6) {
      uuidpath_lookup_fd(-3, v6, (void *)a2 + 4);
    }
  }
  *((void *)a2 + 5) = xpc_dictionary_get_uint64(a1, "aid");
  *((void *)a2 + 6) = xpc_dictionary_get_uint64(a1, "paid");
  *a2 = xpc_dictionary_get_uint64(a1, "type");
  a2[29] = xpc_dictionary_get_int64(a1, "timezoneDSTflag");
  a2[28] = xpc_dictionary_get_int64(a1, "timezoneMinutesWest");
  *((void *)a2 + 12) = xpc_dictionary_get_int64(a1, "timeGMTsec");
  a2[26] = xpc_dictionary_get_int64(a1, "timeGMTusec");
  if (xpc_dictionary_get_BOOL(a1, "32bits")) {
    a2[34] |= 1u;
  }
  uint64_t int64 = xpc_dictionary_get_uint64(a1, "traceid");
  char v8 = BYTE2(uint64);
  *((void *)a2 + 7) = uint64;
  *((void *)a2 + 9) = xpc_dictionary_get_uint64(a1, "thread");
  *((void *)a2 + 8) = xpc_dictionary_get_uint64(a1, "timestamp");
  *((void *)a2 + 15) = xpc_dictionary_get_uint64(a1, "offset");
  *((void *)a2 + 16) = xpc_dictionary_get_uint64(a1, "formatoffset");
  *((void *)a2 + 10) = xpc_dictionary_get_uuid(a1, "imageuuid");
  int v9 = (__n128 **)(a2 + 20);
  *((void *)a2 + 11) = xpc_dictionary_get_string(a1, "imagepath");
  int v10 = *a2;
  uint64_t result = 0xFFFFFFFFLL;
  if (*a2 > 767)
  {
    if (v10 != 1024 && v10 != 768) {
      return result;
    }
  }
  else if (v10 != 513 && v10 != 515)
  {
    return result;
  }
  uint64_t v11 = xpc_dictionary_get_string(a1, "name");
  *((void *)a2 + 18) = v11;
  if (!v11 || !*((void *)a2 + 11))
  {
    uint64_t v12 = *v9;
    if (*v9)
    {
      if ((v8 & 6 | 8) == 0xC) {
        uuidpath_sharedcache_resolve_fd(0xFFFFFFFFLL, v12, *((void *)a2 + 16), *((void *)a2 + 15), 0, (const char **)a2 + 18, 0, (void *)a2 + 10, (unint64_t)(a2 + 22), 0, 0);
      }
      else {
        uuidpath_resolve(0, v12, *((void *)a2 + 16), 0, (const char **)a2 + 18, 0, (void *)a2 + 11, 0);
      }
    }
  }
  int v13 = *a2;
  if (*a2 == 515)
  {
    BOOL v15 = xpc_dictionary_get_BOOL(a1, "persisted");
    uint64_t result = 0;
    *((unsigned char *)a2 + 152) = v15;
  }
  else if (v13 == 1024)
  {
    *((void *)a2 + 19) = xpc_dictionary_get_data(a1, "buffer", (size_t *)a2 + 20);
    *((void *)a2 + 21) = xpc_dictionary_get_data(a1, "privdata", (size_t *)a2 + 22);
    *((void *)a2 + 24) = xpc_dictionary_get_string(a1, "category");
    *((void *)a2 + 23) = xpc_dictionary_get_string(a1, "subsystem");
    BOOL v16 = xpc_dictionary_get_BOOL(a1, "persisted");
    uint64_t result = 0;
    *((unsigned char *)a2 + 205) = v16;
  }
  else if (v13 == 768)
  {
    *((void *)a2 + 21) = xpc_dictionary_get_value(a1, "payload");
    uint64_t data = xpc_dictionary_get_data(a1, "buffer", (size_t *)a2 + 20);
    uint64_t result = 0;
    *((void *)a2 + 19) = data;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t os_activity_stream_for_simulator(const char *a1, int a2, const void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_trace_calloc();
  snprintf(__str, 0x40uLL, "com.apple.activity.stream.%s", a1);
  *(void *)(v6 + 24) = dispatch_queue_create(__str, 0);
  *(void *)uint64_t v6 = _Block_copy(a3);
  *(void *)(v6 + 40) = xpc_array_create(0, 0);
  *(void *)(v6 + 48) = xpc_array_create(0, 0);
  *(_DWORD *)(v6 + 32) = a2;
  *(_DWORD *)(v6 + 64) = 0;
  *(unsigned char *)(v6 + 84) = 1;
  *(void *)(v6 + 72) = strdup(a1);
  return v6;
}

uint64_t os_activity_stream_for_pid(int a1, int a2, const void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_trace_calloc();
  snprintf(__str, 0x40uLL, "com.apple.activity.stream.%d", a1);
  *(void *)(v6 + 24) = dispatch_queue_create(__str, 0);
  *(void *)uint64_t v6 = _Block_copy(a3);
  xpc_object_t v7 = xpc_array_create(0, 0);
  *(void *)(v6 + 40) = v7;
  *(_DWORD *)(v6 + 32) = a2;
  *(_DWORD *)(v6 + 64) = 0;
  if (a1 == -1)
  {
    *(unsigned char *)(v6 + 84) = 1;
  }
  else if (a1 >= 1)
  {
    xpc_array_set_int64(v7, 0xFFFFFFFFFFFFFFFFLL, a1);
  }
  return v6;
}

void os_activity_stream_add_pid(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 84))
  {
    xpc_object_t v4 = *(xpc_object_t *)(a1 + 40);
    if (!v4)
    {
      xpc_object_t v4 = xpc_array_create(0, 0);
      *(void *)(a1 + 40) = v4;
    }
    xpc_array_set_int64(v4, 0xFFFFFFFFFFFFFFFFLL, a2);
  }
}

uint64_t os_activity_stream_for_uid(unsigned int a1, int a2, const void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_trace_calloc();
  snprintf(__str, 0x40uLL, "com.apple.activity.stream.%d", a1);
  *(void *)(v6 + 24) = dispatch_queue_create(__str, 0);
  *(void *)uint64_t v6 = _Block_copy(a3);
  xpc_object_t v7 = xpc_array_create(0, 0);
  *(void *)(v6 + 48) = v7;
  *(_DWORD *)(v6 + 32) = a2;
  *(_DWORD *)(v6 + 64) = 0;
  xpc_array_set_int64(v7, 0xFFFFFFFFFFFFFFFFLL, a1);
  return v6;
}

void os_activity_stream_add_uid(uint64_t a1, int64_t value)
{
  unsigned int v2 = value;
  xpc_object_t v4 = *(xpc_object_t *)(a1 + 48);
  if (!v4)
  {
    xpc_object_t v4 = xpc_array_create(0, 0);
    *(void *)(a1 + 48) = v4;
  }
  xpc_array_set_int64(v4, 0xFFFFFFFFFFFFFFFFLL, v2);
}

void *os_activity_stream_set_event_handler(uint64_t a1, void *aBlock)
{
  uint64_t result = _Block_copy(aBlock);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t os_activity_stream_set_filter(uint64_t result, int a2)
{
  *(_DWORD *)(result + 64) |= a2;
  return result;
}

void os_activity_stream_resume(uint64_t a1)
{
}

void _os_activity_stream_resume_with_filter(uint64_t a1, const void *a2, size_t a3)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.diagnosticd", *(dispatch_queue_t *)(a1 + 24), 2uLL);
  *(void *)(a1 + 16) = mach_service;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 0x40000000;
  handler[2] = ___os_activity_stream_resume_with_filter_block_invoke;
  handler[3] = &__block_descriptor_tmp_37;
  handler[4] = a1;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_retain(*(xpc_object_t *)(a1 + 16));
  xpc_connection_set_context(*(xpc_connection_t *)(a1 + 16), (void *)a1);
  xpc_connection_set_finalizer_f(*(xpc_connection_t *)(a1 + 16), (xpc_finalizer_t)_os_activity_stream_dealloc);
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 16));
  if (!*(_DWORD *)(a1 + 64)) {
    *(_DWORD *)(a1 + 64) = 7;
  }
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v7, "action", 3uLL);
  xpc_dictionary_set_uint64(v7, "flags", *(unsigned int *)(a1 + 32));
  xpc_dictionary_set_uint64(v7, "types", *(unsigned int *)(a1 + 64));
  char v8 = *(const char **)(a1 + 72);
  if (v8) {
    xpc_dictionary_set_string(v7, "simulator_device", v8);
  }
  if (xpc_array_get_count(*(xpc_object_t *)(a1 + 40)) && xpc_array_get_count(*(xpc_object_t *)(a1 + 48)))
  {
    if (a2)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    else if (!*(unsigned char *)(a1 + 84))
    {
      uint64_t v9 = *(void **)(a1 + 48);
      id v10 = *(id *)(a1 + 40);
      id v11 = v9;
      if (xpc_array_get_count(v10))
      {
        if (xpc_array_get_count(v11))
        {
          uint64_t v12 = [[_OSLogStreamFilter alloc] initWithPredicate:0];
          uint64_t applier = MEMORY[0x1E4F143A8];
          uint64_t v34 = 3221225472;
          uint64_t v35 = ___OSLogStreamFilterBytesForPIDAndUIDArray_block_invoke;
          char v36 = &unk_1E5A42B68;
          int v13 = v12;
          unsigned int v37 = v13;
          xpc_array_apply(v10, &applier);
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = ___OSLogStreamFilterBytesForPIDAndUIDArray_block_invoke_2;
          v31[3] = &unk_1E5A42B68;
          unint64_t v32 = v13;
          char v14 = v13;
          xpc_array_apply(v11, v31);
          BOOL v15 = [(_OSLogStreamFilter *)v14 data];
          [v15 length];
          BOOL v16 = (void *)_os_trace_malloc();
          objc_msgSend(v15, "getBytes:length:", v16, objc_msgSend(v15, "length"));
          a3 = [v15 length];

          uint64_t v17 = 0;
          unint64_t v18 = 0;
          a2 = v16;
          if (!v16) {
            goto LABEL_26;
          }
          goto LABEL_24;
        }
        goto LABEL_34;
      }
LABEL_33:
      _os_assert_log();
      _os_crash();
      __break(1u);
LABEL_34:
      _os_assert_log();
      _os_crash();
      __break(1u);
LABEL_35:
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_36;
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_33;
  }
  if (!xpc_array_get_count(*(xpc_object_t *)(a1 + 40)))
  {
    if (xpc_array_get_count(*(xpc_object_t *)(a1 + 48)))
    {
      if (a2)
      {
LABEL_39:
        _os_assert_log();
        _os_crash();
        __break(1u);
        goto LABEL_40;
      }
      if (*(unsigned char *)(a1 + 84))
      {
LABEL_40:
        _os_assert_log();
        _os_crash();
        __break(1u);
        goto LABEL_41;
      }
      id v23 = *(id *)(a1 + 48);
      if (!xpc_array_get_count(v23))
      {
LABEL_41:
        _os_assert_log();
        _os_crash();
        __break(1u);
        return;
      }
      unint64_t v24 = [[_OSLogStreamFilter alloc] initWithPredicate:0];
      uint64_t applier = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      uint64_t v35 = ___OSLogStreamFilterBytesForUIDArray_block_invoke;
      char v36 = &unk_1E5A42B68;
      unsigned int v37 = v24;
      uint64_t v25 = v24;
      xpc_array_apply(v23, &applier);
      uint64_t v26 = [(_OSLogStreamFilter *)v25 data];
      [v26 length];
      uint64_t v17 = (void *)_os_trace_malloc();
      objc_msgSend(v26, "getBytes:length:", v17, objc_msgSend(v26, "length"));
      a3 = [v26 length];

      BOOL v16 = 0;
      unint64_t v18 = 0;
      a2 = v17;
      if (!v17) {
        goto LABEL_26;
      }
    }
    else
    {
      BOOL v16 = 0;
      uint64_t v17 = 0;
      unint64_t v18 = 0;
      if (!a2) {
        goto LABEL_26;
      }
    }
    goto LABEL_24;
  }
  if (a2) {
    goto LABEL_35;
  }
  if (*(unsigned char *)(a1 + 84))
  {
LABEL_36:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_37;
  }
  id v19 = *(id *)(a1 + 40);
  if (!xpc_array_get_count(v19))
  {
LABEL_37:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_38:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_39;
  }
  unint64_t v20 = [[_OSLogStreamFilter alloc] initWithPredicate:0];
  uint64_t applier = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  uint64_t v35 = ___OSLogStreamFilterBytesForPIDArray_block_invoke;
  char v36 = &unk_1E5A42B68;
  unsigned int v37 = v20;
  int v21 = v20;
  xpc_array_apply(v19, &applier);
  unint64_t v22 = [(_OSLogStreamFilter *)v21 data];
  [v22 length];
  unint64_t v18 = (void *)_os_trace_malloc();
  objc_msgSend(v22, "getBytes:length:", v18, objc_msgSend(v22, "length"));
  a3 = [v22 length];

  BOOL v16 = 0;
  uint64_t v17 = 0;
  a2 = v18;
  if (!v18)
  {
LABEL_26:
    if (*(unsigned char *)(a1 + 84)) {
      goto LABEL_27;
    }
    goto LABEL_38;
  }
LABEL_24:
  xpc_dictionary_set_data(v7, "stream_filter", a2, a3);
LABEL_27:
  free(v18);
  free(v17);
  free(v16);
  uint64_t v27 = *(_xpc_connection_s **)(a1 + 16);
  if (*(void *)(a1 + 8))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 0x40000000;
    void v29[2] = ___os_activity_stream_resume_with_filter_block_invoke_2;
    v29[3] = &__block_descriptor_tmp_43;
    v29[4] = a1;
    xpc_connection_send_message_with_reply(v27, v7, global_queue, v29);
  }
  else
  {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v7);
  }
  xpc_release(v7);
}

void ___os_activity_stream_resume_with_filter_block_invoke(uint64_t a1, void *a2)
{
  memset(v10, 0, sizeof(v10));
  uint64_t v4 = MEMORY[0x1A622E220](a2);
  if (v4 == MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_value(a2, "action")
      && !_os_activity_stream_entry_decode(a2, (int *)v10)
      && ((*(uint64_t (**)(void))(**(void **)(a1 + 32) + 16))() & 1) == 0)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)(v7 + 80) = 89;
      xpc_connection_cancel(*(xpc_connection_t *)(v7 + 16));
    }
  }
  else if (v4 == MEMORY[0x1E4F145A8])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (a2 == (void *)MEMORY[0x1E4F14528])
    {
      uint64_t v8 = *(void *)(v5 + 8);
      if (v8) {
        (*(void (**)(void))(v8 + 16))();
      }
      else {
        (*(void (**)(void))(*(void *)v5 + 16))();
      }
      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 16);
      xpc_release(v9);
    }
    else
    {
      *(_DWORD *)(v5 + 80) = 5;
      uint64_t v6 = *(_xpc_connection_s **)(v5 + 16);
      xpc_connection_cancel(v6);
    }
  }
}

void ___os_activity_stream_resume_with_filter_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1A622E220](a2);
  if (v4 != MEMORY[0x1E4F14590])
  {
    if (v4 != MEMORY[0x1E4F145A8]) {
      return;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)(v8 + 80) = 5;
    uint64_t v7 = *(_xpc_connection_s **)(v8 + 16);
    goto LABEL_7;
  }
  xpc_object_t value = xpc_dictionary_get_value(a2, "error");
  uint64_t v6 = *(void *)(a1 + 32);
  if (value)
  {
    *(_DWORD *)(v6 + 80) = 1;
    uint64_t v7 = *(_xpc_connection_s **)(v6 + 16);
LABEL_7:
    xpc_connection_cancel(v7);
    return;
  }
  uint64_t v9 = *(void (**)(void))(*(void *)(v6 + 8) + 16);
  v9();
}

void _os_activity_stream_dealloc(const void **a1)
{
  unsigned int v2 = a1[3];
  if (v2)
  {
    dispatch_release(v2);
    a1[3] = 0;
  }
  if (*a1)
  {
    _Block_release(*a1);
    *a1 = 0;
  }
  int v3 = a1[1];
  if (v3)
  {
    _Block_release(v3);
    a1[1] = 0;
  }
  uint64_t v4 = (void *)a1[5];
  if (v4)
  {
    xpc_release(v4);
    a1[5] = 0;
  }
  uint64_t v5 = (void *)a1[6];
  if (v5) {
    xpc_release(v5);
  }
  free(a1);
}

void os_activity_stream_cancel(uint64_t a1)
{
  *(_DWORD *)(a1 + 80) = 89;
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
  unsigned int v2 = *(void **)(a1 + 16);
  xpc_release(v2);
}

uint64_t _LevelForKey(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKey:a2];
  int v3 = v2;
  if (v2)
  {
    if (![v2 caseInsensitiveCompare:@"default"])
    {
      uint64_t v4 = 2;
      goto LABEL_12;
    }
    if (![v3 caseInsensitiveCompare:@"info"])
    {
      uint64_t v4 = 3;
      goto LABEL_12;
    }
    if (![v3 caseInsensitiveCompare:@"debug"])
    {
      uint64_t v4 = 4;
      goto LABEL_12;
    }
    if (![v3 caseInsensitiveCompare:@"off"]
      || ![v3 caseInsensitiveCompare:@"none"])
    {
      uint64_t v4 = 0;
      goto LABEL_12;
    }
  }
  uint64_t v4 = 1;
LABEL_12:

  return v4;
}

id OSLogPreferencesList(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA48] array];
  int v3 = [NSString stringWithUTF8String:_os_trace_app_cryptex_sysprefsdir_path()];
  uint64_t v4 = [v3 stringByAppendingPathComponent:v1];

  OSLogPreferencesListDirectory(v4, v2);
  uint64_t v5 = [NSString stringWithUTF8String:_os_trace_os_cryptex_sysprefsdir_path()];
  uint64_t v6 = [v5 stringByAppendingPathComponent:v1];

  OSLogPreferencesListDirectory(v6, v2);
  uint64_t v7 = [NSString stringWithUTF8String:_os_trace_sysprefsdir_path()];
  uint64_t v8 = [v7 stringByAppendingPathComponent:v1];

  OSLogPreferencesListDirectory(v8, v2);
  if (_os_trace_is_development_build())
  {
    uint64_t v9 = [NSString stringWithUTF8String:_os_trace_intprefsdir_path()];
    id v10 = [v9 stringByAppendingPathComponent:v1];

    OSLogPreferencesListDirectory(v10, v2);
  }
  id v11 = [NSString stringWithUTF8String:_os_trace_prefsdir_path()];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v1];

  OSLogPreferencesListDirectory(v12, v2);
  return v2;
}

void OSLogPreferencesListDirectory(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F28CB8];
  id v5 = a1;
  uint64_t v6 = [v4 defaultManager];
  uint64_t v7 = [v6 contentsOfDirectoryAtPath:v5 error:0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __OSLogPreferencesListDirectory_block_invoke;
  void v9[3] = &unk_1E5A43060;
  id v10 = v3;
  id v8 = v3;
  [v7 enumerateObjectsUsingBlock:v9];
}

uint64_t __OSLogPreferencesListDirectory_block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 hasSuffix:@".plist"];
  id v4 = v7;
  if (v3)
  {
    id v5 = [v7 stringByDeletingPathExtension];
    if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v5];
    }

    id v4 = v7;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

BOOL OSLogValidateProfilePayload(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKey:@"Processes"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v3 = [v1 objectForKey:@"Subsystems"];
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      BOOL v5 = 0;
    }
    else
    {
      id v4 = [v1 objectForKey:@"System"];
      BOOL v5 = 1;
      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          BOOL v5 = 0;
        }
      }
    }
  }

  return v5;
}

BOOL OSLogInstallProfilePayload(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1E4F14508], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v1;
    _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14508], OS_LOG_TYPE_DEFAULT, "Profile installation requested with dictionary: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  id v2 = [v1 objectForKey:@"Processes"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __OSLogInstallProfilePayload_block_invoke;
  void v11[3] = &unk_1E5A42F90;
  void v11[4] = &buf;
  [v2 enumerateKeysAndObjectsUsingBlock:v11];
  if (!*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    goto LABEL_8;
  }
  uint64_t v3 = [v1 objectForKey:@"Subsystems"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __OSLogInstallProfilePayload_block_invoke_2;
  void v10[3] = &unk_1E5A42F90;
  v10[4] = &buf;
  [v3 enumerateKeysAndObjectsUsingBlock:v10];

  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    id v4 = [v1 objectForKey:@"System"];
    BOOL v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    uint64_t v6 = [v5 objectForKey:@"Enable-Logging"];
    BOOL v7 = v6 == 0;

    if (v7) {
      [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"Enable-Logging"];
    }
    [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"Locked"];
    _OSLogInstallPreferences(1u, @"com.apple.system.logging", (uint64_t)v5);

    BOOL v8 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  }
  else
  {
LABEL_8:
    BOOL v8 = 0;
  }

  _Block_object_dispose(&buf, 8);
  return v8;
}

void sub_1A116DB7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __OSLogInstallProfilePayload_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"Locked"];
    _OSLogInstallPreferences(2u, v6, (uint64_t)v5);
  }
}

void __OSLogInstallProfilePayload_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"Locked"];
    _OSLogInstallPreferences(3u, v6, (uint64_t)v5);
  }
}

uint64_t OSLogRemoveProfilePayload(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1E4F14508], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v1;
    _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14508], OS_LOG_TYPE_DEFAULT, "Profile removal requested with dictionary: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  id v2 = [v1 objectForKey:@"Processes"];
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_2579];
  uint64_t v3 = [v1 objectForKey:@"Subsystems"];
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_16];
  id v4 = [v1 objectForKey:@"System"];
  if (v4) {
    _OSLogRemovePreferences(1u, @"com.apple.system.logging");
  }

  return 1;
}

void __OSLogRemoveProfilePayload_block_invoke_2(uint64_t a1, void *a2)
{
}

void __OSLogRemoveProfilePayload_block_invoke(uint64_t a1, void *a2)
{
}

void observation_callback(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  strcpy(buffer, "0000000000000000000000000000000000000000");
  buffer[41] = 0;
  if (!a1 || (uint64_t v3 = *(const void **)a1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalid inputs", (uint8_t *)&v19, 2u);
    }
    CFStringRef v6 = 0;
    uint64_t v3 = 0;
    goto LABEL_15;
  }
  CFStringRef v5 = (const __CFString *)(*(uint64_t (**)(void))(mobdevtab + 128))(*(void *)a1);
  CFStringRef v6 = v5;
  if (v5) {
    CFStringGetCString(v5, buffer, 42, 0x8000100u);
  }
  int v7 = *(_DWORD *)(a1 + 8);
  if (v7 == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      unint64_t v20 = buffer;
      _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "device disconnected (%s)\n", (uint8_t *)&v19, 0xCu);
    }
    (*(void (**)(uint64_t, char *, const void *, void))a2)(1, buffer, v3, *(void *)(a2 + 8));
  }
  else if (v7 == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      unint64_t v20 = buffer;
      _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "device connected (%s)\n", (uint8_t *)&v19, 0xCu);
    }
    int v8 = (*(uint64_t (**)(const void *))(mobdevtab + 32))(v3);
    if (v8)
    {
      int v9 = v8;
      id v10 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315650;
        unint64_t v20 = buffer;
        __int16 v21 = 1024;
        int v22 = v9;
        __int16 v23 = 2112;
        unint64_t v24 = v10;
        _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%s) AMDeviceConnect failed with %08x (%@)\n", (uint8_t *)&v19, 0x1Cu);
      }
LABEL_16:
      (*(void (**)(const void *))(mobdevtab + 64))(v3);
      if (v3) {
        CFRelease(v3);
      }
      if (v6) {
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    int v11 = (*(uint64_t (**)(const void *))(mobdevtab + 40))(v3);
    if (v11 != -402653155 && v11 != 0)
    {
      int v13 = (*(uint64_t (**)(const void *))(mobdevtab + 120))(v3);
      if (v13)
      {
        int v14 = v13;
        id v10 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
LABEL_38:
          (*(void (**)(uint64_t, char *, const void *, void))a2)(2, buffer, v3, *(void *)(a2 + 8));
          goto LABEL_16;
        }
        int v19 = 136315650;
        unint64_t v20 = buffer;
        __int16 v21 = 1024;
        int v22 = v14;
        __int16 v23 = 2112;
        unint64_t v24 = v10;
        uint64_t v15 = MEMORY[0x1E4F14500];
        BOOL v16 = "(%s) AMDevicePair failed with %08x (%@)\n";
LABEL_37:
        _os_log_impl(&dword_1A112E000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 0x1Cu);
        goto LABEL_38;
      }
      uint64_t v17 = (*(uint64_t (**)(const void *))(mobdevtab + 40))(v3);
      if (v17 != -402653155)
      {
        int v18 = v17;
        if (v17)
        {
          id v10 = (const void *)(*(uint64_t (**)(uint64_t))(mobdevtab + 136))(v17);
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_38;
          }
          int v19 = 136315650;
          unint64_t v20 = buffer;
          __int16 v21 = 1024;
          int v22 = v18;
          __int16 v23 = 2112;
          unint64_t v24 = v10;
          uint64_t v15 = MEMORY[0x1E4F14500];
          BOOL v16 = "(%s) AMDeviceStartSession failed with %08x (%@)\n";
          goto LABEL_37;
        }
      }
    }
    (*(void (**)(void, char *, const void *, void))a2)(0, buffer, v3, *(void *)(a2 + 8));
LABEL_15:
    id v10 = 0;
    goto LABEL_16;
  }
  id v10 = 0;
  if (v6) {
LABEL_19:
  }
    CFRelease(v6);
LABEL_20:
  if (v10) {
    CFRelease(v10);
  }
}

void *___logdev_mobdev_vtable_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/MobileDevice.framework/MobileDevice", 1);
  _logdev_mobdev_vtable_vtab = (uint64_t)result;
  if (result)
  {
    uint64_t result = dlsym(result, "AMDServiceConnectionReceive");
    qword_1E953C460 = (uint64_t)result;
    if (result)
    {
      uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionReceiveMessage");
      qword_1E953C468 = (uint64_t)result;
      if (result)
      {
        uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceCreateCopy");
        qword_1E953C470 = (uint64_t)result;
        if (result)
        {
          uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceConnect");
          qword_1E953C478 = (uint64_t)result;
          if (result)
          {
            uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceStartSession");
            qword_1E953C480 = (uint64_t)result;
            if (result)
            {
              uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceSecureStartService");
              qword_1E953C488 = (uint64_t)result;
              if (result)
              {
                uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceStopSession");
                qword_1E953C490 = (uint64_t)result;
                if (result)
                {
                  uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceDisconnect");
                  qword_1E953C498 = (uint64_t)result;
                  if (result)
                  {
                    uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionSendMessage");
                    qword_1E953C4A0 = (uint64_t)result;
                    if (result)
                    {
                      uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionGetSocket");
                      qword_1E953C4A8 = (uint64_t)result;
                      if (result)
                      {
                        uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionInvalidate");
                        qword_1E953C4B0 = (uint64_t)result;
                        if (result)
                        {
                          uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceCopyValue");
                          off_1E953C4B8 = (uint64_t (*)(void))result;
                          if (result)
                          {
                            uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceNotificationSubscribeWithOptions");
                            qword_1E953C4C0 = (uint64_t)result;
                            if (result)
                            {
                              uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceNotificationUnsubscribe");
                              off_1E953C4C8 = (uint64_t (*)(void))result;
                              if (result)
                              {
                                uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDevicePair");
                                qword_1E953C4D0 = (uint64_t)result;
                                if (result)
                                {
                                  uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceCopyDeviceIdentifier");
                                  qword_1E953C4D8 = (uint64_t)result;
                                  if (result)
                                  {
                                    uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDCopyErrorText");
                                    qword_1E953C4E0 = (uint64_t)result;
                                    if (result)
                                    {
                                      uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceGetInterfaceType");
                                      qword_1E953C4E8 = (uint64_t)result;
                                      if (result) {
                                        _logdev_mobdev_vtable_valid = 1;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void __logdev_stream_events_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    memset(v30, 0, sizeof(v30));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    memset(v25, 0, sizeof(v25));
    int v4 = *(_DWORD *)(a2 + 1);
    if (v4 > 15)
    {
      switch(v4)
      {
        case 16:
          int v5 = 515;
          goto LABEL_20;
        case 32:
          int v5 = 514;
          goto LABEL_20;
        case 64:
          int v5 = 1152;
          goto LABEL_20;
      }
    }
    else
    {
      switch(v4)
      {
        case 2:
          int v5 = 513;
          goto LABEL_20;
        case 4:
          int v5 = 768;
          goto LABEL_20;
        case 8:
          int v5 = 1024;
          goto LABEL_20;
      }
    }
    int v5 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      int v35 = v4;
      _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unknown os_activity_stream_type %u\n", buf, 8u);
      int v5 = 0;
    }
LABEL_20:
    int v6 = *(_DWORD *)(a2 + 9);
    v22[0] = v5;
    v22[1] = v6;
    uint64_t v7 = *(void *)(a2 + 13);
    *(_OWORD *)((char *)v25 + 8) = *(_OWORD *)(a2 + 39);
    uint64_t v23 = v7;
    *((void *)&v24 + 1) = a2 + 21;
    uint64_t v8 = *(unsigned __int16 *)(a2 + 37);
    if (*(_WORD *)(a2 + 37)) {
      int v9 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125));
    }
    else {
      int v9 = "<missing path>";
    }
    *(void *)&v25[0] = v9;
    *(_OWORD *)((char *)&v25[1] + 8) = *(_OWORD *)(a2 + 67);
    *((void *)&v25[2] + 1) = *(void *)(a2 + 83);
    *(void *)&long long v26 = a2 + 91;
    uint64_t v10 = *(unsigned __int16 *)(a2 + 107);
    if (*(_WORD *)(a2 + 107)) {
      int v11 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8);
    }
    else {
      int v11 = "<missing path>";
    }
    *((void *)&v26 + 1) = v11;
    int v12 = *(_DWORD *)(a2 + 1);
    if (v12 > 7)
    {
      switch(v12)
      {
        case 8:
          goto LABEL_30;
        case 16:
          if (*(_WORD *)(a2 + 109)) {
            BOOL v16 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10);
          }
          else {
            BOOL v16 = "<missing name>";
          }
          uint64_t v21 = *(unsigned int *)(a2 + 111);
          *(void *)&v30[0] = v16;
          *((void *)&v28 + 1) = v21;
          *(void *)&long long v27 = *(void *)(a2 + 55);
          DWORD2(v27) = *(_DWORD *)(a2 + 63);
          BYTE8(v30[0]) = 0;
          goto LABEL_60;
        case 64:
LABEL_30:
          uint64_t v13 = *(unsigned int *)(a2 + 109);
          if (v13) {
            int v14 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10);
          }
          else {
            int v14 = "<missing format data>";
          }
          *(void *)&v30[0] = v14;
          memset((char *)v30 + 8, 0, 32);
          if (v12 == 8)
          {
            if (*(_DWORD *)(a2 + 121))
            {
              uint64_t v17 = *(unsigned int *)(a2 + 117);
              uint64_t v18 = a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10 + v13 + v17;
            }
            else
            {
              uint64_t v18 = 0;
              LODWORD(v17) = *(_DWORD *)(a2 + 117);
            }
            *(void *)&long long v31 = v18;
            if (v17) {
              int v19 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10 + v13);
            }
            else {
              int v19 = 0;
            }
          }
          else
          {
            int v19 = "<missing buffer data>";
            *(void *)&long long v31 = "<missing buffer data>";
          }
          *((void *)&v30[2] + 1) = v19;
          *((void *)&v28 + 1) = 0;
          WORD6(v31) = 0;
          goto LABEL_59;
      }
LABEL_40:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        int v35 = v12;
        _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unknown message type %x\n", buf, 8u);
      }
      goto LABEL_60;
    }
    if (v12 == 2)
    {
      if (*(_WORD *)(a2 + 109)) {
        uint64_t v15 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10);
      }
      else {
        uint64_t v15 = "<missing name>";
      }
      *((void *)&v30[0] + 1) = *(void *)(a2 + 111);
      uint64_t v20 = *(unsigned int *)(a2 + 119);
    }
    else
    {
      if (v12 != 4) {
        goto LABEL_40;
      }
      if (*(_DWORD *)(a2 + 109)) {
        uint64_t v15 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10);
      }
      else {
        uint64_t v15 = "<missing buffer data>";
      }
      memset((char *)v30 + 8, 0, 24);
      uint64_t v20 = *(unsigned int *)(a2 + 117);
    }
    *(void *)&v30[0] = v15;
    *((void *)&v28 + 1) = v20;
LABEL_59:
    *(void *)&long long v27 = *(void *)(a2 + 55);
    DWORD2(v27) = *(_DWORD *)(a2 + 63);
LABEL_60:
    if (v5 > 767 || v5 == 513 || v5 == 515) {
      (*(void (**)(_DWORD *, void))(a1 + 32))(v22, *(void *)(a1 + 40));
    }
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Got NULL OTRCancelAndFreeActivityStream\n", (uint8_t *)v22, 2u);
  }
  (*(void (**)(void, void))(a1 + 32))(0, *(void *)(a1 + 40));
}

uint64_t _CopyOTRServiceConnectionForDevice(uint64_t a1, CFTypeRef *a2, const __CFString *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  *a2 = 0;
  uint64_t v5 = (*(uint64_t (**)(void))(mobdevtab + 24))();
  if (v5)
  {
    int v6 = (const void *)v5;
    uint64_t v7 = (*(uint64_t (**)(void))(mobdevtab + 32))();
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)uint64_t v18 = v8;
        *(_WORD *)&v18[4] = 2112;
        *(void *)&void v18[6] = v9;
        _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AMDeviceConnect failed: 0x%08x (%@)", buf, 0x12u);
      }
    }
    else
    {
      uint64_t v10 = (*(uint64_t (**)(const void *))(mobdevtab + 40))(v6);
      if (v10 == -402653155 || v10 == 0)
      {
        uint64_t v12 = (*(uint64_t (**)(const void *, const __CFString *, void, CFTypeRef *))(mobdevtab + 48))(v6, a3, 0, &cf);
        uint64_t v8 = v12;
        if (v12)
        {
          int v9 = (const void *)(*(uint64_t (**)(uint64_t))(mobdevtab + 136))(v12);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            CStringPtr = CFStringGetCStringPtr(a3, 0x8000100u);
            *(_DWORD *)long long buf = 136315650;
            *(void *)uint64_t v18 = CStringPtr;
            *(_WORD *)&v18[8] = 1024;
            *(_DWORD *)&v18[10] = v8;
            __int16 v19 = 2112;
            uint64_t v20 = v9;
            _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to start service %s: 0x%08x (%@)", buf, 0x1Cu);
          }
          if (cf) {
            CFRelease(cf);
          }
          CFTypeRef cf = 0;
        }
        else
        {
          int v9 = 0;
          *a2 = cf;
        }
      }
      else
      {
        uint64_t v8 = v10;
        int v9 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 67109378;
          *(_DWORD *)uint64_t v18 = v8;
          *(_WORD *)&v18[4] = 2112;
          *(void *)&void v18[6] = v9;
          _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AMDeviceStartSession failed: 0x%08x (%@)", buf, 0x12u);
        }
      }
      (*(void (**)(const void *))(mobdevtab + 64))(v6);
    }
    CFRelease(v6);
    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    uint64_t v8 = 3892314119;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AMDeviceCreateCopy failed", buf, 2u);
    }
  }
  return v8;
}

void __OTRCreateActivityStreamForPID_block_invoke(uint64_t a1)
{
  *(void *)&v50[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  CFTypeRef cf = 0;
  unsigned __int8 size_7 = 0;
  int v3 = (*(uint64_t (**)(void, unsigned __int8 *, uint64_t))(mobdevtab + 8))(*v2, &size_7, 1);
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v7 = MEMORY[0x1E4F14500];
    uint64_t v8 = "Failed to receive message type: remote side closed connection";
    goto LABEL_10;
  }
  if (v3 < 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    uint64_t v10 = __error();
    int v11 = strerror(*v10);
    *(_DWORD *)long long buf = 136315138;
    *(void *)uint64_t v50 = v11;
    uint64_t v7 = MEMORY[0x1E4F14500];
    uint64_t v8 = "receive got -1 when getting message type: %s";
    goto LABEL_13;
  }
  int v4 = size_7;
  if (size_7 != 2)
  {
    if (size_7 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        v50[0] = v4;
        uint64_t v7 = MEMORY[0x1E4F14500];
        uint64_t v8 = "Unknown message type: %d";
        goto LABEL_23;
      }
      goto LABEL_25;
    }
    int v5 = (*(uint64_t (**)(void, CFTypeRef *, void, void))(mobdevtab + 16))(*v2, &cf, 0, 0);
    if (v5)
    {
      int v6 = v5;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        v50[0] = v6;
        uint64_t v7 = MEMORY[0x1E4F14500];
        uint64_t v8 = "Failed to receive response: %x";
        goto LABEL_23;
      }
      goto LABEL_25;
    }
    CFTypeID TypeID = CFDictionaryGetTypeID();
    CFTypeID v20 = CFGetTypeID(cf);
    BOOL v21 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (TypeID == v20)
    {
      if (!v21) {
        goto LABEL_25;
      }
      *(_DWORD *)long long buf = 134217984;
      *(void *)uint64_t v50 = cf;
      uint64_t v7 = MEMORY[0x1E4F14500];
      uint64_t v8 = "Got error: %p";
LABEL_13:
      uint32_t v9 = 12;
      goto LABEL_24;
    }
    if (!v21) {
      goto LABEL_25;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v7 = MEMORY[0x1E4F14500];
    uint64_t v8 = "Incorrect response type";
LABEL_10:
    uint32_t v9 = 2;
    goto LABEL_24;
  }
  uint64_t v12 = 0;
  int v13 = 0;
  unsigned int size = 0;
  uint64_t v14 = *v2;
  p_unsigned int size = &size;
  do
  {
    unsigned int v16 = (*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(mobdevtab + 8))(v14, p_size, 4 - v12);
    if (!v16)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_WORD *)long long buf = 0;
      uint64_t v7 = MEMORY[0x1E4F14500];
      uint64_t v8 = "Failed to receive message size: remote side closed connection";
      goto LABEL_10;
    }
    if ((v16 & 0x80000000) != 0)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      int v22 = __error();
      uint64_t v23 = strerror(*v22);
      *(_DWORD *)long long buf = 136315138;
      *(void *)uint64_t v50 = v23;
      uint64_t v7 = MEMORY[0x1E4F14500];
      uint64_t v8 = "receive got -1 when getting message size: %s";
      goto LABEL_13;
    }
    uint64_t v12 = v16 + v13;
    p_unsigned int size = (unsigned int *)((char *)p_size + v16);
    int v13 = v12;
  }
  while (v12 < 4);
  unsigned int v17 = size;
  if (size > 0x80)
  {
    long long v24 = (unsigned __int8 *)malloc_type_malloc(size, 0x869AE6AFuLL);
    if (!v24)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      unsigned int v35 = size;
      uint64_t v36 = __error();
      unsigned int v37 = strerror(*v36);
      *(_DWORD *)long long buf = 67109378;
      v50[0] = v35;
      LOWORD(v50[1]) = 2080;
      *(void *)((char *)&v50[1] + 2) = v37;
      uint64_t v7 = MEMORY[0x1E4F14500];
      uint64_t v8 = "Failed to allocate message of size %d: %s";
      uint32_t v9 = 18;
      goto LABEL_24;
    }
    uint64_t v18 = v24;
    unint64_t v25 = size;
    if (size)
    {
      uint64_t v26 = 0;
      signed int v27 = 0;
      uint64_t v28 = *v2;
      long long v29 = v24;
      do
      {
        unsigned int v30 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, unint64_t))(mobdevtab + 8))(v28, v29, v25 - v26);
        if (!v30) {
          break;
        }
        if ((v30 & 0x80000000) != 0) {
          goto LABEL_53;
        }
        v27 += v30;
        v29 += v30;
        uint64_t v26 = v27;
      }
      while (v27 < v25);
      if ((v27 & 0x80000000) == 0)
      {
        unsigned int v31 = size;
        if (v27 >= (int)size) {
          goto LABEL_51;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          long long v32 = MEMORY[0x1E4F14500];
          long long v33 = "Failed to receive stream message: remote side closed connection";
          uint32_t v34 = 2;
          goto LABEL_67;
        }
        goto LABEL_26;
      }
LABEL_53:
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      unint64_t v42 = __error();
      __int16 v43 = strerror(*v42);
      *(_DWORD *)long long buf = 136315138;
      *(void *)uint64_t v50 = v43;
      long long v32 = MEMORY[0x1E4F14500];
      long long v33 = "receive got -1 when getting stream message: %s";
      uint32_t v34 = 12;
    }
    else
    {
      unsigned int v31 = 0;
LABEL_51:
      int v38 = *(_DWORD *)(v18 + 1);
      HIDWORD(v39) = v38;
      LODWORD(v39) = v38 - 2;
      unint64_t v40 = *(unsigned __int16 *)(v18 + 37) + (unint64_t)*(unsigned __int16 *)(v18 + 107) + 129;
      switch((v39 >> 1))
      {
        case 0u:
        case 7u:
          unint64_t v41 = *(unsigned __int16 *)(v18 + 109);
          goto LABEL_59;
        case 1u:
          v40 += *(unsigned int *)(v18 + 109);
          unint64_t v41 = *(unsigned int *)(v18 + 113);
          goto LABEL_59;
        case 3u:
          v40 += *(unsigned int *)(v18 + 109);
          unint64_t v41 = *(unsigned int *)(v18 + 117) + (unint64_t)*(unsigned int *)(v18 + 121);
LABEL_59:
          uint64_t v44 = v40 + v41 + 8 * *(unsigned int *)(v18 + 125);
          break;
        default:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 67109120;
            v50[0] = v38;
            _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unknown message type: %u", buf, 8u);
            uint64_t v44 = 0;
            unsigned int v31 = size;
          }
          else
          {
            uint64_t v44 = 0;
          }
          break;
      }
      if (v44 == v31)
      {
        int v45 = *v18;
        if (v45 == 2)
        {
          (*(void (**)(uint64_t, unsigned __int8 *))(v1 + 16))(v1, v18);
          free(v18);
          return;
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        *(_DWORD *)long long buf = 67109120;
        v50[0] = v45;
        long long v32 = MEMORY[0x1E4F14500];
        long long v33 = "Received unknown message version: %hhu";
        uint32_t v34 = 8;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        *(_DWORD *)long long buf = 67109376;
        v50[0] = v31;
        LOWORD(v50[1]) = 2048;
        *(void *)((char *)&v50[1] + 2) = v44;
        long long v32 = MEMORY[0x1E4F14500];
        long long v33 = "Got message of size %u but expected size %zu";
        uint32_t v34 = 18;
      }
    }
LABEL_67:
    _os_log_impl(&dword_1A112E000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, v34);
    goto LABEL_26;
  }
  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_25;
  }
  *(_DWORD *)long long buf = 67109120;
  v50[0] = v17;
  uint64_t v7 = MEMORY[0x1E4F14500];
  uint64_t v8 = "Got a message size that's too small to be an OTRActivityStreamMessage: %u";
LABEL_23:
  uint32_t v9 = 8;
LABEL_24:
  _os_log_impl(&dword_1A112E000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
LABEL_25:
  uint64_t v18 = 0;
LABEL_26:
  dispatch_source_cancel((dispatch_source_t)v2[1]);
  free(v18);
  if (cf) {
    CFRelease(cf);
  }
}

intptr_t __OTRCreateActivityStreamForPID_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  return dispatch_semaphore_signal(v2);
}

void __logdev_stream_events_block_invoke_2(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Canceling stream\n", v2, 2u);
  }
  OTRCancelAndFreeActivityStream(*(void *)(a1 + 32));
}

void OTRCancelAndFreeActivityStream(uint64_t a1)
{
  if (a1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 8));
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 16));
    global_queue = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __OTRCancelAndFreeActivityStream_block_invoke;
    block[3] = &__block_descriptor_tmp_65_2627;
    block[4] = a1;
    dispatch_async(global_queue, block);
  }
}

void __OTRCancelAndFreeActivityStream_block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(void))(mobdevtab + 88))(**(void **)(a1 + 32));
  id v2 = *(CFTypeRef **)(a1 + 32);
  if (*v2)
  {
    CFRelease(*v2);
    id v2 = *(CFTypeRef **)(a1 + 32);
  }
  CFTypeRef *v2 = 0;
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  int v3 = *(void **)(a1 + 32);
  free(v3);
}

void __OTRStartLegacyStreaming_block_invoke(void *a1)
{
  id v2 = a1[6];
  int64_t data = dispatch_source_get_data(v2);
  if (data <= 0)
  {
    dispatch_source_cancel(v2);
  }
  else
  {
    int64_t v4 = data;
    int v5 = (char *)_os_trace_malloc();
    (*(void (**)(void, char *, int64_t))(mobdevtab + 8))(a1[7], v5, v4);
    int v6 = &v5[v4];
    uint64_t v7 = *(void *)(a1[5] + 8);
    uint64_t v8 = v5;
    if (*(unsigned char *)(v7 + 24))
    {
      uint64_t v8 = &v5[strlen(v5) + 1];
      *(unsigned char *)(v7 + 24) = 0;
    }
    if (v8 < v6)
    {
      unint64_t v9 = (unint64_t)(v6 - 1);
      while (1)
      {
        size_t v10 = strlen(v8);
        if (*v8) {
          break;
        }
LABEL_28:
        v8 += v10 + 1;
        if (v8 >= v6) {
          goto LABEL_33;
        }
      }
      int v11 = v8 - 1;
      do
        int v12 = *(unsigned __int8 *)++v11;
      while (v12 == 10);
      if (v11 < v6)
      {
        memset(&v39, 0, sizeof(v39));
        int v13 = strptime(v11, "%b %d %H:%M:%S ", &v39);
        time_t v14 = mktime(&v39);
        uint64_t v15 = 0;
        if (!v13) {
          goto LABEL_27;
        }
        if ((unint64_t)v13 >= v9) {
          goto LABEL_27;
        }
        time_t v16 = v14;
        unsigned int v17 = strchr(v13, 32);
        uint64_t v15 = 0;
        if (!v17) {
          goto LABEL_27;
        }
        if ((unint64_t)v17 >= v9) {
          goto LABEL_27;
        }
        *unsigned int v17 = 0;
        uint64_t v18 = v17 + 1;
        __int16 v19 = strchr(v17 + 1, 91);
        uint64_t v15 = 0;
        if (!v19) {
          goto LABEL_27;
        }
        CFTypeID v20 = v19;
        if ((unint64_t)v19 >= v9) {
          goto LABEL_27;
        }
        __endptr = 0;
        *__int16 v19 = 0;
        size_t v37 = strlen(v18);
        int v21 = strtol(v20 + 1, &__endptr, 10);
        int v22 = strchr(__endptr, 60);
        uint64_t v15 = 0;
        if (!v22) {
          goto LABEL_27;
        }
        int v36 = v21;
        if ((unint64_t)v22 >= v9) {
          goto LABEL_27;
        }
        uint64_t v23 = v22 + 1;
        long long v24 = strchr(v22 + 1, 62);
        uint64_t v15 = 0;
        if (!v24) {
          goto LABEL_27;
        }
        if ((unint64_t)v24 >= v9) {
          goto LABEL_27;
        }
        *long long v24 = 0;
        unint64_t v25 = strchr(v24 + 1, 58);
        uint64_t v15 = 0;
        if (!v25 || (unint64_t)v25 >= v9) {
          goto LABEL_27;
        }
        uint64_t v26 = v25 + 1;
        signed int v27 = &v25[strlen(v25 + 1) + 1];
        if (v27 < v6)
        {
          *signed int v27 = 0;
          uint64_t __src = (char *)v26;
          size_t v34 = strlen(v26) + 1;
          uint64_t v15 = _os_trace_calloc();
          *(void *)(v15 + 55) = v16;
          *(_DWORD *)(v15 + 63) = 0;
          *(void *)(v15 + 1) = 0x8100000040;
          *(_DWORD *)(v15 + 9) = v36;
          if (!strcmp(v23, "Info"))
          {
            uint64_t v32 = OTRParseLegacyLogLine_trace_id_counter++;
            uint64_t v31 = (v32 << 32) | 0x104;
          }
          else
          {
            int v28 = strcmp(v23, "Debug");
            uint64_t v29 = OTRParseLegacyLogLine_trace_id_counter++;
            uint64_t v30 = v29 << 32;
            if (v28) {
              uint64_t v31 = v30 | 4;
            }
            else {
              uint64_t v31 = v30 | 0x204;
            }
          }
          *(void *)(v15 + 67) = v31;
          *(_WORD *)(v15 + 37) = v37 + 1;
          long long v33 = strncpy((char *)(v15 + 129), v18, v37 + 1);
          *(_DWORD *)(v15 + 109) = v34;
          strncpy(&v33[v37 + 1], __src, v34);
          goto LABEL_27;
        }
      }
      uint64_t v15 = 0;
LABEL_27:
      (*(void (**)(void))(a1[4] + 16))();
      free((void *)v15);
      goto LABEL_28;
    }
LABEL_33:
    free(v5);
  }
}

intptr_t __OTRStartLegacyStreaming_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  return dispatch_semaphore_signal(v2);
}

void sub_1A1170170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _dataForUUID(void *a1)
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  uint64_t v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];
  return v1;
}

id _dictForTimeval(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"sec";
  id v2 = [MEMORY[0x1E4F28ED0] numberWithLong:*(void *)a1];
  v6[1] = @"usec";
  v7[0] = v2;
  int v3 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 8)];
  v7[1] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

id _dictForTimezone(unsigned int *a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"mw";
  id v2 = [MEMORY[0x1E4F28ED0] numberWithInt:*a1];
  v6[1] = @"dt";
  v7[0] = v2;
  int v3 = [MEMORY[0x1E4F28ED0] numberWithInt:a1[1]];
  v7[1] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

id _dictArrayForBacktrace(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v13 = v1;
  obuint64_t j = [v1 frames];
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v19[0] = @"iu";
        uint64_t v8 = [v7 imageUUID];
        unint64_t v9 = _dataForUUID(v8);
        v19[1] = @"io";
        v20[0] = v9;
        size_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v7, "imageOffset"));
        v20[1] = v10;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

        [v2 addObject:v11];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v4);
  }

  return v2;
}

id _dictForLossCount(unint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"c";
  id v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:a1];
  v6[1] = @"s";
  v7[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:HIDWORD(a1) & 1];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void sub_1A1172ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1178D50(void *a1)
{
  objc_begin_catch(a1);
  [v1 invalidate];
  [v1 _runInvalidationHandler:8];
  objc_end_catch();
  JUMPOUT(0x1A1178D18);
}

void sub_1A1178D70(_Unwind_Exception *a1)
{
}

uint64_t _repack_compact_add_iov(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 104);
  if (v4 == *(_DWORD *)(result + 108))
  {
    unsigned int v5 = 2 * v4;
    if (v5 <= 0x10) {
      unsigned int v5 = 16;
    }
    *(_DWORD *)(result + 108) = v5;
    uint64_t result = _os_trace_realloc();
    *(void *)(v3 + 96) = result;
  }
  if (a2)
  {
    uint64_t v6 = *(void *)(a2 + 8);
    unint64_t v7 = (v6 & 0xFFFFFFFFFFFFFFF8) + 24;
    unint64_t v8 = v6 + 16;
    if ((*(void *)(a2 + 8) & 7) != 0) {
      unint64_t v8 = v7;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  uint64_t v9 = *(void *)(v3 + 96);
  uint64_t v10 = *(unsigned int *)(v3 + 104);
  *(_DWORD *)(v3 + 104) = v10 + 1;
  int v11 = (void *)(v9 + 16 * v10);
  void *v11 = a2;
  v11[1] = v8;
  *(_DWORD *)(v3 + 112) += v8;
  return result;
}

void _repack_context_cleanup(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 104) >= 2u)
  {
    unint64_t v2 = 1;
    uint64_t v3 = 16;
    do
    {
      free(*(void **)(*(void *)(a1 + 96) + v3));
      ++v2;
      v3 += 16;
    }
    while (v2 < *(unsigned int *)(a1 + 104));
  }
  free(*(void **)(a1 + 96));
  int v4 = *(void **)(a1 + 120);
  free(v4);
}

uint64_t _repack_ttl_compact_close_catalog(uint64_t a1, void *a2)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 128)) {
    _repack_ttl_compact_flush_chunkset();
  }
  int v4 = *(_DWORD *)(a1 + 116);
  if (v4 + 1 == *(_DWORD *)(a1 + 104)) {
    goto LABEL_86;
  }
  uint64_t v5 = *(void *)(a1 + 80);
  if (*(void *)(v5 + 80)) {
    uint64_t v6 = **(void ***)(*(void *)(v5 + 72) + 8);
  }
  else {
    uint64_t v6 = _catalog_subchunk_entry_alloc(v5);
  }
  unint64_t v8 = v6[2];
  unint64_t v7 = v6[3];
  if (v8 < *(void *)(a1 + 8)) {
    *(void *)(a1 + 8) = v8;
  }
  if (v7 > *(void *)(a1 + 16)) {
    *(void *)(a1 + 16) = v7;
  }
  uint64_t v9 = *(void ***)(a1 + 80);
  if (*(unsigned char *)(*(void *)(a1 + 192) + 24))
  {
    uint64_t v10 = v9[2];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    uint64_t v80 = ___repack_ttl_compact_close_catalog_block_invoke;
    uint64_t v81 = &__block_descriptor_40_e16_v24__0_16C_8_v16l;
    uint64_t v82 = a1;
    int v11 = (void *)v10[2];
    if (v11)
    {
      do
      {
        ((void (*)(void *, void *, void))v80)(v79, v11 + 2, v11[4]);
        int v11 = (void *)*v11;
      }
      while (v11);
      uint64_t v9 = *(void ***)(a1 + 80);
    }
    int v12 = v9[5];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    uint64_t v76 = ___repack_ttl_compact_close_catalog_block_invoke_2;
    uint64_t v77 = &__block_descriptor_40_e9_v16__0_v8l;
    uint64_t v78 = a1;
    if (v12)
    {
      int v13 = (void *)v12[2];
      if (v13)
      {
        do
        {
          v76((uint64_t)v75, v13[4]);
          int v13 = (void *)*v13;
        }
        while (v13);
        uint64_t v9 = *(void ***)(a1 + 80);
      }
    }
  }
  unint64_t v14 = (unint64_t)v9[2];
  if (v14) {
    unint64_t v14 = *(void *)(v14 + 24);
  }
  uint64_t v15 = 16 * v14 + 40;
  if (v14 >> 60 || 16 * v14 >= 0xFFFFFFFFFFFFFFD8)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_91;
  }
  unint64_t v16 = (unint64_t)v9[4];
  unint64_t v17 = (v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  BOOL v18 = __CFADD__(v15, v17);
  unint64_t v19 = v15 + v17;
  if (v18)
  {
LABEL_91:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_92;
  }
  unint64_t v20 = (unint64_t)v9[6];
  if (v20 >> 60)
  {
LABEL_92:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_93;
  }
  unint64_t v21 = (unint64_t)v9[7];
  if (!is_mul_ok(v21, 6uLL))
  {
LABEL_93:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_94:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_95;
  }
  unint64_t v22 = (unint64_t)v9[5];
  if (v22) {
    unint64_t v23 = *(void *)(v22 + 24);
  }
  else {
    unint64_t v23 = 0;
  }
  if (!is_mul_ok(v23, 0x38uLL)) {
    goto LABEL_94;
  }
  uint64_t v24 = 16 * v20;
  uint64_t v25 = 56 * v23;
  BOOL v18 = __CFADD__(v25, v24);
  uint64_t v26 = v25 + v24;
  if (v18)
  {
LABEL_95:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_96;
  }
  uint64_t v27 = 6 * v21;
  BOOL v18 = __CFADD__(v26, v27);
  unint64_t v28 = v26 + v27;
  if (v18)
  {
LABEL_96:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_97:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_98:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_99;
  }
  if ((v28 & 6) != 0) {
    unint64_t v28 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  BOOL v18 = __CFADD__(v28, v19);
  unint64_t v29 = v28 + v19;
  if (v18) {
    goto LABEL_97;
  }
  if (v22) {
    unint64_t v22 = *(void *)(v22 + 24);
  }
  unint64_t v30 = 2 * v22 + 32;
  if ((v22 & 0x8000000000000000) != 0 || 2 * v22 >= 0xFFFFFFFFFFFFFFE0) {
    goto LABEL_98;
  }
  uint64_t v31 = 2 * v22 + 40;
  if (v30 >= 0xFFFFFFFFFFFFFFF8)
  {
LABEL_99:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_100:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_101:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_102:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_103:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  BOOL v18 = __CFADD__(v31, 2 * v16);
  unint64_t v32 = v31 + 2 * v16;
  int v33 = v18;
  if ((v16 & 0x8000000000000000) != 0 || v33) {
    goto LABEL_100;
  }
  unint64_t v34 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v32 & 6) == 0) {
    unint64_t v34 = v32;
  }
  unint64_t v35 = (unint64_t)v9[10];
  BOOL v36 = !is_mul_ok(v35, v34);
  unint64_t v37 = v35 * v34;
  unint64_t v38 = v29 + v37;
  BOOL v39 = __CFADD__(v29, v37);
  if (v36 || v39) {
    goto LABEL_101;
  }
  unint64_t v40 = (void *)_os_trace_calloc();
  unint64_t v41 = v40;
  *unint64_t v40 = 0x110000600BLL;
  v40[1] = 0;
  v40[4] = v9[1];
  unint64_t v42 = (char *)v40 + v38;
  __int16 v43 = (char *)(v40 + 5);
  uint64_t v83 = v40 + 5;
  uint64_t v44 = v9[2];
  if (v44) {
    uint64_t v45 = 16 * v44[3];
  }
  else {
    uint64_t v45 = 0;
  }
  if (&v42[-v45] < v43) {
    goto LABEL_60;
  }
  uint64_t v74 = (char *)(v40 + 2);
  uint64_t v84 = MEMORY[0x1E4F143A8];
  uint64_t v85 = 0x40000000;
  uint64_t v86 = __catalog_chunk_unparse_uuid_block_invoke;
  uint64_t v87 = &__block_descriptor_tmp_76;
  uint64_t v88 = &v83;
  unint64_t v46 = (void *)v44[2];
  uint64_t v47 = (char *)(v40 + 5);
  if (v46)
  {
    do
    {
      ((void (*)(uint64_t *, void *, void))v86)(&v84, v46 + 2, v46[4]);
      unint64_t v46 = (void *)*v46;
    }
    while (v46);
    uint64_t v47 = (char *)v83;
  }
  unint64_t v48 = &v47[v45];
  uint64_t v83 = v48;
  *(_WORD *)uint64_t v74 = (_WORD)v48 - (_WORD)v43;
  if (v42 - (unsigned char *)v9[4] < (unint64_t)v48)
  {
LABEL_60:
    free(v41);
    unint64_t v41 = 0;
    int64_t v49 = MEMORY[8];
    uint64_t v50 = MEMORY[8] + 16;
    goto LABEL_78;
  }
  uint64_t v51 = (uint64_t)v9[3];
  uint64_t v84 = MEMORY[0x1E4F143A8];
  uint64_t v85 = 0x40000000;
  uint64_t v86 = __catalog_chunk_unparse_subsystem_block_invoke;
  uint64_t v87 = &__block_descriptor_tmp_78;
  uint64_t v88 = v9;
  uint64_t v89 = &v83;
  _os_trace_str_map_for_each(v51, (uint64_t)&v84);
  uint64_t v83 = (char *)v9[4] + (void)v83;
  size_t v52 = (((unint64_t)v83 + 7) & 0xFFFFFFFFFFFFFFF8) - (void)v83;
  bzero(v83, v52);
  uint64_t v53 = (char *)v83 + v52;
  uint64_t v83 = v53;
  uint64_t v54 = v53 - v43;
  *((_WORD *)v41 + 9) = (_WORD)v53 - (_WORD)v43;
  uint64_t v55 = v9[5];
  if (v55) {
    __int16 v56 = v55[12];
  }
  else {
    __int16 v56 = 0;
  }
  *((_WORD *)v41 + 10) = v56;
  uint64_t v84 = MEMORY[0x1E4F143A8];
  uint64_t v85 = 0x40000000;
  uint64_t v86 = __catalog_chunk_unparse_procinfo_block_invoke;
  uint64_t v87 = &__block_descriptor_tmp_79;
  uint64_t v88 = v9;
  uint64_t v89 = &v83;
  uint64_t v90 = v42;
  if (v55)
  {
    uint64_t v57 = (void *)*((void *)v55 + 2);
    if (v57)
    {
      do
      {
        ((void (*)(uint64_t *, void))v86)(&v84, v57[4]);
        uint64_t v57 = (void *)*v57;
      }
      while (v57);
      uint64_t v53 = (char *)v83;
      uint64_t v54 = (unsigned char *)v83 - v43;
    }
  }
  *((_WORD *)v41 + 11) = v54;
  *((_WORD *)v41 + 12) = 0;
  unint64_t v58 = v9[8];
  if (v58)
  {
    do
    {
      int v59 = *((_DWORD *)v58 + 8);
      if (v59)
      {
        *(_OWORD *)uint64_t v53 = *((_OWORD *)v58 + 1);
        *((_DWORD *)v53 + 4) = v59;
        *((_DWORD *)v53 + 5) = *((_DWORD *)v58 + 9);
        uint64_t v60 = v53 + 24;
        uint64_t v83 = v53 + 24;
        if ((unint64_t)(v42 - (v53 + 24)) > 3)
        {
          *((_DWORD *)v53 + 6) = *(_DWORD *)(*((void *)v58 + 6) + 4);
          unint64_t v61 = (unsigned int *)*((void *)v58 + 6);
          uint64_t v83 = v53 + 28;
          uint64_t v84 = MEMORY[0x1E4F143A8];
          uint64_t v85 = 0x40000000;
          uint64_t v86 = __catalog_chunk_unparse_subchunk_procinfos_block_invoke;
          uint64_t v87 = &__block_descriptor_tmp_82;
          uint64_t v88 = &v83;
          hashtable_iterate(v61, (uint64_t)&v84);
          uint64_t v60 = (char *)v83;
          if ((unint64_t)(v42 - (unsigned char *)v83) >= 4)
          {
            *(_DWORD *)uint64_t v83 = *(_DWORD *)(*((void *)v58 + 5) + 4);
            uint64_t v83 = v60 + 4;
            uint64_t v62 = (unsigned int *)*((void *)v58 + 5);
            uint64_t v84 = MEMORY[0x1E4F143A8];
            uint64_t v85 = 0x40000000;
            uint64_t v86 = __catalog_chunk_unparse_subchunk_subcats_block_invoke;
            uint64_t v87 = &__block_descriptor_tmp_83;
            uint64_t v88 = &v83;
            hashtable_iterate(v62, (uint64_t)&v84);
            uint64_t v60 = (char *)v83;
          }
        }
        ++*((_WORD *)v41 + 12);
        size_t v63 = ((unint64_t)(v60 + 7) & 0xFFFFFFFFFFFFFFF8) - (void)v60;
        bzero(v60, v63);
        uint64_t v53 = (char *)v83 + v63;
        uint64_t v83 = (char *)v83 + v63;
      }
      unint64_t v58 = *(void **)v58;
    }
    while (v58);
    uint64_t v54 = v53 - v43;
  }
  if (v54 >= 0x10000) {
    goto LABEL_102;
  }
  int64_t v49 = v53 - v74;
  v41[1] = v49;
  uint64_t v50 = v49 + 16;
  if (v49 + 16 > v38) {
    goto LABEL_103;
  }
LABEL_78:
  if ((v49 & 7) != 0) {
    unint64_t v64 = (v49 & 0xFFFFFFFFFFFFFFF8) + 24;
  }
  else {
    unint64_t v64 = v50;
  }
  __int16 v65 = (void *)(*(void *)(a1 + 96) + 16 * *(unsigned int *)(a1 + 116));
  *__int16 v65 = v41;
  v65[1] = v64;
  *(_DWORD *)(a1 + 112) += v64;
  uint64_t v66 = _os_trace_writev();
  if (v66 != -1)
  {
    *(void *)(a1 + 184) += v66;
    if (*(_DWORD *)(a1 + 104) >= 2u)
    {
      uint64_t v67 = *(void *)(a1 + 96);
      unint64_t v68 = 1;
      uint64_t v69 = 16;
      do
      {
        free(*(void **)(v67 + v69));
        uint64_t v67 = *(void *)(a1 + 96);
        int v70 = (void *)(v67 + v69);
        ++v68;
        *int v70 = 0;
        v70[1] = 0;
        v69 += 16;
      }
      while (v68 < *(unsigned int *)(a1 + 104));
    }
    *(_DWORD *)(a1 + 112) = 0;
    int v4 = 1;
LABEL_86:
    *(_DWORD *)(a1 + 104) = v4;
    _catalog_destroy(*(void *)(a1 + 24));
    _catalog_destroy(*(void *)(a1 + 80));
    *(void *)(a1 + 80) = 0;
    *(void *)(a1 + 24) = 0;
    uint64_t result = 1;
    *(void *)(a1 + 40) = 0;
    return result;
  }
  int v72 = __error();
  if (!a2) {
    return 0;
  }
  create_repack_error(*v72, @"Failed to write file data to temp file");
  id v73 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t result = 0;
  *a2 = v73;
  return result;
}

void _repack_ttl_compact_flush_chunkset()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = dst_buffer;
  bzero(dst_buffer, 0x10000uLL);
  int v2 = 256;
  size_t v3 = compression_encode_buffer(dst_buffer, 0x10000uLL, *(const uint8_t **)(v0 + 120), *(unsigned int *)(v0 + 128), 0, COMPRESSION_LZ4);
  if (v3)
  {
    size_t v4 = v3;
  }
  else
  {
    int v2 = 0;
    id v1 = *(uint8_t **)(v0 + 120);
    size_t v4 = *(unsigned int *)(v0 + 128);
  }
  uint64_t v5 = (void *)_os_trace_malloc();
  uint64_t v6 = (uint64_t)v5;
  if ((v4 & 7) != 0) {
    *(void *)((char *)v5 + ((v4 + 16) & 0xFFFFFFFFFFFFFFF8)) = 0;
  }
  void *v5 = 0x110000600DLL;
  v5[1] = v4;
  memcpy(v5 + 2, v1, v4);
  _repack_compact_add_iov(v0, v6);
  uint64_t v7 = *(void *)(v0 + 80);
  int v8 = *(_DWORD *)(v0 + 128);
  if (*(void *)(v7 + 80))
  {
    uint64_t v9 = **(void ***)(*(void *)(v7 + 72) + 8);
  }
  else
  {
    uint64_t v9 = _catalog_subchunk_entry_alloc(v7);
    uint64_t v7 = *(void *)(v0 + 80);
  }
  *((_DWORD *)v9 + 8) = v8;
  *((_DWORD *)v9 + 9) = v2;
  _catalog_subchunk_entry_alloc(v7);
  bzero(*(void **)(v0 + 120), *(unsigned int *)(v0 + 132));
  *(_DWORD *)(v0 + 128) = 0;
}

void ___repack_ttl_compact_close_catalog_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 192) + 32) addObject:v3];
}

void ___repack_ttl_compact_close_catalog_block_invoke_2(uint64_t a1, uint64_t a2)
{
  size_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2 + 40];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2 + 24];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 192) + 32) addObject:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 192) + 32) addObject:v5];
  uint64_t v6 = *(unsigned int **)(a2 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___repack_ttl_compact_close_catalog_block_invoke_3;
  void v7[3] = &__block_descriptor_40_e13_v24__0_v8_v16l;
  void v7[4] = *(void *)(a1 + 32);
  hashtable_iterate(v6, (uint64_t)v7);
}

id create_repack_error(int a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = a2;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a2;
  uint64_t v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"LogRepackErrorDomain" code:a1 userInfo:v5];

  return v6;
}

void ___repack_ttl_compact_close_catalog_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3 + 16];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 192) + 32) addObject:v4];
}

uint64_t _repack_ttl_compact_open_catalog(uint64_t a1, _DWORD *a2)
{
  uint64_t result = _catalog_create_with_chunk(a2, 0);
  *(void *)(a1 + 24) = result;
  if (result)
  {
    *(void *)(a1 + 40) = *(void *)(result + 64);
    *(_DWORD *)(a1 + 116) = *(_DWORD *)(a1 + 104);
    _repack_compact_add_iov(a1, 0);
    _catalog_create();
  }
  return result;
}

uint64_t _compact_chunkset()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  int v2 = v1;
  uint64_t v149 = v3;
  uint64_t v5 = v4;
  uint64_t v6 = v0;
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v8 = v7;
  int v9 = *(_DWORD *)v6;
  if (*(int *)v6 <= 24587)
  {
    if ((v9 - 24578) < 3)
    {
LABEL_3:
      unsigned int v10 = *(_DWORD *)(v6 + 24);
      uint64_t v11 = *(void *)(v6 + 16);
      *(void *)(v5 + 32) = 0;
      int v12 = _os_procinfo_map_lookup(*(void **)(*(void *)(v5 + 24) + 40), v11, v10);
      *(void *)(v5 + 32) = v12;
      goto LABEL_4;
    }
    if (v9 != 24577) {
      goto LABEL_147;
    }
    unint64_t v88 = *(void *)(v6 + 8);
    unint64_t v89 = v88 - 16;
    if (v88 < 0x10)
    {
LABEL_108:
      *(void *)(v5 + 48) = 0;
      uint64_t v90 = [NSString stringWithFormat:@"Warning: chunk with chunkset_start_addr and id: %p, %@ was unreadable!", v149, v8];
      uint64_t v91 = (FILE *)*MEMORY[0x1E4F143C8];
      id v92 = v90;
      fprintf(v91, "%s\n", (const char *)[v92 UTF8String]);
      goto LABEL_162;
    }
    uint64_t v127 = v6 + 32;
    if (v88 - 4113 >= 0xFFFFFFFFFFFFF00FLL)
    {
      unint64_t v128 = *(unsigned __int16 *)(v6 + 32);
      if (v89 < v128) {
        goto LABEL_108;
      }
      uint64_t v129 = *(unsigned __int16 *)(v6 + 34);
      if (v129 <= 0xFFF)
      {
        if (*(unsigned char *)(v6 + 29))
        {
          if (v89 <= v128 + (unsigned __int16)(4096 - v129))
          {
            *(void *)(v5 + 56) = v127 + v128;
            *(void *)(v5 + 64) = (unsigned __int16)(4096 - v129);
LABEL_167:
            *(void *)(v5 + 48) = v127;
            goto LABEL_3;
          }
        }
        else if (v89 == 4096)
        {
          *(void *)(v5 + 56) = v127 + v129;
          *(void *)(v5 + 64) = (unsigned __int16)(4096 - v129);
          goto LABEL_167;
        }
      }
    }
    *(void *)(v5 + 56) = 0;
    *(void *)(v5 + 64) = 0;
    goto LABEL_167;
  }
  if (v9 == 24588)
  {
    int v87 = *(unsigned __int8 *)(v6 + 29);
  }
  else
  {
    if (v9 != 24592) {
      goto LABEL_147;
    }
    int v87 = 0;
  }
  uint64_t v120 = *(void *)(v6 + 16);
  *(void *)(v5 + 32) = 0;
  uint64_t v121 = *(void *)(*(void *)(v5 + 24) + 40);
  if (!v121) {
    goto LABEL_146;
  }
  uint64_t v122 = (void *)(v121 + 16);
  do
  {
    uint64_t v122 = (void *)*v122;
    if (!v122) {
      goto LABEL_146;
    }
  }
  while (v122[2] != v120);
  int v12 = (void *)v122[4];
  *(void *)(v5 + 32) = v12;
  if (v12) {
    BOOL v123 = v87 == 0;
  }
  else {
    BOOL v123 = 1;
  }
  if (v123)
  {
LABEL_4:
    if (v12) {
      goto LABEL_5;
    }
LABEL_146:
    *(void *)(v5 + 48) = 0;
LABEL_147:
    id v92 = [NSString stringWithFormat:@"ERROR: unpacking chunk with chunkset_start_addr and id: %p, %@ was unsuccessful", v149, v8];
    if (v2)
    {
      create_repack_error(65, v92);
      uint64_t v126 = 0;
      void *v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v126 = 0;
    }
    goto LABEL_163;
  }
  int v124 = *((__int16 *)v12 + 1);
  if (v124 < 0)
  {
    __int16 v125 = v124 & 0x7FFF;
    *((_WORD *)v12 + 1) = v125;
    if (v87 == 4) {
      *((_WORD *)v12 + 1) = v125 | 1;
    }
  }
LABEL_5:
  uint64_t v13 = *(void *)(v6 + 8);
  if ((v13 & 7) != 0) {
    unsigned int v14 = (v13 & 0xFFFFFFF8) + 24;
  }
  else {
    unsigned int v14 = v13 + 16;
  }
  if (*(_DWORD *)(v5 + 128) + v14 > *(_DWORD *)(v5 + 132)) {
    _repack_ttl_compact_flush_chunkset();
  }
  int v15 = *(_DWORD *)v6;
  id v148 = v8;
  if (v15 != 24577)
  {
    *(void *)&long long v164 = 0;
    long long v162 = 0u;
    memset(v163, 0, sizeof(v163));
    *(_OWORD *)__n = 0u;
    long long v161 = 0u;
    if ((*(_DWORD *)v6 - 24579) <= 1)
    {
      uint64_t v93 = objc_msgSend(v148, "stringByAppendingFormat:", @"-%llu", v6 - v149);
      if (*(_DWORD *)v6 == 24580) {
        uint64_t v94 = (void *)(v6 + 56);
      }
      else {
        uint64_t v94 = (void *)(v6 + 48);
      }
      uint64_t v95 = _os_trace_uuid_map_lookup(*(void **)(*(void *)(v5 + 192) + 16), v94);
      size_t v96 = *(void *)(v6 + 32);
      long long v152 = 0;
      long long v150 = 0u;
      long long v151 = 0u;
      _OSLogEventUnpackChunk_3059((void *)v6, *(void *)(v5 + 24), (uint64_t)&v150);
      uint64_t v97 = *(void *)(v5 + 40);
      size_t v99 = *(void *)(v97 + 16);
      size_t v98 = *(void *)(v97 + 24);
      *(_OWORD *)((char *)v163 + 8) = v150;
      if (v99 <= v96) {
        size_t v99 = v96;
      }
      if (v99 < v98) {
        size_t v98 = v99;
      }
      *(_DWORD *)((char *)&v161 + 2) = 0;
      WORD3(v161) = 0;
      uint64_t v101 = *(void *)(v5 + 160);
      uint64_t v100 = *(void *)(v5 + 168);
      uint64_t v102 = *(void *)(v5 + 24);
      *(_OWORD *)((char *)&v163[1] + 8) = v151;
      __n[0] = 3;
      __n[1] = v98;
      LOWORD(v161) = 0;
      *((void *)&v161 + 1) = v100;
      *(void *)&long long v162 = v6 - v149;
      *((void *)&v162 + 1) = v101;
      *(void *)&v163[0] = v102;
      *((void *)&v163[2] + 1) = v152;
      *(void *)&long long v164 = 0;
      if ([**(id **)(v5 + 192) _setLogEvent:__n rangeUUIDIndex:v95 machTimebase:*(void *)(v5 + 192) + 8 traceFilename:&stru_1EF440710])
      {
        if ((*(uint64_t (**)(void))(*(void *)(v5 + 136) + 16))())
        {

          goto LABEL_120;
        }
        ++*(void *)(v5 + 152);
      }

      goto LABEL_161;
    }
LABEL_120:
    memcpy((void *)(*(void *)(v5 + 120) + *(unsigned int *)(v5 + 128)), (const void *)v6, v14);
    *(_DWORD *)(v5 + 128) += v14;
    _catalog_subchunk_update_times(*(void *)(v5 + 80), *(void *)(v6 + 32));
    uint64_t v103 = _catalog_procinfo_create(*(void *)(v5 + 80), *(void *)(v5 + 32));
    *(void *)(v5 + 72) = v103;
    _catalog_subchunk_procinfo_add(*(void *)(v5 + 80), v103);
    *(void *)(v5 + 72) = 0;
    *(void *)(v5 + 32) = 0;
    goto LABEL_161;
  }
  uint64_t v147 = v6;
  id v137 = v8;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  memset(v163, 0, sizeof(v163));
  long long v161 = 0u;
  unint64_t v16 = *(size_t **)(v5 + 48);
  __n[1] = v16[1];
  size_t v17 = *v16;
  LODWORD(v17) = 268435472;
  __n[0] = v17;
  *(void *)(v5 + 88) = __n;
  BOOL v18 = v16 + 2;
  uint64_t v19 = *(unsigned __int16 *)v16;
  unint64_t v20 = (char *)v16 + v19;
  if (v19 > 0x1000) {
    unint64_t v21 = (unint64_t)v18;
  }
  else {
    unint64_t v21 = (unint64_t)v20;
  }
  unint64_t v146 = v21;
  while (1)
  {
    unint64_t v22 = v18 + 3;
    if ((unint64_t)(v18 + 3) >= v21) {
      break;
    }
    unint64_t v23 = v18;
    unint64_t v24 = v18[2];
    uint64_t v25 = HIWORD(v24);
    if (!HIWORD(v24) || v25 > (uint64_t)(v21 - (void)v22)) {
      break;
    }
    if ((v24 & 0x7000000000000) != 0) {
      uint64_t v27 = (HIWORD(v24) & 0xFFF8) + 32;
    }
    else {
      uint64_t v27 = v25 + 24;
    }
    BOOL v18 = (void *)((char *)v18 + v27);
    if (*v23)
    {
      unint64_t v28 = (void *)MEMORY[0x1A622D720]();
      objc_msgSend(v148, "stringByAppendingFormat:", @"-%llu", (char *)v23 - v149);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      int v30 = *(unsigned __int8 *)v23;
      unint64_t v31 = (v23[2] & 0xFFFFFFFFFFFFLL) + *(void *)(*(void *)(v5 + 48) + 8);
      uint64_t v191 = 0;
      memset(v190, 0, sizeof(v190));
      _OSLogEventUnpackChunk_3059((void *)v147, *(void *)(v5 + 24), (uint64_t)v190);
      uint64_t v32 = *(void *)(v5 + 40);
      unint64_t v34 = *(void *)(v32 + 16);
      unint64_t v33 = *(void *)(v32 + 24);
      if (v34 <= v31) {
        unint64_t v34 = v31;
      }
      if (v34 < v33) {
        unint64_t v33 = v34;
      }
      *(_DWORD *)((char *)&v151 + 2) = 0;
      WORD3(v151) = 0;
      uint64_t v36 = *(void *)(v5 + 160);
      uint64_t v35 = *(void *)(v5 + 168);
      uint64_t v37 = *(void *)(v5 + 24);
      long long v155 = v190[0];
      long long v156 = v190[1];
      uint64_t v157 = v191;
      *(void *)&long long v150 = 3;
      *((void *)&v150 + 1) = v33;
      LOWORD(v151) = 0;
      *((void *)&v151 + 1) = v35;
      long long v152 = (char *)v23 - v149;
      uint64_t v153 = v36;
      uint64_t v154 = v37;
      uint64_t v158 = v23;
      if (!objc_msgSend(**(id **)(v5 + 192), "_setLogEvent:rangeUUIDIndex:machTimebase:traceFilename:", &v150, _os_trace_uuid_map_lookup(*(void **)(*(void *)(v5 + 192) + 16), v22), *(void *)(v5 + 192) + 8, &stru_1EF440710))goto LABEL_101; {
      if (((*(uint64_t (**)(void))(*(void *)(v5 + 136) + 16))() & 1) == 0)
      }
      {
        ++*(void *)(v5 + 152);
        goto LABEL_101;
      }
      __int16 v38 = *((_WORD *)v23 + 1);
      if (v38)
      {
        if (!(v23[2] >> 51)) {
          goto LABEL_101;
        }
        unint64_t v39 = 8;
        if ((v38 & 0x10) == 0) {
          goto LABEL_38;
        }
      }
      else
      {
        unint64_t v39 = 0;
        if ((v38 & 0x10) == 0) {
          goto LABEL_38;
        }
      }
      v39 += 8;
      if (*((unsigned __int16 *)v23 + 11) < v39) {
        goto LABEL_101;
      }
LABEL_38:
      if (v30 == 2)
      {
        if ((*((_WORD *)v23 + 1) & 0x200) != 0)
        {
          unint64_t v40 = v39 + 8;
          if (v39 + 8 > *((unsigned __int16 *)v23 + 11)) {
            goto LABEL_101;
          }
        }
        else
        {
          unint64_t v40 = v39;
        }
        if (*((unsigned char *)v23 + 1) == 1)
        {
          v40 += 8;
          if (v40 > *((unsigned __int16 *)v23 + 11)) {
            goto LABEL_101;
          }
        }
        LODWORD(v144) = 0;
        unint64_t v145 = 0;
        goto LABEL_47;
      }
      if ((*((_WORD *)v23 + 1) & 0x100) == 0)
      {
        LODWORD(v144) = 0;
        unint64_t v145 = 0;
        unint64_t v40 = v39;
LABEL_47:
        unint64_t v39 = 0;
        goto LABEL_48;
      }
      unint64_t v40 = v39 + 4;
      if (v39 + 4 > *((unsigned __int16 *)v23 + 11)) {
        goto LABEL_101;
      }
      uint64_t v144 = WORD1(v22[v39 / 8]);
      unint64_t v145 = LOWORD(v22[v39 / 8]);
      if (v144 + v145 > 0x1000 || 4096 - *(void *)(v5 + 64) > v145) {
        goto LABEL_101;
      }
LABEL_48:
      uint64_t v41 = *(void *)(v5 + 32);
      if (*(_WORD *)(v41 + 2)) {
        unsigned int v42 = 4;
      }
      else {
        unsigned int v42 = 6;
      }
      switch(v38 & 0xE)
      {
        case 2:
        case 4:
        case 6:
          unsigned int v42 = 4;
          break;
        case 8:
          break;
        case 0xA:
          unsigned int v42 = 20;
          break;
        case 0xC:
          unsigned int v42 = 6;
          break;
        default:
          unsigned int v42 = 0;
          break;
      }
      unint64_t v43 = v40 + v42;
      unint64_t v44 = v23[2];
      if (v43 <= HIWORD(v44) && v42)
      {
        uint64_t v45 = (unsigned int *)((char *)v22 + v40);
        if (v42 == 6)
        {
          unint64_t v46 = 0;
          unint64_t v47 = (unint64_t)*((unsigned __int16 *)v45 + 2) << 32;
        }
        else
        {
          unint64_t v47 = 0;
          unint64_t v46 = v42 == 4 ? 0 : (uint64_t *)(v45 + 1);
        }
        unint64_t v48 = HIWORD(v44);
        uint64_t v49 = *v45;
        if ((v38 & 0x20) == 0 || (v43 += 2, v43 <= v48))
        {
          if (v30 == 2)
          {
            __int16 v50 = 0;
            uint64_t v51 = 0;
LABEL_78:
            if (!*(void *)(v5 + 72))
            {
              __int16 v139 = v50;
              v142 = v46;
              v135 = v18;
              uint64_t v54 = v28;
              uint64_t v55 = v51;
              unint64_t v56 = v47;
              uint64_t v57 = v49;
              uint64_t v58 = _catalog_procinfo_create(*(void *)(v5 + 80), *(void *)(v5 + 32));
              *(void *)(v5 + 72) = v58;
              _catalog_subchunk_procinfo_add(*(void *)(v5 + 80), v58);
              uint64_t v49 = v57;
              unint64_t v47 = v56;
              uint64_t v51 = v55;
              unint64_t v28 = v54;
              BOOL v18 = v135;
              unint64_t v46 = v142;
              __int16 v50 = v139;
              __int16 v38 = *((_WORD *)v23 + 1);
            }
            int v59 = v38 & 0xE;
            if (v59 == 10)
            {
              uint64_t v62 = *(void *)(*(void *)(v5 + 80) + 16);
              if (v62) {
                uint64_t v63 = *(void *)(v62 + 24);
              }
              else {
                uint64_t v63 = 0;
              }
              _os_trace_uuid_map_insert((float *)v62, v46, v63);
            }
            else if (v59 == 8)
            {
              uint64_t v60 = _catalog_procinfo_lookup_pc(*(void *)(v5 + 32), v47 | v49);
              if (v60)
              {
                *((void *)&v190[1] + 1) = 0;
                *(void *)&v190[0] = *(void *)(v60 + 8);
                uint64_t v61 = *(void *)v60;
                DWORD2(v190[0]) = *(void *)v60;
                WORD6(v190[0]) = WORD2(v61);
                *(_OWORD *)((char *)v190 + 14) = *(_OWORD *)(v60 + 16);
                _catalog_procinfo_uuidinfo_add(*(void *)(v5 + 80), *(void *)(v5 + 72), (uint64_t)v190);
              }
            }
            unint64_t v143 = v39;
            if (v51)
            {
              uint64_t v140 = v51;
              uint64_t v65 = *(void *)(v5 + 72);
              uint64_t v64 = *(void *)(v5 + 80);
              __int16 v159 = v50;
              if (!hashtable_lookup(*(void *)(v65 + 64), (uint64_t)&v159))
              {
                uint64_t v131 = v65;
                __int16 v136 = v159;
                uint64_t v66 = v64;
                uint64_t v67 = *(char **)(v140 + 8);
                v133 = *(char **)(v140 + 16);
                LOWORD(v190[0]) = v159;
                uint64_t v68 = _os_trace_calloc();
                *(_WORD *)uint64_t v68 = v136;
                v132 = (void *)v66;
                int v70 = *(void **)(v66 + 24);
                uint64_t v69 = (uint64_t **)(v66 + 24);
                int v71 = _os_trace_str_map_entry(v70, v67);
                *(void *)(v68 + 8) = v71;
                if (!v71)
                {
                  _os_trace_str_map_insert(v69, v67, v132[4]);
                  size_t v72 = strlen(v67);
                  id v73 = (void *)v132[3];
                  v132[4] += v72 + 1;
                  *(void *)(v68 + 8) = _os_trace_str_map_entry(v73, v67);
                }
                uint64_t v74 = _os_trace_str_map_entry(*v69, v133);
                *(void *)(v68 + 16) = v74;
                if (!v74)
                {
                  _os_trace_str_map_insert(v69, v133, v132[4]);
                  size_t v75 = strlen(v133);
                  uint64_t v76 = (void *)v132[3];
                  v132[4] += v75 + 1;
                  *(void *)(v68 + 16) = _os_trace_str_map_entry(v76, v133);
                }
                hashtable_insert(*(int **)(v131 + 64), v190, v68);
                ++v132[7];
              }
              uint64_t v77 = *(void *)(v5 + 80);
              __int16 v78 = (unsigned __int16)_os_trace_str_map_lookup(*(void **)(v77 + 24), *(char **)(v140 + 8));
              catalog_subchunk_string_insert(v77, v78);
              __int16 v79 = (unsigned __int16)_os_trace_str_map_lookup(*(void **)(v77 + 24), *(char **)(v140 + 16));
              catalog_subchunk_string_insert(v77, v79);
            }
            _catalog_subchunk_update_times(*(void *)(v5 + 80), v31);
            uint64_t v80 = *(unsigned __int16 **)(v5 + 88);
            uint64_t v81 = (char *)v80 + *v80;
            unint64_t v82 = v23[2];
            if ((v82 & 0x7000000000000) != 0) {
              uint64_t v83 = (HIWORD(v82) & 0xFFF8) + 32;
            }
            else {
              uint64_t v83 = HIWORD(v82) + 24;
            }
            memcpy((char *)v80 + *v80, v23, (unsigned __int16)v83);
            *v80 += v83;
            if (*((unsigned char *)v23 + 3))
            {
              uint64_t v84 = *(void *)(v5 + 64);
              unsigned __int16 v85 = v80[1] - v144;
              v80[1] = v85;
              memcpy((char *)v80 + v85, (const void *)(v84 + *(void *)(v5 + 56) + v145 - 4096), v144);
              uint64_t v86 = &v81[v143];
              *((_WORD *)v86 + 12) = v85;
              *((_WORD *)v86 + 13) = v144;
            }
            goto LABEL_101;
          }
          if ((*((_WORD *)v23 + 1) & 0x200) != 0)
          {
            uint64_t v134 = *v45;
            unint64_t v138 = v47;
            size_t v141 = v46;
            unint64_t v52 = v43 + 2;
            if (v43 + 2 > v48)
            {
              __int16 v50 = 0;
              uint64_t v51 = 0;
              unint64_t v43 = HIWORD(v44);
            }
            else
            {
              __int16 v50 = *(_WORD *)((char *)v22 + v43);
              LOWORD(v190[0]) = v50;
              uint64_t v53 = hashtable_lookup(*(void *)(v41 + 64), (uint64_t)v190);
              __int16 v38 = *((_WORD *)v23 + 1);
              unint64_t v43 = v52;
              uint64_t v51 = v53;
            }
            unint64_t v47 = v138;
            unint64_t v46 = v141;
            uint64_t v49 = v134;
            if ((v38 & 0x400) == 0) {
              goto LABEL_78;
            }
          }
          else
          {
            __int16 v50 = 0;
            uint64_t v51 = 0;
            if ((*((_WORD *)v23 + 1) & 0x400) == 0) {
              goto LABEL_78;
            }
          }
          if (v43 >= *((unsigned __int16 *)v23 + 11)) {
            goto LABEL_101;
          }
          goto LABEL_78;
        }
      }
LABEL_101:

      unint64_t v21 = v146;
    }
  }
  id v8 = v137;
  if (*(void *)(v5 + 72))
  {
    size_t v104 = LOWORD(__n[0]);
    uint64_t v105 = WORD1(__n[0]);
    unsigned int v106 = LOWORD(__n[0]) - WORD1(__n[0]) + 4096;
    BOOL v107 = v106 < 0xFF9;
    if (v106 >= 0xFF9) {
      unsigned int v106 = 4096;
    }
    if (WORD1(__n[0]) == 4096) {
      size_t v108 = LOWORD(__n[0]);
    }
    else {
      size_t v108 = v106;
    }
    BOOL v109 = WORD1(__n[0]) != 4096 && v107;
    id v110 = (void *)(*(void *)(v5 + 120) + *(unsigned int *)(v5 + 128));
    void *v110 = 24577;
    v110[1] = v108 + 16;
    uint64_t v111 = (*(_DWORD *)(v5 + 128) + 16);
    *(_DWORD *)(v5 + 128) = v111;
    LOWORD(v110) = *(_WORD *)(v147 + 30);
    uint64_t v112 = *(void *)(v5 + 120) + v111;
    uint64_t v113 = *(void *)(v147 + 16);
    int v114 = *(_DWORD *)(v147 + 24);
    *(unsigned char *)(v112 + 12) = *(unsigned char *)(v147 + 28);
    *(_DWORD *)(v112 + 8) = v114;
    *(void *)uint64_t v112 = v113;
    *(unsigned char *)(v112 + 13) = v109;
    *(_WORD *)(v112 + 14) = (_WORD)v110;
    uint64_t v115 = (*(_DWORD *)(v5 + 128) + 16);
    *(_DWORD *)(v5 + 128) = v115;
    id v116 = (void *)(*(void *)(v5 + 120) + v115);
    if (v109)
    {
      memcpy(v116, __n, v104);
      int v117 = (v104 & 0xFFF8) + 8;
      if ((v104 & 7) == 0) {
        int v117 = v104;
      }
      uint64_t v118 = (*(_DWORD *)(v5 + 128) + v117);
      *(_DWORD *)(v5 + 128) = v118;
      memcpy((void *)(*(void *)(v5 + 120) + v118), (char *)__n + v105, 4096 - v105);
      int v119 = *(_DWORD *)(v5 + 128) + ((4103 - v105) & 0xFFFFFFF8);
    }
    else
    {
      memcpy(v116, __n, v108);
      int v119 = *(_DWORD *)(v5 + 128) + v108;
    }
    *(_DWORD *)(v5 + 128) = v119;
  }
  *(void *)(v5 + 72) = 0;
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 88) = 0;
  *(void *)(v5 + 48) = 0;
LABEL_161:

  id v92 = 0;
LABEL_162:
  uint64_t v126 = 1;
LABEL_163:

  return v126;
}

void *_OSLogEventUnpackChunk_3059(void *result, uint64_t a2, uint64_t a3)
{
  *(void *)a3 = result;
  uint64_t v4 = (void *)(a3 + 16);
  int v5 = *(_DWORD *)result;
  switch(*(_DWORD *)result)
  {
    case 0x6001:
      unint64_t v6 = result[1];
      unint64_t v7 = v6 - 16;
      if (v6 < 0x10) {
        goto LABEL_22;
      }
      id v8 = (unsigned __int16 *)(result + 4);
      BOOL v9 = *((unsigned char *)result + 29) != 0;
      goto LABEL_16;
    case 0x6002:
      unint64_t v11 = result[1];
      unint64_t v7 = v11 - 32;
      if (v11 < 0x20) {
        goto LABEL_22;
      }
      BOOL v9 = 0;
      id v8 = (unsigned __int16 *)(result + 6);
      goto LABEL_16;
    case 0x6003:
      unint64_t v12 = result[1];
      unint64_t v7 = v12 - 48;
      if (v12 < 0x30) {
        goto LABEL_22;
      }
      BOOL v9 = 0;
      id v8 = (unsigned __int16 *)(result + 8);
      goto LABEL_16;
    case 0x6004:
      unint64_t v13 = result[1];
      unint64_t v7 = v13 - 72;
      if (v13 < 0x48) {
        goto LABEL_22;
      }
      BOOL v9 = 0;
      id v8 = (unsigned __int16 *)(result + 11);
      goto LABEL_16;
    case 0x6005:
    case 0x6006:
    case 0x6007:
    case 0x6008:
    case 0x6009:
    case 0x600A:
    case 0x600B:
      goto LABEL_7;
    case 0x600C:
      unint64_t v14 = result[1];
      unint64_t v7 = v14 - 16;
      if (v14 < 0x10) {
        goto LABEL_22;
      }
      BOOL v9 = 0;
      id v8 = (unsigned __int16 *)result + 15;
      goto LABEL_16;
    default:
      if (v5 != 24592)
      {
LABEL_7:
        *(_OWORD *)(a3 + 24) = 0u;
        *(_OWORD *)(a3 + 8) = 0u;
        return result;
      }
      unint64_t v10 = result[1];
      unint64_t v7 = v10 - 16;
      if (v10 < 0x10) {
        goto LABEL_22;
      }
      BOOL v9 = 0;
      id v8 = (unsigned __int16 *)(result + 4);
LABEL_16:
      if (v7 - 4097 < 0xFFFFFFFFFFFFF00FLL) {
        goto LABEL_17;
      }
      unint64_t v15 = *v8;
      if (v7 < v15)
      {
LABEL_22:
        *(void *)(a3 + 8) = 0;
        *(void *)(a3 + 32) = 0;
        return result;
      }
      uint64_t v17 = v8[1];
      if (v17 > 0xFFF) {
        goto LABEL_17;
      }
      if (!v9)
      {
        if (v7 == 4096)
        {
          void *v4 = (char *)v8 + v17;
          uint64_t v18 = (unsigned __int16)(4096 - v17);
          goto LABEL_46;
        }
LABEL_17:
        void *v4 = 0;
        *(void *)(a3 + 24) = 0;
        goto LABEL_18;
      }
      if (v7 > v15 + (unsigned __int16)(4096 - v17)) {
        goto LABEL_17;
      }
      uint64_t v18 = (unsigned __int16)(4096 - v17);
      void *v4 = (char *)v8 + v15;
LABEL_46:
      *(void *)(a3 + 24) = v18;
LABEL_18:
      *(void *)(a3 + 8) = v8;
      *(void *)(a3 + 32) = 0;
      if ((v5 - 24577) >= 4)
      {
        if (v5 == 24592)
        {
          int v16 = 0;
        }
        else
        {
          if (v5 != 24588) {
            return result;
          }
          int v16 = *((unsigned __int8 *)result + 29);
        }
        if (a2)
        {
          uint64_t v19 = *(void *)(a2 + 40);
          if (v19)
          {
            unint64_t v20 = (void *)(v19 + 16);
            while (1)
            {
              unint64_t v20 = (void *)*v20;
              if (!v20) {
                break;
              }
              if (v20[2] == result[2])
              {
                uint64_t v21 = v20[4];
                *(void *)(a3 + 32) = v21;
                if (v21) {
                  BOOL v22 = v16 == 0;
                }
                else {
                  BOOL v22 = 1;
                }
                if (!v22)
                {
                  int v23 = *(__int16 *)(v21 + 2);
                  if (v23 < 0)
                  {
                    __int16 v24 = v23 & 0x7FFF;
                    *(_WORD *)(v21 + 2) = v24;
                    if (v16 == 4) {
                      *(_WORD *)(v21 + 2) = v24 | 1;
                    }
                  }
                }
                return result;
              }
            }
          }
        }
      }
      else if (a2)
      {
        uint64_t result = _os_procinfo_map_lookup(*(void **)(a2 + 40), result[2], *((_DWORD *)result + 6));
        *(void *)(a3 + 32) = result;
      }
      return result;
  }
}

void _tracev3_chunk_decompress_and_enumerate_chunks_helper(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  size_t v17 = 0;
  int v16 = 0;
  unint64_t v6 = _tracev3_chunk_decompress(a1, a2, (compression_algorithm *)&v16, &v17);
  if (v6)
  {
    unint64_t v7 = v17;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    unint64_t v12 = ___tracev3_chunk_decompress_and_enumerate_chunks_helper_block_invoke;
    unint64_t v13 = &unk_1E5A432F0;
    id v14 = v5;
    unint64_t v15 = v6;
    id v8 = v11;
    unint64_t v9 = 0;
    do
    {
      if (v7 - v9 < 0x10) {
        break;
      }
      unint64_t v10 = *(void *)&v6[v9 + 8];
      if (v7 - v9 - 16 < v10) {
        break;
      }
      if (!v12((uint64_t)v8)) {
        break;
      }
      unint64_t v9 = (v9 + v10 + 23) & 0xFFFFFFFFFFFFFFF8;
    }
    while (v9 - 1 < v7);
  }
  if (v16) {
    free(v6);
  }
}

uint64_t ___tracev3_chunk_decompress_and_enumerate_chunks_helper_block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1A622D720]();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v3;
}

BOOL purge_unused_uuids(void *a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v48 = v6;
  if (![v6 count])
  {
    id v30 = 0;
    BOOL v14 = 1;
    goto LABEL_45;
  }
  unint64_t v47 = v8;
  id v9 = v5;
  unint64_t v10 = opendir((const char *)[v9 UTF8String]);
  if (!v10)
  {
    uint64_t v39 = *__error();
    unint64_t v40 = (void *)[[NSString alloc] initWithFormat:@"Unable to logarchive %@: %s (%d)", v9, strerror(v39), v39];
    create_repack_error(-1, v40);
    id v30 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v14 = 0;
    id v8 = v47;
    if (!a3) {
      goto LABEL_45;
    }
    goto LABEL_43;
  }
  unint64_t v11 = v10;
  uint64_t v45 = a3;
  id v44 = v5;
  unint64_t v12 = "dsc";
  id v46 = v9;
  while (1)
  {
    unint64_t v13 = readdir(v11);
    BOOL v14 = v13 == 0;
    if (!v13) {
      break;
    }
    if (v13->d_type == 4)
    {
      d_name = v13->d_name;
      if (strcmp(v13->d_name, ".."))
      {
        if (!strcmp(d_name, v12) || strlen(d_name) == 2)
        {
          snprintf(__str, 0x400uLL, "%s/%s", (const char *)[v9 UTF8String], d_name);
          int v16 = opendir(__str);
          if (!v16)
          {
            uint64_t v41 = *__error();
            id v36 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Unable to open %s: %s (%d)", __str, strerror(v41), v41);
            create_repack_error(-1, v36);
            id v30 = (id)objc_claimAutoreleasedReturnValue();
            id v5 = v44;
            id v8 = v47;
            goto LABEL_42;
          }
          size_t v17 = v16;
          int v18 = 0;
          int v19 = 0;
          while (1)
          {
            unint64_t v20 = readdir(v17);
            if (!v20) {
              break;
            }
            uint64_t v21 = v20->d_name;
            if (strcmp(v20->d_name, "..") && *v21 != 46)
            {
              BOOL v22 = v12;
              int v23 = strcmp(d_name, v12);
              id v24 = objc_alloc(MEMORY[0x1E4F28E78]);
              if (v23) {
                uint64_t v25 = objc_msgSend(v24, "initWithFormat:", @"%s%s", d_name, v21);
              }
              else {
                uint64_t v25 = objc_msgSend(v24, "initWithFormat:", @"%s", v21, v43);
              }
              uint64_t v26 = v25;
              [v25 insertString:@"-" atIndex:8];
              [v26 insertString:@"-" atIndex:13];
              [v26 insertString:@"-" atIndex:18];
              [v26 insertString:@"-" atIndex:23];
              uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v26];
              if (([v48 containsObject:v27] & 1) == 0)
              {
                unint64_t v43 = v21;
                unint64_t v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s/%s", __str);
                [v7 addObject:v28];
                ++v19;
              }
              ++v18;

              unint64_t v12 = v22;
              id v9 = v46;
            }
          }
          if (v19 == v18)
          {
            id v29 = [NSString stringWithUTF8String:__str];
            [v47 addObject:v29];
          }
          closedir(v17);
        }
      }
    }
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v31 = v7;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v58 count:16];
  id v5 = v44;
  id v8 = v47;
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v54 != v34) {
          objc_enumerationMutation(v31);
        }
        unlink((const char *)[*(id *)(*((void *)&v53 + 1) + 8 * i) fileSystemRepresentation]);
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v33);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v36 = v47;
  id v30 = (id)[v36 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v30)
  {
    uint64_t v37 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v30; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v50 != v37) {
          objc_enumerationMutation(v36);
        }
        rmdir((const char *)[*(id *)(*((void *)&v49 + 1) + 8 * (void)j) fileSystemRepresentation]);
      }
      id v30 = (id)[v36 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v30);
  }
LABEL_42:

  closedir(v11);
  a3 = v45;
  if (v45)
  {
LABEL_43:
    if (!v14)
    {
      id v30 = v30;
      BOOL v14 = 0;
      *a3 = v30;
    }
  }
LABEL_45:

  return v14;
}

int *execute_repack(uint64_t a1, void *a2)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 40) || !*(void *)(a1 + 48) || !*(void *)(a1 + 56))
  {
    create_repack_error(64, @"Please provide a non NULL function for print_stats, print_warning, and print_verbose");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  print_verbose = *(uint64_t (**)(const char *, ...))(a1 + 56);
  if (!*(unsigned char *)(a1 + 24))
  {
    id v28 = *(id *)a1;
    id v29 = (void *)MEMORY[0x1E4F1CB10];
    id v30 = NSString;
    *(void *)__int16 v79 = v28;
    uint64_t v80 = @"Info.plist";
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
    uint64_t v32 = [v30 pathWithComponents:v31];
    uint64_t v33 = [v29 fileURLWithPath:v32 isDirectory:0];

    uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfURL:v33];
    id v35 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    if (v34)
    {
      id v36 = [v34 objectForKey:@"Repacked"];
      BOOL v37 = v36 == 0;

      if (v37)
      {
        uint64_t v39 = [v35 description];
        *(void *)&v81.st_dev = v39;
        __int16 v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
      }
      else
      {
        __int16 v38 = [v34 objectForKey:@"Repacked"];
        uint64_t v39 = [v35 description];
        [v38 addObject:v39];
      }

      [v34 setObject:v38 forKey:@"Repacked"];
      v78[0] = 0;
      [v34 writeToURL:v33 error:v78];
      id v41 = v78[0];
      if (!v41)
      {
        char v47 = 1;
        goto LABEL_47;
      }
      unsigned int v42 = v41;
      unint64_t v43 = NSString;
      id v44 = [v41 localizedDescription];
      uint64_t v45 = objc_msgSend(v43, "stringWithFormat:", @"Unable to finalize logarchive: %s", objc_msgSend(v44, "UTF8String"));

      unint64_t v40 = create_repack_error(74, v45);
    }
    else
    {
      unint64_t v40 = create_repack_error(74, @"Unable to open Info.plist");
    }
    if (v40)
    {
      id v46 = v40;

      char v47 = 0;
      goto LABEL_48;
    }
    char v47 = 0;
LABEL_47:
    id v46 = 0;
LABEL_48:

    id v19 = v46;
    if (v47)
    {
      uint64_t v20 = 0;
LABEL_15:

      return (int *)v20;
    }
LABEL_12:
    uint64_t v20 = 0xFFFFFFFFLL;
    if (a2)
    {
      if (v19)
      {
        id v19 = v19;
        *a2 = v19;
      }
    }
    goto LABEL_15;
  }
  long long v52 = objc_opt_new();
  long long v53 = objc_opt_new();
  uint64_t v71 = 0;
  size_t v72 = &v71;
  uint64_t v73 = 0x3032000000;
  uint64_t v74 = __Block_byref_object_copy__3091;
  size_t v75 = __Block_byref_object_dispose__3092;
  id v76 = *(id *)(a1 + 64);
  id v3 = +[OSLogEventProxy _make];
  [v3 _setIncludeSensitive:1];
  long long v54 = v3;
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x3032000000;
  uint64_t v68 = __Block_byref_object_copy__3091;
  uint64_t v69 = __Block_byref_object_dispose__3092;
  id v70 = 0;
  uint64_t v4 = [_OSLogPredicateMapper alloc];
  int v59 = [(_OSLogPredicateMapper *)v4 initWithPredicate:v72[5]];
  id v61 = *(id *)a1;
  __snprintf_chk(v79, 0x400uLL, 0, 0x400uLL, "%s/timesync", (const char *)[v61 fileSystemRepresentation]);
  uint64_t v5 = open(v79, 0);
  uint64_t v6 = v5;
  if (v5 == -1)
  {
    BOOL v22 = @"Unable to open timesync database inside archive";
    goto LABEL_19;
  }
  uint64_t v7 = _timesync_db_openat(v5, ".");
  if (!v7)
  {
    BOOL v22 = @"Unable to create timesync database structure";
LABEL_19:
    int v23 = create_repack_error(74, v22);
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    long long v55 = 0;
    long long v56 = 0;
    if (!v23) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  long long v51 = (int *)v7;
  [v3 _setTimesyncDatabase:v7];
  id v8 = v61;
  uint64_t v9 = open((const char *)[v8 fileSystemRepresentation], 0x100000);
  if (v9 == -1)
  {
    int v23 = create_repack_error(74, @"Unable to open archive for UUIDs");
    if (close(v6) == -1)
    {
      if (*__error() == 9)
      {
        uint64_t v48 = *__error();
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = v48;
        __break(1u);
        goto LABEL_51;
      }
      __error();
      _os_assumes_log();
    }
LABEL_31:
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    long long v55 = 0;
    long long v56 = 0;
    goto LABEL_33;
  }
  [v54 _setUUIDDBFileDescriptor:v9];
  id v10 = v8;
  unsigned int v60 = open((const char *)[v10 fileSystemRepresentation], 0x100000);
  if ((v60 & 0x80000000) == 0)
  {
    long long v55 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v60];
    long long v56 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v6];
    uint64_t v57 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v9];
    uint64_t v58 = [[_OSLogCollectionReference alloc] initWithDiagnosticsDirectory:v55 timesyncDirectory:v56 UUIDTextDirectory:v57];
    unint64_t v11 = [_OSLogCatalogFilter alloc];
    uint64_t v12 = [(_OSLogCatalogFilter *)v11 initWithPredicate:v72[5] collection:v58];
    unint64_t v13 = (void *)v66[5];
    v66[5] = v12;

    BOOL v14 = [(_OSLogPredicateMapper *)v59 mappedPredicate];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      uint64_t v16 = [(_OSLogPredicateMapper *)v59 mappedPredicate];
      size_t v17 = (void *)v72[5];
      v72[5] = v16;

      [(id)v72[5] allowEvaluation];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      void v64[2] = __compact_logarchive_block_invoke;
      v64[3] = &unk_1E5A43318;
      v64[7] = a1;
      v64[4] = v52;
      v64[8] = v54;
      v64[5] = v53;
      v64[6] = &v71;
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __compact_logarchive_block_invoke_2;
      v63[3] = &unk_1E5A43340;
      v63[4] = &v65;
      v10;
      id v18 = v54;
      v64;
      v63;
      uint64_t v77 = 0;
      operator new();
    }
    id v24 = NSString;
    uint64_t v25 = [(_OSLogPredicateMapper *)v59 validationErrors];
    uint64_t v26 = [v24 stringWithFormat:@"Unable to validate predicate: %@", v25];

    int v23 = create_repack_error(64, v26);

    [(_OSLogCollectionReference *)v58 close];
LABEL_33:
    [v54 _unmake];
    _timesync_db_close(v51);
    if (!v23)
    {
LABEL_35:

      _Block_object_dispose(&v65, 8);
      _Block_object_dispose(&v71, 8);

      id v19 = v23;
      goto LABEL_12;
    }
LABEL_34:
    id v27 = v23;
    goto LABEL_35;
  }
  if (close(v9) != -1) {
    goto LABEL_27;
  }
  if (*__error() == 9)
  {
LABEL_51:
    uint64_t v49 = *__error();
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E953C318 = v49;
    __break(1u);
    goto LABEL_52;
  }
  __error();
  _os_assumes_log();
LABEL_27:
  if (close(v6) != -1)
  {
LABEL_30:
    int v23 = create_repack_error(74, @"Unable to open logarchive");
    goto LABEL_31;
  }
  if (*__error() != 9)
  {
    __error();
    _os_assumes_log();
    goto LABEL_30;
  }
LABEL_52:
  uint64_t result = __error();
  uint64_t v50 = *result;
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = v50;
  __break(1u);
  return result;
}

void sub_1A117C4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy__3091(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3092(uint64_t a1)
{
}

uint64_t __compact_logarchive_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"nil";
  }
  if (([(__CFString *)v4 containsString:@"nonsparse"] & 1) != 0
    || ([(__CFString *)v4 containsString:@"timesync"] & 1) != 0)
  {
    uint64_t v5 = 1;
  }
  else
  {
    if (*(unsigned char *)(*(void *)(a1 + 56) + 26))
    {
      incr_val_for_key(*(void **)(a1 + 32), v4);
      incr_val_for_key(*(void **)(a1 + 32), @"total");
      [*(id *)(a1 + 40) addObject:v4];
    }
    id v6 = (id)[*(id *)(a1 + 64) composedMessage];
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) evaluateWithObject:*(void *)(a1 + 64)];
  }

  return v5;
}

uint64_t __compact_logarchive_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isKeptCatalog:a2];
}

int *_compact_tracev3(int a1, uint64_t a2, const char *a3, uint64_t *a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  BOOL v14 = [NSString stringWithUTF8String:a2];
  BOOL v15 = [NSString stringWithUTF8String:a3];
  unsigned int v42 = [v14 stringByAppendingPathComponent:v15];
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x3032000000;
  uint64_t v67 = __Block_byref_object_copy__3091;
  uint64_t v68 = __Block_byref_object_dispose__3092;
  id v69 = 0;
  uint64_t v39 = *a4;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 0;
  uint64_t v62 = 0;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  memset(v55, 0, sizeof(v55));
  size_t v54 = 0;
  uint64_t v16 = (char *)_os_trace_mmap_at();
  if (!v16)
  {
    BOOL v28 = _delete_trace_file(a1, a3, v54);
LABEL_41:

    _Block_object_dispose(v63, 8);
    _Block_object_dispose(&v64, 8);

    return (int *)v28;
  }
  int v40 = openat(a1, "tmp", 1538, 420);
  if (v40 != -1)
  {
    *(_OWORD *)((char *)v55 + 8) = xmmword_1A118ACC0;
    *((void *)&v61 + 1) = 0;
    LODWORD(v61) = v40;
    DWORD1(v58) = 0x10000;
    *((void *)&v57 + 1) = _os_trace_malloc();
    size_t v17 = _Block_copy(v12);
    id v18 = (void *)*((void *)&v58 + 1);
    *((void *)&v58 + 1) = v17;

    id v19 = _Block_copy(v13);
    uint64_t v20 = (void *)v59;
    *(void *)&long long v59 = v19;

    __int16 v38 = v15;
    id v21 = v12;
    *((void *)&v59 + 1) = *a4;
    uint64_t v62 = a5;
    size_t v22 = v54;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    char v47 = ___compact_tracev3_block_invoke;
    uint64_t v48 = &unk_1E5A43388;
    long long v52 = v16;
    id v49 = v42;
    uint64_t v50 = v63;
    long long v53 = v55;
    long long v51 = &v64;
    int v23 = v46;
    unint64_t v24 = 0;
    do
    {
      if (v22 - v24 < 0x10) {
        break;
      }
      unint64_t v25 = *(void *)&v16[v24 + 8];
      if (v22 - v24 - 16 < v25) {
        break;
      }
      if (!((unsigned int (*)(void *))v47)(v23)) {
        break;
      }
      unint64_t v24 = (v24 + v25 + 23) & 0xFFFFFFFFFFFFFFF8;
    }
    while (v24 - 1 < v22);

    BOOL v15 = v38;
    id v12 = v21;

    uint64_t v26 = (id *)(v65 + 5);
    if (v65[5]
      || (uint64_t v31 = *((void *)&v59 + 1), v32 = *((void *)&v55[1] + 1), *a4 = *((void *)&v59 + 1), v32)
      && (obuint64_t j = *v26, v33 = _repack_ttl_compact_close_catalog((uint64_t)v55, &obj), objc_storeStrong(v26, obj), !v33))
    {
      int v27 = 0;
      goto LABEL_14;
    }
    if ((uint64_t)(*((void *)&v61 + 1) + DWORD2(v56)) > 1)
    {
      if (v31 != v39)
      {
        print_verbose("Removed %lu tracepoints\n", v31 - v39);
        if (faccessat(a1, a3, 0, 0) == -1)
        {
          uint64_t v36 = create_repack_error(-1, @"Tmp file no longer accessible");
        }
        else
        {
          if (lseek(v40, 0, 2) >= 1)
          {
            uint64_t v34 = (void *)_os_trace_mmap();
            long long value = 0u;
            uint64_t v71 = 0;
            LODWORD(value) = 1;
            uint64_t v72 = -1;
            uint64_t v73 = 0;
            _OSLogGenerateXattrs((uint64_t)v34, 0, (uint64_t)&value);
            if (munmap(v34, 0) == -1)
            {
              __error();
              _os_assumes_log();
            }
            if (fsetxattr(v40, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0) == -1)
            {
              __error();
              _os_assumes_log();
            }
          }
          fsync(v40);
          if (renameat(a1, "tmp", a1, a3) != -1) {
            goto LABEL_31;
          }
          uint64_t v36 = create_repack_error(-1, @"Failed to rename tmp to trace file");
        }
        id v30 = (void *)v65[5];
        v65[5] = v36;
        int v27 = 1;
        goto LABEL_13;
      }
      print_verbose("No tracepoints removed. Keeping file as is\n");
    }
    else if (!_delete_trace_file(a1, a3, v54))
    {
      uint64_t v29 = create_repack_error(-1, @"Nothing kept, but error deleting trace file");
      goto LABEL_12;
    }
LABEL_31:
    int v27 = 0;
    BOOL v28 = 1;
    goto LABEL_32;
  }
  __error();
  _os_assumes_log();
  uint64_t v29 = create_repack_error(-1, @"Failed to create tmp file");
LABEL_12:
  int v27 = 0;
  id v30 = (void *)v65[5];
  v65[5] = v29;
LABEL_13:

LABEL_14:
  BOOL v28 = 0;
  if (a8) {
    *a8 = (id) v65[5];
  }
LABEL_32:
  if (v40 < 1 || close(v40) != -1) {
    goto LABEL_36;
  }
  if (*__error() != 9)
  {
    __error();
    _os_assumes_log();
LABEL_36:
    if (v27 && unlinkat(a1, "tmp", 0) == -1)
    {
      __error();
      _os_assumes_log();
    }
    _repack_context_cleanup((uint64_t)v55);
    if (munmap(v16, v54) == -1)
    {
      __error();
      _os_assumes_log();
    }
    goto LABEL_41;
  }
  uint64_t result = __error();
  uint64_t v37 = *result;
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = v37;
  __break(1u);
  return result;
}

void sub_1A117CCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,void *a47)
{
  _Block_object_dispose((const void *)(v47 - 224), 8);
  _Block_object_dispose((const void *)(v47 - 192), 8);
  _Unwind_Resume(a1);
}

BOOL _delete_trace_file(int a1, const char *a2, uint64_t a3)
{
  int v5 = unlinkat(a1, a2, 0);
  if (v5 == -1)
  {
    id v6 = (FILE *)*MEMORY[0x1E4F143C8];
    uint64_t v7 = __error();
    fprintf(v6, "Failed to unlink trace file %s: error: %d\n", a2, *v7);
  }
  else
  {
    print_verbose("Deleted trace file %s of size %lu\n", a2, a3);
  }
  return v5 != -1;
}

uint64_t ___compact_tracev3_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 - *(void *)(a1 + 56);
  int v5 = objc_msgSend(*(id *)(a1 + 32), "stringByAppendingFormat:", @"-%llu", v4);
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v6 = *(void **)(a1 + 64);
  v6[21] = v4;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v11 = *(void **)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  id v10 = v11;
  id v12 = v5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  BOOL v28 = __Block_byref_object_copy__3091;
  uint64_t v29 = __Block_byref_object_dispose__3092;
  id v30 = 0;
  int v13 = *(_DWORD *)a2;
  if (v7 == a2)
  {
    if (v13 == 4096 && *(void *)(a2 + 8) > 0x27uLL)
    {
      *id v6 = a2 + 144;
      _repack_compact_add_iov((uint64_t)v6, a2);
      v6[20] = a2;
      goto LABEL_17;
    }
    uint64_t v15 = create_repack_error(-1, @"Not a valid header");
    uint64_t v16 = (void *)v26[5];
    v26[5] = v15;
  }
  else if (v13 == 24589)
  {
    if (!v6[3] || !v6[5]) {
      goto LABEL_17;
    }
    if (!(*(unsigned int (**)(void))(v6[18] + 16))()) {
      goto LABEL_16;
    }
    uint64_t v18 = v6[5];
    obj[0] = (id)MEMORY[0x1E4F143A8];
    obj[1] = (id)3221225472;
    obj[2] = ___compact_chunk_block_invoke;
    obj[3] = &unk_1E5A433B0;
    unint64_t v24 = v6;
    id v22 = v12;
    int v23 = &v25;
    _tracev3_chunk_decompress_and_enumerate_chunks_helper(a2, v18, obj);
    uint64_t v19 = v26[5];

    if (!v19)
    {
LABEL_16:
      v6[5] = *(void *)v6[5];
      goto LABEL_17;
    }
  }
  else
  {
    if (v13 != 24587)
    {
LABEL_17:
      uint64_t v17 = 1;
      goto LABEL_18;
    }
    if (!v6[3]
      || (obj[0] = 0, int v14 = _repack_ttl_compact_close_catalog((uint64_t)v6, obj), objc_storeStrong(&v30, obj[0]), v14))
    {
      _repack_ttl_compact_open_catalog((uint64_t)v6, (_DWORD *)a2);
      _OSLogUUIDMapAddFromCatalog(v6[3], *(void *)(v6[24] + 16));
      goto LABEL_17;
    }
  }
  id v10 = (id) v26[5];
  uint64_t v17 = 0;
LABEL_18:
  _Block_object_dispose(&v25, 8);

  objc_storeStrong(v9, v10);
  return v17;
}

void sub_1A117D020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___compact_chunk_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v1 + 40);
  uint64_t v2 = _compact_chunkset();
  objc_storeStrong((id *)(v1 + 40), obj);
  return v2;
}

void incr_val_for_key(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  int v5 = [v4 objectForKey:v3];
  id v8 = v5;
  if (v5) {
    uint64_t v6 = [v5 intValue] + 1;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
  [v4 setObject:v7 forKeyedSubscript:v3];
}

void _progress(void *a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  int v5 = a1;
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + a3);
  uint64_t v6 = v5[3];

  if (v6)
  {
    [v7 fractionCompleted];
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t ctf_create(int *a1)
{
  uint64_t v2 = malloc_type_malloc(0x400uLL, 0xCFAB4140uLL);
  if (v2)
  {
    id v7 = v2;
    unint64_t v11 = ".SUNW_ctf";
    long long v12 = xmmword_1A118AD40;
    int v13 = &ctf_create_hdr;
    long long v14 = xmmword_1A118AD50;
    uint64_t v15 = 0;
    uint64_t v8 = ctf_bufopen((long long *)&v11, 0, 0, a1, v3, v4, v5, v6);
    uint64_t v9 = v8;
    if (v8)
    {
      *(_DWORD *)(v8 + 556) |= 4u;
      *(void *)(v8 + 576) = 128;
      bzero(v7, 0x400uLL);
      *(void *)(v9 + 568) = v7;
      *(void *)(v9 + 600) = 8;
      *(_OWORD *)(v9 + 608) = xmmword_1A118AD40;
    }
    else
    {
      free(v7);
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (a1) {
      *a1 = 35;
    }
  }
  return v9;
}

uint64_t ctf_update(void *a1)
{
  unsigned int v2 = *((_DWORD *)a1 + 139);
  if ((v2 & 4) == 0)
  {
    int v3 = 1039;
LABEL_3:
    *((_DWORD *)a1 + 140) = v3;
    return 0xFFFFFFFFLL;
  }
  if ((v2 & 8) != 0)
  {
    memset(__dst, 0, 512);
    uint64_t v5 = a1[74];
    if (v5)
    {
      unsigned int v6 = 0;
      do
      {
        int v7 = *(_DWORD *)(v5 + 44);
        int v8 = *(_DWORD *)(v5 + 48);
        if (v8 == (*(unsigned int (**)(void))(*a1 + 64))()) {
          int v9 = 20;
        }
        else {
          int v9 = 12;
        }
        v6 += v9;
        int v10 = v7 & 0x3FF;
        switch((unsigned __int16)v7 >> 11)
        {
          case 1:
          case 2:
          case 14:
            v6 += 4;
            break;
          case 4:
            v6 += 12;
            break;
          case 5:
            v6 += 4 * (v10 + (v7 & 1));
            break;
          case 6:
          case 7:
            unsigned int v11 = v6 + 16 * v10;
            unsigned int v12 = v6 + 12 * v10;
            if (*(_DWORD *)(v5 + 48) >> 13) {
              unsigned int v6 = v11;
            }
            else {
              unsigned int v6 = v12;
            }
            break;
          case 8:
            v6 += 8 * v10;
            break;
          default:
            break;
        }
        uint64_t v5 = *(void *)(v5 + 8);
      }
      while (v5);
    }
    else
    {
      unsigned int v6 = 0;
    }
    uint64_t v13 = *((unsigned int *)a1 + 150);
    long long v14 = (char *)mmap(0, v13 + v6 + 36, 3, 4098, -1, 0);
    if (v14 == (char *)-1)
    {
      int v3 = 35;
      goto LABEL_3;
    }
    uint64_t v15 = v14;
    uint64_t v69 = v13 + v6 + 36;
    uint64_t v16 = v6;
    int v70 = 0;
    *(_WORD *)long long v14 = -12303;
    void v14[2] = 4;
    v14[7] = 0;
    *(_DWORD *)(v14 + 3) = 0;
    *((_DWORD *)v14 + 2) = (v2 >> 1) & 1;
    *(void *)(v14 + 20) = 0;
    *(void *)(v14 + 12) = 0;
    *((_DWORD *)v14 + 7) = v6;
    *((_DWORD *)v14 + 8) = v13;
    uint64_t v17 = (int32x2_t *)(v14 + 36);
    uint64_t v18 = &v14[v16 + 36];
    *(void *)uint64_t v18 = 0x544E4552415000;
    uint64_t v19 = (int64x2_t *)a1[74];
    if (v19)
    {
      uint64_t v20 = v18 + 8;
      while (2)
      {
        id v21 = &v19[2].i32[2];
        __int32 v22 = v19[2].i32[3];
        int v23 = (const char *)v19[1].i64[1];
        if (v23)
        {
          *id v21 = v20 - v18;
          size_t v24 = strlen(v23) + 1;
          long long v14 = (char *)memmove(v20, v23, v24);
          v20 += v24;
        }
        else
        {
          *id v21 = 0;
        }
        __int32 v25 = v19[3].i32[0];
        if (v25 == (*(unsigned int (**)(char *))(*a1 + 64))(v14)) {
          size_t v26 = 20;
        }
        else {
          size_t v26 = 12;
        }
        long long v14 = (char *)memmove(v17, &v19[2].u64[1], v26);
        uint64_t v17 = (int32x2_t *)((char *)v17 + v26);
        switch((unsigned __int16)v22 >> 11)
        {
          case 1:
          case 2:
            int v27 = (v19[4].i32[1] << 16) | (v19[4].i32[0] << 24);
            __int32 v28 = v19[4].i32[2];
            goto LABEL_54;
          case 4:
            __int32 v36 = v19[5].i32[0];
            *uint64_t v17 = vmovn_s64(v19[4]);
            v17[1].i32[0] = v36;
            uint64_t v17 = (int32x2_t *)((char *)v17 + 12);
            goto LABEL_66;
          case 5:
            if ((v22 & 0x3FF) != 0)
            {
              uint64_t v37 = 0;
              do
              {
                v17->i32[0] = *(void *)(v19[4].i64[0] + v37);
                uint64_t v17 = (int32x2_t *)((char *)v17 + 4);
                v37 += 8;
              }
              while (8 * (v22 & 0x3FF) != v37);
            }
            if (v22)
            {
              v17->i32[0] = 0;
              uint64_t v17 = (int32x2_t *)((char *)v17 + 4);
            }
            goto LABEL_66;
          case 6:
          case 7:
            uint64_t v29 = (void *)v19[4].i64[1];
            if ((unsigned __int32)v19[3].i32[0] >> 13)
            {
              if (v29)
              {
                uint64_t v42 = (v20 - v18);
                do
                {
                  unint64_t v43 = (const char *)v29[2];
                  if (v43)
                  {
                    uint64_t v44 = v42 + strlen(v43) + 1;
                  }
                  else
                  {
                    uint64_t v44 = v42;
                    LODWORD(v42) = 0;
                  }
                  uint64_t v46 = v29[3];
                  uint64_t v45 = v29[4];
                  if (*((_DWORD *)a1 + 141) == 4) {
                    v17->i32[1] = v46;
                  }
                  else {
                    v17->i32[1] = (unsigned __int16)v46;
                  }
                  v17->i32[0] = v42;
                  v17[1].i32[0] = HIDWORD(v45);
                  v17[1].i32[1] = v45;
                  v17 += 2;
                  uint64_t v29 = (void *)v29[1];
                  uint64_t v42 = v44;
                }
                while (v29);
              }
            }
            else if (v29)
            {
              uint64_t v30 = (v20 - v18);
              do
              {
                uint64_t v31 = (const char *)v29[2];
                if (v31)
                {
                  uint64_t v32 = v30 + strlen(v31) + 1;
                }
                else
                {
                  uint64_t v32 = v30;
                  LODWORD(v30) = 0;
                }
                uint64_t v33 = v29[3];
                if (*((_DWORD *)a1 + 141) == 4)
                {
                  __int32 v34 = *((unsigned __int16 *)v29 + 16);
                  v17->i32[0] = v30;
                  v17->i32[1] = v33;
                  v17[1].i32[0] = v34;
                  uint64_t v35 = 12;
                }
                else
                {
                  *uint64_t v17 = (int32x2_t)(((unint64_t)(unsigned __int16)v29[3] << 32) | (v29[4] << 48) | v30);
                  uint64_t v35 = 8;
                }
                uint64_t v17 = (int32x2_t *)((char *)v17 + v35);
                uint64_t v29 = (void *)v29[1];
                uint64_t v30 = v32;
              }
              while (v29);
            }
            goto LABEL_64;
          case 8:
            uint64_t v38 = v19[4].i64[1];
            if (v38)
            {
              unsigned int v39 = v20 - v18;
              do
              {
                int v40 = strlen(*(const char **)(v38 + 16));
                uint64_t v41 = v39;
                v39 += v40 + 1;
                *v17++ = (int32x2_t)(v41 | ((unint64_t)*(unsigned int *)(v38 + 40) << 32));
                uint64_t v38 = *(void *)(v38 + 8);
              }
              while (v38);
LABEL_64:
              uint64_t v47 = v19[4].i64[1];
            }
            else
            {
              uint64_t v47 = 0;
            }
            long long v14 = ctf_copy_membnames(v47, v20);
            uint64_t v20 = v14;
LABEL_66:
            uint64_t v19 = (int64x2_t *)v19->i64[1];
            if (!v19) {
              break;
            }
            continue;
          case 14:
            int v27 = (v19[4].u8[4] << 24) | (v19[4].u8[0] << 16);
            __int32 v28 = v19[4].u16[1];
LABEL_54:
            v17->i32[0] = v27 | v28;
            uint64_t v17 = (int32x2_t *)((char *)v17 + 4);
            goto LABEL_66;
          default:
            goto LABEL_66;
        }
        break;
      }
    }
    mprotect(v15, v69, 1);
    uint64_t v71 = ".SUNW_ctf";
    long long v72 = xmmword_1A118AD40;
    uint64_t v73 = v15;
    uint64_t v74 = v69;
    long long v75 = xmmword_1A118AD40;
    uint64_t v52 = ctf_bufopen((long long *)&v71, 0, 0, &v70, v48, v49, v50, v51);
    if (!v52)
    {
      munmap(v15, v69);
      int v3 = v70;
      goto LABEL_3;
    }
    uint64_t v59 = v52;
    long long v60 = &_libctf_models;
    while (*((_DWORD *)v60 + 2) != *(_DWORD *)(a1[65] + 8))
    {
      long long v61 = v60[7];
      v60 += 7;
      if (!v61)
      {
        *(_DWORD *)(v52 + 560) = 22;
        goto LABEL_77;
      }
    }
    *(void *)(v52 + 520) = v60;
LABEL_77:
    ctf_import(v52, a1[66], v53, v54, v55, v56, v57, v58);
    *(_DWORD *)(v59 + 552) = *((_DWORD *)a1 + 138);
    *(_DWORD *)(v59 + 556) |= *((_DWORD *)a1 + 139) & 0xFFFFFFF7;
    *(void *)(v59 + 32) = 0;
    *(void *)(v59 + 568) = a1[71];
    *(void *)(v59 + 576) = a1[72];
    *(_OWORD *)(v59 + 584) = *(_OWORD *)(a1 + 73);
    *(_OWORD *)(v59 + 600) = *(_OWORD *)(a1 + 75);
    *(void *)(v59 + 616) = a1[76] - 1;
    *(void *)(v59 + 624) = a1[78];
    *(_OWORD *)(a1 + 71) = 0u;
    *(_OWORD *)(a1 + 73) = 0u;
    memcpy(__dst, a1, 0x278uLL);
    memmove(a1, (const void *)v59, 0x278uLL);
    memcpy((void *)v59, __dst, 0x278uLL);
    a1[40] = a1 + 22;
    a1[43] = a1 + 26;
    a1[46] = a1 + 30;
    a1[49] = a1 + 34;
    *(_DWORD *)(v59 + 552) = 1;
    ctf_close(v59, v62, v63, v64, v65, v66, v67, v68);
  }
  return 0;
}

char *ctf_copy_membnames(uint64_t a1, char *a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    do
    {
      uint64_t v4 = *(const void **)(v3 + 16);
      if (v4)
      {
        size_t v5 = strlen(*(const char **)(v3 + 16)) + 1;
        memmove(a2, v4, v5);
        a2 += v5;
      }
      uint64_t v3 = *(void *)(v3 + 8);
    }
    while (v3);
  }
  return a2;
}

void *ctf_dtd_insert(void *result, void *a2)
{
  uint64_t v2 = (result[72] - 1) & a2[4];
  uint64_t v3 = result[71];
  a2[2] = *(void *)(v3 + 8 * v2);
  *(void *)(v3 + 8 * v2) = a2;
  uint64_t v4 = result + 73;
  size_t v5 = (void *)result[73];
  result[73] = a2;
  *a2 = v5;
  a2[1] = 0;
  if (v5) {
    uint64_t v4 = v5;
  }
  v4[1] = a2;
  return result;
}

void ctf_dtd_delete(void *a1, unsigned int *a2)
{
  uint64_t v4 = (void *)(a1[71] + 8 * ((a1[72] - 1) & *((void *)a2 + 4)));
  do
  {
    size_t v5 = v4;
    unsigned int v6 = (unsigned int *)*v4;
    uint64_t v4 = (void *)(*v4 + 16);
    if (v6) {
      BOOL v7 = v6 == a2;
    }
    else {
      BOOL v7 = 1;
    }
  }
  while (!v7);
  if (v6) {
    void *v5 = *v4;
  }
  int v8 = (unsigned __int16)a2[11] >> 11;
  switch((unsigned __int16)a2[11] >> 11)
  {
    case 3:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      uint64_t v9 = a2[12];
      goto LABEL_11;
    case 4:
      ctf_ref_dec((uint64_t)a1, *((void *)a2 + 8));
      uint64_t v9 = *((void *)a2 + 9);
LABEL_11:
      ctf_ref_dec((uint64_t)a1, v9);
      break;
    case 5:
      ctf_ref_dec((uint64_t)a1, a2[12]);
      unsigned int v14 = a2[11];
      if ((v14 & 0x3FF) != 0)
      {
        unint64_t v15 = 0;
        do
        {
          uint64_t v16 = *(void *)(*((void *)a2 + 8) + 8 * v15);
          if (v16)
          {
            ctf_ref_dec((uint64_t)a1, v16);
            unsigned int v14 = a2[11];
          }
          ++v15;
        }
        while (v15 < (v14 & 0x3FF));
      }
      free(*((void **)a2 + 8));
      break;
    case 6:
    case 7:
    case 8:
      uint64_t v10 = *((void *)a2 + 9);
      if (v10)
      {
        do
        {
          unsigned int v11 = *(void **)(v10 + 16);
          if (v11)
          {
            size_t v12 = ~strlen(*(const char **)(v10 + 16));
            free(v11);
            a1[75] += v12;
          }
          if (v8 != 8) {
            ctf_ref_dec((uint64_t)a1, *(void *)(v10 + 24));
          }
          uint64_t v13 = *(void *)(v10 + 8);
          free((void *)v10);
          uint64_t v10 = v13;
        }
        while (v13);
      }
      break;
    default:
      break;
  }
  uint64_t v17 = (void *)*((void *)a2 + 3);
  if (v17)
  {
    size_t v18 = ~strlen(*((const char **)a2 + 3));
    free(v17);
    a1[75] += v18;
  }
  uint64_t v19 = a1 + 73;
  uint64_t v20 = *(void *)a2;
  if (*(void *)a2) {
    id v21 = *(void **)a2;
  }
  else {
    id v21 = a1 + 73;
  }
  v21[1] = *((void *)a2 + 1);
  if (*((void *)a2 + 1)) {
    uint64_t v19 = (void *)*((void *)a2 + 1);
  }
  *uint64_t v19 = v20;
  free(a2);
}

uint64_t ctf_ref_dec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 568);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 8 * ((*(void *)(result + 576) - 1) & a2));
    if (v3)
    {
      while (*(void *)(v3 + 32) != a2)
      {
        uint64_t v3 = *(void *)(v3 + 16);
        if (!v3) {
          return result;
        }
      }
      if ((*(unsigned char *)(result + 556) & 4) != 0) {
        --*(_DWORD *)(v3 + 60);
      }
    }
  }
  return result;
}

uint64_t ctf_dtd_lookup(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 568);
  if (!v2) {
    return 0;
  }
  for (uint64_t result = *(void *)(v2 + 8 * ((*(void *)(a1 + 576) - 1) & a2)); result; uint64_t result = *(void *)(result + 16))
  {
    if (*(void *)(result + 32) == a2) {
      break;
    }
  }
  return result;
}

uint64_t ctf_discard(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 556);
  if ((v2 & 4) != 0)
  {
    if ((v2 & 8) != 0)
    {
      uint64_t v4 = *(unsigned int **)(a1 + 584);
      if (v4)
      {
        do
        {
          size_t v5 = *(unsigned int **)v4;
          if (*(void *)(a1 + 616) < (unint64_t)(*(unsigned int (**)(uint64_t))(*(void *)a1 + 40))(*((void *)v4 + 4))) {
            ctf_dtd_delete((void *)a1, v4);
          }
          uint64_t v4 = v5;
        }
        while (v5);
        int v2 = *(_DWORD *)(a1 + 556);
      }
      uint64_t result = 0;
      *(void *)(a1 + 608) = *(void *)(a1 + 616) + 1;
      *(_DWORD *)(a1 + 556) = v2 & 0xFFFFFFF7;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 560) = 1039;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t ctf_add_integer(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  return ctf_add_encoded(a1, a2, a3, a4, 1);
}

uint64_t ctf_add_encoded(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, int a5)
{
  if (a4)
  {
    uint64_t v14 = 0;
    uint64_t result = ctf_add_generic(a1, a2, a3, &v14);
    if (result != -1)
    {
      unint64_t v9 = (-(-*(_DWORD *)(a4 + 8) & 0xFFFFFFF8) >> 3) - 1;
      unint64_t v10 = v9 | (v9 >> 1) | ((v9 | (v9 >> 1)) >> 2);
      unint64_t v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
      uint64_t v12 = v14;
      *(_DWORD *)(v14 + 44) = ((a2 != 0) << 10) | (a5 << 11);
      *(_DWORD *)(v12 + 48) = ((v11 >> 16) | v11) + 1;
      int v13 = *(_DWORD *)(a4 + 8);
      *(void *)(v12 + 64) = *(void *)a4;
      *(_DWORD *)(v12 + 72) = v13;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 560) = 22;
    return -1;
  }
  return result;
}

uint64_t ctf_add_generic(uint64_t a1, unsigned int a2, const char *a3, void *a4)
{
  if (a2 >= 2)
  {
    int v5 = 22;
LABEL_13:
    *(_DWORD *)(a1 + 560) = v5;
    return -1;
  }
  if ((*(unsigned char *)(a1 + 556) & 4) == 0)
  {
    int v5 = 1039;
    goto LABEL_13;
  }
  if ((*(uint64_t (**)(void, uint64_t))(*(void *)a1 + 48))(*(unsigned int *)(a1 + 608), 1) >= 0xFFFFFFFFLL)
  {
    int v5 = 1041;
    goto LABEL_13;
  }
  int v8 = malloc_type_malloc(0x58uLL, 0xCFAB4140uLL);
  if (!v8)
  {
LABEL_12:
    int v5 = 35;
    goto LABEL_13;
  }
  unint64_t v9 = v8;
  if (a3 && *a3)
  {
    unint64_t v10 = ctf_strdup(a3);
    if (!v10)
    {
      free(v9);
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  ++*(void *)(a1 + 608);
  uint64_t v11 = (*(uint64_t (**)(void))(*(void *)a1 + 48))();
  _OWORD *v9 = 0u;
  v9[1] = 0u;
  void v9[2] = 0u;
  void v9[3] = 0u;
  void v9[4] = 0u;
  *((void *)v9 + 10) = 0;
  *((void *)v9 + 3) = v10;
  *((void *)v9 + 4) = v11;
  if (v10) {
    *(void *)(a1 + 600) += strlen(v10) + 1;
  }
  uint64_t v13 = (*(void *)(a1 + 576) - 1) & v11;
  uint64_t v14 = *(void *)(a1 + 568);
  *((void *)v9 + 2) = *(void *)(v14 + 8 * v13);
  *(void *)(v14 + 8 * v13) = v9;
  uint64_t v15 = a1 + 584;
  uint64_t v16 = *(void *)(a1 + 584);
  *(void *)(a1 + 584) = v9;
  *(void *)unint64_t v9 = v16;
  *((void *)v9 + 1) = 0;
  if (v16) {
    uint64_t v15 = v16;
  }
  *(void *)(v15 + 8) = v9;
  *(_DWORD *)(a1 + 556) |= 8u;
  *a4 = v9;
  return v11;
}

uint64_t ctf_add_float(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  return ctf_add_encoded(a1, a2, a3, a4, 2);
}

uint64_t ctf_add_pointer(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 3);
}

uint64_t ctf_add_reftype(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  if (a3 == -1 || a3 >= 0xFFFFFFFFLL)
  {
    *(_DWORD *)(a1 + 560) = 22;
    return -1;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v8 = ctf_add_generic(a1, a2, 0, &v11);
    if (v8 != -1)
    {
      ctf_ref_inc(a1, a3);
      uint64_t v9 = v11;
      *(_DWORD *)(v11 + 44) = ((a2 != 0) << 10) | (a4 << 11);
      *(_DWORD *)(v9 + 48) = a3;
    }
  }
  return v8;
}

uint64_t ctf_ref_inc(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 568);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 8 * ((*(void *)(result + 576) - 1) & a2));
    if (v3)
    {
      while (*(void *)(v3 + 32) != a2)
      {
        uint64_t v3 = *(void *)(v3 + 16);
        if (!v3) {
          return result;
        }
      }
      if ((*(unsigned char *)(result + 556) & 4) != 0) {
        ++*(_DWORD *)(v3 + 60);
      }
    }
  }
  return result;
}

uint64_t ctf_add_array(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  if (!a3)
  {
    int v10 = 22;
LABEL_20:
    *(_DWORD *)(a1 + 560) = v10;
    return -1;
  }
  uint64_t v17 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v17, *a3))
  {
    uint64_t v11 = *(void *)(a1 + 568);
    if (!v11 || (uint64_t v12 = *(void *)(v11 + 8 * ((*(void *)(a1 + 576) - 1) & *a3))) == 0)
    {
LABEL_19:
      int v10 = 1020;
      goto LABEL_20;
    }
    while (*(void *)(v12 + 32) != *a3)
    {
      uint64_t v12 = *(void *)(v12 + 16);
      if (!v12) {
        goto LABEL_19;
      }
    }
  }
  uint64_t v17 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v17, a3[1]))
  {
    uint64_t v13 = *(void *)(a1 + 568);
    if (v13)
    {
      uint64_t v14 = a3[1];
      uint64_t v15 = *(void *)(v13 + 8 * ((*(void *)(a1 + 576) - 1) & v14));
      if (v15)
      {
        while (*(void *)(v15 + 32) != v14)
        {
          uint64_t v15 = *(void *)(v15 + 16);
          if (!v15) {
            goto LABEL_19;
          }
        }
        goto LABEL_4;
      }
    }
    goto LABEL_19;
  }
LABEL_4:
  uint64_t v18 = 0;
  uint64_t v6 = ctf_add_generic(a1, a2, 0, &v18);
  if (v6 != -1)
  {
    if (a2) {
      int v7 = 9216;
    }
    else {
      int v7 = 0x2000;
    }
    uint64_t v8 = v18;
    *(_DWORD *)(v18 + 44) = v7;
    *(_DWORD *)(v8 + 48) = 0;
    uint64_t v9 = a3[2];
    *(_OWORD *)(v8 + 64) = *(_OWORD *)a3;
    *(void *)(v8 + 80) = v9;
    ctf_ref_inc(a1, *a3);
    ctf_ref_inc(a1, a3[1]);
  }
  return v6;
}

uint64_t ctf_set_array(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *(void *)(a1 + 568);
  if (v5)
  {
    for (uint64_t i = *(void *)(v5 + 8 * ((*(void *)(a1 + 576) - 1) & a2)); i; uint64_t i = *(void *)(i + 16))
    {
      if (*(void *)(i + 32) == a2) {
        break;
      }
    }
  }
  else
  {
    uint64_t i = 0;
  }
  if ((*(unsigned char *)(a1 + 556) & 4) != 0)
  {
    if (!i || (*(_DWORD *)(i + 44) & 0xF800) != 0x2000) {
      goto LABEL_23;
    }
    uint64_t v15 = a1;
    if (!ctf_lookup_by_id((uint64_t)&v15, *a3))
    {
      uint64_t v10 = *(void *)(a1 + 568);
      if (!v10) {
        goto LABEL_23;
      }
      uint64_t v11 = *(void *)(v10 + 8 * ((*(void *)(a1 + 576) - 1) & *a3));
      if (!v11) {
        goto LABEL_23;
      }
      while (*(void *)(v11 + 32) != *a3)
      {
        uint64_t v11 = *(void *)(v11 + 16);
        if (!v11) {
          goto LABEL_23;
        }
      }
    }
    uint64_t v15 = a1;
    if (ctf_lookup_by_id((uint64_t)&v15, a3[1]))
    {
LABEL_13:
      ctf_ref_dec(a1, *(void *)(i + 64));
      ctf_ref_dec(a1, *(void *)(i + 72));
      *(_DWORD *)(a1 + 556) |= 8u;
      long long v8 = *(_OWORD *)a3;
      *(void *)(i + 80) = a3[2];
      *(_OWORD *)(i + 64) = v8;
      ctf_ref_inc(a1, *a3);
      ctf_ref_inc(a1, a3[1]);
      return 0;
    }
    uint64_t v12 = *(void *)(a1 + 568);
    if (v12)
    {
      uint64_t v13 = a3[1];
      uint64_t v14 = *(void *)(v12 + 8 * ((*(void *)(a1 + 576) - 1) & v13));
      if (v14)
      {
        while (*(void *)(v14 + 32) != v13)
        {
          uint64_t v14 = *(void *)(v14 + 16);
          if (!v14) {
            goto LABEL_23;
          }
        }
        goto LABEL_13;
      }
    }
LABEL_23:
    int v7 = 1020;
    goto LABEL_24;
  }
  int v7 = 1039;
LABEL_24:
  *(_DWORD *)(a1 + 560) = v7;
  return 0xFFFFFFFFLL;
}

uint64_t ctf_add_function(uint64_t a1, unsigned int a2, uint64_t a3, void *a4)
{
  if (!a3 || (unsigned int v6 = *(_DWORD *)(a3 + 12), v6 > 1) || (v9 = *(_DWORD *)(a3 + 8), !a4) && v9)
  {
    int v10 = 22;
LABEL_6:
    *(_DWORD *)(a1 + 560) = v10;
    return -1;
  }
  if (v6) {
    unsigned int v13 = v9 + 1;
  }
  else {
    unsigned int v13 = *(_DWORD *)(a3 + 8);
  }
  if (v13 >= 0x400)
  {
    int v10 = 84;
    goto LABEL_6;
  }
  uint64_t v26 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v26, *(void *)a3))
  {
    uint64_t v18 = *(void *)(a1 + 568);
    if (!v18 || (uint64_t v19 = *(void *)(v18 + 8 * ((*(void *)(a1 + 576) - 1) & *(void *)a3))) == 0)
    {
LABEL_28:
      int v10 = 1020;
      goto LABEL_6;
    }
    while (*(void *)(v19 + 32) != *(void *)a3)
    {
      uint64_t v19 = *(void *)(v19 + 16);
      if (!v19) {
        goto LABEL_28;
      }
    }
  }
  if (*(_DWORD *)(a3 + 8))
  {
    for (unint64_t i = 0; i < *(unsigned int *)(a3 + 8); ++i)
    {
      uint64_t v26 = a1;
      if (!ctf_lookup_by_id((uint64_t)&v26, a4[i]))
      {
        uint64_t v15 = *(void *)(a1 + 568);
        if (!v15) {
          goto LABEL_28;
        }
        uint64_t v16 = a4[i];
        uint64_t v17 = *(void *)(v15 + 8 * ((*(void *)(a1 + 576) - 1) & v16));
        if (!v17) {
          goto LABEL_28;
        }
        while (*(void *)(v17 + 32) != v16)
        {
          uint64_t v17 = *(void *)(v17 + 16);
          if (!v17) {
            goto LABEL_28;
          }
        }
      }
    }
  }
  if (v13)
  {
    uint64_t v20 = malloc_type_malloc(8 * v13, 0xCFAB4140uLL);
    if (!v20)
    {
      int v10 = 35;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v27 = 0;
  uint64_t v11 = ctf_add_generic(a1, a2, 0, &v27);
  if (v11 == -1)
  {
    free(v20);
  }
  else
  {
    if (a2) {
      int v21 = 11264;
    }
    else {
      int v21 = 10240;
    }
    uint64_t v22 = v27;
    *(_DWORD *)(v27 + 44) = v21 & 0xFFFFFC00 | v13 & 0x3FF;
    *(_DWORD *)(v22 + 48) = *(void *)a3;
    ctf_ref_inc(a1, *(void *)a3);
    if (*(_DWORD *)(a3 + 8))
    {
      unint64_t v23 = 0;
      do
      {
        ctf_ref_inc(a1, a4[v23++]);
        unint64_t v24 = *(unsigned int *)(a3 + 8);
      }
      while (v23 < v24);
      size_t v25 = 8 * v24;
    }
    else
    {
      size_t v25 = 0;
    }
    memmove(v20, a4, v25);
    if (*(unsigned char *)(a3 + 12)) {
      *((void *)v20 + v13 - 1) = 0;
    }
    *(void *)(v22 + 64) = v20;
  }
  return v11;
}

uint64_t ctf_add_struct(uint64_t a1, unsigned int a2, char *__s)
{
  if (__s
    && (size_t v6 = strlen(__s), (v7 = ctf_hash_lookup(a1 + 176, a1, __s, v6)) != 0)
    && (long long v8 = v7, ctf_type_kind(a1, v7[1]) == 9))
  {
    uint64_t result = v8[1];
    uint64_t v10 = *(void *)(a1 + 568) + 8 * ((*(_DWORD *)(a1 + 576) - 1) & result);
    do
    {
      uint64_t v11 = *(void *)v10;
      uint64_t v12 = *(void *)(*(void *)v10 + 32);
      uint64_t v10 = *(void *)v10 + 16;
    }
    while (v12 != result);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t result = ctf_add_generic(a1, a2, __s, &v14);
    if (result == -1) {
      return result;
    }
    uint64_t v11 = v14;
  }
  if (a2) {
    int v13 = 13312;
  }
  else {
    int v13 = 12288;
  }
  *(_DWORD *)(v11 + 44) = v13;
  *(_DWORD *)(v11 + 48) = 0;
  return result;
}

uint64_t ctf_add_union(uint64_t a1, unsigned int a2, char *__s)
{
  if (__s
    && (size_t v6 = strlen(__s), (v7 = ctf_hash_lookup(a1 + 208, a1, __s, v6)) != 0)
    && (long long v8 = v7, ctf_type_kind(a1, v7[1]) == 9))
  {
    uint64_t result = v8[1];
    uint64_t v10 = *(void *)(a1 + 568) + 8 * ((*(_DWORD *)(a1 + 576) - 1) & result);
    do
    {
      uint64_t v11 = *(void *)v10;
      uint64_t v12 = *(void *)(*(void *)v10 + 32);
      uint64_t v10 = *(void *)v10 + 16;
    }
    while (v12 != result);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t result = ctf_add_generic(a1, a2, __s, &v14);
    if (result == -1) {
      return result;
    }
    uint64_t v11 = v14;
  }
  if (a2) {
    int v13 = 15360;
  }
  else {
    int v13 = 14336;
  }
  *(_DWORD *)(v11 + 44) = v13;
  *(_DWORD *)(v11 + 48) = 0;
  return result;
}

uint64_t ctf_add_enum(uint64_t a1, unsigned int a2, char *a3)
{
  return ctf_add_enum_sized(a1, a2, a3, *(unsigned __int16 *)(*(void *)(a1 + 520) + 40));
}

uint64_t ctf_add_enum_sized(uint64_t a1, unsigned int a2, char *__s, int a4)
{
  if (__s
    && (v8 = strlen(__s), (int v9 = ctf_hash_lookup(a1 + 240, a1, __s, v8)) != 0)
    && (uint64_t v10 = v9, ctf_type_kind(a1, v9[1]) == 9))
  {
    uint64_t result = v10[1];
    uint64_t v12 = *(void *)(a1 + 568) + 8 * ((*(_DWORD *)(a1 + 576) - 1) & result);
    do
    {
      uint64_t v13 = *(void *)v12;
      uint64_t v14 = *(void *)(*(void *)v12 + 32);
      uint64_t v12 = *(void *)v12 + 16;
    }
    while (v14 != result);
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t result = ctf_add_generic(a1, a2, __s, &v16);
    if (result == -1) {
      return result;
    }
    uint64_t v13 = v16;
  }
  if (a2) {
    int v15 = 17408;
  }
  else {
    int v15 = 0x4000;
  }
  *(_DWORD *)(v13 + 44) = v15;
  *(_DWORD *)(v13 + 48) = a4;
  return result;
}

uint64_t ctf_add_forward(uint64_t a1, unsigned int a2, char *__s, int a4)
{
  unsigned int v6 = a2;
  uint64_t v7 = a1;
  switch(a4)
  {
    case 8:
      uint64_t v8 = a1 + 240;
      if (__s) {
        goto LABEL_7;
      }
      break;
    case 7:
      uint64_t v8 = a1 + 208;
      if (__s) {
        goto LABEL_7;
      }
      break;
    case 6:
      uint64_t v8 = a1 + 176;
      if (!__s) {
        break;
      }
LABEL_7:
      size_t v9 = strlen(__s);
      uint64_t v10 = ctf_hash_lookup(v8, v7, __s, v9);
      if (v10) {
        return v10[1];
      }
      uint64_t v15 = 0;
      a1 = v7;
      a2 = v6;
      uint64_t v12 = __s;
      goto LABEL_13;
    default:
      *(_DWORD *)(a1 + 560) = 1023;
      return -1;
  }
  uint64_t v15 = 0;
  uint64_t v12 = 0;
LABEL_13:
  uint64_t result = ctf_add_generic(a1, a2, v12, &v15);
  if (result != -1)
  {
    uint64_t v13 = v15;
    if (v6) {
      int v14 = 19456;
    }
    else {
      int v14 = 18432;
    }
    *(_DWORD *)(v15 + 44) = v14;
    *(_DWORD *)(v13 + 48) = a4;
  }
  return result;
}

uint64_t ctf_add_typedef(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  uint64_t v14 = a1;
  if (a4 == -1) {
    goto LABEL_12;
  }
  if (!ctf_lookup_by_id((uint64_t)&v14, a4))
  {
    uint64_t v11 = *(void *)(a1 + 568);
    if (v11)
    {
      uint64_t v12 = *(void *)(v11 + 8 * ((*(void *)(a1 + 576) - 1) & a4));
      if (v12)
      {
        while (*(void *)(v12 + 32) != a4)
        {
          uint64_t v12 = *(void *)(v12 + 16);
          if (!v12) {
            goto LABEL_12;
          }
        }
        goto LABEL_3;
      }
    }
LABEL_12:
    *(_DWORD *)(a1 + 560) = 22;
    return -1;
  }
LABEL_3:
  uint64_t v15 = 0;
  uint64_t v8 = ctf_add_generic(a1, a2, a3, &v15);
  if (v8 != -1)
  {
    uint64_t v9 = v15;
    if (a2) {
      int v10 = 21504;
    }
    else {
      int v10 = 20480;
    }
    *(_DWORD *)(v15 + 44) = v10;
    *(_DWORD *)(v9 + 48) = a4;
    ctf_ref_inc(a1, a4);
  }
  return v8;
}

uint64_t ctf_add_volatile(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 11);
}

uint64_t ctf_add_const(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 12);
}

uint64_t ctf_add_restrict(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 13);
}

uint64_t ctf_add_enumerator(uint64_t a1, uint64_t a2, char *__s2, int a4)
{
  uint64_t v7 = *(void *)(a1 + 568);
  if (!v7)
  {
    uint64_t i = 0;
    if (__s2) {
      goto LABEL_6;
    }
LABEL_9:
    int v9 = 22;
    goto LABEL_16;
  }
  for (uint64_t i = *(void *)(v7 + 8 * ((*(void *)(a1 + 576) - 1) & a2)); i; uint64_t i = *(void *)(i + 16))
  {
    if (*(void *)(i + 32) == a2) {
      break;
    }
  }
  if (!__s2) {
    goto LABEL_9;
  }
LABEL_6:
  if ((*(unsigned char *)(a1 + 556) & 4) == 0)
  {
    int v9 = 1039;
LABEL_16:
    *(_DWORD *)(a1 + 560) = v9;
    return 0xFFFFFFFFLL;
  }
  if (!i)
  {
    int v9 = 1020;
    goto LABEL_16;
  }
  int v10 = *(_DWORD *)(i + 44);
  if ((v10 & 0xF800) != 0x4000)
  {
    int v9 = 1022;
    goto LABEL_16;
  }
  if ((~v10 & 0x3FF) == 0)
  {
    int v9 = 1040;
    goto LABEL_16;
  }
  uint64_t v12 = *(void *)(i + 72);
  if (v12)
  {
    while (strcmp(*(const char **)(v12 + 16), __s2))
    {
      uint64_t v12 = *(void *)(v12 + 8);
      if (!v12) {
        goto LABEL_20;
      }
    }
    int v9 = 1042;
    goto LABEL_16;
  }
LABEL_20:
  uint64_t v13 = malloc_type_malloc(0x30uLL, 0xCFAB4140uLL);
  if (!v13)
  {
LABEL_27:
    int v9 = 35;
    goto LABEL_16;
  }
  uint64_t v14 = v13;
  uint64_t v15 = ctf_strdup(__s2);
  if (!v15)
  {
    free(v14);
    goto LABEL_27;
  }
  uint64_t v16 = i + 64;
  void v14[2] = v15;
  *(_OWORD *)(v14 + 3) = xmmword_1A118ACC0;
  *((_DWORD *)v14 + 10) = a4;
  *(_DWORD *)(i + 44) = v10 & 0x400 | (v10 + 1) & 0x3FF | 0x4000;
  uint64_t v17 = *(void *)(i + 64);
  *(void *)(i + 64) = v14;
  *uint64_t v14 = v17;
  v14[1] = 0;
  if (v17) {
    uint64_t v16 = v17;
  }
  *(void *)(v16 + 8) = v14;
  size_t v18 = strlen(v15);
  uint64_t result = 0;
  *(void *)(a1 + 600) += v18 + 1;
  *(_DWORD *)(a1 + 556) |= 8u;
  return result;
}

uint64_t ctf_add_member(uint64_t a1, uint64_t a2, char *__s2, uint64_t a4)
{
  uint64_t v5 = __s2;
  uint64_t v7 = *(void *)(a1 + 568);
  if (v7)
  {
    for (uint64_t i = *(void *)(v7 + 8 * ((*(void *)(a1 + 576) - 1) & a2)); i; uint64_t i = *(void *)(i + 16))
    {
      if (*(void *)(i + 32) == a2) {
        break;
      }
    }
  }
  else
  {
    uint64_t i = 0;
  }
  if ((*(unsigned char *)(a1 + 556) & 4) == 0)
  {
    int v9 = 1039;
LABEL_15:
    *(_DWORD *)(a1 + 560) = v9;
    return 0xFFFFFFFFLL;
  }
  if (!i)
  {
    int v9 = 1020;
    goto LABEL_15;
  }
  int v10 = *(_DWORD *)(i + 44);
  int v11 = (unsigned __int16)v10 >> 11;
  if ((v11 - 8) <= 0xFFFFFFFD)
  {
    int v9 = 1021;
    goto LABEL_15;
  }
  if ((*(_DWORD *)(i + 44) & 0x3FF) == 0x3FF)
  {
    int v9 = 1040;
    goto LABEL_15;
  }
  if (__s2)
  {
    uint64_t v13 = *(void *)(i + 72);
    if (v13)
    {
      while (1)
      {
        uint64_t v14 = *(const char **)(v13 + 16);
        if (v14)
        {
          if (!strcmp(v14, v5)) {
            break;
          }
        }
        uint64_t v13 = *(void *)(v13 + 8);
        if (!v13) {
          goto LABEL_22;
        }
      }
      int v9 = 1042;
      goto LABEL_15;
    }
  }
LABEL_22:
  uint64_t v15 = ctf_type_size(a1, a4);
  if (v15 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v16 = v15;
  unint64_t v17 = ctf_type_align(a1, a4);
  if (v17 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v18 = v17;
  uint64_t v19 = malloc_type_malloc(0x30uLL, 0xCFAB4140uLL);
  if (!v19)
  {
LABEL_29:
    int v9 = 35;
    goto LABEL_15;
  }
  uint64_t v20 = v19;
  if (v5)
  {
    if (*v5)
    {
      uint64_t v5 = ctf_strdup(v5);
      if (!v5)
      {
        free(v20);
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  void v20[2] = v5;
  v20[3] = a4;
  *((_DWORD *)v20 + 10) = -1;
  if ((v10 & 0x3FF) != 0 && v11 == 6)
  {
    uint64_t v37 = v5;
    uint64_t v21 = *(void *)(i + 64);
    uint64_t v22 = ctf_type_resolve(a1, *(void *)(v21 + 24));
    uint64_t v23 = *(void *)(v21 + 32);
    unsigned int v39 = 0;
    uint64_t v38 = 0;
    if (ctf_type_encoding((uint64_t (***)(uint64_t))a1, v22, (unsigned int *)&v38) == -1)
    {
      uint64_t v26 = ctf_type_size(a1, v22);
      uint64_t v24 = v23 + 8 * v26;
      if (v26 == -1) {
        uint64_t v24 = v23;
      }
    }
    else
    {
      uint64_t v24 = v23 + v39;
    }
    uint64_t v5 = v37;
    unint64_t v27 = v24 + 7;
    if (v18 <= 1) {
      unint64_t v28 = 1;
    }
    else {
      unint64_t v28 = v18;
    }
    unint64_t v29 = (v27 >> 3) % v28;
    unint64_t v30 = v28 - v29;
    if (v29) {
      unint64_t v31 = v30;
    }
    else {
      unint64_t v31 = 0;
    }
    unint64_t v32 = v31 + (v27 >> 3);
    v20[4] = 8 * v32;
    v16 += v32;
  }
  else
  {
    v20[4] = 0;
    ctt_unsigned int size = ctf_get_ctt_size((_DWORD *)a1, i + 40, 0, 0);
    if (ctt_size > v16) {
      uint64_t v16 = ctt_size;
    }
  }
  if (v16 <= (*(unsigned int (**)(void))(*(void *)a1 + 56))())
  {
    int v33 = v16;
  }
  else
  {
    int v33 = (*(uint64_t (**)(void))(*(void *)a1 + 64))();
    *(void *)(i + 52) = __ROR8__(v16, 32);
  }
  __int32 v36 = *(void **)(i + 64);
  uint64_t v35 = (void *)(i + 64);
  __int32 v34 = v36;
  *((_DWORD *)v35 - 5) = v10 & 0x400 | (v11 << 11) | (v10 + 1) & 0x3FF;
  *((_DWORD *)v35 - 4) = v33;
  *uint64_t v35 = v20;
  void *v20 = v36;
  v20[1] = 0;
  if (!v36) {
    __int32 v34 = v35;
  }
  v34[1] = v20;
  if (v5) {
    *(void *)(a1 + 600) += strlen(v5) + 1;
  }
  ctf_ref_inc(a1, a4);
  uint64_t result = 0;
  *(_DWORD *)(a1 + 556) |= 8u;
  return result;
}

uint64_t ctf_delete_type(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 568);
  if (v4)
  {
    for (uint64_t i = *(void *)(v4 + 8 * ((*(void *)(a1 + 576) - 1) & a2)); i; uint64_t i = *(void *)(i + 16))
    {
      if (*(void *)(i + 32) == a2) {
        break;
      }
    }
  }
  else
  {
    uint64_t i = 0;
  }
  if ((*(unsigned char *)(a1 + 556) & 4) == 0)
  {
    int v6 = 1039;
LABEL_20:
    *(_DWORD *)(a1 + 560) = v6;
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v10, a2))
  {
    uint64_t v7 = *(void *)(a1 + 568);
    if (!v7) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v8 = *(void *)(v7 + 8 * ((*(void *)(a1 + 576) - 1) & a2));
    if (!v8) {
      return 0xFFFFFFFFLL;
    }
    while (*(void *)(v8 + 32) != a2)
    {
      uint64_t v8 = *(void *)(v8 + 16);
      if (!v8) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  if (!i)
  {
    int v6 = 1045;
    goto LABEL_20;
  }
  if (*(_DWORD *)(i + 60) || *(_DWORD *)(a1 + 552) >= 2u)
  {
    int v6 = 1044;
    goto LABEL_20;
  }
  ctf_dtd_delete((void *)a1, (unsigned int *)i);
  uint64_t result = 0;
  *(_DWORD *)(a1 + 556) |= 8u;
  return result;
}

uint64_t ctf_add_type(uint64_t a1, uint64_t (***a2)(uint64_t), uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned __int16 v85 = a2;
  if (a2 != (uint64_t (***)(uint64_t))a1)
  {
    if ((*(unsigned char *)(a1 + 556) & 4) == 0)
    {
      int v5 = 1039;
LABEL_92:
      *(_DWORD *)(a1 + 560) = v5;
      return -1;
    }
    uint64_t v82 = 0;
    uint64_t v83 = 0;
    uint64_t v84 = 0;
    uint64_t v80 = 0;
    stat v81 = 0;
    uint64_t v79 = 0;
    uint64_t v77 = 0;
    int v78 = 0;
    uint64_t v75 = 0;
    unsigned int v76 = 0;
    int v73 = 0;
    __int16 v74 = 0;
    int v71 = 0;
    __int16 v72 = 0;
    uint64_t v68 = 0;
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    uint64_t v62 = 0;
    uint64_t v63 = 0;
    int v6 = (unsigned int *)ctf_lookup_by_id((uint64_t)&v85, a3);
    uint64_t v7 = v85;
    if (!v6)
    {
LABEL_91:
      int v5 = *((_DWORD *)v7 + 140);
      goto LABEL_92;
    }
    uint64_t v8 = v6;
    unint64_t v9 = *v6;
    uint64_t v10 = &v85[2 * (v9 >> 31)];
    int v11 = v10[53];
    if (v11)
    {
      unint64_t v12 = v9 & 0x7FFFFFFF;
      uint64_t v13 = (char *)v11 + v12;
      if ((unint64_t)v10[54] <= v12) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = v13;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    if (v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = "(?)";
    }
    if (*((int *)v85 + 141) > 3) {
      uint64_t v16 = v6[1];
    }
    else {
      uint64_t v16 = *((unsigned __int16 *)v6 + 2);
    }
    int v17 = (**v85)(v16);
    if (*((int *)v7 + 141) > 3) {
      uint64_t v18 = v8[1];
    }
    else {
      uint64_t v18 = *((unsigned __int16 *)v8 + 2);
    }
    unsigned int v19 = (*v7)[1](v18);
    if (*((int *)v7 + 141) > 3) {
      uint64_t v20 = v8[1];
    }
    else {
      uint64_t v20 = *((unsigned __int16 *)v8 + 2);
    }
    __int16 v21 = (*v7)[2](v20);
    __int16 v22 = v21;
    switch(v17)
    {
      case 8:
        uint64_t v23 = a1 + 240;
        break;
      case 7:
        uint64_t v23 = a1 + 208;
        break;
      case 6:
        uint64_t v23 = a1 + 176;
        break;
      default:
        uint64_t v23 = a1 + 272;
        break;
    }
    uint64_t v64 = 0;
    unsigned int v61 = v19;
    if (v19)
    {
      if (!*v15)
      {
        __int16 v25 = v21;
        int v24 = 0;
        goto LABEL_56;
      }
      size_t v26 = strlen(v15);
      unint64_t v27 = ctf_hash_lookup(v23, a1, v15, v26);
      if (v27)
      {
        uint64_t v28 = v27[1];
        int v29 = ctf_type_kind(a1, v28);
        if (v29 == v17)
        {
          __int16 v25 = v22;
          int v30 = 0;
          int v24 = v17;
          goto LABEL_57;
        }
        if (v29 != 9 || (v17 - 9) < 0xFFFFFFFD) {
          goto LABEL_132;
        }
        int v24 = 9;
        if (!*v15) {
          goto LABEL_31;
        }
      }
      else
      {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
      if (!*v15)
      {
LABEL_31:
        __int16 v25 = v22;
LABEL_56:
        uint64_t v28 = -1;
        int v30 = 1;
LABEL_57:
        uint64_t v82 = v7;
        uint64_t v83 = v3;
        uint64_t v84 = 0;
        uint64_t v79 = a1;
        uint64_t v80 = v28;
        stat v81 = 0;
        switch(v17)
        {
          case 1:
          case 2:
            if (ctf_type_encoding(v7, v3, (unsigned int *)&v77)) {
              goto LABEL_91;
            }
            if (v30)
            {
              if (ctf_add_intrinsic(a1, (uint64_t)v7, v3, v15) == -1) {
                return -1;
              }
              if (v17 == 1) {
                int v37 = 1;
              }
              else {
                int v37 = 2;
              }
              return ctf_add_encoded(a1, v61, v15, (uint64_t)&v77, v37);
            }
            if (ctf_type_encoding((uint64_t (***)(uint64_t))a1, v28, (unsigned int *)&v75)) {
              return -1;
            }
            if (v77 != v75 || v78 != (unint64_t)v76) {
              break;
            }
            return v28;
          case 3:
          case 11:
          case 12:
          case 13:
            uint64_t v34 = ctf_type_reference((uint64_t)v7, v3);
            uint64_t v35 = ctf_add_type(a1, v7, v34);
            if (v35 == -1) {
              return -1;
            }
            return ctf_add_reftype(a1, v61, v35, v17);
          case 4:
            if (ctf_array_info(v7, v3, (uint64_t)&v68) == -1) {
              goto LABEL_91;
            }
            uint64_t v39 = ctf_add_type(a1, v7, v68);
            uint64_t v68 = v39;
            uint64_t v40 = ctf_add_type(a1, v7, v69);
            uint64_t v69 = v40;
            uint64_t v3 = -1;
            if (v39 == -1 || v40 == -1) {
              return v3;
            }
            if (v30)
            {
              return ctf_add_array(a1, v61, &v68);
            }
            else
            {
              if (ctf_array_info((_DWORD *)a1, v28, (uint64_t)&v65)) {
                return v3;
              }
              if (v68 != v65 || v69 != v66 || v70 != v67)
              {
                *(_DWORD *)(a1 + 560) = 1043;
                return v3;
              }
            }
            return v28;
          case 5:
            if (*((int *)v7 + 141) > 3) {
              unsigned int v41 = v8[2];
            }
            else {
              unsigned int v41 = *((unsigned __int16 *)v8 + 3);
            }
            uint64_t v62 = ctf_add_type(a1, v7, v41);
            uint64_t v63 = 0;
            if (v62 == -1) {
              return -1;
            }
            return ctf_add_function(a1, v61, (uint64_t)&v62, 0);
          case 6:
          case 7:
            if (v28 != -1 && v24 != 9)
            {
              uint64_t v38 = ctf_type_size((uint64_t)v7, v3);
              if (v38 != ctf_type_size(a1, v28)
                || ctf_member_iter((int *)v7, v3, (uint64_t (*)(const char *, void, unint64_t, uint64_t))membcmp, (uint64_t)&v79))
              {
                break;
              }
              return v28;
            }
            uint64_t v45 = ctf_add_generic(a1, v61, v15, &v64);
            if (v45 != -1)
            {
              uint64_t v28 = v45;
              uint64_t v46 = v64;
              uint64_t v80 = v45;
              stat v81 = v64;
              int v47 = ctf_member_iter((int *)v7, v3, (uint64_t (*)(const char *, void, unint64_t, uint64_t))membadd, (uint64_t)&v79) != 0;
              uint64_t v48 = ctf_type_size((uint64_t)v7, v3);
              if (v48 <= (*(unsigned int (**)(void))(*(void *)a1 + 56))())
              {
                int v49 = v48;
              }
              else
              {
                int v49 = (*(uint64_t (**)(void))(*(void *)a1 + 64))();
                *(uint64_t *)((char *)v46 + 52) = __ROR8__(v48, 32);
              }
              *((_DWORD *)v46 + 11) = (v17 << 11) | ((v61 != 0) << 10) | v25 & 0x3FF;
              *((_DWORD *)v46 + 12) = v49;
              for (uint64_t i = v46[9]; i; uint64_t i = *(void *)(i + 8))
              {
                uint64_t v55 = ctf_add_type(a1, v7, *(void *)(i + 24));
                *(void *)(i + 24) = v55;
                if (v55 == -1) {
                  ++v47;
                }
              }
              if (!v47)
              {
                for (uint64_t j = v46[9]; j; uint64_t j = *(void *)(j + 8))
                  ctf_ref_inc(a1, *(void *)(j + 24));
                return v28;
              }
            }
            return -1;
          case 8:
            if (v28 == -1 || v24 == 9)
            {
              if (*((int *)v7 + 141) > 3) {
                unsigned int v50 = v8[2];
              }
              else {
                LOWORD(v50) = *((_WORD *)v8 + 3);
              }
              uint64_t v57 = ctf_add_enum_sized(a1, v61, v15, (unsigned __int16)v50);
              uint64_t v80 = v57;
              if (v57 == -1) {
                return -1;
              }
              uint64_t v28 = v57;
              if (ctf_enum_iter((uint64_t)v7, v3, (uint64_t (*)(char *, void, uint64_t))enumadd, (uint64_t)&v79))return -1; {
              return v28;
              }
            }
            if (!ctf_enum_iter((uint64_t)v7, v3, (uint64_t (*)(char *, void, uint64_t))enumcmp, (uint64_t)&v79)&& !ctf_enum_iter(a1, v28, (uint64_t (*)(char *, void, uint64_t))enumcmp, (uint64_t)&v82))
            {
              return v28;
            }
            break;
          case 9:
            if (!v30) {
              return v28;
            }
            return ctf_add_forward(a1, v61, v15, 6);
          case 10:
            uint64_t v42 = ctf_type_reference((uint64_t)v7, v3);
            uint64_t v43 = ctf_add_type(a1, v7, v42);
            if (v43 == -1) {
              return -1;
            }
            if (!v30) {
              return v28;
            }
            return ctf_add_typedef(a1, v61, v15, v43);
          case 14:
            if (ctf_type_ptrauth((unsigned int (***)(uint64_t))v7, v3, (uint64_t)&v73)) {
              goto LABEL_91;
            }
            if (v30) {
              goto LABEL_111;
            }
            if (ctf_type_ptrauth((unsigned int (***)(uint64_t))a1, v28, (uint64_t)&v71)) {
              return -1;
            }
            if (v73 != v71 || v74 != v72) {
              break;
            }
LABEL_111:
            uint64_t v52 = ctf_type_reference((uint64_t)v7, v3);
            uint64_t v53 = ctf_add_type(a1, v7, v52);
            if (v53 == -1) {
              return -1;
            }
            return ctf_add_ptrauth(a1, v61, v53, (uint64_t)&v73);
          default:
            int v5 = 1007;
            goto LABEL_92;
        }
LABEL_132:
        int v5 = 1043;
        goto LABEL_92;
      }
    }
    unint64_t v31 = *(uint64_t **)(a1 + 584);
    if (v31)
    {
      while (*(void *)(a1 + 616) < (unint64_t)(*(unsigned int (**)(uint64_t))(*(void *)a1 + 40))(v31[4]))
      {
        if ((unsigned __int16)*((_DWORD *)v31 + 11) >> 11 == v17)
        {
          unint64_t v32 = (const char *)v31[3];
          if (v32)
          {
            if (!strcmp(v32, v15))
            {
              if ((v17 - 1) > 1) {
                return v31[4];
              }
              if (!ctf_type_encoding(v85, v3, (unsigned int *)&v77)
                && v77 == v31[8]
                && v78 == (unint64_t)*((unsigned int *)v31 + 18))
              {
                return v31[4];
              }
            }
          }
        }
        unint64_t v31 = (uint64_t *)*v31;
        if (!v31) {
          break;
        }
      }
      __int16 v25 = v22;
      uint64_t v7 = v85;
    }
    else
    {
      __int16 v25 = v22;
    }
    uint64_t v64 = v31;
    goto LABEL_56;
  }
  return v3;
}

uint64_t ctf_add_intrinsic(uint64_t a1, uint64_t a2, uint64_t a3, char *__s)
{
  if (!__s) {
    return 0;
  }
  if (!*__s) {
    return 0;
  }
  uint64_t v8 = a2 + 272;
  size_t v9 = strlen(__s);
  uint64_t result = (uint64_t)ctf_hash_lookup(v8, a2, __s, v9);
  if (result)
  {
    uint64_t v11 = result;
    uint64_t result = 0;
    unsigned int v17 = 0;
    uint64_t v16 = 0;
    uint64_t v14 = 0;
    int v15 = 0;
    uint64_t v12 = *(unsigned int *)(v11 + 4);
    if (v12 != a3)
    {
      if (ctf_type_encoding((uint64_t (***)(uint64_t))a2, *(unsigned int *)(v11 + 4), (unsigned int *)&v16)|| ctf_type_encoding((uint64_t (***)(uint64_t))a2, a3, (unsigned int *)&v14))
      {
        *(_DWORD *)(a1 + 560) = *(_DWORD *)(a2 + 560);
        return -1;
      }
      if (v14 == v16 && v15 == (unint64_t)v17) {
        return 0;
      }
      uint64_t result = ctf_add_type(a1, a2, v12);
      if (result != -1) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t ctf_add_ptrauth(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (a3 < 0xFFFFFFFFLL)
  {
    uint64_t v13 = 0;
    uint64_t v5 = ctf_add_generic(a1, a2, 0, &v13);
    if (v5 != -1)
    {
      ctf_ref_inc(a1, a3);
      if (a2) {
        int v9 = 29696;
      }
      else {
        int v9 = 28672;
      }
      uint64_t v10 = v13;
      *(_DWORD *)(v13 + 44) = v9;
      *(_DWORD *)(v10 + 48) = a3;
      __int16 v11 = *(_WORD *)(a4 + 4);
      *(_DWORD *)(v10 + 64) = *(_DWORD *)a4;
      *(_WORD *)(v10 + 68) = v11;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 560) = 22;
    return -1;
  }
  return v5;
}

BOOL enumadd(char *__s2, int a2, uint64_t *a3)
{
  return ctf_add_enumerator(*a3, a3[1], __s2, a2) == -1;
}

BOOL enumcmp(const char *a1, int a2, uint64_t *a3)
{
  int v6 = 0;
  return ctf_enum_value(*a3, a3[1], a1, &v6) == -1 || v6 != a2;
}

uint64_t membadd(const char *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = malloc_type_malloc(0x30uLL, 0xCFAB4140uLL);
  if (!v8) {
    goto LABEL_6;
  }
  int v9 = v8;
  if (a1 && *a1)
  {
    uint64_t v10 = ctf_strdup(a1);
    if (!v10)
    {
      free(v9);
LABEL_6:
      *(_DWORD *)(*a4 + 560) = 35;
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  void v9[2] = v10;
  void v9[3] = a2;
  void v9[4] = a3;
  *((_DWORD *)v9 + 10) = -1;
  uint64_t v12 = a4[2];
  int v15 = *(void **)(v12 + 64);
  uint64_t v13 = (void *)(v12 + 64);
  uint64_t v14 = v15;
  *uint64_t v13 = v9;
  void *v9 = v15;
  v9[1] = 0;
  if (v15) {
    uint64_t v13 = v14;
  }
  v13[1] = v9;
  uint64_t v16 = *a4;
  if (v10) {
    *(void *)(v16 + 600) += strlen(v10) + 1;
  }
  uint64_t result = 0;
  *(_DWORD *)(v16 + 556) |= 8u;
  return result;
}

BOOL membcmp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = a1;
  v5[1] = a3;
  return ctf_member_iter(*(int **)a4, *(void *)(a4 + 8), (uint64_t (*)(const char *, void, unint64_t, uint64_t))membmatch, (uint64_t)v5) != 1;
}

BOOL membmatch(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return !strcmp(a1, *(const char **)a4) && *(void *)(a4 + 8) == a3;
}

double ctf_decl_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 64) = -1;
  *(void *)(a1 + 72) = -1;
  *(void *)(a1 + 88) = a2;
  *(void *)(a1 + 96) = a2;
  *(void *)(a1 + 104) = a2 + a3;
  return result;
}

void *ctf_decl_fini(uint64_t a1)
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    double result = *(void **)(a1 + 16 * i + 8);
    if (result)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        free(result);
        double result = v4;
      }
      while (v4);
    }
  }
  return result;
}

uint64_t ctf_decl_push(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  while (2)
  {
    uint64_t v3 = a3;
    uint64_t v4 = a1;
    int v33 = a2;
    uint64_t result = ctf_lookup_by_id((uint64_t)&v33, a3);
    int v6 = v33;
    if (!result)
    {
      int v9 = v33[140];
LABEL_50:
      v4[30] = v9;
      return result;
    }
    uint64_t v7 = (unsigned int *)result;
    if ((int)v33[141] > 3) {
      uint64_t v8 = *(unsigned int *)(result + 4);
    }
    else {
      uint64_t v8 = *(unsigned __int16 *)(result + 4);
    }
    int v10 = (**(uint64_t (***)(uint64_t))v33)(v8);
    unsigned int v11 = 0;
    int v12 = 1;
    int v13 = 0;
    switch(v10)
    {
      case 3:
        if ((int)v6[141] > 3) {
          unsigned int v15 = v7[2];
        }
        else {
          unsigned int v15 = *((unsigned __int16 *)v7 + 3);
        }
        ctf_decl_push(v4, v6, v15);
        int v13 = 0;
        unsigned int v11 = 1;
        goto LABEL_33;
      case 4:
        v31[0] = 0;
        v31[1] = 0;
        uint64_t v32 = 0;
        ctf_array_info(v6, v3, (uint64_t)v31);
        ctf_decl_push(v4, v6, v31[0]);
        int v13 = 0;
        unsigned int v11 = 2;
        int v12 = v32;
        goto LABEL_33;
      case 5:
        if ((int)v6[141] > 3) {
          unsigned int v16 = v7[2];
        }
        else {
          unsigned int v16 = *((unsigned __int16 *)v7 + 3);
        }
        ctf_decl_push(v4, v6, v16);
        int v13 = 0;
        unsigned int v11 = 3;
        goto LABEL_33;
      case 10:
        unint64_t v17 = *v7;
        uint64_t v18 = &v6[4 * (v17 >> 31)];
        uint64_t v19 = *((void *)v18 + 53);
        if (v19)
        {
          unint64_t v20 = v17 & 0x7FFFFFFF;
          __int16 v21 = (const char *)(v19 + v20);
          if (*((void *)v18 + 54) <= v20) {
            __int16 v22 = 0;
          }
          else {
            __int16 v22 = v21;
          }
        }
        else
        {
          __int16 v22 = 0;
        }
        if (!v22) {
          __int16 v22 = "(?)";
        }
        if (!*v22)
        {
          if ((int)v6[141] > 3) {
            unsigned int v30 = v7[2];
          }
          else {
            unsigned int v30 = *((unsigned __int16 *)v7 + 3);
          }
          a3 = v30;
          a1 = v4;
          a2 = v6;
          continue;
        }
        unsigned int v11 = 0;
        int v13 = 0;
LABEL_33:
        uint64_t result = (uint64_t)malloc_type_malloc(0x20uLL, 0xCFAB4140uLL);
        if (!result)
        {
          int v9 = 35;
          goto LABEL_50;
        }
        *(void *)(result + 16) = v3;
        *(_DWORD *)(result + 24) = v10;
        *(_DWORD *)(result + 28) = v12;
        int v24 = (uint64_t *)&v4[4 * v11];
        __int16 v25 = (uint64_t *)v24[1];
        if (!v25)
        {
          int v26 = v4[21];
          v4[21] = v26 + 1;
          v4[v11 + 16] = v26;
        }
        if (v11 <= 1 && v11 > v4[20]) {
          v4[20] = v11;
        }
        if (v11) {
          int v27 = 0;
        }
        else {
          int v27 = v13;
        }
        if (v10 != 4 && v27 == 0)
        {
          int v29 = (uint64_t *)*v24;
          *int v24 = result;
          *(void *)uint64_t result = v29;
          *(void *)(result + 8) = 0;
          if (v29) {
            int v24 = v29;
          }
          v24[1] = result;
        }
        else
        {
          v24[1] = result;
          *(void *)uint64_t result = 0;
          *(void *)(result + 8) = v25;
          if (v25) {
            int v24 = v25;
          }
          *int v24 = result;
        }
        return result;
      case 11:
      case 12:
      case 13:
        if ((int)v6[141] > 3) {
          unsigned int v14 = v7[2];
        }
        else {
          unsigned int v14 = *((unsigned __int16 *)v7 + 3);
        }
        ctf_decl_push(v4, v6, v14);
        unsigned int v11 = v4[20];
        int v13 = 1;
        goto LABEL_33;
      case 14:
        if ((int)v6[141] > 3) {
          unsigned int v23 = v7[2];
        }
        else {
          unsigned int v23 = *((unsigned __int16 *)v7 + 3);
        }
        ctf_decl_push(v4, v6, v23);
        int v13 = 0;
        unsigned int v11 = v4[20];
        goto LABEL_33;
      default:
        goto LABEL_33;
    }
  }
}

uint64_t ctf_decl_sprintf(void *a1, char *__format, ...)
{
  va_start(va, __format);
  uint64_t v3 = a1[13];
  uint64_t v4 = (char *)a1[12];
  unint64_t v5 = v3 - (void)v4;
  uint64_t result = vsnprintf(v4, v3 - (void)v4, __format, va);
  unint64_t v7 = (int)result;
  if (v5 < (int)result) {
    unint64_t v7 = v5;
  }
  a1[12] += v7;
  a1[14] += (int)result;
  return result;
}

char *ctf_errmsg(int a1)
{
  if ((a1 - 1000) > 0x2E) {
    uint64_t result = strerror(a1);
  }
  else {
    uint64_t result = _ctf_errlist[a1 - 1000];
  }
  if (!result) {
    return "Unknown error";
  }
  return result;
}

uint64_t ctf_errno(uint64_t a1)
{
  return *(unsigned int *)(a1 + 560);
}

uint64_t ctf_hash_create(uint64_t a1, unint64_t a2)
{
  if (HIDWORD(a2)) {
    return 84;
  }
  if (a2)
  {
    *(_DWORD *)(a1 + 16) = 211;
    *(_DWORD *)(a1 + 20) = a2 + 1;
    *(_DWORD *)(a1 + 24) = 1;
    *(void *)a1 = malloc_type_malloc(0x34CuLL, 0xCFAB4140uLL);
    uint64_t v4 = malloc_type_malloc(12 * *(unsigned int *)(a1 + 20), 0xCFAB4140uLL);
    *(void *)(a1 + 8) = v4;
    if (*(void *)a1 && v4)
    {
      bzero(*(void **)a1, 4 * *(unsigned int *)(a1 + 16));
      bzero(*(void **)(a1 + 8), 12 * *(unsigned int *)(a1 + 20));
      return 0;
    }
    else
    {
      ctf_hash_destroy(a1);
      return 35;
    }
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0;
    *(void *)a1 = &_CTF_EMPTY;
    *(void *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 16) = 1;
  }
  return result;
}

void ctf_hash_destroy(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2 && *(_DWORD *)(a1 + 16) != 1)
  {
    free(v2);
    *(void *)a1 = 0;
  }
  uint64_t v3 = *(void **)(a1 + 8);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t ctf_hash_size(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  BOOL v2 = v1 != 0;
  unsigned int v3 = v1 - 1;
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t ctf_hash_insert(uint64_t *a1, uint64_t a2, int a3, unsigned int a4)
{
  if (!a3) {
    return 22;
  }
  unsigned int v5 = *((_DWORD *)a1 + 6);
  if (v5 >= *((_DWORD *)a1 + 5)) {
    return 84;
  }
  uint64_t v6 = a4 >> 31;
  uint64_t v7 = *(void *)(a2 + 16 * v6 + 424);
  if (!v7) {
    return 1018;
  }
  unint64_t v8 = a4 & 0x7FFFFFFF;
  if (*(void *)(a2 + 16 * v6 + 432) <= v8) {
    return 1019;
  }
  int v9 = (const char *)(v7 + v8);
  if (!*(unsigned char *)(v7 + v8)) {
    return 0;
  }
  uint64_t v10 = a1[1];
  *(_DWORD *)(v10 + 12 * v5) = a4;
  *(_DWORD *)(v10 + 12 * v5 + 4) = a3;
  int64_t v11 = strlen(v9);
  if (v11 < 1)
  {
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v12 = 0;
    int v13 = &v9[v11];
    do
    {
      uint64_t v14 = *v9++;
      unint64_t v12 = v14 + 16 * v12;
      if ((v12 & 0xF0000000) != 0) {
        unint64_t v12 = v12 & 0xFFFFFFFF0FFFFFFFLL ^ ((unint64_t)(v12 & 0xF0000000) >> 24);
      }
    }
    while (v9 < v13);
  }
  uint64_t result = 0;
  unint64_t v16 = v12 % *((unsigned int *)a1 + 4);
  uint64_t v17 = *a1;
  *(_DWORD *)(v10 + 12 * v5 + 8) = *(_DWORD *)(*a1 + 4 * v16);
  *((_DWORD *)a1 + 6) = v5 + 1;
  *(_DWORD *)(v17 + 4 * v16) = v5;
  return result;
}

uint64_t ctf_hash_define(uint64_t *a1, uint64_t a2, int a3, unsigned int a4)
{
  uint64_t v8 = a4 >> 31;
  uint64_t v9 = *(void *)(a2 + 16 * v8 + 424);
  if (v9)
  {
    unint64_t v10 = a4 & 0x7FFFFFFF;
    int64_t v11 = (char *)(v9 + v10);
    if (*(void *)(a2 + 16 * v8 + 432) <= v10) {
      unint64_t v12 = 0;
    }
    else {
      unint64_t v12 = v11;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (v12) {
    int v13 = v12;
  }
  else {
    int v13 = "(?)";
  }
  size_t v14 = strlen(v13);
  unsigned int v15 = ctf_hash_lookup((uint64_t)a1, a2, v13, v14);
  if (v15)
  {
    v15[1] = a3;
    return 0;
  }
  else
  {
    return ctf_hash_insert(a1, a2, a3, a4);
  }
}

_DWORD *ctf_hash_lookup(uint64_t a1, uint64_t a2, char *__s1, int64_t __n)
{
  if (__n < 1)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = 0;
    uint64_t v8 = __s1;
    do
    {
      uint64_t v9 = *v8++;
      unint64_t v7 = v9 + 16 * v7;
      if ((v7 & 0xF0000000) != 0) {
        unint64_t v7 = v7 & 0xFFFFFFFF0FFFFFFFLL ^ ((unint64_t)(v7 & 0xF0000000) >> 24);
      }
    }
    while (v8 < &__s1[__n]);
  }
  uint64_t v10 = *(unsigned int *)(*(void *)a1 + 4 * (v7 % *(unsigned int *)(a1 + 16)));
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *(void *)(a1 + 8);
  while (1)
  {
    unint64_t v12 = (_DWORD *)(v11 + 12 * v10);
    int v13 = (const char *)(*(void *)(a2 + (((unint64_t)*v12 >> 27) & 0x10) + 424)
                       + (*v12 & 0x7FFFFFFF));
    if (!strncmp(__s1, v13, __n) && !v13[__n]) {
      break;
    }
    uint64_t v10 = *(unsigned int *)(v11 + 12 * v10 + 8);
    if (!v10) {
      return 0;
    }
  }
  return v12;
}

uint64_t ctf_zopen(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ctf_dprintf("decompressing CTF data using %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"/usr/lib/libz.dylib");
  uint64_t result = qword_1E953C518;
  if (!qword_1E953C518)
  {
    uint64_t v10 = dlopen("/usr/lib/libz.dylib", 5);
    qword_1E953C518 = (uint64_t)v10;
    if (v10)
    {
      zlib = (uint64_t (*)(void))dlsym(v10, "uncompress");
      uint64_t v11 = (uint64_t (*)(void))dlsym((void *)qword_1E953C518, "zError");
      off_1E953C510 = v11;
      uint64_t result = qword_1E953C518;
      if (zlib && v11) {
        return result;
      }
      dlclose((void *)qword_1E953C518);
      off_1E953C510 = 0;
      qword_1E953C518 = 0;
      zlib = 0;
    }
    uint64_t result = 0;
    if (a1) {
      *a1 = 1015;
    }
  }
  return result;
}

uint64_t z_uncompress()
{
  return zlib();
}

uint64_t z_strerror()
{
  return off_1E953C510();
}

char *ctf_sect_mmap(void *a1, int a2)
{
  uint64_t v4 = a1[6];
  int v5 = getpagesize();
  uint64_t v6 = v4 & (v5 - 1);
  uint64_t result = (char *)mmap(0, v6 + a1[4], 1, 2, a2, v4 & -v5);
  if (result != (char *)-1) {
    a1[3] = &result[v6];
  }
  return result;
}

uint64_t ctf_sect_munmap(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 24);
  unint64_t v3 = (getpagesize() - 1) & v2;
  size_t v4 = v3 + *(void *)(a1 + 32);
  return munmap((void *)(v2 - v3), v4);
}

uint64_t ctf_fdopen(int a1, int *a2)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  memset(&v69, 0, sizeof(v69));
  memset(v78, 0, sizeof(v78));
  memset(v79, 0, 24);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v77 = 0;
  uint64_t v73 = 0;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v70 = 0u;
  memset(__buf, 0, sizeof(__buf));
  long long v81 = 0u;
  if (fstat(a1, &v69) == -1) {
    goto LABEL_66;
  }
  unint64_t v4 = pread(a1, __buf, 0x40uLL, 0);
  if ((uint64_t)v4 <= 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      int v6 = *__error();
      if (!a2) {
        return 0;
      }
    }
    else
    {
      int v6 = 1000;
      if (!a2) {
        return 0;
      }
    }
    uint64_t v5 = 0;
    goto LABEL_68;
  }
  if (v4 >= 4 && LOWORD(__buf[0]) == 53233)
  {
    if (BYTE2(__buf[0]) >= 5u)
    {
      if (a2)
      {
        uint64_t v5 = 0;
        int v6 = 1002;
LABEL_68:
        *a2 = v6;
        return v5;
      }
      return 0;
    }
    *((void *)&v78[1] + 1) = mmap(0, v69.st_size, 1, 2, a1, 0);
    if (*((void *)&v78[1] + 1) != -1)
    {
      *(long long *)((char *)v78 + 8) = xmmword_1A118AD30;
      *(void *)&v78[0] = ".SUNW_ctf";
      *(void *)&v79[0] = v69.st_size;
      *(_OWORD *)((char *)v79 + 8) = xmmword_1A118AD40;
      uint64_t v5 = ctf_bufopen(v78, 0, 0, a2, v7, v8, v9, v10);
      if (!v5)
      {
        unint64_t v11 = *((void *)&v78[1] + 1);
        unint64_t v12 = (getpagesize() - 1) & v11;
        int v13 = (char *)(v11 - v12);
        size_t v14 = v12 + *(void *)&v79[0];
        goto LABEL_18;
      }
      return v5;
    }
LABEL_66:
    uint64_t v62 = __error();
    if (a2)
    {
      uint64_t v5 = 0;
      int v6 = *v62;
      goto LABEL_68;
    }
    return 0;
  }
  if (v4 < 0x34 || LODWORD(__buf[0]) != 1179403647)
  {
LABEL_13:
    if (a2)
    {
      uint64_t v5 = 0;
      int v6 = 1000;
      goto LABEL_68;
    }
    return 0;
  }
  if (BYTE5(__buf[0]) != 1)
  {
    if (a2)
    {
      uint64_t v5 = 0;
      int v6 = 1003;
      goto LABEL_68;
    }
    return 0;
  }
  if (DWORD1(__buf[1]) != 1)
  {
    if (a2)
    {
      uint64_t v5 = 0;
      int v6 = 1001;
      goto LABEL_68;
    }
    return 0;
  }
  if (BYTE4(__buf[0]) == 2)
  {
    if (v4 < 0x40) {
      goto LABEL_13;
    }
    unsigned int v15 = HIWORD(v81);
    LODWORD(v16) = WORD6(v81);
  }
  else
  {
    uint64_t v17 = LODWORD(__buf[2]);
    int v18 = DWORD1(__buf[2]);
    uint64_t v19 = *((void *)&__buf[2] + 1);
    LODWORD(v16) = (unsigned __int16)v81;
    unsigned int v15 = WORD1(v81);
    DWORD1(__buf[1]) = 1;
    *(void *)&long long v20 = DWORD2(__buf[1]);
    *((void *)&v20 + 1) = HIDWORD(__buf[1]);
    *(_OWORD *)((char *)&__buf[1] + 8) = v20;
    *((void *)&__buf[2] + 1) = v17;
    LODWORD(v81) = v18;
    *(void *)((char *)&v81 + 4) = v19;
    WORD6(v81) = v16;
    HIWORD(v81) = v15;
  }
  if (v15 >= v16)
  {
    if (a2)
    {
      uint64_t v5 = 0;
      int v6 = 1007;
      goto LABEL_68;
    }
    return 0;
  }
  __int16 v21 = (char *)malloc_type_malloc((unint64_t)v16 << 6, 0x37DF05C5uLL);
  if (!v21) {
    goto LABEL_66;
  }
  __int16 v22 = v21;
  if (BYTE4(__buf[0]) == 1)
  {
    size_t v23 = 40 * v16;
    int v24 = (char *)malloc_type_malloc(v23, 0x298289E8uLL);
    if (v24)
    {
      __int16 v25 = v24;
      if (pread(a1, v24, 40 * v16, *((off_t *)&__buf[2] + 1)) == v23)
      {
        uint64_t v26 = 0;
        int v27 = v22 + 24;
        do
        {
          *((void *)v27 - 3) = *(void *)&v25[v26];
          uint64_t v28 = *(void *)&v25[v26 + 8];
          *(void *)&long long v29 = v28;
          *((void *)&v29 + 1) = HIDWORD(v28);
          *((_OWORD *)v27 - 1) = v29;
          uint64_t v30 = *(void *)&v25[v26 + 16];
          *(void *)&long long v29 = v30;
          *((void *)&v29 + 1) = HIDWORD(v30);
          *(_OWORD *)int v27 = v29;
          *((void *)v27 + 2) = *(void *)&v25[v26 + 24];
          uint64_t v31 = *(void *)&v25[v26 + 32];
          *(void *)&long long v29 = v31;
          *((void *)&v29 + 1) = HIDWORD(v31);
          *(_OWORD *)(v27 + 24) = v29;
          v27 += 64;
          v26 += 40;
        }
        while (v23 != v26);
        free(v25);
        goto LABEL_42;
      }
    }
LABEL_65:
    free(v22);
    goto LABEL_66;
  }
  if (pread(a1, v21, (unint64_t)v16 << 6, *((off_t *)&__buf[2] + 1)) != (unint64_t)v16 << 6) {
    goto LABEL_65;
  }
LABEL_42:
  uint64_t v32 = &v22[64 * (unint64_t)HIWORD(v81)];
  uint64_t v34 = *((void *)v32 + 3);
  uint64_t v33 = *((void *)v32 + 4);
  int v35 = getpagesize();
  uint64_t v36 = v35 - 1;
  size_t v37 = (v34 & v36) + v33;
  uint64_t v38 = (char *)mmap(0, v37, 1, 2, a1, v34 & -v35);
  if (v38 == (char *)-1)
  {
    free(v22);
    if (!a2) {
      return 0;
    }
    goto LABEL_74;
  }
  uint64_t v65 = v38;
  size_t v66 = v37;
  uint64_t v68 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  unsigned int v41 = &v38[*(void *)&v22[64 * (unint64_t)HIWORD(v81) + 24] & v36];
  unsigned int v42 = WORD6(v81);
  uint64_t v43 = v22 + 32;
  uint64_t v44 = &v22[64 * (unint64_t)HIWORD(v81) + 32];
  if (v16 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v16;
  }
  uint64_t v67 = &v38[*(void *)&v22[64 * (unint64_t)HIWORD(v81) + 24] & v36];
  do
  {
    uint64_t v45 = *((unsigned int *)v43 + 2);
    if (v45 < v42)
    {
      unint64_t v46 = *((unsigned int *)v43 - 8);
      if (*(void *)v44 > v46)
      {
        unint64_t v47 = *(unsigned int *)&v22[64 * v45];
        if (*(void *)v44 > v47)
        {
          int v48 = *((_DWORD *)v43 - 7);
          if (v48 == 2)
          {
            *(void *)&long long v74 = &v41[v46];
            *((void *)&v74 + 1) = 2;
            *(void *)&long long v75 = *((void *)v43 - 3);
            *(void *)&long long v76 = *(void *)v43;
            *((void *)&v76 + 1) = *((void *)v43 + 3);
            uint64_t v77 = *((void *)v43 - 1);
            *(void *)&long long v70 = &v41[v47];
            uint64_t v68 = *(unsigned int *)&v22[64 * v45 + 4];
            *((void *)&v70 + 1) = v68;
            uint64_t v52 = &v72;
            uint64_t v51 = &v71;
            uint64_t v54 = &v73;
            uint64_t v53 = (char *)&v72 + 8;
            uint64_t v39 = 2;
          }
          else
          {
            if (v48 != 1) {
              goto LABEL_57;
            }
            uint64_t v49 = v39;
            unsigned int v50 = &v41[v46];
            if (strcmp(&v41[v46], ".SUNW_ctf"))
            {
              uint64_t v39 = v49;
              unsigned int v41 = v67;
              goto LABEL_57;
            }
            uint64_t v45 = v40;
            *(void *)&v78[0] = v50;
            *((void *)&v78[0] + 1) = 1;
            uint64_t v52 = v79;
            uint64_t v51 = &v78[1];
            uint64_t v54 = (uint64_t *)&v79[1];
            uint64_t v53 = (char *)v79 + 8;
            uint64_t v39 = v49;
            unsigned int v41 = v67;
          }
          uint64_t v55 = &v22[64 * v45];
          *(void *)uint64_t v51 = *((void *)v55 + 1);
          *(void *)uint64_t v52 = *((void *)v55 + 4);
          *(void *)uint64_t v53 = *((void *)v55 + 7);
          *uint64_t v54 = *((void *)v55 + 3);
        }
      }
    }
LABEL_57:
    ++v40;
    v43 += 64;
  }
  while (v16 != v40);
  free(v22);
  if (!*((void *)&v78[0] + 1))
  {
    munmap(v65, v66);
    if (a2)
    {
      uint64_t v5 = 0;
      int v6 = 1008;
      goto LABEL_68;
    }
    return 0;
  }
  if (ctf_sect_mmap(v78, a1) == (char *)-1)
  {
    munmap(v65, v66);
    if (!a2) {
      return 0;
    }
LABEL_74:
    uint64_t v5 = 0;
    int v6 = 1013;
    goto LABEL_68;
  }
  if (v39 && v68)
  {
    if (ctf_sect_mmap(&v74, a1) != (char *)-1 && ctf_sect_mmap(&v70, a1) != (char *)-1)
    {
      long long v60 = &v74;
      unsigned int v61 = &v70;
      goto LABEL_78;
    }
    if (a2) {
      *a2 = 1013;
    }
LABEL_82:
    ctf_sect_munmap((uint64_t)v78);
    ctf_sect_munmap((uint64_t)&v74);
    ctf_sect_munmap((uint64_t)&v70);
    uint64_t v5 = 0;
  }
  else
  {
    long long v60 = 0;
    unsigned int v61 = 0;
LABEL_78:
    uint64_t v64 = ctf_bufopen(v78, (uint64_t)v60, (uint64_t)v61, a2, v56, v57, v58, v59);
    uint64_t v5 = v64;
    if (!v64) {
      goto LABEL_82;
    }
    *(_DWORD *)(v64 + 556) |= 1u;
  }
  int v13 = v65;
  size_t v14 = v66;
LABEL_18:
  munmap(v13, v14);
  return v5;
}

uint64_t ctf_open(const char *a1, int *a2)
{
  int v3 = open(a1, 0);
  if (v3 == -1)
  {
    if (a2) {
      *a2 = *__error();
    }
    return 0;
  }
  else
  {
    int v4 = v3;
    uint64_t v5 = ctf_fdopen(v3, a2);
    close(v4);
    return v5;
  }
}

uint64_t ctf_write(uint64_t a1, int __fd)
{
  uint64_t v2 = *(void *)(a1 + 472);
  size_t v3 = v2 + 36;
  if (v2 == -36) {
    return 0;
  }
  int v6 = *(char **)(a1 + 456);
  while (1)
  {
    ssize_t v7 = write(__fd, v6, v3);
    if (v7 <= 0) {
      break;
    }
    v6 += v7;
    v3 -= v7;
    if (!v3) {
      return 0;
    }
  }
  *(_DWORD *)(a1 + 560) = *__error();
  return 0xFFFFFFFFLL;
}

uint64_t ctf_version(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a1 & 0x80000000) != 0)
  {
    uint64_t v9 = __error();
    int v10 = 22;
  }
  else
  {
    uint64_t v8 = a1;
    if (!a1) {
      return _libctf_version;
    }
    if (a1 < 5)
    {
      ctf_dprintf("ctf_version: client using version %d\n", a2, a3, a4, a5, a6, a7, a8, a1);
      _libctf_version = v8;
      return v8;
    }
    uint64_t v9 = __error();
    int v10 = 45;
  }
  int *v9 = v10;
  return 0xFFFFFFFFLL;
}

uint64_t ctf_lookup_by_name(const char **a1, const char *a2)
{
  if (a2)
  {
    size_t v4 = strlen(a2);
    if (*a2)
    {
      uint64_t v5 = 0;
      int v6 = (char *)&a2[v4];
      uint64_t v7 = MEMORY[0x1E4F14390];
      size_t v37 = a1 + 38;
      uint64_t v8 = a2;
      while (1)
      {
        uint64_t v9 = (char *)(v8 - 1);
        do
        {
          int v10 = (char *)v8;
          unint64_t v11 = v9;
          unsigned int v12 = *v8;
          if ((v12 & 0x80000000) != 0) {
            int v13 = __maskrune(v12, 0x4000uLL);
          }
          else {
            int v13 = *(_DWORD *)(v7 + 4 * v12 + 60) & 0x4000;
          }
          ++v8;
          uint64_t v9 = v11 + 1;
        }
        while (v13);
        if (v10 == v6)
        {
          char v33 = *v6 != 0;
LABEL_52:
          if ((v33 & 1) == 0 && v5) {
            return v5;
          }
          break;
        }
        size_t v14 = strpbrk(v10 + 1, ctf_lookup_by_name_delimiters);
        if (v14) {
          unsigned int v15 = v14;
        }
        else {
          unsigned int v15 = v6;
        }
        if (*v10 == 42)
        {
          uint64_t v16 = a1[63];
          uint64_t v17 = *(unsigned int *)&v16[4 * (*((unsigned int (**)(uint64_t))*a1 + 5))(v5)];
          if (!v17)
          {
            if (ctf_type_resolve((uint64_t)a1, v5) == -1) {
              goto LABEL_48;
            }
            int v18 = a1[63];
            uint64_t v17 = *(unsigned int *)&v18[4 * (*((unsigned int (**)(void))*a1 + 5))()];
            if (!v17) {
              goto LABEL_48;
            }
          }
          uint64_t v5 = (*((uint64_t (**)(uint64_t, void))*a1 + 6))(v17, (*((_DWORD *)a1 + 139) >> 1) & 1);
        }
        else
        {
          uint64_t v19 = (char *)(v15 - v10);
          unsigned int v20 = v15 - v10 + *(v15 - 1) - 105;
          if (v20 > 0x14
            || (&isqualifier_qhash)[2 * (int)v20 + 1] != v19
            || (uint64_t v8 = v15, strncmp((&isqualifier_qhash)[2 * (int)v20], v10, v15 - v10)))
          {
            __int16 v21 = *v37;
            if (!*v37) {
              goto LABEL_48;
            }
            __int16 v22 = a1 + 38;
            while (*v21)
            {
              if (!strncmp(v10, v21, (size_t)v19))
              {
                unint64_t v23 = v22[1];
                if ((unint64_t)v19 >= v23) {
                  goto LABEL_29;
                }
              }
              int v24 = (const char *)v22[3];
              v22 += 3;
              __int16 v21 = v24;
              if (!v24) {
                goto LABEL_48;
              }
            }
            unint64_t v23 = v22[1];
LABEL_29:
            __int16 v25 = &v11[v23];
            do
            {
              unsigned int v26 = v25[1];
              if ((v26 & 0x80000000) != 0) {
                int v27 = __maskrune(v26, 0x4000uLL);
              }
              else {
                int v27 = *(_DWORD *)(v7 + 4 * v26 + 60) & 0x4000;
              }
              ++v25;
            }
            while (v27);
            uint64_t v28 = strchr(v25, 42);
            long long v29 = v28 ? v28 : v6;
            uint64_t v8 = v29 + 1;
            do
            {
              unsigned int v30 = *(v8 - 2);
              if ((v30 & 0x80000000) != 0) {
                int v31 = __maskrune(v30, 0x4000uLL);
              }
              else {
                int v31 = *(_DWORD *)(v7 + 4 * v30 + 60) & 0x4000;
              }
              --v8;
            }
            while (v31);
            uint64_t v32 = ctf_hash_lookup(v22[2], (uint64_t)a1, v25, v8 - v25);
            if (!v32 || !*v22)
            {
LABEL_48:
              *((_DWORD *)a1 + 140) = 1028;
              int v35 = a1[66];
              if (v35)
              {
                uint64_t v5 = ctf_lookup_by_name(v35, a2);
                if (v5 != -1) {
                  return v5;
                }
              }
              return -1;
            }
            uint64_t v5 = v32[1];
          }
        }
        char v33 = *v8;
        if (!*v8) {
          goto LABEL_52;
        }
      }
    }
    int v34 = 1029;
  }
  else
  {
    int v34 = 22;
  }
  *((_DWORD *)a1 + 140) = v34;
  return -1;
}

uint64_t ctf_lookup_by_symbol(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2)
  {
    int v7 = 1010;
    goto LABEL_34;
  }
  if (*(void *)(a1 + 488) <= a2)
  {
    int v7 = 22;
    goto LABEL_34;
  }
  uint64_t v3 = *(void *)(a1 + 104);
  if (v3 == 20)
  {
    char v8 = *(unsigned char *)(v2 + 20 * a2 + 12);
    goto LABEL_25;
  }
  if (v3 != 16)
  {
    if (v3 == 12)
    {
      int v4 = *(unsigned char *)(v2 + 12 * a2 + 4) & 0xF;
      if (v4 == 1)
      {
        if (*(unsigned char *)(v2 + 12 * a2 + 5)) {
          goto LABEL_27;
        }
      }
      else if (v4 != 15 && v4 != 3)
      {
        goto LABEL_27;
      }
      uint64_t v6 = v2 + 12 * a2;
      goto LABEL_23;
    }
    char v8 = *(unsigned char *)(v2 + 40 * a2 + 8);
LABEL_25:
    int v12 = v8 & 0xF;
    goto LABEL_26;
  }
  uint64_t v9 = v2 + 16 * a2;
  int v10 = *(unsigned char *)(v9 + 4) & 0xF;
  if (v10 == 1)
  {
    if (*(unsigned char *)(v9 + 5)) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  if (v10 == 15 || v10 == 3)
  {
LABEL_22:
    uint64_t v6 = v2 + 16 * a2;
LABEL_23:
    int v12 = *(unsigned __int16 *)(v6 + 6);
LABEL_26:
    if (v12 == 1) {
      goto LABEL_27;
    }
    int v7 = 1032;
LABEL_34:
    *(_DWORD *)(a1 + 560) = v7;
    return -1;
  }
LABEL_27:
  uint64_t v13 = *(unsigned int *)(*(void *)(a1 + 480) + 4 * a2);
  if (v13 == -1) {
    goto LABEL_33;
  }
  uint64_t v14 = *(void *)(a1 + 464);
  if (*(int *)(a1 + 564) > 3)
  {
    uint64_t v15 = *(unsigned int *)(v14 + v13);
    if (v15) {
      return v15;
    }
LABEL_33:
    int v7 = 1033;
    goto LABEL_34;
  }
  uint64_t v15 = *(unsigned __int16 *)(v14 + v13);
  if (!v15) {
    goto LABEL_33;
  }
  return v15;
}

uint64_t ctf_lookup_by_id(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a1;
  if ((*(unsigned char *)(*(void *)a1 + 556) & 2) != 0
    && (*(unsigned int (**)(uint64_t))(*v4 + 24))(a2)
    && (int v4 = (void *)v4[66]) == 0)
  {
    uint64_t result = 0;
    *(_DWORD *)(*(void *)a1 + 560) = 1011;
  }
  else
  {
    unsigned int v5 = (*(uint64_t (**)(uint64_t))(*v4 + 40))(a2);
    if (v5 && v4[64] >= (unint64_t)v5)
    {
      *(void *)a1 = v4;
      return *(unsigned int *)(v4[62] + 4 * v5) + v4[58];
    }
    else
    {
      uint64_t result = 0;
      *((_DWORD *)v4 + 140) = 1020;
    }
  }
  return result;
}

uint64_t ctf_func_info(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (!*(void *)(a1 + 88))
  {
    int v10 = 1010;
LABEL_11:
    *(_DWORD *)(a1 + 560) = v10;
    return 0xFFFFFFFFLL;
  }
  if (*(void *)(a1 + 488) <= a2)
  {
    int v10 = 22;
    goto LABEL_11;
  }
  uint64_t v5 = *(unsigned int *)(*(void *)(a1 + 480) + 4 * a2);
  if (v5 == -1
    || ((int v7 = (int *)(*(void *)(a1 + 464) + v5), *(_DWORD *)(a1 + 564) != 4)
      ? (LOWORD(v8) = *(_WORD *)v7, uint64_t v9 = *((unsigned __int16 *)v7 + 1))
      : (v8 = *v7, uint64_t v9 = v7[1]),
        uint64_t v11 = (unsigned __int16)v8,
        int v12 = (**(uint64_t (***)(uint64_t))a1)(v11),
        int v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(v11),
        !(v12 | v13)))
  {
    int v10 = 1031;
    goto LABEL_11;
  }
  if (v12 != 5)
  {
    int v10 = 1007;
    goto LABEL_11;
  }
  *(void *)a3 = v9;
  *(_DWORD *)(a3 + 8) = v13;
  *(_DWORD *)(a3 + 12) = 0;
  uint64_t v15 = *(unsigned int *)(*(void *)(a1 + 480) + 4 * a2) + *(void *)(a1 + 464);
  int v16 = v13 - 1;
  if (*(_DWORD *)(a1 + 564) == 4) {
    int v17 = *(_DWORD *)(v15 + 4 * v16 + 8);
  }
  else {
    int v17 = *(unsigned __int16 *)(v15 + 2 * v16 + 4);
  }
  BOOL v18 = v17 == 0;
  BOOL v19 = v13 == 0;
  uint64_t result = 0;
  BOOL v19 = v19 || !v18;
  if (!v19)
  {
    *(_DWORD *)(a3 + 8) = v16;
    *(_DWORD *)(a3 + 12) = 1;
  }
  return result;
}

uint64_t ctf_func_args(uint64_t a1, unint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t result = ctf_func_info(a1, a2, (uint64_t)&v15);
  if (result != -1)
  {
    unsigned int v9 = v16;
    if (v16 >= a3) {
      unsigned int v9 = a3;
    }
    if (v9)
    {
      int v10 = *(_DWORD *)(a1 + 564);
      uint64_t v11 = 8;
      if (v10 < 4) {
        uint64_t v11 = 4;
      }
      int v12 = (unsigned int *)(v11 + *(void *)(a1 + 464) + *(unsigned int *)(*(void *)(a1 + 480) + 4 * a2));
      do
      {
        if (v10 == 4)
        {
          uint64_t v13 = *v12;
          uint64_t v14 = 4;
        }
        else
        {
          uint64_t v13 = *(unsigned __int16 *)v12;
          uint64_t v14 = 2;
        }
        int v12 = (unsigned int *)((char *)v12 + v14);
        *a4++ = v13;
        --v9;
      }
      while (v9);
    }
    return 0;
  }
  return result;
}

uint64_t ctf_bufopen(long long *a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || (a2 != 0) == (a3 == 0))
  {
    if (a4)
    {
      uint64_t v38 = 0;
      int v39 = 22;
LABEL_20:
      *a4 = v39;
      return v38;
    }
    return 0;
  }
  if (a2)
  {
    uint64_t v12 = *(void *)(a2 + 40);
    if (v12 != 12 && v12 != 16)
    {
      if (a4)
      {
        uint64_t v38 = 0;
        int v39 = 1004;
        goto LABEL_20;
      }
      return 0;
    }
    if (!*(void *)(a2 + 24))
    {
      if (a4)
      {
        uint64_t v38 = 0;
        int v39 = 1005;
        goto LABEL_20;
      }
      return 0;
    }
  }
  if (a3 && !*(void *)(a3 + 24))
  {
    if (a4)
    {
      uint64_t v38 = 0;
      int v39 = 1006;
      goto LABEL_20;
    }
    return 0;
  }
  if (*((void *)a1 + 4) <= 3uLL) {
    goto LABEL_43;
  }
  uint64_t v14 = (unsigned __int16 *)*((void *)a1 + 3);
  ctf_dprintf("ctf_bufopen: magic=0x%x version=%u\n", a2, a3, (uint64_t)a4, a5, a6, a7, a8, *v14);
  if (*v14 != 53233) {
    goto LABEL_43;
  }
  int v22 = *((unsigned __int8 *)v14 + 2);
  if ((v22 - 2) >= 3)
  {
    if (v22 != 1)
    {
      if (a4)
      {
        uint64_t v38 = 0;
        int v39 = 1002;
        goto LABEL_20;
      }
      return 0;
    }
    if (*((void *)a1 + 4) >= 0x18uLL)
    {
      uint64_t v40 = *((void *)a1 + 3);
      *(void *)((char *)&v108 + 4) = 0;
      HIDWORD(v108) = 0;
      LODWORD(v108) = *(_DWORD *)v40;
      long long v109 = *(_OWORD *)(v40 + 4);
      unsigned int v25 = *(_DWORD *)(v40 + 20);
      unsigned int v110 = v25;
      unsigned int v26 = HIDWORD(v109);
      uint64_t v28 = v25 + HIDWORD(v109);
      ctf_dprintf("ctf_bufopen: uncompressed size=%lu\n", v15, v16, v17, v18, v19, v20, v21, v25 + BYTE12(v109));
      unsigned int v27 = 0;
      unsigned int v36 = v109;
      size_t v37 = 24;
      goto LABEL_30;
    }
LABEL_43:
    if (a4)
    {
      uint64_t v38 = 0;
      int v39 = 1009;
      goto LABEL_20;
    }
    return 0;
  }
  if (*((void *)a1 + 4) <= 0x23uLL) {
    goto LABEL_43;
  }
  unint64_t v23 = (long long *)*((void *)a1 + 3);
  long long v24 = v23[1];
  long long v108 = *v23;
  long long v109 = v24;
  unsigned int v25 = *((_DWORD *)v23 + 8);
  unsigned int v110 = v25;
  unsigned int v26 = HIDWORD(v24);
  unsigned int v27 = HIDWORD(v108);
  uint64_t v28 = v25 + HIDWORD(v24);
  ctf_dprintf("ctf_bufopen: uncompressed size=%lu\n", v15, v16, v17, v18, v19, v20, v21, v25 + BYTE12(v24));
  if (HIDWORD(v108) > v28) {
    goto LABEL_41;
  }
  unsigned int v36 = v109;
  size_t v37 = 36;
LABEL_30:
  if (v36 > v28
    || DWORD1(v109) > v28
    || (v26 <= v28 ? (BOOL v41 = DWORD2(v109) > v28) : (BOOL v41 = 1),
        v41
     || DWORD2(v109) > v26
     || v27 > v36
     || v36 > DWORD1(v109)
     || DWORD1(v109) > DWORD2(v109)
     || (BYTE8(v109) | v27) & 3 | (BYTE4(v109) | v36) & 1))
  {
LABEL_41:
    if (a4)
    {
      uint64_t v38 = 0;
      int v39 = 1007;
      goto LABEL_20;
    }
    return 0;
  }
  unsigned int v106 = v26;
  unsigned int v107 = v25;
  if ((BYTE3(v108) & 1) == 0)
  {
    unsigned int v42 = (unsigned char *)*((void *)a1 + 3);
    uint64_t v105 = &v42[v37];
    goto LABEL_49;
  }
  if (!ctf_zopen(a4, v29, v30, v31, v32, v33, v34, v35)) {
    return 0;
  }
  long long v70 = mmap(0, v37 + v28, 3, 4098, -1, 0);
  if (v70 == (unsigned char *)-1)
  {
    if (!a4) {
      return 0;
    }
    int v79 = 1016;
    goto LABEL_113;
  }
  unsigned int v42 = v70;
  memmove(v70, *((const void **)a1 + 3), v37);
  v42[3] &= ~1u;
  uint64_t v105 = &v42[v37];
  if (zlib())
  {
    char v71 = off_1E953C510();
    ctf_dprintf("zlib inflate err: %s\n", v72, v73, v74, v75, v76, v77, v78, v71);
    munmap(v42, v37 + v28);
    if (!a4) {
      return 0;
    }
    int v79 = 1017;
LABEL_113:
    *a4 = v79;
    return 0;
  }
  mprotect(v42, v37 + v28, 1);
LABEL_49:
  uint64_t v43 = (char *)malloc_type_malloc(0x278uLL, 0xCFAB4140uLL);
  if (!v43)
  {
    if (a4)
    {
      uint64_t v38 = 0;
      int v39 = 35;
      goto LABEL_20;
    }
    return 0;
  }
  uint64_t v38 = (uint64_t)v43;
  uint64_t v44 = (const char **)(v43 + 8);
  bzero(v43 + 8, 0x270uLL);
  unsigned int v52 = BYTE2(v108);
  *(_DWORD *)(v38 + 564) = BYTE2(v108);
  *(void *)uint64_t v38 = (char *)&ctf_fileops + 72 * v52;
  long long v53 = *a1;
  long long v54 = a1[1];
  long long v55 = a1[2];
  *(void *)(v38 + 56) = *((void *)a1 + 6);
  *(_OWORD *)(v38 + 40) = v55;
  *(_OWORD *)(v38 + 24) = v54;
  *(_OWORD *)(v38 + 8) = v53;
  if (a2)
  {
    long long v56 = *(_OWORD *)a2;
    long long v57 = *(_OWORD *)(a2 + 16);
    long long v58 = *(_OWORD *)(a2 + 32);
    *(void *)(v38 + 112) = *(void *)(a2 + 48);
    *(_OWORD *)(v38 + 80) = v57;
    *(_OWORD *)(v38 + 96) = v58;
    *(_OWORD *)(v38 + 64) = v56;
    long long v59 = *(_OWORD *)a3;
    long long v60 = *(_OWORD *)(a3 + 16);
    long long v61 = *(_OWORD *)(a3 + 32);
    *(void *)(v38 + 168) = *(void *)(a3 + 48);
    *(_OWORD *)(v38 + 152) = v61;
    *(_OWORD *)(v38 + 136) = v60;
    *(_OWORD *)(v38 + 120) = v59;
  }
  if (*v44) {
    *uint64_t v44 = ctf_strdup(*v44);
  }
  uint64_t v62 = *(const char **)(v38 + 64);
  if (v62) {
    *(void *)(v38 + 64) = ctf_strdup(v62);
  }
  uint64_t v63 = *(char **)(v38 + 120);
  if (v63)
  {
    uint64_t v63 = ctf_strdup(v63);
    *(void *)(v38 + 120) = v63;
  }
  if (!*v44) {
    *uint64_t v44 = (const char *)&_CTF_NULLSTR;
  }
  if (!*(void *)(v38 + 64)) {
    *(void *)(v38 + 64) = &_CTF_NULLSTR;
  }
  if (!v63) {
    *(void *)(v38 + 120) = &_CTF_NULLSTR;
  }
  *(void *)(v38 + 424) = &v105[v106];
  *(void *)(v38 + 432) = v107;
  if (a3)
  {
    *(void *)(v38 + 440) = *(void *)(a3 + 24);
    *(void *)(v38 + 448) = *(void *)(a3 + 32);
  }
  *(void *)(v38 + 456) = v42;
  *(void *)(v38 + 464) = v105;
  *(void *)(v38 + 472) = v37 + v28;
  uint64_t v64 = "(?)";
  if (DWORD1(v108))
  {
    unint64_t v65 = v38 + 16 * ((unint64_t)DWORD1(v108) >> 31);
    uint64_t v66 = *(void *)(v65 + 424);
    if (v66)
    {
      unint64_t v67 = DWORD1(v108) & 0x7FFFFFFF;
      uint64_t v68 = (const char *)(v66 + v67);
      if (*(void *)(v65 + 432) <= v67) {
        stat v69 = 0;
      }
      else {
        stat v69 = v68;
      }
    }
    else
    {
      stat v69 = 0;
    }
    if (!v69) {
      stat v69 = "(?)";
    }
    *(void *)(v38 + 536) = v69;
  }
  if (DWORD2(v108))
  {
    unint64_t v80 = v38 + 16 * ((unint64_t)DWORD2(v108) >> 31);
    uint64_t v81 = *(void *)(v80 + 424);
    if (v81)
    {
      unint64_t v82 = DWORD2(v108) & 0x7FFFFFFF;
      uint64_t v83 = (const char *)(v81 + v82);
      if (*(void *)(v80 + 432) <= v82) {
        uint64_t v84 = 0;
      }
      else {
        uint64_t v84 = v83;
      }
    }
    else
    {
      uint64_t v84 = 0;
    }
    if (v84) {
      uint64_t v64 = v84;
    }
    *(void *)(v38 + 544) = v64;
  }
  else
  {
    uint64_t v64 = *(const char **)(v38 + 544);
  }
  if (!v64) {
    uint64_t v64 = "<NULL>";
  }
  ctf_dprintf("ctf_bufopen: parent name %s (label %s)\n", v45, v46, v47, v48, v49, v50, v51, (char)v64);
  if (a2)
  {
    uint64_t v91 = *(void *)(a2 + 32) / *(void *)(a2 + 40);
    *(void *)(v38 + 488) = v91;
    char v92 = 2;
    if (*(_DWORD *)(v38 + 564) == 4) {
      char v92 = 3;
    }
    uint64_t v93 = malloc_type_malloc(v91 << v92, 0xCFAB4140uLL);
    *(void *)(v38 + 480) = v93;
    if (!v93)
    {
      int inited = 35;
      goto LABEL_107;
    }
    init_symtab(v38, &v108, a2, a3, v97, v98, v99, v100);
  }
  int inited = init_types(v38, &v108, v85, v86, v87, v88, v89, v90);
  if (inited)
  {
LABEL_107:
    if (a4) {
      *a4 = inited;
    }
    ctf_close(v38, v94, v95, v96, v97, v98, v99, v100);
    return 0;
  }
  *(void *)(v38 + 304) = "struct";
  *(void *)(v38 + 312) = 6;
  *(void *)(v38 + 320) = v38 + 176;
  *(void *)(v38 + 328) = "union";
  *(void *)(v38 + 336) = 5;
  *(void *)(v38 + 344) = v38 + 208;
  *(void *)(v38 + 352) = "enum";
  *(void *)(v38 + 360) = 4;
  *(void *)(v38 + 368) = v38 + 240;
  *(void *)(v38 + 376) = &_CTF_NULLSTR;
  *(void *)(v38 + 384) = 0;
  *(void *)(v38 + 392) = v38 + 272;
  *(void *)(v38 + 408) = 0;
  *(void *)(v38 + 416) = 0;
  *(void *)(v38 + 400) = 0;
  if (a2)
  {
    uint64_t v102 = *(void *)(a2 + 40);
    uint64_t v103 = &off_1E5A437A8;
    if (v102 != 40 && v102 != 16) {
      uint64_t v103 = &_libctf_models;
    }
  }
  else
  {
    uint64_t v103 = &off_1E5A437A8;
  }
  *(void *)(v38 + 520) = v103;
  *(_DWORD *)(v38 + 552) = 1;
  return v38;
}

const char *init_symtab(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 488);
  if (v8 >= 1)
  {
    uint64_t v11 = *(unsigned int **)(a1 + 480);
    uint64_t v12 = &v11[v8];
    int v13 = *(_DWORD *)(a1 + 564);
    uint64_t v14 = *(unsigned int **)(a3 + 24);
    unsigned int v40 = a2[4];
    unsigned int v41 = a2[5];
    uint64_t v45 = 0;
    long long v43 = 0u;
    long long v44 = 0u;
    if (v13 < 4) {
      char v15 = 1;
    }
    else {
      char v15 = 2;
    }
    if (v13 >= 4) {
      int v16 = 4;
    }
    else {
      int v16 = 2;
    }
    char v37 = v15;
    int v38 = v16;
    uint64_t v17 = *(void *)(a3 + 40);
    while (1)
    {
      switch(v17)
      {
        case 12:
          uint64_t v19 = *v14;
          if (!v19) {
            goto LABEL_27;
          }
          uint64_t v20 = *(void *)(a4 + 24);
          uint64_t v21 = (unsigned char *)(v20 + v19);
          if (*v21 == 95) {
            LODWORD(v21) = v21 + 1;
          }
          unint64_t v18 = (v21 - v20);
          *(void *)&long long v44 = v14[2];
          BYTE8(v43) = 0;
          __int16 v22 = -2;
          break;
        case 16:
          uint64_t v23 = *v14;
          if (!v23)
          {
LABEL_27:
            unint64_t v18 = 0;
            goto LABEL_34;
          }
          uint64_t v24 = *(void *)(a4 + 24);
          unsigned int v25 = (unsigned char *)(v24 + v23);
          if (*v25 == 95) {
            LODWORD(v25) = v25 + 1;
          }
          unint64_t v18 = (v25 - v24);
          *(void *)&long long v44 = *((void *)v14 + 1);
          BYTE8(v43) = 0;
          __int16 v22 = -3;
          break;
        case 20:
          unint64_t v18 = *v14;
          *(void *)&long long v44 = v14[1];
          BYTE8(v43) = *((unsigned char *)v14 + 12);
          WORD5(v43) = *((_WORD *)v14 + 7);
          goto LABEL_34;
        default:
          unint64_t v18 = *(void *)v14;
          uint64_t v28 = (long long *)v14;
          goto LABEL_35;
      }
      WORD5(v43) = v22;
      unsigned int v26 = *((unsigned __int8 *)v14 + 4);
      if (v26 >= 0x20)
      {
        if (v26 == 32) {
          goto LABEL_32;
        }
        if (v26 == 36)
        {
          char v29 = 18;
LABEL_33:
          BYTE8(v43) = v29;
        }
      }
      else
      {
        int v27 = v26 & 0xF;
        if (v27 != 1)
        {
          if (v27 == 15 || v27 == 3) {
            BYTE8(v43) = *((unsigned char *)v14 + 6) & 0xF | 0x10;
          }
          goto LABEL_34;
        }
        if (!*((unsigned char *)v14 + 5))
        {
LABEL_32:
          char v29 = 17;
          goto LABEL_33;
        }
      }
LABEL_34:
      uint64_t v28 = &v43;
LABEL_35:
      uint64_t v30 = (const char *)&_CTF_NULLSTR;
      if (v18 < *(void *)(a4 + 32)) {
        uint64_t v30 = (const char *)(*(void *)(a4 + 24) + v18);
      }
      if (!v18) {
        goto LABEL_50;
      }
      int v31 = *((unsigned __int16 *)v28 + 5);
      if (!*((_WORD *)v28 + 5) || !strcmp(v30, "_START_") || !strcmp(v30, "_END_")) {
        goto LABEL_50;
      }
      int v32 = *((unsigned char *)v28 + 8) & 0xF;
      if (v32 == 2)
      {
        if (v41 < a2[6])
        {
          unsigned int *v11 = v41;
          uint64_t v33 = *(void *)(a1 + 464);
          if (*(_DWORD *)(a1 + 564) == 4) {
            uint64_t v34 = *(unsigned int *)(v33 + v41);
          }
          else {
            uint64_t v34 = *(unsigned __int16 *)(v33 + v41);
          }
          int v35 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(v34);
          if ((**(unsigned int (***)(uint64_t))a1)(v34) | v35) {
            v41 += (v35 + 2) << v37;
          }
          else {
            v41 += v38;
          }
          goto LABEL_51;
        }
LABEL_50:
        unsigned int *v11 = -1;
        goto LABEL_51;
      }
      if (v32 != 1 || v40 >= a2[5] || v31 == 65521 && !*((void *)v28 + 2)) {
        goto LABEL_50;
      }
      unsigned int *v11 = v40;
      v40 += v38;
LABEL_51:
      ++v11;
      uint64_t v17 = *(void *)(a3 + 40);
      uint64_t v14 = (unsigned int *)((char *)v14 + v17);
      if (v11 >= v12)
      {
        uint64_t v8 = *(void *)(a1 + 488);
        return ctf_dprintf("loaded %lu symtab entries\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v8);
      }
    }
  }
  return ctf_dprintf("loaded %lu symtab entries\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v8);
}

uint64_t init_types(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *(void *)(a1 + 464);
  uint64_t v10 = a2[6];
  uint64_t v11 = a2[7];
  unint64_t v12 = v9 + v10;
  unint64_t v13 = v9 + v11;
  long long v149 = 0u;
  memset(v150, 0, sizeof(v150));
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  int v14 = a2[2] != 0;
  unsigned int v138 = v10;
  __int16 v139 = (unsigned int *)(v9 + v10);
  if (v10 < v11)
  {
    while (1)
    {
      if (*(int *)(a1 + 564) > 3) {
        uint64_t v15 = *(unsigned int *)(v12 + 4);
      }
      else {
        uint64_t v15 = *(unsigned __int16 *)(v12 + 4);
      }
      unsigned int v16 = (**(uint64_t (***)(uint64_t))a1)(v15);
      if (*(int *)(a1 + 564) > 3) {
        uint64_t v17 = *(unsigned int *)(v12 + 4);
      }
      else {
        uint64_t v17 = *(unsigned __int16 *)(v12 + 4);
      }
      unsigned int v18 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(v17);
      uint64_t v141 = 0;
      uint64_t v144 = 0;
      ctf_get_ctt_size((_DWORD *)a1, v12, (unint64_t *)&v141, &v144);
      uint64_t v19 = v18;
      uint64_t v20 = 4;
      switch(v16)
      {
        case 0u:
          goto LABEL_47;
        case 1u:
        case 2u:
          goto LABEL_53;
        case 3u:
        case 0xAu:
        case 0xBu:
        case 0xCu:
        case 0xDu:
          if (*(int *)(a1 + 564) > 3) {
            uint64_t v21 = *(unsigned int *)(v12 + 8);
          }
          else {
            uint64_t v21 = *(unsigned __int16 *)(v12 + 6);
          }
          uint64_t v20 = 0;
          v14 |= (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(v21);
          goto LABEL_53;
        case 4u:
          if (*(_DWORD *)(a1 + 564) == 4) {
            uint64_t v20 = 12;
          }
          else {
            uint64_t v20 = 8;
          }
          goto LABEL_53;
        case 5u:
          uint64_t v25 = (v19 & 1) + v19;
          uint64_t v26 = 2 * v25;
          uint64_t v27 = 4 * v25;
          if (*(_DWORD *)(a1 + 564) == 4) {
            uint64_t v20 = v27;
          }
          else {
            uint64_t v20 = v26;
          }
          goto LABEL_53;
        case 6u:
        case 7u:
          int v22 = *(_DWORD *)(a1 + 564);
          if (v22 == 1 || v141 < 0x2000)
          {
            if (v22 == 4)
            {
              uint64_t v20 = 12 * v19;
              if (v19)
              {
                int v31 = (unsigned int *)(v144 + v12 + 4);
                do
                {
                  unsigned int v32 = *v31;
                  v31 += 3;
                  v14 |= (*(uint64_t (**)(void))(*(void *)a1 + 32))(v32);
                  LODWORD(v19) = v19 - 1;
                }
                while (v19);
              }
            }
            else
            {
              uint64_t v20 = 8 * v19;
              if (v19)
              {
                int v35 = (unsigned __int16 *)(v144 + v12 + 4);
                do
                {
                  unsigned int v36 = *v35;
                  v35 += 4;
                  v14 |= (*(uint64_t (**)(void))(*(void *)a1 + 32))(v36);
                  LODWORD(v19) = v19 - 1;
                }
                while (v19);
              }
            }
          }
          else
          {
            uint64_t v20 = 16 * v19;
            if (v22 == 4)
            {
              if (v19)
              {
                uint64_t v23 = (unsigned int *)(v144 + v12 + 4);
                do
                {
                  unsigned int v24 = *v23;
                  v23 += 4;
                  v14 |= (*(uint64_t (**)(void))(*(void *)a1 + 32))(v24);
                  LODWORD(v19) = v19 - 1;
                }
                while (v19);
              }
            }
            else if (v19)
            {
              uint64_t v33 = (unsigned __int16 *)(v144 + v12 + 4);
              do
              {
                unsigned int v34 = *v33;
                v33 += 8;
                v14 |= (*(uint64_t (**)(void))(*(void *)a1 + 32))(v34);
                LODWORD(v19) = v19 - 1;
              }
              while (v19);
            }
          }
          goto LABEL_53;
        case 8u:
          uint64_t v20 = 8 * v19;
          goto LABEL_53;
        case 9u:
          if (*(int *)(a1 + 564) > 3)
          {
            uint64_t v28 = &v148;
            if (*(_DWORD *)(v12 + 8))
            {
              uint64_t v28 = &v148;
              if (*(_DWORD *)(v12 + 8) <= 0x1Eu)
              {
                uint64_t v29 = *(unsigned int *)(v12 + 8);
                goto LABEL_45;
              }
            }
          }
          else
          {
            uint64_t v28 = &v148;
            if (*(_WORD *)(v12 + 6))
            {
              uint64_t v28 = &v148;
              if (*(unsigned __int16 *)(v12 + 6) <= 0x1Eu)
              {
                uint64_t v29 = *(unsigned __int16 *)(v12 + 6);
LABEL_45:
                uint64_t v28 = (long long *)((char *)&v145 + 8 * v29);
              }
            }
          }
          ++*(void *)v28;
LABEL_47:
          uint64_t v20 = 0;
LABEL_53:
          v12 += v20 + v144;
          ++*((void *)&v145 + v16);
          ++*(void *)(a1 + 512);
          if (v13 <= v12) {
            goto LABEL_54;
          }
          break;
        case 0xEu:
          if (*(int *)(a1 + 564) > 3) {
            uint64_t v30 = *(unsigned int *)(v12 + 8);
          }
          else {
            uint64_t v30 = *(unsigned __int16 *)(v12 + 6);
          }
          v14 |= (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(v30);
          uint64_t v20 = 4;
          goto LABEL_53;
        default:
          ctf_dprintf("detected invalid CTF kind -- %u\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v16);
          return 1007;
      }
    }
  }
LABEL_54:
  if (v14)
  {
    ctf_dprintf("CTF container %p is a child\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a1);
    *(_DWORD *)(a1 + 556) |= 2u;
  }
  else
  {
    ctf_dprintf("CTF container %p is a parent\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a1);
  }
  uint64_t result = ctf_hash_create(a1 + 176, v148);
  if (!result)
  {
    uint64_t result = ctf_hash_create(a1 + 208, *((unint64_t *)&v148 + 1));
    if (!result)
    {
      uint64_t result = ctf_hash_create(a1 + 240, v149);
      if (!result)
      {
        uint64_t result = ctf_hash_create(a1 + 272, vaddvq_s64(vaddq_s64(*(int64x2_t *)((char *)v150 + 8), *(int64x2_t *)((char *)&v150[1] + 8)))+ *((void *)&v145 + 1)+ v146+ *((void *)&v147 + 1)+ v150[0].i64[0]+ *((void *)&v146 + 1));
        if (!result)
        {
          *(void *)(a1 + 496) = malloc_type_malloc(4 * *(void *)(a1 + 512) + 4, 0xCFAB4140uLL);
          int v38 = malloc_type_malloc(4 * *(void *)(a1 + 512) + 4, 0xCFAB4140uLL);
          *(void *)(a1 + 504) = v38;
          uint64_t result = 35;
          uint64_t v140 = *(_DWORD **)(a1 + 496);
          if (v140)
          {
            if (v38)
            {
              id v137 = (uint64_t *)(a1 + 272);
              *uint64_t v140 = 0;
              bzero(v140, 4 * *(void *)(a1 + 512) + 4);
              bzero(*(void **)(a1 + 504), 4 * *(void *)(a1 + 512) + 4);
              if (v138 < v11)
              {
                int v135 = 0;
                int v136 = 0;
                uint64_t v46 = 1;
                while (1)
                {
                  if (*(int *)(a1 + 564) > 3) {
                    uint64_t v47 = v139[1];
                  }
                  else {
                    uint64_t v47 = *((unsigned __int16 *)v139 + 2);
                  }
                  int v48 = (**(uint64_t (***)(uint64_t))a1)(v47);
                  if (*(int *)(a1 + 564) > 3) {
                    uint64_t v49 = v139[1];
                  }
                  else {
                    uint64_t v49 = *((unsigned __int16 *)v139 + 2);
                  }
                  unsigned int v50 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(v49);
                  uint64_t v143 = 0;
                  uint64_t v144 = 0;
                  int v142 = 0;
                  uint64_t v141 = 0;
                  ctf_get_ctt_size((_DWORD *)a1, (uint64_t)v139, (unint64_t *)&v144, &v143);
                  unint64_t v51 = *v139;
                  uint64_t v52 = a1 + 16 * (v51 >> 31);
                  uint64_t v53 = *(void *)(v52 + 424);
                  if (v53)
                  {
                    unint64_t v54 = v51 & 0x7FFFFFFF;
                    long long v55 = (char *)(v53 + v54);
                    if (*(void *)(v52 + 432) <= v54) {
                      long long v56 = 0;
                    }
                    else {
                      long long v56 = v55;
                    }
                  }
                  else
                  {
                    long long v56 = 0;
                  }
                  if (v56) {
                    long long v57 = v56;
                  }
                  else {
                    long long v57 = "(?)";
                  }
                  switch(v48)
                  {
                    case 1:
                    case 2:
                      size_t v62 = strlen(v57);
                      uint64_t v63 = ctf_hash_lookup((uint64_t)v137, a1, v57, v62);
                      if (!v63) {
                        goto LABEL_123;
                      }
                      uint64_t v64 = v63;
                      int v65 = ctf_type_encoding((uint64_t (***)(uint64_t))a1, v63[1], (unsigned int *)&v141);
                      if (!(v65 | v142)) {
                        v64[1] = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48))(v46, v14 != 0);
                      }
                      goto LABEL_127;
                    case 3:
                      if (*(int *)(a1 + 564) > 3) {
                        uint64_t v66 = v139[2];
                      }
                      else {
                        uint64_t v66 = *((unsigned __int16 *)v139 + 3);
                      }
                      if (v14 == (*(unsigned int (**)(uint64_t))(*(void *)a1 + 32))(v66))
                      {
                        uint64_t v79 = *(int *)(a1 + 564) > 3 ? v139[2] : *((unsigned __int16 *)v139 + 3);
                        if (*(void *)(a1 + 512) >= (unint64_t)(*(unsigned int (**)(uint64_t))(*(void *)a1 + 40))(v79))
                        {
                          if (*(int *)(a1 + 564) > 3) {
                            uint64_t v82 = v139[2];
                          }
                          else {
                            uint64_t v82 = *((unsigned __int16 *)v139 + 3);
                          }
                          uint64_t v83 = *(void *)(a1 + 504);
                          *(_DWORD *)(v83 + 4 * (*(unsigned int (**)(uint64_t))(*(void *)a1 + 40))(v82)) = v46;
                        }
                      }
                      goto LABEL_80;
                    case 4:
                      uint64_t v61 = 12;
                      if (*(int *)(a1 + 564) < 4) {
                        uint64_t v61 = 8;
                      }
                      goto LABEL_141;
                    case 5:
                      int v67 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48))(v46, v14 != 0);
                      uint64_t result = ctf_hash_insert(v137, a1, v67, *v139);
                      if (result != 1018 && result != 0) {
                        return result;
                      }
                      unint64_t v69 = (v50 & 1) + (unint64_t)v50;
                      if (*(int *)(a1 + 564) > 3) {
                        goto LABEL_137;
                      }
                      uint64_t v61 = 2 * v69;
                      goto LABEL_141;
                    case 6:
                      int v70 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48))(v46, v14 != 0);
                      uint64_t result = ctf_hash_define((uint64_t *)(a1 + 176), a1, v70, *v139);
                      if (result != 1018 && result != 0) {
                        return result;
                      }
                      int v72 = *(_DWORD *)(a1 + 564);
                      if (v72 == 1 || v144 < 0x2000) {
                        goto LABEL_121;
                      }
                      uint64_t v61 = 16 * v50;
                      ++v135;
                      goto LABEL_141;
                    case 7:
                      int v73 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48))(v46, v14 != 0);
                      uint64_t result = ctf_hash_define((uint64_t *)(a1 + 208), a1, v73, *v139);
                      if (result != 1018 && result != 0) {
                        return result;
                      }
                      int v72 = *(_DWORD *)(a1 + 564);
                      if (v72 == 1 || v144 < 0x2000)
                      {
LABEL_121:
                        if (v72 > 3)
                        {
                          unint64_t v69 = 3 * v50;
LABEL_137:
                          uint64_t v61 = 4 * v69;
                        }
                        else
                        {
LABEL_122:
                          uint64_t v61 = 8 * v50;
                        }
                      }
                      else
                      {
                        uint64_t v61 = 16 * v50;
                        ++v136;
                      }
                      goto LABEL_141;
                    case 8:
                      int v75 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48))(v46, v14 != 0);
                      uint64_t result = ctf_hash_define((uint64_t *)(a1 + 240), a1, v75, *v139);
                      if (result != 1018 && result != 0) {
                        return result;
                      }
                      goto LABEL_122;
                    case 9:
                      if (*(int *)(a1 + 564) > 3) {
                        unsigned int v77 = v139[2];
                      }
                      else {
                        unsigned int v77 = *((unsigned __int16 *)v139 + 3);
                      }
                      if (v77 == 8)
                      {
                        uint64_t v80 = a1 + 240;
                      }
                      else
                      {
                        uint64_t v80 = a1 + 176;
                        if (v77 == 7) {
                          uint64_t v80 = a1 + 208;
                        }
                      }
                      size_t v81 = strlen(v57);
                      if (ctf_hash_lookup(v80, a1, v57, v81)) {
                        goto LABEL_140;
                      }
                      int v58 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48))(v46, v14 != 0);
                      unsigned int v59 = *v139;
                      long long v60 = (uint64_t *)v80;
                      goto LABEL_81;
                    case 10:
                    case 11:
                    case 12:
                    case 13:
LABEL_80:
                      int v58 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48))(v46, v14 != 0);
                      unsigned int v59 = *v139;
                      long long v60 = (uint64_t *)(a1 + 272);
LABEL_81:
                      uint64_t result = ctf_hash_insert(v60, a1, v58, v59);
                      uint64_t v61 = 0;
                      if (!result) {
                        goto LABEL_141;
                      }
                      goto LABEL_125;
                    case 14:
LABEL_123:
                      int v78 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48))(v46, v14 != 0);
                      uint64_t result = ctf_hash_insert(v137, a1, v78, *v139);
                      if (result)
                      {
                        uint64_t v61 = 4;
LABEL_125:
                        if (result != 1018) {
                          return result;
                        }
                      }
                      else
                      {
LABEL_127:
                        uint64_t v61 = 4;
                      }
LABEL_141:
                      v140[v46++] = v139 - *(_DWORD *)(a1 + 464);
                      __int16 v139 = (unsigned int *)((char *)v139 + v61 + v143);
                      if (v13 <= (unint64_t)v139) {
                        goto LABEL_152;
                      }
                      break;
                    default:
LABEL_140:
                      uint64_t v61 = 0;
                      goto LABEL_141;
                  }
                }
              }
LABEL_152:
              ctf_dprintf("%lu total types processed\n", v39, v40, v41, v42, v43, v44, v45, *(void *)(a1 + 512));
              int v91 = *(_DWORD *)(a1 + 260);
              BOOL v92 = v91 != 0;
              char v93 = v91 - 1;
              if (!v92) {
                char v93 = 0;
              }
              ctf_dprintf("%u enum names hashed\n", v84, v85, v86, v87, v88, v89, v90, v93);
              int v101 = *(_DWORD *)(a1 + 196);
              BOOL v92 = v101 != 0;
              char v102 = v101 - 1;
              if (!v92) {
                char v102 = 0;
              }
              ctf_dprintf("%u struct names hashed (%d long)\n", v94, v95, v96, v97, v98, v99, v100, v102);
              int v110 = *(_DWORD *)(a1 + 228);
              BOOL v92 = v110 != 0;
              char v111 = v110 - 1;
              if (!v92) {
                char v111 = 0;
              }
              ctf_dprintf("%u union names hashed (%d long)\n", v103, v104, v105, v106, v107, v108, v109, v111);
              int v119 = *(_DWORD *)(a1 + 292);
              BOOL v92 = v119 != 0;
              char v120 = v119 - 1;
              if (!v92) {
                char v120 = 0;
              }
              ctf_dprintf("%u base type names hashed\n", v112, v113, v114, v115, v116, v117, v118, v120);
              if (*(void *)(a1 + 512))
              {
                unint64_t v121 = 1;
                do
                {
                  int v122 = *(_DWORD *)(*(void *)(a1 + 504) + 4 * v121);
                  if (v122)
                  {
                    BOOL v123 = (unsigned int *)(*(unsigned int *)(*(void *)(a1 + 496) + 4 * v121) + *(void *)(a1 + 464));
                    uint64_t v124 = *(int *)(a1 + 564) > 3 ? v123[1] : *((unsigned __int16 *)v123 + 2);
                    if ((**(unsigned int (***)(uint64_t))a1)(v124) == 10)
                    {
                      unint64_t v125 = *v123;
                      uint64_t v126 = a1 + 16 * (v125 >> 31);
                      uint64_t v127 = *(void *)(v126 + 424);
                      if (v127)
                      {
                        unint64_t v128 = v125 & 0x7FFFFFFF;
                        uint64_t v129 = (const char *)(v127 + v128);
                        if (*(void *)(v126 + 432) <= v128) {
                          id v130 = 0;
                        }
                        else {
                          id v130 = v129;
                        }
                      }
                      else
                      {
                        id v130 = 0;
                      }
                      if (!v130) {
                        id v130 = "(?)";
                      }
                      if (!*v130)
                      {
                        uint64_t v131 = *(int *)(a1 + 564) > 3 ? v123[2] : *((unsigned __int16 *)v123 + 3);
                        if (v14 == (*(unsigned int (**)(uint64_t))(*(void *)a1 + 32))(v131))
                        {
                          uint64_t v132 = *(int *)(a1 + 564) > 3 ? v123[2] : *((unsigned __int16 *)v123 + 3);
                          if (*(void *)(a1 + 512) >= (unint64_t)(*(unsigned int (**)(uint64_t))(*(void *)a1 + 40))(v132))
                          {
                            if (*(int *)(a1 + 564) > 3) {
                              uint64_t v133 = v123[2];
                            }
                            else {
                              uint64_t v133 = *((unsigned __int16 *)v123 + 3);
                            }
                            uint64_t v134 = *(void *)(a1 + 504);
                            *(_DWORD *)(v134
                                      + 4 * (*(unsigned int (**)(uint64_t))(*(void *)a1 + 40))(v133)) = v122;
                          }
                        }
                      }
                    }
                  }
                  uint64_t result = 0;
                  BOOL v92 = v121++ >= *(void *)(a1 + 512);
                }
                while (!v92);
              }
              else
              {
                return 0;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void ctf_close(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    ctf_dprintf("ctf_close(%p) refcnt=%u\n", a2, a3, a4, a5, a6, a7, a8, a1);
    unsigned int v9 = *(_DWORD *)(a1 + 552);
    if (v9 < 2)
    {
      if (*(void *)(a1 + 528)) {
        ctf_close();
      }
      uint64_t v10 = *(unsigned int **)(a1 + 584);
      if (v10)
      {
        do
        {
          uint64_t v11 = *(unsigned int **)v10;
          ctf_dtd_delete((void *)a1, v10);
          uint64_t v10 = v11;
        }
        while (v11);
      }
      free(*(void **)(a1 + 568));
      if (*(unsigned char *)(a1 + 556))
      {
        unint64_t v12 = *(void *)(a1 + 32);
        if (v12)
        {
          int v13 = getpagesize();
          munmap((void *)(v12 - ((v13 - 1) & v12)), ((v13 - 1) & v12) + *(void *)(a1 + 40));
        }
        unint64_t v14 = *(void *)(a1 + 88);
        if (v14)
        {
          int v15 = getpagesize();
          munmap((void *)(v14 - ((v15 - 1) & v14)), ((v15 - 1) & v14) + *(void *)(a1 + 96));
        }
        unint64_t v16 = *(void *)(a1 + 144);
        if (v16)
        {
          int v17 = getpagesize();
          munmap((void *)(v16 - ((v17 - 1) & v16)), ((v17 - 1) & v16) + *(void *)(a1 + 152));
        }
      }
      unsigned int v18 = *(void **)(a1 + 8);
      if (v18 != &_CTF_NULLSTR && v18 != 0) {
        free(v18);
      }
      uint64_t v20 = *(void **)(a1 + 64);
      if (v20 != &_CTF_NULLSTR && v20) {
        free(v20);
      }
      uint64_t v21 = *(void **)(a1 + 120);
      if (v21 != &_CTF_NULLSTR && v21) {
        free(v21);
      }
      int v22 = *(void **)(a1 + 456);
      if (v22 && v22 != *(void **)(a1 + 32)) {
        munmap(v22, *(void *)(a1 + 472));
      }
      uint64_t v23 = *(void **)(a1 + 480);
      if (v23) {
        free(v23);
      }
      unsigned int v24 = *(void **)(a1 + 496);
      if (v24) {
        free(v24);
      }
      uint64_t v25 = *(void **)(a1 + 504);
      if (v25) {
        free(v25);
      }
      ctf_hash_destroy(a1 + 176);
      ctf_hash_destroy(a1 + 208);
      ctf_hash_destroy(a1 + 240);
      ctf_hash_destroy(a1 + 272);
      free((void *)a1);
    }
    else
    {
      *(_DWORD *)(a1 + 552) = v9 - 1;
    }
  }
}

uint64_t lsize_sent_v4()
{
  return 0xFFFFFFFFLL;
}

uint64_t max_size_v4()
{
  return 4294967294;
}

uint64_t index_to_type_v4(uint64_t result, int a2)
{
  if (a2) {
    return result | 0x80000000;
  }
  else {
    return result;
  }
}

uint64_t type_to_index_v4(int a1)
{
  return a1 & 0x7FFFFFFF;
}

uint64_t is_child_v4(unint64_t a1)
{
  return (a1 >> 31) & 1;
}

BOOL is_parent_v4(int a1)
{
  return a1 >= 0;
}

uint64_t get_vlen_v2(__int16 a1)
{
  return a1 & 0x3FF;
}

uint64_t get_root_v2(unsigned int a1)
{
  return (a1 >> 10) & 1;
}

uint64_t get_kind_v2(unsigned __int16 a1)
{
  return a1 >> 11;
}

uint64_t lsize_sent_v1()
{
  return 0xFFFFLL;
}

uint64_t max_size_v1()
{
  return 65534;
}

uint64_t index_to_type_v1(uint64_t result, int a2)
{
  if (a2) {
    return result | 0x8000;
  }
  else {
    return result;
  }
}

uint64_t type_to_index_v1(__int16 a1)
{
  return a1 & 0x7FFF;
}

BOOL is_child_v1(uint64_t a1)
{
  return a1 >= 0x8000;
}

BOOL is_parent_v1(uint64_t a1)
{
  return a1 < 0x8000;
}

uint64_t get_vlen_v1(__int16 a1)
{
  return a1 & 0x7FF;
}

uint64_t get_root_v1(unsigned int a1)
{
  return (a1 >> 11) & 1;
}

uint64_t get_kind_v1(unsigned __int16 a1)
{
  return a1 >> 12;
}

uint64_t ctf_setmodel(uint64_t a1, int a2)
{
  for (uint64_t i = &_libctf_models; *((_DWORD *)i + 2) != a2; i += 7)
  {
    if (!i[7])
    {
      *(_DWORD *)(a1 + 560) = 22;
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t v4 = 0;
  *(void *)(a1 + 520) = i;
  return v4;
}

uint64_t ctf_parent_file(uint64_t a1)
{
  return *(void *)(a1 + 528);
}

uint64_t ctf_parent_name(uint64_t a1)
{
  return *(void *)(a1 + 544);
}

uint64_t ctf_import(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || a1 == a2) {
    goto LABEL_7;
  }
  if (!a2) {
    goto LABEL_9;
  }
  if (!*(_DWORD *)(a2 + 552))
  {
LABEL_7:
    int v10 = 22;
    goto LABEL_8;
  }
  if (*(void *)(a2 + 520) != *(void *)(a1 + 520))
  {
    int v10 = 1012;
LABEL_8:
    *(_DWORD *)(a1 + 560) = v10;
    return 0xFFFFFFFFLL;
  }
LABEL_9:
  uint64_t v12 = *(void *)(a1 + 528);
  if (v12) {
    ctf_close(v12, a2, a3, a4, a5, a6, a7, a8);
  }
  if (a2)
  {
    *(_DWORD *)(a1 + 556) |= 2u;
    ++*(_DWORD *)(a2 + 552);
  }
  uint64_t result = 0;
  *(void *)(a1 + 528) = a2;
  return result;
}

uint64_t ctf_getmodel(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 520) + 8);
}

uint64_t ctf_setspecific(uint64_t result, uint64_t a2)
{
  *(void *)(result + 624) = a2;
  return result;
}

uint64_t ctf_getspecific(uint64_t a1)
{
  return *(void *)(a1 + 624);
}

void *ctf_data_alloc(size_t a1)
{
  return mmap(0, a1, 3, 4098, -1, 0);
}

uint64_t ctf_data_protect(void *a1, size_t a2)
{
  return mprotect(a1, a2, 1);
}

void *ctf_alloc(size_t a1)
{
  return malloc_type_malloc(a1, 0xCFAB4140uLL);
}

const char *ctf_dprintf(const char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (_libctf_debug)
  {
    unsigned int v9 = result;
    int v10 = (FILE **)MEMORY[0x1E4F143C8];
    fputs("libctf DEBUG: ", (FILE *)*MEMORY[0x1E4F143C8]);
    return (const char *)vfprintf(*v10, v9, &a9);
  }
  return result;
}

uint64_t get_type_ctt_info(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a1 + 564) > 3) {
    return *(unsigned int *)(a2 + 4);
  }
  else {
    return *(unsigned __int16 *)(a2 + 4);
  }
}

uint64_t get_type_ctt_type(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a1 + 564) > 3) {
    return *(unsigned int *)(a2 + 8);
  }
  else {
    return *(unsigned __int16 *)(a2 + 6);
  }
}

uint64_t get_type_ctt_name(uint64_t a1, unsigned int *a2)
{
  return *a2;
}

uint64_t get_type_ctt_size(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a1 + 564) > 3) {
    return *(unsigned int *)(a2 + 8);
  }
  else {
    return *(unsigned __int16 *)(a2 + 6);
  }
}

unint64_t ctf_get_ctt_lsize(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 16;
  uint64_t v3 = 12;
  if (*(int *)(a1 + 564) < 4)
  {
    uint64_t v2 = 12;
    uint64_t v3 = 8;
  }
  return *(unsigned int *)(a2 + v2) | ((unint64_t)*(unsigned int *)(a2 + v3) << 32);
}

unint64_t ctf_get_ctt_size(_DWORD *a1, uint64_t a2, unint64_t *a3, uint64_t *a4)
{
  int v7 = a1[141];
  if (v7 < 2) {
    goto LABEL_15;
  }
  if (v7 > 3) {
    int v9 = *(_DWORD *)(a2 + 8);
  }
  else {
    int v9 = *(unsigned __int16 *)(a2 + 6);
  }
  int v10 = (*(uint64_t (**)(_DWORD *))(*(void *)a1 + 64))(a1);
  int v11 = a1[141];
  if (v9 != v10)
  {
    if (v11 > 3)
    {
      unsigned int v18 = *(_DWORD *)(a2 + 8);
      uint64_t v13 = 12;
LABEL_16:
      unint64_t result = v18;
      if (!a3) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_15:
    unsigned int v18 = *(unsigned __int16 *)(a2 + 6);
    uint64_t v13 = 8;
    goto LABEL_16;
  }
  BOOL v12 = v11 < 4;
  uint64_t v13 = 16;
  uint64_t v14 = 12;
  uint64_t v15 = 8;
  if (!v12) {
    uint64_t v15 = 12;
  }
  uint64_t v16 = *(unsigned int *)(a2 + v15);
  if (!v12) {
    uint64_t v14 = 16;
  }
  unint64_t result = *(unsigned int *)(a2 + v14) | (unint64_t)(v16 << 32);
  if (!v12) {
    uint64_t v13 = 20;
  }
  if (a3) {
LABEL_17:
  }
    *a3 = result;
LABEL_18:
  if (a4) {
    *a4 = v13;
  }
  return result;
}

uint64_t ctf_member_iter(int *a1, uint64_t a2, uint64_t (*a3)(const char *, void, unint64_t, uint64_t), uint64_t a4)
{
  unint64_t v54 = a1;
  uint64_t v7 = ctf_type_resolve((uint64_t)a1, a2);
  if (v7 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v8 = ctf_lookup_by_id((uint64_t)&v54, v7);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  int v10 = v54;
  ctf_get_ctt_size(v54, v8, (unint64_t *)&v53, &v52);
  if (v10[141] > 3) {
    uint64_t v11 = *(unsigned int *)(v9 + 4);
  }
  else {
    uint64_t v11 = *(unsigned __int16 *)(v9 + 4);
  }
  if ((**(unsigned int (***)(uint64_t))v10)(v11) - 8 <= 0xFFFFFFFD)
  {
    a1[140] = 1021;
    return 0xFFFFFFFFLL;
  }
  int v13 = v10[141];
  uint64_t v14 = v52;
  uint64_t v15 = *(uint64_t (**)(void))(*(void *)v10 + 16);
  if (v13 == 1 || v53 < 0x2000)
  {
    if (v13 > 3)
    {
      uint64_t result = v15(*(unsigned int *)(v9 + 4));
      if (result)
      {
        int v43 = result;
        uint64_t v44 = (unsigned int *)(v14 + v9);
        do
        {
          unint64_t v45 = *v44;
          uint64_t v46 = &v10[4 * (v45 >> 31)];
          uint64_t v47 = *((void *)v46 + 53);
          if (v47)
          {
            unint64_t v48 = v45 & 0x7FFFFFFF;
            uint64_t v49 = (const char *)(v47 + v48);
            if (*((void *)v46 + 54) <= v48) {
              unsigned int v50 = 0;
            }
            else {
              unsigned int v50 = v49;
            }
          }
          else
          {
            unsigned int v50 = 0;
          }
          if (v50) {
            unint64_t v51 = v50;
          }
          else {
            unint64_t v51 = "(?)";
          }
          uint64_t result = a3(v51, v44[1], *((unsigned __int16 *)v44 + 4), a4);
          if (result) {
            break;
          }
          v44 += 3;
          --v43;
        }
        while (v43);
      }
    }
    else
    {
      uint64_t result = v15(*(unsigned __int16 *)(v9 + 4));
      if (result)
      {
        int v25 = result;
        uint64_t v26 = (unsigned int *)(v14 + v9);
        do
        {
          unint64_t v27 = *v26;
          uint64_t v28 = &v10[4 * (v27 >> 31)];
          uint64_t v29 = *((void *)v28 + 53);
          if (v29)
          {
            unint64_t v30 = v27 & 0x7FFFFFFF;
            int v31 = (const char *)(v29 + v30);
            if (*((void *)v28 + 54) <= v30) {
              unsigned int v32 = 0;
            }
            else {
              unsigned int v32 = v31;
            }
          }
          else
          {
            unsigned int v32 = 0;
          }
          if (v32) {
            uint64_t v33 = v32;
          }
          else {
            uint64_t v33 = "(?)";
          }
          uint64_t result = a3(v33, *((unsigned __int16 *)v26 + 2), *((unsigned __int16 *)v26 + 3), a4);
          if (result) {
            break;
          }
          v26 += 2;
          --v25;
        }
        while (v25);
      }
    }
  }
  else if (v13 > 3)
  {
    uint64_t result = v15(*(unsigned int *)(v9 + 4));
    if (result)
    {
      int v34 = result;
      int v35 = (unsigned int *)(v14 + v9);
      do
      {
        unint64_t v36 = *v35;
        char v37 = &v10[4 * (v36 >> 31)];
        uint64_t v38 = *((void *)v37 + 53);
        if (v38)
        {
          unint64_t v39 = v36 & 0x7FFFFFFF;
          uint64_t v40 = (const char *)(v38 + v39);
          if (*((void *)v37 + 54) <= v39) {
            uint64_t v41 = 0;
          }
          else {
            uint64_t v41 = v40;
          }
        }
        else
        {
          uint64_t v41 = 0;
        }
        if (v41) {
          uint64_t v42 = v41;
        }
        else {
          uint64_t v42 = "(?)";
        }
        uint64_t result = a3(v42, v35[1], v35[3] | ((unint64_t)v35[2] << 32), a4);
        if (result) {
          break;
        }
        v35 += 4;
        --v34;
      }
      while (v34);
    }
  }
  else
  {
    uint64_t result = v15(*(unsigned __int16 *)(v9 + 4));
    if (result)
    {
      int v16 = result;
      int v17 = (unsigned int *)(v14 + v9);
      do
      {
        unint64_t v18 = *v17;
        uint64_t v19 = &v10[4 * (v18 >> 31)];
        uint64_t v20 = *((void *)v19 + 53);
        if (v20)
        {
          unint64_t v21 = v18 & 0x7FFFFFFF;
          int v22 = (const char *)(v20 + v21);
          if (*((void *)v19 + 54) <= v21) {
            uint64_t v23 = 0;
          }
          else {
            uint64_t v23 = v22;
          }
        }
        else
        {
          uint64_t v23 = 0;
        }
        if (v23) {
          unsigned int v24 = v23;
        }
        else {
          unsigned int v24 = "(?)";
        }
        uint64_t result = a3(v24, *((unsigned __int16 *)v17 + 2), v17[3] | ((unint64_t)v17[2] << 32), a4);
        if (result) {
          break;
        }
        v17 += 4;
        --v16;
      }
      while (v16);
    }
  }
  return result;
}

uint64_t ctf_type_resolve(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = a2;
  uint64_t v5 = a2;
  while (1)
  {
    uint64_t v6 = v4;
    uint64_t v7 = ctf_lookup_by_id((uint64_t)&v21, v4);
    if (!v7) {
      break;
    }
    uint64_t v8 = v7;
    uint64_t v9 = v21;
    if (*(int *)(v21 + 564) > 3) {
      uint64_t v10 = *(unsigned int *)(v7 + 4);
    }
    else {
      uint64_t v10 = *(unsigned __int16 *)(v7 + 4);
    }
    if ((**(unsigned int (***)(uint64_t))v21)(v10) - 10 > 3) {
      return v6;
    }
    if (*(int *)(v9 + 564) > 3) {
      uint64_t v4 = *(unsigned int *)(v8 + 8);
    }
    else {
      uint64_t v4 = *(unsigned __int16 *)(v8 + 6);
    }
    BOOL v19 = v6 == v4 || v4 == a2 || v5 == v4;
    uint64_t v5 = v6;
    if (v19)
    {
      ctf_dprintf("type %ld cycle detected\n", v11, v12, v13, v14, v15, v16, v17, a2);
      *(_DWORD *)(a1 + 560) = 1007;
      return -1;
    }
  }
  return -1;
}

uint64_t ctf_enum_iter(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, void, uint64_t), uint64_t a4)
{
  int v25 = (_DWORD *)a1;
  uint64_t v7 = ctf_type_resolve(a1, a2);
  if (v7 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v24 = 0;
  uint64_t v8 = ctf_lookup_by_id((uint64_t)&v25, v7);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  uint64_t v10 = v25;
  if ((int)v25[141] > 3) {
    uint64_t v11 = *(unsigned int *)(v8 + 4);
  }
  else {
    uint64_t v11 = *(unsigned __int16 *)(v8 + 4);
  }
  if ((**(unsigned int (***)(uint64_t))v25)(v11) != 8)
  {
    *(_DWORD *)(a1 + 560) = 1022;
    return 0xFFFFFFFFLL;
  }
  ctf_get_ctt_size(v10, v9, 0, &v24);
  if ((int)v10[141] > 3) {
    uint64_t v12 = *(unsigned int *)(v9 + 4);
  }
  else {
    uint64_t v12 = *(unsigned __int16 *)(v9 + 4);
  }
  uint64_t v14 = v24;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 16))(v12);
  if (result)
  {
    int v15 = result;
    for (uint64_t i = (unsigned int *)(v14 + v9); ; i += 2)
    {
      unint64_t v17 = *i;
      unint64_t v18 = &v10[4 * (v17 >> 31)];
      uint64_t v19 = *((void *)v18 + 53);
      if (v19)
      {
        unint64_t v20 = v17 & 0x7FFFFFFF;
        uint64_t v21 = v19 + v20;
        int v22 = *((void *)v18 + 54) <= v20 ? 0 : (const char *)v21;
      }
      else
      {
        int v22 = 0;
      }
      uint64_t v23 = v22 ? (char *)v22 : "(?)";
      uint64_t result = a3(v23, i[1], a4);
      if (result) {
        break;
      }
      if (!--v15) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t ctf_type_iter(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 512);
  if (v3 >= 1)
  {
    uint64_t v7 = -v3;
    uint64_t v8 = 1;
    uint64_t v9 = (*(_DWORD *)(a1 + 556) >> 1) & 1;
    do
    {
      uint64_t v10 = *(unsigned int *)(*(void *)(a1 + 496) + 4 * v8) + *(void *)(a1 + 464);
      if (*(int *)(a1 + 564) > 3)
      {
        if ((*(_DWORD *)(v10 + 4) & 0x400) != 0)
        {
LABEL_7:
          uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 48))(v8, v9);
          uint64_t result = a2(v11, a3);
          if (result) {
            return result;
          }
        }
      }
      else if ((*(_WORD *)(v10 + 4) & 0x400) != 0)
      {
        goto LABEL_7;
      }
      ++v8;
    }
    while (v7 + v8 != 1);
  }
  return 0;
}

uint64_t ctf_type_lname(_DWORD *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result = -1;
  if (a1 || a2 != -1)
  {
    uint64_t v20 = 0;
    long long v24 = 0u;
    memset(v17, 0, sizeof(v17));
    uint64_t v18 = -1;
    uint64_t v19 = -1;
    uint64_t v21 = a3;
    uint64_t v22 = a3;
    uint64_t v23 = a3 + a4;
    ctf_decl_push(v17, a1, a2);
    if (DWORD2(v24))
    {
      ctf_decl_fini((uint64_t)v17);
      a1[140] = DWORD2(v24);
      return -1;
    }
    else
    {
      uint64_t v7 = 0;
      if (SHIDWORD(v18) > 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = 0xFFFFFFFFLL;
      }
      uint64_t v9 = 2;
      if ((int)v19 > 2) {
        uint64_t v8 = 2;
      }
      unint64_t v14 = a4;
      uint64_t v15 = v8;
      if ((int)v19 <= 2) {
        uint64_t v9 = 0xFFFFFFFFLL;
      }
      if (SHIDWORD(v18) > 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v9;
      }
      int v11 = 3;
      do
      {
        for (uint64_t i = *((void *)&v17[v7] + 1); i; uint64_t i = *(void *)(i + 8))
        {
          uint64_t v16 = a1;
          ctf_lookup_by_id((uint64_t)&v16, *(void *)(i + 16));
          if ((v11 - 5) <= 0xFFFFFFFD) {
            ctf_decl_sprintf(v17, " ");
          }
          if (v7 == v10)
          {
            ctf_decl_sprintf(v17, "(");
            uint64_t v10 = 0xFFFFFFFFLL;
          }
          switch(*(_DWORD *)(i + 24))
          {
            case 1:
            case 2:
            case 0xA:
              ctf_decl_sprintf(v17, "%s");
              break;
            case 3:
              ctf_decl_sprintf(v17, "*", v13);
              break;
            case 4:
              ctf_decl_sprintf(v17, "[%u]");
              break;
            case 5:
              ctf_decl_sprintf(v17, "()", v13);
              break;
            case 6:
            case 9:
              ctf_decl_sprintf(v17, "struct %s");
              break;
            case 7:
              ctf_decl_sprintf(v17, "union %s");
              break;
            case 8:
              ctf_decl_sprintf(v17, "enum %s");
              break;
            case 0xB:
              ctf_decl_sprintf(v17, "volatile", v13);
              break;
            case 0xC:
              ctf_decl_sprintf(v17, "const", v13);
              break;
            case 0xD:
              ctf_decl_sprintf(v17, "restrict", v13);
              break;
            case 0xE:
              ctf_decl_sprintf(v17, "ptrauth", v13);
              break;
            default:
              break;
          }
          int v11 = *(_DWORD *)(i + 24);
        }
        if (v15 == v7) {
          ctf_decl_sprintf(v17, ")");
        }
        ++v7;
      }
      while (v7 != 4);
      if ((unint64_t)v24 >= v14) {
        a1[140] = 1027;
      }
      ctf_decl_fini((uint64_t)v17);
      return v24;
    }
  }
  return result;
}

char *__cdecl ctf_type_name(ctf_file_t *a1, ctf_id_t a2, char *a3, size_t a4)
{
  size_t v6 = ctf_type_lname(a1, a2, (uint64_t)a3, a4);
  if (v6 >= a4 || (uint64_t)v6 <= -1) {
    return 0;
  }
  else {
    return a3;
  }
}

uint64_t ctf_type_size(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = a1;
  uint64_t result = ctf_type_resolve(a1, a2);
  if (result == -1) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = ctf_lookup_by_id((uint64_t)&v11, result);
  if (!v4) {
    return -1;
  }
  uint64_t v5 = v4;
  uint64_t v6 = v11;
  if (*(int *)(v11 + 564) > 3) {
    uint64_t v7 = *(unsigned int *)(v4 + 4);
  }
  else {
    uint64_t v7 = *(unsigned __int16 *)(v4 + 4);
  }
  int v8 = (**(uint64_t (***)(uint64_t))v11)(v7);
  if (v8 <= 4)
  {
    if (v8 != 3)
    {
      if (v8 == 4)
      {
        uint64_t result = ctf_get_ctt_size((_DWORD *)v6, v5, 0, 0);
        if (result > 0) {
          return result;
        }
        v9[0] = 0;
        v9[1] = 0;
        uint64_t v10 = 0;
        if (ctf_array_info((_DWORD *)v6, v3, (uint64_t)v9) != -1)
        {
          uint64_t result = ctf_type_size(v6, v9[0]);
          if (result != -1) {
            result *= v10;
          }
          return result;
        }
        return -1;
      }
      goto LABEL_19;
    }
    return *(void *)(*(void *)(v6 + 520) + 16);
  }
  if (v8 == 5) {
    return 0;
  }
  if (v8 == 14) {
    return *(void *)(*(void *)(v6 + 520) + 16);
  }
LABEL_19:
  return ctf_get_ctt_size((_DWORD *)v6, v5, 0, 0);
}

uint64_t ctf_array_info(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = 0;
  unint64_t v14 = a1;
  uint64_t v5 = ctf_lookup_by_id((uint64_t)&v14, a2);
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  uint64_t v7 = v14;
  if ((int)v14[141] > 3) {
    uint64_t v8 = *(unsigned int *)(v5 + 4);
  }
  else {
    uint64_t v8 = *(unsigned __int16 *)(v5 + 4);
  }
  if ((**(unsigned int (***)(uint64_t))v14)(v8) != 4)
  {
    a1[140] = 1025;
    return 0xFFFFFFFFLL;
  }
  ctf_get_ctt_size(v7, v6, 0, &v13);
  uint64_t v9 = (unsigned __int16 *)(v13 + v6);
  uint64_t result = 0;
  if (v7[141] == 4)
  {
    *(void *)&long long v11 = *(void *)v9;
    *((void *)&v11 + 1) = HIDWORD(*(void *)v9);
    *(_OWORD *)a3 = v11;
    int v12 = *((_DWORD *)v9 + 2);
  }
  else
  {
    *(void *)a3 = *v9;
    *(void *)(a3 + 8) = v9[1];
    int v12 = *((_DWORD *)v9 + 1);
  }
  *(_DWORD *)(a3 + 16) = v12;
  return result;
}

unint64_t ctf_type_align(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    uint64_t v29 = (_DWORD *)a1;
    unint64_t v2 = ctf_type_resolve(a1, a2);
    if (v2 == -1) {
      return v2;
    }
    uint64_t v3 = ctf_lookup_by_id((uint64_t)&v29, v2);
    if (!v3) {
      return -1;
    }
    uint64_t v4 = v3;
    uint64_t v5 = v29;
    uint64_t v6 = (int)v29[141] > 3 ? *(unsigned int *)(v3 + 4) : *(unsigned __int16 *)(v3 + 4);
    unsigned int v7 = (**(uint64_t (***)(uint64_t))v29)(v6);
    if (v7 > 0xE) {
      break;
    }
    if (((1 << v7) & 0x4028) != 0) {
      return *(void *)(*((void *)v5 + 65) + 16);
    }
    if (((1 << v7) & 0xC0) != 0)
    {
      if ((int)v5[141] > 3) {
        uint64_t v8 = *(unsigned int *)(v4 + 4);
      }
      else {
        uint64_t v8 = *(unsigned __int16 *)(v4 + 4);
      }
      int v10 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 16))(v8);
      uint64_t v27 = 0;
      v28[0] = 0;
      ctf_get_ctt_size(v5, v4, v28, &v27);
      if ((int)v5[141] > 3) {
        uint64_t v11 = *(unsigned int *)(v4 + 4);
      }
      else {
        uint64_t v11 = *(unsigned __int16 *)(v4 + 4);
      }
      uint64_t v12 = v27;
      if ((**(unsigned int (***)(uint64_t))v5)(v11) == 6) {
        int v13 = v10 != 0;
      }
      else {
        int v13 = v10;
      }
      int v14 = v5[141];
      if (v14 == 1 || (uint64_t)v28[0] < 0x2000)
      {
        if (v14 == 4)
        {
          if (v13)
          {
            unint64_t v2 = 0;
            uint64_t v18 = (unsigned int *)(v12 + v4 + 4);
            do
            {
              unsigned int v19 = *v18;
              v18 += 3;
              unint64_t v20 = ctf_type_align(v5, v19);
              if (v2 <= v20) {
                unint64_t v2 = v20;
              }
              --v13;
            }
            while (v13);
            return v2;
          }
        }
        else if (v13)
        {
          unint64_t v2 = 0;
          long long v24 = (unsigned __int16 *)(v12 + v4 + 4);
          do
          {
            unsigned int v25 = *v24;
            v24 += 4;
            unint64_t v26 = ctf_type_align(v5, v25);
            if (v2 <= v26) {
              unint64_t v2 = v26;
            }
            --v13;
          }
          while (v13);
          return v2;
        }
      }
      else if (v14 == 4)
      {
        if (v13)
        {
          unint64_t v2 = 0;
          uint64_t v15 = (unsigned int *)(v12 + v4 + 4);
          do
          {
            unsigned int v16 = *v15;
            v15 += 4;
            unint64_t v17 = ctf_type_align(v5, v16);
            if (v2 <= v17) {
              unint64_t v2 = v17;
            }
            --v13;
          }
          while (v13);
          return v2;
        }
      }
      else if (v13)
      {
        unint64_t v2 = 0;
        uint64_t v21 = (unsigned __int16 *)(v12 + v4 + 4);
        do
        {
          unsigned int v22 = *v21;
          v21 += 8;
          unint64_t v23 = ctf_type_align(v5, v22);
          if (v2 <= v23) {
            unint64_t v2 = v23;
          }
          --v13;
        }
        while (v13);
        return v2;
      }
      return 0;
    }
    if (v7 != 4) {
      break;
    }
    memset(v28, 0, sizeof(v28));
    if (ctf_array_info(v5, v2, (uint64_t)v28) == -1) {
      return -1;
    }
    a2 = v28[0];
    a1 = (uint64_t)v5;
  }
  return ctf_get_ctt_size(v5, v4, 0, 0);
}

uint64_t ctf_type_kind(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1;
  uint64_t v2 = ctf_lookup_by_id((uint64_t)&v5, a2);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  if (*(int *)(v5 + 564) > 3) {
    uint64_t v3 = *(unsigned int *)(v2 + 4);
  }
  else {
    uint64_t v3 = *(unsigned __int16 *)(v2 + 4);
  }
  return (**(uint64_t (***)(uint64_t))v5)(v3);
}

uint64_t ctf_type_reference(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = a1;
  uint64_t v3 = ctf_lookup_by_id((uint64_t)&v11, a2);
  if (!v3) {
    return -1;
  }
  uint64_t v4 = v3;
  uint64_t v5 = v11;
  if (*(int *)(v11 + 564) > 3) {
    uint64_t v6 = *(unsigned int *)(v3 + 4);
  }
  else {
    uint64_t v6 = *(unsigned __int16 *)(v3 + 4);
  }
  int v7 = (**(uint64_t (***)(uint64_t))v11)(v6);
  if ((v7 - 10) >= 5 && v7 != 3)
  {
    *(_DWORD *)(a1 + 560) = 1026;
    return -1;
  }
  if (*(int *)(v5 + 564) > 3) {
    return *(unsigned int *)(v4 + 8);
  }
  else {
    return *(unsigned __int16 *)(v4 + 6);
  }
}

uint64_t ctf_type_pointer(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = (void *)a1;
  if (!ctf_lookup_by_id((uint64_t)&v11, a2)) {
    return -1;
  }
  uint64_t v4 = (uint64_t)v11;
  uint64_t v5 = v11[63];
  if (!*(_DWORD *)(v5 + 4 * (*(unsigned int (**)(uint64_t))(*v11 + 40))(a2)))
  {
    uint64_t v8 = ctf_type_resolve(v4, a2);
    if (v8 == -1
      || (uint64_t v9 = v8, !ctf_lookup_by_id((uint64_t)&v11, v8))
      || (uint64_t v4 = (uint64_t)v11,
          uint64_t v10 = v11[63],
          !*(_DWORD *)(v10 + 4 * (*(unsigned int (**)(uint64_t))(*v11 + 40))(v9))))
    {
      *(_DWORD *)(a1 + 560) = 1028;
      return -1;
    }
  }
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)v4 + 48);
  return v6();
}

uint64_t ctf_type_encoding(uint64_t (***a1)(uint64_t), uint64_t a2, unsigned int *a3)
{
  uint64_t v12 = 0;
  int v13 = a1;
  uint64_t v5 = ctf_lookup_by_id((uint64_t)&v13, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = v13;
    ctf_get_ctt_size(v13, v5, 0, &v12);
    if (*((int *)v7 + 141) > 3) {
      uint64_t v8 = *(unsigned int *)(v6 + 4);
    }
    else {
      uint64_t v8 = *(unsigned __int16 *)(v6 + 4);
    }
    int v9 = (**v7)(v8);
    if (v9 == 2 || v9 == 1)
    {
      uint64_t result = 0;
      unsigned int v11 = *(_DWORD *)(v12 + v6);
      *a3 = HIBYTE(v11);
      a3[1] = BYTE2(v11);
      a3[2] = (unsigned __int16)v11;
      return result;
    }
    *((_DWORD *)a1 + 140) = 1024;
  }
  return 0xFFFFFFFFLL;
}

uint64_t ctf_type_ptrauth(unsigned int (***a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = a1;
  uint64_t v5 = ctf_lookup_by_id((uint64_t)&v12, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = v12;
    ctf_get_ctt_size(v12, v5, 0, &v11);
    if (*((int *)v7 + 141) > 3) {
      uint64_t v8 = *(unsigned int *)(v6 + 4);
    }
    else {
      uint64_t v8 = *(unsigned __int16 *)(v6 + 4);
    }
    if ((**v7)(v8) == 14)
    {
      uint64_t result = 0;
      int v10 = *(_DWORD *)(v11 + v6);
      *(unsigned char *)a3 = BYTE2(v10);
      *(_WORD *)(a3 + 2) = v10;
      *(unsigned char *)(a3 + 4) = (v10 & 0xFF000000) != 0;
      return result;
    }
    *((_DWORD *)a1 + 140) = 1046;
  }
  return 0xFFFFFFFFLL;
}

uint64_t ctf_type_cmp(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a2 < a4) {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v4 = a2 > a4;
  }
  if (a1 != a3)
  {
    uint64_t v6 = a3;
    unint64_t v7 = (unint64_t)a1;
    if ((*(unsigned int (**)(uint64_t))(*a1 + 24))(a2) && *(void *)(v7 + 528)) {
      unint64_t v7 = *(void *)(v7 + 528);
    }
    if ((*(unsigned int (**)(uint64_t))(*v6 + 24))(a4) && v6[66]) {
      uint64_t v6 = (void *)v6[66];
    }
    if (v7 > (unint64_t)v6) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = v4;
    }
    if (v7 >= (unint64_t)v6) {
      return v8;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return v4;
}

uint64_t ctf_type_compat(uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t (***a3)(uint64_t), uint64_t a4)
{
  return ctf_type_compat_helper(a1, a2, a3, a4, 1);
}

uint64_t ctf_type_compat_helper(uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t (***a3)(uint64_t), uint64_t a4, int a5)
{
  while (1)
  {
    int v5 = a5;
    uint64_t v6 = a4;
    uint64_t v7 = (uint64_t)a3;
    uint64_t v8 = a2;
    uint64_t v9 = (uint64_t)a1;
    uint64_t v49 = a3;
    unsigned int v50 = a1;
    if (!ctf_type_cmp(a1, a2, a3, a4)) {
      return 1;
    }
    int v48 = 0;
    uint64_t v47 = 0;
    uint64_t v45 = 0;
    unsigned int v46 = 0;
    uint64_t v10 = ctf_type_resolve(v9, v8);
    int v11 = ctf_type_kind(v9, v10);
    uint64_t v12 = ctf_type_resolve(v7, v6);
    int v13 = ctf_type_kind(v7, v12);
    int v14 = (unsigned int *)ctf_lookup_by_id((uint64_t)&v50, v10);
    uint64_t v15 = ctf_lookup_by_id((uint64_t)&v49, v12);
    if (v5)
    {
      unsigned int v16 = (unsigned int *)v15;
      uint64_t result = 0;
      if (v11 != v13 || !v14 || !v16) {
        return result;
      }
      unint64_t v18 = *v14;
      unsigned int v19 = &v50[2 * (v18 >> 31)];
      unint64_t v20 = v19[53];
      if (v20)
      {
        unint64_t v21 = v18 & 0x7FFFFFFF;
        uint64_t v22 = (uint64_t)v20 + v21;
        unint64_t v23 = (unint64_t)v19[54] <= v21 ? 0 : (const char *)v22;
      }
      else
      {
        unint64_t v23 = 0;
      }
      long long v24 = v23 ? v23 : "(?)";
      unint64_t v25 = *v16;
      unint64_t v26 = &v49[2 * (v25 >> 31)];
      uint64_t v27 = v26[53];
      if (v27)
      {
        unint64_t v28 = v25 & 0x7FFFFFFF;
        uint64_t v29 = (uint64_t)v27 + v28;
        unint64_t v30 = (unint64_t)v26[54] <= v28 ? 0 : (const char *)v29;
      }
      else
      {
        unint64_t v30 = 0;
      }
      int v31 = v30 ? v30 : "(?)";
      if (strcmp(v24, v31)) {
        return 0;
      }
    }
    uint64_t result = 1;
    switch(v11)
    {
      case 1:
      case 2:
        if (ctf_type_encoding(v50, v10, (unsigned int *)&v47)
          || ctf_type_encoding(v49, v12, (unsigned int *)&v45))
        {
          return 0;
        }
        return v47 == v45 && v48 == (unint64_t)v46;
      case 3:
        goto LABEL_42;
      case 4:
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        int v34 = v50;
        if (ctf_array_info(v50, v10, (uint64_t)&v42)) {
          return 0;
        }
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        int v35 = v49;
        if (ctf_array_info(v49, v12, (uint64_t)&v39) || v44 != v41) {
          return 0;
        }
        uint64_t result = ctf_type_compat_helper(v34, v42, v35, v39, 1);
        if (!result) {
          return result;
        }
        a2 = v43;
        a4 = v40;
        a1 = v34;
        a3 = v35;
        goto LABEL_45;
      case 6:
      case 7:
        uint64_t v33 = ctf_type_size((uint64_t)v50, v10);
        return v33 == ctf_type_size((uint64_t)v49, v12);
      case 8:
      case 9:
        return result;
      case 14:
        uint64_t v10 = ctf_type_reference((uint64_t)v50, v10);
LABEL_42:
        unint64_t v36 = v49;
        if (v13 == 14) {
          uint64_t v12 = ctf_type_reference((uint64_t)v49, v12);
        }
        char v37 = v50;
        uint64_t v38 = ctf_type_reference((uint64_t)v50, v10);
        a4 = ctf_type_reference((uint64_t)v36, v12);
        a1 = v37;
        a2 = v38;
        a3 = v36;
LABEL_45:
        a5 = 1;
        break;
      default:
        return 0;
    }
  }
}

uint64_t ctf_type_printf_compat(uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t (***a3)(uint64_t), uint64_t a4)
{
  return ctf_type_compat_helper(a1, a2, a3, a4, 0);
}

uint64_t ctf_member_info(int *a1, uint64_t a2, const char *a3, void *a4)
{
  return _ctf_member_info(a1, a2, a3, 0, a4);
}

uint64_t _ctf_member_info(int *a1, uint64_t a2, const char *a3, uint64_t a4, void *a5)
{
  uint64_t v66 = a1;
  uint64_t v9 = ctf_type_resolve((uint64_t)a1, a2);
  if (v9 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v10 = ctf_lookup_by_id((uint64_t)&v66, v9);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = v10;
  uint64_t v12 = v66;
  ctf_get_ctt_size(v66, v10, (unint64_t *)&v65, &v64);
  if (v12[141] > 3) {
    uint64_t v13 = *(unsigned int *)(v11 + 4);
  }
  else {
    uint64_t v13 = *(unsigned __int16 *)(v11 + 4);
  }
  if ((**(unsigned int (***)(uint64_t))v12)(v13) - 8 > 0xFFFFFFFD)
  {
    int v15 = v12[141];
    if (v15 == 1 || v65 < 0x2000)
    {
      if (v15 == 4)
      {
        uint64_t v28 = v64;
        int v29 = (*(uint64_t (**)(void))(*(void *)v12 + 16))(*(unsigned int *)(v11 + 4));
        if (v29)
        {
          int v30 = v29;
          uint64_t v31 = v28 + v11;
          while (1)
          {
            unsigned int v32 = *(_DWORD *)v31;
            if (!*(_DWORD *)v31)
            {
              uint64_t result = _ctf_member_info(v12, *(unsigned int *)(v31 + 4), a3, *(unsigned __int16 *)(v31 + 8) + a4, a5);
              if (!result) {
                return result;
              }
              unsigned int v32 = *(_DWORD *)v31;
            }
            uint64_t v33 = v32 >> 31;
            uint64_t v34 = *(void *)&v12[4 * v33 + 106];
            if (v34)
            {
              unint64_t v35 = v32 & 0x7FFFFFFF;
              uint64_t v36 = v34 + v35;
              char v37 = *(void *)&v12[4 * v33 + 108] <= v35 ? 0 : (const char *)v36;
            }
            else
            {
              char v37 = 0;
            }
            uint64_t v38 = v37 ? v37 : "(?)";
            uint64_t result = strcmp(v38, a3);
            if (!result) {
              break;
            }
            v31 += 12;
            if (!--v30) {
              goto LABEL_81;
            }
          }
          *a5 = *(unsigned int *)(v31 + 4);
          unint64_t v63 = *(unsigned __int16 *)(v31 + 8);
          goto LABEL_90;
        }
      }
      else
      {
        if (v15 > 3) {
          uint64_t v40 = *(unsigned int *)(v11 + 4);
        }
        else {
          uint64_t v40 = *(unsigned __int16 *)(v11 + 4);
        }
        uint64_t v51 = v64;
        int v52 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 16))(v40);
        if (v52)
        {
          int v53 = v52;
          uint64_t v54 = v51 + v11;
          while (1)
          {
            unsigned int v55 = *(_DWORD *)v54;
            if (!*(_DWORD *)v54)
            {
              uint64_t result = _ctf_member_info(v12, *(unsigned __int16 *)(v54 + 4), a3, *(unsigned __int16 *)(v54 + 6) + a4, a5);
              if (!result) {
                return result;
              }
              unsigned int v55 = *(_DWORD *)v54;
            }
            uint64_t v56 = v55 >> 31;
            uint64_t v57 = *(void *)&v12[4 * v56 + 106];
            if (v57)
            {
              unint64_t v58 = v55 & 0x7FFFFFFF;
              uint64_t v59 = v57 + v58;
              long long v60 = *(void *)&v12[4 * v56 + 108] <= v58 ? 0 : (const char *)v59;
            }
            else
            {
              long long v60 = 0;
            }
            uint64_t v61 = v60 ? v60 : "(?)";
            uint64_t result = strcmp(v61, a3);
            if (!result) {
              break;
            }
            v54 += 8;
            if (!--v53) {
              goto LABEL_81;
            }
          }
          *a5 = *(unsigned __int16 *)(v54 + 4);
          unint64_t v63 = *(unsigned __int16 *)(v54 + 6);
          goto LABEL_90;
        }
      }
    }
    else if (v15 == 4)
    {
      uint64_t v16 = v64;
      int v17 = (*(uint64_t (**)(void))(*(void *)v12 + 16))(*(unsigned int *)(v11 + 4));
      if (v17)
      {
        int v18 = v17;
        unsigned int v19 = (unsigned int *)(v16 + v11);
        while (1)
        {
          unsigned int v20 = *v19;
          if (!*v19)
          {
            uint64_t result = _ctf_member_info(v12, 0, a3, (v19[3] | ((unint64_t)v19[2] << 32)) + a4, a5);
            if (!result) {
              return result;
            }
            unsigned int v20 = *v19;
          }
          uint64_t v22 = v20 >> 31;
          uint64_t v23 = *(void *)&v12[4 * v22 + 106];
          if (v23)
          {
            unint64_t v24 = v20 & 0x7FFFFFFF;
            uint64_t v25 = v23 + v24;
            unint64_t v26 = *(void *)&v12[4 * v22 + 108] <= v24 ? 0 : (const char *)v25;
          }
          else
          {
            unint64_t v26 = 0;
          }
          uint64_t v27 = v26 ? v26 : "(?)";
          uint64_t result = strcmp(v27, a3);
          if (!result) {
            break;
          }
          v19 += 4;
          if (!--v18) {
            goto LABEL_81;
          }
        }
        uint64_t v62 = v19[1];
LABEL_88:
        *a5 = v62;
        unint64_t v63 = v19[3] | ((unint64_t)v19[2] << 32);
LABEL_90:
        a5[1] = v63 + a4;
        return result;
      }
    }
    else
    {
      if (v15 > 3) {
        uint64_t v39 = *(unsigned int *)(v11 + 4);
      }
      else {
        uint64_t v39 = *(unsigned __int16 *)(v11 + 4);
      }
      uint64_t v41 = v64;
      int v42 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 16))(v39);
      if (v42)
      {
        int v43 = v42;
        unsigned int v19 = (unsigned int *)(v41 + v11);
        while (1)
        {
          unsigned int v44 = *v19;
          if (!*v19)
          {
            uint64_t result = _ctf_member_info(v12, 0, a3, (v19[3] | ((unint64_t)v19[2] << 32)) + a4, a5);
            if (!result) {
              return result;
            }
            unsigned int v44 = *v19;
          }
          uint64_t v45 = v44 >> 31;
          uint64_t v46 = *(void *)&v12[4 * v45 + 106];
          if (v46)
          {
            unint64_t v47 = v44 & 0x7FFFFFFF;
            uint64_t v48 = v46 + v47;
            uint64_t v49 = *(void *)&v12[4 * v45 + 108] <= v47 ? 0 : (const char *)v48;
          }
          else
          {
            uint64_t v49 = 0;
          }
          unsigned int v50 = v49 ? v49 : "(?)";
          uint64_t result = strcmp(v50, a3);
          if (!result) {
            break;
          }
          v19 += 4;
          if (!--v43) {
            goto LABEL_81;
          }
        }
        uint64_t v62 = *((unsigned __int16 *)v19 + 2);
        goto LABEL_88;
      }
    }
LABEL_81:
    int v14 = 1038;
    goto LABEL_82;
  }
  int v14 = 1021;
LABEL_82:
  a1[140] = v14;
  return 0xFFFFFFFFLL;
}

const char *ctf_enum_name(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v22 = (_DWORD *)a1;
  uint64_t v5 = ctf_type_resolve(a1, a2);
  if (v5 == -1) {
    return 0;
  }
  uint64_t v21 = 0;
  uint64_t result = (const char *)ctf_lookup_by_id((uint64_t)&v22, v5);
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    uint64_t v8 = v22;
    if ((int)v22[141] > 3) {
      uint64_t v9 = *((unsigned int *)result + 1);
    }
    else {
      uint64_t v9 = *((unsigned __int16 *)result + 2);
    }
    if ((**(unsigned int (***)(uint64_t))v22)(v9) == 8)
    {
      ctf_get_ctt_size(v8, v7, 0, &v21);
      if ((int)v8[141] > 3) {
        uint64_t v10 = *(unsigned int *)(v7 + 4);
      }
      else {
        uint64_t v10 = *(unsigned __int16 *)(v7 + 4);
      }
      uint64_t v12 = v21;
      int v13 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 16))(v10);
      if (v13)
      {
        int v14 = (unsigned int *)(v12 + v7);
        while (v14[1] != a3)
        {
          v14 += 2;
          if (!--v13) {
            goto LABEL_16;
          }
        }
        unint64_t v15 = *v14;
        uint64_t v16 = &v8[4 * (v15 >> 31)];
        uint64_t v17 = *((void *)v16 + 53);
        if (v17)
        {
          unint64_t v18 = v15 & 0x7FFFFFFF;
          uint64_t v19 = v17 + v18;
          if (*((void *)v16 + 54) <= v18) {
            uint64_t v20 = 0;
          }
          else {
            uint64_t v20 = v19;
          }
        }
        else
        {
          uint64_t v20 = 0;
        }
        if (v20) {
          return (const char *)v20;
        }
        else {
          return "(?)";
        }
      }
LABEL_16:
      uint64_t result = 0;
      int v11 = 1037;
    }
    else
    {
      uint64_t result = 0;
      int v11 = 1022;
    }
    *(_DWORD *)(a1 + 560) = v11;
  }
  return result;
}

uint64_t ctf_enum_value(uint64_t a1, uint64_t a2, const char *a3, _DWORD *a4)
{
  uint64_t v28 = (_DWORD *)a1;
  uint64_t v7 = ctf_type_resolve(a1, a2);
  if (v7 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v26 = 0;
  unint64_t v27 = 0;
  uint64_t v8 = ctf_lookup_by_id((uint64_t)&v28, v7);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  uint64_t v10 = v28;
  if ((int)v28[141] > 3) {
    uint64_t v11 = *(unsigned int *)(v8 + 4);
  }
  else {
    uint64_t v11 = *(unsigned __int16 *)(v8 + 4);
  }
  if ((**(unsigned int (***)(uint64_t))v28)(v11) != 8)
  {
    int v13 = 1022;
LABEL_24:
    *(_DWORD *)(a1 + 560) = v13;
    return 0xFFFFFFFFLL;
  }
  ctf_get_ctt_size(v10, v9, &v27, &v26);
  if ((int)v10[141] > 3) {
    uint64_t v12 = *(unsigned int *)(v9 + 4);
  }
  else {
    uint64_t v12 = *(unsigned __int16 *)(v9 + 4);
  }
  uint64_t v14 = v26;
  int v15 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 16))(v12);
  if (!v15)
  {
LABEL_23:
    int v13 = 1037;
    goto LABEL_24;
  }
  int v16 = v15;
  uint64_t v17 = (unsigned int *)(v14 + v9);
  while (1)
  {
    unint64_t v18 = *v17;
    uint64_t v19 = &v10[4 * (v18 >> 31)];
    uint64_t v20 = *((void *)v19 + 53);
    if (v20)
    {
      unint64_t v21 = v18 & 0x7FFFFFFF;
      uint64_t v22 = v20 + v21;
      uint64_t v23 = *((void *)v19 + 54) <= v21 ? 0 : (const char *)v22;
    }
    else
    {
      uint64_t v23 = 0;
    }
    unint64_t v24 = v23 ? v23 : "(?)";
    if (!strcmp(v24, a3)) {
      break;
    }
    v17 += 2;
    if (!--v16) {
      goto LABEL_23;
    }
  }
  uint64_t result = 0;
  if (a4) {
    *a4 = v17[1];
  }
  return result;
}

uint64_t ctf_type_visit(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  return ctf_type_rvisit(a1, a2, a3, a4, (uint64_t)&_CTF_NULLSTR, 0, 0);
}

uint64_t ctf_type_rvisit(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v68 = (_DWORD *)a1;
  uint64_t v13 = ctf_type_resolve(a1, a2);
  if (v13 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v14 = ctf_lookup_by_id((uint64_t)&v68, v13);
  if (!v14) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v15 = v14;
  uint64_t result = a3(a5, a2, a6, a7, a4);
  if (!result)
  {
    uint64_t v17 = v68;
    if ((int)v68[141] > 3) {
      uint64_t v18 = *(unsigned int *)(v15 + 4);
    }
    else {
      uint64_t v18 = *(unsigned __int16 *)(v15 + 4);
    }
    if ((**(unsigned int (***)(uint64_t))v68)(v18) - 8 >= 0xFFFFFFFE)
    {
      ctf_get_ctt_size(v17, v15, (unint64_t *)&v67, &v66);
      int v19 = v17[141];
      if (v19 == 1 || v67 < 0x2000)
      {
        if (v19 == 4)
        {
          uint64_t v31 = v66;
          uint64_t result = (*(uint64_t (**)(void))(*(void *)v17 + 16))(*(unsigned int *)(v15 + 4));
          if (result)
          {
            int v32 = result;
            uint64_t v33 = (a7 + 1);
            uint64_t v34 = (unsigned __int16 *)(v31 + v15 + 8);
            do
            {
              unint64_t v35 = *((unsigned int *)v34 - 2);
              uint64_t v36 = &v17[4 * (v35 >> 31)];
              uint64_t v37 = *((void *)v36 + 53);
              if (v37)
              {
                unint64_t v38 = v35 & 0x7FFFFFFF;
                uint64_t v39 = (const char *)(v37 + v38);
                if (*((void *)v36 + 54) <= v38) {
                  uint64_t v40 = 0;
                }
                else {
                  uint64_t v40 = v39;
                }
              }
              else
              {
                uint64_t v40 = 0;
              }
              if (v40) {
                uint64_t v41 = v40;
              }
              else {
                uint64_t v41 = "(?)";
              }
              uint64_t result = ctf_type_rvisit(v17, *((unsigned int *)v34 - 1), a3, a4, v41, *v34 + a6, v33);
              if (result) {
                break;
              }
              v34 += 6;
              --v32;
            }
            while (v32);
          }
        }
        else
        {
          if (v19 > 3) {
            uint64_t v43 = *(unsigned int *)(v15 + 4);
          }
          else {
            uint64_t v43 = *(unsigned __int16 *)(v15 + 4);
          }
          uint64_t v55 = v66;
          uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 16))(v43);
          if (result)
          {
            int v56 = result;
            uint64_t v57 = (a7 + 1);
            unint64_t v58 = (unsigned __int16 *)(v55 + v15 + 6);
            do
            {
              unint64_t v59 = *(unsigned int *)(v58 - 3);
              long long v60 = &v17[4 * (v59 >> 31)];
              uint64_t v61 = *((void *)v60 + 53);
              if (v61)
              {
                unint64_t v62 = v59 & 0x7FFFFFFF;
                unint64_t v63 = (const char *)(v61 + v62);
                if (*((void *)v60 + 54) <= v62) {
                  uint64_t v64 = 0;
                }
                else {
                  uint64_t v64 = v63;
                }
              }
              else
              {
                uint64_t v64 = 0;
              }
              if (v64) {
                uint64_t v65 = v64;
              }
              else {
                uint64_t v65 = "(?)";
              }
              uint64_t result = ctf_type_rvisit(v17, *(v58 - 1), a3, a4, v65, *v58 + a6, v57);
              if (result) {
                break;
              }
              v58 += 4;
              --v56;
            }
            while (v56);
          }
        }
      }
      else if (v19 == 4)
      {
        uint64_t v20 = v66;
        uint64_t result = (*(uint64_t (**)(void))(*(void *)v17 + 16))(*(unsigned int *)(v15 + 4));
        if (result)
        {
          int v21 = result;
          uint64_t v22 = (a7 + 1);
          uint64_t v23 = (unsigned int *)(v20 + v15 + 8);
          do
          {
            unint64_t v24 = *(v23 - 2);
            uint64_t v25 = &v17[4 * (v24 >> 31)];
            uint64_t v26 = *((void *)v25 + 53);
            if (v26)
            {
              unint64_t v27 = v24 & 0x7FFFFFFF;
              uint64_t v28 = (const char *)(v26 + v27);
              if (*((void *)v25 + 54) <= v27) {
                int v29 = 0;
              }
              else {
                int v29 = v28;
              }
            }
            else
            {
              int v29 = 0;
            }
            if (v29) {
              int v30 = v29;
            }
            else {
              int v30 = "(?)";
            }
            uint64_t result = ctf_type_rvisit(v17, *(v23 - 1), a3, a4, v30, (v23[1] | ((unint64_t)*v23 << 32)) + a6, v22);
            if (result) {
              break;
            }
            v23 += 4;
            --v21;
          }
          while (v21);
        }
      }
      else
      {
        if (v19 > 3) {
          uint64_t v42 = *(unsigned int *)(v15 + 4);
        }
        else {
          uint64_t v42 = *(unsigned __int16 *)(v15 + 4);
        }
        uint64_t v44 = v66;
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 16))(v42);
        if (result)
        {
          int v45 = result;
          uint64_t v46 = (a7 + 1);
          unint64_t v47 = (unsigned int *)(v44 + v15 + 8);
          do
          {
            unint64_t v48 = *(v47 - 2);
            uint64_t v49 = &v17[4 * (v48 >> 31)];
            uint64_t v50 = *((void *)v49 + 53);
            if (v50)
            {
              unint64_t v51 = v48 & 0x7FFFFFFF;
              int v52 = (const char *)(v50 + v51);
              if (*((void *)v49 + 54) <= v51) {
                int v53 = 0;
              }
              else {
                int v53 = v52;
              }
            }
            else
            {
              int v53 = 0;
            }
            if (v53) {
              uint64_t v54 = v53;
            }
            else {
              uint64_t v54 = "(?)";
            }
            uint64_t result = ctf_type_rvisit(v17, *((unsigned __int16 *)v47 - 2), a3, a4, v54, (v47[1] | ((unint64_t)*v47 << 32)) + a6, v46);
            if (result) {
              break;
            }
            v47 += 4;
            --v45;
          }
          while (v45);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *ctf_list_append(void *result, void *a2)
{
  uint64_t v2 = (void *)*result;
  const char *result = a2;
  *a2 = v2;
  a2[1] = 0;
  if (!v2) {
    uint64_t v2 = result;
  }
  v2[1] = a2;
  return result;
}

void *ctf_list_prepend(void *result, void *a2)
{
  uint64_t v2 = (void *)result[1];
  result[1] = a2;
  *a2 = 0;
  a2[1] = v2;
  if (!v2) {
    uint64_t v2 = result;
  }
  void *v2 = a2;
  return result;
}

void *ctf_list_delete(void *result, uint64_t *a2)
{
  uint64_t v2 = (void *)*a2;
  if (*a2) {
    uint64_t v3 = (void *)*a2;
  }
  else {
    uint64_t v3 = result;
  }
  v3[1] = a2[1];
  uint64_t v4 = (void *)a2[1];
  if (!v4) {
    uint64_t v4 = result;
  }
  void *v4 = v2;
  return result;
}

uint64_t ctf_strraw(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a2 >> 31;
  uint64_t v3 = *(void *)(a1 + 16 * v2 + 424);
  if (!v3) {
    return 0;
  }
  unint64_t v4 = a2 & 0x7FFFFFFF;
  uint64_t v5 = v3 + v4;
  if (*(void *)(a1 + 16 * v2 + 432) <= v4) {
    return 0;
  }
  else {
    return v5;
  }
}

const char *ctf_strptr(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a2 >> 31;
  uint64_t v3 = *(void *)(a1 + 16 * v2 + 424);
  if (v3)
  {
    unint64_t v4 = a2 & 0x7FFFFFFF;
    uint64_t v5 = v3 + v4;
    if (*(void *)(a1 + 16 * v2 + 432) <= v4) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v5;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6) {
    return (const char *)v6;
  }
  else {
    return "(?)";
  }
}

char *ctf_strdup(const char *a1)
{
  size_t v2 = strlen(a1);
  uint64_t result = (char *)malloc_type_malloc(v2 + 1, 0xCFAB4140uLL);
  if (result) {
    return strcpy(result, a1);
  }
  return result;
}

uint64_t ctf_set_open_errno(_DWORD *a1, int a2)
{
  if (a1) {
    *a1 = a2;
  }
  return 0;
}

uint64_t ctf_set_errno(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 560) = a2;
  return -1;
}

size_t _os_log_fmt_decode_error(size_t result)
{
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    uint64_t v1 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v1 - 1) <= 0x15)
    {
      return os_trace_blob_add_slow(result, "<decode: missing data>", 0x16uLL);
    }
    else
    {
      qmemcpy((void *)(*(void *)result + v1), "<decode: missing data>", 22);
      unsigned int v2 = *(_DWORD *)(result + 8) + 22;
      *(_DWORD *)(result + 8) = v2;
      if (!*(unsigned char *)(result + 22)) {
        *(unsigned char *)(*(void *)result + v2) = 0;
      }
    }
  }
  return result;
}

uint64_t _os_log_fmt_decode_cmd_mismatch(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a5;
  os_trace_blob_addf(a1, "<decode: mismatch for [%.*s] got [", a3, (uint64_t)a4, a5, a6, a7, a8, a3);
  unint64_t v17 = *a4;
  if (v17 > 0x4F)
  {
    os_trace_blob_addf(a1, "%d", v11, v12, v13, v14, v15, v16, *a4 >> 4);
  }
  else
  {
    uint64_t v18 = _cmd_type2str[v17 >> 4];
    unint64_t v19 = strlen(v18);
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      int v26 = v19;
      uint64_t v27 = *(unsigned int *)(a1 + 8);
      if (v19 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
      {
        os_trace_blob_add_slow(a1, v18, v19);
      }
      else
      {
        memcpy((void *)(*(void *)a1 + v27), v18, v19);
        unsigned int v28 = *(_DWORD *)(a1 + 8) + v26;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(unsigned char *)(a1 + 22)) {
          *(unsigned char *)(*(void *)a1 + v28) = 0;
        }
      }
    }
  }
  if ((*a4 & 2) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v29 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) <= 6)
    {
      os_trace_blob_add_slow(a1, " public", 7uLL);
    }
    else
    {
      int v30 = (_DWORD *)(*(void *)a1 + v29);
      *(_DWORD *)((char *)v30 + 3) = 1667853410;
      *int v30 = 1651863584;
      unsigned int v31 = *(_DWORD *)(a1 + 8) + 7;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v31) = 0;
      }
    }
  }
  if ((*a4 & 1) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v32 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v32 - 1) <= 7)
    {
      os_trace_blob_add_slow(a1, " private", 8uLL);
    }
    else
    {
      *(void *)(*(void *)a1 + v32) = 0x6574617669727020;
      unsigned int v33 = *(_DWORD *)(a1 + 8) + 8;
      *(_DWORD *)(a1 + 8) = v33;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v33) = 0;
      }
    }
  }
  return os_trace_blob_addf(a1, " sz:%d]>", v20, v21, v22, v23, v24, v25, v8);
}

uint64_t _os_log_fmt_decode_bad_range(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf(a1, "<decode: bad range for [%.*s] got [offs:%d len:%d within:%d]>", a3, a4, a5, a6, a7, a8, a3);
}

uint64_t _os_log_fmt_decode_masked_unknown(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a4 - 8) < 3) {
    return os_trace_blob_addf(a1, "<decode: mask \"%.*s\" is %s>", a3, a4, a5, a6, a7, a8, a2);
  }
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _os_log_fmt_decode_give_up(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf(a1, "<decode: can't compose [%.*s]>", a3, a4, a5, a6, a7, a8, a3);
}

id _OSLogFailWithPOSIXError(id result, void *a2)
{
  if (a2)
  {
    uint64_t result = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:(int)result userInfo:0];
    *a2 = result;
  }
  return result;
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1F412F930]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x1F40E6FF0](aClass, extraBytes, zone);
}

void NSDeallocateObject(id object)
{
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1F40D8D08]();
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memset_chk()
{
  return MEMORY[0x1F40C9C38]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1F40C9C98](a1, a2, *(void *)&a3, a4, a5);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t _dyld_dlsym_blocked()
{
  return MEMORY[0x1F40C9DB0]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1F40C9E48]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_state_request_for_pidlist()
{
  return MEMORY[0x1F40CA078]();
}

uint64_t _os_trace_app_cryptex_sysprefsdir_path()
{
  return MEMORY[0x1F40CA080]();
}

uint64_t _os_trace_calloc()
{
  return MEMORY[0x1F40CA088]();
}

uint64_t _os_trace_fdscandir_b()
{
  return MEMORY[0x1F40CA090]();
}

uint64_t _os_trace_get_boot_uuid()
{
  return MEMORY[0x1F40CA098]();
}

uint64_t _os_trace_getxattr_at()
{
  return MEMORY[0x1F40CA0A0]();
}

uint64_t _os_trace_intprefsdir_path()
{
  return MEMORY[0x1F40CA0A8]();
}

uint64_t _os_trace_is_development_build()
{
  return MEMORY[0x1F40CA0B0]();
}

uint64_t _os_trace_malloc()
{
  return MEMORY[0x1F40CA0C0]();
}

uint64_t _os_trace_memdup()
{
  return MEMORY[0x1F40CA0C8]();
}

uint64_t _os_trace_mmap()
{
  return MEMORY[0x1F40CA0D0]();
}

uint64_t _os_trace_mmap_at()
{
  return MEMORY[0x1F40CA0D8]();
}

uint64_t _os_trace_os_cryptex_sysprefsdir_path()
{
  return MEMORY[0x1F40CA0E0]();
}

uint64_t _os_trace_prefsdir_path()
{
  return MEMORY[0x1F40CA0E8]();
}

uint64_t _os_trace_read_file_at()
{
  return MEMORY[0x1F40CA0F0]();
}

uint64_t _os_trace_realloc()
{
  return MEMORY[0x1F40CA0F8]();
}

uint64_t _os_trace_scandir_free_namelist()
{
  return MEMORY[0x1F40CA100]();
}

uint64_t _os_trace_sysprefsdir_path()
{
  return MEMORY[0x1F40CA108]();
}

uint64_t _os_trace_write()
{
  return MEMORY[0x1F40CA110]();
}

uint64_t _os_trace_writev()
{
  return MEMORY[0x1F40CA118]();
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

int alphasort(const dirent **a1, const dirent **a2)
{
  return MEMORY[0x1F40CA398](a1, a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

int atexit_b(void *a1)
{
  return MEMORY[0x1F40CA490](a1);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1F40CA568](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0B0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1F40CBE00](*(void *)&a1, *(void *)&a2);
}

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1F40CBF08]();
}

int execlp(const char *__file, const char *__arg0, ...)
{
  return MEMORY[0x1F40CBFB8](__file, __arg0);
}

void exit(int a1)
{
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1F40CC018](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CC038](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CC060](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CC070](*(void *)&a1, a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1F40CC078](*(void *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

pid_t fork(void)
{
  return MEMORY[0x1F40CC1C8]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC2A8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1F40CC2C8](*(void *)&a1, a2, a3, *(void *)&a4);
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

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

int getpagesize(void)
{
  return MEMORY[0x1F40CC480]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1F40CC690](*(void *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1F40CC6B0](*(void *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1F40CC6C0]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1F40CCD50](__base, __nel, __width, __compar);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1F40CCDD8](*(void *)&a1, a2, a3);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1F40CCE18](a1, *(void *)&a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1F40CCE30](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCE58](a1, a2, *(void *)&a3);
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

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
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

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1F40CD100](*(void *)&a1, a2, *(void *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

uint64_t os_log_backtrace_create_from_buffer()
{
  return MEMORY[0x1F40CD338]();
}

uint64_t os_log_backtrace_destroy()
{
  return MEMORY[0x1F40CD340]();
}

uint64_t os_log_backtrace_get_frames()
{
  return MEMORY[0x1F40CD348]();
}

uint64_t os_log_backtrace_get_length()
{
  return MEMORY[0x1F40CD350]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

void perror(const char *a1)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40CD760](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1F4181AB8](property, outCount);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181AF0](proto, outCount);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int putenv(char *a1)
{
  return MEMORY[0x1F40CDBB0](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

size_t rb_tree_count(rb_tree_t *a1)
{
  return MEMORY[0x1F40CDC20](a1);
}

void *__cdecl rb_tree_find_node(rb_tree_t *a1, const void *a2)
{
  return (void *)MEMORY[0x1F40CDC28](a1, a2);
}

void rb_tree_init(rb_tree_t *a1, const rb_tree_ops_t *a2)
{
}

void *__cdecl rb_tree_insert_node(rb_tree_t *a1, void *a2)
{
  return (void *)MEMORY[0x1F40CDC38](a1, a2);
}

void *__cdecl rb_tree_iterate(rb_tree_t *a1, void *a2, const unsigned int a3)
{
  return (void *)MEMORY[0x1F40CDC40](a1, a2, *(void *)&a3);
}

void rb_tree_remove_node(rb_tree_t *a1, void *a2)
{
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renameat(int a1, const char *a2, int a3, const char *a4)
{
  return MEMORY[0x1F40CDD60](*(void *)&a1, a2, *(void *)&a3, a4);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1F40CDD90](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1F40CE140](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE170](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE218](__s1, __s2);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1F40CE220](a1, a2, a3);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE250](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
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

FILE *tmpfile(void)
{
  return (FILE *)MEMORY[0x1F40CE5A0]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1F40CE5E8](*(void *)&a1, a2, *(void *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
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

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE680](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE690](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1F40CE7C8](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC08](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

uint64_t xpc_copy_short_description()
{
  return MEMORY[0x1F40CED60]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE50](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1F40CEF00](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}