@interface CSStoreValidate
@end

@implementation CSStoreValidate

void ___CSStoreValidate_block_invoke_3(uint64_t a1, CSStore2::Table *this)
{
  if (*((_DWORD *)this + 18) == 0x3FFFFFFF)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = (id) CSStore2::Table::copyCFName(this);
    (*(void (**)(uint64_t, const char *, ...))(v4 + 16))(v4, "Table %s (%llx) has no remaining unit identifiers.", (const char *)[(__CFString *)v5 UTF8String], (4 * *(_DWORD *)this));

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void ___CSStoreValidate_block_invoke_4(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = a2[19];
  if (v2 == -1) {
    return;
  }
  v5 = *(uint64_t **)(a1 + 48);
  uint64_t v6 = *(void *)(*v5 + 8);
  unsigned int v7 = *(_DWORD *)(v6 + 12);
  v8 = (unsigned int *)(v6 + v2);
  if (v7 <= v2) {
    v9 = 0;
  }
  else {
    v9 = v8;
  }
  v10 = (void (**)(void, const char *, ...))*(id *)(a1 + 32);
  v11 = v10;
  unsigned int v12 = *v9;
  if (*v9 - 16 > 0x1FF0)
  {
    v10[2](v10, "Nonsensical bucket count %llu", *v9);
    goto LABEL_140;
  }
  v13 = v9 + 1;
  uint64_t v14 = *v5;
  if (*v5) {
    unint64_t v15 = *(void *)(v14 + 8);
  }
  else {
    unint64_t v15 = 0;
  }
  unint64_t v16 = (unint64_t)v13 - v15;
  if ((unint64_t)v13 < v15 || HIDWORD(v16))
  {
    unint64_t v17 = *(void *)(v14 + 8);
    unsigned int v18 = *(_DWORD *)(v17 + 12);
    LODWORD(v16) = -1;
  }
  else
  {
    unint64_t v17 = *(void *)(v14 + 8);
    unsigned int v18 = *(_DWORD *)(v17 + 12);
    if ((int)v16 + 1 > v18 || v16 == -1) {
      LODWORD(v16) = -1;
    }
  }
  if (__CFADD__(v16, 8 * v12) || v16 + 8 * v12 > v18)
  {
    if (v14) {
      unint64_t v57 = v17;
    }
    else {
      unint64_t v57 = 0;
    }
    BOOL v54 = (unint64_t)v9 >= v57;
    unint64_t v58 = (unint64_t)v9 - v57;
    char v59 = !v54;
    BOOL v60 = (int)v58 + 1 > v18 || v58 == -1;
    BOOL v31 = !v60;
    uint64_t v61 = 0xFFFFFFFFLL;
    if (v31) {
      uint64_t v61 = v58;
    }
    if (HIDWORD(v58)) {
      uint64_t v61 = 0xFFFFFFFFLL;
    }
    if (v59) {
      uint64_t v61 = 0xFFFFFFFFLL;
    }
    v10[2](v10, "Hash map at %llu has invalid buckets range %llu-(%llu*%zu)", v61, v16, *v9, 8uLL);
    goto LABEL_140;
  }
  uint64_t v20 = 0;
  uint64_t v78 = *MEMORY[0x1E4FBA418];
  uint64_t v79 = *(void *)(MEMORY[0x1E4FBA418] + 24);
  if (v12 <= 1) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v12;
  }
  do
  {
    v22 = &v9[2 * v20];
    uint64_t v23 = v22[2];
    if (v23 != -1)
    {
      uint64_t v24 = v22[1];
      if (v24 >> 29
        || __CFADD__(v23, 8 * v24)
        || (uint64_t v25 = *(void *)(v14 + 8), v26 = *(_DWORD *)(v25 + 12), (int)v23 + 8 * (int)v24 > v26))
      {
        if (v14) {
          unint64_t v73 = v17;
        }
        else {
          unint64_t v73 = 0;
        }
        BOOL v54 = (unint64_t)v9 >= v73;
        unint64_t v74 = (unint64_t)v9 - v73;
        char v75 = !v54;
        unint64_t v76 = HIDWORD(v74);
        BOOL v77 = (int)v74 + 1 > v18 || v74 == -1;
        unint64_t v74 = v74;
        if (v77) {
          unint64_t v74 = 0xFFFFFFFFLL;
        }
        if (v76) {
          unint64_t v74 = 0xFFFFFFFFLL;
        }
        if (v75) {
          unint64_t v74 = 0xFFFFFFFFLL;
        }
        v10[2](v10, "Bucket [%llu,%llu] has invalid key-value pairs offset range %llu-(%llu*%zu)", v74, v20, v23, v24, 8uLL);
        goto LABEL_140;
      }
      uint64_t v27 = v25 + v23;
      uint64_t v28 = v26 <= v23 ? 0 : v27;
      if (v24)
      {
        uint64_t v29 = 0;
        v30 = (unsigned int *)(v28 + 4);
        while (1)
        {
          if (*v30 != -1)
          {
            BOOL v31 = v18 <= *v30 || v17 == 0;
            if (v31)
            {
              std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v82);
              std::ostream::operator<<();
              uint64_t v62 = *v5;
              if (*v5) {
                unint64_t v63 = *(void *)(v62 + 8);
              }
              else {
                unint64_t v63 = 0;
              }
              uint64_t v69 = 0xFFFFFFFFLL;
              BOOL v54 = (unint64_t)v9 >= v63;
              unint64_t v70 = (unint64_t)v9 - v63;
              if (v54 && !HIDWORD(v70))
              {
                if ((v70 + 1) > *(_DWORD *)(*(void *)(v62 + 8) + 12) || v70 == -1) {
                  uint64_t v69 = 0xFFFFFFFFLL;
                }
                else {
                  uint64_t v69 = v70;
                }
              }
              std::stringbuf::str();
              if (v81 >= 0) {
                p_p = (const char *)&__p;
              }
              else {
                p_p = (const char *)__p;
              }
              v11[2](v11, "Key-value pair [%llu,%llu,%llu] has invalid value (interpreted as Offset) %s", v69, v20, v29, p_p);
              if (v81 < 0) {
                operator delete(__p);
              }
              v82[0] = v78;
              *(void *)((char *)v82 + *(void *)(v78 - 24)) = v79;
              v82[1] = MEMORY[0x1E4FBA470] + 16;
              if (v83 < 0) {
                operator delete((void *)v82[9]);
              }
              std::streambuf::~streambuf();
              std::ostream::~ostream();
              MEMORY[0x1AD0DAC80](&v84);
              goto LABEL_140;
            }
            uint64_t v32 = (unsigned __int16)(*(v30 - 1) >> 2) % v12;
            if (v20 != v32) {
              break;
            }
          }
          ++v29;
          v30 += 2;
          if (v24 == v29) {
            goto LABEL_39;
          }
        }
        if (v14) {
          unint64_t v64 = v17;
        }
        else {
          unint64_t v64 = 0;
        }
        BOOL v54 = (unint64_t)v9 >= v64;
        unint64_t v65 = (unint64_t)v9 - v64;
        char v66 = !v54;
        unint64_t v67 = HIDWORD(v65);
        BOOL v68 = (int)v65 + 1 > v18 || v65 == -1;
        unint64_t v65 = v65;
        if (v68) {
          unint64_t v65 = 0xFFFFFFFFLL;
        }
        if (v67) {
          unint64_t v65 = 0xFFFFFFFFLL;
        }
        if (v66) {
          unint64_t v65 = 0xFFFFFFFFLL;
        }
        v10[2](v10, "Key-value pair [%llu,%llu,%llu] is in the wrong bucket (should be %llu)", v65, v20, v29, v32);
LABEL_140:

        return;
      }
    }
LABEL_39:
    ++v20;
  }
  while (v20 != v21);

  uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 8);
  char v34 = *(unsigned char *)(v33 + 24);
  unint64_t v35 = *v9;
  if (!v35) {
    goto LABEL_70;
  }
  uint64_t v36 = 0;
  uint64_t v37 = *(void *)(a1 + 48);
  while (2)
  {
    v38 = &v9[2 * v36];
    unsigned int v41 = v38[1];
    v40 = v38 + 1;
    unsigned int v39 = v41;
    if (v41 - 0x20000000 >= 0xE0000001)
    {
      uint64_t v42 = v9[2 * v36 + 2];
      unsigned int v43 = v42 + 8 * v39;
      if (!__CFADD__(v42, 8 * v39))
      {
        uint64_t v44 = *(void *)(*(void *)v37 + 8);
        unsigned int v45 = *(_DWORD *)(v44 + 12);
        if (v43 <= v45 && v45 > v42)
        {
          uint64_t v47 = 0;
          uint64_t v48 = v44 + v42;
          while (1)
          {
            uint64_t v49 = *(unsigned int *)(v48 + 4);
            if (v49 != -1)
            {
              uint64_t v50 = *(void *)(*(void *)v37 + 8);
              unsigned int v51 = *(_DWORD *)(v50 + 12);
              if (v51 <= v49)
              {
                (*(void (**)(void, const char *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), "Unit %llx in table %llx has an invalid address.");
                goto LABEL_63;
              }
              v52 = (_DWORD *)(v50 + v49);
              unsigned int v53 = *(_DWORD *)(v50 + v49 + 4);
              if (v53 >> 25)
              {
                (*(void (**)(void, const char *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), "Unit %llx is insanely long (payload %llu bytes long.)");
                goto LABEL_63;
              }
              if (v49 >= 0xFFFFFFF8
                || (int)v49 + 8 > v51
                || (BOOL v54 = __CFADD__(v49, v53 + 8), v55 = v49 + v53 + 8, v54)
                || v55 > v51)
              {
                (*(void (**)(void, const char *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), "Unit %llx is out of range (total %llu bytes long.)");
                goto LABEL_63;
              }
              unsigned int v56 = *v52 & 0xC0000000;
              if ((*a2 & 0x3FFFFFFF) != 0x3FFFDB5D)
              {
                if (v56 != 0x40000000) {
                  goto LABEL_64;
                }
LABEL_67:
                (*(void (**)(void, const char *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), "Unit %llx/%llx is garbage");
LABEL_63:
                char v34 = 0;
                goto LABEL_64;
              }
              if (v56 != 0x40000000) {
                goto LABEL_67;
              }
            }
LABEL_64:
            v48 += 8;
            if (++v47 >= (unint64_t)*v40)
            {
              unint64_t v35 = *v9;
              break;
            }
          }
        }
      }
    }
    if (++v36 < v35) {
      continue;
    }
    break;
  }
  uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_70:
  *(unsigned char *)(v33 + 24) = v34;
}

void ___CSStoreValidate_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v10 = (void *)MEMORY[0x1AD0DB160]();
  id v11 = [NSString alloc];
  unsigned int v12 = [NSString stringWithUTF8String:a2];
  v13 = (void *)[v11 initWithFormat:v12 arguments:&a9];

  uint64_t v14 = (FILE *)*MEMORY[0x1E4F143C8];
  id v15 = v13;
  fprintf(v14, "*** %s ***\n", (const char *)[v15 UTF8String]);
}

@end