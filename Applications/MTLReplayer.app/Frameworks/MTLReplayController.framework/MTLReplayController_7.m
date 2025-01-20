BOOL GTMTLSMBuilder_streamIntersectionRange(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t Func;
  unint64_t *v9;

  if (!a3) {
    return 0;
  }
  v5 = *(void *)(a3 + 32);
  if (v5 && (*(unsigned char *)(v5 + 79) & 8) != 0) {
    v6 = (void *)(v5 + 64);
  }
  else {
    v6 = 0;
  }
  Func = GTTraceStream_lastFunc(a3);
  if (*v6 >= a1 + a2) {
    return 0;
  }
  v9 = (unint64_t *)Func;
  return !IsFuncEnumDestructor(*(_DWORD *)(Func + 8)) || a1 <= *v9;
}

uint64_t GTMTLSMBuilder_compareStreams(void **a1, void **a2)
{
  v2 = *a1;
  if (*a1) {
    v2 = (void *)*v2;
  }
  v3 = *a2;
  if (*a2) {
    v3 = (void *)*v3;
  }
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 != v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t *GTMTLSMContext_buildDeviceMirrorWithIgnoreFlags(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, apr_pool_t *pool)
{
  long long v1247 = 0u;
  long long v1248 = 0u;
  long long v1245 = 0u;
  long long v1246 = 0u;
  long long v1243 = 0u;
  long long v1244 = 0u;
  long long v1241 = 0u;
  long long v1242 = 0u;
  long long v1240 = 0u;
  uint64_t v1234 = 1;
  unint64_t v1235 = a4;
  uint64_t v1236 = a5;
  p = pool;
  ht = apr_hash_make(pool);
  uint64_t v1239 = a2;
  v1218 = pool;
  v9 = apr_array_make(pool, *(_DWORD *)(a1 + 48), 8);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = a1;
  *(_DWORD *)(a1 + 40) = 0;
  v10 = apr_hash_next((apr_hash_index_t *)(a1 + 16));
  if (v10)
  {
    v11 = v10;
    do
    {
      uint64_t v12 = *(void *)(*((void *)v11 + 1) + 32);
      *(void *)apr_array_push(v9) = v12;
      v11 = apr_hash_next(v11);
    }
    while (v11);
  }
  qsort(v9->elts, v9->nelts, v9->elt_size, (int (__cdecl *)(const void *, const void *))GTMTLSMBuilder_compareStreams);
  uint64_t v1233 = 0;
  long long v1232 = 0u;
  long long v1231 = 0u;
  long long v1230 = 0u;
  uint64_t v1229 = 1;
  __key = &v1229;
  v13 = (uint64_t *)bsearch(&__key, v9->elts, v9->nelts, v9->elt_size, (int (__cdecl *)(const void *, const void *))GTMTLSMBuilder_compareStreams);
  if (!v13) {
    goto LABEL_1306;
  }
  v14 = v13 + 1;
  uint64_t v15 = *v13;
  if (*(_DWORD *)(*(void *)(*v13 + 32) + 72) != -10239) {
    return 0;
  }
  uint64_t v16 = (uint64_t)&v9->elts[8 * v9->nelts];
  uint64_t v1219 = v16;
  if (GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v15))
  {
    LODWORD(v1247) = v1247 + 1;
    uint64_t v17 = *(void *)(v15 + 32);
    if (v17)
    {
      unsigned int v18 = 0;
      while (1)
      {
        unsigned int v19 = atomic_load((unsigned int *)(v17 + 4));
        uint64_t v20 = v18 + (v19 >> 6) - 1;
        if ((int)v20 > 0) {
          break;
        }
        uint64_t v17 = *(void *)(v17 + 40);
        unsigned int v18 = v20;
        if (!v17)
        {
          unsigned int v18 = v20;
          goto LABEL_15;
        }
      }
    }
    else
    {
      unsigned int v18 = 0;
    }
    uint64_t v20 = 0;
LABEL_15:
    uint64_t v22 = 0;
    v23 = 0;
    unint64_t v24 = v18 | (unint64_t)(v20 << 32);
LABEL_16:
    uint64_t v25 = v17 + 64;
    while (v17)
    {
      int v26 = HIDWORD(v24) - v24;
      if ((*(unsigned char *)(v25 + ((uint64_t)(HIDWORD(v24) - (int)v24) << 6) + 15) & 8) == 0) {
        break;
      }
      uint64_t v27 = v25 + ((uint64_t)v26 << 6);
      unint64_t v28 = *(void *)v27;
      if (*(void *)v27 >= v1236 + v1235) {
        break;
      }
      int v29 = *(_DWORD *)(v27 + 8);
      if (v29 == -10239)
      {
        uint64_t v30 = v1239;
        v31 = GTTraceFunc_argumentBytesWithMap((void *)v27, *(unsigned __int8 *)(v25 + ((uint64_t)v26 << 6) + 13), v1239);
        uint64_t v22 = *(void *)v31;
        v23 = GTTraceFunc_argumentBytesWithMap((void *)v27, v31[8], v30);
      }
      else if (v29 == -16317)
      {
        if (v1235 <= v28)
        {
          v1063 = apr_palloc(p, 0x30uLL);
          void *v1063 = 36;
          v1063[1] = v22;
          *((_OWORD *)v1063 + 1) = xmmword_4C80A0;
          v1063[4] = 0;
          v1063[5] = v23;
          uint64_t v1064 = *find_entry((uint64_t)ht, (unsigned char *)v1063 + 8, 8uLL, 0);
          if (v1064) {
            uint64_t v1064 = *(void *)(v1064 + 32);
          }
          v1063[4] = v1064;
          apr_hash_set(ht, v1063 + 1, 8, v1063);
          v1063[3] = v28;
        }
        goto LABEL_29;
      }
      unsigned int v32 = atomic_load((unsigned int *)(v17 + 4));
      int v33 = v24 + (v32 >> 6);
      uint64_t v34 = (HIDWORD(v24) + 1);
      unint64_t v24 = (v34 << 32) | v24;
      if (v34 == v33 - 1)
      {
        unint64_t v24 = (v34 << 32) | v34;
        uint64_t v17 = *(void *)(v17 + 40);
        goto LABEL_16;
      }
    }
    v35 = apr_palloc(p, 0x30uLL);
    void *v35 = 36;
    v35[1] = v22;
    *((_OWORD *)v35 + 1) = xmmword_4C80A0;
    v35[4] = 0;
    v35[5] = v23;
    uint64_t v36 = *find_entry((uint64_t)ht, (unsigned char *)v35 + 8, 8uLL, 0);
    if (v36) {
      uint64_t v36 = *(void *)(v36 + 32);
    }
    v35[4] = v36;
    apr_hash_set(ht, v35 + 1, 8, v35);
    v35[3] = -1;
  }
LABEL_29:
  if (v14 == (uint64_t *)v16) {
    goto LABEL_1306;
  }
  while (2)
  {
    uint64_t v37 = *v14;
    if (!*v14) {
      goto LABEL_1212;
    }
    uint64_t v38 = *(void *)(v37 + 32);
    if (!v38 || (*(unsigned char *)(v38 + 79) & 8) == 0) {
      goto LABEL_1212;
    }
    int v39 = *(_DWORD *)(v38 + 72);
    if (v39 == -7163)
    {
      uint64_t v1227 = 0;
      int v40 = 30;
      v43 = GTTraceFunc_argumentBytesWithPool((uint64_t *)(v38 + 64), *(unsigned __int8 *)(v38 + 77), *(void *)(v37 + 24))+ 8;
    }
    else
    {
      unsigned int v41 = GetFuncEnumConstructorType(*(_DWORD *)(v38 + 72)) - 2;
      if (v41 > 0x51) {
        int v40 = 255;
      }
      else {
        int v40 = byte_4CA018[v41];
      }
      uint64_t v1227 = 0;
      uint64_t v42 = *(void *)(v37 + 24);
      if (v39 == -15913 || v39 == -15914) {
        v43 = GTTraceFunc_argumentBytesWithPool((uint64_t *)(v38 + 64), *(unsigned __int8 *)(v38 + 77), v42) + 16;
      }
      else {
        v43 = GTTraceFunc_argumentBytesWithPool((uint64_t *)(v38 + 64), *(unsigned __int8 *)(v38 + 77), v42);
      }
    }
    uint64_t v44 = *(void *)v43;
    uint64_t v1227 = *(void *)v43;
    if (v40 != 29 && v44 != 1)
    {
      uint64_t v45 = *find_entry((uint64_t)ht, &v1227, 8uLL, 0);
      if (!v45 || !*(void *)(v45 + 32)) {
        goto LABEL_1211;
      }
    }
    v1220 = v14;
    switch((char)v40)
    {
      case 0:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        memset(__src, 0, 24);
        memset(&__src[8], 0, 32);
        memset(&__src[5], 0, 32);
        *(void *)&__src[2] = 0;
        __src[3] = 0u;
        LODWORD(__src[0]) = 22;
        *((void *)&__src[1] + 1) = -1;
        WORD1(__src[6]) = 2;
        __src[4] = 0xFFFFFFFFFFFFFFFFLL;
        __src[7] = 0xFFFFFFFFFFFFFFFFLL;
        *((void *)&__src[2] + 1) = v1234;
        LODWORD(v1240) = v1240 + 1;
        uint64_t v46 = *(void *)(v37 + 32);
        if (v46 && (*(unsigned char *)(v46 + 79) & 8) != 0) {
          v47 = (uint64_t *)(v46 + 64);
        }
        else {
          v47 = 0;
        }
        GTMTLSMBuffer_processTraceFuncWithMap((char *)__src, v1239, v47);
        uint64_t v812 = *(void *)(v37 + 32);
        if (v812)
        {
          unsigned int v813 = 0;
          while (1)
          {
            unsigned int v814 = atomic_load((unsigned int *)(v812 + 4));
            uint64_t v815 = v813 + (v814 >> 6) - 1;
            if ((int)v815 > 1) {
              break;
            }
            uint64_t v812 = *(void *)(v812 + 40);
            unsigned int v813 = v815;
            if (!v812)
            {
              unsigned int v813 = v815;
              goto LABEL_1079;
            }
          }
          uint64_t v815 = 1;
        }
        else
        {
          unsigned int v813 = 0;
          uint64_t v815 = 0;
        }
LABEL_1079:
        unint64_t v816 = v813 | (unint64_t)(v815 << 32);
        while (2)
        {
          uint64_t v817 = v812 + 64;
LABEL_1081:
          if (!v812
            || (*(unsigned char *)(v817 + ((uint64_t)(HIDWORD(v816) - (int)v816) << 6) + 15) & 8) == 0
            || (uint64_t v818 = v817 + ((uint64_t)(HIDWORD(v816) - (int)v816) << 6),
                unint64_t v262 = *(void *)v818,
                *(void *)v818 >= v1236 + v1235))
          {
            v278 = apr_palloc(p, 0xA0uLL);
            long long v833 = __src[1];
            _OWORD *v278 = __src[0];
            v278[1] = v833;
            long long v834 = __src[5];
            long long v836 = __src[2];
            long long v835 = __src[3];
            v278[4] = __src[4];
            v278[5] = v834;
            v278[2] = v836;
            v278[3] = v835;
            long long v837 = __src[9];
            long long v839 = __src[6];
            long long v838 = __src[7];
            v278[8] = __src[8];
            v278[9] = v837;
            v278[6] = v839;
            v278[7] = v838;
            goto LABEL_1155;
          }
          int v819 = *(_DWORD *)(v818 + 8);
          if (v819 <= -16368)
          {
            if (v819 != -16372)
            {
              if (v819 == -16370)
              {
                if (v1235 <= v262)
                {
                  v278 = apr_palloc(p, 0xA0uLL);
                  long long v1005 = __src[1];
                  _OWORD *v278 = __src[0];
                  v278[1] = v1005;
                  long long v1006 = __src[5];
                  long long v1008 = __src[2];
                  long long v1007 = __src[3];
                  v278[4] = __src[4];
                  v278[5] = v1006;
                  v278[2] = v1008;
                  v278[3] = v1007;
                  long long v1009 = __src[9];
                  long long v1011 = __src[6];
                  long long v1010 = __src[7];
                  v278[8] = __src[8];
                  v278[9] = v1009;
                  v278[6] = v1011;
                  v278[7] = v1010;
                  goto LABEL_1303;
                }
                goto LABEL_1211;
              }
LABEL_1096:
              GTMTLSMBuffer_processTraceFuncWithMap((char *)__src, v1239, (uint64_t *)v818);
              unsigned int v830 = atomic_load((unsigned int *)(v812 + 4));
              int v831 = v816 + (v830 >> 6);
              uint64_t v832 = (HIDWORD(v816) + 1);
              unint64_t v816 = (v832 << 32) | v816;
              if (v832 == v831 - 1)
              {
                unint64_t v816 = (v832 << 32) | v832;
                uint64_t v812 = *(void *)(v812 + 40);
                continue;
              }
              goto LABEL_1081;
            }
          }
          else if (v819 != -16122 && v819 != -16367)
          {
            goto LABEL_1096;
          }
          break;
        }
        if (v1235 <= v262)
        {
          v821 = apr_palloc(p, 0xA0uLL);
          long long v822 = __src[1];
          *(_OWORD *)v821 = __src[0];
          *((_OWORD *)v821 + 1) = v822;
          long long v823 = __src[5];
          long long v825 = __src[2];
          long long v824 = __src[3];
          *((_OWORD *)v821 + 4) = __src[4];
          *((_OWORD *)v821 + 5) = v823;
          *((_OWORD *)v821 + 2) = v825;
          *((_OWORD *)v821 + 3) = v824;
          long long v826 = __src[9];
          long long v828 = __src[6];
          long long v827 = __src[7];
          *((_OWORD *)v821 + 8) = __src[8];
          *((_OWORD *)v821 + 9) = v826;
          *((_OWORD *)v821 + 6) = v828;
          *((_OWORD *)v821 + 7) = v827;
          uint64_t v829 = *find_entry((uint64_t)ht, (unsigned char *)v821 + 8, 8uLL, 0);
          if (v829) {
            uint64_t v829 = *(void *)(v829 + 32);
          }
          v821[4] = v829;
          apr_hash_set(ht, v821 + 1, 8, v821);
          v821[3] = v262;
        }
        goto LABEL_1096;
      case 1:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        memset(__src, 0, 24);
        memset(&__src[5], 0, 128);
        __src[3] = 0u;
        *(void *)&__src[2] = 0;
        LODWORD(__src[0]) = 80;
        *((void *)&__src[1] + 1) = -1;
        WORD1(__src[6]) = 2;
        __src[4] = 0xFFFFFFFFFFFFFFFFLL;
        *(void *)&__src[13] = 0xFFFFFFFFLL;
        *((void *)&__src[2] + 1) = v1234;
        ++DWORD1(v1240);
        uint64_t v48 = *(void *)(v37 + 32);
        if (v48 && (*(unsigned char *)(v48 + 79) & 8) != 0) {
          v49 = (uint64_t *)(v48 + 64);
        }
        else {
          v49 = 0;
        }
        GTMTLSMTexture_processTraceFuncWithMap((char *)__src, v1239, v49);
        uint64_t v840 = *(void *)(v37 + 32);
        if (v840)
        {
          unsigned int v841 = 0;
          while (1)
          {
            unsigned int v842 = atomic_load((unsigned int *)(v840 + 4));
            uint64_t v843 = v841 + (v842 >> 6) - 1;
            if ((int)v843 > 1) {
              break;
            }
            uint64_t v840 = *(void *)(v840 + 40);
            unsigned int v841 = v843;
            if (!v840)
            {
              unsigned int v841 = v843;
              goto LABEL_1107;
            }
          }
          uint64_t v843 = 1;
        }
        else
        {
          unsigned int v841 = 0;
          uint64_t v843 = 0;
        }
LABEL_1107:
        unint64_t v844 = v841 | (unint64_t)(v843 << 32);
        while (2)
        {
          uint64_t v845 = v840 + 64;
LABEL_1109:
          if (!v840
            || (*(unsigned char *)(v845 + ((uint64_t)(HIDWORD(v844) - (int)v844) << 6) + 15) & 8) == 0
            || (uint64_t v846 = v845 + ((uint64_t)(HIDWORD(v844) - (int)v844) << 6),
                unint64_t v262 = *(void *)v846,
                *(void *)v846 >= v1236 + v1235))
          {
            v278 = apr_palloc(p, 0xD8uLL);
            long long v864 = __src[1];
            _OWORD *v278 = __src[0];
            v278[1] = v864;
            long long v865 = __src[5];
            long long v867 = __src[2];
            long long v866 = __src[3];
            v278[4] = __src[4];
            v278[5] = v865;
            v278[2] = v867;
            v278[3] = v866;
            long long v868 = __src[9];
            long long v870 = __src[6];
            long long v869 = __src[7];
            v278[8] = __src[8];
            v278[9] = v868;
            v278[6] = v870;
            v278[7] = v869;
            long long v872 = __src[11];
            long long v871 = __src[12];
            uint64_t v873 = *(void *)&__src[13];
            v278[10] = __src[10];
            v278[11] = v872;
            *((void *)v278 + 26) = v873;
            v278[12] = v871;
            goto LABEL_1155;
          }
          int v847 = *(_DWORD *)(v846 + 8);
          if (v847 <= -16233)
          {
            if (v847 != -16240)
            {
              if (v847 == -16238)
              {
                if (v1235 <= v262)
                {
                  v278 = apr_palloc(p, 0xD8uLL);
                  long long v1012 = __src[1];
                  _OWORD *v278 = __src[0];
                  v278[1] = v1012;
                  long long v1013 = __src[5];
                  long long v1015 = __src[2];
                  long long v1014 = __src[3];
                  v278[4] = __src[4];
                  v278[5] = v1013;
                  v278[2] = v1015;
                  v278[3] = v1014;
                  long long v1016 = __src[9];
                  long long v1018 = __src[6];
                  long long v1017 = __src[7];
                  v278[8] = __src[8];
                  v278[9] = v1016;
                  v278[6] = v1018;
                  v278[7] = v1017;
                  long long v1020 = __src[11];
                  long long v1019 = __src[12];
                  uint64_t v1021 = *(void *)&__src[13];
                  v278[10] = __src[10];
                  v278[11] = v1020;
                  *((void *)v278 + 26) = v1021;
                  v278[12] = v1019;
                  goto LABEL_1303;
                }
                goto LABEL_1211;
              }
LABEL_1124:
              GTMTLSMTexture_processTraceFuncWithMap((char *)__src, v1239, (uint64_t *)v846);
              unsigned int v861 = atomic_load((unsigned int *)(v840 + 4));
              int v862 = v844 + (v861 >> 6);
              uint64_t v863 = (HIDWORD(v844) + 1);
              unint64_t v844 = (v863 << 32) | v844;
              if (v863 == v862 - 1)
              {
                unint64_t v844 = (v863 << 32) | v863;
                uint64_t v840 = *(void *)(v840 + 40);
                continue;
              }
              goto LABEL_1109;
            }
          }
          else if (v847 != -16232 && v847 != -16114)
          {
            goto LABEL_1124;
          }
          break;
        }
        if (v1235 <= v262)
        {
          v849 = apr_palloc(p, 0xD8uLL);
          long long v850 = __src[1];
          *(_OWORD *)v849 = __src[0];
          *((_OWORD *)v849 + 1) = v850;
          long long v851 = __src[5];
          long long v853 = __src[2];
          long long v852 = __src[3];
          *((_OWORD *)v849 + 4) = __src[4];
          *((_OWORD *)v849 + 5) = v851;
          *((_OWORD *)v849 + 2) = v853;
          *((_OWORD *)v849 + 3) = v852;
          long long v854 = __src[9];
          long long v856 = __src[6];
          long long v855 = __src[7];
          *((_OWORD *)v849 + 8) = __src[8];
          *((_OWORD *)v849 + 9) = v854;
          *((_OWORD *)v849 + 6) = v856;
          *((_OWORD *)v849 + 7) = v855;
          long long v858 = __src[11];
          long long v857 = __src[12];
          uint64_t v859 = *(void *)&__src[13];
          *((_OWORD *)v849 + 10) = __src[10];
          *((_OWORD *)v849 + 11) = v858;
          v849[26] = v859;
          *((_OWORD *)v849 + 12) = v857;
          uint64_t v860 = *find_entry((uint64_t)ht, (unsigned char *)v849 + 8, 8uLL, 0);
          if (v860) {
            uint64_t v860 = *(void *)(v860 + 32);
          }
          v849[4] = v860;
          apr_hash_set(ht, v849 + 1, 8, v849);
          v849[3] = v262;
        }
        goto LABEL_1124;
      case 2:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD2(v1240);
        uint64_t v50 = *(void *)(v37 + 32);
        if (v50)
        {
          unsigned int v51 = 0;
          while (1)
          {
            unsigned int v52 = atomic_load((unsigned int *)(v50 + 4));
            uint64_t v53 = v51 + (v52 >> 6) - 1;
            if ((int)v53 > 0) {
              break;
            }
            uint64_t v50 = *(void *)(v50 + 40);
            unsigned int v51 = v53;
            if (!v50)
            {
              unsigned int v51 = v53;
              goto LABEL_257;
            }
          }
        }
        else
        {
          unsigned int v51 = 0;
        }
        uint64_t v53 = 0;
LABEL_257:
        int v1156 = 0;
        uint64_t v1169 = 0;
        uint64_t v1183 = 0;
        uint64_t v1124 = 0;
        uint64_t v1138 = 0;
        v191 = 0;
        v192 = 0;
        unint64_t v193 = v51 | (unint64_t)(v53 << 32);
        long long v1202 = xmmword_4C8060;
        while (2)
        {
          uint64_t v194 = v50 + 64;
LABEL_259:
          if (v50
            && (int v195 = HIDWORD(v193) - v193,
                (*(unsigned char *)(v194 + ((uint64_t)(HIDWORD(v193) - (int)v193) << 6) + 15) & 8) != 0)
            && (v196 = (uint64_t *)(v194 + ((uint64_t)v195 << 6)), unint64_t v197 = *v196, *v196 < v1236 + v1235))
          {
            int v198 = *((_DWORD *)v196 + 2);
            if (v198 != -16241)
            {
              uint64_t v199 = v1239;
              if (v198 == -10163)
              {
                v203 = GTTraceFunc_argumentBytesWithMap(v196, *(unsigned __int8 *)(v194 + ((uint64_t)v195 << 6) + 13), v1239);
                *(void *)&long long v204 = v1202;
                *((void *)&v204 + 1) = *((void *)v203 + 1);
              }
              else
              {
                if (v198 != -10226)
                {
                  if (v198 == -16309)
                  {
                    uint64_t v200 = v194 + ((uint64_t)v195 << 6);
                    v201 = GTTraceFunc_argumentBytesWithMap((void *)v200, *(unsigned __int8 *)(v200 + 13), v1239);
                    uint64_t v1169 = *((void *)v201 + 1);
                    uint64_t v1183 = *v196;
                    int v1156 = *((_DWORD *)v196 + 2);
                    v202 = GTTraceFunc_argumentBytesWithMap(v196, *(unsigned __int8 *)(v200 + 14), v199);
                    v192 = v202;
                    if (v202)
                    {
                      uint64_t v1124 = *((void *)v202 + 2);
                      long long v1202 = *(_OWORD *)v202;
                    }
                    uint64_t v1138 = *(void *)v201;
                    v191 = GTTraceFunc_argumentBytesWithMap(v196, v201[16], v199);
                  }
LABEL_272:
                  v14 = v1220;
                  unsigned int v206 = atomic_load((unsigned int *)(v50 + 4));
                  int v207 = v193 + (v206 >> 6);
                  uint64_t v208 = (HIDWORD(v193) + 1);
                  unint64_t v193 = (v208 << 32) | v193;
                  if (v208 == v207 - 1)
                  {
                    unint64_t v193 = (v208 << 32) | v208;
                    uint64_t v50 = *(void *)(v50 + 40);
                    continue;
                  }
                  goto LABEL_259;
                }
                v205 = GTTraceFunc_argumentBytesWithMap(v196, *(unsigned __int8 *)(v194 + ((uint64_t)v195 << 6) + 13), v1239);
                *((void *)&v204 + 1) = *((void *)&v1202 + 1);
                *(void *)&long long v204 = *((void *)v205 + 1);
              }
              long long v1202 = v204;
              goto LABEL_272;
            }
            v14 = v1220;
            if (v1235 > v197) {
              goto LABEL_1211;
            }
            v209 = (char *)apr_palloc(p, 0x58uLL);
            v210 = v209;
            *(_DWORD *)v209 = 75;
            *((_DWORD *)v209 + 1) = v1156;
            *((void *)v209 + 1) = v1169;
            v211 = v209 + 8;
            *((void *)v209 + 2) = v1183;
            *((void *)v209 + 3) = -1;
          }
          else
          {
            v209 = (char *)apr_palloc(p, 0x58uLL);
            v210 = v209;
            *(_DWORD *)v209 = 75;
            *((_DWORD *)v209 + 1) = v1156;
            *((void *)v209 + 1) = v1169;
            v211 = v209 + 8;
            unint64_t v197 = -1;
            *((void *)v209 + 2) = v1183;
            *((void *)v209 + 3) = -1;
          }
          break;
        }
        *((void *)v209 + 4) = 0;
        *((void *)v209 + 5) = v1138;
        *((void *)v209 + 6) = v191;
        *((void *)v209 + 7) = v192;
        *((_OWORD *)v209 + 4) = v1202;
        *((void *)v209 + 10) = v1124;
        goto LABEL_826;
      case 3:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        memset(&__src[7], 0, 304);
        memset(&__src[2], 0, 64);
        memset(__src, 0, 24);
        LODWORD(__src[0]) = 71;
        *((void *)&__src[1] + 1) = -1;
        __src[6] = 0xFFFFFFFFFFFFFFFFLL;
        ++HIDWORD(v1240);
        uint64_t v54 = *(void *)(v37 + 32);
        if (v54)
        {
          unsigned int v55 = 0;
          while (1)
          {
            unsigned int v56 = atomic_load((unsigned int *)(v54 + 4));
            uint64_t v57 = v55 + (v56 >> 6) - 1;
            if ((int)v57 > 0) {
              break;
            }
            uint64_t v54 = *(void *)(v54 + 40);
            unsigned int v55 = v57;
            if (!v54)
            {
              unsigned int v55 = v57;
              goto LABEL_278;
            }
          }
        }
        else
        {
          unsigned int v55 = 0;
        }
        uint64_t v57 = 0;
LABEL_278:
        unint64_t v212 = v55 | (unint64_t)(v57 << 32);
        while (2)
        {
          uint64_t v213 = v54 + 64;
LABEL_280:
          if (!v54
            || (*(unsigned char *)(v213 + ((uint64_t)(HIDWORD(v212) - (int)v212) << 6) + 15) & 8) == 0
            || (uint64_t v214 = v213 + ((uint64_t)(HIDWORD(v212) - (int)v212) << 6),
                unint64_t v215 = *(void *)v214,
                *(void *)v214 >= v1236 + v1235))
          {
            v219 = apr_palloc(p, 0x1A0uLL);
            memcpy(v219, __src, 0x1A0uLL);
            goto LABEL_936;
          }
          if (*(_DWORD *)(v214 + 8) != -16242)
          {
            GTMTLSMRenderPipelineState_processTraceFuncWithMap((char *)__src, v1239, (uint64_t *)v214);
            unsigned int v216 = atomic_load((unsigned int *)(v54 + 4));
            int v217 = v212 + (v216 >> 6);
            uint64_t v218 = (HIDWORD(v212) + 1);
            unint64_t v212 = (v218 << 32) | v212;
            if (v218 == v217 - 1)
            {
              unint64_t v212 = (v218 << 32) | v218;
              uint64_t v54 = *(void *)(v54 + 40);
              continue;
            }
            goto LABEL_280;
          }
          break;
        }
        v14 = v1220;
        if (v1235 > v215) {
          goto LABEL_1211;
        }
        v219 = apr_palloc(p, 0x1A0uLL);
        memcpy(v219, __src, 0x1A0uLL);
        goto LABEL_1226;
      case 4:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        memset(__src, 0, 24);
        memset(&__src[7], 0, 88);
        memset(&__src[2], 0, 64);
        LODWORD(__src[0]) = 29;
        *((void *)&__src[1] + 1) = -1;
        __src[6] = 0xFFFFFFFFFFFFFFFFLL;
        LODWORD(v1241) = v1241 + 1;
        uint64_t v58 = *(void *)(v37 + 32);
        if (v58)
        {
          unsigned int v59 = 0;
          while (1)
          {
            unsigned int v60 = atomic_load((unsigned int *)(v58 + 4));
            uint64_t v61 = v59 + (v60 >> 6) - 1;
            if ((int)v61 > 0) {
              break;
            }
            uint64_t v58 = *(void *)(v58 + 40);
            unsigned int v59 = v61;
            if (!v58)
            {
              unsigned int v59 = v61;
              goto LABEL_289;
            }
          }
        }
        else
        {
          unsigned int v59 = 0;
        }
        uint64_t v61 = 0;
LABEL_289:
        unint64_t v220 = v59 | (unint64_t)(v61 << 32);
        while (2)
        {
          uint64_t v221 = v58 + 64;
LABEL_291:
          if (!v58
            || (*(unsigned char *)(v221 + ((uint64_t)(HIDWORD(v220) - (int)v220) << 6) + 15) & 8) == 0
            || (uint64_t v222 = v221 + ((uint64_t)(HIDWORD(v220) - (int)v220) << 6),
                unint64_t v215 = *(void *)v222,
                *(void *)v222 >= v1236 + v1235))
          {
            v219 = apr_palloc(p, 0xC8uLL);
            _OWORD *v219 = __src[0];
            long long v226 = __src[4];
            long long v228 = __src[1];
            long long v227 = __src[2];
            v219[3] = __src[3];
            v219[4] = v226;
            v219[1] = v228;
            v219[2] = v227;
            long long v229 = __src[8];
            long long v231 = __src[5];
            long long v230 = __src[6];
            v219[7] = __src[7];
            v219[8] = v229;
            v219[5] = v231;
            v219[6] = v230;
            uint64_t v232 = *(void *)&__src[12];
            long long v233 = __src[11];
            long long v234 = __src[9];
            v219[10] = __src[10];
            v219[11] = v233;
            v219[9] = v234;
            *((void *)v219 + 24) = v232;
            goto LABEL_936;
          }
          if (*(_DWORD *)(v222 + 8) != -16321)
          {
            GTMTLSMComputePipelineState_processTraceFuncWithMap((char *)__src, v1239, (uint64_t *)v222);
            unsigned int v223 = atomic_load((unsigned int *)(v58 + 4));
            int v224 = v220 + (v223 >> 6);
            uint64_t v225 = (HIDWORD(v220) + 1);
            unint64_t v220 = (v225 << 32) | v220;
            if (v225 == v224 - 1)
            {
              unint64_t v220 = (v225 << 32) | v225;
              uint64_t v58 = *(void *)(v58 + 40);
              continue;
            }
            goto LABEL_291;
          }
          break;
        }
        v14 = v1220;
        if (v1235 > v215) {
          goto LABEL_1211;
        }
        v219 = apr_palloc(p, 0xC8uLL);
        _OWORD *v219 = __src[0];
        long long v945 = __src[4];
        long long v947 = __src[1];
        long long v946 = __src[2];
        v219[3] = __src[3];
        v219[4] = v945;
        v219[1] = v947;
        v219[2] = v946;
        long long v948 = __src[8];
        long long v950 = __src[5];
        long long v949 = __src[6];
        v219[7] = __src[7];
        v219[8] = v948;
        v219[5] = v950;
        v219[6] = v949;
        uint64_t v951 = *(void *)&__src[12];
        long long v952 = __src[11];
        long long v953 = __src[9];
        v219[10] = __src[10];
        v219[11] = v952;
        v219[9] = v953;
        *((void *)v219 + 24) = v951;
        goto LABEL_1226;
      case 5:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        BYTE2(__src[0]) = 0;
        LOWORD(__src[0]) = 0;
        ++DWORD1(v1241);
        uint64_t v62 = *(void *)(v37 + 32);
        if (v62)
        {
          unsigned int v63 = 0;
          while (1)
          {
            unsigned int v64 = atomic_load((unsigned int *)(v62 + 4));
            uint64_t v65 = v63 + (v64 >> 6) - 1;
            if ((int)v65 > 0) {
              break;
            }
            uint64_t v62 = *(void *)(v62 + 40);
            unsigned int v63 = v65;
            if (!v62)
            {
              unsigned int v63 = v65;
              goto LABEL_300;
            }
          }
        }
        else
        {
          unsigned int v63 = 0;
        }
        uint64_t v65 = 0;
LABEL_300:
        int v235 = 0;
        uint64_t v1094 = 0;
        uint64_t v1098 = 0;
        unint64_t v1103 = 0;
        uint64_t v1139 = 0;
        v1083 = 0;
        v1086 = 0;
        int v1157 = 0;
        int v1203 = 0;
        __int16 v1090 = 0;
        char v1077 = 0;
        v1110 = 0;
        uint64_t v1170 = 0;
        uint64_t v1184 = 0;
        unsigned int v1117 = 0;
        unint64_t v236 = v63 | (unint64_t)(v65 << 32);
        int v1125 = 2;
        uint64_t v1080 = -1;
        uint64_t v1074 = -1;
        while (2)
        {
          uint64_t v237 = v62 + 64;
LABEL_302:
          if (v62)
          {
            int v238 = HIDWORD(v236) - v236;
            if ((*(unsigned char *)(v237 + ((uint64_t)(HIDWORD(v236) - (int)v236) << 6) + 15) & 8) != 0)
            {
              uint64_t v239 = v238;
              uint64_t v240 = v237 + ((uint64_t)v238 << 6);
              unint64_t v241 = *(void *)v240;
              if (*(void *)v240 < v1236 + v1235)
              {
                int v242 = *(_DWORD *)(v240 + 8);
                if (v242 == -15925 || v242 == -15919)
                {
                  if (v1235 <= v241)
                  {
                    v244 = apr_palloc(p, 0x90uLL);
                    *(_DWORD *)v244 = 57;
                    *((_DWORD *)v244 + 1) = v235;
                    v244[1] = v1094;
                    v244[2] = v1103;
                    v244[3] = v1080;
                    v244[4] = 0;
                    v244[5] = v1098;
                    v244[6] = 0;
                    v244[7] = v1139;
                    v244[8] = v1074;
                    v244[9] = v1083;
                    *((_DWORD *)v244 + 20) = 0;
                    *((_DWORD *)v244 + 21) = v1157;
                    *((_DWORD *)v244 + 22) = v1203;
                    *((_DWORD *)v244 + 23) = 0;
                    *((_WORD *)v244 + 48) = v1090;
                    *((_WORD *)v244 + 49) = v1125;
                    *((unsigned char *)v244 + 100) = v1077;
                    *((unsigned char *)v244 + 103) = BYTE2(__src[0]);
                    *(_WORD *)((char *)v244 + 101) = __src[0];
                    v244[13] = v1110;
                    v244[14] = v1086;
                    v244[15] = v1184;
                    v244[16] = v1170;
                    v244[17] = v1117;
                    uint64_t v245 = *find_entry((uint64_t)ht, (unsigned char *)v244 + 8, 8uLL, 0);
                    if (v245) {
                      uint64_t v245 = *(void *)(v245 + 32);
                    }
                    v244[4] = v245;
                    apr_hash_set(ht, v244 + 1, 8, v244);
                    v244[3] = v241;
                    int v242 = *(_DWORD *)(v240 + 8);
                    uint64_t v237 = v62 + 64;
                  }
                }
                else if (v242 == -15923)
                {
                  if (v1235 <= v241)
                  {
                    v992 = apr_palloc(p, 0x90uLL);
                    *(_DWORD *)v992 = 57;
                    *((_DWORD *)v992 + 1) = v235;
                    v992[1] = v1094;
                    v992[2] = v1103;
                    v992[3] = v1080;
                    v992[4] = 0;
                    v992[5] = v1098;
                    v992[6] = 0;
                    v992[7] = v1139;
                    v992[8] = v1074;
                    v992[9] = v1083;
                    *((_DWORD *)v992 + 20) = 0;
                    *((_DWORD *)v992 + 21) = v1157;
                    *((_DWORD *)v992 + 22) = v1203;
                    *((_DWORD *)v992 + 23) = 0;
                    *((_WORD *)v992 + 48) = v1090;
                    *((_WORD *)v992 + 49) = v1125;
                    *((unsigned char *)v992 + 100) = v1077;
                    *((unsigned char *)v992 + 103) = BYTE2(__src[0]);
                    *(_WORD *)((char *)v992 + 101) = __src[0];
                    v992[13] = v1110;
                    v992[14] = v1086;
                    v992[15] = v1184;
                    v992[16] = v1170;
                    v992[17] = v1117;
                    uint64_t v993 = *find_entry((uint64_t)ht, (unsigned char *)v992 + 8, 8uLL, 0);
                    if (v993) {
                      uint64_t v993 = *(void *)(v993 + 32);
                    }
                    v992[4] = v993;
                    apr_hash_set(ht, v992 + 1, 8, v992);
                    v992[3] = v241;
                  }
                  goto LABEL_1211;
                }
                uint64_t v246 = v1239;
                if (v242 > -10219)
                {
                  if (v242 <= -10210)
                  {
                    int v247 = HIDWORD(v236);
                    if (v242 == -10218)
                    {
                      uint64_t v1184 = *((void *)GTTraceFunc_argumentBytesWithMap((void *)v240, *(unsigned __int8 *)(v237 + (v239 << 6) + 13), v1239)+ 1);
                    }
                    else if (v242 == -10215)
                    {
                      int v1157 = *((_DWORD *)GTTraceFunc_argumentBytesWithMap((void *)v240, *(unsigned __int8 *)(v237 + (v239 << 6) + 13), v1239)+ 2);
                    }
                  }
                  else
                  {
                    int v247 = HIDWORD(v236);
                    switch(v242)
                    {
                      case -10209:
                        uint64_t v1074 = *((void *)GTTraceFunc_argumentBytesWithMap((void *)v240, *(unsigned __int8 *)(v237 + (v239 << 6) + 13), v1239)+ 1);
                        break;
                      case -10202:
                        uint64_t v1139 = *((void *)GTTraceFunc_argumentBytesWithMap((void *)v240, *(unsigned __int8 *)(v237 + (v239 << 6) + 13), v1239)+ 1);
                        break;
                      case -10166:
                        uint64_t v1170 = *((void *)GTTraceFunc_argumentBytesWithMap((void *)v240, *(unsigned __int8 *)(v237 + (v239 << 6) + 13), v1239)+ 1);
                        break;
                    }
                  }
                }
                else
                {
                  int v247 = HIDWORD(v236);
                  switch(v242)
                  {
                    case -15925:
                      v248 = GTTraceFunc_argumentBytesWithMap((void *)v240, *(unsigned __int8 *)(v237 + (v239 << 6) + 13), v1239);
                      v1083 = GTTraceFunc_argumentBytesWithMap((void *)v240, v248[8], v246);
                      break;
                    case -15924:
                      int v1203 = *((_DWORD *)GTTraceFunc_argumentBytesWithMap((void *)v240, *(unsigned __int8 *)(v237 + (v239 << 6) + 13), v1239)+ 2);
                      break;
                    case -15923:
                      uint64_t v1080 = *(void *)v240;
                      break;
                    case -15922:
                    case -15921:
                      break;
                    case -15920:
                      uint64_t v252 = *((void *)GTTraceFunc_argumentBytesWithMap((void *)v240, *(unsigned __int8 *)(v237 + (v239 << 6) + 13), v1239)+ 2);
                      int v253 = v1125;
                      if (v252 != 1) {
                        int v253 = v252;
                      }
                      int v1125 = v253;
                      break;
                    case -15919:
                      char v1077 = 1;
                      break;
                    default:
                      if (v242 == -15972 || v242 == -15969)
                      {
                        uint64_t v249 = v237 + (v239 << 6);
                        v250 = GTTraceFunc_argumentBytesWithMap((void *)v240, *(unsigned __int8 *)(v249 + 13), v1239);
                        int v235 = *(_DWORD *)HIDWORD(v236);
                        uint64_t v1094 = *((void *)v250 + 1);
                        uint64_t v1098 = *(void *)v250;
                        unint64_t v1103 = *(void *)v240;
                        v1110 = GTTraceFunc_argumentBytesWithMap((void *)v240, v250[32], v246);
                        unsigned int v1117 = *((_DWORD *)v250 + 4);
                        __int16 v1090 = *((_WORD *)v250 + 12);
                        v251 = GTTraceFunc_argumentBytesWithMap((void *)v240, *(unsigned __int8 *)(v249 + 14), v246);
                        if (v251)
                        {
                          uint64_t v1139 = *(void *)v251;
                          int v1157 = *((_DWORD *)v251 + 2);
                          int v1203 = *((_DWORD *)v251 + 4);
                          v1086 = v251;
                          uint64_t v1170 = *((void *)v251 + 6);
                          uint64_t v1184 = *((void *)v251 + 3);
                        }
                        else
                        {
                          v1086 = 0;
                        }
                        uint64_t v237 = v62 + 64;
                      }
                      int v247 = HIDWORD(v236);
                      break;
                  }
                }
                unsigned int v254 = atomic_load((unsigned int *)(v62 + 4));
                int v255 = v236 + (v254 >> 6);
                uint64_t v256 = (v247 + 1);
                unint64_t v236 = (v256 << 32) | v236;
                if (v256 == v255 - 1)
                {
                  unint64_t v236 = (v256 << 32) | v256;
                  uint64_t v62 = *(void *)(v62 + 40);
                  continue;
                }
                goto LABEL_302;
              }
            }
          }
          break;
        }
        v257 = apr_palloc(p, 0x90uLL);
        *(_DWORD *)v257 = 57;
        *((_DWORD *)v257 + 1) = v235;
        v257[1] = v1094;
        v257[2] = v1103;
        v257[3] = v1080;
        v257[4] = 0;
        v257[5] = v1098;
        v257[6] = 0;
        v257[7] = v1139;
        v257[8] = v1074;
        v257[9] = v1083;
        *((_DWORD *)v257 + 20) = 0;
        *((_DWORD *)v257 + 21) = v1157;
        *((_DWORD *)v257 + 22) = v1203;
        *((_DWORD *)v257 + 23) = 0;
        *((_WORD *)v257 + 48) = v1090;
        *((_WORD *)v257 + 49) = v1125;
        *((unsigned char *)v257 + 100) = v1077;
        *((unsigned char *)v257 + 103) = BYTE2(__src[0]);
        *(_WORD *)((char *)v257 + 101) = __src[0];
        v257[13] = v1110;
        v257[14] = v1086;
        v257[15] = v1184;
        v257[16] = v1170;
        v257[17] = v1117;
        uint64_t v258 = *find_entry((uint64_t)ht, (unsigned char *)v257 + 8, 8uLL, 0);
        if (v258) {
          uint64_t v258 = *(void *)(v258 + 32);
        }
        v257[4] = v258;
        apr_hash_set(ht, v257 + 1, 8, v257);
        v257[3] = -1;
        goto LABEL_1211;
      case 6:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD2(v1241);
        memset(__src, 0, 24);
        memset(&__src[2], 0, 144);
        LODWORD(__src[0]) = 83;
        *((void *)&__src[1] + 1) = -1;
        uint64_t v66 = *(void *)(v37 + 32);
        if (v66)
        {
          unsigned int v67 = 0;
          while (1)
          {
            unsigned int v68 = atomic_load((unsigned int *)(v66 + 4));
            uint64_t v69 = v67 + (v68 >> 6) - 1;
            if ((int)v69 > 0) {
              break;
            }
            uint64_t v66 = *(void *)(v66 + 40);
            unsigned int v67 = v69;
            if (!v66)
            {
              unsigned int v67 = v69;
              goto LABEL_349;
            }
          }
        }
        else
        {
          unsigned int v67 = 0;
        }
        uint64_t v69 = 0;
LABEL_349:
        unint64_t v259 = v67 | (unint64_t)(v69 << 32);
        while (2)
        {
          uint64_t v260 = v66 + 64;
LABEL_351:
          if (v66)
          {
            if ((*(unsigned char *)(v260 + ((uint64_t)(HIDWORD(v259) - (int)v259) << 6) + 15) & 8) != 0)
            {
              uint64_t v261 = v260 + ((uint64_t)(HIDWORD(v259) - (int)v259) << 6);
              unint64_t v262 = *(void *)v261;
              if (*(void *)v261 < v1236 + v1235)
              {
                int v263 = *(_DWORD *)(v261 + 8);
                if (v263 > -15600)
                {
                  if (v263 != -15596 && v263 != -15599) {
                    goto LABEL_366;
                  }
                  goto LABEL_361;
                }
                if (v263 == -15607)
                {
LABEL_361:
                  if (v1235 <= v262)
                  {
                    v265 = apr_palloc(p, 0xB0uLL);
                    long long v267 = __src[1];
                    long long v266 = __src[2];
                    *(_OWORD *)v265 = __src[0];
                    *((_OWORD *)v265 + 1) = v267;
                    *((_OWORD *)v265 + 2) = v266;
                    long long v268 = __src[6];
                    long long v270 = __src[3];
                    long long v269 = __src[4];
                    *((_OWORD *)v265 + 5) = __src[5];
                    *((_OWORD *)v265 + 6) = v268;
                    *((_OWORD *)v265 + 3) = v270;
                    *((_OWORD *)v265 + 4) = v269;
                    long long v271 = __src[10];
                    long long v273 = __src[7];
                    long long v272 = __src[8];
                    *((_OWORD *)v265 + 9) = __src[9];
                    *((_OWORD *)v265 + 10) = v271;
                    *((_OWORD *)v265 + 7) = v273;
                    *((_OWORD *)v265 + 8) = v272;
                    uint64_t v274 = *find_entry((uint64_t)ht, (unsigned char *)v265 + 8, 8uLL, 0);
                    if (v274) {
                      uint64_t v274 = *(void *)(v274 + 32);
                    }
                    v265[4] = v274;
                    apr_hash_set(ht, v265 + 1, 8, v265);
                    v265[3] = v262;
                  }
LABEL_366:
                  GTMTLSMVisibleFunctionTable_processTraceFuncWithMap((char *)__src, v1239, (uint64_t *)v261);
                  unsigned int v275 = atomic_load((unsigned int *)(v66 + 4));
                  int v276 = v259 + (v275 >> 6);
                  uint64_t v277 = (HIDWORD(v259) + 1);
                  unint64_t v259 = (v277 << 32) | v259;
                  if (v277 == v276 - 1)
                  {
                    unint64_t v259 = (v277 << 32) | v277;
                    uint64_t v66 = *(void *)(v66 + 40);
                    continue;
                  }
                  goto LABEL_351;
                }
                if (v263 != -15605) {
                  goto LABEL_366;
                }
                v278 = apr_palloc(p, 0xB0uLL);
                long long v998 = __src[1];
                long long v997 = __src[2];
                _OWORD *v278 = __src[0];
                v278[1] = v998;
                v278[2] = v997;
                long long v999 = __src[6];
                long long v1001 = __src[3];
                long long v1000 = __src[4];
                v278[5] = __src[5];
                v278[6] = v999;
                v278[3] = v1001;
                v278[4] = v1000;
                long long v1002 = __src[10];
                long long v1004 = __src[7];
                long long v1003 = __src[8];
                v278[9] = __src[9];
                v278[10] = v1002;
                v278[7] = v1004;
                v278[8] = v1003;
                goto LABEL_1303;
              }
            }
          }
          break;
        }
        v278 = apr_palloc(p, 0xB0uLL);
        long long v280 = __src[1];
        long long v279 = __src[2];
        _OWORD *v278 = __src[0];
        v278[1] = v280;
        v278[2] = v279;
        long long v281 = __src[6];
        long long v283 = __src[3];
        long long v282 = __src[4];
        v278[5] = __src[5];
        v278[6] = v281;
        v278[3] = v283;
        v278[4] = v282;
        long long v284 = __src[10];
        long long v286 = __src[7];
        long long v285 = __src[8];
        v278[9] = __src[9];
        v278[10] = v284;
        v278[7] = v286;
        v278[8] = v285;
        goto LABEL_1155;
      case 7:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        memset(__src, 0, 24);
        memset(&__src[5], 0, 88);
        memset(&__src[2], 0, 32);
        LODWORD(__src[0]) = 60;
        *((void *)&__src[1] + 1) = -1;
        WORD1(__src[6]) = 2;
        __src[4] = 0xFFFFFFFFFFFFFFFFLL;
        ++HIDWORD(v1241);
        uint64_t v70 = *(void *)(v37 + 32);
        if (v70 && (*(unsigned char *)(v70 + 79) & 8) != 0) {
          v71 = (uint64_t *)(v70 + 64);
        }
        else {
          v71 = 0;
        }
        GTMTLSMIntersectionFunctionTable_processTraceFuncWithMap((char *)__src, v1239, v71);
        uint64_t v874 = *(void *)(v37 + 32);
        if (v874)
        {
          unsigned int v875 = 0;
          while (1)
          {
            unsigned int v876 = atomic_load((unsigned int *)(v874 + 4));
            uint64_t v877 = v875 + (v876 >> 6) - 1;
            if ((int)v877 > 1) {
              break;
            }
            uint64_t v874 = *(void *)(v874 + 40);
            unsigned int v875 = v877;
            if (!v874)
            {
              unsigned int v875 = v877;
              goto LABEL_1135;
            }
          }
          uint64_t v877 = 1;
        }
        else
        {
          unsigned int v875 = 0;
          uint64_t v877 = 0;
        }
LABEL_1135:
        unint64_t v878 = v875 | (unint64_t)(v877 << 32);
        while (2)
        {
          uint64_t v879 = v874 + 64;
LABEL_1137:
          if (v874)
          {
            if ((*(unsigned char *)(v879 + ((uint64_t)(HIDWORD(v878) - (int)v878) << 6) + 15) & 8) != 0)
            {
              uint64_t v880 = v879 + ((uint64_t)(HIDWORD(v878) - (int)v878) << 6);
              unint64_t v262 = *(void *)v880;
              if (*(void *)v880 < v1236 + v1235)
              {
                int v881 = *(_DWORD *)(v880 + 8);
                if (v881 > -15561)
                {
                  if (v881 != -15557 && v881 != -15560) {
                    goto LABEL_1152;
                  }
                  goto LABEL_1147;
                }
                if (v881 == -15570)
                {
LABEL_1147:
                  if (v1235 <= v262)
                  {
                    v883 = apr_palloc(p, 0xA8uLL);
                    long long v885 = __src[1];
                    long long v884 = __src[2];
                    *(_OWORD *)v883 = __src[0];
                    *((_OWORD *)v883 + 1) = v885;
                    *((_OWORD *)v883 + 2) = v884;
                    long long v886 = __src[6];
                    long long v888 = __src[3];
                    long long v887 = __src[4];
                    *((_OWORD *)v883 + 5) = __src[5];
                    *((_OWORD *)v883 + 6) = v886;
                    *((_OWORD *)v883 + 3) = v888;
                    *((_OWORD *)v883 + 4) = v887;
                    long long v890 = __src[8];
                    long long v889 = __src[9];
                    long long v891 = __src[7];
                    v883[20] = *(void *)&__src[10];
                    *((_OWORD *)v883 + 8) = v890;
                    *((_OWORD *)v883 + 9) = v889;
                    *((_OWORD *)v883 + 7) = v891;
                    uint64_t v892 = *find_entry((uint64_t)ht, (unsigned char *)v883 + 8, 8uLL, 0);
                    if (v892) {
                      uint64_t v892 = *(void *)(v892 + 32);
                    }
                    v883[4] = v892;
                    apr_hash_set(ht, v883 + 1, 8, v883);
                    v883[3] = v262;
                  }
LABEL_1152:
                  GTMTLSMIntersectionFunctionTable_processTraceFuncWithMap((char *)__src, v1239, (uint64_t *)v880);
                  unsigned int v893 = atomic_load((unsigned int *)(v874 + 4));
                  int v894 = v878 + (v893 >> 6);
                  uint64_t v895 = (HIDWORD(v878) + 1);
                  unint64_t v878 = (v895 << 32) | v878;
                  if (v895 == v894 - 1)
                  {
                    unint64_t v878 = (v895 << 32) | v895;
                    uint64_t v874 = *(void *)(v874 + 40);
                    continue;
                  }
                  goto LABEL_1137;
                }
                if (v881 != -15568) {
                  goto LABEL_1152;
                }
                if (v1235 > v262) {
                  goto LABEL_1211;
                }
                v278 = apr_palloc(p, 0xA8uLL);
                long long v1023 = __src[1];
                long long v1022 = __src[2];
                _OWORD *v278 = __src[0];
                v278[1] = v1023;
                v278[2] = v1022;
                long long v1024 = __src[6];
                long long v1026 = __src[3];
                long long v1025 = __src[4];
                v278[5] = __src[5];
                v278[6] = v1024;
                v278[3] = v1026;
                v278[4] = v1025;
                long long v1028 = __src[8];
                long long v1027 = __src[9];
                long long v1029 = __src[7];
                *((void *)v278 + 20) = *(void *)&__src[10];
                v278[8] = v1028;
                v278[9] = v1027;
                v278[7] = v1029;
LABEL_1303:
                uint64_t v1044 = *find_entry((uint64_t)ht, (unsigned char *)v278 + 8, 8uLL, 0);
                if (v1044) {
                  uint64_t v1044 = *(void *)(v1044 + 32);
                }
                *((void *)v278 + 4) = v1044;
                apr_hash_set(ht, (char *)v278 + 8, 8, v278);
LABEL_1158:
                *((void *)v278 + 3) = v262;
                goto LABEL_1211;
              }
            }
          }
          break;
        }
        v278 = apr_palloc(p, 0xA8uLL);
        long long v897 = __src[1];
        long long v896 = __src[2];
        _OWORD *v278 = __src[0];
        v278[1] = v897;
        v278[2] = v896;
        long long v898 = __src[6];
        long long v900 = __src[3];
        long long v899 = __src[4];
        v278[5] = __src[5];
        v278[6] = v898;
        v278[3] = v900;
        v278[4] = v899;
        long long v902 = __src[8];
        long long v901 = __src[9];
        long long v903 = __src[7];
        *((void *)v278 + 20) = *(void *)&__src[10];
        v278[8] = v902;
        v278[9] = v901;
        v278[7] = v903;
        goto LABEL_1155;
      case 8:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        memset(__src, 0, 24);
        memset(&__src[5], 0, 128);
        memset(&__src[2], 0, 32);
        LODWORD(__src[0]) = 16;
        *((void *)&__src[1] + 1) = -1;
        WORD1(__src[6]) = 2;
        __src[4] = 0xFFFFFFFFFFFFFFFFLL;
        LODWORD(v1242) = v1242 + 1;
        uint64_t v72 = *(void *)(v37 + 32);
        if (v72 && (*(unsigned char *)(v72 + 79) & 8) != 0) {
          v73 = (uint64_t *)(v72 + 64);
        }
        else {
          v73 = 0;
        }
        GTMTLSMAccelerationStructure_processTraceFuncWithMap((char *)__src, v1239, v73);
        v905 = *(void **)(a3 + 24);
        uint64_t v906 = *(void *)(v37 + 32);
        if (v906)
        {
          unsigned int v907 = 0;
          while (1)
          {
            unsigned int v908 = atomic_load((unsigned int *)(v906 + 4));
            uint64_t v909 = v907 + (v908 >> 6) - 1;
            if ((int)v909 > 1) {
              break;
            }
            uint64_t v906 = *(void *)(v906 + 40);
            unsigned int v907 = v909;
            if (!v906)
            {
              unsigned int v907 = v909;
              goto LABEL_1167;
            }
          }
          uint64_t v909 = 1;
        }
        else
        {
          unsigned int v907 = 0;
          uint64_t v909 = 0;
        }
LABEL_1167:
        v910 = &v905[8 * (uint64_t)*(int *)(a3 + 12)];
        unint64_t v911 = v907 | (unint64_t)(v909 << 32);
        do
        {
LABEL_1168:
          if (v906
            && (uint64_t v912 = v906 + ((uint64_t)(0xFFFFFFFF00000001 * v911) >> 32 << 6), (*(unsigned char *)(v912 + 79) & 8) != 0))
          {
            uint64_t v913 = v912 + 64;
          }
          else
          {
            uint64_t v913 = 0;
          }
          if (v905 >= v910)
          {
            if (!v913) {
              goto LABEL_1207;
            }
            unint64_t v914 = HIDWORD(v911);
            if (v906 && (uint64_t v915 = v906 + ((uint64_t)(HIDWORD(v911) - (int)v911) << 6), (*(unsigned char *)(v915 + 79) & 8) != 0)) {
              uint64_t v913 = v915 + 64;
            }
            else {
              uint64_t v913 = 0;
            }
            unsigned int v918 = atomic_load((unsigned int *)(v906 + 4));
            int v917 = v911 + (v918 >> 6);
          }
          else
          {
            if (!v913) {
              goto LABEL_1181;
            }
            if (*v905 == *(void *)v913)
            {
              v905 += 8;
            }
            else if (*v905 < *(void *)v913)
            {
LABEL_1181:
              uint64_t v913 = (uint64_t)v905;
              v905 += 8;
              goto LABEL_1188;
            }
            unsigned int v916 = atomic_load((unsigned int *)(v906 + 4));
            int v917 = v911 + (v916 >> 6);
            unint64_t v914 = HIDWORD(v911);
          }
          uint64_t v919 = (v914 + 1);
          if (v919 == v917 - 1)
          {
            unint64_t v911 = (v919 << 32) | v919;
            uint64_t v906 = *(void *)(v906 + 40);
          }
          else
          {
            unint64_t v911 = (v919 << 32) | v911;
          }
LABEL_1188:
          if (*(void *)v913 >= v1236 + v1235)
          {
LABEL_1207:
            v530 = (char *)apr_palloc(p, 0xD0uLL);
            *(_OWORD *)v530 = __src[0];
            long long v935 = __src[4];
            long long v937 = __src[1];
            long long v936 = __src[2];
            *((_OWORD *)v530 + 3) = __src[3];
            *((_OWORD *)v530 + 4) = v935;
            *((_OWORD *)v530 + 1) = v937;
            *((_OWORD *)v530 + 2) = v936;
            long long v938 = __src[8];
            long long v940 = __src[5];
            long long v939 = __src[6];
            *((_OWORD *)v530 + 7) = __src[7];
            *((_OWORD *)v530 + 8) = v938;
            *((_OWORD *)v530 + 5) = v940;
            *((_OWORD *)v530 + 6) = v939;
            long long v942 = __src[11];
            long long v941 = __src[12];
            long long v943 = __src[10];
            *((_OWORD *)v530 + 9) = __src[9];
            *((_OWORD *)v530 + 10) = v943;
            *((_OWORD *)v530 + 11) = v942;
            *((_OWORD *)v530 + 12) = v941;
            uint64_t v944 = *find_entry((uint64_t)ht, v530 + 8, 8uLL, 0);
            if (v944) {
              uint64_t v944 = *(void *)(v944 + 32);
            }
            *((void *)v530 + 4) = v944;
            apr_hash_set(ht, v530 + 8, 8, v530);
            uint64_t v544 = -1;
            goto LABEL_1210;
          }
          int v920 = *(_DWORD *)(v913 + 8);
          if (v920 == -10154 || v920 == -10158) {
            v921 = (char *)*((void *)GTTraceFunc_argumentBytesWithMap((void *)v913, *(unsigned __int8 *)(v913 + 13), v1239)+ 1);
          }
          else {
            v921 = GTTraceFunc_targetContext(v913, v1239);
          }
        }
        while (v921 != *((char **)&__src[0] + 1));
        int v922 = *(_DWORD *)(v913 + 8);
        if (v922 > -15553)
        {
          if (v922 == -15552 || v922 == -10154 || v922 == -10158)
          {
LABEL_1202:
            uint64_t v923 = *(void *)v913;
            if (v1235 <= *(void *)v913)
            {
              v924 = apr_palloc(p, 0xD0uLL);
              *(_OWORD *)v924 = __src[0];
              long long v925 = __src[4];
              long long v927 = __src[1];
              long long v926 = __src[2];
              *((_OWORD *)v924 + 3) = __src[3];
              *((_OWORD *)v924 + 4) = v925;
              *((_OWORD *)v924 + 1) = v927;
              *((_OWORD *)v924 + 2) = v926;
              long long v928 = __src[8];
              long long v930 = __src[5];
              long long v929 = __src[6];
              *((_OWORD *)v924 + 7) = __src[7];
              *((_OWORD *)v924 + 8) = v928;
              *((_OWORD *)v924 + 5) = v930;
              *((_OWORD *)v924 + 6) = v929;
              long long v932 = __src[11];
              long long v931 = __src[12];
              long long v933 = __src[10];
              *((_OWORD *)v924 + 9) = __src[9];
              *((_OWORD *)v924 + 10) = v933;
              *((_OWORD *)v924 + 11) = v932;
              *((_OWORD *)v924 + 12) = v931;
              uint64_t v934 = *find_entry((uint64_t)ht, (unsigned char *)v924 + 8, 8uLL, 0);
              if (v934) {
                uint64_t v934 = *(void *)(v934 + 32);
              }
              v924[4] = v934;
              apr_hash_set(ht, v924 + 1, 8, v924);
              v924[3] = v923;
            }
          }
LABEL_1206:
          GTMTLSMAccelerationStructure_processTraceFuncWithMap((char *)__src, v1239, (uint64_t *)v913);
          goto LABEL_1168;
        }
        if ((v922 + 15651) < 2 || v922 == -15661) {
          goto LABEL_1202;
        }
        if (v922 != -15659) {
          goto LABEL_1206;
        }
        uint64_t v544 = *(void *)v913;
        if (v1235 <= *(void *)v913)
        {
          v530 = (char *)apr_palloc(p, 0xD0uLL);
          *(_OWORD *)v530 = __src[0];
          long long v1034 = __src[4];
          long long v1036 = __src[1];
          long long v1035 = __src[2];
          *((_OWORD *)v530 + 3) = __src[3];
          *((_OWORD *)v530 + 4) = v1034;
          *((_OWORD *)v530 + 1) = v1036;
          *((_OWORD *)v530 + 2) = v1035;
          long long v1037 = __src[8];
          long long v1039 = __src[5];
          long long v1038 = __src[6];
          *((_OWORD *)v530 + 7) = __src[7];
          *((_OWORD *)v530 + 8) = v1037;
          *((_OWORD *)v530 + 5) = v1039;
          *((_OWORD *)v530 + 6) = v1038;
          long long v1041 = __src[11];
          long long v1040 = __src[12];
          long long v1042 = __src[10];
          *((_OWORD *)v530 + 9) = __src[9];
          *((_OWORD *)v530 + 10) = v1042;
          *((_OWORD *)v530 + 11) = v1041;
          *((_OWORD *)v530 + 12) = v1040;
          v777 = ht;
          v543 = v530 + 8;
LABEL_1009:
          uint64_t v778 = *find_entry((uint64_t)v777, v543, 8uLL, 0);
          if (v778) {
            uint64_t v778 = *(void *)(v778 + 32);
          }
          *((void *)v530 + 4) = v778;
          apr_hash_set(ht, v543, 8, v530);
LABEL_1210:
          *((void *)v530 + 3) = v544;
        }
LABEL_1211:
        uint64_t v16 = v1219;
LABEL_1212:
        if (++v14 != (uint64_t *)v16) {
          continue;
        }
LABEL_1306:
        v1045 = (char *)apr_palloc(v1218, 0x120uLL);
        v21 = (uint64_t *)v1045;
        if (v1045)
        {
          *(_OWORD *)(v1045 + 8) = 0u;
          *((void *)v1045 + 35) = 0;
          *(_OWORD *)(v1045 + 248) = 0u;
          *(_OWORD *)(v1045 + 264) = 0u;
          *(_OWORD *)(v1045 + 216) = 0u;
          *(_OWORD *)(v1045 + 232) = 0u;
          *(_OWORD *)(v1045 + 184) = 0u;
          *(_OWORD *)(v1045 + 200) = 0u;
          *(_OWORD *)(v1045 + 152) = 0u;
          *(_OWORD *)(v1045 + 168) = 0u;
          *(_OWORD *)(v1045 + 120) = 0u;
          *(_OWORD *)(v1045 + 136) = 0u;
          *(_OWORD *)(v1045 + 88) = 0u;
          *(_OWORD *)(v1045 + 104) = 0u;
          *(_OWORD *)(v1045 + 56) = 0u;
          *(_OWORD *)(v1045 + 72) = 0u;
          *(_OWORD *)(v1045 + 24) = 0u;
          *(_OWORD *)(v1045 + 40) = 0u;
        }
        uint64_t v1046 = 0;
        *(void *)v1045 = ht;
        do
        {
          v21[v1046 + 1] = (uint64_t)apr_array_make(v1218, *((_DWORD *)&v1240 + v1046), 8);
          ++v1046;
        }
        while (v1046 != 35);
        uint64_t v1047 = *v21;
        v1048 = (apr_hash_index_t *)(*v21 + 16);
        *(void *)(v1047 + 24) = 0;
        *(void *)(v1047 + 32) = 0;
        *(void *)(v1047 + 16) = v1047;
        *(_DWORD *)(v1047 + 40) = 0;
        v1049 = apr_hash_next(v1048);
        if (v1049)
        {
          v1050 = v1049;
          do
          {
            v1051 = *(_DWORD **)(*((void *)v1050 + 1) + 32);
            unsigned int v1052 = *v1051 - 2;
            if (v1052 <= 0x51)
            {
              uint64_t v1053 = byte_4CA018[v1052];
              if (v1053 != -1) {
                *(void *)apr_array_push((apr_array_header_t *)v21[v1053 + 1]) = v1051;
              }
            }
            v1050 = apr_hash_next(v1050);
          }
          while (v1050);
        }
        uint64_t v1054 = v21[30];
        uint64_t v1055 = *(unsigned int *)(v1054 + 12);
        if ((int)v1055 >= 1)
        {
          unint64_t v1056 = v1055 + 1;
          do
          {
            uint64_t v1057 = (v1056 - 2);
            uint64_t v1058 = *(void *)(*(void *)(v1054 + 24) + 8 * v1057);
            *(void *)&__src[0] = *(void *)(v1058 + 48);
            uint64_t v1059 = *find_entry(*v21, __src, 8uLL, 0);
            if (!v1059 || !*(void *)(v1059 + 32))
            {
              apr_hash_set((apr_hash_t *)*v21, (const void *)(v1058 + 8), 8, 0);
              int v1060 = *(_DWORD *)(v1054 + 12);
              *(void *)(*(void *)(v1054 + 24) + 8 * v1057) = *(void *)(*(void *)(v1054 + 24) + 8 * (v1060 - 1));
              if (v1060) {
                *(_DWORD *)(v1054 + 12) = v1060 - 1;
              }
            }
            --v1056;
          }
          while (v1056 > 1);
        }
        for (uint64_t i = 1; i != 36; ++i)
          qsort(*(void **)(v21[i] + 24), *(int *)(v21[i] + 12), *(int *)(v21[i] + 8), (int (__cdecl *)(const void *, const void *))GTMTLSMObject_compare);
        return v21;
      case 9:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        WORD2(__src[0]) = 0;
        LODWORD(__src[0]) = 0;
        ++DWORD1(v1242);
        uint64_t v74 = *(void *)(v37 + 32);
        if (v74)
        {
          unsigned int v75 = 0;
          while (1)
          {
            unsigned int v76 = atomic_load((unsigned int *)(v74 + 4));
            uint64_t v77 = v75 + (v76 >> 6) - 1;
            if ((int)v77 > 0) {
              break;
            }
            uint64_t v74 = *(void *)(v74 + 40);
            unsigned int v75 = v77;
            if (!v74)
            {
              unsigned int v75 = v77;
              goto LABEL_371;
            }
          }
        }
        else
        {
          unsigned int v75 = 0;
        }
        uint64_t v77 = 0;
LABEL_371:
        int v1118 = 0;
        uint64_t v1126 = 0;
        v1140 = 0;
        uint64_t v1185 = 0;
        v1204 = 0;
        uint64_t v1099 = 0;
        int v1104 = 0;
        int v1111 = 0;
        int v1221 = 2;
        unint64_t v1158 = 0;
        uint64_t v1171 = -1;
        unint64_t v287 = v75 | (unint64_t)(v77 << 32);
        while (2)
        {
          uint64_t v288 = v74 + 64;
LABEL_373:
          if (v74)
          {
            int v289 = HIDWORD(v287) - v287;
            if ((*(unsigned char *)(v288 + ((uint64_t)(HIDWORD(v287) - (int)v287) << 6) + 15) & 8) != 0)
            {
              uint64_t v290 = v289;
              uint64_t v291 = v288 + ((uint64_t)v289 << 6);
              unint64_t v292 = *(void *)v291;
              if (*(void *)v291 < v1236 + v1235)
              {
                v294 = (int *)(v291 + 8);
                int v293 = *(_DWORD *)(v291 + 8);
                if (v293 > -10209)
                {
                  if ((v293 + 10208) >= 2) {
                    goto LABEL_388;
                  }
                }
                else if (v293 != -16119 && v293 != -16115)
                {
                  if (v293 == -16118)
                  {
                    if (v1235 > v292) {
                      goto LABEL_1211;
                    }
                    v1030 = (char *)apr_palloc(p, 0x58uLL);
                    *(_DWORD *)v1030 = 50;
                    *((_DWORD *)v1030 + 1) = v1118;
                    *((void *)v1030 + 1) = v1126;
                    v1031 = v1030 + 8;
                    *((void *)v1030 + 2) = v1158;
                    *((void *)v1030 + 3) = v1171;
                    *((void *)v1030 + 4) = 0;
                    *((void *)v1030 + 5) = v1185;
                    *((void *)v1030 + 6) = v1140;
                    *((void *)v1030 + 7) = v1204;
                    *((void *)v1030 + 8) = v1099;
                    *((_DWORD *)v1030 + 18) = v1104;
                    *((_DWORD *)v1030 + 19) = v1111;
                    *((_WORD *)v1030 + 40) = v1221;
                    *(_DWORD *)(v1030 + 82) = __src[0];
                    *((_WORD *)v1030 + 43) = WORD2(__src[0]);
LABEL_1296:
                    uint64_t v1033 = *find_entry((uint64_t)ht, v1031, 8uLL, 0);
                    if (v1033) {
                      uint64_t v1033 = *(void *)(v1033 + 32);
                    }
                    *((void *)v1030 + 4) = v1033;
                    apr_hash_set(ht, v1031, 8, v1030);
                    *((void *)v1030 + 3) = v292;
                    goto LABEL_1211;
                  }
LABEL_388:
                  uint64_t v298 = v1239;
                  if (v293 > -10212)
                  {
                    switch(v293)
                    {
                      case -10211:
                        uint64_t v1099 = *((void *)GTTraceFunc_argumentBytesWithMap((void *)v291, *(unsigned __int8 *)(v288 + (v290 << 6) + 13), v1239)+ 1);
                        break;
                      case -10208:
                        int v1104 = *((_DWORD *)GTTraceFunc_argumentBytesWithMap((void *)v291, *(unsigned __int8 *)(v288 + (v290 << 6) + 13), v1239)+ 2);
                        break;
                      case -10207:
                        int v1111 = *((_DWORD *)GTTraceFunc_argumentBytesWithMap((void *)v291, *(unsigned __int8 *)(v288 + (v290 << 6) + 13), v1239)+ 2);
                        break;
                    }
                  }
                  else
                  {
                    switch(v293)
                    {
                      case -16120:
                        v299 = GTTraceFunc_argumentBytesWithMap((void *)v291, *(unsigned __int8 *)(v288 + (v290 << 6) + 13), v1239);
                        unint64_t v1158 = *(void *)v291;
                        int v1118 = *v294;
                        uint64_t v1126 = *((void *)v299 + 1);
                        uint64_t v1185 = *(void *)v299;
                        v1140 = GTTraceFunc_argumentBytesWithMap((void *)v291, v299[16], v298);
                        break;
                      case -16119:
                        v300 = GTTraceFunc_argumentBytesWithMap((void *)v291, *(unsigned __int8 *)(v288 + (v290 << 6) + 13), v1239);
                        v1204 = GTTraceFunc_argumentBytesWithMap((void *)v291, v300[8], v298);
                        break;
                      case -16118:
                        uint64_t v1171 = *(void *)v291;
                        break;
                      case -16115:
                        uint64_t v301 = *((void *)GTTraceFunc_argumentBytesWithMap((void *)v291, *(unsigned __int8 *)(v288 + (v290 << 6) + 13), v1239)+ 2);
                        int v302 = v1221;
                        if (v301 != 1) {
                          int v302 = v301;
                        }
                        int v1221 = v302;
                        break;
                      default:
                        break;
                    }
                  }
                  unsigned int v303 = atomic_load((unsigned int *)(v74 + 4));
                  int v304 = v287 + (v303 >> 6);
                  uint64_t v305 = (HIDWORD(v287) + 1);
                  unint64_t v287 = (v305 << 32) | v287;
                  if (v305 == v304 - 1)
                  {
                    unint64_t v287 = (v305 << 32) | v305;
                    uint64_t v74 = *(void *)(v74 + 40);
                    continue;
                  }
                  goto LABEL_373;
                }
                if (v1235 <= v292)
                {
                  v296 = apr_palloc(p, 0x58uLL);
                  *(_DWORD *)v296 = 50;
                  *((_DWORD *)v296 + 1) = v1118;
                  v296[1] = v1126;
                  v296[2] = v1158;
                  v296[3] = v1171;
                  v296[4] = 0;
                  v296[5] = v1185;
                  v296[6] = v1140;
                  v296[7] = v1204;
                  v296[8] = v1099;
                  *((_DWORD *)v296 + 18) = v1104;
                  *((_DWORD *)v296 + 19) = v1111;
                  *((_WORD *)v296 + 40) = v1221;
                  *(_DWORD *)((char *)v296 + 82) = __src[0];
                  *((_WORD *)v296 + 43) = WORD2(__src[0]);
                  uint64_t v297 = *find_entry((uint64_t)ht, (unsigned char *)v296 + 8, 8uLL, 0);
                  if (v297) {
                    uint64_t v297 = *(void *)(v297 + 32);
                  }
                  v296[4] = v297;
                  apr_hash_set(ht, v296 + 1, 8, v296);
                  v296[3] = v292;
                  int v293 = *v294;
                  uint64_t v288 = v74 + 64;
                }
                goto LABEL_388;
              }
            }
          }
          break;
        }
        v306 = apr_palloc(p, 0x58uLL);
        *(_DWORD *)v306 = 50;
        *((_DWORD *)v306 + 1) = v1118;
        v306[1] = v1126;
        v307 = v306 + 1;
        v306[2] = v1158;
        v306[3] = v1171;
        v306[4] = 0;
        v306[5] = v1185;
        v306[6] = v1140;
        v306[7] = v1204;
        v306[8] = v1099;
        *((_DWORD *)v306 + 18) = v1104;
        *((_DWORD *)v306 + 19) = v1111;
        *((_WORD *)v306 + 40) = v1221;
        *(_DWORD *)((char *)v306 + 82) = __src[0];
        *((_WORD *)v306 + 43) = WORD2(__src[0]);
        goto LABEL_922;
      case 10:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        WORD2(__src[0]) = 0;
        LODWORD(__src[0]) = 0;
        ++DWORD2(v1242);
        uint64_t v78 = *(void *)(v37 + 32);
        if (v78)
        {
          unsigned int v79 = 0;
          while (1)
          {
            unsigned int v80 = atomic_load((unsigned int *)(v78 + 4));
            uint64_t v81 = v79 + (v80 >> 6) - 1;
            if ((int)v81 > 0) {
              break;
            }
            uint64_t v78 = *(void *)(v78 + 40);
            unsigned int v79 = v81;
            if (!v78)
            {
              unsigned int v79 = v81;
              goto LABEL_407;
            }
          }
        }
        else
        {
          unsigned int v79 = 0;
        }
        uint64_t v81 = 0;
LABEL_407:
        int v1205 = 0;
        uint64_t v1172 = 0;
        uint64_t v1186 = 0;
        unint64_t v1222 = 0;
        v1075 = 0;
        v1078 = 0;
        v1084 = 0;
        v1087 = 0;
        v1159 = 0;
        v1091 = 0;
        v1105 = 0;
        v1112 = 0;
        v1068 = 0;
        uint64_t v1070 = 0;
        v1127 = 0;
        uint64_t v1072 = 0;
        int v1081 = 0;
        int v1095 = 0;
        char v1119 = 0;
        char v1141 = 0;
        unint64_t v308 = v79 | (unint64_t)(v81 << 32);
        v1066 = 0;
        uint64_t v1067 = -1;
        while (2)
        {
          uint64_t v309 = v78 + 64;
LABEL_409:
          if (v78)
          {
            unint64_t v310 = HIDWORD(v308);
            int v311 = HIDWORD(v308) - v308;
            if ((*(unsigned char *)(v309 + ((uint64_t)(HIDWORD(v308) - (int)v308) << 6) + 15) & 8) != 0)
            {
              uint64_t v312 = v311;
              uint64_t v313 = v309 + ((uint64_t)v311 << 6);
              unint64_t v314 = *(void *)v313;
              if (*(void *)v313 < v1236 + v1235)
              {
                v316 = (int *)(v313 + 8);
                int v315 = *(_DWORD *)(v313 + 8);
                if (v315 == -16292)
                {
                  if (v1235 > v314)
                  {
                    uint64_t v317 = v1239;
                    goto LABEL_417;
                  }
                  int v1065 = v308;
                  v308 >>= 32;
                  v319 = apr_palloc(p, 0xA8uLL);
                  *(_DWORD *)v319 = 62;
                  *((_DWORD *)v319 + 1) = v1205;
                  v319[1] = v1186;
                  v319[2] = v1222;
                  v319[3] = v1067;
                  v319[4] = 0;
                  v319[5] = v1172;
                  v319[6] = v1078;
                  v319[7] = v1084;
                  v319[8] = v1159;
                  v319[9] = v1087;
                  v319[10] = v1066;
                  v319[11] = v1091;
                  v319[12] = v1105;
                  v319[13] = v1075;
                  v319[14] = v1112;
                  v319[15] = v1068;
                  v319[16] = v1127;
                  v319[17] = v1072;
                  v319[18] = v1070;
                  *((_DWORD *)v319 + 38) = v1081;
                  *((_DWORD *)v319 + 39) = v1095;
                  *((unsigned char *)v319 + 160) = v1119;
                  *((unsigned char *)v319 + 161) = v1141;
                  *((_WORD *)v319 + 83) = WORD2(__src[0]);
                  *(_DWORD *)((char *)v319 + 162) = __src[0];
                  uint64_t v320 = *find_entry((uint64_t)ht, (unsigned char *)v319 + 8, 8uLL, 0);
                  if (v320) {
                    uint64_t v320 = *(void *)(v320 + 32);
                  }
                  v319[4] = v320;
                  apr_hash_set(ht, v319 + 1, 8, v319);
                  v319[3] = v314;
                  int v315 = *v316;
                  LODWORD(v310) = v308;
                  LODWORD(v308) = v1065;
                }
                else if (v315 == -16291)
                {
                  v966 = (char *)apr_palloc(p, 0xA8uLL);
                  *(_DWORD *)v966 = 62;
                  *((_DWORD *)v966 + 1) = v1205;
                  *((void *)v966 + 1) = v1186;
                  *((void *)v966 + 2) = v1222;
                  *((void *)v966 + 3) = v1067;
                  *((void *)v966 + 4) = 0;
                  *((void *)v966 + 5) = v1172;
                  *((void *)v966 + 6) = v1078;
                  *((void *)v966 + 7) = v1084;
                  *((void *)v966 + 8) = v1159;
                  *((void *)v966 + 9) = v1087;
                  *((void *)v966 + 10) = v1066;
                  *((void *)v966 + 11) = v1091;
                  *((void *)v966 + 12) = v1105;
                  *((void *)v966 + 13) = v1075;
                  *((void *)v966 + 14) = v1112;
                  *((void *)v966 + 15) = v1068;
                  *((void *)v966 + 16) = v1127;
                  *((void *)v966 + 17) = v1072;
                  *((void *)v966 + 18) = v1070;
                  *((_DWORD *)v966 + 38) = v1081;
                  *((_DWORD *)v966 + 39) = v1095;
                  v966[160] = v1119;
                  v966[161] = v1141;
                  *((_WORD *)v966 + 83) = WORD2(__src[0]);
                  *(_DWORD *)(v966 + 162) = __src[0];
                  entry = find_entry((uint64_t)ht, v966 + 8, 8uLL, 0);
                  uint64_t v968 = *entry;
                  if (*entry) {
                    uint64_t v968 = *(void *)(v968 + 32);
                  }
                  *((void *)v966 + 4) = v968;
                  v969 = ht;
                  v970 = v966 + 8;
LABEL_1264:
                  apr_hash_set(v969, v970, 8, v966);
                  *((void *)v966 + 3) = v314;
                  goto LABEL_1211;
                }
                uint64_t v317 = v1239;
                if (v315 > -16030)
                {
                  if (v315 > -15435)
                  {
                    if (v315 <= -15420)
                    {
                      if (v315 != -15434 && v315 != -15421)
                      {
                        int v321 = -15420;
LABEL_436:
                        if (v315 != v321) {
                          goto LABEL_483;
                        }
                      }
LABEL_449:
                      uint64_t v331 = v309 + (v312 << 6);
                      v332 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v331 + 13), v1239);
                      unint64_t v1222 = *(void *)v313;
                      int v1205 = *v316;
                      uint64_t v1172 = *(void *)v332;
                      uint64_t v1186 = *((void *)v332 + 1);
                      v333 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v331 + 14), v317);
                      if (v333)
                      {
                        v1127 = (char *)*((void *)v333 + 1);
                        char v1119 = v333[16];
                      }
                      v1159 = v333;
                      v1087 = GTTraceFunc_argumentBytesWithMap((void *)v313, v332[24], v317);
                      v1091 = (char *)*((void *)v1087 + 1);
                      int v334 = *((unsigned __int16 *)v1087 + 9);
LABEL_452:
                      int v1095 = v334;
                      char v1141 = 6;
                      uint64_t v309 = v78 + 64;
                      goto LABEL_483;
                    }
                    switch(v315)
                    {
                      case -15419:
                        goto LABEL_449;
                      case -10188:
                        v358 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v309 + (v312 << 6) + 13), v1239);
                        v1127 = GTTraceFunc_argumentBytesWithMap((void *)v313, v358[8], v317);
                        break;
                      case -10183:
                        char v1119 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v309 + (v312 << 6) + 13), v1239)[8];
                        break;
                    }
LABEL_483:
                    unsigned int v359 = atomic_load((unsigned int *)(v78 + 4));
                    int v360 = v308 + (v359 >> 6);
                    uint64_t v361 = (v310 + 1);
                    unint64_t v308 = (v361 << 32) | v308;
                    if (v361 == v360 - 1)
                    {
                      unint64_t v308 = (v361 << 32) | v361;
                      uint64_t v78 = *(void *)(v78 + 40);
                      continue;
                    }
                    goto LABEL_409;
                  }
                  if (v315 <= -15848)
                  {
                    if (v315 != -16029 && v315 != -16018) {
                      goto LABEL_483;
                    }
                    int v322 = v310;
                    uint64_t v335 = v309 + (v312 << 6);
                    v336 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v335 + 13), v1239);
                    unint64_t v1222 = *(void *)v313;
                    int v1205 = *v316;
                    uint64_t v1172 = *(void *)v336;
                    uint64_t v1186 = *((void *)v336 + 1);
                    v337 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v335 + 14), v317);
                    if (v337)
                    {
                      v1127 = (char *)*((void *)v337 + 1);
                      char v1119 = v337[16];
                    }
                    v1159 = v337;
                    v338 = GTTraceFunc_argumentBytesWithMap((void *)v313, v336[24], v317);
                    if (v338)
                    {
                      int v1081 = *(_DWORD *)v338;
                      v1078 = v338 + 8;
                    }
                    v1084 = GTTraceFunc_argumentBytesWithMap((void *)v313, v336[25], v317);
                    char v326 = 4;
                  }
                  else
                  {
                    if (v315 != -15847)
                    {
                      if (v315 == -15693)
                      {
                        uint64_t v350 = v309 + (v312 << 6);
                        v351 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v350 + 13), v1239);
                        unint64_t v1222 = *(void *)v313;
                        int v1205 = *v316;
                        uint64_t v1172 = *(void *)v351;
                        uint64_t v1186 = *((void *)v351 + 1);
                        v352 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v350 + 14), v317);
                        if (v352)
                        {
                          v1127 = (char *)*((void *)v352 + 1);
                          char v1119 = v352[16];
                        }
                        v1159 = v352;
                        v1066 = GTTraceFunc_argumentBytesWithMap((void *)v313, v351[24], v317);
                        v353 = GTTraceFunc_argumentBytesWithMap((void *)v313, v351[25], v317);
                        int v334 = *(_DWORD *)v353;
                        v1091 = v353 + 8;
                        goto LABEL_452;
                      }
                      int v321 = -15435;
                      goto LABEL_436;
                    }
                    int v322 = v310;
                    uint64_t v347 = v309 + (v312 << 6);
                    v348 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v347 + 13), v1239);
                    unint64_t v1222 = *(void *)v313;
                    int v1205 = *v316;
                    uint64_t v1172 = *(void *)v348;
                    uint64_t v1186 = *((void *)v348 + 1);
                    v349 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v347 + 14), v317);
                    if (v349)
                    {
                      v1127 = (char *)*((void *)v349 + 1);
                      char v1119 = v349[16];
                    }
                    v1159 = v349;
                    v1078 = GTTraceFunc_argumentBytesWithMap((void *)v313, v348[32], v317);
                    int v1081 = *((_DWORD *)v348 + 4);
                    v1084 = GTTraceFunc_argumentBytesWithMap((void *)v313, v348[33], v317);
                    char v326 = 5;
                  }
                  goto LABEL_481;
                }
                if (v315 <= -16293)
                {
                  int v322 = v310;
                  switch(v315)
                  {
                    case -16308:
                      uint64_t v339 = v309 + (v312 << 6);
                      v340 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v339 + 13), v1239);
                      unint64_t v1222 = *(void *)v313;
                      int v1205 = *v316;
                      uint64_t v1172 = *(void *)v340;
                      uint64_t v1186 = *((void *)v340 + 1);
                      v341 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v339 + 14), v317);
                      v1159 = v341;
                      if (v341)
                      {
                        v342 = v341;
                        v1127 = (char *)*((void *)v341 + 1);
                        char v1119 = v341[16];
                        unsigned int v343 = v340[16];
                        goto LABEL_476;
                      }
                      unsigned int v362 = v340[16];
                      break;
                    case -16307:
                      goto LABEL_443;
                    case -16306:
                      uint64_t v344 = v309 + (v312 << 6);
                      v345 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v344 + 13), v1239);
                      unint64_t v1222 = *(void *)v313;
                      int v1205 = *v316;
                      uint64_t v1172 = *(void *)v345;
                      uint64_t v1186 = *((void *)v345 + 1);
                      v346 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v344 + 14), v317);
                      if (v346)
                      {
                        v1127 = (char *)*((void *)v346 + 1);
                        char v1119 = v346[16];
                      }
                      v1159 = v346;
                      v1105 = GTTraceFunc_argumentBytesWithMap((void *)v313, v345[24], v317);
                      char v326 = 3;
                      goto LABEL_481;
                    case -16305:
                    case -16304:
                      uint64_t v323 = v309 + (v312 << 6);
                      v324 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v323 + 13), v1239);
                      unint64_t v1222 = *(void *)v313;
                      int v1205 = *v316;
                      uint64_t v1172 = *(void *)v324;
                      uint64_t v1186 = *((void *)v324 + 1);
                      v325 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v323 + 14), v317);
                      if (v325)
                      {
                        v1127 = (char *)*((void *)v325 + 1);
                        char v1119 = v325[16];
                      }
                      v1159 = v325;
                      v1105 = GTTraceFunc_argumentBytesWithMap((void *)v313, v324[24], v317);
                      v1075 = GTTraceFunc_argumentBytesWithMap((void *)v313, v324[25], v317);
                      char v326 = 2;
                      goto LABEL_481;
                    default:
                      goto LABEL_483;
                  }
                  goto LABEL_487;
                }
                if (v315 > -16096)
                {
                  if (v315 != -16095)
                  {
                    if (v315 == -16083)
                    {
                      v357 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v309 + (v312 << 6) + 13), v1239);
                      v1068 = GTTraceFunc_argumentBytesWithMap((void *)v313, v357[8], v317);
                      goto LABEL_483;
                    }
                    if (v315 != -16039) {
                      goto LABEL_483;
                    }
                    int v322 = v310;
LABEL_443:
                    uint64_t v327 = v309 + (v312 << 6);
                    v328 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v327 + 13), v1239);
                    unint64_t v1222 = *(void *)v313;
                    int v1205 = *v316;
                    uint64_t v1172 = *(void *)v328;
                    uint64_t v1186 = *((void *)v328 + 1);
                    v329 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v327 + 14), v317);
                    v1159 = v329;
                    if (v329)
                    {
                      v330 = v329;
                      v1127 = (char *)*((void *)v329 + 1);
                      char v1119 = v329[16];
                      v1105 = GTTraceFunc_argumentBytesWithMap((void *)v313, v328[24], v317);
                      uint64_t v1072 = *(void *)v330;
                    }
                    else
                    {
                      v1105 = GTTraceFunc_argumentBytesWithMap((void *)v313, v328[24], v317);
                      uint64_t v1072 = 0;
                    }
                    char v326 = 1;
LABEL_481:
                    char v1141 = v326;
LABEL_482:
                    uint64_t v309 = v78 + 64;
                    LODWORD(v310) = v322;
                    goto LABEL_483;
                  }
                  int v322 = v310;
                  uint64_t v354 = v309 + (v312 << 6);
                  v355 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v354 + 13), v1239);
                  unint64_t v1222 = *(void *)v313;
                  int v1205 = *v316;
                  uint64_t v1172 = *(void *)v355;
                  uint64_t v1186 = *((void *)v355 + 1);
                  v356 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v354 + 14), v317);
                  v1159 = v356;
                  if (v356)
                  {
                    v342 = v356;
                    v1127 = (char *)*((void *)v356 + 1);
                    char v1119 = v356[16];
                    unsigned int v343 = v355[24];
LABEL_476:
                    v1105 = GTTraceFunc_argumentBytesWithMap((void *)v313, v343, v317);
                    char v1141 = 0;
                    uint64_t v1070 = *(void *)v342;
                    goto LABEL_482;
                  }
                  unsigned int v362 = v355[24];
LABEL_487:
                  v1105 = GTTraceFunc_argumentBytesWithMap((void *)v313, v362, v317);
                  uint64_t v1070 = 0;
                  char v1141 = 0;
                  goto LABEL_482;
                }
                if (v315 != -16292)
                {
                  if (v315 == -16291) {
                    uint64_t v1067 = *(void *)v313;
                  }
                  goto LABEL_483;
                }
LABEL_417:
                v318 = GTTraceFunc_argumentBytesWithMap((void *)v313, *(unsigned __int8 *)(v309 + (v312 << 6) + 13), v317);
                v1112 = GTTraceFunc_argumentBytesWithMap((void *)v313, v318[8], v317);
                goto LABEL_483;
              }
            }
          }
          break;
        }
        v363 = apr_palloc(p, 0xA8uLL);
        *(_DWORD *)v363 = 62;
        *((_DWORD *)v363 + 1) = v1205;
        v363[1] = v1186;
        v363[2] = v1222;
        v363[3] = v1067;
        v363[4] = 0;
        v363[5] = v1172;
        v363[6] = v1078;
        v363[7] = v1084;
        v363[8] = v1159;
        v363[9] = v1087;
        v363[10] = v1066;
        v363[11] = v1091;
        v363[12] = v1105;
        v363[13] = v1075;
        v363[14] = v1112;
        v363[15] = v1068;
        v363[16] = v1127;
        v363[17] = v1072;
        v363[18] = v1070;
        *((_DWORD *)v363 + 38) = v1081;
        *((_DWORD *)v363 + 39) = v1095;
        *((unsigned char *)v363 + 160) = v1119;
        *((unsigned char *)v363 + 161) = v1141;
        *((_WORD *)v363 + 83) = WORD2(__src[0]);
        *(_DWORD *)((char *)v363 + 162) = __src[0];
        uint64_t v364 = *find_entry((uint64_t)ht, (unsigned char *)v363 + 8, 8uLL, 0);
        if (v364) {
          uint64_t v364 = *(void *)(v364 + 32);
        }
        v363[4] = v364;
        v365 = ht;
        v366 = v363 + 1;
        goto LABEL_781;
      case 11:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        WORD2(__src[0]) = 0;
        LODWORD(__src[0]) = 0;
        ++HIDWORD(v1242);
        uint64_t v82 = *(void *)(v37 + 32);
        if (v82)
        {
          unsigned int v83 = 0;
          while (1)
          {
            unsigned int v84 = atomic_load((unsigned int *)(v82 + 4));
            uint64_t v85 = v83 + (v84 >> 6) - 1;
            if ((int)v85 > 0) {
              break;
            }
            uint64_t v82 = *(void *)(v82 + 40);
            unsigned int v83 = v85;
            if (!v82)
            {
              unsigned int v83 = v85;
              goto LABEL_493;
            }
          }
        }
        else
        {
          unsigned int v83 = 0;
        }
        uint64_t v85 = 0;
LABEL_493:
        int v1160 = 0;
        uint64_t v1173 = 0;
        unint64_t v1187 = 0;
        uint64_t v1206 = 0;
        v1100 = 0;
        uint64_t v1106 = 0;
        v1223 = 0;
        uint64_t v1142 = 0;
        __int16 v1128 = 0;
        long long v1120 = 0u;
        uint64_t v1113 = -1;
        unint64_t v367 = v83 | (unint64_t)(v85 << 32);
        while (2)
        {
          uint64_t v368 = v82 + 64;
LABEL_495:
          if (v82)
          {
            int v369 = HIDWORD(v367) - v367;
            if ((*(unsigned char *)(v368 + ((uint64_t)(HIDWORD(v367) - (int)v367) << 6) + 15) & 8) != 0)
            {
              uint64_t v370 = v369;
              uint64_t v371 = v368 + ((uint64_t)v369 << 6);
              unint64_t v372 = *(void *)v371;
              if (*(void *)v371 < v1236 + v1235)
              {
                v374 = (int *)(v371 + 8);
                int v373 = *(_DWORD *)(v371 + 8);
                if (v373 == -15676)
                {
                  if (v1235 > v372)
                  {
                    uint64_t v375 = v1239;
LABEL_509:
                    v378 = GTTraceFunc_argumentBytesWithMap((void *)v371, *(unsigned __int8 *)(v368 + (v370 << 6) + 13), v375);
                    v1223 = GTTraceFunc_argumentBytesWithMap((void *)v371, v378[8], v375);
                    goto LABEL_519;
                  }
                  v376 = apr_palloc(p, 0x70uLL);
                  *(_DWORD *)v376 = 37;
                  *((_DWORD *)v376 + 1) = v1160;
                  v376[1] = v1173;
                  v376[2] = v1187;
                  v376[3] = v1113;
                  v376[4] = 0;
                  v376[5] = v1206;
                  v376[6] = v1106;
                  v376[7] = 0;
                  v376[8] = v1223;
                  v376[9] = v1142;
                  v376[10] = v1100;
                  *(_OWORD *)(v376 + 11) = v1120;
                  *((_WORD *)v376 + 52) = v1128;
                  *(_DWORD *)((char *)v376 + 106) = __src[0];
                  *((_WORD *)v376 + 55) = WORD2(__src[0]);
                  uint64_t v377 = *find_entry((uint64_t)ht, (unsigned char *)v376 + 8, 8uLL, 0);
                  if (v377) {
                    uint64_t v377 = *(void *)(v377 + 32);
                  }
                  v376[4] = v377;
                  apr_hash_set(ht, v376 + 1, 8, v376);
                  v376[3] = v372;
                  int v373 = *v374;
                  uint64_t v368 = v82 + 64;
                }
                else if (v373 == -15675)
                {
                  v971 = apr_palloc(p, 0x70uLL);
                  *(_DWORD *)v971 = 37;
                  *((_DWORD *)v971 + 1) = v1160;
                  v971[1] = v1173;
                  v971[2] = v1187;
                  v971[3] = v1113;
                  v971[4] = 0;
                  v971[5] = v1206;
                  v971[6] = v1106;
                  v971[7] = 0;
                  v971[8] = v1223;
                  v971[9] = v1142;
                  v971[10] = v1100;
                  *(_OWORD *)(v971 + 11) = v1120;
                  *((_WORD *)v971 + 52) = v1128;
                  *(_DWORD *)((char *)v971 + 106) = __src[0];
                  *((_WORD *)v971 + 55) = WORD2(__src[0]);
                  v972 = find_entry((uint64_t)ht, (unsigned char *)v971 + 8, 8uLL, 0);
                  uint64_t v973 = *v972;
                  if (*v972) {
                    uint64_t v973 = *(void *)(v973 + 32);
                  }
                  v971[4] = v973;
                  apr_hash_set(ht, v971 + 1, 8, v971);
                  v971[3] = v372;
                  goto LABEL_1211;
                }
                uint64_t v375 = v1239;
                if (v373 > -15676)
                {
                  if (v373 == -15675)
                  {
                    uint64_t v1113 = *(void *)v371;
                  }
                  else if (v373 == -15613)
                  {
                    uint64_t v379 = v368 + (v370 << 6);
                    v380 = GTTraceFunc_argumentBytesWithMap((void *)v371, *(unsigned __int8 *)(v379 + 13), v1239);
                    int v1160 = *v374;
                    uint64_t v1173 = *((void *)v380 + 1);
                    unint64_t v1187 = *(void *)v371;
                    uint64_t v1206 = *(void *)v380;
                    v381 = GTTraceFunc_argumentBytesWithMap((void *)v371, *(unsigned __int8 *)(v379 + 14), v375);
                    if (v381)
                    {
                      uint64_t v1142 = *(void *)v381;
                      long long v1120 = *(_OWORD *)(v381 + 8);
                      __int16 v1128 = *((_WORD *)v381 + 12);
                    }
                    v1100 = GTTraceFunc_argumentBytesWithMap((void *)v371, v380[24], v375);
                  }
                }
                else
                {
                  if (v373 != -15695)
                  {
                    if (v373 != -15676) {
                      goto LABEL_519;
                    }
                    goto LABEL_509;
                  }
                  uint64_t v382 = v368 + (v370 << 6);
                  v383 = GTTraceFunc_argumentBytesWithMap((void *)v371, *(unsigned __int8 *)(v382 + 13), v1239);
                  int v1160 = *v374;
                  uint64_t v1173 = *((void *)v383 + 1);
                  unint64_t v1187 = *(void *)v371;
                  uint64_t v1206 = *(void *)v383;
                  v384 = GTTraceFunc_argumentBytesWithMap((void *)v371, *(unsigned __int8 *)(v382 + 14), v375);
                  if (v384)
                  {
                    uint64_t v1142 = *(void *)v384;
                    long long v1120 = *(_OWORD *)(v384 + 8);
                    __int16 v1128 = *((_WORD *)v384 + 12);
                  }
                  uint64_t v1106 = *((void *)v383 + 2);
                  uint64_t v368 = v82 + 64;
                }
LABEL_519:
                unsigned int v385 = atomic_load((unsigned int *)(v82 + 4));
                int v386 = v367 + (v385 >> 6);
                uint64_t v387 = (HIDWORD(v367) + 1);
                unint64_t v367 = (v387 << 32) | v367;
                if (v387 == v386 - 1)
                {
                  unint64_t v367 = (v387 << 32) | v387;
                  uint64_t v82 = *(void *)(v82 + 40);
                  continue;
                }
                goto LABEL_495;
              }
            }
          }
          break;
        }
        v306 = apr_palloc(p, 0x70uLL);
        *(_DWORD *)v306 = 37;
        *((_DWORD *)v306 + 1) = v1160;
        v306[1] = v1173;
        v307 = v306 + 1;
        v306[2] = v1187;
        v306[3] = v1113;
        v306[4] = 0;
        v306[5] = v1206;
        v306[6] = v1106;
        v306[7] = 0;
        v306[8] = v1223;
        v306[9] = v1142;
        v306[10] = v1100;
        *(_OWORD *)(v306 + 11) = v1120;
        *((_WORD *)v306 + 52) = v1128;
        *(_DWORD *)((char *)v306 + 106) = __src[0];
        *((_WORD *)v306 + 55) = WORD2(__src[0]);
        goto LABEL_922;
      case 12:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        BYTE4(__src[0]) = 0;
        LODWORD(__src[0]) = 0;
        LODWORD(v1243) = v1243 + 1;
        uint64_t v86 = *(void *)(v37 + 32);
        if (v86)
        {
          unsigned int v87 = 0;
          while (1)
          {
            unsigned int v88 = atomic_load((unsigned int *)(v86 + 4));
            uint64_t v89 = v87 + (v88 >> 6) - 1;
            if ((int)v89 > 0) {
              break;
            }
            uint64_t v86 = *(void *)(v86 + 40);
            unsigned int v87 = v89;
            if (!v86)
            {
              unsigned int v87 = v89;
              goto LABEL_524;
            }
          }
        }
        else
        {
          unsigned int v87 = 0;
        }
        uint64_t v89 = 0;
LABEL_524:
        int v388 = 0;
        uint64_t v1121 = 0;
        v1129 = 0;
        unint64_t v1143 = 0;
        v1207 = 0;
        __int16 v1114 = 0;
        LOBYTE(v1188) = 0;
        long long v1107 = 0u;
        uint64_t v1161 = -1;
        uint64_t v1174 = 0;
        unint64_t v389 = v87 | (unint64_t)(v89 << 32);
        while (2)
        {
          uint64_t v390 = v86 + 64;
LABEL_526:
          if (v86)
          {
            int v391 = HIDWORD(v389) - v389;
            if ((*(unsigned char *)(v390 + ((uint64_t)(HIDWORD(v389) - (int)v389) << 6) + 15) & 8) != 0)
            {
              uint64_t v392 = v391;
              uint64_t v393 = v390 + ((uint64_t)v391 << 6);
              unint64_t v394 = *(void *)v393;
              if (*(void *)v393 < v1236 + v1235)
              {
                v396 = (int *)(v393 + 8);
                int v395 = *(_DWORD *)(v393 + 8);
                if (v395 == -15743)
                {
                  if (v1235 > v394)
                  {
                    uint64_t v397 = v1239;
                    goto LABEL_545;
                  }
                  v398 = apr_palloc(p, 0x58uLL);
                  *(_DWORD *)v398 = 67;
                  *((_DWORD *)v398 + 1) = v388;
                  v398[1] = v1121;
                  v398[2] = v1143;
                  v398[3] = v1161;
                  v398[4] = 0;
                  v398[5] = v1174;
                  v398[6] = v1129;
                  v398[7] = v1207;
                  *((_OWORD *)v398 + 4) = v1107;
                  *((_WORD *)v398 + 40) = v1114;
                  *((unsigned char *)v398 + 82) = v1188;
                  *(_DWORD *)((char *)v398 + 83) = __src[0];
                  *((unsigned char *)v398 + 87) = BYTE4(__src[0]);
                  uint64_t v399 = *find_entry((uint64_t)ht, (unsigned char *)v398 + 8, 8uLL, 0);
                  if (v399) {
                    uint64_t v399 = *(void *)(v399 + 32);
                  }
                  v398[4] = v399;
                  apr_hash_set(ht, v398 + 1, 8, v398);
                  v398[3] = v394;
                  int v395 = *v396;
                  uint64_t v390 = v86 + 64;
                }
                else if (v395 == -15742)
                {
                  if (v1235 > v394) {
                    goto LABEL_1211;
                  }
                  v974 = apr_palloc(p, 0x58uLL);
                  *(_DWORD *)v974 = 67;
                  *((_DWORD *)v974 + 1) = v388;
                  v974[1] = v1121;
                  v975 = v974 + 1;
                  v974[2] = v1143;
                  v974[3] = v1161;
                  v974[4] = 0;
                  v974[5] = v1174;
                  v974[6] = v1129;
                  v974[7] = v1207;
                  *((_OWORD *)v974 + 4) = v1107;
                  *((_WORD *)v974 + 40) = v1114;
                  *((unsigned char *)v974 + 82) = v1188;
                  *(_DWORD *)((char *)v974 + 83) = __src[0];
                  *((unsigned char *)v974 + 87) = BYTE4(__src[0]);
                  goto LABEL_1282;
                }
                uint64_t v397 = v1239;
                if (v395 <= -15745)
                {
                  if (v395 == -16291)
                  {
                    uint64_t v1161 = *(void *)v393;
                  }
                  else if (v395 == -16075)
                  {
                    uint64_t v400 = v390 + (v392 << 6);
                    v401 = GTTraceFunc_argumentBytesWithMap((void *)v393, *(unsigned __int8 *)(v400 + 13), v1239);
                    unint64_t v1143 = *(void *)v393;
                    int v388 = *v396;
                    uint64_t v1121 = *((void *)v401 + 1);
                    uint64_t v1174 = *(void *)v401;
                    v1129 = GTTraceFunc_argumentBytesWithMap((void *)v393, v401[24], v397);
                    v402 = GTTraceFunc_argumentBytesWithMap((void *)v393, *(unsigned __int8 *)(v400 + 14), v397);
                    if (v402)
                    {
                      __int16 v1114 = *((_WORD *)v402 + 12);
                      long long v1107 = *(_OWORD *)(v402 + 8);
                    }
                    uint64_t v390 = v86 + 64;
                  }
LABEL_548:
                  unsigned int v406 = atomic_load((unsigned int *)(v86 + 4));
                  int v407 = v389 + (v406 >> 6);
                  uint64_t v408 = (HIDWORD(v389) + 1);
                  unint64_t v389 = (v408 << 32) | v389;
                  if (v408 == v407 - 1)
                  {
                    unint64_t v389 = (v408 << 32) | v408;
                    uint64_t v86 = *(void *)(v86 + 40);
                    continue;
                  }
                  goto LABEL_526;
                }
                if (v395 == -15744)
                {
                  v405 = GTTraceFunc_argumentBytesWithMap((void *)v393, *(unsigned __int8 *)(v390 + (v392 << 6) + 13), v1239);
                  uint64_t v390 = v86 + 64;
                  int v1188 = *((_DWORD *)v405 + 2);
                  goto LABEL_548;
                }
                if (v395 != -15743) {
                  goto LABEL_548;
                }
LABEL_545:
                v403 = GTTraceFunc_argumentBytesWithMap((void *)v393, *(unsigned __int8 *)(v390 + (v392 << 6) + 13), v397);
                v404 = GTTraceFunc_argumentBytesWithMap((void *)v393, v403[8], v397);
                uint64_t v390 = v86 + 64;
                v1207 = v404;
                goto LABEL_548;
              }
            }
          }
          break;
        }
        v306 = apr_palloc(p, 0x58uLL);
        *(_DWORD *)v306 = 67;
        *((_DWORD *)v306 + 1) = v388;
        v306[1] = v1121;
        v307 = v306 + 1;
        v306[2] = v1143;
        v306[3] = v1161;
        v306[4] = 0;
        v306[5] = v1174;
        v306[6] = v1129;
        v306[7] = v1207;
        *((_OWORD *)v306 + 4) = v1107;
        *((_WORD *)v306 + 40) = v1114;
        *((unsigned char *)v306 + 82) = v1188;
        *(_DWORD *)((char *)v306 + 83) = __src[0];
        *((unsigned char *)v306 + 87) = BYTE4(__src[0]);
        goto LABEL_922;
      case 13:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD1(v1243);
        uint64_t v90 = *(void *)(v37 + 32);
        if (v90)
        {
          unsigned int v91 = 0;
          while (1)
          {
            unsigned int v92 = atomic_load((unsigned int *)(v90 + 4));
            uint64_t v93 = v91 + (v92 >> 6) - 1;
            if ((int)v93 > 0) {
              break;
            }
            uint64_t v90 = *(void *)(v90 + 40);
            unsigned int v91 = v93;
            if (!v90)
            {
              unsigned int v91 = v93;
              goto LABEL_553;
            }
          }
        }
        else
        {
          unsigned int v91 = 0;
        }
        uint64_t v93 = 0;
LABEL_553:
        int v409 = 0;
        uint64_t v410 = 0;
        unint64_t v411 = 0;
        uint64_t v1189 = 0;
        v1208 = 0;
        unint64_t v412 = v91 | (unint64_t)(v93 << 32);
        while (2)
        {
          uint64_t v413 = v90 + 64;
LABEL_555:
          if (!v90
            || (int v414 = HIDWORD(v412) - v412,
                (*(unsigned char *)(v413 + ((uint64_t)(HIDWORD(v412) - (int)v412) << 6) + 15) & 8) == 0)
            || (uint64_t v415 = v413 + ((uint64_t)v414 << 6), v416 = *(void *)v415, *(void *)v415 >= v1236 + v1235))
          {
            v424 = (char *)apr_palloc(p, 0x38uLL);
            v189 = v424;
            *(_DWORD *)v424 = 41;
            *((_DWORD *)v424 + 1) = v409;
            *((void *)v424 + 1) = v410;
            v190 = v424 + 8;
            unint64_t v425 = -1;
            *((void *)v424 + 2) = v411;
            *((void *)v424 + 3) = -1;
            *((void *)v424 + 4) = 0;
            uint64_t v426 = v1189;
            goto LABEL_566;
          }
          int v417 = *(_DWORD *)(v415 + 8);
          if (v417 != -16127)
          {
            uint64_t v418 = v1239;
            if (v417 == -16136)
            {
              v420 = GTTraceFunc_argumentBytesWithMap((void *)v415, *(unsigned __int8 *)(v413 + ((uint64_t)v414 << 6) + 13), v1239);
              v1208 = GTTraceFunc_argumentBytesWithMap((void *)v415, v420[8], v418);
            }
            else if (v417 == -16128)
            {
              v419 = GTTraceFunc_argumentBytesWithMap((void *)v415, *(unsigned __int8 *)(v413 + ((uint64_t)v414 << 6) + 13), v1239);
              unint64_t v411 = *(void *)v415;
              int v409 = *(_DWORD *)(v415 + 8);
              uint64_t v410 = *((void *)v419 + 1);
              uint64_t v1189 = *(void *)v419;
            }
            unsigned int v421 = atomic_load((unsigned int *)(v90 + 4));
            int v422 = v412 + (v421 >> 6);
            uint64_t v423 = (HIDWORD(v412) + 1);
            unint64_t v412 = (v423 << 32) | v412;
            v14 = v1220;
            if (v423 == v422 - 1)
            {
              unint64_t v412 = (v423 << 32) | v423;
              uint64_t v90 = *(void *)(v90 + 40);
              continue;
            }
            goto LABEL_555;
          }
          break;
        }
        v14 = v1220;
        if (v1235 > v416) {
          goto LABEL_1211;
        }
        v989 = apr_palloc(p, 0x38uLL);
        *(_DWORD *)v989 = 41;
        *((_DWORD *)v989 + 1) = v409;
        v989[1] = v410;
        v990 = v989 + 1;
        v989[2] = v411;
        v989[3] = -1;
        v989[4] = 0;
        v989[5] = v1189;
        v989[6] = v1208;
        goto LABEL_1267;
      case 14:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD2(v1243);
        uint64_t v94 = *(void *)(v37 + 32);
        if (v94)
        {
          unsigned int v95 = 0;
          while (1)
          {
            unsigned int v96 = atomic_load((unsigned int *)(v94 + 4));
            uint64_t v97 = v95 + (v96 >> 6) - 1;
            if ((int)v97 > 0) {
              break;
            }
            uint64_t v94 = *(void *)(v94 + 40);
            unsigned int v95 = v97;
            if (!v94)
            {
              unsigned int v95 = v97;
              goto LABEL_569;
            }
          }
        }
        else
        {
          unsigned int v95 = 0;
        }
        uint64_t v97 = 0;
LABEL_569:
        int v427 = 0;
        uint64_t v1144 = 0;
        unint64_t v1162 = 0;
        v1208 = 0;
        unint64_t v428 = v95 | (unint64_t)(v97 << 32);
        uint64_t v1175 = 0;
        uint64_t v1190 = -1;
        while (2)
        {
          uint64_t v429 = v94 + 64;
LABEL_571:
          if (v94)
          {
            int v430 = HIDWORD(v428) - v428;
            if ((*(unsigned char *)(v429 + ((uint64_t)(HIDWORD(v428) - (int)v428) << 6) + 15) & 8) != 0)
            {
              uint64_t v431 = v430;
              uint64_t v432 = v429 + ((uint64_t)v430 << 6);
              unint64_t v425 = *(void *)v432;
              if (*(void *)v432 < v1236 + v1235)
              {
                v434 = (int *)(v432 + 8);
                int v433 = *(_DWORD *)(v432 + 8);
                if (v433 == -15880)
                {
                  if (v1235 > v425)
                  {
                    uint64_t v435 = v1239;
                    goto LABEL_586;
                  }
                  v436 = apr_palloc(p, 0x38uLL);
                  *(_DWORD *)v436 = 38;
                  *((_DWORD *)v436 + 1) = v427;
                  v436[1] = v1144;
                  v436[2] = v1162;
                  v436[3] = v1190;
                  v436[4] = 0;
                  v436[5] = v1175;
                  v436[6] = v1208;
                  uint64_t v437 = *find_entry((uint64_t)ht, (unsigned char *)v436 + 8, 8uLL, 0);
                  if (v437) {
                    uint64_t v437 = *(void *)(v437 + 32);
                  }
                  v436[4] = v437;
                  apr_hash_set(ht, v436 + 1, 8, v436);
                  v436[3] = v425;
                  int v433 = *v434;
                  uint64_t v429 = v94 + 64;
                }
                else if (v433 == -15879)
                {
                  if (v1235 > v425) {
                    goto LABEL_1211;
                  }
                  v424 = (char *)apr_palloc(p, 0x38uLL);
                  v189 = v424;
                  *(_DWORD *)v424 = 38;
                  *((_DWORD *)v424 + 1) = v427;
                  *((void *)v424 + 1) = v1144;
                  v190 = v424 + 8;
                  *((void *)v424 + 2) = v1162;
                  *((void *)v424 + 3) = v1190;
                  *((void *)v424 + 4) = 0;
                  uint64_t v426 = v1175;
LABEL_566:
                  *((void *)v424 + 5) = v426;
                  *((void *)v424 + 6) = v1208;
                  goto LABEL_1068;
                }
                if (v433 == -15879)
                {
                  uint64_t v1190 = *(void *)v432;
                  goto LABEL_588;
                }
                uint64_t v435 = v1239;
                if (v433 != -15880)
                {
                  if (v433 == -15997)
                  {
                    v438 = GTTraceFunc_argumentBytesWithMap((void *)v432, *(unsigned __int8 *)(v429 + (v431 << 6) + 13), v1239);
                    uint64_t v429 = v94 + 64;
                    int v427 = *v434;
                    uint64_t v1144 = *((void *)v438 + 1);
                    unint64_t v1162 = *(void *)v432;
                    uint64_t v1175 = *(void *)v438;
                  }
LABEL_588:
                  unsigned int v441 = atomic_load((unsigned int *)(v94 + 4));
                  int v442 = v428 + (v441 >> 6);
                  uint64_t v443 = (HIDWORD(v428) + 1);
                  unint64_t v428 = (v443 << 32) | v428;
                  if (v443 == v442 - 1)
                  {
                    unint64_t v428 = (v443 << 32) | v443;
                    uint64_t v94 = *(void *)(v94 + 40);
                    continue;
                  }
                  goto LABEL_571;
                }
LABEL_586:
                v439 = GTTraceFunc_argumentBytesWithMap((void *)v432, *(unsigned __int8 *)(v429 + (v431 << 6) + 13), v435);
                v440 = GTTraceFunc_argumentBytesWithMap((void *)v432, v439[8], v435);
                uint64_t v429 = v94 + 64;
                v1208 = v440;
                goto LABEL_588;
              }
            }
          }
          break;
        }
        v363 = apr_palloc(p, 0x38uLL);
        *(_DWORD *)v363 = 38;
        *((_DWORD *)v363 + 1) = v427;
        v363[1] = v1144;
        v444 = v363 + 1;
        v363[2] = v1162;
        v363[3] = v1190;
        v363[4] = 0;
        v363[5] = v1175;
        v363[6] = v1208;
        goto LABEL_778;
      case 15:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++HIDWORD(v1243);
        uint64_t v98 = *(void *)(v37 + 32);
        if (v98)
        {
          unsigned int v99 = 0;
          while (1)
          {
            unsigned int v100 = atomic_load((unsigned int *)(v98 + 4));
            uint64_t v101 = v99 + (v100 >> 6) - 1;
            if ((int)v101 > 0) {
              break;
            }
            uint64_t v98 = *(void *)(v98 + 40);
            unsigned int v99 = v101;
            if (!v98)
            {
              unsigned int v99 = v101;
              goto LABEL_593;
            }
          }
        }
        else
        {
          unsigned int v99 = 0;
        }
        uint64_t v101 = 0;
LABEL_593:
        int v445 = 0;
        v1130 = 0;
        uint64_t v1145 = 0;
        uint64_t v1176 = 0;
        unint64_t v1191 = 0;
        unsigned int v1163 = 0;
        unint64_t v446 = v99 | (unint64_t)(v101 << 32);
        long long v1224 = 0u;
        uint64_t v1122 = -1;
        while (2)
        {
          uint64_t v447 = v98 + 64;
LABEL_595:
          if (v98)
          {
            int v448 = HIDWORD(v446) - v446;
            if ((*(unsigned char *)(v447 + ((uint64_t)(HIDWORD(v446) - (int)v446) << 6) + 15) & 8) != 0)
            {
              uint64_t v449 = v448;
              uint64_t v450 = v447 + ((uint64_t)v448 << 6);
              unint64_t v451 = *(void *)v450;
              if (*(void *)v450 < v1236 + v1235)
              {
                v453 = (int *)(v450 + 8);
                int v452 = *(_DWORD *)(v450 + 8);
                if ((v452 + 15975) < 2)
                {
                  if (v1235 <= v451)
                  {
                    v454 = apr_palloc(p, 0x50uLL);
                    *(_DWORD *)v454 = 76;
                    *((_DWORD *)v454 + 1) = v445;
                    v454[1] = v1145;
                    v454[2] = v1191;
                    v454[3] = v1122;
                    v454[4] = 0;
                    v454[5] = v1176;
                    v454[6] = v1130;
                    *(_OWORD *)(v454 + 7) = v1224;
                    v454[9] = v1163;
                    uint64_t v455 = *find_entry((uint64_t)ht, (unsigned char *)v454 + 8, 8uLL, 0);
                    if (v455) {
                      uint64_t v455 = *(void *)(v455 + 32);
                    }
                    v454[4] = v455;
                    apr_hash_set(ht, v454 + 1, 8, v454);
                    v454[3] = v451;
                    int v452 = *v453;
                    uint64_t v447 = v98 + 64;
                  }
LABEL_604:
                  uint64_t v456 = v1239;
                  if (v452 <= -15974)
                  {
                    if (v452 == -15996)
                    {
                      v463 = GTTraceFunc_argumentBytesWithMap((void *)v450, *(unsigned __int8 *)(v447 + (v449 << 6) + 13), v1239);
                      uint64_t v447 = v98 + 64;
                      int v445 = *v453;
                      uint64_t v1145 = *((void *)v463 + 1);
                      uint64_t v1176 = *(void *)v463;
                      unint64_t v1191 = *(void *)v450;
                      unsigned int v1163 = *((_DWORD *)v463 + 6);
                      *(void *)&long long v462 = *((void *)v463 + 2);
LABEL_621:
                      long long v1224 = v462;
                      goto LABEL_622;
                    }
                    if (v452 != -15975)
                    {
                      if (v452 == -15974)
                      {
                        v459 = GTTraceFunc_argumentBytesWithMap((void *)v450, *(unsigned __int8 *)(v447 + (v449 << 6) + 13), v1239);
                        v460 = GTTraceFunc_argumentBytesWithMap((void *)v450, v459[8], v456);
                        uint64_t v447 = v98 + 64;
                        v1130 = v460;
                      }
LABEL_622:
                      unsigned int v466 = atomic_load((unsigned int *)(v98 + 4));
                      int v467 = v446 + (v466 >> 6);
                      uint64_t v468 = (HIDWORD(v446) + 1);
                      unint64_t v446 = (v468 << 32) | v446;
                      if (v468 == v467 - 1)
                      {
                        unint64_t v446 = (v468 << 32) | v468;
                        uint64_t v98 = *(void *)(v98 + 40);
                        continue;
                      }
                      goto LABEL_595;
                    }
                    v464 = GTTraceFunc_argumentBytesWithMap((void *)v450, *(unsigned __int8 *)(v447 + (v449 << 6) + 13), v1239);
                    uint64_t v447 = v98 + 64;
                    v458 = v464 + 8;
                  }
                  else
                  {
                    if (v452 > -15910)
                    {
                      if (v452 == -15909)
                      {
                        v465 = GTTraceFunc_argumentBytesWithMap((void *)v450, *(unsigned __int8 *)(v447 + (v449 << 6) + 13), v1239);
                        uint64_t v447 = v98 + 64;
                        int v445 = *v453;
                        uint64_t v1145 = *((void *)v465 + 1);
                        uint64_t v1176 = *(void *)v465;
                        unint64_t v1191 = *(void *)v450;
                        unsigned int v1163 = *((_DWORD *)v465 + 8);
                        long long v462 = *((_OWORD *)v465 + 1);
                      }
                      else
                      {
                        if (v452 != -15907) {
                          goto LABEL_622;
                        }
                        v461 = GTTraceFunc_argumentBytesWithMap((void *)v450, *(unsigned __int8 *)(v447 + (v449 << 6) + 13), v1239);
                        uint64_t v447 = v98 + 64;
                        *((void *)&v462 + 1) = *((void *)&v1224 + 1);
                        *(void *)&long long v462 = *((void *)v461 + 1);
                      }
                      goto LABEL_621;
                    }
                    if (v452 == -15973)
                    {
                      uint64_t v1122 = *(void *)v450;
                      goto LABEL_622;
                    }
                    if (v452 != -15912) {
                      goto LABEL_622;
                    }
                    v457 = GTTraceFunc_argumentBytesWithMap((void *)v450, *(unsigned __int8 *)(v447 + (v449 << 6) + 13), v1239);
                    uint64_t v447 = v98 + 64;
                    int v445 = *v453;
                    uint64_t v1145 = *((void *)v457 + 1);
                    uint64_t v1176 = *(void *)v457;
                    unint64_t v1191 = *(void *)v450;
                    unsigned int v1163 = *((_DWORD *)v457 + 6);
                    v458 = v457 + 16;
                  }
                  *(void *)&long long v462 = v1224;
                  *((void *)&v462 + 1) = *v458;
                  goto LABEL_621;
                }
                if (v452 != -15973) {
                  goto LABEL_604;
                }
                if (v1235 > v451) {
                  goto LABEL_1211;
                }
                v977 = (char *)apr_palloc(p, 0x50uLL);
                *(_DWORD *)v977 = 76;
                *((_DWORD *)v977 + 1) = v445;
                *((void *)v977 + 1) = v1145;
                v979 = v977 + 8;
                *((void *)v977 + 2) = v1191;
                *((void *)v977 + 3) = v1122;
                *((void *)v977 + 4) = 0;
                *((void *)v977 + 5) = v1176;
                *((void *)v977 + 6) = v1130;
                *(_OWORD *)(v977 + 56) = v1224;
                *((void *)v977 + 9) = v1163;
LABEL_1278:
                uint64_t v995 = *find_entry((uint64_t)ht, v979, 8uLL, 0);
                if (v995) {
                  uint64_t v995 = *(void *)(v995 + 32);
                }
                *((void *)v977 + 4) = v995;
                apr_hash_set(ht, v979, 8, v977);
                *((void *)v977 + 3) = v451;
                goto LABEL_1211;
              }
            }
          }
          break;
        }
        v363 = apr_palloc(p, 0x50uLL);
        *(_DWORD *)v363 = 76;
        *((_DWORD *)v363 + 1) = v445;
        v363[1] = v1145;
        v444 = v363 + 1;
        v363[2] = v1191;
        v363[3] = v1122;
        v363[4] = 0;
        v363[5] = v1176;
        v363[6] = v1130;
        *(_OWORD *)(v363 + 7) = v1224;
        v363[9] = v1163;
        goto LABEL_778;
      case 16:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        *(void *)&__src[0] = 0;
        LODWORD(v1244) = v1244 + 1;
        uint64_t v102 = *(void *)(v37 + 32);
        if (v102)
        {
          unsigned int v103 = 0;
          while (1)
          {
            unsigned int v104 = atomic_load((unsigned int *)(v102 + 4));
            uint64_t v105 = v103 + (v104 >> 6) - 1;
            if ((int)v105 > 0) {
              break;
            }
            uint64_t v102 = *(void *)(v102 + 40);
            unsigned int v103 = v105;
            if (!v102)
            {
              unsigned int v103 = v105;
              goto LABEL_627;
            }
          }
        }
        else
        {
          unsigned int v103 = 0;
        }
        uint64_t v105 = 0;
LABEL_627:
        int v469 = 0;
        uint64_t v1131 = 0;
        unint64_t v1146 = 0;
        uint64_t v1164 = 0;
        v1177 = 0;
        unint64_t v470 = v103 | (unint64_t)(v105 << 32);
        uint64_t v1192 = -1;
        uint64_t v1209 = 0;
        while (2)
        {
          uint64_t v471 = v102 + 64;
LABEL_629:
          if (v102)
          {
            int v472 = HIDWORD(v470) - v470;
            if ((*(unsigned char *)(v471 + ((uint64_t)(HIDWORD(v470) - (int)v470) << 6) + 15) & 8) != 0)
            {
              uint64_t v473 = v472;
              uint64_t v474 = v471 + ((uint64_t)v472 << 6);
              unint64_t v451 = *(void *)v474;
              if (*(void *)v474 < v1236 + v1235)
              {
                v476 = (int *)(v474 + 8);
                int v475 = *(_DWORD *)(v474 + 8);
                if ((v475 + 15491) >= 2)
                {
                  if (v475 == -15489)
                  {
                    if (v1235 > v451) {
                      goto LABEL_1211;
                    }
                    v977 = (char *)apr_palloc(p, 0x50uLL);
                    *(_DWORD *)v977 = 61;
                    *((_DWORD *)v977 + 1) = v469;
                    *((void *)v977 + 1) = v1131;
                    v979 = v977 + 8;
                    *((void *)v977 + 2) = v1146;
                    *((void *)v977 + 3) = v1192;
                    *((void *)v977 + 4) = 0;
                    *((void *)v977 + 5) = v1164;
                    *((void *)v977 + 6) = v1177;
                    *((void *)v977 + 7) = 0;
                    uint64_t v994 = *(void *)&__src[0];
                    *((void *)v977 + 8) = v1209;
                    *((void *)v977 + 9) = v994;
                    goto LABEL_1278;
                  }
                }
                else if (v1235 <= v451)
                {
                  v477 = apr_palloc(p, 0x50uLL);
                  *(_DWORD *)v477 = 61;
                  *((_DWORD *)v477 + 1) = v469;
                  v477[1] = v1131;
                  v477[2] = v1146;
                  v477[3] = v1192;
                  v477[4] = 0;
                  v477[5] = v1164;
                  v477[6] = v1177;
                  v477[7] = 0;
                  uint64_t v478 = *(void *)&__src[0];
                  v477[8] = v1209;
                  v477[9] = v478;
                  uint64_t v479 = *find_entry((uint64_t)ht, (unsigned char *)v477 + 8, 8uLL, 0);
                  if (v479) {
                    uint64_t v479 = *(void *)(v479 + 32);
                  }
                  v477[4] = v479;
                  apr_hash_set(ht, v477 + 1, 8, v477);
                  v477[3] = v451;
                  int v475 = *v476;
                  uint64_t v471 = v102 + 64;
                }
                uint64_t v480 = v1239;
                switch(v475)
                {
                  case -15496:
                    v481 = GTTraceFunc_argumentBytesWithMap((void *)v474, *(unsigned __int8 *)(v471 + (v473 << 6) + 13), v1239);
                    uint64_t v471 = v102 + 64;
                    uint64_t v1209 = 0;
                    int v469 = *v476;
                    uint64_t v1131 = *((void *)v481 + 1);
                    unint64_t v1146 = *(void *)v474;
                    uint64_t v1164 = *(void *)v481;
                    break;
                  case -15491:
                    v482 = GTTraceFunc_argumentBytesWithMap((void *)v474, *(unsigned __int8 *)(v471 + (v473 << 6) + 13), v1239);
                    v483 = GTTraceFunc_argumentBytesWithMap((void *)v474, v482[8], v480);
                    uint64_t v471 = v102 + 64;
                    v1177 = v483;
                    break;
                  case -15490:
                    v484 = GTTraceFunc_argumentBytesWithMap((void *)v474, *(unsigned __int8 *)(v471 + (v473 << 6) + 13), v1239);
                    uint64_t v471 = v102 + 64;
                    uint64_t v1209 = *((void *)v484 + 1);
                    break;
                  case -15489:
                    uint64_t v1192 = *(void *)v474;
                    break;
                  default:
                    break;
                }
                unsigned int v485 = atomic_load((unsigned int *)(v102 + 4));
                int v486 = v470 + (v485 >> 6);
                uint64_t v487 = (HIDWORD(v470) + 1);
                unint64_t v470 = (v487 << 32) | v470;
                if (v487 == v486 - 1)
                {
                  unint64_t v470 = (v487 << 32) | v487;
                  uint64_t v102 = *(void *)(v102 + 40);
                  continue;
                }
                goto LABEL_629;
              }
            }
          }
          break;
        }
        v363 = apr_palloc(p, 0x50uLL);
        *(_DWORD *)v363 = 61;
        *((_DWORD *)v363 + 1) = v469;
        v363[1] = v1131;
        v444 = v363 + 1;
        v363[2] = v1146;
        v363[3] = v1192;
        v363[4] = 0;
        v363[5] = v1164;
        v363[6] = v1177;
        v363[7] = 0;
        uint64_t v488 = *(void *)&__src[0];
        v363[8] = v1209;
        v363[9] = v488;
        goto LABEL_778;
      case 17:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD1(v1244);
        uint64_t v106 = *(void *)(v37 + 32);
        if (v106)
        {
          unsigned int v107 = 0;
          while (1)
          {
            unsigned int v108 = atomic_load((unsigned int *)(v106 + 4));
            uint64_t v109 = v107 + (v108 >> 6) - 1;
            if ((int)v109 > 0) {
              break;
            }
            uint64_t v106 = *(void *)(v106 + 40);
            unsigned int v107 = v109;
            if (!v106)
            {
              unsigned int v107 = v109;
              goto LABEL_648;
            }
          }
        }
        else
        {
          unsigned int v107 = 0;
        }
        uint64_t v109 = 0;
LABEL_648:
        int v489 = 0;
        uint64_t v490 = 0;
        unint64_t v1182 = 0;
        uint64_t v1201 = 0;
        v176 = 0;
        unint64_t v491 = v107 | (unint64_t)(v109 << 32);
        while (2)
        {
          uint64_t v492 = v106 + 64;
LABEL_650:
          if (v106)
          {
            int v493 = HIDWORD(v491) - v491;
            if ((*(unsigned char *)(v492 + ((uint64_t)(HIDWORD(v491) - (int)v491) << 6) + 15) & 8) != 0)
            {
              uint64_t v494 = v492 + ((uint64_t)v493 << 6);
              unint64_t v451 = *(void *)v494;
              if (*(void *)v494 < v1236 + v1235)
              {
                int v495 = *(_DWORD *)(v494 + 8);
                if (v495 == -15891)
                {
                  uint64_t v496 = v1239;
                  v497 = GTTraceFunc_argumentBytesWithMap((void *)v494, *(unsigned __int8 *)(v492 + ((uint64_t)v493 << 6) + 13), v1239);
                  int v489 = *(_DWORD *)(v494 + 8);
                  uint64_t v490 = *((void *)v497 + 1);
                  unint64_t v1182 = *(void *)v494;
                  uint64_t v1201 = *(void *)v497;
                  v176 = GTTraceFunc_argumentBytesWithMap((void *)v494, v497[16], v496);
                }
                else if (v495 == -15893)
                {
                  v14 = v1220;
                  if (v1235 > v451) {
                    goto LABEL_1211;
                  }
                  v976 = (char *)apr_palloc(p, 0x38uLL);
                  v977 = v976;
                  int v978 = 64;
LABEL_1250:
                  *(_DWORD *)v976 = v978;
                  *((_DWORD *)v976 + 1) = v489;
                  *((void *)v976 + 1) = v490;
                  v979 = v976 + 8;
                  *((void *)v976 + 2) = v1182;
                  *((void *)v976 + 3) = -1;
                  *((void *)v976 + 4) = 0;
                  *((void *)v976 + 5) = v1201;
                  *((void *)v976 + 6) = v176;
                  goto LABEL_1278;
                }
                v14 = v1220;
                unsigned int v498 = atomic_load((unsigned int *)(v106 + 4));
                int v499 = v491 + (v498 >> 6);
                uint64_t v500 = (HIDWORD(v491) + 1);
                unint64_t v491 = (v500 << 32) | v491;
                if (v500 == v499 - 1)
                {
                  unint64_t v491 = (v500 << 32) | v500;
                  uint64_t v106 = *(void *)(v106 + 40);
                  continue;
                }
                goto LABEL_650;
              }
            }
          }
          break;
        }
        v188 = (char *)apr_palloc(p, 0x38uLL);
        v189 = v188;
        int v501 = 64;
        goto LABEL_674;
      case 18:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD2(v1244);
        uint64_t v110 = *(void *)(v37 + 32);
        if (v110)
        {
          unsigned int v111 = 0;
          while (1)
          {
            unsigned int v112 = atomic_load((unsigned int *)(v110 + 4));
            uint64_t v113 = v111 + (v112 >> 6) - 1;
            if ((int)v113 > 0) {
              break;
            }
            uint64_t v110 = *(void *)(v110 + 40);
            unsigned int v111 = v113;
            if (!v110)
            {
              unsigned int v111 = v113;
              goto LABEL_662;
            }
          }
        }
        else
        {
          unsigned int v111 = 0;
        }
        uint64_t v113 = 0;
LABEL_662:
        int v489 = 0;
        uint64_t v490 = 0;
        unint64_t v1182 = 0;
        uint64_t v1201 = 0;
        v176 = 0;
        unint64_t v502 = v111 | (unint64_t)(v113 << 32);
        while (2)
        {
          uint64_t v503 = v110 + 64;
LABEL_664:
          if (v110)
          {
            int v504 = HIDWORD(v502) - v502;
            if ((*(unsigned char *)(v503 + ((uint64_t)(HIDWORD(v502) - (int)v502) << 6) + 15) & 8) != 0)
            {
              uint64_t v505 = v503 + ((uint64_t)v504 << 6);
              unint64_t v451 = *(void *)v505;
              if (*(void *)v505 < v1236 + v1235)
              {
                int v506 = *(_DWORD *)(v505 + 8);
                if (v506 == -16311)
                {
                  uint64_t v507 = v1239;
                  v508 = GTTraceFunc_argumentBytesWithMap((void *)v505, *(unsigned __int8 *)(v503 + ((uint64_t)v504 << 6) + 13), v1239);
                  int v489 = *(_DWORD *)(v505 + 8);
                  uint64_t v490 = *((void *)v508 + 1);
                  unint64_t v1182 = *(void *)v505;
                  uint64_t v1201 = *(void *)v508;
                  v176 = GTTraceFunc_argumentBytesWithMap((void *)v505, v508[16], v507);
                }
                else if (v506 == -16320)
                {
                  v14 = v1220;
                  if (v1235 > v451) {
                    goto LABEL_1211;
                  }
                  v976 = (char *)apr_palloc(p, 0x38uLL);
                  v977 = v976;
                  int v978 = 34;
                  goto LABEL_1250;
                }
                v14 = v1220;
                unsigned int v509 = atomic_load((unsigned int *)(v110 + 4));
                int v510 = v502 + (v509 >> 6);
                uint64_t v511 = (HIDWORD(v502) + 1);
                unint64_t v502 = (v511 << 32) | v502;
                if (v511 == v510 - 1)
                {
                  unint64_t v502 = (v511 << 32) | v511;
                  uint64_t v110 = *(void *)(v110 + 40);
                  continue;
                }
                goto LABEL_664;
              }
            }
          }
          break;
        }
        v188 = (char *)apr_palloc(p, 0x38uLL);
        v189 = v188;
        int v501 = 34;
LABEL_674:
        *(_DWORD *)v188 = v501;
        *((_DWORD *)v188 + 1) = v489;
        *((void *)v188 + 1) = v490;
        v190 = v188 + 8;
LABEL_675:
        unint64_t v425 = -1;
        *((void *)v188 + 2) = v1182;
        *((void *)v188 + 3) = -1;
        *((void *)v188 + 4) = 0;
        *((void *)v188 + 5) = v1201;
        goto LABEL_1067;
      case 19:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++HIDWORD(v1244);
        uint64_t v114 = *(void *)(v37 + 32);
        uint64_t v1201 = v1234;
        unsigned int v115 = 0;
        if (!v114) {
          goto LABEL_242;
        }
        while (1)
        {
          unsigned int v116 = atomic_load((unsigned int *)(v114 + 4));
          uint64_t v117 = v115 + (v116 >> 6) - 1;
          if ((int)v117 > 0) {
            break;
          }
          uint64_t v114 = *(void *)(v114 + 40);
          unsigned int v115 = v117;
          if (!v114)
          {
            unsigned int v115 = v117;
LABEL_243:
            int v174 = 0;
            uint64_t v175 = 0;
            unint64_t v1182 = 0;
            v176 = 0;
            unint64_t v177 = v115 | (unint64_t)(v117 << 32);
            while (1)
            {
              uint64_t v178 = v114 + 64;
              do
              {
                if (!v114
                  || (int v179 = HIDWORD(v177) - v177,
                      (*(unsigned char *)(v178 + ((uint64_t)(HIDWORD(v177) - (int)v177) << 6) + 15) & 8) == 0)
                  || (uint64_t v180 = v178 + ((uint64_t)v179 << 6), v181 = *(void *)v180, *(void *)v180 >= v1236 + v1235))
                {
                  v188 = (char *)apr_palloc(p, 0x38uLL);
                  v189 = v188;
                  *(_DWORD *)v188 = 31;
                  *((_DWORD *)v188 + 1) = v174;
                  *((void *)v188 + 1) = v175;
                  v190 = v188 + 8;
                  goto LABEL_675;
                }
                int v182 = *(_DWORD *)(v180 + 8);
                if (v182 == -15848)
                {
                  uint64_t v183 = v1239;
                  v184 = GTTraceFunc_argumentBytesWithMap((void *)v180, *(unsigned __int8 *)(v178 + ((uint64_t)v179 << 6) + 13), v1239);
                  int v174 = *(_DWORD *)(v180 + 8);
                  uint64_t v175 = *((void *)v184 + 1);
                  unint64_t v1182 = *(void *)v180;
                  uint64_t v1201 = *(void *)v184;
                  v176 = GTTraceFunc_argumentBytesWithMap((void *)v180, v184[24], v183);
                }
                else if (v182 == -15867)
                {
                  v14 = v1220;
                  if (v1235 <= v181)
                  {
                    v964 = apr_palloc(p, 0x38uLL);
                    *(_DWORD *)v964 = 31;
                    *((_DWORD *)v964 + 1) = v174;
                    v964[1] = v175;
                    v964[2] = v1182;
                    v964[3] = -1;
                    v964[4] = 0;
                    v964[5] = v1201;
                    v964[6] = v176;
                    uint64_t v965 = *find_entry((uint64_t)ht, (unsigned char *)v964 + 8, 8uLL, 0);
                    if (v965) {
                      uint64_t v965 = *(void *)(v965 + 32);
                    }
                    v964[4] = v965;
                    apr_hash_set(ht, v964 + 1, 8, v964);
                    v964[3] = v181;
                  }
                  goto LABEL_1211;
                }
                v14 = v1220;
                unsigned int v185 = atomic_load((unsigned int *)(v114 + 4));
                int v186 = v177 + (v185 >> 6);
                uint64_t v187 = (HIDWORD(v177) + 1);
                unint64_t v177 = (v187 << 32) | v177;
              }
              while (v187 != v186 - 1);
              unint64_t v177 = (v187 << 32) | v187;
              uint64_t v114 = *(void *)(v114 + 40);
            }
          }
        }
LABEL_242:
        uint64_t v117 = 0;
        goto LABEL_243;
      case 20:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        LODWORD(v1245) = v1245 + 1;
        uint64_t v118 = *(void *)(v37 + 32);
        if (v118)
        {
          unsigned int v119 = 0;
          while (1)
          {
            unsigned int v120 = atomic_load((unsigned int *)(v118 + 4));
            uint64_t v121 = v119 + (v120 >> 6) - 1;
            if ((int)v121 > 0) {
              break;
            }
            uint64_t v118 = *(void *)(v118 + 40);
            unsigned int v119 = v121;
            if (!v118)
            {
              unsigned int v119 = v121;
              goto LABEL_678;
            }
          }
        }
        else
        {
          unsigned int v119 = 0;
        }
        uint64_t v121 = 0;
LABEL_678:
        int v512 = 0;
        uint64_t v513 = 0;
        unint64_t v514 = 0;
        uint64_t v515 = 0;
        uint64_t v516 = 0;
        unint64_t v517 = v119 | (unint64_t)(v121 << 32);
        while (2)
        {
          uint64_t v518 = v118 + 64;
LABEL_680:
          if (v118)
          {
            int v519 = HIDWORD(v517) - v517;
            if ((*(unsigned char *)(v518 + ((uint64_t)(HIDWORD(v517) - (int)v517) << 6) + 15) & 8) != 0)
            {
              uint64_t v520 = v518 + ((uint64_t)v519 << 6);
              unint64_t v521 = *(void *)v520;
              if (*(void *)v520 < v1236 + v1235)
              {
                int v522 = *(_DWORD *)(v520 + 8);
                if (v522 == -15922)
                {
                  v523 = GTTraceFunc_argumentBytesWithMap((void *)v520, *(unsigned __int8 *)(v518 + ((uint64_t)v519 << 6) + 13), v1239);
                  unint64_t v514 = *(void *)v520;
                  int v512 = *(_DWORD *)(v520 + 8);
                  uint64_t v515 = *(void *)v523;
                  uint64_t v513 = *((void *)v523 + 1);
                  uint64_t v516 = *((void *)v523 + 2);
                }
                else if (v522 == -15957)
                {
                  v14 = v1220;
                  if (v1235 > v521) {
                    goto LABEL_1211;
                  }
                  uint64_t v980 = v516;
                  uint64_t v981 = v515;
                  v982 = apr_palloc(p, 0x38uLL);
                  v983 = v982;
                  int v984 = 59;
LABEL_1255:
                  *(_DWORD *)v982 = v984;
                  *((_DWORD *)v982 + 1) = v512;
                  v982[1] = v513;
                  v985 = v982 + 1;
                  v982[2] = v514;
                  v982[3] = -1;
                  v982[4] = 0;
                  v982[5] = v981;
                  v982[6] = v980;
                  uint64_t v986 = *find_entry((uint64_t)ht, (unsigned char *)v982 + 8, 8uLL, 0);
                  if (v986) {
                    uint64_t v986 = *(void *)(v986 + 32);
                  }
                  v983[4] = v986;
                  apr_hash_set(ht, v985, 8, v983);
                  v983[3] = v521;
                  goto LABEL_1211;
                }
                v14 = v1220;
                unsigned int v524 = atomic_load((unsigned int *)(v118 + 4));
                int v525 = v517 + (v524 >> 6);
                uint64_t v526 = (HIDWORD(v517) + 1);
                unint64_t v517 = (v526 << 32) | v517;
                if (v526 == v525 - 1)
                {
                  unint64_t v517 = (v526 << 32) | v526;
                  uint64_t v118 = *(void *)(v118 + 40);
                  continue;
                }
                goto LABEL_680;
              }
            }
          }
          break;
        }
        uint64_t v527 = v515;
        uint64_t v528 = v516;
        v529 = (char *)apr_palloc(p, 0x38uLL);
        v530 = v529;
        int v531 = 59;
        goto LABEL_704;
      case 21:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD1(v1245);
        uint64_t v122 = *(void *)(v37 + 32);
        if (v122)
        {
          unsigned int v123 = 0;
          while (1)
          {
            unsigned int v124 = atomic_load((unsigned int *)(v122 + 4));
            uint64_t v125 = v123 + (v124 >> 6) - 1;
            if ((int)v125 > 0) {
              break;
            }
            uint64_t v122 = *(void *)(v122 + 40);
            unsigned int v123 = v125;
            if (!v122)
            {
              unsigned int v123 = v125;
              goto LABEL_692;
            }
          }
        }
        else
        {
          unsigned int v123 = 0;
        }
        uint64_t v125 = 0;
LABEL_692:
        int v512 = 0;
        uint64_t v513 = 0;
        unint64_t v514 = 0;
        uint64_t v532 = 0;
        uint64_t v533 = 0;
        unint64_t v534 = v123 | (unint64_t)(v125 << 32);
        while (2)
        {
          uint64_t v535 = v122 + 64;
LABEL_694:
          if (v122)
          {
            int v536 = HIDWORD(v534) - v534;
            if ((*(unsigned char *)(v535 + ((uint64_t)(HIDWORD(v534) - (int)v534) << 6) + 15) & 8) != 0)
            {
              uint64_t v537 = v535 + ((uint64_t)v536 << 6);
              unint64_t v521 = *(void *)v537;
              if (*(void *)v537 < v1236 + v1235)
              {
                int v538 = *(_DWORD *)(v537 + 8);
                if (v538 == -15921)
                {
                  v539 = GTTraceFunc_argumentBytesWithMap((void *)v537, *(unsigned __int8 *)(v535 + ((uint64_t)v536 << 6) + 13), v1239);
                  unint64_t v514 = *(void *)v537;
                  int v512 = *(_DWORD *)(v537 + 8);
                  uint64_t v532 = *(void *)v539;
                  uint64_t v513 = *((void *)v539 + 1);
                  uint64_t v533 = *((void *)v539 + 2);
                }
                else if (v538 == -15935)
                {
                  v14 = v1220;
                  if (v1235 > v521) {
                    goto LABEL_1211;
                  }
                  uint64_t v980 = v533;
                  uint64_t v981 = v532;
                  v982 = apr_palloc(p, 0x38uLL);
                  v983 = v982;
                  int v984 = 58;
                  goto LABEL_1255;
                }
                v14 = v1220;
                unsigned int v540 = atomic_load((unsigned int *)(v122 + 4));
                int v541 = v534 + (v540 >> 6);
                uint64_t v542 = (HIDWORD(v534) + 1);
                unint64_t v534 = (v542 << 32) | v534;
                if (v542 == v541 - 1)
                {
                  unint64_t v534 = (v542 << 32) | v542;
                  uint64_t v122 = *(void *)(v122 + 40);
                  continue;
                }
                goto LABEL_694;
              }
            }
          }
          break;
        }
        uint64_t v527 = v532;
        uint64_t v528 = v533;
        v529 = (char *)apr_palloc(p, 0x38uLL);
        v530 = v529;
        int v531 = 58;
LABEL_704:
        *(_DWORD *)v529 = v531;
        *((_DWORD *)v529 + 1) = v512;
        *((void *)v529 + 1) = v513;
        v543 = v529 + 8;
        uint64_t v544 = -1;
        *((void *)v529 + 2) = v514;
        *((void *)v529 + 3) = -1;
        *((void *)v529 + 4) = 0;
        *((void *)v529 + 5) = v527;
        *((void *)v529 + 6) = v528;
        goto LABEL_1008;
      case 22:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        BYTE2(__src[0]) = 0;
        LOWORD(__src[0]) = 0;
        ++DWORD2(v1245);
        uint64_t v126 = *(void *)(v37 + 32);
        if (v126)
        {
          unsigned int v127 = 0;
          while (1)
          {
            unsigned int v128 = atomic_load((unsigned int *)(v126 + 4));
            uint64_t v129 = v127 + (v128 >> 6) - 1;
            if ((int)v129 > 0) {
              break;
            }
            uint64_t v126 = *(void *)(v126 + 40);
            unsigned int v127 = v129;
            if (!v126)
            {
              unsigned int v127 = v129;
              goto LABEL_707;
            }
          }
        }
        else
        {
          unsigned int v127 = 0;
        }
        uint64_t v129 = 0;
LABEL_707:
        int v545 = 0;
        uint64_t v1178 = 0;
        uint64_t v1193 = 0;
        unint64_t v1210 = 0;
        v1123 = 0;
        int v1165 = 0;
        int v1108 = 0;
        LOBYTE(v1115) = 0;
        LOBYTE(v1092) = 0;
        unint64_t v546 = v127 | (unint64_t)(v129 << 32);
        char v1147 = 3;
        char v1132 = 1;
        uint64_t v1096 = -1;
        v1101 = 0;
        LOBYTE(v1088) = 1;
        while (2)
        {
          uint64_t v547 = v126 + 64;
LABEL_709:
          if (v126)
          {
            int v548 = HIDWORD(v546) - v546;
            if ((*(unsigned char *)(v547 + ((uint64_t)(HIDWORD(v546) - (int)v546) << 6) + 15) & 8) != 0)
            {
              uint64_t v549 = v548;
              uint64_t v550 = v547 + ((uint64_t)v548 << 6);
              unint64_t v292 = *(void *)v550;
              if (*(void *)v550 < v1236 + v1235)
              {
                v552 = (int *)(v550 + 8);
                int v551 = *(_DWORD *)(v550 + 8);
                if ((v551 + 16349) >= 5)
                {
                  if (v551 == -16344)
                  {
                    if (v1235 > v292) {
                      goto LABEL_1211;
                    }
                    v1030 = (char *)apr_palloc(p, 0x50uLL);
                    *(_DWORD *)v1030 = 27;
                    *((_DWORD *)v1030 + 1) = v545;
                    *((void *)v1030 + 1) = v1178;
                    v1031 = v1030 + 8;
                    *((void *)v1030 + 2) = v1210;
                    *((void *)v1030 + 3) = v1096;
                    *((void *)v1030 + 4) = 0;
                    *((void *)v1030 + 5) = v1193;
                    *((void *)v1030 + 6) = v1101;
                    *((void *)v1030 + 7) = v1123;
                    *((_DWORD *)v1030 + 16) = v1165;
                    *((_DWORD *)v1030 + 17) = v1108;
                    v1030[72] = v1132;
                    v1030[73] = v1147;
                    v1030[74] = v1115;
                    v1030[75] = v1092;
                    v1030[76] = v1088;
                    __int16 v1032 = __src[0];
                    v1030[79] = BYTE2(__src[0]);
                    *(_WORD *)(v1030 + 77) = v1032;
                    goto LABEL_1296;
                  }
                }
                else if (v1235 <= v292)
                {
                  v553 = apr_palloc(p, 0x50uLL);
                  *(_DWORD *)v553 = 27;
                  *((_DWORD *)v553 + 1) = v545;
                  v553[1] = v1178;
                  v553[2] = v1210;
                  v553[3] = v1096;
                  v553[4] = 0;
                  v553[5] = v1193;
                  v553[6] = v1101;
                  v553[7] = v1123;
                  *((_DWORD *)v553 + 16) = v1165;
                  *((_DWORD *)v553 + 17) = v1108;
                  *((unsigned char *)v553 + 72) = v1132;
                  *((unsigned char *)v553 + 73) = v1147;
                  *((unsigned char *)v553 + 74) = v1115;
                  *((unsigned char *)v553 + 75) = v1092;
                  *((unsigned char *)v553 + 76) = v1088;
                  __int16 v554 = __src[0];
                  *((unsigned char *)v553 + 79) = BYTE2(__src[0]);
                  *(_WORD *)((char *)v553 + 77) = v554;
                  uint64_t v555 = *find_entry((uint64_t)ht, (unsigned char *)v553 + 8, 8uLL, 0);
                  if (v555) {
                    uint64_t v555 = *(void *)(v555 + 32);
                  }
                  v553[4] = v555;
                  apr_hash_set(ht, v553 + 1, 8, v553);
                  v553[3] = v292;
                  int v551 = *v552;
                  uint64_t v547 = v126 + 64;
                }
                uint64_t v556 = v1239;
                if (v551 <= -16316)
                {
                  switch(v551)
                  {
                    case -16349:
                      v558 = GTTraceFunc_argumentBytesWithMap((void *)v550, *(unsigned __int8 *)(v547 + (v549 << 6) + 13), v1239);
                      v1101 = GTTraceFunc_argumentBytesWithMap((void *)v550, v558[8], v556);
                      break;
                    case -16348:
                      int v1108 = *((_DWORD *)GTTraceFunc_argumentBytesWithMap((void *)v550, *(unsigned __int8 *)(v547 + (v549 << 6) + 13), v1239)+ 2);
                      break;
                    case -16347:
                      int v1092 = *((_DWORD *)GTTraceFunc_argumentBytesWithMap((void *)v550, *(unsigned __int8 *)(v547 + (v549 << 6) + 13), v1239)+ 2);
                      break;
                    case -16346:
                      int v1088 = *((_DWORD *)GTTraceFunc_argumentBytesWithMap((void *)v550, *(unsigned __int8 *)(v547 + (v549 << 6) + 13), v1239)+ 2);
                      break;
                    case -16345:
                      int v1115 = *((_DWORD *)GTTraceFunc_argumentBytesWithMap((void *)v550, *(unsigned __int8 *)(v547 + (v549 << 6) + 13), v1239)+ 2);
                      break;
                    case -16344:
                      uint64_t v1096 = *(void *)v550;
                      break;
                    default:
                      if (v551 == -16316)
                      {
                        v561 = GTTraceFunc_argumentBytesWithMap((void *)v550, *(unsigned __int8 *)(v547 + (v549 << 6) + 13), v1239);
                        int v545 = *v552;
                        uint64_t v1178 = *((void *)v561 + 1);
                        uint64_t v1193 = *(void *)v561;
                        unint64_t v1210 = *(void *)v550;
                        int v560 = 64;
LABEL_730:
                        int v1165 = v560;
                      }
                      break;
                  }
LABEL_736:
                  int v557 = HIDWORD(v546);
                }
                else
                {
                  int v557 = HIDWORD(v546);
                  switch(v551)
                  {
                    case -15809:
                    case -15808:
                      char v1147 = GTTraceFunc_argumentBytesWithMap((void *)v550, *(unsigned __int8 *)(v547 + (v549 << 6) + 13), v1239)[8];
                      break;
                    case -15807:
                      break;
                    case -15806:
                    case -15805:
                      char v1132 = GTTraceFunc_argumentBytesWithMap((void *)v550, *(unsigned __int8 *)(v547 + (v549 << 6) + 13), v1239)[8];
                      break;
                    default:
                      if (v551 == -16315)
                      {
                        v562 = GTTraceFunc_argumentBytesWithMap((void *)v550, *(unsigned __int8 *)(v547 + (v549 << 6) + 13), v1239);
                        int v545 = *v552;
                        uint64_t v1178 = *((void *)v562 + 1);
                        uint64_t v1193 = *(void *)v562;
                        unint64_t v1210 = *(void *)v550;
                        int v560 = *((_DWORD *)v562 + 4);
                      }
                      else
                      {
                        if (v551 != -16165) {
                          goto LABEL_736;
                        }
                        v559 = GTTraceFunc_argumentBytesWithMap((void *)v550, *(unsigned __int8 *)(v547 + (v549 << 6) + 13), v1239);
                        int v545 = *v552;
                        uint64_t v1178 = *((void *)v559 + 1);
                        uint64_t v1193 = *(void *)v559;
                        unint64_t v1210 = *(void *)v550;
                        v1123 = GTTraceFunc_argumentBytesWithMap((void *)v550, v559[16], v556);
                        int v560 = *(_DWORD *)v1123;
                      }
                      goto LABEL_730;
                  }
                }
                unsigned int v563 = atomic_load((unsigned int *)(v126 + 4));
                int v564 = v546 + (v563 >> 6);
                uint64_t v565 = (v557 + 1);
                unint64_t v546 = (v565 << 32) | v546;
                if (v565 == v564 - 1)
                {
                  unint64_t v546 = (v565 << 32) | v565;
                  uint64_t v126 = *(void *)(v126 + 40);
                  continue;
                }
                goto LABEL_709;
              }
            }
          }
          break;
        }
        v306 = apr_palloc(p, 0x50uLL);
        *(_DWORD *)v306 = 27;
        *((_DWORD *)v306 + 1) = v545;
        v306[1] = v1178;
        v307 = v306 + 1;
        v306[2] = v1210;
        v306[3] = v1096;
        v306[4] = 0;
        v306[5] = v1193;
        v306[6] = v1101;
        v306[7] = v1123;
        *((_DWORD *)v306 + 16) = v1165;
        *((_DWORD *)v306 + 17) = v1108;
        *((unsigned char *)v306 + 72) = v1132;
        *((unsigned char *)v306 + 73) = v1147;
        *((unsigned char *)v306 + 74) = v1115;
        *((unsigned char *)v306 + 75) = v1092;
        *((unsigned char *)v306 + 76) = v1088;
        __int16 v566 = __src[0];
        *((unsigned char *)v306 + 79) = BYTE2(__src[0]);
        *(_WORD *)((char *)v306 + 77) = v566;
        goto LABEL_922;
      case 23:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++HIDWORD(v1245);
        uint64_t v130 = *(void *)(v37 + 32);
        if (v130)
        {
          unsigned int v131 = 0;
          while (1)
          {
            unsigned int v132 = atomic_load((unsigned int *)(v130 + 4));
            uint64_t v133 = v131 + (v132 >> 6) - 1;
            if ((int)v133 > 0) {
              break;
            }
            uint64_t v130 = *(void *)(v130 + 40);
            unsigned int v131 = v133;
            if (!v130)
            {
              unsigned int v131 = v133;
              goto LABEL_742;
            }
          }
        }
        else
        {
          unsigned int v131 = 0;
        }
        uint64_t v133 = 0;
LABEL_742:
        int v567 = 0;
        uint64_t v568 = 0;
        unint64_t v1194 = 0;
        uint64_t v1211 = 0;
        v569 = 0;
        unint64_t v570 = v131 | (unint64_t)(v133 << 32);
        while (2)
        {
          uint64_t v571 = v130 + 64;
LABEL_744:
          if (v130)
          {
            int v572 = HIDWORD(v570) - v570;
            if ((*(unsigned char *)(v571 + ((uint64_t)(HIDWORD(v570) - (int)v570) << 6) + 15) & 8) != 0)
            {
              uint64_t v573 = v571 + ((uint64_t)v572 << 6);
              unint64_t v451 = *(void *)v573;
              if (*(void *)v573 < v1236 + v1235)
              {
                int v574 = *(_DWORD *)(v573 + 8);
                if (v574 == -15350)
                {
                  uint64_t v575 = v1239;
                  v576 = GTTraceFunc_argumentBytesWithMap((void *)v573, *(unsigned __int8 *)(v571 + ((uint64_t)v572 << 6) + 13), v1239);
                  int v567 = *(_DWORD *)(v573 + 8);
                  uint64_t v568 = *((void *)v576 + 1);
                  unint64_t v1194 = *(void *)v573;
                  uint64_t v1211 = *(void *)v576;
                  v569 = GTTraceFunc_argumentBytesWithMap((void *)v573, v576[24], v575);
                }
                else if (v574 == -15332)
                {
                  v14 = v1220;
                  if (v1235 > v451) {
                    goto LABEL_1211;
                  }
                  v977 = (char *)apr_palloc(p, 0x40uLL);
                  *(_DWORD *)v977 = 52;
                  *((_DWORD *)v977 + 1) = v567;
                  *((void *)v977 + 1) = v568;
                  v979 = v977 + 8;
                  *((void *)v977 + 2) = v1194;
                  *((void *)v977 + 3) = -1;
                  *((void *)v977 + 4) = 0;
                  *((void *)v977 + 5) = v1211;
                  *((void *)v977 + 6) = 0;
                  *((void *)v977 + 7) = v569;
                  goto LABEL_1278;
                }
                v14 = v1220;
                unsigned int v577 = atomic_load((unsigned int *)(v130 + 4));
                int v578 = v570 + (v577 >> 6);
                uint64_t v579 = (HIDWORD(v570) + 1);
                unint64_t v570 = (v579 << 32) | v570;
                if (v579 == v578 - 1)
                {
                  unint64_t v570 = (v579 << 32) | v579;
                  uint64_t v130 = *(void *)(v130 + 40);
                  continue;
                }
                goto LABEL_744;
              }
            }
          }
          break;
        }
        v189 = apr_palloc(p, 0x40uLL);
        *(_DWORD *)v189 = 52;
        *((_DWORD *)v189 + 1) = v567;
        v189[1] = v568;
        v190 = v189 + 1;
        unint64_t v425 = -1;
        v189[2] = v1194;
        v189[3] = -1;
        v189[4] = 0;
        v189[5] = v1211;
        v189[6] = 0;
        v189[7] = v569;
        goto LABEL_1068;
      case 24:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        BYTE2(__src[0]) = 0;
        LOWORD(__src[0]) = 0;
        LODWORD(v1246) = v1246 + 1;
        uint64_t v134 = *(void *)(v37 + 32);
        if (v134)
        {
          unsigned int v135 = 0;
          while (1)
          {
            unsigned int v136 = atomic_load((unsigned int *)(v134 + 4));
            uint64_t v137 = v135 + (v136 >> 6) - 1;
            if ((int)v137 > 0) {
              break;
            }
            uint64_t v134 = *(void *)(v134 + 40);
            unsigned int v135 = v137;
            if (!v134)
            {
              unsigned int v135 = v137;
              goto LABEL_756;
            }
          }
        }
        else
        {
          unsigned int v135 = 0;
        }
        uint64_t v137 = 0;
LABEL_756:
        int v580 = 0;
        uint64_t v1133 = 0;
        uint64_t v1195 = 0;
        v1225 = 0;
        char v1148 = 0;
        unint64_t v581 = v135 | (unint64_t)(v137 << 32);
        int v582 = 0;
        unint64_t v1166 = 0;
        uint64_t v1179 = -1;
        while (2)
        {
          uint64_t v583 = v134 + 64;
LABEL_758:
          if (!v134
            || (int v584 = HIDWORD(v581) - v581,
                (*(unsigned char *)(v583 + ((uint64_t)(HIDWORD(v581) - (int)v581) << 6) + 15) & 8) == 0)
            || (uint64_t v585 = v584, v586 = v583 + ((uint64_t)v584 << 6),
                             unint64_t v314 = *(void *)v586,
                             *(void *)v586 >= v1236 + v1235))
          {
            v363 = apr_palloc(p, 0x40uLL);
            *(_DWORD *)v363 = 68;
            *((_DWORD *)v363 + 1) = v580;
            v363[1] = v1133;
            v444 = v363 + 1;
            v363[2] = v1166;
            v363[3] = v1179;
            v363[4] = 0;
            v363[5] = v1195;
            v363[6] = v1225;
            *((_DWORD *)v363 + 14) = v582;
            *((unsigned char *)v363 + 60) = v1148;
            *(_WORD *)((char *)v363 + 61) = __src[0];
            *((unsigned char *)v363 + 63) = BYTE2(__src[0]);
LABEL_778:
            uint64_t v599 = *find_entry((uint64_t)ht, v444, 8uLL, 0);
            if (v599) {
              uint64_t v599 = *(void *)(v599 + 32);
            }
            v363[4] = v599;
            v365 = ht;
            v366 = v444;
LABEL_781:
            apr_hash_set(v365, v366, 8, v363);
            v363[3] = -1;
            goto LABEL_1211;
          }
          v588 = (int *)(v586 + 8);
          int v587 = *(_DWORD *)(v586 + 8);
          if (v587 == -15411)
          {
            if (v1235 > v314)
            {
              uint64_t v589 = v1239;
              break;
            }
            v590 = apr_palloc(p, 0x40uLL);
            *(_DWORD *)v590 = 68;
            *((_DWORD *)v590 + 1) = v580;
            v590[1] = v1133;
            v590[2] = v1166;
            v590[3] = v1179;
            v590[4] = 0;
            v590[5] = v1195;
            v590[6] = v1225;
            *((_DWORD *)v590 + 14) = v582;
            *((unsigned char *)v590 + 60) = v1148;
            *(_WORD *)((char *)v590 + 61) = __src[0];
            *((unsigned char *)v590 + 63) = BYTE2(__src[0]);
            uint64_t v591 = *find_entry((uint64_t)ht, (unsigned char *)v590 + 8, 8uLL, 0);
            if (v591) {
              uint64_t v591 = *(void *)(v591 + 32);
            }
            v590[4] = v591;
            apr_hash_set(ht, v590 + 1, 8, v590);
            v590[3] = v314;
            int v587 = *v588;
            uint64_t v583 = v134 + 64;
          }
          else if (v587 == -15801)
          {
            if (v1235 > v314) {
              goto LABEL_1211;
            }
            v966 = (char *)apr_palloc(p, 0x40uLL);
            *(_DWORD *)v966 = 68;
            *((_DWORD *)v966 + 1) = v580;
            *((void *)v966 + 1) = v1133;
            *((void *)v966 + 2) = v1166;
            *((void *)v966 + 3) = v1179;
            *((void *)v966 + 4) = 0;
            *((void *)v966 + 5) = v1195;
            *((void *)v966 + 6) = v1225;
            *((_DWORD *)v966 + 14) = v582;
            v966[60] = v1148;
            *(_WORD *)(v966 + 61) = __src[0];
            v966[63] = BYTE2(__src[0]);
            uint64_t v987 = *find_entry((uint64_t)ht, v966 + 8, 8uLL, 0);
            if (v987) {
              uint64_t v987 = *(void *)(v987 + 32);
            }
            *((void *)v966 + 4) = v987;
            v969 = ht;
            v970 = v966 + 8;
            goto LABEL_1264;
          }
          if (v587 == -15801)
          {
            uint64_t v1179 = *(void *)v586;
            goto LABEL_775;
          }
          uint64_t v589 = v1239;
          if (v587 != -15411)
          {
            if (v587 == -15793)
            {
              v592 = GTTraceFunc_argumentBytesWithMap((void *)v586, *(unsigned __int8 *)(v583 + (v585 << 6) + 13), v1239);
              unint64_t v1166 = *(void *)v586;
              int v580 = *v588;
              uint64_t v1133 = *((void *)v592 + 1);
              uint64_t v1195 = *(void *)v592;
              v593 = GTTraceFunc_argumentBytesWithMap((void *)v586, v592[16], v589);
              uint64_t v583 = v134 + 64;
              int v582 = *((_DWORD *)v593 + 6);
              v1225 = v593;
              char v1148 = v593[34];
            }
LABEL_775:
            unsigned int v596 = atomic_load((unsigned int *)(v134 + 4));
            int v597 = v581 + (v596 >> 6);
            uint64_t v598 = (HIDWORD(v581) + 1);
            unint64_t v581 = (v598 << 32) | v581;
            if (v598 == v597 - 1)
            {
              unint64_t v581 = (v598 << 32) | v598;
              uint64_t v134 = *(void *)(v134 + 40);
              continue;
            }
            goto LABEL_758;
          }
          break;
        }
        v594 = GTTraceFunc_argumentBytesWithMap((void *)v586, *(unsigned __int8 *)(v583 + (v585 << 6) + 13), v589);
        v595 = GTTraceFunc_argumentBytesWithMap((void *)v586, v594[8], v589);
        uint64_t v583 = v134 + 64;
        v1225 = v595;
        goto LABEL_775;
      case 25:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD1(v1246);
        uint64_t v138 = *(void *)(v37 + 32);
        if (v138)
        {
          unsigned int v139 = 0;
          while (1)
          {
            unsigned int v140 = atomic_load((unsigned int *)(v138 + 4));
            uint64_t v141 = v139 + (v140 >> 6) - 1;
            if ((int)v141 > 0) {
              break;
            }
            uint64_t v138 = *(void *)(v138 + 40);
            unsigned int v139 = v141;
            if (!v138)
            {
              unsigned int v139 = v141;
              goto LABEL_784;
            }
          }
        }
        else
        {
          unsigned int v139 = 0;
        }
        uint64_t v141 = 0;
LABEL_784:
        int v600 = 0;
        uint64_t v601 = 0;
        unint64_t v1196 = 0;
        uint64_t v1212 = 0;
        v602 = 0;
        int v603 = 0;
        unint64_t v604 = v139 | (unint64_t)(v141 << 32);
        while (2)
        {
          uint64_t v605 = v138 + 64;
LABEL_786:
          if (v138)
          {
            int v606 = HIDWORD(v604) - v604;
            if ((*(unsigned char *)(v605 + ((uint64_t)(HIDWORD(v604) - (int)v604) << 6) + 15) & 8) != 0)
            {
              uint64_t v607 = v605 + ((uint64_t)v606 << 6);
              unint64_t v416 = *(void *)v607;
              if (*(void *)v607 < v1236 + v1235)
              {
                int v608 = *(_DWORD *)(v607 + 8);
                if (v608 == -15900)
                {
                  uint64_t v609 = v1239;
                  v610 = GTTraceFunc_argumentBytesWithMap((void *)v607, *(unsigned __int8 *)(v605 + ((uint64_t)v606 << 6) + 13), v1239);
                  int v600 = *(_DWORD *)(v607 + 8);
                  uint64_t v601 = *((void *)v610 + 1);
                  unint64_t v1196 = *(void *)v607;
                  uint64_t v1212 = *(void *)v610;
                  v602 = GTTraceFunc_argumentBytesWithMap((void *)v607, v610[24], v609);
                  int v603 = *((_DWORD *)v610 + 4);
                }
                else if (v608 == -15769)
                {
                  v14 = v1220;
                  if (v1235 > v416) {
                    goto LABEL_1211;
                  }
                  int v988 = v603;
                  v989 = apr_palloc(p, 0x40uLL);
                  *(_DWORD *)v989 = 73;
                  *((_DWORD *)v989 + 1) = v600;
                  v989[1] = v601;
                  v990 = v989 + 1;
                  v989[2] = v1196;
                  v989[3] = -1;
                  v989[4] = 0;
                  v989[5] = v1212;
                  v989[6] = v602;
                  *((_DWORD *)v989 + 14) = v988;
                  *((_DWORD *)v989 + 15) = 0;
                  goto LABEL_1267;
                }
                v14 = v1220;
                unsigned int v611 = atomic_load((unsigned int *)(v138 + 4));
                int v612 = v604 + (v611 >> 6);
                uint64_t v613 = (HIDWORD(v604) + 1);
                unint64_t v604 = (v613 << 32) | v604;
                if (v613 == v612 - 1)
                {
                  unint64_t v604 = (v613 << 32) | v613;
                  uint64_t v138 = *(void *)(v138 + 40);
                  continue;
                }
                goto LABEL_786;
              }
            }
          }
          break;
        }
        int v614 = v603;
        v189 = apr_palloc(p, 0x40uLL);
        *(_DWORD *)v189 = 73;
        *((_DWORD *)v189 + 1) = v600;
        v189[1] = v601;
        v190 = v189 + 1;
        unint64_t v425 = -1;
        v189[2] = v1196;
        v189[3] = -1;
        v189[4] = 0;
        v189[5] = v1212;
        v189[6] = v602;
        *((_DWORD *)v189 + 14) = v614;
        *((_DWORD *)v189 + 15) = 0;
        goto LABEL_1068;
      case 26:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD2(v1246);
        uint64_t v142 = *(void *)(v37 + 32);
        if (v142)
        {
          unsigned int v143 = 0;
          while (1)
          {
            unsigned int v144 = atomic_load((unsigned int *)(v142 + 4));
            uint64_t v145 = v143 + (v144 >> 6) - 1;
            if ((int)v145 > 0) {
              break;
            }
            uint64_t v142 = *(void *)(v142 + 40);
            unsigned int v143 = v145;
            if (!v142)
            {
              unsigned int v143 = v145;
              goto LABEL_798;
            }
          }
        }
        else
        {
          unsigned int v143 = 0;
        }
        uint64_t v145 = 0;
LABEL_798:
        int v615 = 0;
        uint64_t v616 = 0;
        uint64_t v617 = 0;
        uint64_t v618 = 0;
        uint64_t v619 = 0;
        v620 = 0;
        v621 = 0;
        unint64_t v622 = 0;
        int v1213 = 0;
        unint64_t v1180 = 0;
        int v1197 = 0;
        LODWORD(v1167) = 0;
        unint64_t v623 = v143 | (unint64_t)(v145 << 32);
        uint64_t v624 = 0;
        uint64_t v625 = 0;
        while (2)
        {
          uint64_t v626 = v142 + 64;
LABEL_800:
          if (v142
            && (int v627 = HIDWORD(v623) - v623,
                (*(unsigned char *)(v626 + ((uint64_t)(HIDWORD(v623) - (int)v623) << 6) + 15) & 8) != 0)
            && (v628 = (uint64_t *)(v626 + ((uint64_t)v627 << 6)), unint64_t v197 = *v628, *v628 < v1236 + v1235))
          {
            v630 = (unsigned int *)(v628 + 1);
            int v629 = *((_DWORD *)v628 + 2);
            if (v629 != -6139)
            {
              uint64_t v631 = v1239;
              if (v629 <= -6123)
              {
                switch(v629)
                {
                  case -6143:
                    v635 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    uint64_t v1149 = *v628;
                    uint64_t v636 = *v630;
                    uint64_t v638 = *(void *)v635;
                    uint64_t v637 = *((void *)v635 + 1);
                    v639 = GTTraceFunc_argumentBytesWithMap(v628, v635[16], v631);
                    unsigned int v640 = v635[24];
                    v620 = v639;
                    v641 = GTTraceFunc_argumentBytesWithMap(v628, v640, v631);
                    int v615 = v636;
                    uint64_t v619 = v638;
                    uint64_t v616 = v637;
                    uint64_t v617 = v1149;
                    uint64_t v626 = v142 + 64;
                    v621 = v641;
                    unint64_t v622 = (unint64_t)v641 >> 32;
                    uint64_t v618 = v636;
                    break;
                  case -6141:
LABEL_812:
                    v648 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    uint64_t v626 = v142 + 64;
                    uint64_t v617 = *v628;
                    uint64_t v618 = *v630;
                    uint64_t v619 = *(void *)v648;
                    uint64_t v616 = *((void *)v648 + 1);
                    v620 = (char *)*((void *)v648 + 2);
                    v621 = (char *)*((unsigned int *)v648 + 6);
                    unint64_t v622 = *((unsigned int *)v648 + 7);
                    LODWORD(v1167) = *((_DWORD *)v648 + 9);
                    int v1213 = *((_DWORD *)v648 + 8);
                    int v1197 = *((_DWORD *)v648 + 8) >> 8;
                    uint64_t v624 = *((void *)v648 + 5);
                    goto LABEL_821;
                  case -6134:
                    v659 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    uint64_t v626 = v142 + 64;
                    uint64_t v617 = *v628;
                    uint64_t v618 = *v630;
                    uint64_t v619 = *(void *)v659;
                    uint64_t v616 = *((void *)v659 + 1);
                    unint64_t v1180 = v1180 & 0xFFFFFFFFFFFFFF00 | v659[16];
                    v620 = (char *)*((void *)v659 + 3);
                    v621 = (char *)*((unsigned int *)v659 + 8);
                    unint64_t v622 = *((unsigned int *)v659 + 9);
                    uint64_t v624 = *((void *)v659 + 5);
                    uint64_t v625 = *((void *)v659 + 6);
                    goto LABEL_821;
                  case -6133:
                    v660 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    uint64_t v626 = v142 + 64;
                    uint64_t v617 = *v628;
                    uint64_t v618 = *v630;
                    uint64_t v619 = *(void *)v660;
                    uint64_t v616 = *((void *)v660 + 1);
                    v621 = (char *)*((unsigned int *)v660 + 5);
                    v620 = (char *)*((int *)v660 + 4);
                    unint64_t v622 = *((unsigned int *)v660 + 6);
                    int v1213 = *((_DWORD *)v660 + 7);
                    int v1197 = *((_DWORD *)v660 + 7) >> 8;
                    goto LABEL_821;
                  case -6131:
                    v661 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    uint64_t v1135 = *v630;
                    uint64_t v1152 = *v628;
                    uint64_t v663 = *(void *)v661;
                    uint64_t v662 = *((void *)v661 + 1);
                    v664 = GTTraceFunc_argumentBytesWithMap(v628, v661[16], v631);
                    v657 = GTTraceFunc_argumentBytesWithMap(v628, v661[24], v631);
                    uint64_t v619 = v663;
                    uint64_t v618 = v1135;
                    uint64_t v617 = v1152;
                    uint64_t v616 = v662;
                    uint64_t v626 = v142 + 64;
                    unint64_t v658 = (unint64_t)v657 >> 32;
                    int v665 = v661[32];
                    v620 = v664;
                    int v1213 = v665;
LABEL_819:
                    int v615 = v618;
                    v621 = v657;
                    unint64_t v622 = v658;
                    break;
                  case -6129:
                    v666 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    uint64_t v1136 = *v630;
                    uint64_t v1153 = *v628;
                    uint64_t v668 = *(void *)v666;
                    uint64_t v667 = *((void *)v666 + 1);
                    v620 = (char *)*((int *)v666 + 4);
                    v669 = GTTraceFunc_argumentBytesWithMap(v628, v666[24], v631);
                    uint64_t v619 = v668;
                    uint64_t v616 = v667;
                    uint64_t v626 = v142 + 64;
                    int v1213 = v669;
                    int v1197 = v669 >> 8;
                    unint64_t v1167 = (unint64_t)v669 >> 32;
                    v621 = (char *)*((unsigned int *)v666 + 8);
                    unint64_t v622 = *((unsigned int *)v666 + 9);
                    uint64_t v618 = v1136;
                    uint64_t v617 = v1153;
                    goto LABEL_821;
                  default:
                    break;
                }
              }
              else
              {
                switch(v629)
                {
                  case -6122:
                    v649 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    uint64_t v626 = v142 + 64;
                    uint64_t v617 = *v628;
                    uint64_t v618 = *v630;
                    uint64_t v619 = *(void *)v649;
                    uint64_t v616 = *((void *)v649 + 1);
                    unint64_t v1180 = v1180 & 0xFFFFFFFFFFFF0000 | v649[16] | ((unint64_t)*((_DWORD *)v649 + 5) << 8);
                    v620 = (char *)*((void *)v649 + 3);
                    v621 = (char *)*((unsigned int *)v649 + 8);
                    unint64_t v622 = *((unsigned int *)v649 + 9);
                    LODWORD(v1167) = *((_DWORD *)v649 + 11);
                    int v1213 = *((_DWORD *)v649 + 10);
                    int v1197 = *((_DWORD *)v649 + 10) >> 8;
                    uint64_t v624 = *((void *)v649 + 6);
                    uint64_t v625 = *((void *)v649 + 7);
                    break;
                  case -6121:
                  case -6120:
                  case -6118:
                  case -6117:
                  case -6115:
                  case -6114:
                  case -6113:
                  case -6112:
                    goto LABEL_822;
                  case -6119:
                  case -6110:
                    v632 = v621;
                    unint64_t v633 = v622;
                    v634 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    unint64_t v622 = v633;
                    v621 = v632;
                    uint64_t v626 = v142 + 64;
                    uint64_t v617 = *v628;
                    uint64_t v618 = *v630;
                    uint64_t v619 = *(void *)v634;
                    uint64_t v616 = *((void *)v634 + 1);
                    break;
                  case -6116:
                    v650 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    uint64_t v626 = v142 + 64;
                    uint64_t v617 = *v628;
                    uint64_t v618 = *v630;
                    uint64_t v619 = *(void *)v650;
                    uint64_t v616 = *((void *)v650 + 1);
                    v620 = (char *)*((void *)v650 + 2);
                    v621 = (char *)*((unsigned int *)v650 + 6);
                    unint64_t v622 = *((unsigned int *)v650 + 7);
                    int v1213 = *((_DWORD *)v650 + 8);
                    int v1197 = *((_DWORD *)v650 + 8) >> 8;
                    uint64_t v624 = *((void *)v650 + 5);
                    uint64_t v625 = *((void *)v650 + 6);
                    LODWORD(v1167) = *((_DWORD *)v650 + 9);
                    unint64_t v1180 = *((void *)v650 + 7);
                    break;
                  case -6111:
                    v651 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    uint64_t v1151 = *v628;
                    uint64_t v652 = *v630;
                    uint64_t v654 = *(void *)v651;
                    uint64_t v653 = *((void *)v651 + 1);
                    v655 = GTTraceFunc_argumentBytesWithMap(v628, v651[16], v631);
                    unsigned int v656 = v651[24];
                    v620 = v655;
                    v657 = GTTraceFunc_argumentBytesWithMap(v628, v656, v631);
                    uint64_t v619 = v654;
                    uint64_t v618 = v652;
                    uint64_t v616 = v653;
                    uint64_t v617 = v1151;
                    uint64_t v626 = v142 + 64;
                    unint64_t v658 = (unint64_t)v657 >> 32;
                    goto LABEL_819;
                  case -6109:
                    goto LABEL_812;
                  default:
                    if (v629 != -6096 && v629 != -6095) {
                      goto LABEL_822;
                    }
                    v1134 = v621;
                    unint64_t v1150 = v622;
                    v642 = GTTraceFunc_argumentBytesWithMap(v628, *(unsigned __int8 *)(v626 + ((uint64_t)v627 << 6) + 13), v1239);
                    uint64_t v643 = *v628;
                    uint64_t v644 = *v630;
                    uint64_t v646 = *(void *)v642;
                    uint64_t v645 = *((void *)v642 + 1);
                    v647 = GTTraceFunc_argumentBytesWithMap(v628, v642[16], v631);
                    v621 = v1134;
                    unint64_t v622 = v1150;
                    uint64_t v619 = v646;
                    uint64_t v618 = v644;
                    uint64_t v616 = v645;
                    uint64_t v617 = v643;
                    uint64_t v626 = v142 + 64;
                    v620 = v647;
                    break;
                }
LABEL_821:
                int v615 = v618;
              }
LABEL_822:
              unsigned int v670 = atomic_load((unsigned int *)(v142 + 4));
              int v671 = v623 + (v670 >> 6);
              uint64_t v672 = (HIDWORD(v623) + 1);
              unint64_t v623 = (v672 << 32) | v623;
              if (v672 == v671 - 1)
              {
                unint64_t v623 = (v672 << 32) | v672;
                uint64_t v142 = *(void *)(v142 + 40);
                continue;
              }
              goto LABEL_800;
            }
            int v1155 = v622;
            if (v1235 > v197) {
              goto LABEL_1211;
            }
            int v954 = v615;
            int v955 = (int)v621;
            uint64_t v956 = v619;
            uint64_t v957 = v616;
            uint64_t v958 = v617;
            v679 = (char *)apr_palloc(p, 0x68uLL);
            v210 = v679;
            *(_DWORD *)v679 = 15;
            *((_DWORD *)v679 + 1) = v954;
            *((void *)v679 + 1) = v957;
            v211 = v679 + 8;
            *((void *)v679 + 2) = v958;
            *((void *)v679 + 3) = -1;
            *((void *)v679 + 4) = 0;
            *((void *)v679 + 5) = v618;
            *((void *)v679 + 6) = v956;
            *((void *)v679 + 7) = v620;
            *((_DWORD *)v679 + 16) = v955;
            *((_DWORD *)v679 + 17) = v1155;
          }
          else
          {
            int v673 = (int)v621;
            uint64_t v674 = v617;
            uint64_t v675 = v616;
            uint64_t v676 = v619;
            int v677 = v622;
            int v678 = v615;
            v679 = (char *)apr_palloc(p, 0x68uLL);
            v210 = v679;
            *(_DWORD *)v679 = 15;
            *((_DWORD *)v679 + 1) = v678;
            *((void *)v679 + 1) = v675;
            v211 = v679 + 8;
            unint64_t v197 = -1;
            *((void *)v679 + 2) = v674;
            *((void *)v679 + 3) = -1;
            *((void *)v679 + 4) = 0;
            *((void *)v679 + 5) = v618;
            *((void *)v679 + 6) = v676;
            *((void *)v679 + 7) = v620;
            *((_DWORD *)v679 + 16) = v673;
            *((_DWORD *)v679 + 17) = v677;
          }
          break;
        }
        *((_DWORD *)v679 + 18) = v1213 | (v1197 << 8);
        *((_DWORD *)v679 + 19) = v1167;
        *((void *)v679 + 10) = v624;
        *((void *)v679 + 11) = v625;
        *((void *)v679 + 12) = v1180;
LABEL_826:
        uint64_t v680 = *find_entry((uint64_t)ht, v211, 8uLL, 0);
        if (v680) {
          uint64_t v680 = *(void *)(v680 + 32);
        }
        v210[4] = v680;
        apr_hash_set(ht, v211, 8, v210);
        v210[3] = v197;
        goto LABEL_1211;
      case 27:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        BYTE2(__src[0]) = 0;
        LOWORD(__src[0]) = 0;
        ++HIDWORD(v1246);
        uint64_t v146 = *(void *)(v37 + 32);
        if (v146)
        {
          unsigned int v147 = 0;
          while (1)
          {
            unsigned int v148 = atomic_load((unsigned int *)(v146 + 4));
            uint64_t v149 = v147 + (v148 >> 6) - 1;
            if ((int)v149 > 0) {
              break;
            }
            uint64_t v146 = *(void *)(v146 + 40);
            unsigned int v147 = v149;
            if (!v146)
            {
              unsigned int v147 = v149;
              goto LABEL_831;
            }
          }
        }
        else
        {
          unsigned int v147 = 0;
        }
        uint64_t v149 = 0;
LABEL_831:
        int v1181 = 0;
        uint64_t v1154 = 0;
        uint64_t v1168 = 0;
        unint64_t v1198 = 0;
        v1214 = 0;
        uint64_t v1079 = 0;
        v1082 = 0;
        v1116 = 0;
        v1089 = 0;
        v1093 = 0;
        v1137 = 0;
        v1102 = 0;
        v1085 = 0;
        v1069 = 0;
        __int16 v1097 = 0;
        char v1071 = 0;
        char v1073 = 0;
        char v1109 = 0;
        unint64_t v681 = v147 | (unint64_t)(v149 << 32);
        uint64_t v1076 = -1;
        while (2)
        {
          uint64_t v682 = v146 + 64;
LABEL_833:
          if (!v146
            || (int v683 = HIDWORD(v681) - v681,
                (*(unsigned char *)(v682 + ((uint64_t)(HIDWORD(v681) - (int)v681) << 6) + 15) & 8) == 0)
            || (uint64_t v684 = v683, v685 = v682 + ((uint64_t)v683 << 6),
                             unint64_t v394 = *(void *)v685,
                             *(void *)v685 >= v1236 + v1235))
          {
            v306 = apr_palloc(p, 0x88uLL);
            v306[1] = v1154;
            v307 = v306 + 1;
            *(_DWORD *)v306 = 43;
            *((_DWORD *)v306 + 1) = v1181;
            v306[2] = v1198;
            v306[3] = v1076;
            v306[4] = 0;
            v306[5] = v1168;
            v306[6] = v1079;
            v306[7] = v1116;
            v306[8] = v1214;
            v306[9] = v1093;
            v306[10] = v1137;
            v306[11] = v1102;
            v306[12] = v1085;
            v306[13] = v1069;
            v306[14] = v1089;
            v306[15] = v1082;
            *((_WORD *)v306 + 64) = v1097;
            *((unsigned char *)v306 + 130) = v1071;
            *((unsigned char *)v306 + 131) = v1073;
            *((unsigned char *)v306 + 132) = v1109;
            *((unsigned char *)v306 + 135) = BYTE2(__src[0]);
            *(_WORD *)((char *)v306 + 133) = __src[0];
LABEL_922:
            uint64_t v728 = *find_entry((uint64_t)ht, v307, 8uLL, 0);
            if (v728) {
              uint64_t v728 = *(void *)(v728 + 32);
            }
            v306[4] = v728;
            apr_hash_set(ht, v307, 8, v306);
            v306[3] = -1;
            goto LABEL_1211;
          }
          v687 = (int *)(v685 + 8);
          int v686 = *(_DWORD *)(v685 + 8);
          if (v686 == -16123 || v686 == -10157)
          {
            if (v1235 <= v394)
            {
              v689 = apr_palloc(p, 0x88uLL);
              v689[1] = v1154;
              *(_DWORD *)v689 = 43;
              *((_DWORD *)v689 + 1) = v1181;
              v689[2] = v1198;
              v689[3] = v1076;
              v689[4] = 0;
              v689[5] = v1168;
              v689[6] = v1079;
              v689[7] = v1116;
              v689[8] = v1214;
              v689[9] = v1093;
              v689[10] = v1137;
              v689[11] = v1102;
              v689[12] = v1085;
              v689[13] = v1069;
              v689[14] = v1089;
              v689[15] = v1082;
              *((_WORD *)v689 + 64) = v1097;
              *((unsigned char *)v689 + 130) = v1071;
              *((unsigned char *)v689 + 131) = v1073;
              *((unsigned char *)v689 + 132) = v1109;
              *((unsigned char *)v689 + 135) = BYTE2(__src[0]);
              *(_WORD *)((char *)v689 + 133) = __src[0];
              uint64_t v690 = *find_entry((uint64_t)ht, (unsigned char *)v689 + 8, 8uLL, 0);
              if (v690) {
                uint64_t v690 = *(void *)(v690 + 32);
              }
              v689[4] = v690;
              apr_hash_set(ht, v689 + 1, 8, v689);
              v689[3] = v394;
              int v686 = *v687;
            }
          }
          else if (v686 == -16293)
          {
            v974 = apr_palloc(p, 0x88uLL);
            v974[1] = v1154;
            v975 = v974 + 1;
            *(_DWORD *)v974 = 43;
            *((_DWORD *)v974 + 1) = v1181;
            v974[2] = v1198;
            v974[3] = v1076;
            v974[4] = 0;
            v974[5] = v1168;
            v974[6] = v1079;
            v974[7] = v1116;
            v974[8] = v1214;
            v974[9] = v1093;
            v974[10] = v1137;
            v974[11] = v1102;
            v974[12] = v1085;
            v974[13] = v1069;
            v974[14] = v1089;
            v974[15] = v1082;
            *((_WORD *)v974 + 64) = v1097;
            *((unsigned char *)v974 + 130) = v1071;
            *((unsigned char *)v974 + 131) = v1073;
            *((unsigned char *)v974 + 132) = v1109;
            *((unsigned char *)v974 + 135) = BYTE2(__src[0]);
            *(_WORD *)((char *)v974 + 133) = __src[0];
LABEL_1282:
            uint64_t v996 = *find_entry((uint64_t)ht, v975, 8uLL, 0);
            if (v996) {
              uint64_t v996 = *(void *)(v996 + 32);
            }
            v974[4] = v996;
            apr_hash_set(ht, v975, 8, v974);
            v974[3] = v394;
            goto LABEL_1211;
          }
          uint64_t v691 = v1239;
          if (v686 <= -15731)
          {
            if (v686 <= -16083)
            {
              if (v686 <= -16124)
              {
                if (v686 == -16293)
                {
                  uint64_t v1076 = *(void *)v685;
                }
                else if (v686 == -16290)
                {
                  uint64_t v706 = v682 + (v684 << 6);
                  v707 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v706 + 13), v1239);
                  unint64_t v1198 = *(void *)v685;
                  int v1181 = *v687;
                  uint64_t v1154 = *((void *)v707 + 1);
                  uint64_t v1168 = *(void *)v707;
                  v708 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v706 + 14), v691);
                  v1137 = v708;
                  if (v708) {
                    v1214 = *(char **)v708;
                  }
                  else {
                    v1214 = 0;
                  }
                  int v713 = HIDWORD(v681);
                  v1116 = GTTraceFunc_argumentBytesWithMap((void *)v685, v707[16], v691);
                  goto LABEL_918;
                }
              }
              else if (v686 == -16123)
              {
                v714 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v682 + (v684 << 6) + 13), v1239);
                v1214 = GTTraceFunc_argumentBytesWithMap((void *)v685, v714[8], v691);
              }
              else if (v686 == -16107 || v686 == -16106)
              {
                uint64_t v692 = v682 + (v684 << 6);
                v693 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v692 + 13), v1239);
                unint64_t v1198 = *(void *)v685;
                int v1181 = *v687;
                uint64_t v1154 = *((void *)v693 + 1);
                uint64_t v1168 = *(void *)v693;
                v694 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v692 + 14), v691);
                v1137 = v694;
                if (v694) {
                  v1214 = *(char **)v694;
                }
                else {
                  v1214 = 0;
                }
                int v713 = HIDWORD(v681);
                v1116 = GTTraceFunc_argumentBytesWithMap((void *)v685, v693[24], v691);
                v1093 = GTTraceFunc_argumentBytesWithMap((void *)v685, v693[25], v691);
                goto LABEL_918;
              }
LABEL_898:
              int v713 = HIDWORD(v681);
              goto LABEL_919;
            }
            if (v686 <= -16039)
            {
              if (v686 == -16082 || v686 == -16081)
              {
                uint64_t v709 = v682 + (v684 << 6);
                v710 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v709 + 13), v1239);
                unint64_t v1198 = *(void *)v685;
                int v1181 = *v687;
                uint64_t v1154 = *((void *)v710 + 1);
                uint64_t v1168 = *(void *)v710;
                v711 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v709 + 14), v691);
                v1137 = v711;
                if (v711) {
                  v1214 = *(char **)v711;
                }
                else {
                  v1214 = 0;
                }
                int v713 = HIDWORD(v681);
                v1116 = GTTraceFunc_argumentBytesWithMap((void *)v685, v710[32], v691);
                v1093 = GTTraceFunc_argumentBytesWithMap((void *)v685, v710[33], v691);
                uint64_t v1079 = *((void *)v710 + 2);
                goto LABEL_918;
              }
              goto LABEL_898;
            }
            if (v686 == -16038)
            {
              uint64_t v715 = v682 + (v684 << 6);
              v716 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v715 + 13), v1239);
              unint64_t v1198 = *(void *)v685;
              int v1181 = *v687;
              uint64_t v1154 = *((void *)v716 + 1);
              uint64_t v1168 = *(void *)v716;
              v717 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v715 + 14), v691);
              v1137 = v717;
              if (v717) {
                v1214 = *(char **)v717;
              }
              else {
                v1214 = 0;
              }
              int v713 = HIDWORD(v681);
              v1116 = GTTraceFunc_argumentBytesWithMap((void *)v685, v716[16], v691);
              char v1073 = 1;
              goto LABEL_918;
            }
            if (v686 == -15830)
            {
              uint64_t v718 = v682 + (v684 << 6);
              v719 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v718 + 13), v1239);
              unint64_t v1198 = *(void *)v685;
              int v1181 = *v687;
              uint64_t v1154 = *((void *)v719 + 1);
              uint64_t v1168 = *(void *)v719;
              v720 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v718 + 14), v691);
              v1137 = v720;
              if (v720) {
                v1214 = *(char **)v720;
              }
              else {
                v1214 = 0;
              }
              int v713 = HIDWORD(v681);
              v1116 = GTTraceFunc_argumentBytesWithMap((void *)v685, v719[18], v691);
              v1069 = GTTraceFunc_argumentBytesWithMap((void *)v685, v719[16], v691);
              char v1071 = v719[17];
              goto LABEL_891;
            }
            if (v686 != -15731) {
              goto LABEL_898;
            }
LABEL_865:
            uint64_t v695 = v682 + (v684 << 6);
            v696 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v695 + 13), v1239);
            unint64_t v1198 = *(void *)v685;
            int v1181 = *v687;
            uint64_t v1154 = *((void *)v696 + 1);
            uint64_t v1168 = *(void *)v696;
            v697 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v695 + 14), v691);
            v1137 = v697;
            if (v697) {
              v1214 = *(char **)v697;
            }
            else {
              v1214 = 0;
            }
            int v713 = HIDWORD(v681);
            v1102 = GTTraceFunc_argumentBytesWithMap((void *)v685, v696[24], v691);
LABEL_890:
            __int16 v1097 = *((_WORD *)v696 + 8);
LABEL_891:
            char v1109 = 1;
LABEL_918:
            uint64_t v682 = v146 + 64;
LABEL_919:
            unsigned int v725 = atomic_load((unsigned int *)(v146 + 4));
            int v726 = v681 + (v725 >> 6);
            uint64_t v727 = (v713 + 1);
            unint64_t v681 = (v727 << 32) | v681;
            if (v727 == v726 - 1)
            {
              unint64_t v681 = (v727 << 32) | v727;
              uint64_t v146 = *(void *)(v146 + 40);
              continue;
            }
            goto LABEL_833;
          }
          break;
        }
        if (v686 > -15551)
        {
          switch(v686)
          {
            case -15430:
            case -15428:
              goto LABEL_865;
            case -15429:
            case -15427:
              goto LABEL_867;
            default:
              if (v686 == -15550)
              {
                uint64_t v721 = v682 + (v684 << 6);
                v722 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v721 + 13), v1239);
                unint64_t v1198 = *(void *)v685;
                int v1181 = *v687;
                uint64_t v1154 = *((void *)v722 + 1);
                uint64_t v1168 = *(void *)v722;
                v723 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v721 + 14), v691);
                v1137 = v723;
                if (v723) {
                  v1214 = *(char **)v723;
                }
                else {
                  v1214 = 0;
                }
                int v713 = HIDWORD(v681);
                unsigned int v724 = v722[24];
                goto LABEL_917;
              }
              if (v686 == -10157)
              {
                v712 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v682 + (v684 << 6) + 13), v1239);
                v1089 = GTTraceFunc_argumentBytesWithMap((void *)v685, v712[16], v691);
              }
              break;
          }
          goto LABEL_898;
        }
        if (v686 > -15609)
        {
          if (v686 != -15608)
          {
            if (v686 == -15551)
            {
              uint64_t v700 = v682 + (v684 << 6);
              v701 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v700 + 13), v1239);
              unint64_t v1198 = *(void *)v685;
              int v1181 = *v687;
              uint64_t v1154 = *((void *)v701 + 1);
              uint64_t v1168 = *(void *)v701;
              v702 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v700 + 14), v691);
              v1137 = v702;
              if (v702) {
                v1214 = *(char **)v702;
              }
              else {
                v1214 = 0;
              }
              int v713 = HIDWORD(v681);
              unsigned int v724 = v701[32];
LABEL_917:
              v1082 = GTTraceFunc_argumentBytesWithMap((void *)v685, v724, v691);
              goto LABEL_918;
            }
            goto LABEL_898;
          }
        }
        else
        {
          if (v686 == -15730)
          {
LABEL_867:
            uint64_t v698 = v682 + (v684 << 6);
            v696 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v698 + 13), v1239);
            unint64_t v1198 = *(void *)v685;
            int v1181 = *v687;
            uint64_t v1154 = *((void *)v696 + 1);
            uint64_t v1168 = *(void *)v696;
            v699 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v698 + 14), v691);
            v1137 = v699;
            if (v699) {
              v1214 = *(char **)v699;
            }
            else {
              v1214 = 0;
            }
            int v713 = HIDWORD(v681);
            v1102 = GTTraceFunc_argumentBytesWithMap((void *)v685, v696[24], v691);
            v1085 = GTTraceFunc_argumentBytesWithMap((void *)v685, v696[25], v691);
            goto LABEL_890;
          }
          if (v686 != -15609) {
            goto LABEL_898;
          }
        }
        uint64_t v703 = v682 + (v684 << 6);
        v704 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v703 + 13), v1239);
        unint64_t v1198 = *(void *)v685;
        int v1181 = *v687;
        uint64_t v1154 = *((void *)v704 + 1);
        uint64_t v1168 = *(void *)v704;
        v705 = GTTraceFunc_argumentBytesWithMap((void *)v685, *(unsigned __int8 *)(v703 + 14), v691);
        v1137 = v705;
        if (v705) {
          v1214 = *(char **)v705;
        }
        else {
          v1214 = 0;
        }
        int v713 = HIDWORD(v681);
        v1089 = GTTraceFunc_argumentBytesWithMap((void *)v685, v704[24], v691);
        goto LABEL_918;
      case 29:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        memset(__src, 0, 24);
        memset(&__src[2], 0, 24);
        LODWORD(__src[0]) = 2;
        *((void *)&__src[1] + 1) = -1;
        ++DWORD1(v1247);
        uint64_t v150 = *(void *)(v37 + 32);
        if (v150)
        {
          unsigned int v151 = 0;
          while (1)
          {
            unsigned int v152 = atomic_load((unsigned int *)(v150 + 4));
            uint64_t v153 = v151 + (v152 >> 6) - 1;
            if ((int)v153 > 0) {
              break;
            }
            uint64_t v150 = *(void *)(v150 + 40);
            unsigned int v151 = v153;
            if (!v150)
            {
              unsigned int v151 = v153;
              goto LABEL_927;
            }
          }
        }
        else
        {
          unsigned int v151 = 0;
        }
        uint64_t v153 = 0;
LABEL_927:
        unint64_t v729 = v151 | (unint64_t)(v153 << 32);
        while (2)
        {
          uint64_t v730 = v150 + 64;
LABEL_929:
          if (v150
            && (*(unsigned char *)(v730 + ((uint64_t)(HIDWORD(v729) - (int)v729) << 6) + 15) & 8) != 0
            && (uint64_t v731 = v730 + ((uint64_t)(HIDWORD(v729) - (int)v729) << 6),
                unint64_t v215 = *(void *)v731,
                *(void *)v731 < v1236 + v1235))
          {
            if (*(_DWORD *)(v731 + 8) != -7161)
            {
              GTMTLSMDrawable_processTraceFuncWithMap((char *)__src, v1239, (uint64_t *)v731);
              unsigned int v732 = atomic_load((unsigned int *)(v150 + 4));
              int v733 = v729 + (v732 >> 6);
              uint64_t v734 = (HIDWORD(v729) + 1);
              unint64_t v729 = (v734 << 32) | v729;
              if (v734 == v733 - 1)
              {
                unint64_t v729 = (v734 << 32) | v734;
                uint64_t v150 = *(void *)(v150 + 40);
                continue;
              }
              goto LABEL_929;
            }
            v14 = v1220;
            if (v1235 > v215) {
              goto LABEL_1211;
            }
            v219 = apr_palloc(p, 0x38uLL);
            _OWORD *v219 = __src[0];
            v219[1] = __src[1];
            v219[2] = __src[2];
            *((void *)v219 + 6) = *(void *)&__src[3];
LABEL_1226:
            uint64_t v959 = *find_entry((uint64_t)ht, (unsigned char *)v219 + 8, 8uLL, 0);
            if (v959) {
              uint64_t v959 = *(void *)(v959 + 32);
            }
            *((void *)v219 + 4) = v959;
            apr_hash_set(ht, (char *)v219 + 8, 8, v219);
          }
          else
          {
            v219 = apr_palloc(p, 0x38uLL);
            _OWORD *v219 = __src[0];
            v219[1] = __src[1];
            v219[2] = __src[2];
            *((void *)v219 + 6) = *(void *)&__src[3];
LABEL_936:
            uint64_t v735 = *find_entry((uint64_t)ht, (unsigned char *)v219 + 8, 8uLL, 0);
            if (v735) {
              uint64_t v735 = *(void *)(v735 + 32);
            }
            v14 = v1220;
            *((void *)v219 + 4) = v735;
            apr_hash_set(ht, (char *)v219 + 8, 8, v219);
            unint64_t v215 = -1;
          }
          break;
        }
        *((void *)v219 + 3) = v215;
        goto LABEL_1211;
      case 30:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        memset(&__src[2], 0, 248);
        memset(__src, 0, 24);
        LODWORD(__src[0]) = 3;
        *((void *)&__src[1] + 1) = -1;
        ++DWORD2(v1247);
        uint64_t v154 = *(void *)(v37 + 32);
        if (v154)
        {
          unsigned int v155 = 0;
          while (1)
          {
            unsigned int v156 = atomic_load((unsigned int *)(v154 + 4));
            uint64_t v157 = v155 + (v156 >> 6) - 1;
            if ((int)v157 > 0) {
              break;
            }
            uint64_t v154 = *(void *)(v154 + 40);
            unsigned int v155 = v157;
            if (!v154)
            {
              unsigned int v155 = v157;
              goto LABEL_942;
            }
          }
        }
        else
        {
          unsigned int v155 = 0;
        }
        uint64_t v157 = 0;
LABEL_942:
        unint64_t v736 = v155 | (unint64_t)(v157 << 32);
        while (2)
        {
          uint64_t v737 = v154 + 64;
LABEL_944:
          if (!v154
            || (int v738 = HIDWORD(v736) - v736,
                (*(unsigned char *)(v737 + ((uint64_t)(HIDWORD(v736) - (int)v736) << 6) + 15) & 8) == 0)
            || (uint64_t v739 = v738, v740 = v737 + ((uint64_t)v738 << 6),
                             unint64_t v741 = *(void *)v740,
                             *(void *)v740 >= v1236 + v1235))
          {
            v756 = (char *)apr_palloc(p, 0x118uLL);
            memcpy(v756, __src, 0x118uLL);
            uint64_t v757 = *find_entry((uint64_t)ht, v756 + 8, 8uLL, 0);
            if (v757) {
              uint64_t v757 = *(void *)(v757 + 32);
            }
            *((void *)v756 + 4) = v757;
            apr_hash_set(ht, v756 + 8, 8, v756);
            *((void *)v756 + 3) = -1;
            goto LABEL_1211;
          }
          int v742 = *(_DWORD *)(v740 + 8);
          if ((v742 + 7165) > 0xB) {
            goto LABEL_956;
          }
          if (((1 << (v742 - 3)) & 0x86B) != 0) {
            goto LABEL_961;
          }
          if (v742 == -7163)
          {
            if (v1235 > v741 || *((void *)&__src[0] + 1) == 0)
            {
              uint64_t v744 = v1239;
LABEL_970:
              v749 = GTTraceFunc_argumentBytesWithMap((void *)v740, *(unsigned __int8 *)(v737 + (v739 << 6) + 13), v744);
              *((void *)&__src[0] + 1) = *(void *)v749;
              *(void *)&__src[1] = *(void *)v740;
              *((void *)&__src[2] + 1) = *((void *)v749 + 1);
              goto LABEL_979;
            }
            goto LABEL_962;
          }
LABEL_956:
          if (v742 == -8183 || v742 == -8181)
          {
LABEL_961:
            if (v1235 <= v741)
            {
LABEL_962:
              v746 = (char *)apr_palloc(p, 0x118uLL);
              memcpy(v746, __src, 0x118uLL);
              uint64_t v747 = *find_entry((uint64_t)ht, v746 + 8, 8uLL, 0);
              if (v747) {
                uint64_t v747 = *(void *)(v747 + 32);
              }
              *((void *)v746 + 4) = v747;
              apr_hash_set(ht, v746 + 8, 8, v746);
              *((void *)v746 + 3) = v741;
              int v742 = *(_DWORD *)(v740 + 8);
              uint64_t v737 = v154 + 64;
            }
          }
          uint64_t v744 = v1239;
          switch(v742)
          {
            case -7165:
              LOWORD(__src[17]) = *((void *)GTTraceFunc_argumentBytesWithMap((void *)v740, *(unsigned __int8 *)(v737 + (v739 << 6) + 13), v1239)+ 1);
              break;
            case -7164:
              __src[11] = *(_OWORD *)(GTTraceFunc_argumentBytesWithMap((void *)v740, *(unsigned __int8 *)(v737 + (v739 << 6) + 13), v1239)+ 8);
              break;
            case -7163:
              goto LABEL_970;
            case -7162:
            case -7159:
              v748 = GTTraceFunc_argumentBytesWithMap((void *)v740, *(unsigned __int8 *)(v737 + (v739 << 6) + 13), v1239);
              *(_OWORD *)((char *)&__src[13] + 8) = *(_OWORD *)(v748 + 8);
              *(_OWORD *)((char *)&__src[14] + 8) = *(_OWORD *)(v748 + 24);
              *(void *)&__src[13] = *((void *)v748 + 5);
              break;
            case -7161:
            case -7158:
            case -7157:
            case -7156:
            case -7155:
              break;
            case -7160:
              BYTE2(__src[17]) = *((_DWORD *)GTTraceFunc_argumentBytesWithMap((void *)v740, *(unsigned __int8 *)(v737 + (v739 << 6) + 13), v1239)+ 2);
              break;
            case -7154:
              BYTE3(__src[17]) = *((_DWORD *)GTTraceFunc_argumentBytesWithMap((void *)v740, *(unsigned __int8 *)(v737 + (v739 << 6) + 13), v1239)+ 2);
              break;
            case -7153:
              v750 = GTTraceFunc_argumentBytesWithMap((void *)v740, *(unsigned __int8 *)(v737 + (v739 << 6) + 13), v1239);
              *((void *)&__src[16] + 1) = GTTraceFunc_argumentBytesWithMap((void *)v740, v750[8], v744);
              break;
            default:
              if (v742 == -8183)
              {
                v751 = GTTraceFunc_argumentBytesWithMap((void *)v740, *(unsigned __int8 *)(v737 + (v739 << 6) + 13), v1239);
                for (uint64_t j = 0; j != 8; ++j)
                  __src[j + 3] = *(_OWORD *)&v751[j * 16 + 8];
                *(_OWORD *)((char *)&__src[15] + 8) = *(_OWORD *)(v751 + 136);
              }
              else if (v742 == -8181)
              {
                __src[12] = *(_OWORD *)(GTTraceFunc_argumentBytesWithMap((void *)v740, *(unsigned __int8 *)(v737 + (v739 << 6) + 13), v1239)+ 8);
              }
              break;
          }
LABEL_979:
          unsigned int v753 = atomic_load((unsigned int *)(v154 + 4));
          int v754 = v736 + (v753 >> 6);
          uint64_t v755 = (HIDWORD(v736) + 1);
          unint64_t v736 = (v755 << 32) | v736;
          if (v755 == v754 - 1)
          {
            unint64_t v736 = (v755 << 32) | v755;
            uint64_t v154 = *(void *)(v154 + 40);
            continue;
          }
          goto LABEL_944;
        }
      case 31:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        *(_DWORD *)((char *)__src + 3) = 0;
        LODWORD(__src[0]) = 0;
        ++HIDWORD(v1247);
        uint64_t v158 = *(void *)(v37 + 32);
        if (v158)
        {
          unsigned int v159 = 0;
          while (1)
          {
            unsigned int v160 = atomic_load((unsigned int *)(v158 + 4));
            uint64_t v161 = v159 + (v160 >> 6) - 1;
            if ((int)v161 > 0) {
              break;
            }
            uint64_t v158 = *(void *)(v158 + 40);
            unsigned int v159 = v161;
            if (!v158)
            {
              unsigned int v159 = v161;
              goto LABEL_986;
            }
          }
        }
        else
        {
          unsigned int v159 = 0;
        }
        uint64_t v161 = 0;
LABEL_986:
        int v758 = 0;
        uint64_t v759 = 0;
        uint64_t v760 = 0;
        uint64_t v761 = 0;
        uint64_t v1199 = 0;
        uint64_t v1226 = 0;
        char v1215 = 0;
        unint64_t v762 = v159 | (unint64_t)(v161 << 32);
        while (2)
        {
          uint64_t v763 = v158 + 64;
LABEL_988:
          if (!v158
            || (int v764 = HIDWORD(v762) - v762,
                (*(unsigned char *)(v763 + ((uint64_t)(HIDWORD(v762) - (int)v762) << 6) + 15) & 8) == 0)
            || (v765 = (uint64_t *)(v763 + ((uint64_t)v764 << 6)), uint64_t v766 = *v765, *v765 >= v1236 + v1235))
          {
            uint64_t v775 = v760;
            uint64_t v776 = v759;
            v530 = (char *)apr_palloc(p, 0x48uLL);
            *(_DWORD *)v530 = 44;
            *((_DWORD *)v530 + 1) = v758;
            *((void *)v530 + 1) = v776;
            v543 = v530 + 8;
            uint64_t v544 = -1;
            *((void *)v530 + 2) = v775;
            *((void *)v530 + 3) = -1;
            *((void *)v530 + 4) = 0;
            *((void *)v530 + 5) = v761;
            *((void *)v530 + 6) = v1199;
            *((void *)v530 + 7) = v1226;
            v530[64] = v1215;
            *(_DWORD *)(v530 + 65) = __src[0];
            *((_DWORD *)v530 + 17) = *(_DWORD *)((char *)__src + 3);
LABEL_1008:
            v777 = ht;
            goto LABEL_1009;
          }
          v768 = (int *)(v765 + 1);
          int v767 = *((_DWORD *)v765 + 2);
          if (v767 == -15610)
          {
            uint64_t v960 = v760;
            uint64_t v961 = v759;
            v962 = apr_palloc(p, 0x48uLL);
            *(_DWORD *)v962 = 44;
            *((_DWORD *)v962 + 1) = v758;
            v962[1] = v961;
            v962[2] = v960;
            v962[3] = -1;
            v962[4] = 0;
            v962[5] = v761;
            v962[6] = v1199;
            v962[7] = v1226;
            *((unsigned char *)v962 + 64) = v1215;
            *(_DWORD *)((char *)v962 + 65) = __src[0];
            *((_DWORD *)v962 + 17) = *(_DWORD *)((char *)__src + 3);
            uint64_t v963 = *find_entry((uint64_t)ht, (unsigned char *)v962 + 8, 8uLL, 0);
            if (v963) {
              uint64_t v963 = *(void *)(v963 + 32);
            }
            v962[4] = v963;
            apr_hash_set(ht, v962 + 1, 8, v962);
            v962[3] = v766;
            goto LABEL_1211;
          }
          if (v767 <= -15445)
          {
            if (v767 != -15620)
            {
              if (v767 == -15463)
              {
                v771 = GTTraceFunc_argumentBytesWithMap(v765, *(unsigned __int8 *)(v763 + ((uint64_t)v764 << 6) + 13), v1239);
                uint64_t v760 = *v765;
                int v758 = *v768;
                uint64_t v759 = *((void *)v771 + 1);
                uint64_t v1226 = *(void *)v771;
                uint64_t v761 = *((void *)v771 + 2);
                char v1215 = v771[24];
              }
LABEL_1005:
              unsigned int v772 = atomic_load((unsigned int *)(v158 + 4));
              int v773 = v762 + (v772 >> 6);
              uint64_t v774 = (HIDWORD(v762) + 1);
              unint64_t v762 = (v774 << 32) | v762;
              if (v774 == v773 - 1)
              {
                unint64_t v762 = (v774 << 32) | v774;
                uint64_t v158 = *(void *)(v158 + 40);
                continue;
              }
              goto LABEL_988;
            }
            v769 = GTTraceFunc_argumentBytesWithMap(v765, *(unsigned __int8 *)(v763 + ((uint64_t)v764 << 6) + 13), v1239);
            uint64_t v760 = *v765;
            int v758 = *v768;
            uint64_t v759 = *((void *)v769 + 1);
            uint64_t v1199 = *(void *)v769;
          }
          else
          {
            switch(v767)
            {
              case -15444:
                v769 = GTTraceFunc_argumentBytesWithMap(v765, *(unsigned __int8 *)(v763 + ((uint64_t)v764 << 6) + 13), v1239);
                uint64_t v760 = *v765;
                int v758 = *v768;
                uint64_t v759 = *((void *)v769 + 1);
                uint64_t v1226 = *(void *)v769;
                char v770 = 2;
                break;
              case -15437:
                v769 = GTTraceFunc_argumentBytesWithMap(v765, *(unsigned __int8 *)(v763 + ((uint64_t)v764 << 6) + 13), v1239);
                uint64_t v760 = *v765;
                int v758 = *v768;
                uint64_t v759 = *((void *)v769 + 1);
                uint64_t v1226 = *(void *)v769;
                char v770 = 4;
                break;
              case -15436:
                v769 = GTTraceFunc_argumentBytesWithMap(v765, *(unsigned __int8 *)(v763 + ((uint64_t)v764 << 6) + 13), v1239);
                uint64_t v760 = *v765;
                int v758 = *v768;
                uint64_t v759 = *((void *)v769 + 1);
                uint64_t v1226 = *(void *)v769;
                char v770 = 1;
                break;
              default:
                goto LABEL_1005;
            }
            char v1215 = v770;
          }
          break;
        }
        uint64_t v761 = *((void *)v769 + 2);
        goto LABEL_1005;
      case 32:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        LODWORD(v1248) = v1248 + 1;
        memset(__src, 0, 24);
        memset(&__src[2], 0, 64);
        LODWORD(__src[0]) = 39;
        *((void *)&__src[1] + 1) = -1;
        uint64_t v162 = *(void *)(v37 + 32);
        if (v162)
        {
          unsigned int v163 = 0;
          while (1)
          {
            unsigned int v164 = atomic_load((unsigned int *)(v162 + 4));
            uint64_t v165 = v163 + (v164 >> 6) - 1;
            if ((int)v165 > 0) {
              break;
            }
            uint64_t v162 = *(void *)(v162 + 40);
            unsigned int v163 = v165;
            if (!v162)
            {
              unsigned int v163 = v165;
              goto LABEL_1014;
            }
          }
        }
        else
        {
          unsigned int v163 = 0;
        }
        uint64_t v165 = 0;
LABEL_1014:
        unint64_t v779 = v163 | (unint64_t)(v165 << 32);
        while (2)
        {
          uint64_t v780 = v162 + 64;
LABEL_1016:
          if (v162)
          {
            if ((*(unsigned char *)(v780 + ((uint64_t)(HIDWORD(v779) - (int)v779) << 6) + 15) & 8) != 0)
            {
              uint64_t v781 = v780 + ((uint64_t)(HIDWORD(v779) - (int)v779) << 6);
              unint64_t v262 = *(void *)v781;
              if (*(void *)v781 < v1236 + v1235)
              {
                int v782 = *(_DWORD *)(v781 + 8);
                if ((v782 + 20480) < 5)
                {
                  if (v1235 <= v262)
                  {
                    v783 = apr_palloc(p, 0x60uLL);
                    *((_OWORD *)v783 + 2) = __src[2];
                    *((_OWORD *)v783 + 3) = __src[3];
                    *((_OWORD *)v783 + 4) = __src[4];
                    *((_OWORD *)v783 + 5) = __src[5];
                    *(_OWORD *)v783 = __src[0];
                    *((_OWORD *)v783 + 1) = __src[1];
                    uint64_t v784 = *find_entry((uint64_t)ht, (unsigned char *)v783 + 8, 8uLL, 0);
                    if (v784) {
                      uint64_t v784 = *(void *)(v784 + 32);
                    }
                    v783[4] = v784;
                    apr_hash_set(ht, v783 + 1, 8, v783);
                    v783[3] = v262;
                  }
LABEL_1025:
                  GTMTLFXSMSpatialScaler_processTraceFuncWithMap((char *)__src, v1239, (uint64_t *)v781);
                  unsigned int v785 = atomic_load((unsigned int *)(v162 + 4));
                  int v786 = v779 + (v785 >> 6);
                  uint64_t v787 = (HIDWORD(v779) + 1);
                  unint64_t v779 = (v787 << 32) | v779;
                  if (v787 == v786 - 1)
                  {
                    unint64_t v779 = (v787 << 32) | v787;
                    uint64_t v162 = *(void *)(v162 + 40);
                    continue;
                  }
                  goto LABEL_1016;
                }
                if (v782 != -20475) {
                  goto LABEL_1025;
                }
                v1043 = apr_palloc(p, 0x60uLL);
                v278 = v1043;
LABEL_1302:
                v1043[2] = __src[2];
                v1043[3] = __src[3];
                v1043[4] = __src[4];
                v1043[5] = __src[5];
                _OWORD *v1043 = __src[0];
                v1043[1] = __src[1];
                goto LABEL_1303;
              }
            }
          }
          break;
        }
        v788 = apr_palloc(p, 0x60uLL);
        v278 = v788;
        goto LABEL_1052;
      case 33:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD1(v1248);
        memset(__src, 0, 24);
        memset(&__src[2], 0, 120);
        LODWORD(__src[0]) = 40;
        *((void *)&__src[1] + 1) = -1;
        uint64_t v166 = *(void *)(v37 + 32);
        if (v166)
        {
          unsigned int v167 = 0;
          while (1)
          {
            unsigned int v168 = atomic_load((unsigned int *)(v166 + 4));
            uint64_t v169 = v167 + (v168 >> 6) - 1;
            if ((int)v169 > 0) {
              break;
            }
            uint64_t v166 = *(void *)(v166 + 40);
            unsigned int v167 = v169;
            if (!v166)
            {
              unsigned int v167 = v169;
              goto LABEL_1030;
            }
          }
        }
        else
        {
          unsigned int v167 = 0;
        }
        uint64_t v169 = 0;
LABEL_1030:
        unint64_t v789 = v167 | (unint64_t)(v169 << 32);
        while (2)
        {
          uint64_t v790 = v166 + 64;
LABEL_1032:
          if (!v166
            || (*(unsigned char *)(v790 + ((uint64_t)(HIDWORD(v789) - (int)v789) << 6) + 15) & 8) == 0
            || (uint64_t v791 = v790 + ((uint64_t)(HIDWORD(v789) - (int)v789) << 6),
                unint64_t v262 = *(void *)v791,
                *(void *)v791 >= v1236 + v1235))
          {
            v788 = apr_palloc(p, 0x98uLL);
            v278 = v788;
            v788[6] = __src[6];
            v788[7] = __src[7];
            v788[8] = __src[8];
            *((void *)v788 + 18) = *(void *)&__src[9];
LABEL_1052:
            v788[2] = __src[2];
            v788[3] = __src[3];
            v788[4] = __src[4];
            v788[5] = __src[5];
            _OWORD *v788 = __src[0];
            v788[1] = __src[1];
LABEL_1155:
            uint64_t v904 = *find_entry((uint64_t)ht, (unsigned char *)v278 + 8, 8uLL, 0);
            if (v904) {
              uint64_t v904 = *(void *)(v904 + 32);
            }
            *((void *)v278 + 4) = v904;
            apr_hash_set(ht, (char *)v278 + 8, 8, v278);
            unint64_t v262 = -1;
            goto LABEL_1158;
          }
          int v792 = *(_DWORD *)(v791 + 8);
          if ((v792 + 20471) < 0xD) {
            break;
          }
          if (v792 <= -20458)
          {
            if (v792 != -20473)
            {
              if (v792 == -20475)
              {
                v1043 = apr_palloc(p, 0x98uLL);
                v278 = v1043;
                v1043[6] = __src[6];
                v1043[7] = __src[7];
                v1043[8] = __src[8];
                *((void *)v1043 + 18) = *(void *)&__src[9];
                goto LABEL_1302;
              }
LABEL_1040:
              GTMTLFXSMTemporalScaler_processTraceFuncWithMap((uint64_t)__src, v1239, (uint64_t *)v791);
              unsigned int v795 = atomic_load((unsigned int *)(v166 + 4));
              int v796 = v789 + (v795 >> 6);
              uint64_t v797 = (HIDWORD(v789) + 1);
              unint64_t v789 = (v797 << 32) | v789;
              if (v797 == v796 - 1)
              {
                unint64_t v789 = (v797 << 32) | v797;
                uint64_t v166 = *(void *)(v166 + 40);
                continue;
              }
              goto LABEL_1032;
            }
          }
          else if ((v792 + 20457) >= 2 && v792 != -18430)
          {
            goto LABEL_1040;
          }
          break;
        }
        if (v1235 <= v262)
        {
          v793 = apr_palloc(p, 0x98uLL);
          *((_OWORD *)v793 + 6) = __src[6];
          *((_OWORD *)v793 + 7) = __src[7];
          *((_OWORD *)v793 + 8) = __src[8];
          v793[18] = *(void *)&__src[9];
          *((_OWORD *)v793 + 2) = __src[2];
          *((_OWORD *)v793 + 3) = __src[3];
          *((_OWORD *)v793 + 4) = __src[4];
          *((_OWORD *)v793 + 5) = __src[5];
          *(_OWORD *)v793 = __src[0];
          *((_OWORD *)v793 + 1) = __src[1];
          uint64_t v794 = *find_entry((uint64_t)ht, (unsigned char *)v793 + 8, 8uLL, 0);
          if (v794) {
            uint64_t v794 = *(void *)(v794 + 32);
          }
          v793[4] = v794;
          apr_hash_set(ht, v793 + 1, 8, v793);
          v793[3] = v262;
        }
        goto LABEL_1040;
      case 34:
        if (!GTMTLSMBuilder_streamIntersectionRange(v1235, v1236, v37)) {
          goto LABEL_1211;
        }
        ++DWORD2(v1248);
        uint64_t v170 = *(void *)(v37 + 32);
        if (v170)
        {
          unsigned int v171 = 0;
          while (1)
          {
            unsigned int v172 = atomic_load((unsigned int *)(v170 + 4));
            uint64_t v173 = v171 + (v172 >> 6) - 1;
            if ((int)v173 > 0) {
              break;
            }
            uint64_t v170 = *(void *)(v170 + 40);
            unsigned int v171 = v173;
            if (!v170)
            {
              unsigned int v171 = v173;
              goto LABEL_1055;
            }
          }
        }
        else
        {
          unsigned int v171 = 0;
        }
        uint64_t v173 = 0;
LABEL_1055:
        int v799 = 0;
        uint64_t v1200 = 0;
        unint64_t v1216 = 0;
        uint64_t v800 = 0;
        v176 = 0;
        unint64_t v801 = v171 | (unint64_t)(v173 << 32);
        while (2)
        {
          uint64_t v802 = v170 + 64;
LABEL_1057:
          if (v170)
          {
            int v803 = HIDWORD(v801) - v801;
            if ((*(unsigned char *)(v802 + ((uint64_t)(HIDWORD(v801) - (int)v801) << 6) + 15) & 8) != 0)
            {
              uint64_t v804 = v802 + ((uint64_t)v803 << 6);
              unint64_t v416 = *(void *)v804;
              if (*(void *)v804 < v1236 + v1235)
              {
                int v805 = *(_DWORD *)(v804 + 8);
                if (v805 == -15245)
                {
                  uint64_t v806 = v1239;
                  v807 = GTTraceFunc_argumentBytesWithMap((void *)v804, *(unsigned __int8 *)(v802 + ((uint64_t)v803 << 6) + 13), v1239);
                  uint64_t v1200 = *((void *)v807 + 1);
                  unint64_t v1216 = *(void *)v804;
                  int v799 = *(_DWORD *)(v804 + 8);
                  v176 = GTTraceFunc_argumentBytesWithMap((void *)v804, v807[24], v806);
                  uint64_t v800 = *(void *)v807;
                  v14 = v1220;
                }
                else
                {
                  v14 = v1220;
                  if (v805 == -15231)
                  {
                    v989 = apr_palloc(p, 0x38uLL);
                    *(_DWORD *)v989 = 72;
                    *((_DWORD *)v989 + 1) = v799;
                    v989[1] = v1200;
                    v990 = v989 + 1;
                    v989[2] = v1216;
                    v989[3] = -1;
                    v989[4] = 0;
                    v989[5] = v800;
                    v989[6] = v176;
LABEL_1267:
                    uint64_t v991 = *find_entry((uint64_t)ht, v990, 8uLL, 0);
                    if (v991) {
                      uint64_t v991 = *(void *)(v991 + 32);
                    }
                    v989[4] = v991;
                    apr_hash_set(ht, v990, 8, v989);
                    v989[3] = v416;
                    goto LABEL_1211;
                  }
                }
                unsigned int v808 = atomic_load((unsigned int *)(v170 + 4));
                int v809 = v801 + (v808 >> 6);
                uint64_t v810 = (HIDWORD(v801) + 1);
                unint64_t v801 = (v810 << 32) | v801;
                if (v810 == v809 - 1)
                {
                  unint64_t v801 = (v810 << 32) | v810;
                  uint64_t v170 = *(void *)(v170 + 40);
                  continue;
                }
                goto LABEL_1057;
              }
            }
          }
          break;
        }
        v188 = (char *)apr_palloc(p, 0x38uLL);
        v189 = v188;
        *(_DWORD *)v188 = 72;
        *((_DWORD *)v188 + 1) = v799;
        *((void *)v188 + 1) = v1200;
        v190 = v188 + 8;
        unint64_t v425 = -1;
        *((void *)v188 + 2) = v1216;
        *((void *)v188 + 3) = -1;
        *((void *)v188 + 4) = 0;
        *((void *)v188 + 5) = v800;
LABEL_1067:
        *((void *)v188 + 6) = v176;
LABEL_1068:
        uint64_t v811 = *find_entry((uint64_t)ht, v190, 8uLL, 0);
        if (v811) {
          uint64_t v811 = *(void *)(v811 + 32);
        }
        v189[4] = v811;
        apr_hash_set(ht, v190, 8, v189);
        v189[3] = v425;
        goto LABEL_1211;
      default:
        goto LABEL_1211;
    }
  }
}

uint64_t GTMTLSMObject_compare(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)a1 + 16);
  unint64_t v3 = *(void *)(*(void *)a2 + 16);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 != v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

__n128 GTMTLSMRenderCommandEncoder_init(uint64_t a1, uint64_t a2)
{
  bzero((void *)(a1 + 8), 0x2B50uLL);
  *(void *)a1 = a2;
  memset_pattern16((void *)(a1 + 10100), &unk_4C80D0, 0x40uLL);
  memset_pattern16((void *)(a1 + 10228), &unk_4C80D0, 0x40uLL);
  memset_pattern16((void *)(a1 + 10612), &unk_4C80D0, 0x40uLL);
  *(void *)(a1 + 10676) = 0x3F8000003F800000;
  *(void *)(a1 + 11068) = 0x100000001;
  memset_pattern16((void *)(a1 + 9872), &unk_4C80E0, 0x40uLL);
  *(void *)(a1 + 760) = -1;
  result.n128_u64[0] = -1;
  result.n128_u64[1] = -1;
  *(__n128 *)(a1 + 728) = result;
  *(__n128 *)(a1 + 744) = result;
  *(__n128 *)(a1 + 696) = result;
  *(__n128 *)(a1 + 712) = result;
  *(__n128 *)(a1 + 664) = result;
  *(__n128 *)(a1 + 680) = result;
  *(__n128 *)(a1 + 632) = result;
  *(__n128 *)(a1 + 648) = result;
  *(__n128 *)(a1 + 600) = result;
  *(__n128 *)(a1 + 616) = result;
  *(__n128 *)(a1 + 568) = result;
  *(__n128 *)(a1 + 584) = result;
  *(__n128 *)(a1 + 536) = result;
  *(__n128 *)(a1 + 552) = result;
  *(__n128 *)(a1 + 520) = result;
  *(_WORD *)(a1 + 11086) = 1028;
  return result;
}

uint64_t GTMTLSMRenderCommandEncoder_loadIndirectCommand(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4 = *(void *)(a3 + a2[1]);
  if (!v4) {
    return 0;
  }
  v9 = (unsigned char *)*a2;
  if (*(unsigned char *)(*a2 + 11)
    || (uint64_t result = GTMTLIndirectResources_renderPipelineIdForUniqueIdentifier(a4[3], *(void *)(a3 + a2[2])),
        (*(void *)(a1 + 8544) = result) != 0))
  {
    if (!v9[10])
    {
      unsigned int v11 = v9[18];
      if (v11 >= 0x40) {
        char v12 = 64;
      }
      else {
        char v12 = v9[18];
      }
      *(void *)(a1 + 8) &= -1 << v12;
      if (v11)
      {
        unint64_t v13 = 0;
        uint64_t v14 = a3 + a2[3];
        do
        {
          unint64_t v15 = *(void *)(v14 + 8 * v13);
          uint64_t v16 = GTMTLGPUAddressResource_resourceForGPUAddress(*(void **)(*a4 + 24), *(int *)(*a4 + 12), v15);
          if (v16)
          {
            unint64_t v17 = v15 - *v16;
            uint64_t v18 = v16[2];
          }
          else
          {
            unint64_t v17 = 0;
            uint64_t v18 = 0;
          }
          uint64_t v19 = a1 + 8 * v13;
          *(void *)(v19 + 24) = v18;
          *(void *)(v19 + 272) = v17;
          ++v13;
        }
        while (v13 < v9[18]);
      }
      unsigned int v20 = v9[12];
      if (v20 >= 0x40) {
        char v21 = 64;
      }
      else {
        char v21 = v9[12];
      }
      *(void *)(a1 + 1920) &= -1 << v21;
      if (v20)
      {
        unint64_t v22 = 0;
        uint64_t v23 = a3 + a2[4];
        do
        {
          unint64_t v24 = *(void *)(v23 + 8 * v22);
          uint64_t v25 = GTMTLGPUAddressResource_resourceForGPUAddress(*(void **)(*a4 + 24), *(int *)(*a4 + 12), v24);
          if (v25)
          {
            unint64_t v26 = v24 - *v25;
            uint64_t v27 = v25[2];
          }
          else
          {
            unint64_t v26 = 0;
            uint64_t v27 = 0;
          }
          uint64_t v28 = a1 + 8 * v22;
          *(void *)(v28 + 1928) = v27;
          *(void *)(v28 + 2176) = v26;
          ++v22;
        }
        while (v22 < v9[12]);
      }
      unsigned int v29 = v9[16];
      if (v29 >= 0x40) {
        char v30 = 64;
      }
      else {
        char v30 = v9[16];
      }
      *(void *)(a1 + 3576) &= -1 << v30;
      if (v29)
      {
        unint64_t v31 = 0;
        uint64_t v32 = a3 + a2[5];
        do
        {
          unint64_t v33 = *(void *)(v32 + 8 * v31);
          uint64_t v34 = GTMTLGPUAddressResource_resourceForGPUAddress(*(void **)(*a4 + 24), *(int *)(*a4 + 12), v33);
          if (v34)
          {
            unint64_t v35 = v33 - *v34;
            uint64_t v36 = v34[2];
          }
          else
          {
            unint64_t v35 = 0;
            uint64_t v36 = 0;
          }
          uint64_t v37 = a1 + 8 * v31;
          *(void *)(v37 + 3584) = v36;
          *(void *)(v37 + 3832) = v35;
          ++v31;
        }
        while (v31 < v9[16]);
      }
      unsigned int v38 = v9[15];
      if (v38 >= 0x40) {
        char v39 = 64;
      }
      else {
        char v39 = v9[15];
      }
      *(void *)(a1 + 5232) &= -1 << v39;
      if (v38)
      {
        int v40 = (unint64_t *)(a3 + a2[6]);
        unsigned int v41 = (unint64_t *)(a1 + 5488);
        uint64_t v42 = 655;
        do
        {
          unint64_t v44 = *v40++;
          unint64_t v43 = v44;
          uint64_t v45 = GTMTLGPUAddressResource_resourceForGPUAddress(*(void **)(*a4 + 24), *(int *)(*a4 + 12), v44);
          if (v45)
          {
            unint64_t v46 = v43 - *v45;
            unint64_t v47 = v45[2];
          }
          else
          {
            unint64_t v46 = 0;
            unint64_t v47 = 0;
          }
          *(v41 - 31) = v47;
          *v41++ = v46;
          unint64_t v48 = v42 - 654;
          ++v42;
        }
        while (v48 < v9[15]);
      }
    }
    uint64_t v49 = v9[17];
    if (v9[17])
    {
      uint64_t v50 = (uint64_t *)(a3 + a2[8]);
      unsigned int v51 = (_DWORD *)(a1 + 10944);
      do
      {
        uint64_t v52 = *v50++;
        *v51++ = v52;
        --v49;
      }
      while (v49);
    }
    if (v9[19])
    {
      uint64_t v53 = v9[18];
      char v54 = v53 >= 0x40 ? 64 : v9[18];
      *(void *)(a1 + 16) |= ~(-1 << v54);
      if (v53)
      {
        unsigned int v55 = (uint64_t *)(a3 + a2[10]);
        unsigned int v56 = (void *)(a1 + 520);
        do
        {
          uint64_t v57 = *v55++;
          *v56++ = v57;
          --v53;
        }
        while (v53);
      }
    }
    if (v4 == 8 || v4 == 4)
    {
      uint64_t v58 = a3 + a2[12];
      unsigned int v59 = *(void **)(*a4 + 24);
      unint64_t v60 = *(int *)(*a4 + 12);
      unint64_t v61 = *(void *)v58;
      uint64_t v62 = GTMTLGPUAddressResource_resourceForGPUAddress(v59, v60, *(void *)v58);
      if (v62)
      {
        int v63 = v61 - *(_DWORD *)v62;
        uint64_t v64 = v62[2];
      }
      else
      {
        int v63 = 0;
        uint64_t v64 = 0;
      }
      *(void *)(a1 + 9864) = v64;
      *(_DWORD *)(a1 + 10688) = v63;
      *(_DWORD *)(a1 + 10692) = *(void *)(v58 + 8);
      *(_DWORD *)(a1 + 10676) = *(_DWORD *)(v58 + 16);
      return v4 != 8 || v64 != 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t GTMTLSMComputeCommandEncoder_loadIndirectCommand(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4 = *(void *)(a3 + a2[1]);
  if (!v4) {
    return 0;
  }
  v9 = (unsigned char *)*a2;
  if (*(unsigned char *)(*a2 + 11)
    || (uint64_t result = GTMTLIndirectResources_renderPipelineIdForUniqueIdentifier(a4[4], *(void *)(a3 + a2[2])),
        (*(void *)(a1 + 8) = result) != 0))
  {
    if (!v9[10])
    {
      unsigned int v11 = v9[13];
      char v12 = v11 >= 0x40 ? 64 : v9[13];
      *(void *)(a1 + 16) &= -1 << v12;
      if (v11)
      {
        unint64_t v13 = 0;
        uint64_t v14 = a3 + a2[7];
        do
        {
          unint64_t v15 = *(void *)(v14 + 8 * v13);
          uint64_t v16 = GTMTLGPUAddressResource_resourceForGPUAddress(*(void **)(*a4 + 24), *(int *)(*a4 + 12), v15);
          if (v16)
          {
            unint64_t v17 = v15 - *v16;
            uint64_t v18 = v16[2];
          }
          else
          {
            unint64_t v17 = 0;
            uint64_t v18 = 0;
          }
          uint64_t v19 = a1 + 8 * v13;
          *(void *)(v19 + 32) = v18;
          *(void *)(v19 + 280) = v17;
          ++v13;
        }
        while (v13 < v9[13]);
      }
    }
    if (v9[19])
    {
      uint64_t v20 = v9[13];
      char v21 = v20 >= 0x40 ? 64 : v9[13];
      *(void *)(a1 + 24) |= ~(-1 << v21);
      if (v20)
      {
        unint64_t v22 = (uint64_t *)(a3 + a2[10]);
        uint64_t v23 = (void *)(a1 + 528);
        do
        {
          uint64_t v24 = *v22++;
          *v23++ = v24;
          --v20;
        }
        while (v20);
      }
    }
    uint64_t v25 = v9[14];
    if (v9[14])
    {
      unint64_t v26 = (uint64_t *)(a3 + a2[9]);
      uint64_t v27 = (_DWORD *)(a1 + 1984);
      do
      {
        uint64_t v28 = *v26++;
        *v27++ = v28;
        --v25;
      }
      while (v25);
    }
    if (v4 == 32 || v4 == 64)
    {
      unsigned int v29 = (long long *)(a3 + a2[12]);
      long long v30 = *v29;
      *(void *)(a1 + 1944) = *((void *)v29 + 2);
      *(_OWORD *)(a1 + 1928) = v30;
      long long v31 = *(long long *)((char *)v29 + 24);
      *(void *)(a1 + 1968) = *((void *)v29 + 5);
      *(_OWORD *)(a1 + 1952) = v31;
    }
    return 1;
  }
  return result;
}

char *GTMTLSMBuffer_processTraceFuncWithMap(char *result, uint64_t a2, uint64_t *a3)
{
  BOOL v5 = result;
  int v6 = *((_DWORD *)a3 + 2);
  if (v6 <= -15779)
  {
    if (v6 <= -16313)
    {
      switch(v6)
      {
        case -16372:
          v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v7[8], a2);
          *((void *)v5 + 9) = result;
          break;
        case -16371:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((_DWORD *)v5 + 22) = *((_DWORD *)result + 2);
          break;
        case -16370:
          *((void *)result + 3) = *a3;
          break;
        case -16369:
        case -16368:
          return result;
        case -16367:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v28 = *((void *)result + 2);
          if (v28 != 1) {
            *((_WORD *)v5 + 49) = v28;
          }
          break;
        default:
          if (v6 == -16314 || v6 == -16313) {
            goto LABEL_35;
          }
          break;
      }
      return result;
    }
    if (v6 > -16123)
    {
      switch(v6)
      {
        case -16122:
          result[100] = 1;
          break;
        case -16117:
          unsigned int v29 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v30 = *a3;
          uint64_t v31 = *((void *)v29 + 2);
          *((void *)v5 + 1) = *((void *)v29 + 1);
          *((void *)v5 + 2) = v30;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          *((_WORD *)v5 + 48) = *((void *)v29 + 3);
          *((void *)v5 + 13) = v31;
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 19) = result;
          if (result)
          {
            uint64_t v32 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            int v33 = *((_DWORD *)result + 4);
            *((_DWORD *)v5 + 21) = v32;
            *((_DWORD *)v5 + 22) = v33;
            *((void *)v5 + 14) = *((void *)result + 3);
            *((_OWORD *)v5 + 8) = *((_OWORD *)result + 2);
          }
          *((void *)v5 + 6) = *(void *)v29;
          break;
        case -15914:
          v8 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v9 = *a3;
          uint64_t v10 = *(void *)v8;
          *((void *)v5 + 1) = *((void *)v8 + 1);
          *((void *)v5 + 2) = v9;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          *((void *)v5 + 5) = *((void *)v8 + 2);
          *((void *)v5 + 15) = v10;
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          uint64_t v11 = *((void *)result + 3);
          *((void *)v5 + 13) = *((void *)result + 2);
          *((_WORD *)v5 + 48) = v11;
          break;
      }
      return result;
    }
    if (v6 != -16312)
    {
      if (v6 != -16163) {
        return result;
      }
      uint64_t v18 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v19 = *a3;
      *((void *)v5 + 1) = *((void *)v18 + 1);
      *((void *)v5 + 2) = v19;
      *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
      uint64_t v20 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
      *((void *)v5 + 19) = v20;
      if (v20)
      {
        uint64_t v21 = *((void *)v20 + 1);
        *((void *)v5 + 7) = *(void *)v20;
        int v22 = *((_DWORD *)v20 + 4);
        *((_DWORD *)v5 + 21) = v21;
        *((_DWORD *)v5 + 22) = v22;
        *((void *)v5 + 14) = *((void *)v20 + 3);
        *((_OWORD *)v5 + 8) = *((_OWORD *)v20 + 2);
      }
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v18[16], a2);
      *((void *)v5 + 18) = result;
      if (result) {
        uint64_t v23 = *((void *)result + 1);
      }
      else {
        uint64_t v23 = 0;
      }
      *((void *)v5 + 13) = v23;
      goto LABEL_58;
    }
LABEL_35:
    uint64_t v18 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
    uint64_t v24 = *a3;
    uint64_t v25 = *((void *)v18 + 2);
    *((void *)v5 + 1) = *((void *)v18 + 1);
    *((void *)v5 + 2) = v24;
    *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
    *((_WORD *)v5 + 48) = *((void *)v18 + 3);
    *((void *)v5 + 13) = v25;
    uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
    *((void *)v5 + 19) = result;
    if (result)
    {
      uint64_t v26 = *((void *)result + 1);
      *((void *)v5 + 7) = *(void *)result;
      int v27 = *((_DWORD *)result + 4);
      *((_DWORD *)v5 + 21) = v26;
      *((_DWORD *)v5 + 22) = v27;
      *((void *)v5 + 14) = *((void *)result + 3);
      *((_OWORD *)v5 + 8) = *((_OWORD *)result + 2);
    }
LABEL_58:
    *((void *)v5 + 5) = *(void *)v18;
    return result;
  }
  if (v6 > -10224)
  {
    if (v6 <= -10204)
    {
      if (v6 == -10223)
      {
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((_DWORD *)v5 + 21) = *((void *)result + 1);
      }
      else if (v6 == -10210)
      {
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((void *)v5 + 8) = *((void *)result + 1);
      }
      return result;
    }
    if (v6 == -10203)
    {
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((void *)v5 + 7) = *((void *)result + 1);
      return result;
    }
    if (v6 != -10187)
    {
      if (v6 != -10186) {
        return result;
      }
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      long long v12 = *(_OWORD *)(result + 8);
      goto LABEL_28;
    }
    uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
    uint64_t v34 = *((void *)result + 1);
LABEL_54:
    *((_DWORD *)v5 + 20) = v34;
    return result;
  }
  if (v6 <= -10238)
  {
    if (v6 != -15778)
    {
      if (v6 != -15509) {
        return result;
      }
      unint64_t v13 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v14 = *a3;
      *((void *)v5 + 1) = *((void *)v13 + 1);
      *((void *)v5 + 2) = v14;
      *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
      unint64_t v15 = GTTraceFunc_argumentBytesWithMap(a3, v13[16], a2);
      *((_WORD *)v5 + 48) = *((_WORD *)v15 + 16);
      *((void *)v5 + 13) = *(void *)v15;
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
      *((void *)v5 + 19) = result;
      if (!result) {
        return result;
      }
      uint64_t v16 = *((void *)result + 1);
      *((void *)v5 + 7) = *(void *)result;
      int v17 = *((_DWORD *)result + 4);
      *((_DWORD *)v5 + 21) = v16;
      *((_DWORD *)v5 + 22) = v17;
      *((void *)v5 + 14) = *((void *)result + 3);
      long long v12 = *((_OWORD *)result + 2);
LABEL_28:
      *((_OWORD *)v5 + 8) = v12;
      return result;
    }
    unint64_t v35 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
    uint64_t v36 = *a3;
    uint64_t v37 = *((void *)v35 + 2);
    *((void *)v5 + 1) = *((void *)v35 + 1);
    *((void *)v5 + 2) = v36;
    *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
    *((_WORD *)v5 + 48) = *((void *)v35 + 3);
    *((void *)v5 + 13) = v37;
    uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
    *((void *)v5 + 19) = result;
    if (result)
    {
      uint64_t v38 = *((void *)result + 1);
      *((void *)v5 + 7) = *(void *)result;
      int v39 = *((_DWORD *)result + 4);
      *((_DWORD *)v5 + 21) = v38;
      *((_DWORD *)v5 + 22) = v39;
      *((void *)v5 + 14) = *((void *)result + 3);
      *((_OWORD *)v5 + 8) = *((_OWORD *)result + 2);
    }
    *((void *)v5 + 6) = *(void *)v35;
    uint64_t v34 = *((void *)v35 + 4);
    goto LABEL_54;
  }
  switch(v6)
  {
    case -10237:
      goto LABEL_35;
    case -10235:
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((_DWORD *)v5 + 23) = *((_DWORD *)result + 2);
      break;
    case -10228:
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((void *)v5 + 14) = *((void *)result + 1);
      break;
  }
  return result;
}

char *GTMTLSMTexture_processTraceFuncWithMap(char *result, uint64_t a2, uint64_t *a3)
{
  BOOL v5 = result;
  int v6 = *((_DWORD *)a3 + 2);
  if (v6 > -15914)
  {
    if (v6 <= -10228)
    {
      if (v6 > -15690)
      {
        if (v6 > -10235)
        {
          if (v6 == -10234)
          {
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            *((_DWORD *)v5 + 23) = *((_DWORD *)result + 2);
          }
          else if (v6 == -10231)
          {
            uint64_t v69 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v69[8], a2);
            *((void *)v5 + 14) = result;
          }
          return result;
        }
        if (v6 == -15689)
        {
          uint64_t v36 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v103 = *a3;
          *((void *)v5 + 1) = *((void *)v36 + 1);
          *((void *)v5 + 2) = v103;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 16) = result;
          if (result)
          {
            uint64_t v104 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            int v105 = *((_DWORD *)result + 4);
            *((_DWORD *)v5 + 21) = v104;
            *((_DWORD *)v5 + 22) = v105;
            uint64_t v107 = *((void *)result + 6);
            uint64_t v106 = *((void *)result + 7);
            *((void *)v5 + 21) = *((void *)result + 5);
            *((void *)v5 + 22) = v106;
            *((_WORD *)v5 + 106) = *((_WORD *)result + 40);
            *((void *)v5 + 14) = result + 24;
            *((void *)v5 + 25) = v107;
          }
          *((_WORD *)v5 + 76) = *((void *)v36 + 2);
          v5[158] = *((void *)v36 + 3);
          v5[159] = *((void *)v36 + 4);
          v5[160] = *((void *)v36 + 5);
          *((_WORD *)v5 + 77) = *((void *)v36 + 6);
          *((_WORD *)v5 + 78) = *((void *)v36 + 7);
        }
        else
        {
          if (v6 != -15688) {
            return result;
          }
          uint64_t v36 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v37 = *a3;
          *((void *)v5 + 1) = *((void *)v36 + 1);
          *((void *)v5 + 2) = v37;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 16) = result;
          if (result)
          {
            uint64_t v38 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            int v39 = *((_DWORD *)result + 4);
            *((_DWORD *)v5 + 21) = v38;
            *((_DWORD *)v5 + 22) = v39;
            uint64_t v41 = *((void *)result + 6);
            uint64_t v40 = *((void *)result + 7);
            *((void *)v5 + 21) = *((void *)result + 5);
            *((void *)v5 + 22) = v40;
            *((_WORD *)v5 + 106) = *((_WORD *)result + 40);
            *((void *)v5 + 14) = result + 24;
            *((void *)v5 + 25) = v41;
          }
          *((_WORD *)v5 + 76) = *((void *)v36 + 2);
          v5[158] = *((void *)v36 + 3);
          v5[159] = *((void *)v36 + 4);
          v5[160] = *((void *)v36 + 5);
          *((_WORD *)v5 + 77) = *((void *)v36 + 6);
          *((_WORD *)v5 + 78) = *((void *)v36 + 7);
          *((_DWORD *)v5 + 52) = *((_DWORD *)v36 + 18);
        }
        *((void *)v5 + 18) = *(void *)v36;
        uint64_t v56 = *((void *)v36 + 8);
      }
      else
      {
        if (v6 <= -15776)
        {
          if (v6 == -15913)
          {
            uint64_t v90 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            uint64_t v91 = *a3;
            *((void *)v5 + 1) = *((void *)v90 + 1);
            *((void *)v5 + 2) = v91;
            *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
            unsigned int v92 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
            *((void *)v5 + 16) = v92;
            if (v92)
            {
              uint64_t v93 = *((void *)v92 + 1);
              *((void *)v5 + 7) = *(void *)v92;
              int v94 = *((_DWORD *)v92 + 4);
              *((_DWORD *)v5 + 21) = v93;
              *((_DWORD *)v5 + 22) = v94;
              uint64_t v96 = *((void *)v92 + 6);
              uint64_t v95 = *((void *)v92 + 7);
              *((void *)v5 + 21) = *((void *)v92 + 5);
              *((void *)v5 + 22) = v95;
              *((_WORD *)v5 + 106) = *((_WORD *)v92 + 40);
              *((void *)v5 + 14) = v92 + 24;
              *((void *)v5 + 25) = v96;
            }
            *((void *)v5 + 5) = *((void *)v90 + 2);
            *((void *)v5 + 23) = *(void *)v90;
            uint64_t v97 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v97[24], a2);
            *((void *)v5 + 13) = result;
            return result;
          }
          if (v6 != -15777) {
            return result;
          }
          uint64_t v21 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v22 = *a3;
          *((void *)v5 + 1) = *((void *)v21 + 1);
          *((void *)v5 + 2) = v22;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t v23 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 16) = v23;
          if (v23)
          {
            uint64_t v24 = *((void *)v23 + 1);
            *((void *)v5 + 7) = *(void *)v23;
            int v25 = *((_DWORD *)v23 + 4);
            *((_DWORD *)v5 + 21) = v24;
            *((_DWORD *)v5 + 22) = v25;
            uint64_t v27 = *((void *)v23 + 6);
            uint64_t v26 = *((void *)v23 + 7);
            *((void *)v5 + 21) = *((void *)v23 + 5);
            *((void *)v5 + 22) = v26;
            *((_WORD *)v5 + 106) = *((_WORD *)v23 + 40);
            *((void *)v5 + 14) = v23 + 24;
            *((void *)v5 + 25) = v27;
          }
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v21[24], a2);
          *((void *)v5 + 13) = result;
          *((void *)v5 + 6) = *(void *)v21;
          uint64_t v28 = *((void *)v21 + 2);
LABEL_91:
          *((_DWORD *)v5 + 20) = v28;
          return result;
        }
        if (v6 == -15775)
        {
          uint64_t v70 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v121 = *a3;
          *((void *)v5 + 1) = *((void *)v70 + 1);
          *((void *)v5 + 2) = v121;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 16) = result;
          if (result)
          {
            uint64_t v122 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            int v123 = *((_DWORD *)result + 4);
            *((_DWORD *)v5 + 21) = v122;
            *((_DWORD *)v5 + 22) = v123;
            uint64_t v125 = *((void *)result + 6);
            uint64_t v124 = *((void *)result + 7);
            *((void *)v5 + 21) = *((void *)result + 5);
            *((void *)v5 + 22) = v124;
            *((_WORD *)v5 + 106) = *((_WORD *)result + 40);
            *((void *)v5 + 14) = result + 24;
            *((void *)v5 + 25) = v125;
          }
          *((_WORD *)v5 + 76) = *((void *)v70 + 2);
          v5[158] = *((void *)v70 + 3);
          v5[159] = *((void *)v70 + 4);
          v5[160] = *((void *)v70 + 5);
          *((_WORD *)v5 + 77) = *((void *)v70 + 6);
          *((_WORD *)v5 + 78) = *((void *)v70 + 7);
          *((_DWORD *)v5 + 52) = *((_DWORD *)v70 + 16);
          goto LABEL_117;
        }
        if (v6 != -15690) {
          return result;
        }
        uint64_t v57 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v58 = *a3;
        *((void *)v5 + 1) = *((void *)v57 + 1);
        *((void *)v5 + 2) = v58;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 16) = result;
        if (result)
        {
          uint64_t v59 = *((void *)result + 1);
          *((void *)v5 + 7) = *(void *)result;
          int v60 = *((_DWORD *)result + 4);
          *((_DWORD *)v5 + 21) = v59;
          *((_DWORD *)v5 + 22) = v60;
          uint64_t v61 = *((void *)result + 6);
          *((void *)v5 + 21) = *((void *)result + 5);
          *((_WORD *)v5 + 106) = *((_WORD *)result + 40);
          *((void *)v5 + 14) = result + 24;
          *((void *)v5 + 25) = v61;
        }
        *((_WORD *)v5 + 76) = *((void *)v57 + 2);
        *((void *)v5 + 18) = *(void *)v57;
        uint64_t v56 = *((void *)v57 + 3);
      }
    }
    else
    {
      if (v6 <= -10205)
      {
        if (v6 > -10213)
        {
          if (v6 == -10212)
          {
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            *((void *)v5 + 8) = *((void *)result + 1);
          }
          else if (v6 == -10205)
          {
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            *((_WORD *)v5 + 106) = *((_DWORD *)result + 2);
          }
        }
        else if (v6 == -10227)
        {
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((void *)v5 + 21) = *((void *)result + 1);
        }
        else if (v6 == -10222)
        {
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((_DWORD *)v5 + 21) = *((_DWORD *)result + 2);
        }
        return result;
      }
      if (v6 > -10186)
      {
        if (v6 != -10185)
        {
          if (v6 == -10164)
          {
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            *((void *)v5 + 25) = *((void *)result + 1);
          }
          else if (v6 == -7167)
          {
            uint64_t v14 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            uint64_t v15 = *a3;
            *((void *)v5 + 1) = *((void *)v14 + 1);
            *((void *)v5 + 2) = v15;
            *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
            *((void *)v5 + 16) = result;
            if (result)
            {
              uint64_t v16 = *((void *)result + 1);
              *((void *)v5 + 7) = *(void *)result;
              int v17 = *((_DWORD *)result + 4);
              *((_DWORD *)v5 + 21) = v16;
              *((_DWORD *)v5 + 22) = v17;
              uint64_t v19 = *((void *)result + 6);
              uint64_t v18 = *((void *)result + 7);
              *((void *)v5 + 21) = *((void *)result + 5);
              *((void *)v5 + 22) = v18;
              *((_WORD *)v5 + 106) = *((_WORD *)result + 40);
              *((void *)v5 + 14) = result + 24;
              *((void *)v5 + 25) = v19;
            }
            *((void *)v5 + 24) = *(void *)v14;
          }
          return result;
        }
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v28 = *((void *)result + 1);
        goto LABEL_91;
      }
      if (v6 == -10204)
      {
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((void *)v5 + 7) = *((void *)result + 1);
        return result;
      }
      if (v6 != -10198) {
        return result;
      }
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v56 = *((void *)result + 1);
    }
    *((void *)v5 + 22) = v56;
    return result;
  }
  if (v6 <= -16197)
  {
    if (v6 > -16241)
    {
      switch(v6)
      {
        case -16240:
          uint64_t v20 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v20[8], a2);
          *((void *)v5 + 9) = result;
          break;
        case -16239:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((_DWORD *)v5 + 22) = *((_DWORD *)result + 2);
          break;
        case -16238:
          *((void *)result + 3) = *a3;
          break;
        case -16233:
          uint64_t v70 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v71 = *a3;
          *((void *)v5 + 1) = *((void *)v70 + 1);
          *((void *)v5 + 2) = v71;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 16) = result;
          if (result)
          {
            uint64_t v72 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            int v73 = *((_DWORD *)result + 4);
            *((_DWORD *)v5 + 21) = v72;
            *((_DWORD *)v5 + 22) = v73;
            uint64_t v75 = *((void *)result + 6);
            uint64_t v74 = *((void *)result + 7);
            *((void *)v5 + 21) = *((void *)result + 5);
            *((void *)v5 + 22) = v74;
            *((_WORD *)v5 + 106) = *((_WORD *)result + 40);
            *((void *)v5 + 14) = result + 24;
            *((void *)v5 + 25) = v75;
          }
          *((_WORD *)v5 + 76) = *((void *)v70 + 2);
          goto LABEL_117;
        case -16232:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v76 = *((void *)result + 2);
          if (v76 != 1) {
            *((_WORD *)v5 + 49) = v76;
          }
          break;
        default:
          return result;
      }
      return result;
    }
    if (v6 != -16368)
    {
      if (v6 != -16310)
      {
        if (v6 != -16294) {
          return result;
        }
        uint64_t v42 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v43 = *a3;
        *((void *)v5 + 1) = *((void *)v42 + 1);
        *((void *)v5 + 2) = v43;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        unint64_t v44 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 16) = v44;
        if (v44)
        {
          uint64_t v45 = *((void *)v44 + 1);
          *((void *)v5 + 7) = *(void *)v44;
          int v46 = *((_DWORD *)v44 + 4);
          *((_DWORD *)v5 + 21) = v45;
          *((_DWORD *)v5 + 22) = v46;
          uint64_t v48 = *((void *)v44 + 6);
          uint64_t v47 = *((void *)v44 + 7);
          *((void *)v5 + 21) = *((void *)v44 + 5);
          *((void *)v5 + 22) = v47;
          *((_WORD *)v5 + 106) = *((_WORD *)v44 + 40);
          *((void *)v5 + 14) = v44 + 24;
          *((void *)v5 + 25) = v48;
        }
        *((void *)v5 + 13) = GTTraceFunc_argumentBytesWithMap(a3, v42[24], a2);
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v42[25], a2);
        *((void *)v5 + 15) = result;
        *((void *)v5 + 19) = *((void *)v42 + 2);
        goto LABEL_109;
      }
      uint64_t v42 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v108 = *a3;
      *((void *)v5 + 1) = *((void *)v42 + 1);
      *((void *)v5 + 2) = v108;
      *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
      uint64_t v109 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
      *((void *)v5 + 16) = v109;
      if (v109)
      {
        uint64_t v110 = *((void *)v109 + 1);
        *((void *)v5 + 7) = *(void *)v109;
        int v111 = *((_DWORD *)v109 + 4);
        *((_DWORD *)v5 + 21) = v110;
        *((_DWORD *)v5 + 22) = v111;
        uint64_t v113 = *((void *)v109 + 6);
        uint64_t v112 = *((void *)v109 + 7);
        *((void *)v5 + 21) = *((void *)v109 + 5);
        *((void *)v5 + 22) = v112;
        *((_WORD *)v5 + 106) = *((_WORD *)v109 + 40);
        *((void *)v5 + 14) = v109 + 24;
        *((void *)v5 + 25) = v113;
      }
      unsigned int v55 = v42[24];
      goto LABEL_108;
    }
    goto LABEL_67;
  }
  if (v6 <= -16099)
  {
    if (v6 <= -16115)
    {
      if (v6 != -16196)
      {
        if (v6 == -16116)
        {
          unsigned int v29 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v30 = *a3;
          *((void *)v5 + 1) = *((void *)v29 + 1);
          *((void *)v5 + 2) = v30;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t v31 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 16) = v31;
          if (v31)
          {
            uint64_t v32 = *((void *)v31 + 1);
            *((void *)v5 + 7) = *(void *)v31;
            int v33 = *((_DWORD *)v31 + 4);
            *((_DWORD *)v5 + 21) = v32;
            *((_DWORD *)v5 + 22) = v33;
            uint64_t v35 = *((void *)v31 + 6);
            uint64_t v34 = *((void *)v31 + 7);
            *((void *)v5 + 21) = *((void *)v31 + 5);
            *((void *)v5 + 22) = v34;
            *((_WORD *)v5 + 106) = *((_WORD *)v31 + 40);
            *((void *)v5 + 14) = v31 + 24;
            *((void *)v5 + 25) = v35;
          }
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v29[16], a2);
          *((void *)v5 + 13) = result;
          *((void *)v5 + 6) = *(void *)v29;
        }
        return result;
      }
      uint64_t v70 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v98 = *a3;
      *((void *)v5 + 1) = *((void *)v70 + 1);
      *((void *)v5 + 2) = v98;
      *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
      *((void *)v5 + 16) = result;
      if (result)
      {
        uint64_t v99 = *((void *)result + 1);
        *((void *)v5 + 7) = *(void *)result;
        int v100 = *((_DWORD *)result + 4);
        *((_DWORD *)v5 + 21) = v99;
        *((_DWORD *)v5 + 22) = v100;
        uint64_t v102 = *((void *)result + 6);
        uint64_t v101 = *((void *)result + 7);
        *((void *)v5 + 21) = *((void *)result + 5);
        *((void *)v5 + 22) = v101;
        *((_WORD *)v5 + 106) = *((_WORD *)result + 40);
        *((void *)v5 + 14) = result + 24;
        *((void *)v5 + 25) = v102;
      }
      *((_WORD *)v5 + 76) = *((void *)v70 + 2);
      v5[158] = *((void *)v70 + 3);
      v5[159] = *((void *)v70 + 4);
      v5[160] = *((void *)v70 + 5);
      *((_WORD *)v5 + 77) = *((void *)v70 + 6);
      *((_WORD *)v5 + 78) = *((void *)v70 + 7);
LABEL_117:
      *((void *)v5 + 18) = *(void *)v70;
      return result;
    }
    if (v6 == -16114)
    {
      result[100] = 1;
      return result;
    }
    if (v6 != -16104) {
      return result;
    }
LABEL_67:
    uint64_t v62 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
    uint64_t v63 = *a3;
    *((void *)v5 + 1) = *((void *)v62 + 1);
    *((void *)v5 + 2) = v63;
    *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
    uint64_t v64 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
    *((void *)v5 + 16) = v64;
    if (v64)
    {
      uint64_t v65 = *((void *)v64 + 1);
      *((void *)v5 + 7) = *(void *)v64;
      int v66 = *((_DWORD *)v64 + 4);
      *((_DWORD *)v5 + 21) = v65;
      *((_DWORD *)v5 + 22) = v66;
      uint64_t v68 = *((void *)v64 + 6);
      uint64_t v67 = *((void *)v64 + 7);
      *((void *)v5 + 21) = *((void *)v64 + 5);
      *((void *)v5 + 22) = v67;
      *((_WORD *)v5 + 106) = *((_WORD *)v64 + 40);
      *((void *)v5 + 14) = v64 + 24;
      *((void *)v5 + 25) = v68;
    }
    uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v62[32], a2);
    *((void *)v5 + 13) = result;
    *((void *)v5 + 17) = *(void *)v62;
    *((_DWORD *)v5 + 38) = *((void *)v62 + 2);
    *((_DWORD *)v5 + 39) = *((void *)v62 + 3);
    return result;
  }
  if (v6 > -16032)
  {
    if (v6 == -16031)
    {
      uint64_t v42 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v77 = *a3;
      *((void *)v5 + 1) = *((void *)v42 + 1);
      *((void *)v5 + 2) = v77;
      *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
      uint64_t v78 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
      *((void *)v5 + 16) = v78;
      if (v78)
      {
        uint64_t v79 = *((void *)v78 + 1);
        *((void *)v5 + 7) = *(void *)v78;
        int v80 = *((_DWORD *)v78 + 4);
        *((_DWORD *)v5 + 21) = v79;
        *((_DWORD *)v5 + 22) = v80;
        uint64_t v82 = *((void *)v78 + 6);
        uint64_t v81 = *((void *)v78 + 7);
        *((void *)v5 + 21) = *((void *)v78 + 5);
        *((void *)v5 + 22) = v81;
        *((_WORD *)v5 + 106) = *((_WORD *)v78 + 40);
        *((void *)v5 + 14) = v78 + 24;
        *((void *)v5 + 25) = v82;
      }
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v42[41], a2);
      *((void *)v5 + 13) = result;
      *((_DWORD *)v5 + 38) = *((void *)v42 + 3);
      uint64_t v83 = *((void *)v42 + 4);
    }
    else
    {
      if (v6 != -16030)
      {
        if (v6 == -15980)
        {
          v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v8 = *a3;
          *((void *)v5 + 1) = *((void *)v7 + 1);
          *((void *)v5 + 2) = v8;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t v9 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 16) = v9;
          if (v9)
          {
            uint64_t v10 = *((void *)v9 + 1);
            *((void *)v5 + 7) = *(void *)v9;
            int v11 = *((_DWORD *)v9 + 4);
            *((_DWORD *)v5 + 21) = v10;
            *((_DWORD *)v5 + 22) = v11;
            uint64_t v13 = *((void *)v9 + 6);
            uint64_t v12 = *((void *)v9 + 7);
            *((void *)v5 + 21) = *((void *)v9 + 5);
            *((void *)v5 + 22) = v12;
            *((_WORD *)v5 + 106) = *((_WORD *)v9 + 40);
            *((void *)v5 + 14) = v9 + 24;
            *((void *)v5 + 25) = v13;
          }
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v7[24], a2);
          *((void *)v5 + 13) = result;
          *((void *)v5 + 5) = *(void *)v7;
          v5[214] = 1;
        }
        return result;
      }
      uint64_t v42 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v84 = *a3;
      *((void *)v5 + 1) = *((void *)v42 + 1);
      *((void *)v5 + 2) = v84;
      *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
      uint64_t v85 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
      *((void *)v5 + 16) = v85;
      if (v85)
      {
        uint64_t v86 = *((void *)v85 + 1);
        *((void *)v5 + 7) = *(void *)v85;
        int v87 = *((_DWORD *)v85 + 4);
        *((_DWORD *)v5 + 21) = v86;
        *((_DWORD *)v5 + 22) = v87;
        uint64_t v89 = *((void *)v85 + 6);
        uint64_t v88 = *((void *)v85 + 7);
        *((void *)v5 + 21) = *((void *)v85 + 5);
        *((void *)v5 + 22) = v88;
        *((_WORD *)v5 + 106) = *((_WORD *)v85 + 40);
        *((void *)v5 + 14) = v85 + 24;
        *((void *)v5 + 25) = v89;
      }
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v42[49], a2);
      *((void *)v5 + 13) = result;
      *((_DWORD *)v5 + 38) = *((void *)v42 + 4);
      uint64_t v83 = *((void *)v42 + 5);
    }
    *((_DWORD *)v5 + 39) = v83;
LABEL_109:
    *((void *)v5 + 5) = *(void *)v42;
    return result;
  }
  if (v6 != -16098)
  {
    if (v6 != -16096) {
      return result;
    }
    uint64_t v42 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
    uint64_t v49 = *a3;
    *((void *)v5 + 1) = *((void *)v42 + 1);
    *((void *)v5 + 2) = v49;
    *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
    uint64_t v50 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
    *((void *)v5 + 16) = v50;
    if (v50)
    {
      uint64_t v51 = *((void *)v50 + 1);
      *((void *)v5 + 7) = *(void *)v50;
      int v52 = *((_DWORD *)v50 + 4);
      *((_DWORD *)v5 + 21) = v51;
      *((_DWORD *)v5 + 22) = v52;
      uint64_t v54 = *((void *)v50 + 6);
      uint64_t v53 = *((void *)v50 + 7);
      *((void *)v5 + 21) = *((void *)v50 + 5);
      *((void *)v5 + 22) = v53;
      *((_WORD *)v5 + 106) = *((_WORD *)v50 + 40);
      *((void *)v5 + 14) = v50 + 24;
      *((void *)v5 + 25) = v54;
    }
    unsigned int v55 = v42[33];
LABEL_108:
    uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v55, a2);
    *((void *)v5 + 13) = result;
    goto LABEL_109;
  }
  uint64_t v114 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
  uint64_t v115 = *a3;
  *((void *)v5 + 1) = *((void *)v114 + 1);
  *((void *)v5 + 2) = v115;
  *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
  unsigned int v116 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
  *((void *)v5 + 16) = v116;
  if (v116)
  {
    uint64_t v117 = *((void *)v116 + 1);
    *((void *)v5 + 7) = *(void *)v116;
    int v118 = *((_DWORD *)v116 + 4);
    *((_DWORD *)v5 + 21) = v117;
    *((_DWORD *)v5 + 22) = v118;
    uint64_t v120 = *((void *)v116 + 6);
    uint64_t v119 = *((void *)v116 + 7);
    *((void *)v5 + 21) = *((void *)v116 + 5);
    *((void *)v5 + 22) = v119;
    *((_WORD *)v5 + 106) = *((_WORD *)v116 + 40);
    *((void *)v5 + 14) = v116 + 24;
    *((void *)v5 + 25) = v120;
  }
  uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v114[40], a2);
  *((void *)v5 + 13) = result;
  *((void *)v5 + 17) = *(void *)v114;
  *((_DWORD *)v5 + 38) = *((void *)v114 + 2);
  *((_DWORD *)v5 + 39) = *((void *)v114 + 3);
  *((_DWORD *)v5 + 40) = *((void *)v114 + 4);
  return result;
}

char *GTMTLSMRenderPipelineState_processTraceFuncWithMap(char *result, uint64_t a2, uint64_t *a3)
{
  BOOL v5 = result;
  int v6 = *((_DWORD *)a3 + 2);
  if (v6 > -15462)
  {
    if (v6 > -10221)
    {
      if (v6 <= -10185)
      {
        if (v6 == -10220)
        {
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((void *)v5 + 12) = *((void *)result + 1);
        }
        else if (v6 == -10192)
        {
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((_DWORD *)v5 + 102) = *((_DWORD *)result + 2);
        }
      }
      else
      {
        switch(v6)
        {
          case -10184:
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            *((_DWORD *)v5 + 103) = *((void *)result + 1);
            break;
          case -10172:
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            *((void *)v5 + 50) = *((void *)result + 1);
            break;
          case -10165:
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            *((void *)v5 + 14) = *((void *)result + 1);
            break;
        }
      }
    }
    else
    {
      switch(v6)
      {
        case -15406:
        case -15405:
          uint64_t v13 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v14 = *a3;
          uint64_t v15 = *(void *)v13;
          *((void *)v5 + 1) = *((void *)v13 + 1);
          *((void *)v5 + 2) = v14;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          *((void *)v5 + 5) = v15;
          uint64_t v16 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 7) = v16;
          if (v16)
          {
            int v17 = v16;
            memcpy(v5 + 120, v16 + 216, 0x118uLL);
            *((_OWORD *)v5 + 6) = *(_OWORD *)v17;
            *((_DWORD *)v5 + 102) = *((_DWORD *)v17 + 48);
            *((_DWORD *)v5 + 103) = *((unsigned __int16 *)v17 + 98);
            *((void *)v5 + 14) = *((void *)v17 + 2);
          }
          unsigned int v18 = v13[24];
          goto LABEL_31;
        case -15404:
        case -15403:
          uint64_t v30 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v31 = *a3;
          uint64_t v32 = *(void *)v30;
          *((void *)v5 + 1) = *((void *)v30 + 1);
          *((void *)v5 + 2) = v31;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          *((void *)v5 + 5) = v32;
          int v33 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 7) = v33;
          if (v33)
          {
            uint64_t v34 = v33;
            memcpy(v5 + 120, v33 + 216, 0x118uLL);
            *((_OWORD *)v5 + 6) = *(_OWORD *)v34;
            *((_DWORD *)v5 + 102) = *((_DWORD *)v34 + 48);
            *((_DWORD *)v5 + 103) = *((unsigned __int16 *)v34 + 98);
            *((void *)v5 + 14) = *((void *)v34 + 2);
          }
          unsigned int v18 = v30[32];
LABEL_31:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v18, a2);
          *((void *)v5 + 9) = result;
          break;
        default:
          if (v6 == -15461)
          {
            uint64_t v40 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            uint64_t v41 = *a3;
            uint64_t v42 = *(void *)v40;
            *((void *)v5 + 1) = *((void *)v40 + 1);
            *((void *)v5 + 2) = v41;
            *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
            *((void *)v5 + 5) = v42;
            uint64_t v43 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
            *((void *)v5 + 7) = v43;
            if (v43)
            {
              unint64_t v44 = v43;
              memcpy(v5 + 120, v43 + 216, 0x118uLL);
              *((_OWORD *)v5 + 6) = *(_OWORD *)v44;
              *((_DWORD *)v5 + 102) = *((_DWORD *)v44 + 48);
              *((_DWORD *)v5 + 103) = *((unsigned __int16 *)v44 + 98);
              *((void *)v5 + 14) = *((void *)v44 + 2);
            }
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v40[24], a2);
            *((void *)v5 + 10) = result;
          }
          break;
      }
    }
  }
  else if (v6 > -16092)
  {
    switch(v6)
    {
      case -16091:
      case -16089:
        uint64_t v19 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v20 = *a3;
        uint64_t v21 = *(void *)v19;
        *((void *)v5 + 1) = *((void *)v19 + 1);
        *((void *)v5 + 2) = v20;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        *((void *)v5 + 5) = v21;
        uint64_t v22 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 7) = v22;
        if (v22)
        {
          uint64_t v23 = v22;
          memcpy(v5 + 120, v22 + 216, 0x118uLL);
          *((_OWORD *)v5 + 6) = *(_OWORD *)v23;
          *((_DWORD *)v5 + 102) = *((_DWORD *)v23 + 48);
          *((_DWORD *)v5 + 103) = *((unsigned __int16 *)v23 + 98);
          *((void *)v5 + 14) = *((void *)v23 + 2);
        }
        unsigned int v24 = v19[24];
        goto LABEL_35;
      case -16090:
      case -16088:
        uint64_t v35 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v36 = *a3;
        uint64_t v37 = *(void *)v35;
        *((void *)v5 + 1) = *((void *)v35 + 1);
        *((void *)v5 + 2) = v36;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        *((void *)v5 + 5) = v37;
        uint64_t v38 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 7) = v38;
        if (v38)
        {
          int v39 = v38;
          memcpy(v5 + 120, v38 + 216, 0x118uLL);
          *((_OWORD *)v5 + 6) = *(_OWORD *)v39;
          *((_DWORD *)v5 + 102) = *((_DWORD *)v39 + 48);
          *((_DWORD *)v5 + 103) = *((unsigned __int16 *)v39 + 98);
          *((void *)v5 + 14) = *((void *)v39 + 2);
        }
        unsigned int v24 = v35[32];
LABEL_35:
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v24, a2);
        *((void *)v5 + 8) = result;
        break;
      default:
        if (v6 == -15738)
        {
          uint64_t v45 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v46 = *a3;
          uint64_t v47 = *(void *)v45;
          *((void *)v5 + 1) = *((void *)v45 + 1);
          *((void *)v5 + 2) = v46;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          *((void *)v5 + 5) = v47;
          uint64_t v48 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 7) = v48;
          if (v48)
          {
            uint64_t v49 = v48;
            memcpy(v5 + 120, v48 + 216, 0x118uLL);
            *((_OWORD *)v5 + 6) = *(_OWORD *)v49;
            *((_DWORD *)v5 + 102) = *((_DWORD *)v49 + 48);
            *((_DWORD *)v5 + 103) = *((unsigned __int16 *)v49 + 98);
            *((void *)v5 + 14) = *((void *)v49 + 2);
          }
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v45[32], a2);
          *((void *)v5 + 11) = result;
        }
        break;
    }
  }
  else
  {
    switch(v6)
    {
      case -16303:
      case -16301:
        v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v8 = *a3;
        uint64_t v9 = *(void *)v7;
        *((void *)v5 + 1) = *((void *)v7 + 1);
        *((void *)v5 + 2) = v8;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        *((void *)v5 + 5) = v9;
        uint64_t v10 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 7) = v10;
        if (v10)
        {
          int v11 = v10;
          memcpy(v5 + 120, v10 + 216, 0x118uLL);
          *((_OWORD *)v5 + 6) = *(_OWORD *)v11;
          *((_DWORD *)v5 + 102) = *((_DWORD *)v11 + 48);
          *((_DWORD *)v5 + 103) = *((unsigned __int16 *)v11 + 98);
          *((void *)v5 + 14) = *((void *)v11 + 2);
        }
        unsigned int v12 = v7[24];
        goto LABEL_27;
      case -16302:
      case -16300:
        int v25 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v26 = *a3;
        uint64_t v27 = *(void *)v25;
        *((void *)v5 + 1) = *((void *)v25 + 1);
        *((void *)v5 + 2) = v26;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        *((void *)v5 + 5) = v27;
        uint64_t v28 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 7) = v28;
        if (v28)
        {
          unsigned int v29 = v28;
          memcpy(v5 + 120, v28 + 216, 0x118uLL);
          *((_OWORD *)v5 + 6) = *(_OWORD *)v29;
          *((_DWORD *)v5 + 102) = *((_DWORD *)v29 + 48);
          *((_DWORD *)v5 + 103) = *((unsigned __int16 *)v29 + 98);
          *((void *)v5 + 14) = *((void *)v29 + 2);
        }
        unsigned int v12 = v25[32];
LABEL_27:
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v12, a2);
        *((void *)v5 + 6) = result;
        break;
      default:
        if (v6 == -16242) {
          *((void *)result + 3) = *a3;
        }
        break;
    }
  }
  return result;
}

char *GTMTLSMComputePipelineState_processTraceFuncWithMap(char *result, uint64_t a2, uint64_t *a3)
{
  BOOL v5 = result;
  int v6 = *((_DWORD *)a3 + 2);
  if (v6 <= -16102)
  {
    switch(v6)
    {
      case -16299:
      case -16298:
      case -16297:
      case -16296:
        v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v8 = *a3;
        uint64_t v9 = *(void *)v7;
        *((void *)v5 + 1) = *((void *)v7 + 1);
        *((void *)v5 + 2) = v8;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        *((void *)v5 + 5) = v9;
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 8) = result;
        if (result)
        {
          long long v10 = *(_OWORD *)(result + 104);
          long long v11 = *(_OWORD *)(result + 120);
          long long v12 = *(_OWORD *)(result + 136);
          *((void *)v5 + 21) = *((void *)result + 19);
          *(_OWORD *)(v5 + 152) = v12;
          *(_OWORD *)(v5 + 136) = v11;
          *(_OWORD *)(v5 + 120) = v10;
          *((_OWORD *)v5 + 6) = *(_OWORD *)result;
          *((_DWORD *)v5 + 48) = *((_DWORD *)result + 22);
          *((void *)v5 + 14) = *((void *)result + 2);
        }
        *((void *)v5 + 6) = *((void *)v7 + 2);
        break;
      default:
        JUMPOUT(0);
    }
  }
  else if (v6 > -10215)
  {
    if (v6 > -10172)
    {
      if (v6 == -10171)
      {
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((void *)v5 + 22) = *((void *)result + 1);
      }
      else if (v6 == -10162)
      {
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((void *)v5 + 14) = *((void *)result + 1);
      }
    }
    else if (v6 == -10214)
    {
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((void *)v5 + 12) = *((void *)result + 1);
    }
    else if (v6 == -10191)
    {
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((_DWORD *)v5 + 48) = *((_DWORD *)result + 2);
    }
  }
  else if (v6 > -15741)
  {
    if (v6 == -15740)
    {
      uint64_t v27 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v28 = *a3;
      uint64_t v29 = *(void *)v27;
      *((void *)v5 + 1) = *((void *)v27 + 1);
      *((void *)v5 + 2) = v28;
      *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
      *((void *)v5 + 5) = v29;
      uint64_t v30 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
      *((void *)v5 + 8) = v30;
      if (v30)
      {
        long long v31 = *(_OWORD *)(v30 + 104);
        long long v32 = *(_OWORD *)(v30 + 120);
        long long v33 = *(_OWORD *)(v30 + 136);
        *((void *)v5 + 21) = *((void *)v30 + 19);
        *(_OWORD *)(v5 + 152) = v33;
        *(_OWORD *)(v5 + 136) = v32;
        *(_OWORD *)(v5 + 120) = v31;
        *((_OWORD *)v5 + 6) = *(_OWORD *)v30;
        *((_DWORD *)v5 + 48) = *((_DWORD *)v30 + 22);
        *((void *)v5 + 14) = *((void *)v30 + 2);
      }
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v27[32], a2);
      *((void *)v5 + 11) = result;
    }
    else if (v6 == -15541)
    {
      uint64_t v13 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v14 = *a3;
      uint64_t v15 = *(void *)v13;
      *((void *)v5 + 1) = *((void *)v13 + 1);
      *((void *)v5 + 2) = v14;
      *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
      *((void *)v5 + 5) = v15;
      uint64_t v16 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
      *((void *)v5 + 8) = v16;
      if (v16)
      {
        long long v17 = *(_OWORD *)(v16 + 104);
        long long v18 = *(_OWORD *)(v16 + 120);
        long long v19 = *(_OWORD *)(v16 + 136);
        *((void *)v5 + 21) = *((void *)v16 + 19);
        *(_OWORD *)(v5 + 152) = v19;
        *(_OWORD *)(v5 + 136) = v18;
        *(_OWORD *)(v5 + 120) = v17;
        *((_OWORD *)v5 + 6) = *(_OWORD *)v16;
        *((_DWORD *)v5 + 48) = *((_DWORD *)v16 + 22);
        *((void *)v5 + 14) = *((void *)v16 + 2);
      }
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v13[24], a2);
      *((void *)v5 + 23) = result;
    }
  }
  else if (v6 == -16101)
  {
    uint64_t v20 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
    uint64_t v21 = *a3;
    uint64_t v22 = *(void *)v20;
    *((void *)v5 + 1) = *((void *)v20 + 1);
    *((void *)v5 + 2) = v21;
    *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
    *((void *)v5 + 5) = v22;
    uint64_t v23 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
    *((void *)v5 + 8) = v23;
    if (v23)
    {
      long long v24 = *(_OWORD *)(v23 + 104);
      long long v25 = *(_OWORD *)(v23 + 120);
      long long v26 = *(_OWORD *)(v23 + 136);
      *((void *)v5 + 21) = *((void *)v23 + 19);
      *(_OWORD *)(v5 + 152) = v26;
      *(_OWORD *)(v5 + 136) = v25;
      *(_OWORD *)(v5 + 120) = v24;
      *((_OWORD *)v5 + 6) = *(_OWORD *)v23;
      *((_DWORD *)v5 + 48) = *((_DWORD *)v23 + 22);
      *((void *)v5 + 14) = *((void *)v23 + 2);
    }
    *((void *)v5 + 9) = GTTraceFunc_argumentBytesWithMap(a3, v20[24], a2);
    uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v20[25], a2);
    *((void *)v5 + 10) = result;
  }
  else if (v6 == -15989)
  {
    uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
    *((void *)v5 + 13) = *((void *)result + 1);
  }
  return result;
}

char *GTMTLSMDrawable_processTraceFuncWithMap(char *result, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = result;
  int v5 = *((_DWORD *)a3 + 2);
  if (v5 > -7162)
  {
    if (v5 == -7161)
    {
      *((void *)result + 3) = *a3;
    }
    else if (v5 == -6655)
    {
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v8 = *a3;
      *((void *)v4 + 1) = *((void *)result + 1);
      *((void *)v4 + 2) = v8;
      *((_DWORD *)v4 + 1) = *((_DWORD *)a3 + 2);
    }
  }
  else if (v5 == -7167)
  {
    uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
    *((void *)v4 + 6) = *((void *)result + 1);
  }
  else if (v5 == -7166)
  {
    uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
    uint64_t v6 = *a3;
    uint64_t v7 = *(void *)result;
    *((void *)v4 + 1) = *((void *)result + 1);
    *((void *)v4 + 2) = v6;
    *((_DWORD *)v4 + 1) = *((_DWORD *)a3 + 2);
    *((void *)v4 + 5) = v7;
  }
  return result;
}

char *GTMTLSMAccelerationStructure_processTraceFuncWithMap(char *result, uint64_t a2, uint64_t *a3)
{
  int v5 = result;
  int v6 = *((_DWORD *)a3 + 2);
  if (v6 <= -10198)
  {
    if (v6 > -15507)
    {
      switch(v6)
      {
        case -15359:
          uint64_t v8 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v9 = *a3;
          *((void *)v5 + 1) = *((void *)v8 + 1);
          *((void *)v5 + 2) = v9;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 15) = result;
          if (result)
          {
            uint64_t v10 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            *((_DWORD *)v5 + 22) = *((_DWORD *)result + 4);
            uint64_t v11 = *((void *)result + 4);
            *((void *)v5 + 16) = *((void *)result + 3);
            *((void *)v5 + 23) = v11;
            uint64_t v12 = *((void *)result + 9);
            *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
            *((void *)v5 + 20) = v12;
            long long v13 = *((_OWORD *)result + 5);
            *(_OWORD *)(v5 + 168) = v13;
            *((_DWORD *)v5 + 20) = v12 - v13;
            *((_DWORD *)v5 + 21) = v10;
            *((void *)v5 + 24) = *((void *)result + 12);
            *((void *)v5 + 17) = *((void *)result + 7);
          }
          *((void *)v5 + 5) = *(void *)v8;
          uint64_t v14 = *((void *)v8 + 2);
          *((void *)v5 + 25) = *((void *)v8 + 3);
          uint64_t v15 = *((void *)v8 + 4);
          *((void *)v5 + 18) = v14;
          *((void *)v5 + 19) = v15;
          return result;
        case -15358:
          goto LABEL_31;
        case -15357:
          return result;
        case -15356:
          uint64_t v42 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v43 = *a3;
          *((void *)v5 + 1) = *((void *)v42 + 1);
          *((void *)v5 + 2) = v43;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 15) = result;
          if (result)
          {
            uint64_t v44 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            *((_DWORD *)v5 + 22) = *((_DWORD *)result + 4);
            uint64_t v45 = *((void *)result + 4);
            *((void *)v5 + 16) = *((void *)result + 3);
            *((void *)v5 + 23) = v45;
            uint64_t v46 = *((void *)result + 5);
            *((void *)v5 + 25) = *((void *)result + 6);
            *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
            uint64_t v47 = *((void *)result + 9);
            *((void *)v5 + 19) = v46;
            *((void *)v5 + 20) = v47;
            long long v48 = *((_OWORD *)result + 5);
            *(_OWORD *)(v5 + 168) = v48;
            *((_DWORD *)v5 + 20) = v47 - v48;
            *((_DWORD *)v5 + 21) = v44;
            *((void *)v5 + 24) = *((void *)result + 12);
            *((void *)v5 + 17) = *((void *)result + 7);
          }
          goto LABEL_62;
        case -15355:
          uint64_t v42 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v49 = *a3;
          *((void *)v5 + 1) = *((void *)v42 + 1);
          *((void *)v5 + 2) = v49;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 15) = result;
          if (result)
          {
            uint64_t v50 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            int v51 = *((_DWORD *)result + 4);
            *((_DWORD *)v5 + 21) = v50;
            *((_DWORD *)v5 + 22) = v51;
            uint64_t v52 = *((void *)result + 4);
            *((void *)v5 + 16) = *((void *)result + 3);
            uint64_t v53 = *((void *)result + 6);
            *((void *)v5 + 19) = *((void *)result + 5);
            *((void *)v5 + 23) = v52;
            *((void *)v5 + 25) = v53;
            *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
            *((_OWORD *)v5 + 10) = *(_OWORD *)(result + 72);
            uint64_t v54 = *((void *)result + 12);
            *((void *)v5 + 22) = *((void *)result + 11);
            *((void *)v5 + 24) = v54;
            *((void *)v5 + 17) = *((void *)result + 7);
          }
          *((_DWORD *)v5 + 20) = *((void *)v42 + 2);
LABEL_62:
          *((void *)v5 + 6) = *(void *)v42;
          return result;
        case -15354:
          long long v33 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v55 = *a3;
          *((void *)v5 + 1) = *((void *)v33 + 1);
          *((void *)v5 + 2) = v55;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 15) = result;
          if (result)
          {
            uint64_t v56 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            *((_DWORD *)v5 + 22) = *((_DWORD *)result + 4);
            *((void *)v5 + 16) = *((void *)result + 3);
            uint64_t v57 = *((void *)result + 5);
            *((void *)v5 + 25) = *((void *)result + 6);
            *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
            uint64_t v58 = *((void *)result + 9);
            *((void *)v5 + 19) = v57;
            *((void *)v5 + 20) = v58;
            long long v59 = *((_OWORD *)result + 5);
            *(_OWORD *)(v5 + 168) = v59;
            *((_DWORD *)v5 + 20) = v58 - v59;
            *((_DWORD *)v5 + 21) = v56;
            *((void *)v5 + 24) = *((void *)result + 12);
            *((void *)v5 + 17) = *((void *)result + 7);
          }
          *((void *)v5 + 6) = *(void *)v33;
          goto LABEL_66;
        case -15353:
          int v60 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v61 = *a3;
          *((void *)v5 + 1) = *((void *)v60 + 1);
          *((void *)v5 + 2) = v61;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 15) = result;
          if (result)
          {
            uint64_t v62 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            int v63 = *((_DWORD *)result + 4);
            *((_DWORD *)v5 + 21) = v62;
            *((_DWORD *)v5 + 22) = v63;
            *((void *)v5 + 16) = *((void *)result + 3);
            uint64_t v64 = *((void *)result + 6);
            *((void *)v5 + 19) = *((void *)result + 5);
            *((void *)v5 + 25) = v64;
            *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
            *((_OWORD *)v5 + 10) = *(_OWORD *)(result + 72);
            uint64_t v65 = *((void *)result + 12);
            *((void *)v5 + 22) = *((void *)result + 11);
            *((void *)v5 + 24) = v65;
            *((void *)v5 + 17) = *((void *)result + 7);
          }
          *((void *)v5 + 6) = *(void *)v60;
          uint64_t v66 = *((void *)v60 + 2);
          *((_DWORD *)v5 + 20) = *((void *)v60 + 3);
          *((void *)v5 + 23) = v66;
          return result;
        case -15352:
          uint64_t v67 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v68 = *a3;
          *((void *)v5 + 1) = *((void *)v67 + 1);
          *((void *)v5 + 2) = v68;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 15) = result;
          if (result)
          {
            uint64_t v69 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            int v70 = *((_DWORD *)result + 4);
            *((_DWORD *)v5 + 21) = v69;
            *((_DWORD *)v5 + 22) = v70;
            *((void *)v5 + 16) = *((void *)result + 3);
            *((void *)v5 + 25) = *((void *)result + 6);
            *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
            *((_OWORD *)v5 + 10) = *(_OWORD *)(result + 72);
            uint64_t v71 = *((void *)result + 12);
            *((void *)v5 + 22) = *((void *)result + 11);
            *((void *)v5 + 24) = v71;
            *((void *)v5 + 17) = *((void *)result + 7);
          }
          *((void *)v5 + 6) = *(void *)v67;
          uint64_t v72 = *((void *)v67 + 2);
          *((_DWORD *)v5 + 20) = *((void *)v67 + 3);
          *((void *)v5 + 23) = v72;
          uint64_t v39 = *((void *)v67 + 4);
          goto LABEL_73;
        case -15351:
          int v73 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v74 = *a3;
          *((void *)v5 + 1) = *((void *)v73 + 1);
          *((void *)v5 + 2) = v74;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 15) = result;
          if (result)
          {
            uint64_t v75 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            *((_DWORD *)v5 + 22) = *((_DWORD *)result + 4);
            *((void *)v5 + 16) = *((void *)result + 3);
            *((void *)v5 + 25) = *((void *)result + 6);
            uint64_t v76 = *((void *)result + 9);
            *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
            *((void *)v5 + 20) = v76;
            long long v77 = *((_OWORD *)result + 5);
            *(_OWORD *)(v5 + 168) = v77;
            *((_DWORD *)v5 + 20) = v76 - v77;
            *((_DWORD *)v5 + 21) = v75;
            *((void *)v5 + 24) = *((void *)result + 12);
            *((void *)v5 + 17) = *((void *)result + 7);
          }
          *((void *)v5 + 6) = *(void *)v73;
          goto LABEL_80;
        default:
          if (v6 == -15506)
          {
            int v73 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            uint64_t v78 = *a3;
            *((void *)v5 + 1) = *((void *)v73 + 1);
            *((void *)v5 + 2) = v78;
            *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
            *((void *)v5 + 15) = result;
            if (result)
            {
              uint64_t v79 = *((void *)result + 1);
              *((void *)v5 + 7) = *(void *)result;
              *((_DWORD *)v5 + 22) = *((_DWORD *)result + 4);
              *((void *)v5 + 16) = *((void *)result + 3);
              *((void *)v5 + 25) = *((void *)result + 6);
              uint64_t v80 = *((void *)result + 9);
              *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
              *((void *)v5 + 20) = v80;
              long long v81 = *((_OWORD *)result + 5);
              *(_OWORD *)(v5 + 168) = v81;
              *((_DWORD *)v5 + 20) = v80 - v81;
              *((_DWORD *)v5 + 21) = v79;
              *((void *)v5 + 24) = *((void *)result + 12);
              *((void *)v5 + 17) = *((void *)result + 7);
            }
            *((void *)v5 + 5) = *(void *)v73;
LABEL_80:
            uint64_t v82 = *((void *)v73 + 3);
            *((void *)v5 + 23) = *((void *)v73 + 2);
            *((void *)v5 + 19) = v82;
          }
          else if (v6 == -15464)
          {
            long long v24 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            uint64_t v25 = *a3;
            *((void *)v5 + 1) = *((void *)v24 + 1);
            *((void *)v5 + 2) = v25;
            *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
            *((void *)v5 + 15) = result;
            if (result)
            {
              uint64_t v26 = *((void *)result + 1);
              *((void *)v5 + 7) = *(void *)result;
              *((_DWORD *)v5 + 22) = *((_DWORD *)result + 4);
              uint64_t v27 = *((void *)result + 4);
              *((void *)v5 + 16) = *((void *)result + 3);
              uint64_t v28 = *((void *)result + 5);
              *((void *)v5 + 23) = v27;
              *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
              uint64_t v29 = *((void *)result + 9);
              *((void *)v5 + 19) = v28;
              *((void *)v5 + 20) = v29;
              long long v30 = *((_OWORD *)result + 5);
              *(_OWORD *)(v5 + 168) = v30;
              *((_DWORD *)v5 + 20) = v29 - v30;
              *((_DWORD *)v5 + 21) = v26;
              *((void *)v5 + 24) = *((void *)result + 12);
              *((void *)v5 + 17) = *((void *)result + 7);
            }
            *((void *)v5 + 5) = *(void *)v24;
            uint64_t v31 = *((void *)v24 + 3);
            *((void *)v5 + 18) = *((void *)v24 + 2);
            *((void *)v5 + 25) = v31;
          }
          break;
      }
    }
    else if (v6 > -15616)
    {
      switch(v6)
      {
        case -15615:
LABEL_31:
          long long v17 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v18 = *a3;
          *((void *)v5 + 1) = *((void *)v17 + 1);
          *((void *)v5 + 2) = v18;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 15) = result;
          if (result)
          {
            uint64_t v19 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            *((_DWORD *)v5 + 22) = *((_DWORD *)result + 4);
            uint64_t v20 = *((void *)result + 4);
            *((void *)v5 + 16) = *((void *)result + 3);
            *((void *)v5 + 23) = v20;
            uint64_t v21 = *((void *)result + 5);
            *((void *)v5 + 25) = *((void *)result + 6);
            *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
            uint64_t v22 = *((void *)result + 9);
            *((void *)v5 + 19) = v21;
            *((void *)v5 + 20) = v22;
            long long v23 = *((_OWORD *)result + 5);
            *(_OWORD *)(v5 + 168) = v23;
            *((_DWORD *)v5 + 20) = v22 - v23;
            *((_DWORD *)v5 + 21) = v19;
            *((void *)v5 + 24) = *((void *)result + 12);
            *((void *)v5 + 17) = *((void *)result + 7);
          }
          *((void *)v5 + 5) = *(void *)v17;
          break;
        case -15614:
          long long v33 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v34 = *a3;
          *((void *)v5 + 1) = *((void *)v33 + 1);
          *((void *)v5 + 2) = v34;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 15) = result;
          if (result)
          {
            uint64_t v35 = *((void *)result + 1);
            *((void *)v5 + 7) = *(void *)result;
            *((_DWORD *)v5 + 22) = *((_DWORD *)result + 4);
            *((void *)v5 + 16) = *((void *)result + 3);
            uint64_t v36 = *((void *)result + 5);
            *((void *)v5 + 25) = *((void *)result + 6);
            *((_WORD *)v5 + 48) = *((_WORD *)result + 32);
            uint64_t v37 = *((void *)result + 9);
            *((void *)v5 + 19) = v36;
            *((void *)v5 + 20) = v37;
            long long v38 = *((_OWORD *)result + 5);
            *(_OWORD *)(v5 + 168) = v38;
            *((_DWORD *)v5 + 20) = v37 - v38;
            *((_DWORD *)v5 + 21) = v35;
            *((void *)v5 + 24) = *((void *)result + 12);
            *((void *)v5 + 17) = *((void *)result + 7);
          }
          *((void *)v5 + 5) = *(void *)v33;
LABEL_66:
          *((void *)v5 + 23) = *((void *)v33 + 2);
          break;
        case -15552:
          uint64_t v16 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v16[8], a2);
          *((void *)v5 + 14) = result;
          if (result)
          {
            v5[104] = (*result & 0xFE) == 2;
            v5[105] = 1;
            v5[107] = (result[1] & 4) != 0;
          }
          break;
      }
    }
    else
    {
      switch(v6)
      {
        case -15661:
          uint64_t v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v7[8], a2);
          *((void *)v5 + 9) = result;
          break;
        case -15660:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((_DWORD *)v5 + 22) = *((_DWORD *)result + 2);
          break;
        case -15659:
          *((void *)result + 3) = *a3;
          break;
        case -15651:
          result[100] = 1;
          break;
        case -15650:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v32 = *((void *)result + 2);
          if (v32 != 1) {
            *((_WORD *)v5 + 49) = v32;
          }
          break;
        default:
          return result;
      }
    }
    return result;
  }
  if (v6 > -10174)
  {
    if (v6 <= -10160)
    {
      switch(v6)
      {
        case -10173:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((void *)v5 + 8) = *((void *)result + 1);
          break;
        case -10170:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v39 = *((void *)result + 1);
LABEL_73:
          *((void *)v5 + 19) = v39;
          break;
        case -10169:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((_DWORD *)v5 + 20) = *((void *)result + 1);
          break;
        case -10167:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((void *)v5 + 17) = *((void *)result + 1);
          break;
        default:
          return result;
      }
      return result;
    }
    if (v6 == -10159)
    {
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      int16x8_t v41 = *(int16x8_t *)(result + 8);
    }
    else
    {
      if (v6 != -10158)
      {
        if (v6 == -10154)
        {
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          if (*((void *)v5 + 1) == *((void *)result + 1))
          {
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, result[16], a2);
            *((void *)v5 + 14) = result;
          }
        }
        return result;
      }
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      if (*((void *)v5 + 1) != *((void *)result + 1)) {
        return result;
      }
      int16x8_t v41 = *((int16x8_t *)result + 1);
    }
    *(int16x4_t *)v41.i8 = vmovn_s32((int32x4_t)v41);
    *((_DWORD *)v5 + 26) = vmovn_s16(v41).u32[0];
    return result;
  }
  if (v6 <= -10196)
  {
    if (v6 == -10197)
    {
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((void *)v5 + 7) = *((void *)result + 1);
    }
    else
    {
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((_DWORD *)v5 + 21) = *((void *)result + 1);
    }
  }
  else
  {
    switch(v6)
    {
      case -10195:
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((_DWORD *)v5 + 23) = *((_DWORD *)result + 2);
        break;
      case -10182:
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((_OWORD *)v5 + 10) = *(_OWORD *)(result + 8);
        uint64_t v40 = *((void *)result + 4);
        *((void *)v5 + 22) = *((void *)result + 3);
        *((_WORD *)v5 + 48) = v40;
        *((_OWORD *)v5 + 12) = *(_OWORD *)(result + 40);
        break;
      case -10181:
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((void *)v5 + 16) = *((void *)result + 1);
        break;
    }
  }
  return result;
}

char *GTMTLSMIntersectionFunctionTable_processTraceFuncWithMap(char *result, uint64_t a2, uint64_t *a3)
{
  int v5 = result;
  int v6 = *((_DWORD *)a3 + 2);
  if (v6 > -15444)
  {
    if (v6 <= -10181)
    {
      switch(v6)
      {
        case -15443:
          long long v30 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v31 = *a3;
          *((void *)v5 + 1) = *((void *)v30 + 1);
          *((void *)v5 + 2) = v31;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t v32 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 14) = v32;
          if (v32)
          {
            uint64_t v33 = *((void *)v32 + 1);
            *((void *)v5 + 7) = *(void *)v32;
            int v34 = *((_DWORD *)v32 + 4);
            *((_DWORD *)v5 + 21) = v33;
            *((_DWORD *)v5 + 22) = v34;
            *(int8x16_t *)(v5 + 136) = vextq_s8(*(int8x16_t *)(v32 + 24), *(int8x16_t *)(v32 + 24), 8uLL);
            *((void *)v5 + 19) = *((void *)v32 + 5);
          }
          *((void *)v5 + 16) = *(void *)v30;
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v30[16], a2);
          *((void *)v5 + 13) = result;
          char v18 = 2;
          break;
        case -15442:
          uint64_t v25 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v26 = *a3;
          *((void *)v5 + 1) = *((void *)v25 + 1);
          *((void *)v5 + 2) = v26;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t v27 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 14) = v27;
          if (v27)
          {
            uint64_t v28 = *((void *)v27 + 1);
            *((void *)v5 + 7) = *(void *)v27;
            int v29 = *((_DWORD *)v27 + 4);
            *((_DWORD *)v5 + 21) = v28;
            *((_DWORD *)v5 + 22) = v29;
            *(int8x16_t *)(v5 + 136) = vextq_s8(*(int8x16_t *)(v27 + 24), *(int8x16_t *)(v27 + 24), 8uLL);
            *((void *)v5 + 19) = *((void *)v27 + 5);
          }
          *((void *)v5 + 16) = *(void *)v25;
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v25[16], a2);
          *((void *)v5 + 13) = result;
          char v18 = 4;
          break;
        case -15441:
          long long v13 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          uint64_t v14 = *a3;
          *((void *)v5 + 1) = *((void *)v13 + 1);
          *((void *)v5 + 2) = v14;
          *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
          uint64_t v15 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
          *((void *)v5 + 14) = v15;
          if (v15)
          {
            uint64_t v16 = *((void *)v15 + 1);
            *((void *)v5 + 7) = *(void *)v15;
            int v17 = *((_DWORD *)v15 + 4);
            *((_DWORD *)v5 + 21) = v16;
            *((_DWORD *)v5 + 22) = v17;
            *(int8x16_t *)(v5 + 136) = vextq_s8(*(int8x16_t *)(v15 + 24), *(int8x16_t *)(v15 + 24), 8uLL);
            *((void *)v5 + 19) = *((void *)v15 + 5);
          }
          *((void *)v5 + 16) = *(void *)v13;
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v13[16], a2);
          *((void *)v5 + 13) = result;
          char v18 = 1;
          break;
        default:
          return result;
      }
      v5[160] = v18;
    }
    else
    {
      switch(v6)
      {
        case -10180:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((void *)v5 + 8) = *((void *)result + 1);
          break;
        case -10179:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((_DWORD *)v5 + 21) = *((void *)result + 1);
          break;
        case -10178:
        case -10177:
          return result;
        case -10176:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((void *)v5 + 7) = *((void *)result + 1);
          break;
        case -10175:
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((void *)v5 + 18) = *((void *)result + 1);
          break;
        default:
          if (v6 == -10161)
          {
            uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
            *((void *)v5 + 19) = *((void *)result + 1);
          }
          break;
      }
    }
  }
  else if (v6 > -15561)
  {
    if (v6 > -15541)
    {
      if (v6 == -15540)
      {
        uint64_t v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v35 = *a3;
        *((void *)v5 + 1) = *((void *)v7 + 1);
        *((void *)v5 + 2) = v35;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        uint64_t v36 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 14) = v36;
        if (v36)
        {
          uint64_t v37 = *((void *)v36 + 1);
          *((void *)v5 + 7) = *(void *)v36;
          int v38 = *((_DWORD *)v36 + 4);
          *((_DWORD *)v5 + 21) = v37;
          *((_DWORD *)v5 + 22) = v38;
          *(int8x16_t *)(v5 + 136) = vextq_s8(*(int8x16_t *)(v36 + 24), *(int8x16_t *)(v36 + 24), 8uLL);
          *((void *)v5 + 19) = *((void *)v36 + 5);
        }
        *((void *)v5 + 15) = *(void *)v7;
LABEL_45:
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v7[16], a2);
        *((void *)v5 + 13) = result;
      }
      else if (v6 == -15462)
      {
        uint64_t v19 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v20 = *a3;
        *((void *)v5 + 1) = *((void *)v19 + 1);
        *((void *)v5 + 2) = v20;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        uint64_t v21 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 14) = v21;
        if (v21)
        {
          uint64_t v22 = *((void *)v21 + 1);
          *((void *)v5 + 7) = *(void *)v21;
          int v23 = *((_DWORD *)v21 + 4);
          *((_DWORD *)v5 + 21) = v22;
          *((_DWORD *)v5 + 22) = v23;
          *(int8x16_t *)(v5 + 136) = vextq_s8(*(int8x16_t *)(v21 + 24), *(int8x16_t *)(v21 + 24), 8uLL);
          *((void *)v5 + 19) = *((void *)v21 + 5);
        }
        *((void *)v5 + 16) = *(void *)v19;
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v19[24], a2);
        *((void *)v5 + 13) = result;
        v5[160] = *((void *)v19 + 2);
      }
    }
    else if (v6 == -15560)
    {
      result[100] = 1;
    }
    else if (v6 == -15557)
    {
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v12 = *((void *)result + 2);
      if (v12 != 1) {
        *((_WORD *)v5 + 49) = v12;
      }
    }
  }
  else
  {
    switch(v6)
    {
      case -15577:
        uint64_t v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v8 = *a3;
        *((void *)v5 + 1) = *((void *)v7 + 1);
        *((void *)v5 + 2) = v8;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        uint64_t v9 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 14) = v9;
        if (v9)
        {
          uint64_t v10 = *((void *)v9 + 1);
          *((void *)v5 + 7) = *(void *)v9;
          int v11 = *((_DWORD *)v9 + 4);
          *((_DWORD *)v5 + 21) = v10;
          *((_DWORD *)v5 + 22) = v11;
          *(int8x16_t *)(v5 + 136) = vextq_s8(*(int8x16_t *)(v9 + 24), *(int8x16_t *)(v9 + 24), 8uLL);
          *((void *)v5 + 19) = *((void *)v9 + 5);
        }
        *((void *)v5 + 5) = *(void *)v7;
        goto LABEL_45;
      case -15570:
        long long v24 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v24[8], a2);
        *((void *)v5 + 9) = result;
        break;
      case -15569:
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((_DWORD *)v5 + 22) = *((_DWORD *)result + 2);
        break;
      case -15568:
        *((void *)result + 3) = *a3;
        break;
      default:
        return result;
    }
  }
  return result;
}

char *GTMTLSMIntersectionFunctionTableStateful_processTraceFuncWithMap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  int v7 = *(_DWORD *)(a3 + 8);
  if (v7 <= -15531)
  {
    if (v7 > -15546)
    {
      if (v7 == -15545)
      {
        uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
        uint64_t v45 = *((void *)result + 1);
        uint64_t v46 = a1 + 184 + 24 * *((void *)result + 3);
        *(_DWORD *)uint64_t v46 = v45 != 0;
        *(void *)(v46 + 8) = v45;
        *(void *)(a1 + 184 + 24 * *((void *)result + 3) + 16) = *((void *)result + 2);
        return result;
      }
      if (v7 != -15544) {
        goto LABEL_59;
      }
      uint64_t v26 = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
      uint64_t v27 = GTTraceFunc_argumentBytesWithMap((void *)a3, v26[24], a2);
      uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, v26[25], a2);
      if (*((void *)v26 + 2))
      {
        unint64_t v28 = 0;
        do
        {
          uint64_t v29 = *(void *)&v27[8 * v28];
          uint64_t v30 = a1 + 184 + 24 * (v28 + *((void *)v26 + 1));
          *(_DWORD *)uint64_t v30 = v29 != 0;
          *(void *)(v30 + 8) = v29;
          *(void *)(a1 + 184 + 24 * (v28 + *((void *)v26 + 1)) + 16) = *(void *)&result[8 * v28];
          ++v28;
        }
        while (*((void *)v26 + 2) > v28);
      }
      return result;
    }
    if (v7 != -15559)
    {
      if (v7 != -15558) {
        goto LABEL_59;
      }
      uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
      if (*(void *)(a1 + 168))
      {
        long long v13 = result;
        uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, result[24], a2);
        if (*((void *)v13 + 2))
        {
          unint64_t v14 = 0;
          do
          {
            uint64_t v15 = *(void *)(a1 + 168) + 16 * (v14 + *((void *)v13 + 1));
            *(_DWORD *)uint64_t v15 = 1;
            *(void *)(v15 + 8) = *(void *)&result[8 * v14++];
          }
          while (*((void *)v13 + 2) > v14);
        }
      }
      return result;
    }
    uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
    uint64_t v40 = *(void *)(a1 + 168);
    if (!v40) {
      return result;
    }
    uint64_t v10 = *((void *)result + 1);
    uint64_t v11 = v40 + 16 * *((void *)result + 2);
    int v12 = 1;
LABEL_51:
    *(_DWORD *)uint64_t v11 = v12;
    *(void *)(v11 + 8) = v10;
    return result;
  }
  if (v7 <= -15259)
  {
    switch(v7)
    {
      case -15530:
        uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
        uint64_t v9 = *(void *)(a1 + 168);
        if (!v9) {
          return result;
        }
        uint64_t v10 = *((void *)result + 1);
        uint64_t v11 = v9 + 16 * *((void *)result + 2);
        int v12 = 2;
        break;
      case -15529:
        uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
        if (*(void *)(a1 + 168) && *((void *)result + 3))
        {
          unint64_t v31 = 0;
          do
          {
            uint64_t v32 = *((void *)result + 1);
            uint64_t v33 = *(void *)(a1 + 168) + 16 * (v31 + *((void *)result + 2));
            *(_DWORD *)uint64_t v33 = 2;
            *(void *)(v33 + 8) = v32;
            ++v31;
          }
          while (*((void *)result + 3) > v31);
        }
        return result;
      case -15526:
        uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
        uint64_t v25 = *((void *)result + 1);
        int v34 = 2 * (v25 != 0);
        uint64_t v35 = a1 + 24 * *((void *)result + 2);
        goto LABEL_42;
      case -15525:
        uint64_t v36 = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
        uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, v36[24], a2);
        if (*((void *)v36 + 2))
        {
          unint64_t v37 = 0;
          do
          {
            uint64_t v38 = *(void *)&result[8 * v37];
            uint64_t v39 = a1 + 24 * (v37 + *((void *)v36 + 1));
            *(_DWORD *)(v39 + 184) = 2 * (v38 != 0);
            *(void *)(v39 + 192) = v38;
            ++v37;
          }
          while (*((void *)v36 + 2) > v37);
        }
        return result;
      default:
        goto LABEL_59;
    }
    goto LABEL_51;
  }
  if (v7 == -15258)
  {
    uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
    uint64_t v41 = *(void *)(a1 + 168);
    if (!v41) {
      return result;
    }
    uint64_t v10 = *((void *)result + 1);
    uint64_t v11 = v41 + 16 * *((void *)result + 2);
    int v12 = 3;
    goto LABEL_51;
  }
  if (v7 != -15257)
  {
    if (v7 == -10152)
    {
      uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
      if (!a4) {
        return result;
      }
      uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, result[8], a2);
      unint64_t v17 = *(void *)result;
      if (!*(void *)result) {
        return result;
      }
      char v18 = result;
      uint64_t v19 = 0;
      for (uint64_t i = (_DWORD *)(a1 + 184); ; i += 6)
      {
        uint64_t v21 = &v18[8 * v19];
        uint64_t v22 = *((void *)v21 + 1);
        if (v22)
        {
          uint64_t result = (char *)GTMTLGPUAddressResource_resourceForGPUAddress(*(void **)(*a4 + 24), *(int *)(*a4 + 12), *((void *)v21 + 1));
          if (result)
          {
            uint64_t v23 = *((void *)result + 2);
            if (v23)
            {
              unint64_t v47 = *(void *)result;
              uint64_t v48 = a1 + 24 * v19;
              *(_DWORD *)(v48 + 184) = 1;
              *(void *)(v48 + 192) = v23;
              *(void *)(v48 + 200) = v22 - v47;
              return result;
            }
          }
          uint64_t v49 = v22;
          uint64_t result = (char *)find_entry(a4[9], &v49, 8uLL, 0);
          if (*(void *)result)
          {
            uint64_t v24 = *(void *)(*(void *)result + 32);
            if (v24)
            {
              uint64_t v25 = *(void *)(v24 + 8);
              if (v25)
              {
                uint64_t v35 = a1 + 24 * v19;
                int v34 = 2;
LABEL_42:
                *(_DWORD *)(v35 + 184) = v34;
                *(void *)(v35 + 192) = v25;
                return result;
              }
            }
          }
          unint64_t v17 = *(void *)v18;
        }
        else
        {
          *uint64_t i = 0;
        }
        if (v17 <= ++v19) {
          return result;
        }
      }
    }
LABEL_59:
    return GTMTLSMIntersectionFunctionTable_processTraceFuncWithMap((char *)a1, a2, (uint64_t *)a3);
  }
  uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
  if (*(void *)(a1 + 168) && *((void *)result + 3))
  {
    unint64_t v42 = 0;
    do
    {
      uint64_t v43 = *((void *)result + 1);
      uint64_t v44 = *(void *)(a1 + 168) + 16 * (v42 + *((void *)result + 2));
      *(_DWORD *)uint64_t v44 = 3;
      *(void *)(v44 + 8) = v43;
      ++v42;
    }
    while (*((void *)result + 3) > v42);
  }
  return result;
}

char *GTMTLSMVisibleFunctionTable_processTraceFuncWithMap(char *result, uint64_t a2, uint64_t *a3)
{
  int v5 = result;
  int v6 = *((_DWORD *)a3 + 2);
  if (v6 > -15439)
  {
    if (v6 > -10178)
    {
      if (v6 > -10161)
      {
        if (v6 == -10160)
        {
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((void *)v5 + 19) = *((void *)result + 1);
        }
        else if (v6 == -10153)
        {
          uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
          *((void *)v5 + 20) = *((void *)result + 1);
        }
      }
      else if (v6 == -10177)
      {
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((void *)v5 + 7) = *((void *)result + 1);
      }
      else if (v6 == -10174)
      {
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((_DWORD *)v5 + 21) = *((void *)result + 1);
      }
      return result;
    }
    if (v6 != -15438)
    {
      if (v6 == -10193)
      {
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((void *)v5 + 17) = *((void *)result + 1);
      }
      else if (v6 == -10178)
      {
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        *((void *)v5 + 8) = *((void *)result + 1);
      }
      return result;
    }
    int v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
    uint64_t v18 = *a3;
    *((void *)v5 + 1) = *((void *)v7 + 1);
    *((void *)v5 + 2) = v18;
    *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
    uint64_t v19 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
    *((void *)v5 + 14) = v19;
    if (v19)
    {
      uint64_t v20 = *((void *)v19 + 1);
      *((void *)v5 + 7) = *(void *)v19;
      int v21 = *((_DWORD *)v19 + 4);
      *((_DWORD *)v5 + 21) = v20;
      *((_DWORD *)v5 + 22) = v21;
      *(_OWORD *)(v5 + 136) = *(_OWORD *)(v19 + 24);
      *(_OWORD *)(v5 + 152) = *(_OWORD *)(v19 + 40);
    }
    *((void *)v5 + 16) = *(void *)v7;
    char v16 = 1;
LABEL_40:
    v5[168] = v16;
LABEL_41:
    unsigned int v27 = v7[16];
LABEL_42:
    uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v27, a2);
    *((void *)v5 + 13) = result;
    return result;
  }
  if (v6 > -15461)
  {
    switch(v6)
    {
      case -15460:
        uint64_t v22 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v23 = *a3;
        *((void *)v5 + 1) = *((void *)v22 + 1);
        *((void *)v5 + 2) = v23;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        uint64_t v24 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 14) = v24;
        if (v24)
        {
          uint64_t v25 = *((void *)v24 + 1);
          *((void *)v5 + 7) = *(void *)v24;
          int v26 = *((_DWORD *)v24 + 4);
          *((_DWORD *)v5 + 21) = v25;
          *((_DWORD *)v5 + 22) = v26;
          *(_OWORD *)(v5 + 136) = *(_OWORD *)(v24 + 24);
          *(_OWORD *)(v5 + 152) = *(_OWORD *)(v24 + 40);
        }
        *((void *)v5 + 16) = *(void *)v22;
        v5[168] = *((void *)v22 + 2);
        unsigned int v27 = v22[24];
        goto LABEL_42;
      case -15440:
        int v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v28 = *a3;
        *((void *)v5 + 1) = *((void *)v7 + 1);
        *((void *)v5 + 2) = v28;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        uint64_t v29 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 14) = v29;
        if (v29)
        {
          uint64_t v30 = *((void *)v29 + 1);
          *((void *)v5 + 7) = *(void *)v29;
          int v31 = *((_DWORD *)v29 + 4);
          *((_DWORD *)v5 + 21) = v30;
          *((_DWORD *)v5 + 22) = v31;
          *(_OWORD *)(v5 + 136) = *(_OWORD *)(v29 + 24);
          *(_OWORD *)(v5 + 152) = *(_OWORD *)(v29 + 40);
        }
        *((void *)v5 + 16) = *(void *)v7;
        char v16 = 2;
        break;
      case -15439:
        int v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v12 = *a3;
        *((void *)v5 + 1) = *((void *)v7 + 1);
        *((void *)v5 + 2) = v12;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        long long v13 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
        *((void *)v5 + 14) = v13;
        if (v13)
        {
          uint64_t v14 = *((void *)v13 + 1);
          *((void *)v5 + 7) = *(void *)v13;
          int v15 = *((_DWORD *)v13 + 4);
          *((_DWORD *)v5 + 21) = v14;
          *((_DWORD *)v5 + 22) = v15;
          *(_OWORD *)(v5 + 136) = *(_OWORD *)(v13 + 24);
          *(_OWORD *)(v5 + 152) = *(_OWORD *)(v13 + 40);
        }
        *((void *)v5 + 16) = *(void *)v7;
        char v16 = 4;
        break;
      default:
        return result;
    }
    goto LABEL_40;
  }
  switch(v6)
  {
    case -15607:
      unint64_t v17 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v17[8], a2);
      *((void *)v5 + 9) = result;
      return result;
    case -15605:
      *((void *)result + 3) = *a3;
      return result;
    case -15578:
      int v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      uint64_t v8 = *a3;
      *((void *)v5 + 1) = *((void *)v7 + 1);
      *((void *)v5 + 2) = v8;
      *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
      uint64_t v9 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 14), a2);
      *((void *)v5 + 14) = v9;
      if (v9)
      {
        uint64_t v10 = *((void *)v9 + 1);
        *((void *)v5 + 7) = *(void *)v9;
        int v11 = *((_DWORD *)v9 + 4);
        *((_DWORD *)v5 + 21) = v10;
        *((_DWORD *)v5 + 22) = v11;
        *(_OWORD *)(v5 + 136) = *(_OWORD *)(v9 + 24);
        *(_OWORD *)(v5 + 152) = *(_OWORD *)(v9 + 40);
      }
      *((void *)v5 + 15) = *(void *)v7;
      goto LABEL_41;
  }
  return result;
}

char *GTMTLSMVisibleFunctionTableStateful_processTraceFuncWithMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a3 + 8);
  if (v6 == -15597)
  {
    uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
    if (*(void *)(a1 + 176))
    {
      uint64_t v9 = result;
      uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, result[24], a2);
      if (*((void *)v9 + 2))
      {
        unint64_t v10 = 0;
        uint64_t v11 = *(void *)(a1 + 176);
        do
        {
          *(void *)(v11 + 8 * (v10 + *((void *)v9 + 1))) = *(void *)&result[8 * v10];
          ++v10;
        }
        while (*((void *)v9 + 2) > v10);
      }
    }
  }
  else if (v6 == -15598)
  {
    uint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a3, *(unsigned __int8 *)(a3 + 13), a2);
    uint64_t v8 = *(void *)(a1 + 176);
    if (v8) {
      *(void *)(v8 + 8 * *((void *)result + 2)) = *((void *)result + 1);
    }
  }
  else
  {
    return GTMTLSMVisibleFunctionTable_processTraceFuncWithMap((char *)a1, a2, (uint64_t *)a3);
  }
  return result;
}

char *GTMTLFXSMSpatialScaler_processTraceFuncWithMap(char *result, uint64_t a2, uint64_t *a3)
{
  int v5 = result;
  int v6 = *((_DWORD *)a3 + 2);
  switch(v6)
  {
    case -20480:
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((void *)v5 + 8) = *((void *)result + 1);
      break;
    case -20479:
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((void *)v5 + 7) = *((void *)result + 1);
      break;
    case -20478:
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((void *)v5 + 11) = *((void *)result + 1);
      break;
    case -20477:
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((void *)v5 + 10) = *((void *)result + 1);
      break;
    case -20476:
      uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
      *((void *)v5 + 9) = *((void *)result + 1);
      break;
    case -20475:
      *((void *)result + 3) = *a3;
      break;
    default:
      if (v6 == -18432)
      {
        int v7 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v8 = *a3;
        uint64_t v9 = *(void *)v7;
        *((void *)v5 + 1) = *((void *)v7 + 1);
        *((void *)v5 + 2) = v8;
        *((_DWORD *)v5 + 1) = *((_DWORD *)a3 + 2);
        *((void *)v5 + 5) = v9;
        uint64_t result = GTTraceFunc_argumentBytesWithMap(a3, v7[16], a2);
        *((void *)v5 + 6) = result;
        *((_OWORD *)v5 + 5) = *(_OWORD *)result;
      }
      break;
  }
  return result;
}

float32_t GTMTLFXSMTemporalScaler_processTraceFuncWithMap(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v6 = *((_DWORD *)a3 + 2);
  switch(v6)
  {
    case -20473:
      *(void *)(a1 + 64) = *((void *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 1);
      break;
    case -20472:
      *(unsigned char *)(a1 + 148) = *((_DWORD *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 2);
      break;
    case -20471:
      *(void *)(a1 + 72) = *((void *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 1);
      break;
    case -20470:
      *(void *)(a1 + 88) = *((void *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 1);
      break;
    case -20469:
      *(void *)(a1 + 56) = *((void *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 1);
      break;
    case -20468:
      *(void *)(a1 + 120) = *((void *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 1);
      break;
    case -20467:
      *(void *)(a1 + 112) = *((void *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 1);
      break;
    case -20466:
      v7.i32[0] = *((_DWORD *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 2);
      *(_DWORD *)(a1 + 128) = v7.i32[0];
      break;
    case -20465:
      v7.i32[0] = *((_DWORD *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 2);
      *(_DWORD *)(a1 + 132) = v7.i32[0];
      break;
    case -20464:
      *(void *)(a1 + 80) = *((void *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 1);
      break;
    case -20463:
      v7.i32[0] = *((_DWORD *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 2);
      *(_DWORD *)(a1 + 136) = v7.i32[0];
      break;
    case -20462:
      v7.i32[0] = *((_DWORD *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 2);
      *(_DWORD *)(a1 + 140) = v7.i32[0];
      break;
    case -20461:
      *(void *)(a1 + 96) = *((void *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 1);
      break;
    case -20460:
      v7.i32[0] = *((_DWORD *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 2);
      *(_DWORD *)(a1 + 144) = v7.i32[0];
      break;
    case -20459:
      *(unsigned char *)(a1 + 149) = *((_DWORD *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 2);
      break;
    case -20458:
      *(void *)(a1 + 24) = *a3;
      break;
    case -20457:
      *(unsigned char *)(a1 + 149) = 0;
      break;
    case -20456:
      *(void *)(a1 + 104) = *((void *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 1);
      break;
    default:
      if (v6 == -18430)
      {
        *(unsigned char *)(a1 + 150) = *((void *)GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2) + 1);
      }
      else if (v6 == -18431)
      {
        uint64_t v8 = GTTraceFunc_argumentBytesWithMap(a3, *((unsigned __int8 *)a3 + 13), a2);
        uint64_t v9 = *a3;
        uint64_t v10 = *(void *)v8;
        *(void *)(a1 + 8) = *((void *)v8 + 1);
        *(void *)(a1 + 16) = v9;
        *(_DWORD *)(a1 + 4) = *((_DWORD *)a3 + 2);
        *(void *)(a1 + 40) = v10;
        uint64_t v11 = GTTraceFunc_argumentBytesWithMap(a3, v8[16], a2);
        *(void *)(a1 + 48) = v11;
        *(void *)(a1 + 128) = 0;
        uint64x2_t v12 = *((uint64x2_t *)v11 + 1);
        *(uint64x2_t *)(a1 + 112) = v12;
        float32x2_t v7 = vneg_f32(vcvt_f32_f64(vcvtq_f64_u64(v12)));
        *(float32x2_t *)(a1 + 136) = v7;
        *(_DWORD *)(a1 + 144) = 1065353216;
        *(_WORD *)(a1 + 148) = 257;
      }
      break;
  }
  return v7.f32[0];
}

void *GTMTLSMRenderPipelineState_resourceAccess(void *a1, uint64_t a2, uint64_t a3)
{
  memset(v16, 0, sizeof(v16));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v8 = 0u;
  uint64_t v9 = 0;
  LODWORD(v8) = 71;
  uint64_t v10 = -1;
  long long v15 = 0xFFFFFFFFFFFFFFFFLL;
  if (a2 && (uint64_t v5 = *(void *)(a2 + 32)) != 0 && (*(unsigned char *)(v5 + 79) & 8) != 0) {
    int v6 = (uint64_t *)(v5 + 64);
  }
  else {
    int v6 = 0;
  }
  GTMTLSMRenderPipelineState_processTraceFuncWithMap((char *)&v8, a3, v6);
  return memcpy(a1, (char *)v16 + 8, 0x118uLL);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return _CFStringCreateWithFileSystemRepresentation(alloc, buffer);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return _CFUUIDCreateFromString(alloc, uuidStr);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return _CGColorSpaceCreateWithPropertyList(plist);
}

uint64_t DeleteAllArchives()
{
  return _DeleteAllArchives();
}

uint64_t GRCCopyAllCounterSourceGroup()
{
  return _GRCCopyAllCounterSourceGroup();
}

uint64_t GRCReleaseAllCounterSourceGroup()
{
  return _GRCReleaseAllCounterSourceGroup();
}

uint64_t GTDeviceCapabilities_fromDevice()
{
  return _GTDeviceCapabilities_fromDevice();
}

uint64_t GTDeviceCapabilities_isAGX()
{
  return _GTDeviceCapabilities_isAGX();
}

uint64_t GTDeviceCapabilities_isAGX1()
{
  return _GTDeviceCapabilities_isAGX1();
}

uint64_t GTDeviceCapabilities_isAGX2()
{
  return _GTDeviceCapabilities_isAGX2();
}

uint64_t GTDeviceCapabilities_isAGX3()
{
  return _GTDeviceCapabilities_isAGX3();
}

uint64_t GTMTLDeviceCapabilitiesQuery()
{
  return _GTMTLDeviceCapabilitiesQuery();
}

uint64_t GTMTLDeviceCapabilitiesSize()
{
  return _GTMTLDeviceCapabilitiesSize();
}

uint64_t GTTransportArchiveDirectory()
{
  return _GTTransportArchiveDirectory();
}

uint64_t GTTransportServiceDaemonConnectionNew()
{
  return _GTTransportServiceDaemonConnectionNew();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

uint64_t IOReportChannelGetChannelID()
{
  return _IOReportChannelGetChannelID();
}

uint64_t IOReportChannelGetChannelName()
{
  return _IOReportChannelGetChannelName();
}

uint64_t IOReportChannelGetFormat()
{
  return _IOReportChannelGetFormat();
}

uint64_t IOReportChannelGetGroup()
{
  return _IOReportChannelGetGroup();
}

uint64_t IOReportChannelGetSubGroup()
{
  return _IOReportChannelGetSubGroup();
}

uint64_t IOReportChannelGetUnit()
{
  return _IOReportChannelGetUnit();
}

uint64_t IOReportChannelGetUnitLabel()
{
  return _IOReportChannelGetUnitLabel();
}

uint64_t IOReportCopyChannelsInCategories()
{
  return _IOReportCopyChannelsInCategories();
}

uint64_t IOReportCreateSamples()
{
  return _IOReportCreateSamples();
}

uint64_t IOReportCreateSamplesDelta()
{
  return _IOReportCreateSamplesDelta();
}

uint64_t IOReportCreateSubscription()
{
  return _IOReportCreateSubscription();
}

uint64_t IOReportGetChannelCount()
{
  return _IOReportGetChannelCount();
}

uint64_t IOReportIterate()
{
  return _IOReportIterate();
}

uint64_t IOReportPrune()
{
  return _IOReportPrune();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return _IOReportSimpleGetIntegerValue();
}

uint64_t IOReportStateGetCount()
{
  return _IOReportStateGetCount();
}

uint64_t IOReportStateGetCurrent()
{
  return _IOReportStateGetCurrent();
}

uint64_t IOReportStateGetInTransitions()
{
  return _IOReportStateGetInTransitions();
}

uint64_t IOReportStateGetNameForIndex()
{
  return _IOReportStateGetNameForIndex();
}

uint64_t IOReportStateGetResidency()
{
  return _IOReportStateGetResidency();
}

uint64_t IOReportUpdateSamples()
{
  return _IOReportUpdateSamples();
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return _IOSurfaceCreate(properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return _IOSurfaceGetAllocSize(buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetBaseAddressOfPlane(buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetBytesPerElementOfPlane(buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetBytesPerRowOfPlane(buffer, planeIndex);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetHeightOfPlane(buffer, planeIndex);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return _IOSurfaceGetPlaneCount(buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetWidthOfPlane(buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceLock(buffer, options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceUnlock(buffer, options, seed);
}

JSObjectRef JSContextGetGlobalObject(JSContextRef ctx)
{
  return _JSContextGetGlobalObject(ctx);
}

JSValueRef JSObjectCallAsFunction(JSContextRef ctx, JSObjectRef object, JSObjectRef thisObject, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return _JSObjectCallAsFunction(ctx, object, thisObject, argumentCount, arguments, exception);
}

JSValueRef JSObjectGetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef *exception)
{
  return _JSObjectGetProperty(ctx, object, propertyName, exception);
}

JSObjectRef JSObjectMakeArray(JSContextRef ctx, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return _JSObjectMakeArray(ctx, argumentCount, arguments, exception);
}

void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef *exception)
{
}

void JSObjectSetPropertyAtIndex(JSContextRef ctx, JSObjectRef object, unsigned int propertyIndex, JSValueRef value, JSValueRef *exception)
{
}

JSStringRef JSStringCreateWithUTF8CString(const char *string)
{
  return _JSStringCreateWithUTF8CString(string);
}

size_t JSStringGetLength(JSStringRef string)
{
  return _JSStringGetLength(string);
}

size_t JSStringGetMaximumUTF8CStringSize(JSStringRef string)
{
  return _JSStringGetMaximumUTF8CStringSize(string);
}

size_t JSStringGetUTF8CString(JSStringRef string, char *buffer, size_t bufferSize)
{
  return _JSStringGetUTF8CString(string, buffer, bufferSize);
}

void JSStringRelease(JSStringRef string)
{
}

JSStringRef JSStringRetain(JSStringRef string)
{
  return _JSStringRetain(string);
}

JSStringRef JSValueCreateJSONString(JSContextRef ctx, JSValueRef value, unsigned int indent, JSValueRef *exception)
{
  return _JSValueCreateJSONString(ctx, value, indent, exception);
}

JSValueRef JSValueMakeFromJSONString(JSContextRef ctx, JSStringRef string)
{
  return _JSValueMakeFromJSONString(ctx, string);
}

JSValueRef JSValueMakeNumber(JSContextRef ctx, double number)
{
  return _JSValueMakeNumber(ctx, number);
}

double JSValueToNumber(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return _JSValueToNumber(ctx, value, exception);
}

JSObjectRef JSValueToObject(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return _JSValueToObject(ctx, value, exception);
}

JSStringRef JSValueToStringCopy(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return _JSValueToStringCopy(ctx, value, exception);
}

uint64_t LLVMInitializeAGX2ClauseAnalyzer()
{
  return _LLVMInitializeAGX2ClauseAnalyzer();
}

uint64_t LLVMInitializeAGX2Disassembler()
{
  return _LLVMInitializeAGX2Disassembler();
}

uint64_t LLVMInitializeAGX2TargetInfo()
{
  return _LLVMInitializeAGX2TargetInfo();
}

uint64_t LLVMInitializeAGX2TargetMC()
{
  return _LLVMInitializeAGX2TargetMC();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t MTLGetTextureLevelInfoForDeviceWithOptions()
{
  return _MTLGetTextureLevelInfoForDeviceWithOptions();
}

uint64_t MTLPixelFormatComputeTotalSizeUsed()
{
  return _MTLPixelFormatComputeTotalSizeUsed();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return _MTLPixelFormatGetInfoForDevice();
}

uint64_t MTLSetReportFailureBlock()
{
  return _MTLSetReportFailureBlock();
}

uint64_t MessagePathEndsWith()
{
  return _MessagePathEndsWith();
}

uint64_t MessagePathMerge()
{
  return _MessagePathMerge();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSIntersectionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSUnionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t lldb::SBDebugger::CreateTargetWithFileAndArch(lldb::SBDebugger *this, const char *a2, const char *a3)
{
  return lldb::SBDebugger::CreateTargetWithFileAndArch(this, a2, a3);
}

uint64_t lldb::SBDebugger::Create(lldb::SBDebugger *this)
{
  return lldb::SBDebugger::Create(this);
}

void lldb::SBDebugger::~SBDebugger(lldb::SBDebugger *this)
{
}

uint64_t lldb::SBFileSpec::SBFileSpec(lldb::SBFileSpec *this, const char *a2, BOOL a3)
{
  return lldb::SBFileSpec::SBFileSpec(this, a2, a3);
}

void lldb::SBFileSpec::~SBFileSpec(lldb::SBFileSpec *this)
{
}

uint64_t lldb::SBFileSpec::operator=()
{
  return lldb::SBFileSpec::operator=();
}

void lldb::SBFunction::~SBFunction(lldb::SBFunction *this)
{
}

void lldb::SBLineEntry::~SBLineEntry(lldb::SBLineEntry *this)
{
}

void lldb::SBCompileUnit::~SBCompileUnit(lldb::SBCompileUnit *this)
{
}

uint64_t lldb::SBBlock::GetParent(lldb::SBBlock *this)
{
  return lldb::SBBlock::GetParent(this);
}

uint64_t lldb::SBBlock::SBBlock(lldb::SBBlock *this)
{
  return lldb::SBBlock::SBBlock(this);
}

void lldb::SBBlock::~SBBlock(lldb::SBBlock *this)
{
}

uint64_t lldb::SBBlock::operator=()
{
  return lldb::SBBlock::operator=();
}

uint64_t lldb::SBModule::GetNumCompileUnits(lldb::SBModule *this)
{
  return lldb::SBModule::GetNumCompileUnits(this);
}

uint64_t lldb::SBModule::GetCompileUnitAtIndex(lldb::SBModule *this, unsigned int a2)
{
  return lldb::SBModule::GetCompileUnitAtIndex(this, a2);
}

uint64_t lldb::SBModule::SBModule(lldb::SBModule *this, const lldb::SBModule *a2)
{
  return lldb::SBModule::SBModule(this, a2);
}

void lldb::SBModule::~SBModule(lldb::SBModule *this)
{
}

void lldb::SBSymbol::~SBSymbol(lldb::SBSymbol *this)
{
}

uint64_t lldb::SBTarget::FindModule(lldb::SBTarget *this, const lldb::SBFileSpec *a2)
{
  return lldb::SBTarget::FindModule(this, a2);
}

void lldb::SBTarget::~SBTarget(lldb::SBTarget *this)
{
}

uint64_t lldb::SBAddress::GetFunction(lldb::SBAddress *this)
{
  return lldb::SBAddress::GetFunction(this);
}

uint64_t lldb::SBAddress::GetBlock(lldb::SBAddress *this)
{
  return lldb::SBAddress::GetBlock(this);
}

uint64_t lldb::SBAddress::GetSymbol(lldb::SBAddress *this)
{
  return lldb::SBAddress::GetSymbol(this);
}

void lldb::SBAddress::~SBAddress(lldb::SBAddress *this)
{
}

uint64_t llvm::LLVMContext::LLVMContext(llvm::LLVMContext *this)
{
  return llvm::LLVMContext::LLVMContext(this);
}

void llvm::LLVMContext::~LLVMContext(llvm::LLVMContext *this)
{
}

uint64_t llvm::raw_ostream::flush_nonempty(llvm::raw_ostream *this)
{
  return llvm::raw_ostream::flush_nonempty(this);
}

uint64_t llvm::raw_ostream::write(llvm::raw_ostream *this, const char *a2, unint64_t a3)
{
  return llvm::raw_ostream::write(this, a2, a3);
}

void llvm::raw_ostream::~raw_ostream(llvm::raw_ostream *this)
{
}

uint64_t llvm::raw_ostream::operator<<()
{
  return llvm::raw_ostream::operator<<();
}

{
  return llvm::raw_ostream::operator<<();
}

{
  return llvm::raw_ostream::operator<<();
}

uint64_t llvm::DIExpression::getFragmentInfo()
{
  return llvm::DIExpression::getFragmentInfo();
}

uint64_t llvm::DWARFContext::parseNormalUnits(llvm::DWARFContext *this)
{
  return llvm::DWARFContext::parseNormalUnits(this);
}

uint64_t llvm::DWARFContext::getLineTableForUnit(llvm::DWARFContext *a1, llvm::DWARFUnit *a2)
{
  return llvm::DWARFContext::getLineTableForUnit(a1, a2);
}

uint64_t llvm::DWARFContext::create()
{
  return llvm::DWARFContext::create();
}

uint64_t llvm::MemoryBuffer::getMemBuffer()
{
  return llvm::MemoryBuffer::getMemBuffer();
}

uint64_t llvm::MemoryBuffer::getMemBufferCopy()
{
  return llvm::MemoryBuffer::getMemBufferCopy();
}

uint64_t llvm::TargetRegistry::lookupTarget()
{
  return llvm::TargetRegistry::lookupTarget();
}

uint64_t llvm::raw_fd_ostream::raw_fd_ostream()
{
  return llvm::raw_fd_ostream::raw_fd_ostream();
}

void llvm::raw_fd_ostream::~raw_fd_ostream(llvm::raw_fd_ostream *this)
{
}

uint64_t llvm::DebugInfoFinder::processModule(llvm::DebugInfoFinder *a1, const llvm::Module *a2)
{
  return llvm::DebugInfoFinder::processModule(a1, a2);
}

uint64_t llvm::MCTargetOptions::MCTargetOptions(llvm::MCTargetOptions *this)
{
  return llvm::MCTargetOptions::MCTargetOptions(this);
}

uint64_t llvm::MCObjectFileInfo::initMCObjectFileInfo(llvm::MCObjectFileInfo *a1, llvm::MCContext *a2, BOOL a3, BOOL a4)
{
  return llvm::MCObjectFileInfo::initMCObjectFileInfo(a1, a2, a3, a4);
}

void llvm::MCObjectFileInfo::~MCObjectFileInfo(llvm::MCObjectFileInfo *this)
{
}

uint64_t llvm::agxclauseanalyzer::createObjInput()
{
  return llvm::agxclauseanalyzer::createObjInput();
}

uint64_t llvm::deallocate_buffer(llvm *this, void *a2, unint64_t a3, unint64_t a4)
{
  return llvm::deallocate_buffer(this, a2, a3, a4);
}

void llvm::Module::~Module(llvm::Module *this)
{
}

uint64_t llvm::Triple::setArch()
{
  return llvm::Triple::setArch();
}

uint64_t llvm::Triple::Triple()
{
  return llvm::Triple::Triple();
}

uint64_t llvm::object::createBinary()
{
  return llvm::object::createBinary();
}

{
  return llvm::object::createBinary();
}

uint64_t llvm::parseIR()
{
  return llvm::parseIR();
}

uint64_t llvm::DWARFUnit::getCompilationDir(llvm::DWARFUnit *this)
{
  return llvm::DWARFUnit::getCompilationDir(this);
}

uint64_t llvm::DWARFUnit::getSubroutineForAddress(llvm::DWARFUnit *this, unint64_t a2)
{
  return llvm::DWARFUnit::getSubroutineForAddress(this, a2);
}

uint64_t llvm::DWARFUnit::getInlinedChainForAddress()
{
  return llvm::DWARFUnit::getInlinedChainForAddress();
}

uint64_t llvm::MCContext::MCContext()
{
  return llvm::MCContext::MCContext();
}

void llvm::MCContext::~MCContext(llvm::MCContext *this)
{
}

uint64_t lldb::SBDebugger::IsValid(lldb::SBDebugger *this)
{
  return lldb::SBDebugger::IsValid(this);
}

uint64_t lldb::SBFileSpec::GetFilename(lldb::SBFileSpec *this)
{
  return lldb::SBFileSpec::GetFilename(this);
}

uint64_t lldb::SBFileSpec::GetDirectory(lldb::SBFileSpec *this)
{
  return lldb::SBFileSpec::GetDirectory(this);
}

uint64_t lldb::SBFunction::GetName(lldb::SBFunction *this)
{
  return lldb::SBFunction::GetName(this);
}

uint64_t lldb::SBLineEntry::GetFileSpec(lldb::SBLineEntry *this)
{
  return lldb::SBLineEntry::GetFileSpec(this);
}

uint64_t lldb::SBLineEntry::GetEndAddress(lldb::SBLineEntry *this)
{
  return lldb::SBLineEntry::GetEndAddress(this);
}

uint64_t lldb::SBLineEntry::GetStartAddress(lldb::SBLineEntry *this)
{
  return lldb::SBLineEntry::GetStartAddress(this);
}

uint64_t lldb::SBLineEntry::GetLine(lldb::SBLineEntry *this)
{
  return lldb::SBLineEntry::GetLine(this);
}

uint64_t lldb::SBLineEntry::GetColumn(lldb::SBLineEntry *this)
{
  return lldb::SBLineEntry::GetColumn(this);
}

uint64_t lldb::SBCompileUnit::GetFileSpec(lldb::SBCompileUnit *this)
{
  return lldb::SBCompileUnit::GetFileSpec(this);
}

uint64_t lldb::SBCompileUnit::GetNumLineEntries(lldb::SBCompileUnit *this)
{
  return lldb::SBCompileUnit::GetNumLineEntries(this);
}

uint64_t lldb::SBCompileUnit::GetLineEntryAtIndex(lldb::SBCompileUnit *this)
{
  return lldb::SBCompileUnit::GetLineEntryAtIndex(this);
}

uint64_t lldb::SBBlock::GetInlinedName(lldb::SBBlock *this)
{
  return lldb::SBBlock::GetInlinedName(this);
}

uint64_t lldb::SBBlock::GetInlinedCallSiteFile(lldb::SBBlock *this)
{
  return lldb::SBBlock::GetInlinedCallSiteFile(this);
}

uint64_t lldb::SBBlock::GetInlinedCallSiteLine(lldb::SBBlock *this)
{
  return lldb::SBBlock::GetInlinedCallSiteLine(this);
}

uint64_t lldb::SBBlock::IsInlined(lldb::SBBlock *this)
{
  return lldb::SBBlock::IsInlined(this);
}

uint64_t lldb::SBSymbol::GetName(lldb::SBSymbol *this)
{
  return lldb::SBSymbol::GetName(this);
}

uint64_t lldb::SBTarget::IsValid(lldb::SBTarget *this)
{
  return lldb::SBTarget::IsValid(this);
}

uint64_t lldb::SBAddress::GetFileAddress(lldb::SBAddress *this)
{
  return lldb::SBAddress::GetFileAddress(this);
}

uint64_t llvm::DISubrange::getLowerBound(llvm::DISubrange *this)
{
  return llvm::DISubrange::getLowerBound(this);
}

uint64_t llvm::DISubrange::getCount(llvm::DISubrange *this)
{
  return llvm::DISubrange::getCount(this);
}

uint64_t llvm::NamedMDNode::getOperand(llvm::NamedMDNode *this)
{
  return llvm::NamedMDNode::getOperand(this);
}

uint64_t llvm::NamedMDNode::getNumOperands(llvm::NamedMDNode *this)
{
  return llvm::NamedMDNode::getNumOperands(this);
}

uint64_t llvm::DILocalScope::getSubprogram(llvm::DILocalScope *this)
{
  return llvm::DILocalScope::getSubprogram(this);
}

uint64_t llvm::MemoryBuffer::getMemBufferRef(llvm::MemoryBuffer *this)
{
  return llvm::MemoryBuffer::getMemBufferRef(this);
}

uint64_t llvm::DWARFDebugLine::Prologue::getFileNameByIndex()
{
  return llvm::DWARFDebugLine::Prologue::getFileNameByIndex();
}

uint64_t llvm::DWARFFormValue::getAsUnsignedConstant(llvm::DWARFFormValue *this)
{
  return llvm::DWARFFormValue::getAsUnsignedConstant(this);
}

uint64_t llvm::SubtargetFeatures::getString(llvm::SubtargetFeatures *this)
{
  return llvm::SubtargetFeatures::getString(this);
}

uint64_t llvm::agxclauseanalyzer::InstrClause::getSizeInBytes(llvm::agxclauseanalyzer::InstrClause *this)
{
  return llvm::agxclauseanalyzer::InstrClause::getSizeInBytes(this);
}

uint64_t llvm::agxclauseanalyzer::InstrClause::getOffset(llvm::agxclauseanalyzer::InstrClause *this)
{
  return llvm::agxclauseanalyzer::InstrClause::getOffset(this);
}

uint64_t llvm::agxclauseanalyzer::InstrStream::getSizeInBytes(llvm::agxclauseanalyzer::InstrStream *this)
{
  return llvm::agxclauseanalyzer::InstrStream::getSizeInBytes(this);
}

uint64_t llvm::DINode::getTag(llvm::DINode *this)
{
  return llvm::DINode::getTag(this);
}

uint64_t llvm::Module::getNamedMetadata()
{
  return llvm::Module::getNamedMetadata();
}

uint64_t llvm::Module::getGlobalVariable()
{
  return llvm::Module::getGlobalVariable();
}

uint64_t llvm::DWARFDie::getDeclLine(llvm::DWARFDie *this)
{
  return llvm::DWARFDie::getDeclLine(this);
}

uint64_t llvm::DWARFDie::getCallerFrame(llvm::DWARFDie *this, unsigned int *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  return llvm::DWARFDie::getCallerFrame(this, a2, a3, a4, a5);
}

uint64_t llvm::DWARFDie::findRecursively()
{
  return llvm::DWARFDie::findRecursively();
}

uint64_t llvm::DWARFDie::getLowAndHighPC(llvm::DWARFDie *this, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  return llvm::DWARFDie::getLowAndHighPC(this, a2, a3, a4);
}

uint64_t llvm::DWARFDie::getName()
{
  return llvm::DWARFDie::getName();
}

uint64_t llvm::MDString::getString(llvm::MDString *this)
{
  return llvm::MDString::getString(this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::erase(this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::sentry::sentry()
{
  return std::istream::sentry::sentry();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

uint64_t std::ostream::put()
{
  return std::ostream::put();
}

uint64_t std::ostream::flush()
{
  return std::ostream::flush();
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return std::__thread_struct::__thread_struct(this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

const std::error_category *std::system_category(void)
{
  return std::system_category();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return std::__thread_local_data();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

BOOL std::mutex::try_lock(std::mutex *this)
{
  return std::mutex::try_lock(this);
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
}

uint64_t std::__sort<std::__less<unsigned long long,unsigned long long> &,unsigned long long *>()
{
  return std::__sort<std::__less<unsigned long long,unsigned long long> &,unsigned long long *>();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return std::chrono::steady_clock::now();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return std::chrono::system_clock::now();
}

void std::locale::~locale(std::locale *this)
{
}

unsigned int std::thread::hardware_concurrency(void)
{
  return std::thread::hardware_concurrency();
}

void std::thread::join(std::thread *this)
{
}

void std::thread::detach(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  return ___invert_f4(a1);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return __dyld_get_image_name(image_index);
}

uint32_t _dyld_image_count(void)
{
  return __dyld_image_count();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void _tlv_atexit(void (__cdecl *termFunc)(void *), void *objAddr)
{
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

int backtrace(void **a1, int a2)
{
  return _backtrace(a1, a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return _bsearch(__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return _compression_decode_scratch_buffer_size(algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_encode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return _compression_encode_scratch_buffer_size(algorithm);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return _dispatch_data_create_concat(data1, data2);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return _dispatch_data_get_size(data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return _dispatch_queue_attr_make_with_overcommit();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return _dispatch_source_get_handle(source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fgetc(FILE *a1)
{
  return _fgetc(a1);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

const char *__cdecl gai_strerror(int a1)
{
  return _gai_strerror(a1);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

int getrlimit(int a1, rlimit *a2)
{
  return _getrlimit(a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return _mach_make_memory_entry_64(target_task, size, offset, permission, object_handle, parent_entry);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_posix_memalign(memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

long double modf(long double __x, long double *__y)
{
  return _modf(__x, __y);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

size_t os_proc_available_memory(void)
{
  return _os_proc_available_memory();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return _poll(a1, a2, a3);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return _pthread_cond_broadcast(a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return _pthread_equal(a1, a2);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_rdlock(a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_unlock(a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_wrlock(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return _pthread_setschedparam(a1, a2, a3);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return _pthread_threadid_np(a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int raise(int a1)
{
  return _raise(a1);
}

int rand(void)
{
  return _rand();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

uint64_t registerService()
{
  return _registerService();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

int sched_get_priority_max(int a1)
{
  return _sched_get_priority_max(a1);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

int setrlimit(int a1, const rlimit *a2)
{
  return _setrlimit(a1, a2);
}

int shm_open(const char *a1, int a2, ...)
{
  return _shm_open(a1, a2);
}

int shm_unlink(const char *a1)
{
  return _shm_unlink(a1);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return _strerror_r(__errnum, __strerrbuf, __buflen);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strsignal(int __sig)
{
  return _strsignal(__sig);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return _vm_copy(target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return _vm_map(target_task, address, size, mask, flags, object, offset, copy, cur_protection, max_protection, inheritance);
}

kern_return_t vm_protect(vm_map_t target_task, vm_address_t address, vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return _vm_protect(target_task, address, size, set_maximum, new_protection);
}

kern_return_t vm_remap(vm_map_t target_task, vm_address_t *target_address, vm_size_t size, vm_address_t mask, int flags, vm_map_t src_task, vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return _vm_remap(target_task, target_address, size, mask, flags, src_task, src_address, copy, cur_protection, max_protection, inheritance);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

id objc_msgSend_GPUEndTime(void *a1, const char *a2, ...)
{
  return [a1 GPUEndTime];
}

id objc_msgSend_GPUStartTime(void *a1, const char *a2, ...)
{
  return [a1 GPUStartTime];
}

id objc_msgSend_GTGPUToolsData(void *a1, const char *a2, ...)
{
  return [a1 GTGPUToolsData];
}

id objc_msgSend_JSGlobalContextRef(void *a1, const char *a2, ...)
{
  return [a1 JSGlobalContextRef];
}

id objc_msgSend_JSValueRef(void *a1, const char *a2, ...)
{
  return [a1 JSValueRef];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__allocateMessageBuffer(void *a1, const char *a2, ...)
{
  return [a1 _allocateMessageBuffer];
}

id objc_msgSend__build(void *a1, const char *a2, ...)
{
  return [a1 _build];
}

id objc_msgSend__calculateAggregatedEffectiveGPUEncoderCost(void *a1, const char *a2, ...)
{
  return [a1 _calculateAggregatedEffectiveGPUEncoderCost];
}

id objc_msgSend__calculateAverageGPUCommandDuration(void *a1, const char *a2, ...)
{
  return [a1 _calculateAverageGPUCommandDuration];
}

id objc_msgSend__callCancellationHandler(void *a1, const char *a2, ...)
{
  return [a1 _callCancellationHandler];
}

id objc_msgSend__callRegistrationHandler(void *a1, const char *a2, ...)
{
  return [a1 _callRegistrationHandler];
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return [a1 _cancel];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return [a1 _cleanup];
}

id objc_msgSend__clearBuffers(void *a1, const char *a2, ...)
{
  return [a1 _clearBuffers];
}

id objc_msgSend__clearCache(void *a1, const char *a2, ...)
{
  return [a1 _clearCache];
}

id objc_msgSend__clearData(void *a1, const char *a2, ...)
{
  return [a1 _clearData];
}

id objc_msgSend__collectOperatingPoints(void *a1, const char *a2, ...)
{
  return [a1 _collectOperatingPoints];
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return [a1 _commonInit];
}

id objc_msgSend__computeBytesAvailableToRead(void *a1, const char *a2, ...)
{
  return [a1 _computeBytesAvailableToRead];
}

id objc_msgSend__computeBytesAvailableToWrite(void *a1, const char *a2, ...)
{
  return [a1 _computeBytesAvailableToWrite];
}

id objc_msgSend__costHeaders(void *a1, const char *a2, ...)
{
  return [a1 _costHeaders];
}

id objc_msgSend__dequeueIncomingMessages(void *a1, const char *a2, ...)
{
  return [a1 _dequeueIncomingMessages];
}

id objc_msgSend__dequeuePacket(void *a1, const char *a2, ...)
{
  return [a1 _dequeuePacket];
}

id objc_msgSend__destroySharedMemoryTransport(void *a1, const char *a2, ...)
{
  return [a1 _destroySharedMemoryTransport];
}

id objc_msgSend__handlePerDrawCounterData(void *a1, const char *a2, ...)
{
  return [a1 _handlePerDrawCounterData];
}

id objc_msgSend__initGTPM(void *a1, const char *a2, ...)
{
  return [a1 _initGTPM];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__nextMessageSerial(void *a1, const char *a2, ...)
{
  return [a1 _nextMessageSerial];
}

id objc_msgSend__productType(void *a1, const char *a2, ...)
{
  return [a1 _productType];
}

id objc_msgSend__readAndAccumulate(void *a1, const char *a2, ...)
{
  return [a1 _readAndAccumulate];
}

id objc_msgSend__readAndAccumulateLoop(void *a1, const char *a2, ...)
{
  return [a1 _readAndAccumulateLoop];
}

id objc_msgSend__register(void *a1, const char *a2, ...)
{
  return [a1 _register];
}

id objc_msgSend__setupDataPath(void *a1, const char *a2, ...)
{
  return [a1 _setupDataPath];
}

id objc_msgSend__setupIOBuffers(void *a1, const char *a2, ...)
{
  return [a1 _setupIOBuffers];
}

id objc_msgSend__targetType(void *a1, const char *a2, ...)
{
  return [a1 _targetType];
}

id objc_msgSend__tearDownSharedMemory(void *a1, const char *a2, ...)
{
  return [a1 _tearDownSharedMemory];
}

id objc_msgSend__traceHeaders(void *a1, const char *a2, ...)
{
  return [a1 _traceHeaders];
}

id objc_msgSend__unpackAndDispatchMessage(void *a1, const char *a2, ...)
{
  return [a1 _unpackAndDispatchMessage];
}

id objc_msgSend__version(void *a1, const char *a2, ...)
{
  return [a1 _version];
}

id objc_msgSend__waitEAGAIN(void *a1, const char *a2, ...)
{
  return [a1 _waitEAGAIN];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accelerationStructureCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 accelerationStructureCommandEncoder];
}

id objc_msgSend_accelerationStructurePassDescriptorMap(void *a1, const char *a2, ...)
{
  return [a1 accelerationStructurePassDescriptorMap];
}

id objc_msgSend_acceleratorPort(void *a1, const char *a2, ...)
{
  return [a1 acceleratorPort];
}

id objc_msgSend_access(void *a1, const char *a2, ...)
{
  return [a1 access];
}

id objc_msgSend_activeProcessorCount(void *a1, const char *a2, ...)
{
  return [a1 activeProcessorCount];
}

id objc_msgSend_activeShadersPerPeriodicSample(void *a1, const char *a2, ...)
{
  return [a1 activeShadersPerPeriodicSample];
}

id objc_msgSend_additionalCompilerArguments(void *a1, const char *a2, ...)
{
  return [a1 additionalCompilerArguments];
}

id objc_msgSend_addressSpace(void *a1, const char *a2, ...)
{
  return [a1 addressSpace];
}

id objc_msgSend_adjustHWBiasAndFinalizeResult(void *a1, const char *a2, ...)
{
  return [a1 adjustHWBiasAndFinalizeResult];
}

id objc_msgSend_aggregatedGPUTimelineInfo(void *a1, const char *a2, ...)
{
  return [a1 aggregatedGPUTimelineInfo];
}

id objc_msgSend_airMDType(void *a1, const char *a2, ...)
{
  return [a1 airMDType];
}

id objc_msgSend_aliasImplicitImageBlock(void *a1, const char *a2, ...)
{
  return [a1 aliasImplicitImageBlock];
}

id objc_msgSend_aliasImplicitImageBlockRenderTarget(void *a1, const char *a2, ...)
{
  return [a1 aliasImplicitImageBlockRenderTarget];
}

id objc_msgSend_alignment(void *a1, const char *a2, ...)
{
  return [a1 alignment];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allShaderKeys(void *a1, const char *a2, ...)
{
  return [a1 allShaderKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allocNewContext(void *a1, const char *a2, ...)
{
  return [a1 allocNewContext];
}

id objc_msgSend_allocatedSize(void *a1, const char *a2, ...)
{
  return [a1 allocatedSize];
}

id objc_msgSend_allowGPUOptimizedContents(void *a1, const char *a2, ...)
{
  return [a1 allowGPUOptimizedContents];
}

id objc_msgSend_allowLibrariesFromOtherPlatforms(void *a1, const char *a2, ...)
{
  return [a1 allowLibrariesFromOtherPlatforms];
}

id objc_msgSend_allowedClasses(void *a1, const char *a2, ...)
{
  return [a1 allowedClasses];
}

id objc_msgSend_allowsKeyedCoding(void *a1, const char *a2, ...)
{
  return [a1 allowsKeyedCoding];
}

id objc_msgSend_aluType(void *a1, const char *a2, ...)
{
  return [a1 aluType];
}

id objc_msgSend_amplificationID(void *a1, const char *a2, ...)
{
  return [a1 amplificationID];
}

id objc_msgSend_analyzerResult(void *a1, const char *a2, ...)
{
  return [a1 analyzerResult];
}

id objc_msgSend_anchor(void *a1, const char *a2, ...)
{
  return [a1 anchor];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return [a1 anchorPoint];
}

id objc_msgSend_archivedAPSCounterData(void *a1, const char *a2, ...)
{
  return [a1 archivedAPSCounterData];
}

id objc_msgSend_archivedAPSData(void *a1, const char *a2, ...)
{
  return [a1 archivedAPSData];
}

id objc_msgSend_archivedAPSTimelineData(void *a1, const char *a2, ...)
{
  return [a1 archivedAPSTimelineData];
}

id objc_msgSend_archivedBatchIdFilteredCounterData(void *a1, const char *a2, ...)
{
  return [a1 archivedBatchIdFilteredCounterData];
}

id objc_msgSend_archivedGPUTimelineData(void *a1, const char *a2, ...)
{
  return [a1 archivedGPUTimelineData];
}

id objc_msgSend_archivedShaderProfilerData(void *a1, const char *a2, ...)
{
  return [a1 archivedShaderProfilerData];
}

id objc_msgSend_argumentBuffersSupport(void *a1, const char *a2, ...)
{
  return [a1 argumentBuffersSupport];
}

id objc_msgSend_argumentIndex(void *a1, const char *a2, ...)
{
  return [a1 argumentIndex];
}

id objc_msgSend_argumentIndexStride(void *a1, const char *a2, ...)
{
  return [a1 argumentIndexStride];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_arrayLength(void *a1, const char *a2, ...)
{
  return [a1 arrayLength];
}

id objc_msgSend_arrayType(void *a1, const char *a2, ...)
{
  return [a1 arrayType];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_availableCounters(void *a1, const char *a2, ...)
{
  return [a1 availableCounters];
}

id objc_msgSend_averagePerDrawKickDurations(void *a1, const char *a2, ...)
{
  return [a1 averagePerDrawKickDurations];
}

id objc_msgSend_backFaceStencil(void *a1, const char *a2, ...)
{
  return [a1 backFaceStencil];
}

id objc_msgSend_baseInstance(void *a1, const char *a2, ...)
{
  return [a1 baseInstance];
}

id objc_msgSend_baseVertex(void *a1, const char *a2, ...)
{
  return [a1 baseVertex];
}

id objc_msgSend_batchIdFilterableCounters(void *a1, const char *a2, ...)
{
  return [a1 batchIdFilterableCounters];
}

id objc_msgSend_binaries(void *a1, const char *a2, ...)
{
  return [a1 binaries];
}

id objc_msgSend_binary(void *a1, const char *a2, ...)
{
  return [a1 binary];
}

id objc_msgSend_binaryLocationCount(void *a1, const char *a2, ...)
{
  return [a1 binaryLocationCount];
}

id objc_msgSend_binaryLocationData(void *a1, const char *a2, ...)
{
  return [a1 binaryLocationData];
}

id objc_msgSend_binaryMappingsEncoderInternal(void *a1, const char *a2, ...)
{
  return [a1 binaryMappingsEncoderInternal];
}

id objc_msgSend_binaryMappingsPerInvocation(void *a1, const char *a2, ...)
{
  return [a1 binaryMappingsPerInvocation];
}

id objc_msgSend_binaryRangeCount(void *a1, const char *a2, ...)
{
  return [a1 binaryRangeCount];
}

id objc_msgSend_binaryRangeData(void *a1, const char *a2, ...)
{
  return [a1 binaryRangeData];
}

id objc_msgSend_binaryUniqueId(void *a1, const char *a2, ...)
{
  return [a1 binaryUniqueId];
}

id objc_msgSend_bindings(void *a1, const char *a2, ...)
{
  return [a1 bindings];
}

id objc_msgSend_bitcodeData(void *a1, const char *a2, ...)
{
  return [a1 bitcodeData];
}

id objc_msgSend_blitCallCount(void *a1, const char *a2, ...)
{
  return [a1 blitCallCount];
}

id objc_msgSend_blitCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 blitCommandEncoder];
}

id objc_msgSend_blitEncoderTimeInfo(void *a1, const char *a2, ...)
{
  return [a1 blitEncoderTimeInfo];
}

id objc_msgSend_blitPassDescriptorMap(void *a1, const char *a2, ...)
{
  return [a1 blitPassDescriptorMap];
}

id objc_msgSend_blitTimeData(void *a1, const char *a2, ...)
{
  return [a1 blitTimeData];
}

id objc_msgSend_BOOLResult(void *a1, const char *a2, ...)
{
  return [a1 BOOLResult];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_borderColor(void *a1, const char *a2, ...)
{
  return [a1 borderColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_branchTargetCount(void *a1, const char *a2, ...)
{
  return [a1 branchTargetCount];
}

id objc_msgSend_branchTargetData(void *a1, const char *a2, ...)
{
  return [a1 branchTargetData];
}

id objc_msgSend_broadcast(void *a1, const char *a2, ...)
{
  return [a1 broadcast];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_bufferAlignment(void *a1, const char *a2, ...)
{
  return [a1 bufferAlignment];
}

id objc_msgSend_bufferDataSize(void *a1, const char *a2, ...)
{
  return [a1 bufferDataSize];
}

id objc_msgSend_bufferDataType(void *a1, const char *a2, ...)
{
  return [a1 bufferDataType];
}

id objc_msgSend_bufferStructType(void *a1, const char *a2, ...)
{
  return [a1 bufferStructType];
}

id objc_msgSend_buffers(void *a1, const char *a2, ...)
{
  return [a1 buffers];
}

id objc_msgSend_buildDrawCallIndexMap(void *a1, const char *a2, ...)
{
  return [a1 buildDrawCallIndexMap];
}

id objc_msgSend_builtInDataType(void *a1, const char *a2, ...)
{
  return [a1 builtInDataType];
}

id objc_msgSend_builtInType(void *a1, const char *a2, ...)
{
  return [a1 builtInType];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_clauseCount(void *a1, const char *a2, ...)
{
  return [a1 clauseCount];
}

id objc_msgSend_clauseData(void *a1, const char *a2, ...)
{
  return [a1 clauseData];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_cleanupLocalFiles(void *a1, const char *a2, ...)
{
  return [a1 cleanupLocalFiles];
}

id objc_msgSend_clearCommandBuffer(void *a1, const char *a2, ...)
{
  return [a1 clearCommandBuffer];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_closeSocketDescriptor(void *a1, const char *a2, ...)
{
  return [a1 closeSocketDescriptor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorTexture(void *a1, const char *a2, ...)
{
  return [a1 colorTexture];
}

id objc_msgSend_colorTextureFormat(void *a1, const char *a2, ...)
{
  return [a1 colorTextureFormat];
}

id objc_msgSend_colorTextureUsage(void *a1, const char *a2, ...)
{
  return [a1 colorTextureUsage];
}

id objc_msgSend_colorspace(void *a1, const char *a2, ...)
{
  return [a1 colorspace];
}

id objc_msgSend_column(void *a1, const char *a2, ...)
{
  return [a1 column];
}

id objc_msgSend_commandBatchIdOffset(void *a1, const char *a2, ...)
{
  return [a1 commandBatchIdOffset];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commandBufferInfoCount(void *a1, const char *a2, ...)
{
  return [a1 commandBufferInfoCount];
}

id objc_msgSend_commandBufferInfoData(void *a1, const char *a2, ...)
{
  return [a1 commandBufferInfoData];
}

id objc_msgSend_commandBufferWithUnretainedReferences(void *a1, const char *a2, ...)
{
  return [a1 commandBufferWithUnretainedReferences];
}

id objc_msgSend_commandBuffers(void *a1, const char *a2, ...)
{
  return [a1 commandBuffers];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_commitAndWaitUntilSubmitted(void *a1, const char *a2, ...)
{
  return [a1 commitAndWaitUntilSubmitted];
}

id objc_msgSend_commitCommandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commitCommandBuffer];
}

id objc_msgSend_commitCommandBuffers(void *a1, const char *a2, ...)
{
  return [a1 commitCommandBuffers];
}

id objc_msgSend_compareFunction(void *a1, const char *a2, ...)
{
  return [a1 compareFunction];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_compressionFootprint(void *a1, const char *a2, ...)
{
  return [a1 compressionFootprint];
}

id objc_msgSend_compressionType(void *a1, const char *a2, ...)
{
  return [a1 compressionType];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_computeFunction(void *a1, const char *a2, ...)
{
  return [a1 computeFunction];
}

id objc_msgSend_computePassDescriptorMap(void *a1, const char *a2, ...)
{
  return [a1 computePassDescriptorMap];
}

id objc_msgSend_computePipelineDescriptorMap(void *a1, const char *a2, ...)
{
  return [a1 computePipelineDescriptorMap];
}

id objc_msgSend_computeTiming(void *a1, const char *a2, ...)
{
  return [a1 computeTiming];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_constantSamplerDescriptors(void *a1, const char *a2, ...)
{
  return [a1 constantSamplerDescriptors];
}

id objc_msgSend_constantSamplerUniqueIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 constantSamplerUniqueIdentifiers];
}

id objc_msgSend_contentRect(void *a1, const char *a2, ...)
{
  return [a1 contentRect];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_contentsScale(void *a1, const char *a2, ...)
{
  return [a1 contentsScale];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_controlPointIndexBufferVirtualAddress(void *a1, const char *a2, ...)
{
  return [a1 controlPointIndexBufferVirtualAddress];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreCounts(void *a1, const char *a2, ...)
{
  return [a1 coreCounts];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counterInfo(void *a1, const char *a2, ...)
{
  return [a1 counterInfo];
}

id objc_msgSend_counterNames(void *a1, const char *a2, ...)
{
  return [a1 counterNames];
}

id objc_msgSend_counterSets(void *a1, const char *a2, ...)
{
  return [a1 counterSets];
}

id objc_msgSend_counterValueType(void *a1, const char *a2, ...)
{
  return [a1 counterValueType];
}

id objc_msgSend_counters(void *a1, const char *a2, ...)
{
  return [a1 counters];
}

id objc_msgSend_cpuCacheMode(void *a1, const char *a2, ...)
{
  return [a1 cpuCacheMode];
}

id objc_msgSend_cpuType(void *a1, const char *a2, ...)
{
  return [a1 cpuType];
}

id objc_msgSend_currentAllocatedSize(void *a1, const char *a2, ...)
{
  return [a1 currentAllocatedSize];
}

id objc_msgSend_currentPerformanceState(void *a1, const char *a2, ...)
{
  return [a1 currentPerformanceState];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSize(void *a1, const char *a2, ...)
{
  return [a1 dataSize];
}

id objc_msgSend_dataSourceHasUnusedResources(void *a1, const char *a2, ...)
{
  return [a1 dataSourceHasUnusedResources];
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return [a1 dataType];
}

id objc_msgSend_dataTypeDescription(void *a1, const char *a2, ...)
{
  return [a1 dataTypeDescription];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 debugCommandEncoder];
}

id objc_msgSend_debugSignposts(void *a1, const char *a2, ...)
{
  return [a1 debugSignposts];
}

id objc_msgSend_defaultBufferCapacity(void *a1, const char *a2, ...)
{
  return [a1 defaultBufferCapacity];
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return [a1 defaultCStringEncoding];
}

id objc_msgSend_defaultCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 defaultCommandQueue];
}

id objc_msgSend_defaultDevice(void *a1, const char *a2, ...)
{
  return [a1 defaultDevice];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_depth(void *a1, const char *a2, ...)
{
  return [a1 depth];
}

id objc_msgSend_depthAttachment(void *a1, const char *a2, ...)
{
  return [a1 depthAttachment];
}

id objc_msgSend_depthStencil(void *a1, const char *a2, ...)
{
  return [a1 depthStencil];
}

id objc_msgSend_depthTexture(void *a1, const char *a2, ...)
{
  return [a1 depthTexture];
}

id objc_msgSend_depthTextureFormat(void *a1, const char *a2, ...)
{
  return [a1 depthTextureFormat];
}

id objc_msgSend_depthTextureUsage(void *a1, const char *a2, ...)
{
  return [a1 depthTextureUsage];
}

id objc_msgSend_derivedCounterNames(void *a1, const char *a2, ...)
{
  return [a1 derivedCounterNames];
}

id objc_msgSend_derivedCounters(void *a1, const char *a2, ...)
{
  return [a1 derivedCounters];
}

id objc_msgSend_derivedCountersData(void *a1, const char *a2, ...)
{
  return [a1 derivedCountersData];
}

id objc_msgSend_derivedEncoderCounterInfo(void *a1, const char *a2, ...)
{
  return [a1 derivedEncoderCounterInfo];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableConsistentPerfState(void *a1, const char *a2, ...)
{
  return [a1 disableConsistentPerfState];
}

id objc_msgSend_disableHeapTextureCompression(void *a1, const char *a2, ...)
{
  return [a1 disableHeapTextureCompression];
}

id objc_msgSend_disableOptimizeRestores(void *a1, const char *a2, ...)
{
  return [a1 disableOptimizeRestores];
}

id objc_msgSend_dispatchThreadgroupsArguments(void *a1, const char *a2, ...)
{
  return [a1 dispatchThreadgroupsArguments];
}

id objc_msgSend_dispatchThreadsArguments(void *a1, const char *a2, ...)
{
  return [a1 dispatchThreadsArguments];
}

id objc_msgSend_dispatchUID(void *a1, const char *a2, ...)
{
  return [a1 dispatchUID];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drawArguments(void *a1, const char *a2, ...)
{
  return [a1 drawArguments];
}

id objc_msgSend_drawCallCost(void *a1, const char *a2, ...)
{
  return [a1 drawCallCost];
}

id objc_msgSend_drawCallIndex(void *a1, const char *a2, ...)
{
  return [a1 drawCallIndex];
}

id objc_msgSend_drawCallInfoList(void *a1, const char *a2, ...)
{
  return [a1 drawCallInfoList];
}

id objc_msgSend_drawIndexedArguments(void *a1, const char *a2, ...)
{
  return [a1 drawIndexedArguments];
}

id objc_msgSend_drawIndexedPatchesArguments(void *a1, const char *a2, ...)
{
  return [a1 drawIndexedPatchesArguments];
}

id objc_msgSend_drawMeshThreadgroupsArguments(void *a1, const char *a2, ...)
{
  return [a1 drawMeshThreadgroupsArguments];
}

id objc_msgSend_drawMeshThreadsArguments(void *a1, const char *a2, ...)
{
  return [a1 drawMeshThreadsArguments];
}

id objc_msgSend_drawPatchesArguments(void *a1, const char *a2, ...)
{
  return [a1 drawPatchesArguments];
}

id objc_msgSend_drawableSize(void *a1, const char *a2, ...)
{
  return [a1 drawableSize];
}

id objc_msgSend_driverVersion(void *a1, const char *a2, ...)
{
  return [a1 driverVersion];
}

id objc_msgSend_dumpInstructions(void *a1, const char *a2, ...)
{
  return [a1 dumpInstructions];
}

id objc_msgSend_dylib(void *a1, const char *a2, ...)
{
  return [a1 dylib];
}

id objc_msgSend_dynamicLibraries(void *a1, const char *a2, ...)
{
  return [a1 dynamicLibraries];
}

id objc_msgSend_effectID(void *a1, const char *a2, ...)
{
  return [a1 effectID];
}

id objc_msgSend_effectiveKickTimes(void *a1, const char *a2, ...)
{
  return [a1 effectiveKickTimes];
}

id objc_msgSend_effectivePerEncoderDrawKickTimes(void *a1, const char *a2, ...)
{
  return [a1 effectivePerEncoderDrawKickTimes];
}

id objc_msgSend_elementStructType(void *a1, const char *a2, ...)
{
  return [a1 elementStructType];
}

id objc_msgSend_elementType(void *a1, const char *a2, ...)
{
  return [a1 elementType];
}

id objc_msgSend_elementTypeDescription(void *a1, const char *a2, ...)
{
  return [a1 elementTypeDescription];
}

id objc_msgSend_enableCapture(void *a1, const char *a2, ...)
{
  return [a1 enableCapture];
}

id objc_msgSend_enableDisplayOnDevice(void *a1, const char *a2, ...)
{
  return [a1 enableDisplayOnDevice];
}

id objc_msgSend_enableHUD(void *a1, const char *a2, ...)
{
  return [a1 enableHUD];
}

id objc_msgSend_enableReplayFromOtherPlatforms(void *a1, const char *a2, ...)
{
  return [a1 enableReplayFromOtherPlatforms];
}

id objc_msgSend_encodedAttributes(void *a1, const char *a2, ...)
{
  return [a1 encodedAttributes];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_encodedLength(void *a1, const char *a2, ...)
{
  return [a1 encodedLength];
}

id objc_msgSend_encoderCount(void *a1, const char *a2, ...)
{
  return [a1 encoderCount];
}

id objc_msgSend_encoderFunctionIndex(void *a1, const char *a2, ...)
{
  return [a1 encoderFunctionIndex];
}

id objc_msgSend_encoderIndex(void *a1, const char *a2, ...)
{
  return [a1 encoderIndex];
}

id objc_msgSend_encoderInfoCount(void *a1, const char *a2, ...)
{
  return [a1 encoderInfoCount];
}

id objc_msgSend_encoderInfoData(void *a1, const char *a2, ...)
{
  return [a1 encoderInfoData];
}

id objc_msgSend_encoderInfoList(void *a1, const char *a2, ...)
{
  return [a1 encoderInfoList];
}

id objc_msgSend_encoderInfos(void *a1, const char *a2, ...)
{
  return [a1 encoderInfos];
}

id objc_msgSend_encoderInternalBinaries(void *a1, const char *a2, ...)
{
  return [a1 encoderInternalBinaries];
}

id objc_msgSend_encoderMethodIdentifier(void *a1, const char *a2, ...)
{
  return [a1 encoderMethodIdentifier];
}

id objc_msgSend_encoderTimelineInfos(void *a1, const char *a2, ...)
{
  return [a1 encoderTimelineInfos];
}

id objc_msgSend_encoders(void *a1, const char *a2, ...)
{
  return [a1 encoders];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_endEncodingAndRetrieveProgramAddressTable(void *a1, const char *a2, ...)
{
  return [a1 endEncodingAndRetrieveProgramAddressTable];
}

id objc_msgSend_endResidency(void *a1, const char *a2, ...)
{
  return [a1 endResidency];
}

id objc_msgSend_enqueue(void *a1, const char *a2, ...)
{
  return [a1 enqueue];
}

id objc_msgSend_enqueueBarrier(void *a1, const char *a2, ...)
{
  return [a1 enqueueBarrier];
}

id objc_msgSend_enterArgumentBufferDownload(void *a1, const char *a2, ...)
{
  return [a1 enterArgumentBufferDownload];
}

id objc_msgSend_enterArgumentBufferUpload(void *a1, const char *a2, ...)
{
  return [a1 enterArgumentBufferUpload];
}

id objc_msgSend_enterOptimizeRestores(void *a1, const char *a2, ...)
{
  return [a1 enterOptimizeRestores];
}

id objc_msgSend_enterRewind(void *a1, const char *a2, ...)
{
  return [a1 enterRewind];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorOptions(void *a1, const char *a2, ...)
{
  return [a1 errorOptions];
}

id objc_msgSend_errorStackTrace(void *a1, const char *a2, ...)
{
  return [a1 errorStackTrace];
}

id objc_msgSend_errorState(void *a1, const char *a2, ...)
{
  return [a1 errorState];
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return [a1 executablePath];
}

id objc_msgSend_executeIndirectCommandBufferMap(void *a1, const char *a2, ...)
{
  return [a1 executeIndirectCommandBufferMap];
}

id objc_msgSend_exportStats(void *a1, const char *a2, ...)
{
  return [a1 exportStats];
}

id objc_msgSend_exposureTexture(void *a1, const char *a2, ...)
{
  return [a1 exposureTexture];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_fence(void *a1, const char *a2, ...)
{
  return [a1 fence];
}

id objc_msgSend_filePathURL(void *a1, const char *a2, ...)
{
  return [a1 filePathURL];
}

id objc_msgSend_filenameOverrides(void *a1, const char *a2, ...)
{
  return [a1 filenameOverrides];
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return [a1 filters];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_firstMipmapInTail(void *a1, const char *a2, ...)
{
  return [a1 firstMipmapInTail];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_forceLoadActionClear(void *a1, const char *a2, ...)
{
  return [a1 forceLoadActionClear];
}

id objc_msgSend_forceLoadUnusedResources(void *a1, const char *a2, ...)
{
  return [a1 forceLoadUnusedResources];
}

id objc_msgSend_forceResourceIndex(void *a1, const char *a2, ...)
{
  return [a1 forceResourceIndex];
}

id objc_msgSend_forceSeamsOnCubemapFiltering(void *a1, const char *a2, ...)
{
  return [a1 forceSeamsOnCubemapFiltering];
}

id objc_msgSend_forceWaitUntilCompleted(void *a1, const char *a2, ...)
{
  return [a1 forceWaitUntilCompleted];
}

id objc_msgSend_fragmentBindings(void *a1, const char *a2, ...)
{
  return [a1 fragmentBindings];
}

id objc_msgSend_fragmentBuffers(void *a1, const char *a2, ...)
{
  return [a1 fragmentBuffers];
}

id objc_msgSend_fragmentFunction(void *a1, const char *a2, ...)
{
  return [a1 fragmentFunction];
}

id objc_msgSend_fragmentLinkedFunctions(void *a1, const char *a2, ...)
{
  return [a1 fragmentLinkedFunctions];
}

id objc_msgSend_fragmentPreloadedLibraries(void *a1, const char *a2, ...)
{
  return [a1 fragmentPreloadedLibraries];
}

id objc_msgSend_fragmentTiming(void *a1, const char *a2, ...)
{
  return [a1 fragmentTiming];
}

id objc_msgSend_framebufferOnly(void *a1, const char *a2, ...)
{
  return [a1 framebufferOnly];
}

id objc_msgSend_frontFaceStencil(void *a1, const char *a2, ...)
{
  return [a1 frontFaceStencil];
}

id objc_msgSend_function(void *a1, const char *a2, ...)
{
  return [a1 function];
}

id objc_msgSend_functionIndex(void *a1, const char *a2, ...)
{
  return [a1 functionIndex];
}

id objc_msgSend_functionInfo(void *a1, const char *a2, ...)
{
  return [a1 functionInfo];
}

id objc_msgSend_functionInfoCount(void *a1, const char *a2, ...)
{
  return [a1 functionInfoCount];
}

id objc_msgSend_functionInfoData(void *a1, const char *a2, ...)
{
  return [a1 functionInfoData];
}

id objc_msgSend_functionMap(void *a1, const char *a2, ...)
{
  return [a1 functionMap];
}

id objc_msgSend_functionName(void *a1, const char *a2, ...)
{
  return [a1 functionName];
}

id objc_msgSend_functionType(void *a1, const char *a2, ...)
{
  return [a1 functionType];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_gatherStats(void *a1, const char *a2, ...)
{
  return [a1 gatherStats];
}

id objc_msgSend_geometryBufferSize(void *a1, const char *a2, ...)
{
  return [a1 geometryBufferSize];
}

id objc_msgSend_getBreadcrumbSummary(void *a1, const char *a2, ...)
{
  return [a1 getBreadcrumbSummary];
}

id objc_msgSend_getBreadcrumbsAsJSON(void *a1, const char *a2, ...)
{
  return [a1 getBreadcrumbsAsJSON];
}

id objc_msgSend_getCommandType(void *a1, const char *a2, ...)
{
  return [a1 getCommandType];
}

id objc_msgSend_getConsistentPerfStateMappingTable(void *a1, const char *a2, ...)
{
  return [a1 getConsistentPerfStateMappingTable];
}

id objc_msgSend_getPipelineStateUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 getPipelineStateUniqueIdentifier];
}

id objc_msgSend_getSPIStats(void *a1, const char *a2, ...)
{
  return [a1 getSPIStats];
}

id objc_msgSend_getStageInRegion(void *a1, const char *a2, ...)
{
  return [a1 getStageInRegion];
}

id objc_msgSend_getStatLocations(void *a1, const char *a2, ...)
{
  return [a1 getStatLocations];
}

id objc_msgSend_getStateOccupancy(void *a1, const char *a2, ...)
{
  return [a1 getStateOccupancy];
}

id objc_msgSend_getTessellationFactorArguments(void *a1, const char *a2, ...)
{
  return [a1 getTessellationFactorArguments];
}

id objc_msgSend_globalTraceObjectID(void *a1, const char *a2, ...)
{
  return [a1 globalTraceObjectID];
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return [a1 globallyUniqueString];
}

id objc_msgSend_gpuAddress(void *a1, const char *a2, ...)
{
  return [a1 gpuAddress];
}

id objc_msgSend_gpuCommandInfoCount(void *a1, const char *a2, ...)
{
  return [a1 gpuCommandInfoCount];
}

id objc_msgSend_gpuCommandInfoData(void *a1, const char *a2, ...)
{
  return [a1 gpuCommandInfoData];
}

id objc_msgSend_gpuCommands(void *a1, const char *a2, ...)
{
  return [a1 gpuCommands];
}

id objc_msgSend_gpuResourceID(void *a1, const char *a2, ...)
{
  return [a1 gpuResourceID];
}

id objc_msgSend_gpuTime(void *a1, const char *a2, ...)
{
  return [a1 gpuTime];
}

id objc_msgSend_gputracePath(void *a1, const char *a2, ...)
{
  return [a1 gputracePath];
}

id objc_msgSend_grcOptions(void *a1, const char *a2, ...)
{
  return [a1 grcOptions];
}

id objc_msgSend_grcTrigger(void *a1, const char *a2, ...)
{
  return [a1 grcTrigger];
}

id objc_msgSend_hasBarrier(void *a1, const char *a2, ...)
{
  return [a1 hasBarrier];
}

id objc_msgSend_hasBeenSent(void *a1, const char *a2, ...)
{
  return [a1 hasBeenSent];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hashOffset(void *a1, const char *a2, ...)
{
  return [a1 hashOffset];
}

id objc_msgSend_hashValue(void *a1, const char *a2, ...)
{
  return [a1 hashValue];
}

id objc_msgSend_hazardTrackingMode(void *a1, const char *a2, ...)
{
  return [a1 hazardTrackingMode];
}

id objc_msgSend_headerBufferSize(void *a1, const char *a2, ...)
{
  return [a1 headerBufferSize];
}

id objc_msgSend_heap(void *a1, const char *a2, ...)
{
  return [a1 heap];
}

id objc_msgSend_heapBuffer(void *a1, const char *a2, ...)
{
  return [a1 heapBuffer];
}

id objc_msgSend_heapLocation(void *a1, const char *a2, ...)
{
  return [a1 heapLocation];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_horizontalLogicalCoordinatesAtPhysicalTileBoundaries(void *a1, const char *a2, ...)
{
  return [a1 horizontalLogicalCoordinatesAtPhysicalTileBoundaries];
}

id objc_msgSend_horizontalSampleStorage(void *a1, const char *a2, ...)
{
  return [a1 horizontalSampleStorage];
}

id objc_msgSend_imageBlockDataSize(void *a1, const char *a2, ...)
{
  return [a1 imageBlockDataSize];
}

id objc_msgSend_imageBlockKind(void *a1, const char *a2, ...)
{
  return [a1 imageBlockKind];
}

id objc_msgSend_imageBlockMasterStructMembers(void *a1, const char *a2, ...)
{
  return [a1 imageBlockMasterStructMembers];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_indexBufferGPUVirtualAddress(void *a1, const char *a2, ...)
{
  return [a1 indexBufferGPUVirtualAddress];
}

id objc_msgSend_indexCount(void *a1, const char *a2, ...)
{
  return [a1 indexCount];
}

id objc_msgSend_indexType(void *a1, const char *a2, ...)
{
  return [a1 indexType];
}

id objc_msgSend_indirectArgumentIndex(void *a1, const char *a2, ...)
{
  return [a1 indirectArgumentIndex];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initForCounters(void *a1, const char *a2, ...)
{
  return [a1 initForCounters];
}

id objc_msgSend_initForHarvestingBinaries(void *a1, const char *a2, ...)
{
  return [a1 initForHarvestingBinaries];
}

id objc_msgSend_initForMinimumInfoCounters(void *a1, const char *a2, ...)
{
  return [a1 initForMinimumInfoCounters];
}

id objc_msgSend_initForMinimumInfoTimeline(void *a1, const char *a2, ...)
{
  return [a1 initForMinimumInfoTimeline];
}

id objc_msgSend_initForProfiling(void *a1, const char *a2, ...)
{
  return [a1 initForProfiling];
}

id objc_msgSend_initForTimeline(void *a1, const char *a2, ...)
{
  return [a1 initForTimeline];
}

id objc_msgSend_innerNodeBufferSize(void *a1, const char *a2, ...)
{
  return [a1 innerNodeBufferSize];
}

id objc_msgSend_inputContentHeight(void *a1, const char *a2, ...)
{
  return [a1 inputContentHeight];
}

id objc_msgSend_inputContentMaxScale(void *a1, const char *a2, ...)
{
  return [a1 inputContentMaxScale];
}

id objc_msgSend_inputContentMinScale(void *a1, const char *a2, ...)
{
  return [a1 inputContentMinScale];
}

id objc_msgSend_inputContentWidth(void *a1, const char *a2, ...)
{
  return [a1 inputContentWidth];
}

id objc_msgSend_inputHeight(void *a1, const char *a2, ...)
{
  return [a1 inputHeight];
}

id objc_msgSend_inputWidth(void *a1, const char *a2, ...)
{
  return [a1 inputWidth];
}

id objc_msgSend_insertCompressedTextureReinterpretationFlush(void *a1, const char *a2, ...)
{
  return [a1 insertCompressedTextureReinterpretationFlush];
}

id objc_msgSend_insertDebugCaptureBoundary(void *a1, const char *a2, ...)
{
  return [a1 insertDebugCaptureBoundary];
}

id objc_msgSend_installName(void *a1, const char *a2, ...)
{
  return [a1 installName];
}

id objc_msgSend_instanceCount(void *a1, const char *a2, ...)
{
  return [a1 instanceCount];
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return [a1 instanceID];
}

id objc_msgSend_instanceStride(void *a1, const char *a2, ...)
{
  return [a1 instanceStride];
}

id objc_msgSend_instanceTransformBufferSize(void *a1, const char *a2, ...)
{
  return [a1 instanceTransformBufferSize];
}

id objc_msgSend_instructionCount(void *a1, const char *a2, ...)
{
  return [a1 instructionCount];
}

id objc_msgSend_instructionData(void *a1, const char *a2, ...)
{
  return [a1 instructionData];
}

id objc_msgSend_instructions(void *a1, const char *a2, ...)
{
  return [a1 instructions];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_intersectionFunctionTableDescriptor(void *a1, const char *a2, ...)
{
  return [a1 intersectionFunctionTableDescriptor];
}

id objc_msgSend_invalid(void *a1, const char *a2, ...)
{
  return [a1 invalid];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return [a1 invoke];
}

id objc_msgSend_iosurface(void *a1, const char *a2, ...)
{
  return [a1 iosurface];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDepthReversed(void *a1, const char *a2, ...)
{
  return [a1 isDepthReversed];
}

id objc_msgSend_isDepthTexture(void *a1, const char *a2, ...)
{
  return [a1 isDepthTexture];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isFramebufferOnly(void *a1, const char *a2, ...)
{
  return [a1 isFramebufferOnly];
}

id objc_msgSend_isInitialized(void *a1, const char *a2, ...)
{
  return [a1 isInitialized];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isRasterizationEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRasterizationEnabled];
}

id objc_msgSend_isStatEnabled(void *a1, const char *a2, ...)
{
  return [a1 isStatEnabled];
}

id objc_msgSend_isUsed(void *a1, const char *a2, ...)
{
  return [a1 isUsed];
}

id objc_msgSend_isVertexDescriptorBuffer(void *a1, const char *a2, ...)
{
  return [a1 isVertexDescriptorBuffer];
}

id objc_msgSend_isiOSAppOnMac(void *a1, const char *a2, ...)
{
  return [a1 isiOSAppOnMac];
}

id objc_msgSend_jitterOffsetX(void *a1, const char *a2, ...)
{
  return [a1 jitterOffsetX];
}

id objc_msgSend_jitterOffsetY(void *a1, const char *a2, ...)
{
  return [a1 jitterOffsetY];
}

id objc_msgSend_jsonObject(void *a1, const char *a2, ...)
{
  return [a1 jsonObject];
}

id objc_msgSend_kernelEndTime(void *a1, const char *a2, ...)
{
  return [a1 kernelEndTime];
}

id objc_msgSend_kernelStartTime(void *a1, const char *a2, ...)
{
  return [a1 kernelStartTime];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastInstruction(void *a1, const char *a2, ...)
{
  return [a1 lastInstruction];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_latestSupportedGenericBVHVersion(void *a1, const char *a2, ...)
{
  return [a1 latestSupportedGenericBVHVersion];
}

id objc_msgSend_layerClass(void *a1, const char *a2, ...)
{
  return [a1 layerClass];
}

id objc_msgSend_layerCount(void *a1, const char *a2, ...)
{
  return [a1 layerCount];
}

id objc_msgSend_layers(void *a1, const char *a2, ...)
{
  return [a1 layers];
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return [a1 layout];
}

id objc_msgSend_layouts(void *a1, const char *a2, ...)
{
  return [a1 layouts];
}

id objc_msgSend_leafNodeBufferSize(void *a1, const char *a2, ...)
{
  return [a1 leafNodeBufferSize];
}

id objc_msgSend_leaveActivity(void *a1, const char *a2, ...)
{
  return [a1 leaveActivity];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_libraryType(void *a1, const char *a2, ...)
{
  return [a1 libraryType];
}

id objc_msgSend_line(void *a1, const char *a2, ...)
{
  return [a1 line];
}

id objc_msgSend_linkedFunctions(void *a1, const char *a2, ...)
{
  return [a1 linkedFunctions];
}

id objc_msgSend_loadActionTimes(void *a1, const char *a2, ...)
{
  return [a1 loadActionTimes];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lodAverage(void *a1, const char *a2, ...)
{
  return [a1 lodAverage];
}

id objc_msgSend_lodMaxClamp(void *a1, const char *a2, ...)
{
  return [a1 lodMaxClamp];
}

id objc_msgSend_lodMinClamp(void *a1, const char *a2, ...)
{
  return [a1 lodMinClamp];
}

id objc_msgSend_logPerformance(void *a1, const char *a2, ...)
{
  return [a1 logPerformance];
}

id objc_msgSend_logs(void *a1, const char *a2, ...)
{
  return [a1 logs];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mGPUTimelineInfos(void *a1, const char *a2, ...)
{
  return [a1 mGPUTimelineInfos];
}

id objc_msgSend_magFilter(void *a1, const char *a2, ...)
{
  return [a1 magFilter];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_makeAliasable(void *a1, const char *a2, ...)
{
  return [a1 makeAliasable];
}

id objc_msgSend_mappedAddress(void *a1, const char *a2, ...)
{
  return [a1 mappedAddress];
}

id objc_msgSend_mappedSize(void *a1, const char *a2, ...)
{
  return [a1 mappedSize];
}

id objc_msgSend_mappings(void *a1, const char *a2, ...)
{
  return [a1 mappings];
}

id objc_msgSend_maxAnisotropy(void *a1, const char *a2, ...)
{
  return [a1 maxAnisotropy];
}

id objc_msgSend_maxBufferLength(void *a1, const char *a2, ...)
{
  return [a1 maxBufferLength];
}

id objc_msgSend_maxCallStackDepth(void *a1, const char *a2, ...)
{
  return [a1 maxCallStackDepth];
}

id objc_msgSend_maxConcurrentOperationCount(void *a1, const char *a2, ...)
{
  return [a1 maxConcurrentOperationCount];
}

id objc_msgSend_maxFragmentCallStackDepth(void *a1, const char *a2, ...)
{
  return [a1 maxFragmentCallStackDepth];
}

id objc_msgSend_maxMeshCallStackDepth(void *a1, const char *a2, ...)
{
  return [a1 maxMeshCallStackDepth];
}

id objc_msgSend_maxObjectCallStackDepth(void *a1, const char *a2, ...)
{
  return [a1 maxObjectCallStackDepth];
}

id objc_msgSend_maxPixelPosition(void *a1, const char *a2, ...)
{
  return [a1 maxPixelPosition];
}

id objc_msgSend_maxSampleID(void *a1, const char *a2, ...)
{
  return [a1 maxSampleID];
}

id objc_msgSend_maxTextureWidth2D(void *a1, const char *a2, ...)
{
  return [a1 maxTextureWidth2D];
}

id objc_msgSend_maxThreadPositionInGrid(void *a1, const char *a2, ...)
{
  return [a1 maxThreadPositionInGrid];
}

id objc_msgSend_maxTotalThreadgroupsPerMeshGrid(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadgroupsPerMeshGrid];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_maxVertexBuffers(void *a1, const char *a2, ...)
{
  return [a1 maxVertexBuffers];
}

id objc_msgSend_maxVertexCallStackDepth(void *a1, const char *a2, ...)
{
  return [a1 maxVertexCallStackDepth];
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return [a1 members];
}

id objc_msgSend_meshBindings(void *a1, const char *a2, ...)
{
  return [a1 meshBindings];
}

id objc_msgSend_meshBuffers(void *a1, const char *a2, ...)
{
  return [a1 meshBuffers];
}

id objc_msgSend_meshBuiltInArguments(void *a1, const char *a2, ...)
{
  return [a1 meshBuiltInArguments];
}

id objc_msgSend_meshFunction(void *a1, const char *a2, ...)
{
  return [a1 meshFunction];
}

id objc_msgSend_meshLinkedFunctions(void *a1, const char *a2, ...)
{
  return [a1 meshLinkedFunctions];
}

id objc_msgSend_meshPreloadedLibraries(void *a1, const char *a2, ...)
{
  return [a1 meshPreloadedLibraries];
}

id objc_msgSend_meshPrimitiveCount(void *a1, const char *a2, ...)
{
  return [a1 meshPrimitiveCount];
}

id objc_msgSend_meshPrimitiveStruct(void *a1, const char *a2, ...)
{
  return [a1 meshPrimitiveStruct];
}

id objc_msgSend_meshTopologyType(void *a1, const char *a2, ...)
{
  return [a1 meshTopologyType];
}

id objc_msgSend_meshVertexCount(void *a1, const char *a2, ...)
{
  return [a1 meshVertexCount];
}

id objc_msgSend_meshVertexStruct(void *a1, const char *a2, ...)
{
  return [a1 meshVertexStruct];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageSerial(void *a1, const char *a2, ...)
{
  return [a1 messageSerial];
}

id objc_msgSend_metalFXTimelineInfo(void *a1, const char *a2, ...)
{
  return [a1 metalFXTimelineInfo];
}

id objc_msgSend_minFilter(void *a1, const char *a2, ...)
{
  return [a1 minFilter];
}

id objc_msgSend_minPixelPosition(void *a1, const char *a2, ...)
{
  return [a1 minPixelPosition];
}

id objc_msgSend_minSampleID(void *a1, const char *a2, ...)
{
  return [a1 minSampleID];
}

id objc_msgSend_minThreadPositionInGrid(void *a1, const char *a2, ...)
{
  return [a1 minThreadPositionInGrid];
}

id objc_msgSend_mipFilter(void *a1, const char *a2, ...)
{
  return [a1 mipFilter];
}

id objc_msgSend_mipmapLevelCount(void *a1, const char *a2, ...)
{
  return [a1 mipmapLevelCount];
}

id objc_msgSend_motionTexture(void *a1, const char *a2, ...)
{
  return [a1 motionTexture];
}

id objc_msgSend_motionTextureFormat(void *a1, const char *a2, ...)
{
  return [a1 motionTextureFormat];
}

id objc_msgSend_motionTextureUsage(void *a1, const char *a2, ...)
{
  return [a1 motionTextureUsage];
}

id objc_msgSend_motionVectorScaleX(void *a1, const char *a2, ...)
{
  return [a1 motionVectorScaleX];
}

id objc_msgSend_motionVectorScaleY(void *a1, const char *a2, ...)
{
  return [a1 motionVectorScaleY];
}

id objc_msgSend_mtlfxTracingInfo(void *a1, const char *a2, ...)
{
  return [a1 mtlfxTracingInfo];
}

id objc_msgSend_mutability(void *a1, const char *a2, ...)
{
  return [a1 mutability];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsFunctionConstantValues(void *a1, const char *a2, ...)
{
  return [a1 needsFunctionConstantValues];
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 newCommandQueue];
}

id objc_msgSend_newEvent(void *a1, const char *a2, ...)
{
  return [a1 newEvent];
}

id objc_msgSend_newFence(void *a1, const char *a2, ...)
{
  return [a1 newFence];
}

id objc_msgSend_newFragmentShaderDebugInfo(void *a1, const char *a2, ...)
{
  return [a1 newFragmentShaderDebugInfo];
}

id objc_msgSend_newKernelDebugInfo(void *a1, const char *a2, ...)
{
  return [a1 newKernelDebugInfo];
}

id objc_msgSend_newLateEvalEvent(void *a1, const char *a2, ...)
{
  return [a1 newLateEvalEvent];
}

id objc_msgSend_newSharedEvent(void *a1, const char *a2, ...)
{
  return [a1 newSharedEvent];
}

id objc_msgSend_newSharedEventHandle(void *a1, const char *a2, ...)
{
  return [a1 newSharedEventHandle];
}

id objc_msgSend_newSharedTextureHandle(void *a1, const char *a2, ...)
{
  return [a1 newSharedTextureHandle];
}

id objc_msgSend_newVertexShaderDebugInfo(void *a1, const char *a2, ...)
{
  return [a1 newVertexShaderDebugInfo];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextDrawable(void *a1, const char *a2, ...)
{
  return [a1 nextDrawable];
}

id objc_msgSend_normalizedCoordinates(void *a1, const char *a2, ...)
{
  return [a1 normalizedCoordinates];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numActiveShadersPerPeriodicSample(void *a1, const char *a2, ...)
{
  return [a1 numActiveShadersPerPeriodicSample];
}

id objc_msgSend_numPeriodicSamples(void *a1, const char *a2, ...)
{
  return [a1 numPeriodicSamples];
}

id objc_msgSend_numberOfPatchControlPoints(void *a1, const char *a2, ...)
{
  return [a1 numberOfPatchControlPoints];
}

id objc_msgSend_objectBindings(void *a1, const char *a2, ...)
{
  return [a1 objectBindings];
}

id objc_msgSend_objectBuffers(void *a1, const char *a2, ...)
{
  return [a1 objectBuffers];
}

id objc_msgSend_objectFunction(void *a1, const char *a2, ...)
{
  return [a1 objectFunction];
}

id objc_msgSend_objectLinkedFunctions(void *a1, const char *a2, ...)
{
  return [a1 objectLinkedFunctions];
}

id objc_msgSend_objectPayload(void *a1, const char *a2, ...)
{
  return [a1 objectPayload];
}

id objc_msgSend_objectPreloadedLibraries(void *a1, const char *a2, ...)
{
  return [a1 objectPreloadedLibraries];
}

id objc_msgSend_objectShaderThreadgroupBeginBounds(void *a1, const char *a2, ...)
{
  return [a1 objectShaderThreadgroupBeginBounds];
}

id objc_msgSend_objectShaderThreadgroupBoundsPresent(void *a1, const char *a2, ...)
{
  return [a1 objectShaderThreadgroupBoundsPresent];
}

id objc_msgSend_objectShaderThreadgroupEndBounds(void *a1, const char *a2, ...)
{
  return [a1 objectShaderThreadgroupEndBounds];
}

id objc_msgSend_objectThreadgroupPositionInGrid(void *a1, const char *a2, ...)
{
  return [a1 objectThreadgroupPositionInGrid];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return [a1 offsetInFile];
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersion];
}

id objc_msgSend_operatingSystemVersionString(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersionString];
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return [a1 operation];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_originalFilename(void *a1, const char *a2, ...)
{
  return [a1 originalFilename];
}

id objc_msgSend_outputHeight(void *a1, const char *a2, ...)
{
  return [a1 outputHeight];
}

id objc_msgSend_outputTexture(void *a1, const char *a2, ...)
{
  return [a1 outputTexture];
}

id objc_msgSend_outputTextureFormat(void *a1, const char *a2, ...)
{
  return [a1 outputTextureFormat];
}

id objc_msgSend_outputTextureUsage(void *a1, const char *a2, ...)
{
  return [a1 outputTextureUsage];
}

id objc_msgSend_outputWidth(void *a1, const char *a2, ...)
{
  return [a1 outputWidth];
}

id objc_msgSend_overlay(void *a1, const char *a2, ...)
{
  return [a1 overlay];
}

id objc_msgSend_overrideFilename(void *a1, const char *a2, ...)
{
  return [a1 overrideFilename];
}

id objc_msgSend_parentTexture(void *a1, const char *a2, ...)
{
  return [a1 parentTexture];
}

id objc_msgSend_patchCount(void *a1, const char *a2, ...)
{
  return [a1 patchCount];
}

id objc_msgSend_patchIDs(void *a1, const char *a2, ...)
{
  return [a1 patchIDs];
}

id objc_msgSend_patchIndexBufferVirtualAddress(void *a1, const char *a2, ...)
{
  return [a1 patchIndexBufferVirtualAddress];
}

id objc_msgSend_patchStart(void *a1, const char *a2, ...)
{
  return [a1 patchStart];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_perFileCost(void *a1, const char *a2, ...)
{
  return [a1 perFileCost];
}

id objc_msgSend_perFileLineCostDictForCI(void *a1, const char *a2, ...)
{
  return [a1 perFileLineCostDictForCI];
}

id objc_msgSend_perPrimitiveDataBufferSize(void *a1, const char *a2, ...)
{
  return [a1 perPrimitiveDataBufferSize];
}

id objc_msgSend_perRingPerFrameLimiterData(void *a1, const char *a2, ...)
{
  return [a1 perRingPerFrameLimiterData];
}

id objc_msgSend_perRingSampledDerivedCounters(void *a1, const char *a2, ...)
{
  return [a1 perRingSampledDerivedCounters];
}

id objc_msgSend_performanceStatistics(void *a1, const char *a2, ...)
{
  return [a1 performanceStatistics];
}

id objc_msgSend_physicalGranularity(void *a1, const char *a2, ...)
{
  return [a1 physicalGranularity];
}

id objc_msgSend_pipelineBinaries(void *a1, const char *a2, ...)
{
  return [a1 pipelineBinaries];
}

id objc_msgSend_pipelineStateId(void *a1, const char *a2, ...)
{
  return [a1 pipelineStateId];
}

id objc_msgSend_pipelineStateIndex(void *a1, const char *a2, ...)
{
  return [a1 pipelineStateIndex];
}

id objc_msgSend_pipelineStateInfoCount(void *a1, const char *a2, ...)
{
  return [a1 pipelineStateInfoCount];
}

id objc_msgSend_pipelineStateInfoData(void *a1, const char *a2, ...)
{
  return [a1 pipelineStateInfoData];
}

id objc_msgSend_pipelineStates(void *a1, const char *a2, ...)
{
  return [a1 pipelineStates];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_plane(void *a1, const char *a2, ...)
{
  return [a1 plane];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return [a1 platform];
}

id objc_msgSend_plistPayload(void *a1, const char *a2, ...)
{
  return [a1 plistPayload];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_popDebugGroup(void *a1, const char *a2, ...)
{
  return [a1 popDebugGroup];
}

id objc_msgSend_postVertexDumpOutputs(void *a1, const char *a2, ...)
{
  return [a1 postVertexDumpOutputs];
}

id objc_msgSend_postVertexDumpStride(void *a1, const char *a2, ...)
{
  return [a1 postVertexDumpStride];
}

id objc_msgSend_preExposure(void *a1, const char *a2, ...)
{
  return [a1 preExposure];
}

id objc_msgSend_preloadedLibraries(void *a1, const char *a2, ...)
{
  return [a1 preloadedLibraries];
}

id objc_msgSend_previousActivity(void *a1, const char *a2, ...)
{
  return [a1 previousActivity];
}

id objc_msgSend_primitiveBufferSize(void *a1, const char *a2, ...)
{
  return [a1 primitiveBufferSize];
}

id objc_msgSend_primitiveKind(void *a1, const char *a2, ...)
{
  return [a1 primitiveKind];
}

id objc_msgSend_primitiveType(void *a1, const char *a2, ...)
{
  return [a1 primitiveType];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processorCount(void *a1, const char *a2, ...)
{
  return [a1 processorCount];
}

id objc_msgSend_profileData(void *a1, const char *a2, ...)
{
  return [a1 profileData];
}

id objc_msgSend_programData(void *a1, const char *a2, ...)
{
  return [a1 programData];
}

id objc_msgSend_programId(void *a1, const char *a2, ...)
{
  return [a1 programId];
}

id objc_msgSend_programIndex(void *a1, const char *a2, ...)
{
  return [a1 programIndex];
}

id objc_msgSend_programInfo(void *a1, const char *a2, ...)
{
  return [a1 programInfo];
}

id objc_msgSend_programInfoList(void *a1, const char *a2, ...)
{
  return [a1 programInfoList];
}

id objc_msgSend_programPipelineInfoList(void *a1, const char *a2, ...)
{
  return [a1 programPipelineInfoList];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rAddressMode(void *a1, const char *a2, ...)
{
  return [a1 rAddressMode];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_rasterSampleCount(void *a1, const char *a2, ...)
{
  return [a1 rasterSampleCount];
}

id objc_msgSend_rasterizationRateMap(void *a1, const char *a2, ...)
{
  return [a1 rasterizationRateMap];
}

id objc_msgSend_reactiveMaskTexture(void *a1, const char *a2, ...)
{
  return [a1 reactiveMaskTexture];
}

id objc_msgSend_reactiveTextureUsage(void *a1, const char *a2, ...)
{
  return [a1 reactiveTextureUsage];
}

id objc_msgSend_registerInfoCount(void *a1, const char *a2, ...)
{
  return [a1 registerInfoCount];
}

id objc_msgSend_registerInfoData(void *a1, const char *a2, ...)
{
  return [a1 registerInfoData];
}

id objc_msgSend_releaseBuffer(void *a1, const char *a2, ...)
{
  return [a1 releaseBuffer];
}

id objc_msgSend_relocations(void *a1, const char *a2, ...)
{
  return [a1 relocations];
}

id objc_msgSend_removeAPSCounterData(void *a1, const char *a2, ...)
{
  return [a1 removeAPSCounterData];
}

id objc_msgSend_removeAPSData(void *a1, const char *a2, ...)
{
  return [a1 removeAPSData];
}

id objc_msgSend_removeAPSTimelineData(void *a1, const char *a2, ...)
{
  return [a1 removeAPSTimelineData];
}

id objc_msgSend_removeAllAllocations(void *a1, const char *a2, ...)
{
  return [a1 removeAllAllocations];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_renderCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 renderCommandEncoder];
}

id objc_msgSend_renderPassDescriptor(void *a1, const char *a2, ...)
{
  return [a1 renderPassDescriptor];
}

id objc_msgSend_renderPassDescriptorMap(void *a1, const char *a2, ...)
{
  return [a1 renderPassDescriptorMap];
}

id objc_msgSend_renderPipelineDescriptorMap(void *a1, const char *a2, ...)
{
  return [a1 renderPipelineDescriptorMap];
}

id objc_msgSend_renderTargetArrayIndex(void *a1, const char *a2, ...)
{
  return [a1 renderTargetArrayIndex];
}

id objc_msgSend_renderTargetHeight(void *a1, const char *a2, ...)
{
  return [a1 renderTargetHeight];
}

id objc_msgSend_renderTargetWidth(void *a1, const char *a2, ...)
{
  return [a1 renderTargetWidth];
}

id objc_msgSend_replyBlock(void *a1, const char *a2, ...)
{
  return [a1 replyBlock];
}

id objc_msgSend_replySerial(void *a1, const char *a2, ...)
{
  return [a1 replySerial];
}

id objc_msgSend_replyTo(void *a1, const char *a2, ...)
{
  return [a1 replyTo];
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return [a1 requestID];
}

id objc_msgSend_requestResidency(void *a1, const char *a2, ...)
{
  return [a1 requestResidency];
}

id objc_msgSend_requests(void *a1, const char *a2, ...)
{
  return [a1 requests];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetCommand(void *a1, const char *a2, ...)
{
  return [a1 resetCommand];
}

id objc_msgSend_resetRawDataPostProcessor(void *a1, const char *a2, ...)
{
  return [a1 resetRawDataPostProcessor];
}

id objc_msgSend_resolveMultisampleTexture(void *a1, const char *a2, ...)
{
  return [a1 resolveMultisampleTexture];
}

id objc_msgSend_resourceIndex(void *a1, const char *a2, ...)
{
  return [a1 resourceIndex];
}

id objc_msgSend_resourceOptions(void *a1, const char *a2, ...)
{
  return [a1 resourceOptions];
}

id objc_msgSend_resourcePool(void *a1, const char *a2, ...)
{
  return [a1 resourcePool];
}

id objc_msgSend_resourceStateCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 resourceStateCommandEncoder];
}

id objc_msgSend_resourceStatePassDescriptorMap(void *a1, const char *a2, ...)
{
  return [a1 resourceStatePassDescriptorMap];
}

id objc_msgSend_resources(void *a1, const char *a2, ...)
{
  return [a1 resources];
}

id objc_msgSend_restoreIndirectCommandBufferDataMap(void *a1, const char *a2, ...)
{
  return [a1 restoreIndirectCommandBufferDataMap];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retainedReferences(void *a1, const char *a2, ...)
{
  return [a1 retainedReferences];
}

id objc_msgSend_rgb(void *a1, const char *a2, ...)
{
  return [a1 rgb];
}

id objc_msgSend_riaGeneration(void *a1, const char *a2, ...)
{
  return [a1 riaGeneration];
}

id objc_msgSend_ringBufferNum(void *a1, const char *a2, ...)
{
  return [a1 ringBufferNum];
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return [a1 rotation];
}

id objc_msgSend_sAddressMode(void *a1, const char *a2, ...)
{
  return [a1 sAddressMode];
}

id objc_msgSend_sampleBufferAttachments(void *a1, const char *a2, ...)
{
  return [a1 sampleBufferAttachments];
}

id objc_msgSend_sampleCount(void *a1, const char *a2, ...)
{
  return [a1 sampleCount];
}

id objc_msgSend_sampleMarker(void *a1, const char *a2, ...)
{
  return [a1 sampleMarker];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_screenSize(void *a1, const char *a2, ...)
{
  return [a1 screenSize];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return [a1 semaphore];
}

id objc_msgSend_semaphoreRequests(void *a1, const char *a2, ...)
{
  return [a1 semaphoreRequests];
}

id objc_msgSend_serial(void *a1, const char *a2, ...)
{
  return [a1 serial];
}

id objc_msgSend_serviceLaunched(void *a1, const char *a2, ...)
{
  return [a1 serviceLaunched];
}

id objc_msgSend_servicePort(void *a1, const char *a2, ...)
{
  return [a1 servicePort];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_sessionsID(void *a1, const char *a2, ...)
{
  return [a1 sessionsID];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setBarrier(void *a1, const char *a2, ...)
{
  return [a1 setBarrier];
}

id objc_msgSend_setDepthCleared(void *a1, const char *a2, ...)
{
  return [a1 setDepthCleared];
}

id objc_msgSend_setStencilCleared(void *a1, const char *a2, ...)
{
  return [a1 setStencilCleared];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_shaderIR(void *a1, const char *a2, ...)
{
  return [a1 shaderIR];
}

id objc_msgSend_shaderProfiling(void *a1, const char *a2, ...)
{
  return [a1 shaderProfiling];
}

id objc_msgSend_shaderProfilingFrameTimes(void *a1, const char *a2, ...)
{
  return [a1 shaderProfilingFrameTimes];
}

id objc_msgSend_shaderProfilingTime(void *a1, const char *a2, ...)
{
  return [a1 shaderProfilingTime];
}

id objc_msgSend_shaderSource(void *a1, const char *a2, ...)
{
  return [a1 shaderSource];
}

id objc_msgSend_shaderURL(void *a1, const char *a2, ...)
{
  return [a1 shaderURL];
}

id objc_msgSend_sharedCaptureManager(void *a1, const char *a2, ...)
{
  return [a1 sharedCaptureManager];
}

id objc_msgSend_sharedMemorySize(void *a1, const char *a2, ...)
{
  return [a1 sharedMemorySize];
}

id objc_msgSend_shrinkToFit(void *a1, const char *a2, ...)
{
  return [a1 shrinkToFit];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_slice(void *a1, const char *a2, ...)
{
  return [a1 slice];
}

id objc_msgSend_smallestEncoding(void *a1, const char *a2, ...)
{
  return [a1 smallestEncoding];
}

id objc_msgSend_solid(void *a1, const char *a2, ...)
{
  return [a1 solid];
}

id objc_msgSend_sourceList(void *a1, const char *a2, ...)
{
  return [a1 sourceList];
}

id objc_msgSend_sparseSurfaceDefaultValue(void *a1, const char *a2, ...)
{
  return [a1 sparseSurfaceDefaultValue];
}

id objc_msgSend_stageInputDescriptor(void *a1, const char *a2, ...)
{
  return [a1 stageInputDescriptor];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_startSampling(void *a1, const char *a2, ...)
{
  return [a1 startSampling];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stencilAttachment(void *a1, const char *a2, ...)
{
  return [a1 stencilAttachment];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_stopCapture(void *a1, const char *a2, ...)
{
  return [a1 stopCapture];
}

id objc_msgSend_stopCollectingStats(void *a1, const char *a2, ...)
{
  return [a1 stopCollectingStats];
}

id objc_msgSend_stopSampling(void *a1, const char *a2, ...)
{
  return [a1 stopSampling];
}

id objc_msgSend_storageMode(void *a1, const char *a2, ...)
{
  return [a1 storageMode];
}

id objc_msgSend_storeActionTimes(void *a1, const char *a2, ...)
{
  return [a1 storeActionTimes];
}

id objc_msgSend_streamDataClasses(void *a1, const char *a2, ...)
{
  return [a1 streamDataClasses];
}

id objc_msgSend_streamHandler(void *a1, const char *a2, ...)
{
  return [a1 streamHandler];
}

id objc_msgSend_streamRef(void *a1, const char *a2, ...)
{
  return [a1 streamRef];
}

id objc_msgSend_stride(void *a1, const char *a2, ...)
{
  return [a1 stride];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByResolvingSymlinksInPath];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_stringPayload(void *a1, const char *a2, ...)
{
  return [a1 stringPayload];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strings(void *a1, const char *a2, ...)
{
  return [a1 strings];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subCommandIndex(void *a1, const char *a2, ...)
{
  return [a1 subCommandIndex];
}

id objc_msgSend_subType(void *a1, const char *a2, ...)
{
  return [a1 subType];
}

id objc_msgSend_submitCommand(void *a1, const char *a2, ...)
{
  return [a1 submitCommand];
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return [a1 summary];
}

id objc_msgSend_supportArgumentBuffers(void *a1, const char *a2, ...)
{
  return [a1 supportArgumentBuffers];
}

id objc_msgSend_supportsArgumentBuffersTier2(void *a1, const char *a2, ...)
{
  return [a1 supportsArgumentBuffersTier2];
}

id objc_msgSend_supportsDynamicLibraries(void *a1, const char *a2, ...)
{
  return [a1 supportsDynamicLibraries];
}

id objc_msgSend_supportsFileFormatV2(void *a1, const char *a2, ...)
{
  return [a1 supportsFileFormatV2];
}

id objc_msgSend_supportsFunctionPointers(void *a1, const char *a2, ...)
{
  return [a1 supportsFunctionPointers];
}

id objc_msgSend_supportsFunctionPointersFromRender(void *a1, const char *a2, ...)
{
  return [a1 supportsFunctionPointersFromRender];
}

id objc_msgSend_supportsGlobalVariableRelocation(void *a1, const char *a2, ...)
{
  return [a1 supportsGlobalVariableRelocation];
}

id objc_msgSend_supportsGlobalVariableRelocationCompute(void *a1, const char *a2, ...)
{
  return [a1 supportsGlobalVariableRelocationCompute];
}

id objc_msgSend_supportsGlobalVariableRelocationRender(void *a1, const char *a2, ...)
{
  return [a1 supportsGlobalVariableRelocationRender];
}

id objc_msgSend_supportsImageBlocks(void *a1, const char *a2, ...)
{
  return [a1 supportsImageBlocks];
}

id objc_msgSend_supportsLayeredRendering(void *a1, const char *a2, ...)
{
  return [a1 supportsLayeredRendering];
}

id objc_msgSend_supportsMemorylessRenderTargets(void *a1, const char *a2, ...)
{
  return [a1 supportsMemorylessRenderTargets];
}

id objc_msgSend_supportsRaytracing(void *a1, const char *a2, ...)
{
  return [a1 supportsRaytracing];
}

id objc_msgSend_supportsRenderDynamicLibraries(void *a1, const char *a2, ...)
{
  return [a1 supportsRenderDynamicLibraries];
}

id objc_msgSend_supportsTLS(void *a1, const char *a2, ...)
{
  return [a1 supportsTLS];
}

id objc_msgSend_supportsTessellation(void *a1, const char *a2, ...)
{
  return [a1 supportsTessellation];
}

id objc_msgSend_swizzle(void *a1, const char *a2, ...)
{
  return [a1 swizzle];
}

id objc_msgSend_swizzleKey(void *a1, const char *a2, ...)
{
  return [a1 swizzleKey];
}

id objc_msgSend_tAddressMode(void *a1, const char *a2, ...)
{
  return [a1 tAddressMode];
}

id objc_msgSend_tagType(void *a1, const char *a2, ...)
{
  return [a1 tagType];
}

id objc_msgSend_tags(void *a1, const char *a2, ...)
{
  return [a1 tags];
}

id objc_msgSend_targetDeviceArchitecture(void *a1, const char *a2, ...)
{
  return [a1 targetDeviceArchitecture];
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return [a1 tearDown];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_terminateProcess(void *a1, const char *a2, ...)
{
  return [a1 terminateProcess];
}

id objc_msgSend_texture(void *a1, const char *a2, ...)
{
  return [a1 texture];
}

id objc_msgSend_textureDataType(void *a1, const char *a2, ...)
{
  return [a1 textureDataType];
}

id objc_msgSend_textureType(void *a1, const char *a2, ...)
{
  return [a1 textureType];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_threadgroupMemoryAlignment(void *a1, const char *a2, ...)
{
  return [a1 threadgroupMemoryAlignment];
}

id objc_msgSend_threadgroupMemoryDataSize(void *a1, const char *a2, ...)
{
  return [a1 threadgroupMemoryDataSize];
}

id objc_msgSend_threadgroupsPerGrid(void *a1, const char *a2, ...)
{
  return [a1 threadgroupsPerGrid];
}

id objc_msgSend_threadsPerGrid(void *a1, const char *a2, ...)
{
  return [a1 threadsPerGrid];
}

id objc_msgSend_threadsPerMeshThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 threadsPerMeshThreadgroup];
}

id objc_msgSend_threadsPerObjectThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 threadsPerObjectThreadgroup];
}

id objc_msgSend_threadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 threadsPerThreadgroup];
}

id objc_msgSend_tileBindings(void *a1, const char *a2, ...)
{
  return [a1 tileBindings];
}

id objc_msgSend_tileBuffers(void *a1, const char *a2, ...)
{
  return [a1 tileBuffers];
}

id objc_msgSend_tileFunction(void *a1, const char *a2, ...)
{
  return [a1 tileFunction];
}

id objc_msgSend_tileHeight(void *a1, const char *a2, ...)
{
  return [a1 tileHeight];
}

id objc_msgSend_tileWidth(void *a1, const char *a2, ...)
{
  return [a1 tileWidth];
}

id objc_msgSend_timeBaseDenominator(void *a1, const char *a2, ...)
{
  return [a1 timeBaseDenominator];
}

id objc_msgSend_timeBaseNumerator(void *a1, const char *a2, ...)
{
  return [a1 timeBaseNumerator];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_timestamps(void *a1, const char *a2, ...)
{
  return [a1 timestamps];
}

id objc_msgSend_timing(void *a1, const char *a2, ...)
{
  return [a1 timing];
}

id objc_msgSend_toArray(void *a1, const char *a2, ...)
{
  return [a1 toArray];
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return [a1 toDictionary];
}

id objc_msgSend_toDouble(void *a1, const char *a2, ...)
{
  return [a1 toDouble];
}

id objc_msgSend_toString(void *a1, const char *a2, ...)
{
  return [a1 toString];
}

id objc_msgSend_traceBufferIndex(void *a1, const char *a2, ...)
{
  return [a1 traceBufferIndex];
}

id objc_msgSend_traceName(void *a1, const char *a2, ...)
{
  return [a1 traceName];
}

id objc_msgSend_tracingDelegate(void *a1, const char *a2, ...)
{
  return [a1 tracingDelegate];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_tryCancel(void *a1, const char *a2, ...)
{
  return [a1 tryCancel];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unarchivedGPUTimelineData(void *a1, const char *a2, ...)
{
  return [a1 unarchivedGPUTimelineData];
}

id objc_msgSend_unarchivedShaderProfilerData(void *a1, const char *a2, ...)
{
  return [a1 unarchivedShaderProfilerData];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unmapShaderSampleBuffer(void *a1, const char *a2, ...)
{
  return [a1 unmapShaderSampleBuffer];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_unusedResourceKeys(void *a1, const char *a2, ...)
{
  return [a1 unusedResourceKeys];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_uscSamples(void *a1, const char *a2, ...)
{
  return [a1 uscSamples];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_vendorName(void *a1, const char *a2, ...)
{
  return [a1 vendorName];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_versionCombined(void *a1, const char *a2, ...)
{
  return [a1 versionCombined];
}

id objc_msgSend_vertexBindings(void *a1, const char *a2, ...)
{
  return [a1 vertexBindings];
}

id objc_msgSend_vertexBuffers(void *a1, const char *a2, ...)
{
  return [a1 vertexBuffers];
}

id objc_msgSend_vertexCount(void *a1, const char *a2, ...)
{
  return [a1 vertexCount];
}

id objc_msgSend_vertexDescriptor(void *a1, const char *a2, ...)
{
  return [a1 vertexDescriptor];
}

id objc_msgSend_vertexFunction(void *a1, const char *a2, ...)
{
  return [a1 vertexFunction];
}

id objc_msgSend_vertexIDs(void *a1, const char *a2, ...)
{
  return [a1 vertexIDs];
}

id objc_msgSend_vertexLinkedFunctions(void *a1, const char *a2, ...)
{
  return [a1 vertexLinkedFunctions];
}

id objc_msgSend_vertexPreloadedLibraries(void *a1, const char *a2, ...)
{
  return [a1 vertexPreloadedLibraries];
}

id objc_msgSend_vertexStart(void *a1, const char *a2, ...)
{
  return [a1 vertexStart];
}

id objc_msgSend_vertexTiming(void *a1, const char *a2, ...)
{
  return [a1 vertexTiming];
}

id objc_msgSend_verticalLogicalCoordinatesAtPhysicalTileBoundaries(void *a1, const char *a2, ...)
{
  return [a1 verticalLogicalCoordinatesAtPhysicalTileBoundaries];
}

id objc_msgSend_verticalSampleStorage(void *a1, const char *a2, ...)
{
  return [a1 verticalSampleStorage];
}

id objc_msgSend_virtualAddress(void *a1, const char *a2, ...)
{
  return [a1 virtualAddress];
}

id objc_msgSend_vmBuffer(void *a1, const char *a2, ...)
{
  return [a1 vmBuffer];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_waitForCompletion(void *a1, const char *a2, ...)
{
  return [a1 waitForCompletion];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_waitUntilCapacity(void *a1, const char *a2, ...)
{
  return [a1 waitUntilCapacity];
}

id objc_msgSend_waitUntilComplete(void *a1, const char *a2, ...)
{
  return [a1 waitUntilComplete];
}

id objc_msgSend_waitUntilCompleted(void *a1, const char *a2, ...)
{
  return [a1 waitUntilCompleted];
}

id objc_msgSend_waitUntilDownloadCapacity(void *a1, const char *a2, ...)
{
  return [a1 waitUntilDownloadCapacity];
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilFinished];
}

id objc_msgSend_waitUntilResolved(void *a1, const char *a2, ...)
{
  return [a1 waitUntilResolved];
}

id objc_msgSend_waitUntilScheduled(void *a1, const char *a2, ...)
{
  return [a1 waitUntilScheduled];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_windowProperties(void *a1, const char *a2, ...)
{
  return [a1 windowProperties];
}

id objc_msgSend_windowRect(void *a1, const char *a2, ...)
{
  return [a1 windowRect];
}

id objc_msgSend_writeGPUTimelineSerializedData(void *a1, const char *a2, ...)
{
  return [a1 writeGPUTimelineSerializedData];
}