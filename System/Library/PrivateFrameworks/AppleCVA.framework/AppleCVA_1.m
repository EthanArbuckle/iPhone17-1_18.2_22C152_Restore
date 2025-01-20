uint64_t sub_1D0E6054C(uint64_t a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  void *v4;
  int v5;
  size_t v6;
  char *p_dst;
  const void **v8;
  unint64_t v9;
  unint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  char **v15;
  unint64_t v16;
  uint64_t v17;
  size_t v18;
  char **v19;
  unint64_t v20;
  const char *v21;
  std::mutex *v22;
  uint64_t v23;
  FILE *v24;
  std::mutex *v25;
  uint64_t v26;
  FILE *v27;
  uint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  char *__dst;
  unint64_t v33;
  int64_t v34;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (!v2)
  {
    v4 = 0;
    v3 = 0;
    v5 = *(_DWORD *)(a1 + 120);
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
LABEL_10:
    v9 = *(void *)(a1 + 112);
    v10 = *(void *)(a1 + 72);
    if (v9 < v10)
    {
      *(void *)(a1 + 112) = v10;
      v9 = v10;
    }
    v8 = (const void **)(a1 + 64);
    goto LABEL_13;
  }
  v3 = std::__shared_weak_count::lock(v2);
  if (!v3)
  {
    v4 = 0;
    v5 = *(_DWORD *)(a1 + 120);
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  v4 = *(void **)a1;
  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x10) != 0) {
    goto LABEL_10;
  }
LABEL_6:
  if ((v5 & 8) == 0)
  {
    v6 = 0;
    HIBYTE(v34) = 0;
    p_dst = (char *)&__dst;
    goto LABEL_21;
  }
  v8 = (const void **)(a1 + 40);
  v9 = *(void *)(a1 + 56);
LABEL_13:
  v11 = *v8;
  v6 = v9 - (void)*v8;
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
    goto LABEL_75;
  }
  if (v6 >= 0x17)
  {
    v12 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      v12 = v6 | 7;
    }
    v13 = v12 + 1;
    p_dst = (char *)operator new(v12 + 1);
    v33 = v6;
    v34 = v13 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_20;
  }
  HIBYTE(v34) = v9 - *(unsigned char *)v8;
  p_dst = (char *)&__dst;
  if (v6) {
LABEL_20:
  }
    memmove(p_dst, v11, v6);
LABEL_21:
  p_dst[v6] = 0;
  if (SHIBYTE(v34) < 0)
  {
    v14 = v33;
    if (!v33) {
      goto LABEL_46;
    }
    v15 = (char **)__dst;
    if (__dst[v33 - 1] == 10) {
      goto LABEL_46;
    }
    if (v33 != (v34 & 0x7FFFFFFFFFFFFFFFLL) - 1)
    {
      v19 = (char **)__dst;
LABEL_44:
      v33 = v14 + 1;
      goto LABEL_45;
    }
    if ((v34 & 0x7FFFFFFFFFFFFFFFLL) != 0x7FFFFFFFFFFFFFF8)
    {
      if (v33 > 0x3FFFFFFFFFFFFFF2)
      {
        v18 = 0x7FFFFFFFFFFFFFF7;
LABEL_39:
        v19 = (char **)operator new(v18);
        memmove(v19, v15, v14);
        if (v14 != 22) {
          operator delete(v15);
        }
        __dst = (char *)v19;
        v34 = v18 | 0x8000000000000000;
        goto LABEL_44;
      }
LABEL_31:
      if (v14 + 1 > 2 * v14) {
        v16 = v14 + 1;
      }
      else {
        v16 = 2 * v14;
      }
      v17 = (v16 & 0x7FFFFFFFFFFFFFF8) + 8;
      if ((v16 | 7) != 0x17) {
        v17 = v16 | 7;
      }
      if (v16 >= 0x17) {
        v18 = v17 + 1;
      }
      else {
        v18 = 23;
      }
      goto LABEL_39;
    }
LABEL_75:
    abort();
  }
  if (HIBYTE(v34))
  {
    v14 = HIBYTE(v34);
    if (*((unsigned char *)&__dst + HIBYTE(v34) - 1) != 10)
    {
      if (HIBYTE(v34) != 22)
      {
        HIBYTE(v34) = (HIBYTE(v34) + 1) & 0x7F;
        v19 = &__dst;
LABEL_45:
        *(_WORD *)((char *)v19 + v14) = 10;
        goto LABEL_46;
      }
      v15 = &__dst;
      v14 = 22;
      goto LABEL_31;
    }
  }
LABEL_46:
  if (v4)
  {
    v20 = HIBYTE(v34);
    if (v34 < 0) {
      v20 = v33;
    }
    if (v20)
    {
      if (v34 >= 0) {
        v21 = (const char *)&__dst;
      }
      else {
        v21 = __dst;
      }
      v22 = (std::mutex *)(*v4 + 8);
      std::mutex::lock(v22);
      v23 = *v4;
      if (*(unsigned char *)*v4)
      {
        fputs(v21, (FILE *)*MEMORY[0x1E4F143D8]);
        v23 = *v4;
      }
      v24 = *(FILE **)(v23 + 72);
      if (v24) {
        fputs(v21, v24);
      }
      std::mutex::unlock(v22);
    }
    if (*(unsigned char *)(a1 + 280))
    {
      v25 = (std::mutex *)(*v4 + 8);
      std::mutex::lock(v25);
      v26 = *v4;
      if (*(unsigned char *)*v4)
      {
        fflush((FILE *)*MEMORY[0x1E4F143D8]);
        v26 = *v4;
      }
      v27 = *(FILE **)(v26 + 72);
      if (v27) {
        fflush(v27);
      }
      std::mutex::unlock(v25);
    }
  }
  if (SHIBYTE(v34) < 0) {
    operator delete(__dst);
  }
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  v28 = MEMORY[0x1E4FBA418];
  v29 = *MEMORY[0x1E4FBA418];
  *(void *)(a1 + 16) = *MEMORY[0x1E4FBA418];
  *(void *)(a1 + 16 + *(void *)(v29 - 24)) = *(void *)(v28 + 24);
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1D25F1640](a1 + 128);
  v30 = *(std::__shared_weak_count **)(a1 + 8);
  if (v30) {
    std::__shared_weak_count::__release_weak(v30);
  }
  return a1;
}

uint64_t sub_1D0E609A4(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 8) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v2 = memptr;
  *(void *)a1 = memptr;
  *(_DWORD *)(a1 + 16) = 7;
  memset_pattern16(v2, &unk_1D0E818F0, 0x38uLL);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v3 = memptr;
  *(void *)(a1 + 24) = memptr;
  *(_DWORD *)(a1 + 40) = 7;
  memset_pattern16(v3, &unk_1D0E818F0, 0x38uLL);
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(void *)(a1 + 56) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v4 = memptr;
  *(void *)(a1 + 48) = memptr;
  *(_DWORD *)(a1 + 64) = 7;
  memset_pattern16(v4, &unk_1D0E818F0, 0x38uLL);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v5 = memptr;
  *(void *)(a1 + 72) = memptr;
  *(_DWORD *)(a1 + 88) = 7;
  memset_pattern16(v5, &unk_1D0E818F0, 0x38uLL);
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(void *)(a1 + 104) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v6 = memptr;
  *(void *)(a1 + 96) = memptr;
  *(_DWORD *)(a1 + 112) = 7;
  memset_pattern16(v6, &unk_1D0E818F0, 0x38uLL);
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v7 = memptr;
  *(void *)(a1 + 120) = memptr;
  *(_DWORD *)(a1 + 136) = 7;
  memset_pattern16(v7, &unk_1D0E818F0, 0x38uLL);
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 8;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x20uLL, 0x49090899uLL);
  *(void *)(a1 + 144) = memptr;
  *(_DWORD *)(a1 + 160) = 7;
  v8 = operator new(7uLL);
  *(void *)(a1 + 168) = v8;
  _DWORD *v8 = 0;
  *(_DWORD *)((char *)v8 + 3) = 0;
  *(void *)(a1 + 176) = (char *)v8 + 7;
  *(void *)(a1 + 184) = (char *)v8 + 7;
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 200) = 8;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x20uLL, 0x49090899uLL);
  *(void *)(a1 + 192) = memptr;
  *(_DWORD *)(a1 + 208) = 7;
  v9 = operator new(7uLL);
  *(void *)(a1 + 216) = v9;
  _DWORD *v9 = 0;
  *(_DWORD *)((char *)v9 + 3) = 0;
  *(void *)(a1 + 224) = (char *)v9 + 7;
  *(void *)(a1 + 232) = (char *)v9 + 7;
  if (2 * *(_DWORD *)(a1 + 16)) {
    memset_pattern16(*(void **)a1, &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 16)));
  }
  if (2 * *(_DWORD *)(a1 + 40)) {
    memset_pattern16(*(void **)(a1 + 24), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 40)));
  }
  if (2 * *(_DWORD *)(a1 + 64)) {
    memset_pattern16(*(void **)(a1 + 48), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 64)));
  }
  if (2 * *(_DWORD *)(a1 + 88)) {
    memset_pattern16(*(void **)(a1 + 72), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 88)));
  }
  if (2 * *(_DWORD *)(a1 + 112)) {
    memset_pattern16(*(void **)(a1 + 96), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 112)));
  }
  if (2 * *(_DWORD *)(a1 + 136)) {
    memset_pattern16(*(void **)(a1 + 120), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 136)));
  }
  LOBYTE(memptr) = 0;
  sub_1D0E34A90(a1 + 168, *(void *)(a1 + 176) - *(void *)(a1 + 168), (const char *)&memptr);
  uint64_t v10 = *(unsigned int *)(a1 + 160);
  if (v10) {
    bzero(*(void **)(a1 + 144), 4 * v10);
  }
  LOBYTE(memptr) = 0;
  sub_1D0E34A90(a1 + 216, *(void *)(a1 + 224) - *(void *)(a1 + 216), (const char *)&memptr);
  uint64_t v11 = *(unsigned int *)(a1 + 208);
  if (v11) {
    bzero(*(void **)(a1 + 192), 4 * v11);
  }
  return a1;
}

uint64_t sub_1D0E60D20(uint64_t a1)
{
  v2 = *(void **)(a1 + 216);
  if (v2)
  {
    *(void *)(a1 + 224) = v2;
    operator delete(v2);
  }
  free(*(void **)(a1 + 192));
  v3 = *(void **)(a1 + 168);
  if (v3)
  {
    *(void *)(a1 + 176) = v3;
    operator delete(v3);
  }
  free(*(void **)(a1 + 144));
  free(*(void **)(a1 + 120));
  free(*(void **)(a1 + 96));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 24));
  free(*(void **)a1);
  return a1;
}

uint64_t sub_1D0E60DA4(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 8) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v2 = memptr;
  *(void *)a1 = memptr;
  *(_DWORD *)(a1 + 16) = 6;
  memset_pattern16(v2, &unk_1D0E818F0, 0x30uLL);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v3 = memptr;
  *(void *)(a1 + 24) = memptr;
  *(_DWORD *)(a1 + 40) = 6;
  memset_pattern16(v3, &unk_1D0E818F0, 0x30uLL);
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(void *)(a1 + 56) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v4 = memptr;
  *(void *)(a1 + 48) = memptr;
  *(_DWORD *)(a1 + 64) = 6;
  memset_pattern16(v4, &unk_1D0E818F0, 0x30uLL);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v5 = memptr;
  *(void *)(a1 + 72) = memptr;
  *(_DWORD *)(a1 + 88) = 6;
  memset_pattern16(v5, &unk_1D0E818F0, 0x30uLL);
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(void *)(a1 + 104) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v6 = memptr;
  *(void *)(a1 + 96) = memptr;
  *(_DWORD *)(a1 + 112) = 6;
  memset_pattern16(v6, &unk_1D0E818F0, 0x30uLL);
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v7 = memptr;
  *(void *)(a1 + 120) = memptr;
  *(_DWORD *)(a1 + 136) = 6;
  memset_pattern16(v7, &unk_1D0E818F0, 0x30uLL);
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 8;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x20uLL, 0x49090899uLL);
  *(void *)(a1 + 144) = memptr;
  *(_DWORD *)(a1 + 160) = 6;
  v8 = operator new(6uLL);
  *(void *)(a1 + 168) = v8;
  *(_DWORD *)v8 = 0;
  v8[2] = 0;
  *(void *)(a1 + 176) = v8 + 3;
  *(void *)(a1 + 184) = v8 + 3;
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 200) = 8;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x20uLL, 0x49090899uLL);
  *(void *)(a1 + 192) = memptr;
  *(_DWORD *)(a1 + 208) = 6;
  v9 = operator new(6uLL);
  *(void *)(a1 + 216) = v9;
  *(_DWORD *)v9 = 0;
  v9[2] = 0;
  *(void *)(a1 + 224) = v9 + 3;
  *(void *)(a1 + 232) = v9 + 3;
  if (2 * *(_DWORD *)(a1 + 16)) {
    memset_pattern16(*(void **)a1, &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 16)));
  }
  if (2 * *(_DWORD *)(a1 + 40)) {
    memset_pattern16(*(void **)(a1 + 24), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 40)));
  }
  if (2 * *(_DWORD *)(a1 + 64)) {
    memset_pattern16(*(void **)(a1 + 48), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 64)));
  }
  if (2 * *(_DWORD *)(a1 + 88)) {
    memset_pattern16(*(void **)(a1 + 72), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 88)));
  }
  if (2 * *(_DWORD *)(a1 + 112)) {
    memset_pattern16(*(void **)(a1 + 96), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 112)));
  }
  if (2 * *(_DWORD *)(a1 + 136)) {
    memset_pattern16(*(void **)(a1 + 120), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 136)));
  }
  LOBYTE(memptr) = 0;
  sub_1D0E34A90(a1 + 168, *(void *)(a1 + 176) - *(void *)(a1 + 168), (const char *)&memptr);
  uint64_t v10 = *(unsigned int *)(a1 + 160);
  if (v10) {
    bzero(*(void **)(a1 + 144), 4 * v10);
  }
  LOBYTE(memptr) = 0;
  sub_1D0E34A90(a1 + 216, *(void *)(a1 + 224) - *(void *)(a1 + 216), (const char *)&memptr);
  uint64_t v11 = *(unsigned int *)(a1 + 208);
  if (v11) {
    bzero(*(void **)(a1 + 192), 4 * v11);
  }
  return a1;
}

uint64_t sub_1D0E61120(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 40;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0xA0uLL, 0x49090899uLL);
  v2 = memptr;
  *(void *)a1 = memptr;
  *(_DWORD *)(a1 + 16) = 20;
  memset_pattern16(v2, &unk_1D0E818F0, 0xA0uLL);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 40;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0xA0uLL, 0x49090899uLL);
  v3 = memptr;
  *(void *)(a1 + 24) = memptr;
  *(_DWORD *)(a1 + 40) = 20;
  memset_pattern16(v3, &unk_1D0E818F0, 0xA0uLL);
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 40;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0xA0uLL, 0x49090899uLL);
  v4 = memptr;
  *(void *)(a1 + 48) = memptr;
  *(_DWORD *)(a1 + 64) = 20;
  memset_pattern16(v4, &unk_1D0E818F0, 0xA0uLL);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 24;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x60uLL, 0x49090899uLL);
  *(void *)(a1 + 72) = memptr;
  *(_DWORD *)(a1 + 88) = 20;
  v5 = operator new(0x14uLL);
  *(void *)(a1 + 96) = v5;
  void *v5 = 0;
  v5[1] = 0;
  *((_DWORD *)v5 + 4) = 0;
  *(void *)(a1 + 104) = (char *)v5 + 20;
  *(void *)(a1 + 112) = (char *)v5 + 20;
  if (2 * *(_DWORD *)(a1 + 16)) {
    memset_pattern16(*(void **)a1, &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 16)));
  }
  if (2 * *(_DWORD *)(a1 + 40)) {
    memset_pattern16(*(void **)(a1 + 24), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 40)));
  }
  if (2 * *(_DWORD *)(a1 + 64)) {
    memset_pattern16(*(void **)(a1 + 48), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 64)));
  }
  LOBYTE(memptr) = 0;
  sub_1D0E34A90(a1 + 96, 0x14uLL, (const char *)&memptr);
  uint64_t v6 = *(unsigned int *)(a1 + 88);
  if (v6) {
    bzero(*(void **)(a1 + 72), 4 * v6);
  }
  return a1;
}

uint64_t sub_1D0E612E4(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 32;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x80uLL, 0x49090899uLL);
  v2 = memptr;
  *(void *)a1 = memptr;
  *(_DWORD *)(a1 + 16) = 13;
  memset_pattern16(v2, &unk_1D0E818F0, 0x68uLL);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 32;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x80uLL, 0x49090899uLL);
  v3 = memptr;
  *(void *)(a1 + 24) = memptr;
  *(_DWORD *)(a1 + 40) = 13;
  memset_pattern16(v3, &unk_1D0E818F0, 0x68uLL);
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 32;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x80uLL, 0x49090899uLL);
  v4 = memptr;
  *(void *)(a1 + 48) = memptr;
  *(_DWORD *)(a1 + 64) = 13;
  memset_pattern16(v4, &unk_1D0E818F0, 0x68uLL);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 16;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  *(void *)(a1 + 72) = memptr;
  *(_DWORD *)(a1 + 88) = 13;
  v5 = operator new(0xDuLL);
  *(void *)(a1 + 96) = v5;
  void *v5 = 0;
  *(void *)((char *)v5 + 5) = 0;
  *(void *)(a1 + 104) = (char *)v5 + 13;
  *(void *)(a1 + 112) = (char *)v5 + 13;
  if (2 * *(_DWORD *)(a1 + 16)) {
    memset_pattern16(*(void **)a1, &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 16)));
  }
  if (2 * *(_DWORD *)(a1 + 40)) {
    memset_pattern16(*(void **)(a1 + 24), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 40)));
  }
  if (2 * *(_DWORD *)(a1 + 64)) {
    memset_pattern16(*(void **)(a1 + 48), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 64)));
  }
  LOBYTE(memptr) = 0;
  sub_1D0E34A90(a1 + 96, 0xDuLL, (const char *)&memptr);
  uint64_t v6 = *(unsigned int *)(a1 + 88);
  if (v6) {
    bzero(*(void **)(a1 + 72), 4 * v6);
  }
  return a1;
}

uint64_t sub_1D0E614A8(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 40;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0xA0uLL, 0x49090899uLL);
  v2 = memptr;
  *(void *)a1 = memptr;
  *(_DWORD *)(a1 + 16) = 17;
  memset_pattern16(v2, &unk_1D0E818F0, 0x88uLL);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 40;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0xA0uLL, 0x49090899uLL);
  v3 = memptr;
  *(void *)(a1 + 24) = memptr;
  *(_DWORD *)(a1 + 40) = 17;
  memset_pattern16(v3, &unk_1D0E818F0, 0x88uLL);
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 40;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0xA0uLL, 0x49090899uLL);
  v4 = memptr;
  *(void *)(a1 + 48) = memptr;
  *(_DWORD *)(a1 + 64) = 17;
  memset_pattern16(v4, &unk_1D0E818F0, 0x88uLL);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 24;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x60uLL, 0x49090899uLL);
  *(void *)(a1 + 72) = memptr;
  *(_DWORD *)(a1 + 88) = 17;
  v5 = operator new(0x11uLL);
  *(void *)(a1 + 96) = v5;
  void *v5 = 0;
  v5[1] = 0;
  *((unsigned char *)v5 + 16) = 0;
  *(void *)(a1 + 104) = (char *)v5 + 17;
  *(void *)(a1 + 112) = (char *)v5 + 17;
  if (2 * *(_DWORD *)(a1 + 16)) {
    memset_pattern16(*(void **)a1, &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 16)));
  }
  if (2 * *(_DWORD *)(a1 + 40)) {
    memset_pattern16(*(void **)(a1 + 24), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 40)));
  }
  if (2 * *(_DWORD *)(a1 + 64)) {
    memset_pattern16(*(void **)(a1 + 48), &unk_1D0E818F0, 4 * (2 * *(_DWORD *)(a1 + 64)));
  }
  LOBYTE(memptr) = 0;
  sub_1D0E34A90(a1 + 96, 0x11uLL, (const char *)&memptr);
  uint64_t v6 = *(unsigned int *)(a1 + 88);
  if (v6) {
    bzero(*(void **)(a1 + 72), 4 * v6);
  }
  return a1;
}

void sub_1D0E6166C(void *a1)
{
  v1 = (void *)((char *)a1 + *(void *)(*a1 - 24));
  void *v1 = &unk_1F26F4A68;
  v1[54] = off_1F26F4AB8;
  v1[2] = off_1F26F4A90;
  MEMORY[0x1D25F1350](v1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x1D25F1640](v1 + 54);
  JUMPOUT(0x1D25F16B0);
}

void sub_1D0E61740(void *a1)
{
  v1 = (void *)((char *)a1 + *(void *)(*a1 - 24));
  void *v1 = &unk_1F26F4A68;
  v1[54] = off_1F26F4AB8;
  v1[2] = off_1F26F4A90;
  MEMORY[0x1D25F1350](v1 + 3);
  std::iostream::~basic_iostream();
  JUMPOUT(0x1D25F1640);
}

void sub_1D0E617FC(void *a1)
{
  *(a1 - 2) = &unk_1F26F4A68;
  v1 = a1 + 52;
  a1[52] = off_1F26F4AB8;
  *a1 = off_1F26F4A90;
  MEMORY[0x1D25F1350](a1 + 1);
  std::iostream::~basic_iostream();
  MEMORY[0x1D25F1640](v1);
  JUMPOUT(0x1D25F16B0);
}

void sub_1D0E618B4(void *a1)
{
  *(a1 - 2) = &unk_1F26F4A68;
  a1[52] = off_1F26F4AB8;
  *a1 = off_1F26F4A90;
  MEMORY[0x1D25F1350](a1 + 1);
  std::iostream::~basic_iostream();
  JUMPOUT(0x1D25F1640);
}

void sub_1D0E61954(void *a1)
{
  *a1 = &unk_1F26F4A68;
  v1 = a1 + 54;
  a1[54] = off_1F26F4AB8;
  a1[2] = off_1F26F4A90;
  MEMORY[0x1D25F1350](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x1D25F1640](v1);
  JUMPOUT(0x1D25F16B0);
}

void *sub_1D0E61A14(void *a1)
{
  *a1 = &unk_1F26F4A68;
  v2 = a1 + 54;
  a1[54] = off_1F26F4AB8;
  a1[2] = off_1F26F4A90;
  MEMORY[0x1D25F1350](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x1D25F1640](v2);
  return a1;
}

uint64_t sub_1D0E61AB4(uint64_t a1, _DWORD *a2)
{
  v41[0] = 0;
  v41[1] = 0;
  int64_t v42 = 0;
  LOBYTE(v43[0]) = 0;
  while ((*(uint64_t (**)(void, void *, uint64_t))(**(void **)(a1 + 8) + 88))(*(void *)(a1 + 8), v43, 1) == 1)
  {
    if (LOBYTE(v43[0]) > 0x20u || ((1 << SLOBYTE(v43[0])) & 0x100002600) == 0) {
      break;
    }
    uint64_t v4 = *(void *)(a1 + 8);
    if (*(_DWORD *)(v4 + 8) != 2)
    {
      uint64_t v5 = (*(uint64_t (**)(void, void *, uint64_t))(*(void *)v4 + 144))(*(void *)(a1 + 8), v43, 1);
      if (v5 >= 1) {
        *(void *)(v4 + 16) += v5;
      }
    }
  }
  LOBYTE(v41[0]) = 0;
  HIBYTE(v42) = 0;
  LOBYTE(v43[0]) = 0;
  while (1)
  {
    uint64_t v9 = *(void *)(a1 + 8);
    if (*(_DWORD *)(v9 + 8) == 2) {
      break;
    }
    uint64_t v10 = (*(uint64_t (**)(void, void *, uint64_t))(*(void *)v9 + 144))(*(void *)(a1 + 8), v43, 1);
    if (v10 < 1) {
      break;
    }
    *(void *)(v9 + 16) += v10;
    if (v10 != 1) {
      break;
    }
    char v11 = v43[0];
    if (LOBYTE(v43[0]) <= 0x20u && ((1 << SLOBYTE(v43[0])) & 0x100002600) != 0) {
      break;
    }
    if ((SHIBYTE(v42) & 0x80000000) == 0)
    {
      if (HIBYTE(v42) != 22)
      {
        size_t v6 = HIBYTE(v42);
        HIBYTE(v42) = (HIBYTE(v42) + 1) & 0x7F;
        v7 = v41;
        goto LABEL_13;
      }
      v13 = v41;
      size_t v6 = 22;
LABEL_28:
      if (v6 + 1 > 2 * v6) {
        unint64_t v14 = v6 + 1;
      }
      else {
        unint64_t v14 = 2 * v6;
      }
      uint64_t v15 = (v14 & 0x7FFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17) {
        uint64_t v15 = v14 | 7;
      }
      if (v14 >= 0x17) {
        size_t v16 = v15 + 1;
      }
      else {
        size_t v16 = 23;
      }
      goto LABEL_36;
    }
    size_t v6 = (v42 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v41[1] == (void *)v6)
    {
      if ((v42 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
        abort();
      }
      v13 = (void **)v41[0];
      if (v6 <= 0x3FFFFFFFFFFFFFF2) {
        goto LABEL_28;
      }
      size_t v16 = 0x7FFFFFFFFFFFFFF7;
LABEL_36:
      v17 = (void **)operator new(v16);
      v7 = v17;
      if (!v6 || (memmove(v17, v13, v6), v6 != 22)) {
        operator delete(v13);
      }
      v41[0] = v7;
      int64_t v42 = v16 | 0x8000000000000000;
      goto LABEL_41;
    }
    v7 = (void **)v41[0];
    size_t v6 = (size_t)v41[1];
LABEL_41:
    v41[1] = (void *)(v6 + 1);
LABEL_13:
    v8 = (char *)v7 + v6;
    unsigned char *v8 = v11;
    v8[1] = 0;
  }
  v18 = (void *)HIBYTE(v42);
  char v19 = HIBYTE(v42);
  if (v42 < 0) {
    v18 = v41[1];
  }
  *(unsigned char *)(a1 + 64) = v18 != 0;
  if (v18)
  {
    v52[0] = 0;
    uint64_t v39 = MEMORY[0x1E4FBA488] + 24;
    uint64_t v20 = MEMORY[0x1E4FBA488] + 104;
    v51[0] = MEMORY[0x1E4FBA488] + 104;
    uint64_t v21 = MEMORY[0x1E4FBA488] + 64;
    uint64_t v44 = MEMORY[0x1E4FBA488] + 64;
    v22 = (void *)MEMORY[0x1E4FBA408];
    uint64_t v23 = *(void *)(MEMORY[0x1E4FBA408] + 24);
    v43[0] = *(void *)(MEMORY[0x1E4FBA408] + 16);
    *(void *)((char *)v43 + *(void *)(v43[0] - 24)) = v23;
    v43[1] = 0;
    v24 = (std::ios_base *)((char *)v43 + *(void *)(v43[0] - 24));
    std::ios_base::init(v24, v45);
    v24[1].__vftable = 0;
    v24[1].__fmtflags_ = -1;
    v25 = v22;
    uint64_t v26 = v22[5];
    uint64_t v44 = v22[4];
    *(void *)((char *)&v45[-1] + *(void *)(v44 - 24)) = v26;
    v43[0] = v22[1];
    *(void *)((char *)v43 + *(void *)(v43[0] - 24)) = v22[6];
    v51[0] = v20;
    v43[0] = v39;
    uint64_t v44 = v21;
    std::streambuf::basic_streambuf();
    uint64_t v27 = MEMORY[0x1E4FBA470] + 16;
    v45[0] = MEMORY[0x1E4FBA470] + 16;
    v28 = (std::string *)__p;
    *(_OWORD *)__p = 0u;
    long long v49 = 0u;
    int v50 = 24;
    if (SHIBYTE(v42) < 0)
    {
      v28 = (std::string *)sub_1D0DF922C(__p, v41[0], (size_t)v41[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v41;
      *(void *)&long long v49 = v42;
    }
    *((void *)&v49 + 1) = 0;
    v29 = (void *)BYTE7(v49);
    if ((SBYTE7(v49) & 0x80u) == 0) {
      v30 = v28;
    }
    else {
      v30 = (std::string *)__p[0];
    }
    if ((SBYTE7(v49) & 0x80u) == 0) {
      unint64_t v31 = BYTE7(v49);
    }
    else {
      unint64_t v31 = (unint64_t)__p[1];
    }
    if ((v50 & 8) != 0)
    {
      v45[2] = v30;
      v45[3] = v30;
      *((void *)&v49 + 1) = (char *)v30 + v31;
      v45[4] = (char *)v30 + v31;
    }
    if ((v50 & 0x10) != 0)
    {
      *((void *)&v49 + 1) = (char *)v30 + v31;
      if ((BYTE7(v49) & 0x80) != 0)
      {
        v29 = __p[1];
        unint64_t v32 = (v49 & 0x7FFFFFFFFFFFFFFFLL) - 1;
        if (__p[1] < (void *)v32) {
          goto LABEL_62;
        }
        v28 = (std::string *)__p[0];
        __p[1] = (void *)((v49 & 0x7FFFFFFFFFFFFFFFLL) - 1);
LABEL_64:
        v28->__r_.__value_.__s.__data_[v32] = 0;
      }
      else
      {
        unint64_t v32 = 22;
        if (BYTE7(v49) > 0x15u)
        {
          BYTE7(v49) = 22;
          goto LABEL_64;
        }
LABEL_62:
        std::string::append(v28, v32 - (void)v29, 0);
      }
      v33 = (char *)BYTE7(v49);
      if (SBYTE7(v49) < 0) {
        v33 = (char *)__p[1];
      }
      v45[5] = v30;
      v46 = v30;
      v47 = &v33[(void)v30];
      if ((v50 & 3) != 0)
      {
        if (v31 >> 31)
        {
          uint64_t v34 = ((v31 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
          unint64_t v35 = 0x7FFFFFFF * ((v34 + ((v31 - 0x80000000 - v34) >> 1)) >> 30);
          v30 = (std::string *)((char *)v30 + v35 + 0x7FFFFFFF);
          unint64_t v31 = v31 - v35 - 0x7FFFFFFF;
          v46 = v30;
        }
        if (v31) {
          v46 = (std::string *)((char *)v30 + v31);
        }
      }
    }
    MEMORY[0x1D25F13A0](v43, v52);
    int v36 = v52[0];
    v43[0] = *v25;
    uint64_t v37 = v25[9];
    *(void *)((char *)v43 + *(void *)(v43[0] - 24)) = v25[8];
    uint64_t v44 = v37;
    v45[0] = v27;
    if (SBYTE7(v49) < 0) {
      operator delete(__p[0]);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x1D25F1640](v51);
    *a2 = v36;
    char v19 = HIBYTE(v42);
  }
  if (v19 < 0) {
    operator delete(v41[0]);
  }
  return a1;
}

float *sub_1D0E62278(float *result, float **a2)
{
  v2 = result;
  v3 = *a2;
  if (*a2 == result || (uint64_t v4 = a2[1], v4 == result))
  {
    uint64_t v5 = 0;
    result = (float *)sub_1D0E62278(&v5);
    *(void *)v2 = v5;
  }
  else
  {
    *result = (float)((float)((float)((float)(*v3 * *v4) + 0.0) + (float)(v3[2] * v4[1])) + (float)(v3[4] * v4[2]))
            + (float)(v3[6] * v4[3]);
    result[1] = (float)((float)((float)((float)(v3[1] * *v4) + 0.0) + (float)(v3[3] * v4[1])) + (float)(v3[5] * v4[2]))
              + (float)(v3[7] * v4[3]);
  }
  return result;
}

void sub_1D0E6232C()
{
}

uint64_t sub_1D0E623A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 16);
  size_t v5 = (4 * v4 + 31) & 0x7FFFFFFE0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = v5 >> 2;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, v5, 0x49090899uLL);
  size_t v6 = memptr;
  *(void *)a1 = memptr;
  if (v4) {
    memcpy(v6, *(const void **)a2, 4 * v4);
  }
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = 0;
  v8 = *(unsigned char **)(a2 + 24);
  v7 = *(unsigned char **)(a2 + 32);
  size_t v9 = v7 - v8;
  if (v7 != v8)
  {
    if ((v9 & 0x8000000000000000) != 0) {
      goto LABEL_12;
    }
    uint64_t v10 = (char *)operator new(v7 - v8);
    *(void *)(a1 + 24) = v10;
    *(void *)(a1 + 32) = v10;
    char v11 = &v10[v9];
    *(void *)(a1 + 40) = &v10[v9];
    memcpy(v10, v8, v9);
    *(void *)(a1 + 32) = v11;
  }
  uint64_t v12 = *(unsigned int *)(a2 + 64);
  size_t v13 = (4 * v12 + 31) & 0x7FFFFFFE0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v13 >> 2;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, v13, 0x49090899uLL);
  unint64_t v14 = memptr;
  *(void *)(a1 + 48) = memptr;
  if (v12) {
    memcpy(v14, *(const void **)(a2 + 48), 4 * v12);
  }
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 72) = 0;
  size_t v16 = *(unsigned char **)(a2 + 72);
  uint64_t v15 = *(unsigned char **)(a2 + 80);
  size_t v17 = v15 - v16;
  if (v15 != v16)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      v18 = (char *)operator new(v15 - v16);
      *(void *)(a1 + 72) = v18;
      *(void *)(a1 + 80) = v18;
      char v19 = &v18[v17];
      *(void *)(a1 + 88) = &v18[v17];
      memcpy(v18, v16, v17);
      *(void *)(a1 + 80) = v19;
      return a1;
    }
LABEL_12:
    abort();
  }
  return a1;
}

void sub_1D0E624FC()
{
}

uint64_t *sub_1D0E62E50(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  sub_1D0E63538(*a1, a2);
  sub_1D0E63538(v4 + 48, a2 + 48);
  sub_1D0E63538(v4 + 96, a2 + 96);
  sub_1D0E63674(v4 + 144, a2 + 144);
  sub_1D0E63538(v4 + 240, a2 + 240);
  sub_1D0E63538(v4 + 288, a2 + 288);
  sub_1D0E63538(v4 + 336, a2 + 336);
  sub_1D0E63674(v4 + 384, a2 + 384);
  if (v4 != a2)
  {
    unint64_t v5 = (2 * *(_DWORD *)(a2 + 496));
    if (v5)
    {
      size_t v6 = *(void **)(v4 + 480);
      size_t v7 = 4 * v5;
      if (*(void *)(v4 + 488) < v5)
      {
        free(v6);
        size_t v8 = (v7 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 480) = 0;
        *(void *)(v4 + 488) = v8 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v8, 0x49090899uLL);
        size_t v6 = memptr;
        *(void *)(v4 + 480) = memptr;
      }
      memcpy(v6, *(const void **)(a2 + 480), v7);
    }
    else
    {
      free(*(void **)(v4 + 480));
      *(void *)(v4 + 480) = 0;
      *(void *)(v4 + 488) = 0;
    }
    *(_DWORD *)(v4 + 496) = *(_DWORD *)(a2 + 496);
    unint64_t v9 = (2 * *(_DWORD *)(a2 + 520));
    if (v9)
    {
      uint64_t v10 = *(void **)(v4 + 504);
      size_t v11 = 4 * v9;
      if (*(void *)(v4 + 512) < v9)
      {
        free(v10);
        size_t v12 = (v11 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 504) = 0;
        *(void *)(v4 + 512) = v12 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v12, 0x49090899uLL);
        uint64_t v10 = memptr;
        *(void *)(v4 + 504) = memptr;
      }
      memcpy(v10, *(const void **)(a2 + 504), v11);
    }
    else
    {
      free(*(void **)(v4 + 504));
      *(void *)(v4 + 504) = 0;
      *(void *)(v4 + 512) = 0;
    }
    *(_DWORD *)(v4 + 520) = *(_DWORD *)(a2 + 520);
    unint64_t v13 = (2 * *(_DWORD *)(a2 + 544));
    if (v13)
    {
      unint64_t v14 = *(void **)(v4 + 528);
      size_t v15 = 4 * v13;
      if (*(void *)(v4 + 536) < v13)
      {
        free(v14);
        *(void *)(v4 + 528) = 0;
        size_t v16 = (v15 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 536) = v16 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v16, 0x49090899uLL);
        unint64_t v14 = memptr;
        *(void *)(v4 + 528) = memptr;
      }
      memcpy(v14, *(const void **)(a2 + 528), v15);
    }
    else
    {
      free(*(void **)(v4 + 528));
      *(void *)(v4 + 528) = 0;
      *(void *)(v4 + 536) = 0;
    }
    *(_DWORD *)(v4 + 544) = *(_DWORD *)(a2 + 544);
    unint64_t v17 = *(unsigned int *)(a2 + 568);
    if (v17)
    {
      v18 = *(void **)(v4 + 552);
      size_t v19 = 4 * v17;
      if (*(void *)(v4 + 560) < v17)
      {
        free(v18);
        *(void *)(v4 + 552) = 0;
        size_t v20 = (v19 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 560) = v20 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v20, 0x49090899uLL);
        v18 = memptr;
        *(void *)(v4 + 552) = memptr;
      }
      memcpy(v18, *(const void **)(a2 + 552), v19);
    }
    else
    {
      free(*(void **)(v4 + 552));
      *(void *)(v4 + 552) = 0;
      *(void *)(v4 + 560) = 0;
    }
    *(_DWORD *)(v4 + 568) = *(_DWORD *)(a2 + 568);
    sub_1D0E637C8((void *)(v4 + 576), *(char **)(a2 + 576), *(char **)(a2 + 584), *(void *)(a2 + 584) - *(void *)(a2 + 576));
    unint64_t v21 = (2 * *(_DWORD *)(a2 + 616));
    if (v21)
    {
      v22 = *(void **)(v4 + 600);
      size_t v23 = 4 * v21;
      if (*(void *)(v4 + 608) < v21)
      {
        free(v22);
        *(void *)(v4 + 600) = 0;
        size_t v24 = (v23 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 608) = v24 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v24, 0x49090899uLL);
        v22 = memptr;
        *(void *)(v4 + 600) = memptr;
      }
      memcpy(v22, *(const void **)(a2 + 600), v23);
    }
    else
    {
      free(*(void **)(v4 + 600));
      *(void *)(v4 + 600) = 0;
      *(void *)(v4 + 608) = 0;
    }
    *(_DWORD *)(v4 + 616) = *(_DWORD *)(a2 + 616);
    unint64_t v25 = (2 * *(_DWORD *)(a2 + 640));
    if (v25)
    {
      uint64_t v26 = *(void **)(v4 + 624);
      size_t v27 = 4 * v25;
      if (*(void *)(v4 + 632) < v25)
      {
        free(v26);
        *(void *)(v4 + 624) = 0;
        size_t v28 = (v27 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 632) = v28 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v28, 0x49090899uLL);
        uint64_t v26 = memptr;
        *(void *)(v4 + 624) = memptr;
      }
      memcpy(v26, *(const void **)(a2 + 624), v27);
    }
    else
    {
      free(*(void **)(v4 + 624));
      *(void *)(v4 + 624) = 0;
      *(void *)(v4 + 632) = 0;
    }
    *(_DWORD *)(v4 + 640) = *(_DWORD *)(a2 + 640);
    unint64_t v29 = (2 * *(_DWORD *)(a2 + 664));
    if (v29)
    {
      v30 = *(void **)(v4 + 648);
      size_t v31 = 4 * v29;
      if (*(void *)(v4 + 656) < v29)
      {
        free(v30);
        *(void *)(v4 + 648) = 0;
        size_t v32 = (v31 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 656) = v32 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v32, 0x49090899uLL);
        v30 = memptr;
        *(void *)(v4 + 648) = memptr;
      }
      memcpy(v30, *(const void **)(a2 + 648), v31);
    }
    else
    {
      free(*(void **)(v4 + 648));
      *(void *)(v4 + 648) = 0;
      *(void *)(v4 + 656) = 0;
    }
    *(_DWORD *)(v4 + 664) = *(_DWORD *)(a2 + 664);
    unint64_t v33 = *(unsigned int *)(a2 + 688);
    if (v33)
    {
      uint64_t v34 = *(void **)(v4 + 672);
      if (*(void *)(v4 + 680) >= v33)
      {
        size_t v35 = 4 * v33;
      }
      else
      {
        free(v34);
        *(void *)(v4 + 672) = 0;
        size_t v35 = 4 * v33;
        size_t v36 = (v35 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 680) = v36 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v36, 0x49090899uLL);
        uint64_t v34 = memptr;
        *(void *)(v4 + 672) = memptr;
      }
      memcpy(v34, *(const void **)(a2 + 672), v35);
    }
    else
    {
      free(*(void **)(v4 + 672));
      *(void *)(v4 + 672) = 0;
      *(void *)(v4 + 680) = 0;
    }
    *(_DWORD *)(v4 + 688) = *(_DWORD *)(a2 + 688);
    sub_1D0E637C8((void *)(v4 + 696), *(char **)(a2 + 696), *(char **)(a2 + 704), *(void *)(a2 + 704) - *(void *)(a2 + 696));
    unint64_t v37 = (2 * *(_DWORD *)(a2 + 736));
    if (v37)
    {
      v38 = *(void **)(v4 + 720);
      if (*(void *)(v4 + 728) >= v37)
      {
        size_t v39 = 4 * v37;
      }
      else
      {
        free(v38);
        *(void *)(v4 + 720) = 0;
        size_t v39 = 4 * v37;
        size_t v40 = (v39 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 728) = v40 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v40, 0x49090899uLL);
        v38 = memptr;
        *(void *)(v4 + 720) = memptr;
      }
      memcpy(v38, *(const void **)(a2 + 720), v39);
    }
    else
    {
      free(*(void **)(v4 + 720));
      *(void *)(v4 + 720) = 0;
      *(void *)(v4 + 728) = 0;
    }
    *(_DWORD *)(v4 + 736) = *(_DWORD *)(a2 + 736);
    unint64_t v41 = (2 * *(_DWORD *)(a2 + 760));
    if (v41)
    {
      int64_t v42 = *(void **)(v4 + 744);
      if (*(void *)(v4 + 752) >= v41)
      {
        size_t v43 = 4 * v41;
      }
      else
      {
        free(v42);
        *(void *)(v4 + 744) = 0;
        size_t v43 = 4 * v41;
        size_t v44 = (v43 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 752) = v44 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v44, 0x49090899uLL);
        int64_t v42 = memptr;
        *(void *)(v4 + 744) = memptr;
      }
      memcpy(v42, *(const void **)(a2 + 744), v43);
    }
    else
    {
      free(*(void **)(v4 + 744));
      *(void *)(v4 + 744) = 0;
      *(void *)(v4 + 752) = 0;
    }
    *(_DWORD *)(v4 + 760) = *(_DWORD *)(a2 + 760);
    unint64_t v45 = (2 * *(_DWORD *)(a2 + 784));
    if (v45)
    {
      v46 = *(void **)(v4 + 768);
      if (*(void *)(v4 + 776) >= v45)
      {
        size_t v47 = 4 * v45;
      }
      else
      {
        free(v46);
        *(void *)(v4 + 768) = 0;
        size_t v47 = 4 * v45;
        size_t v48 = (v47 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 776) = v48 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v48, 0x49090899uLL);
        v46 = memptr;
        *(void *)(v4 + 768) = memptr;
      }
      memcpy(v46, *(const void **)(a2 + 768), v47);
    }
    else
    {
      free(*(void **)(v4 + 768));
      *(void *)(v4 + 768) = 0;
      *(void *)(v4 + 776) = 0;
    }
    *(_DWORD *)(v4 + 784) = *(_DWORD *)(a2 + 784);
    unint64_t v49 = *(unsigned int *)(a2 + 808);
    if (v49)
    {
      int v50 = *(void **)(v4 + 792);
      if (*(void *)(v4 + 800) >= v49)
      {
        size_t v51 = 4 * v49;
      }
      else
      {
        free(v50);
        *(void *)(v4 + 792) = 0;
        size_t v51 = 4 * v49;
        size_t v52 = (v51 + 31) & 0x7FFFFFFE0;
        *(void *)(v4 + 800) = v52 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v52, 0x49090899uLL);
        int v50 = memptr;
        *(void *)(v4 + 792) = memptr;
      }
      memcpy(v50, *(const void **)(a2 + 792), v51);
    }
    else
    {
      free(*(void **)(v4 + 792));
      *(void *)(v4 + 792) = 0;
      *(void *)(v4 + 800) = 0;
    }
    *(_DWORD *)(v4 + 808) = *(_DWORD *)(a2 + 808);
    sub_1D0E637C8((void *)(v4 + 816), *(char **)(a2 + 816), *(char **)(a2 + 824), *(void *)(a2 + 824) - *(void *)(a2 + 816));
  }
  return a1;
}

uint64_t sub_1D0E63538(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unint64_t v4 = (2 * *(_DWORD *)(a2 + 16));
    if (v4)
    {
      unint64_t v5 = *(void **)a1;
      if (*(void *)(a1 + 8) >= v4)
      {
        size_t v6 = 4 * v4;
      }
      else
      {
        free(v5);
        size_t v6 = 4 * v4;
        size_t v7 = (v6 + 31) & 0x7FFFFFFE0;
        *(void *)a1 = 0;
        *(void *)(a1 + 8) = v7 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v7, 0x49090899uLL);
        unint64_t v5 = memptr;
        *(void *)a1 = memptr;
      }
      memcpy(v5, *(const void **)a2, v6);
    }
    else
    {
      free(*(void **)a1);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
    }
    *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
    unint64_t v8 = (2 * *(_DWORD *)(a2 + 40));
    if (v8)
    {
      unint64_t v9 = *(void **)(a1 + 24);
      if (*(void *)(a1 + 32) >= v8)
      {
        size_t v10 = 4 * v8;
      }
      else
      {
        free(v9);
        size_t v10 = 4 * v8;
        size_t v11 = (v10 + 31) & 0x7FFFFFFE0;
        *(void *)(a1 + 24) = 0;
        *(void *)(a1 + 32) = v11 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v11, 0x49090899uLL);
        unint64_t v9 = memptr;
        *(void *)(a1 + 24) = memptr;
      }
      memcpy(v9, *(const void **)(a2 + 24), v10);
    }
    else
    {
      free(*(void **)(a1 + 24));
      *(void *)(a1 + 24) = 0;
      *(void *)(a1 + 32) = 0;
    }
    *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  }
  return a1;
}

uint64_t sub_1D0E63674(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unint64_t v4 = *(unsigned int *)(a2 + 16);
    if (v4)
    {
      unint64_t v5 = *(void **)a1;
      if (*(void *)(a1 + 8) >= v4)
      {
        size_t v6 = 4 * v4;
      }
      else
      {
        free(v5);
        size_t v6 = 4 * v4;
        size_t v7 = (v6 + 31) & 0x7FFFFFFE0;
        *(void *)a1 = 0;
        *(void *)(a1 + 8) = v7 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v7, 0x49090899uLL);
        unint64_t v5 = memptr;
        *(void *)a1 = memptr;
      }
      memcpy(v5, *(const void **)a2, v6);
    }
    else
    {
      free(*(void **)a1);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
    }
    *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
    sub_1D0E637C8((void *)(a1 + 24), *(char **)(a2 + 24), *(char **)(a2 + 32), *(void *)(a2 + 32) - *(void *)(a2 + 24));
    unint64_t v8 = *(unsigned int *)(a2 + 64);
    if (v8)
    {
      unint64_t v9 = *(void **)(a1 + 48);
      if (*(void *)(a1 + 56) >= v8)
      {
        size_t v10 = 4 * v8;
      }
      else
      {
        free(v9);
        size_t v10 = 4 * v8;
        size_t v11 = (v10 + 31) & 0x7FFFFFFE0;
        *(void *)(a1 + 48) = 0;
        *(void *)(a1 + 56) = v11 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v11, 0x49090899uLL);
        unint64_t v9 = memptr;
        *(void *)(a1 + 48) = memptr;
      }
      memcpy(v9, *(const void **)(a2 + 48), v10);
    }
    else
    {
      free(*(void **)(a1 + 48));
      *(void *)(a1 + 48) = 0;
      *(void *)(a1 + 56) = 0;
    }
    *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
    sub_1D0E637C8((void *)(a1 + 72), *(char **)(a2 + 72), *(char **)(a2 + 80), *(void *)(a2 + 80) - *(void *)(a2 + 72));
  }
  return a1;
}

void *sub_1D0E637C8(void *result, char *__src, char *a3, unint64_t a4)
{
  size_t v7 = result;
  unint64_t v8 = result[2];
  unint64_t v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      goto LABEL_23;
    }
    uint64_t v10 = 2 * v8;
    if (2 * v8 <= a4) {
      uint64_t v10 = a4;
    }
    size_t v11 = v8 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v10;
    if ((v11 & 0x8000000000000000) != 0) {
LABEL_23:
    }
      abort();
    result = operator new(v11);
    unint64_t v9 = (char *)result;
    void *v7 = result;
    v7[1] = result;
    v7[2] = (char *)result + v11;
    size_t v12 = a3 - __src;
    if (v12) {
      result = memcpy(result, __src, v12);
    }
LABEL_21:
    size_t v16 = &v9[v12];
    goto LABEL_22;
  }
  unint64_t v13 = (unsigned char *)result[1];
  size_t v14 = v13 - v9;
  if (v13 - v9 >= a4)
  {
    size_t v12 = a3 - __src;
    if (v12) {
      result = memmove((void *)*result, __src, v12);
    }
    goto LABEL_21;
  }
  size_t v15 = &__src[v14];
  if (v13 != v9)
  {
    result = memmove((void *)*result, __src, v14);
    unint64_t v9 = (char *)v7[1];
  }
  if (a3 != v15) {
    result = memmove(v9, v15, a3 - v15);
  }
  size_t v16 = &v9[a3 - v15];
LABEL_22:
  v7[1] = v16;
  return result;
}

uint64_t *sub_1D0E638FC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    v3 = *(void **)(v2 + 816);
    if (v3)
    {
      *(void *)(v2 + 824) = v3;
      operator delete(v3);
    }
    free(*(void **)(v2 + 792));
    free(*(void **)(v2 + 768));
    free(*(void **)(v2 + 744));
    free(*(void **)(v2 + 720));
    unint64_t v4 = *(void **)(v2 + 696);
    if (v4)
    {
      *(void *)(v2 + 704) = v4;
      operator delete(v4);
    }
    free(*(void **)(v2 + 672));
    free(*(void **)(v2 + 648));
    free(*(void **)(v2 + 624));
    free(*(void **)(v2 + 600));
    unint64_t v5 = *(void **)(v2 + 576);
    if (v5)
    {
      *(void *)(v2 + 584) = v5;
      operator delete(v5);
    }
    free(*(void **)(v2 + 552));
    free(*(void **)(v2 + 528));
    free(*(void **)(v2 + 504));
    free(*(void **)(v2 + 480));
    sub_1D0E60D20(v2 + 240);
    uint64_t v6 = sub_1D0E60D20(v2);
    MEMORY[0x1D25F16B0](v6, 0x1080C40BC4CA667);
  }
  return a1;
}

void sub_1D0E639DC(uint64_t a1, int a2, int a3)
{
  *(_DWORD *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 20) = a3;
  unint64_t v4 = (a3 * a2);
  if (v4)
  {
    if (*(void *)(a1 + 8) < v4)
    {
      free(*(void **)a1);
      size_t v5 = (4 * v4 + 31) & 0x7FFFFFFE0;
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = v5 >> 2;
      memptr = 0;
      malloc_type_posix_memalign(&memptr, 0x20uLL, v5, 0x49090899uLL);
      *(void *)a1 = memptr;
    }
  }
  else
  {
    free(*(void **)a1);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
}

void **sub_1D0E63A68(void **a1, uint64_t a2)
{
  size_t v3 = (4 * a2 + 31) & 0x7FFFFFFFFFFFFFE0;
  *a1 = 0;
  a1[1] = (void *)(v3 >> 2);
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, v3, 0x49090899uLL);
  *a1 = memptr;
  return a1;
}

void sub_1D0E63AC8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  if (*(void **)v6 == v4 || (void *)(*(void *)(v5 + 8) - 4 * *(unsigned int *)(v5 + 20)) == v4)
  {
    size_t v7 = (4 * (*(_DWORD *)(v5 + 4) * *(_DWORD *)(v6 + 16)) + 31) & 0x7FFFFFFE0;
    size_t v13 = v7 >> 2;
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 0x20uLL, v7, 0x49090899uLL);
    size_t v12 = memptr;
    int v8 = *(_DWORD *)(*(void *)(a2 + 16) + 4);
    LODWORD(v14) = *(_DWORD *)(*(void *)(a2 + 8) + 16);
    HIDWORD(v14) = v8;
    sub_1D0E63AC8(&v12, a2);
    unint64_t v9 = *(void **)a1;
    size_t v10 = v13;
    *(void *)a1 = v12;
    *(void *)(a1 + 8) = v10;
    *(void *)(a1 + 16) = v14;
    free(v9);
  }
  else
  {
    if (*(_DWORD *)(v6 + 20) * *(_DWORD *)(v6 + 16) && *(_DWORD *)(v5 + 4) * *(_DWORD *)v5) {
      cva::VecLib<float>::gemm();
    }
    unsigned int v11 = *(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 16);
    if (v11)
    {
      bzero(v4, 4 * v11);
    }
  }
}

uint64_t sub_1D0E63C08(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96))
  {
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 48));
    free(*(void **)(a1 + 24));
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
  }
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 96) = 1;
  return a1;
}

uint64_t sub_1D0E63C78(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  if (v1)
  {
    if (*(unsigned char *)(v1 + 240))
    {
      free(*(void **)(v1 + 216));
      free(*(void **)(v1 + 192));
      free(*(void **)(v1 + 168));
      if (*(char *)(v1 + 167) < 0) {
        operator delete(*(void **)(v1 + 144));
      }
    }
    free(*(void **)(v1 + 120));
    free(*(void **)(v1 + 96));
    free(*(void **)(v1 + 72));
    free(*(void **)(v1 + 48));
    free(*(void **)(v1 + 24));
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    JUMPOUT(0x1D25F16B0);
  }
  return result;
}

void sub_1D0E63D34(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

void sub_1D0E63D70(void *a1, _DWORD *a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  char v44 = 0;
  int64_t v42 = &unk_1F26F4458;
  size_t v43 = a2;
  int v41 = 0;
  LODWORD(memptr) = 0;
  if ((*(uint64_t (**)(_DWORD *, void **, uint64_t))(*(void *)a2 + 88))(a2, &memptr, 4) != 4
    || memptr != 2101013610)
  {
    goto LABEL_14;
  }
  if (v43[2] != 2)
  {
    uint64_t v9 = (*(uint64_t (**)(_DWORD *, void **, uint64_t))(*(void *)v43 + 144))(v43, &memptr, 4);
    if (v9 >= 1) {
      *((void *)v43 + 2) += v9;
    }
  }
  size_t v10 = v43;
  if (v43[2] == 2
    || (uint64_t v11 = (*(uint64_t (**)(_DWORD *, int *, uint64_t))(*(void *)v43 + 144))(v43, &v41, 4), v11 < 1)
    || (*((void *)v10 + 2) += v11, v11 != 4))
  {
LABEL_14:
    sub_1D0E5C8F8(&memptr);
    sub_1D0E5E098((uint64_t)v40, &memptr, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/geometry/src/three_d/identitytensor.cpp", 357, "couldn't read identity tensor from %s: bad file header", a3);
    size_t v12 = v40;
LABEL_15:
    sub_1D0E6054C((uint64_t)v12);
    size_t v13 = v46;
    if (v46 && !atomic_fetch_add(&v46->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    *a1 = 0;
    a1[1] = 0;
    goto LABEL_19;
  }
  if (v41)
  {
    sub_1D0E5C8F8(&memptr);
    sub_1D0E5E098((uint64_t)v39, &memptr, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/geometry/src/three_d/identitytensor.cpp", 362, "couldn't read identity tensor from %s: unexpected version %d", a3);
    size_t v12 = v39;
    goto LABEL_15;
  }
  memset(&__src, 0, sizeof(__src));
  if (sub_1D0E769B0((uint64_t)&v42, &__src))
  {
    if (!a5)
    {
      memset(&__p, 0, sizeof(__p));
      int v35 = -1;
      int v34 = -1;
      int v33 = -1;
      int v32 = -1;
      int v31 = -1;
      int v30 = -1;
      if (sub_1D0E769B0((uint64_t)&v42, &__p))
      {
        size_t v15 = v43;
        if (v43[2] != 2)
        {
          uint64_t v16 = (*(uint64_t (**)(_DWORD *, int *, uint64_t))(*(void *)v43 + 144))(v43, &v35, 4);
          if (v16 >= 1)
          {
            *((void *)v15 + 2) += v16;
            if (v16 == 4)
            {
              unint64_t v17 = v43;
              if (v43[2] != 2)
              {
                uint64_t v18 = (*(uint64_t (**)(_DWORD *, int *, uint64_t))(*(void *)v43 + 144))(v43, &v34, 4);
                if (v18 >= 1)
                {
                  *((void *)v17 + 2) += v18;
                  if (v18 == 4)
                  {
                    size_t v19 = v43;
                    if (v43[2] != 2)
                    {
                      uint64_t v20 = (*(uint64_t (**)(_DWORD *, int *, uint64_t))(*(void *)v43 + 144))(v43, &v33, 4);
                      if (v20 >= 1)
                      {
                        *((void *)v19 + 2) += v20;
                        if (v20 == 4)
                        {
                          unint64_t v21 = v43;
                          if (v43[2] != 2)
                          {
                            uint64_t v22 = (*(uint64_t (**)(_DWORD *, int *, uint64_t))(*(void *)v43 + 144))(v43, &v32, 4);
                            if (v22 >= 1)
                            {
                              *((void *)v21 + 2) += v22;
                              if (v22 == 4)
                              {
                                size_t v23 = v43;
                                if (v43[2] != 2)
                                {
                                  uint64_t v24 = (*(uint64_t (**)(_DWORD *, int *, uint64_t))(*(void *)v43 + 144))(v43, &v31, 4);
                                  if (v24 >= 1)
                                  {
                                    *((void *)v23 + 2) += v24;
                                    if (v24 == 4)
                                    {
                                      unint64_t v25 = v43;
                                      if (v43[2] != 2)
                                      {
                                        uint64_t v26 = (*(uint64_t (**)(_DWORD *, int *, uint64_t))(*(void *)v43
                                                                                                  + 144))(v43, &v30, 4);
                                        if (v26 >= 1)
                                        {
                                          *((void *)v25 + 2) += v26;
                                          if (v26 == 4) {
                                            operator new();
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
      sub_1D0E5C8F8(&memptr);
      sub_1D0E5E098((uint64_t)v29, &memptr, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/geometry/src/three_d/identitytensor.cpp", 394, "couldn't read identity tensor from %s: corrupt data", a3);
      sub_1D0E6054C((uint64_t)v29);
      sub_1D0DCA2C0((uint64_t)&memptr);
      *a1 = 0;
      a1[1] = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      goto LABEL_63;
    }
    if (&__src != (std::string *)a5)
    {
      if (*(char *)(a5 + 23) < 0)
      {
        if ((__src.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_src = &__src;
        }
        else {
          p_src = (std::string *)__src.__r_.__value_.__r.__words[0];
        }
        if ((__src.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          size_t size = HIBYTE(__src.__r_.__value_.__r.__words[2]);
        }
        else {
          size_t size = __src.__r_.__value_.__l.__size_;
        }
        sub_1D0DF92F0((void **)a5, p_src, size);
      }
      else if ((*((unsigned char *)&__src.__r_.__value_.__s + 23) & 0x80) != 0)
      {
        sub_1D0DF922C((void *)a5, __src.__r_.__value_.__l.__data_, __src.__r_.__value_.__l.__size_);
      }
      else
      {
        *(std::string *)a5 = __src;
      }
    }
  }
  else
  {
    sub_1D0E5C8F8(&memptr);
    sub_1D0E5E098((uint64_t)v37, &memptr, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/geometry/src/three_d/identitytensor.cpp", 368, "couldn't read identity tensor from %s: corrupt data", a3);
    sub_1D0E6054C((uint64_t)v37);
    uint64_t v14 = v46;
    if (v46 && !atomic_fetch_add(&v46->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  *a1 = 0;
  a1[1] = 0;
LABEL_63:
  if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__src.__r_.__value_.__l.__data_);
  }
LABEL_19:
  int64_t v42 = &unk_1F26F4208;
  if (v44)
  {
    if (v43) {
      (*(void (**)(_DWORD *))(*(void *)v43 + 8))(v43);
    }
  }
}

void sub_1D0E64C14(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8)
{
  LODWORD(a8) = *(_DWORD *)(a3 + 24);
  if (fabsf(*(float *)&a8) >= 1.0e-15)
  {
    float v17 = *(float *)a3;
    float v18 = *(float *)(a3 + 12) / *(float *)&a8;
    *(float32x2_t *)((char *)&v92 + 4) = vdiv_f32(vneg_f32(*(float32x2_t *)(a3 + 4)), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a8, 0));
    *(float *)&long long v92 = v18;
    *((float *)&v92 + 3) = v17 / *(float *)&a8;
    *(void *)v83 = &v92;
    *(void *)&long long v88 = v83;
    *((void *)&v88 + 1) = a3 + 16;
    *(void *)&v101[0] = 0;
    sub_1D0E0FC64((float *)v101, (uint64_t)&v88);
    long long v85 = v92;
    uint64_t v86 = *(void *)&v101[0];
    v19.i32[0] = v92;
    int32x2_t v75 = v19;
    float v15 = (float)(*(float *)&v92 * *((float *)&v92 + 3)) - (float)(*((float *)&v92 + 2) * *((float *)&v92 + 1));
    float32x2_t v16 = *(float32x2_t *)&v101[0];
  }
  else
  {
    long long v85 = 0uLL;
    float v15 = 1.0;
    float32x2_t v16 = 0;
    int32x2_t v75 = 0;
    uint64_t v86 = 0;
  }
  float v87 = v15;
  *(_DWORD *)v83 = *(_DWORD *)a2;
  *(_OWORD *)&v83[4] = *(_OWORD *)(a2 + 4);
  *(_OWORD *)v84 = *(_OWORD *)(a2 + 20);
  *(_OWORD *)&v84[12] = *(_OWORD *)(a2 + 32);
  *(void *)&long long v88 = &v85;
  *((void *)&v88 + 1) = &v83[4];
  *(void *)((char *)&v92 + 4) = 0;
  sub_1D0DD6E58((float *)&v92 + 1, (float **)&v88);
  float v20 = *(float *)v84;
  *(float32x2_t *)&long long v21 = vadd_f32(v16, *(float32x2_t *)((char *)&v92 + 4));
  *((float32x2_t *)&v21 + 1) = vmul_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(v75, 0), *(float32x2_t *)&v83[12]);
  *(_OWORD *)&v83[4] = v21;
  *(void *)(a5 + 8) = *(void *)(a4 + 8);
  long long v22 = v21;
  if (a5 != a4)
  {
    long long v23 = *(_OWORD *)(a4 + 16);
    long long v24 = *(_OWORD *)(a4 + 32);
    *(_DWORD *)(a5 + 48) = *(_DWORD *)(a4 + 48);
    *(_OWORD *)(a5 + 16) = v23;
    *(_OWORD *)(a5 + 32) = v24;
    long long v25 = *(_OWORD *)(a4 + 52);
    long long v26 = *(_OWORD *)(a4 + 68);
    *(_DWORD *)(a5 + 84) = *(_DWORD *)(a4 + 84);
    *(_OWORD *)(a5 + 68) = v26;
    *(_OWORD *)(a5 + 52) = v25;
    uint64_t v27 = *(void *)(a4 + 88);
    *(_DWORD *)(a5 + 96) = *(_DWORD *)(a4 + 96);
    *(void *)(a5 + 88) = v27;
  }
  uint64_t v28 = 0;
  long long v92 = 0x3F800000uLL;
  float v29 = v20;
  *(void *)v93 = 1065353216;
  unint64_t v30 = 0x100000000;
  int v31 = (int *)&v85;
  *(_DWORD *)&v93[16] = 1065353216;
  do
  {
    int v32 = *v31++;
    *(_DWORD *)&v93[4 * v28 - 16] = v32;
    unint64_t v33 = HIDWORD(v30);
    BOOL v34 = (int)v30 < 1;
    if ((int)v30 < 1) {
      unint64_t v33 = 0;
    }
    uint64_t v35 = v28 + v33;
    uint64_t v36 = (v30 + 1);
    unint64_t v37 = v30 & 0xFFFFFFFF00000000;
    if (!v34) {
      uint64_t v36 = 0;
    }
    unint64_t v30 = v36 | v37;
    uint64_t v28 = v35 + 1;
  }
  while (v28 != 6);
  *(float32x2_t *)&v93[8] = v16;
  *(void *)&long long v88 = &v92;
  *((void *)&v88 + 1) = a5 + 16;
  sub_1D0DF1BF0(a5 + 16, (float **)&v88);
  float32x2_t v77 = vadd_f32(vmul_f32(*(float32x2_t *)((char *)&v22 + 8), (float32x2_t)0x3F0000003F000000), *(float32x2_t *)&v22);
  float v76 = (float)a1 / *((float *)&v22 + 2);
  __float2 v38 = __sincosf_stret(v29 / -57.296);
  unint64_t v97 = __PAIR64__(LODWORD(v38.__sinval), LODWORD(v38.__cosval));
  float v98 = -v38.__sinval;
  float cosval = v38.__cosval;
  float v39 = v38.__cosval * v76;
  v40.i32[0] = a1 - 1;
  *(float *)&unsigned int v41 = -(float)(v38.__sinval * v76);
  *(int32x2_t *)&v101[0] = vdup_lane_s32((int32x2_t)vmul_f32(vcvt_f32_s32(v40), (float32x2_t)0x3F0000003F000000), 0);
  long long v92 = (unint64_t)v101;
  int64_t v42 = &v97;
  *(void *)&long long v88 = &v97;
  *((void *)&v88 + 1) = &v77;
  sub_1D0DD6E58((float *)&v92 + 2, (float **)&v88);
  float32x2_t v43 = vmul_n_f32(*(float32x2_t *)((char *)&v92 + 8), v76);
  *((float32x2_t *)&v92 + 1) = v43;
  float32x2_t v44 = vsub_f32(*(float32x2_t *)v92, v43);
  float v78 = v39;
  float32x2_t v79 = (float32x2_t)__PAIR64__(v41, v38.__sinval * v76);
  float v80 = v38.__cosval * v76;
  float32x2_t v81 = v44;
  v43.f32[0] = (float)(v39 * v39) - (float)(*(float *)&v41 * (float)(v38.__sinval * v76));
  int32x2_t v74 = (int32x2_t)v43;
  float v82 = v43.f32[0];
  uint64_t v96 = *(void *)(a5 + 40);
  *(void *)&long long v88 = &v78;
  *((void *)&v88 + 1) = &v96;
  *(void *)((char *)&v92 + 4) = 0;
  sub_1D0DD6E58((float *)&v92 + 1, (float **)&v88);
  int v45 = 0;
  uint64_t v46 = 0;
  *(_DWORD *)(a5 + 8) = a1;
  *(_DWORD *)(a5 + 12) = a1;
  HIDWORD(v92) = 0;
  *(void *)&v93[4] = 0;
  *(void *)&v93[12] = 0x3F80000000000000;
  LODWORD(v92) = 1065353216;
  *(_DWORD *)v93 = 1065353216;
  *(float32x2_t *)(a5 + 40) = vadd_f32(*(float32x2_t *)((char *)&v92 + 4), v44);
  *(float *)(a5 + 16) = *(float *)(a5 + 16) * v76;
  *(float *)(a5 + 32) = *(float *)(a5 + 32) * v76;
  *(void *)((char *)&v92 + 4) = 0;
  float32x2_t v94 = 0;
  float v95 = 0.0;
  do
  {
    int v47 = *(_DWORD *)v42;
    int64_t v42 = (unint64_t *)((char *)v42 + 4);
    *(_DWORD *)&v93[4 * v46 - 16] = v47;
    if (v45 > 0) {
      ++v46;
    }
    ++v46;
    if (v45 <= 0) {
      ++v45;
    }
    else {
      int v45 = 0;
    }
  }
  while (v46 != 6);
  uint64_t v48 = a5 + 52;
  long long v88 = 0x3F800000uLL;
  *(void *)&v89[4] = 0;
  *(void *)&v89[12] = 0x3F80000000000000;
  float32x2_t v90 = 0;
  *(_DWORD *)v89 = 1065353216;
  float v91 = 0.0;
  *(void *)&v101[0] = &v92;
  *((void *)&v101[0] + 1) = a5 + 52;
  sub_1D0DF1BF0((uint64_t)&v88, (float **)v101);
  unint64_t v49 = (float *)(a5 + 88);
  v100[0] = (float *)&v92;
  v100[1] = v49;
  *(void *)((char *)v101 + 4) = 0;
  HIDWORD(v101[0]) = 0;
  sub_1D0DF1DA0((float *)v101 + 1, v100);
  float32x2_t v90 = vadd_f32(*(float32x2_t *)((char *)v101 + 4), v94);
  float v91 = *((float *)v101 + 3) + v95;
  if ((long long *)v48 != &v88)
  {
    long long v50 = *(_OWORD *)v89;
    *(_OWORD *)uint64_t v48 = v88;
    *(_OWORD *)(v48 + 16) = v50;
    *(_DWORD *)(v48 + 32) = *(_DWORD *)&v89[16];
    *(float32x2_t *)unint64_t v49 = v90;
    v49[2] = v91;
  }
  if (fabsf(*(float *)v74.i32) >= 1.0e-15)
  {
    *(float32x2_t *)((char *)&v92 + 4) = vdiv_f32(vneg_f32(v79), (float32x2_t)vdup_lane_s32(v74, 0));
    *(float *)&long long v92 = v39 / *(float *)v74.i32;
    *((float *)&v92 + 3) = v39 / *(float *)v74.i32;
    v100[0] = (float *)&v92;
    *(void *)&v101[0] = v100;
    *((void *)&v101[0] + 1) = &v81;
    unint64_t v97 = 0;
    sub_1D0E0FC64((float *)&v97, (uint64_t)v101);
    long long v88 = v92;
    int v52 = v97;
    *(void *)v89 = v97;
    float v53 = (float)(*(float *)&v92 * *((float *)&v92 + 3)) - (float)(*((float *)&v92 + 2) * *((float *)&v92 + 1));
    unint64_t v51 = HIDWORD(v97);
  }
  else
  {
    LODWORD(v51) = 0;
    int v52 = 0;
    long long v88 = 0uLL;
    float v53 = 1.0;
    *(void *)v89 = 0;
  }
  uint64_t v54 = 0;
  *(float *)&v89[8] = v53;
  long long v92 = 0x3F800000uLL;
  *(void *)v93 = 1065353216;
  unint64_t v55 = 0x100000000;
  v56 = (int *)&v88;
  *(_DWORD *)&v93[16] = 1065353216;
  do
  {
    int v57 = *v56++;
    *(_DWORD *)&v93[4 * v54 - 16] = v57;
    unint64_t v58 = HIDWORD(v55);
    BOOL v59 = (int)v55 < 1;
    if ((int)v55 < 1) {
      unint64_t v58 = 0;
    }
    uint64_t v60 = v54 + v58;
    uint64_t v61 = (v55 + 1);
    unint64_t v62 = v55 & 0xFFFFFFFF00000000;
    if (!v59) {
      uint64_t v61 = 0;
    }
    unint64_t v55 = v61 | v62;
    uint64_t v54 = v60 + 1;
  }
  while (v54 != 6);
  uint64_t v63 = 0;
  *(_DWORD *)&v93[8] = v52;
  *(_DWORD *)&v93[12] = v51;
  *(_DWORD *)(a7 + 32) = *(_DWORD *)&v93[16];
  long long v64 = v92;
  long long v65 = *(_OWORD *)v93;
  long long v92 = 0x3F800000uLL;
  *(void *)v93 = 1065353216;
  *(_DWORD *)&v93[16] = 1065353216;
  unint64_t v66 = 0x100000000;
  v67 = (int *)a3;
  *(_OWORD *)a7 = v64;
  *(_OWORD *)(a7 + 16) = v65;
  do
  {
    int v68 = *v67++;
    *(_DWORD *)&v93[4 * v63 - 16] = v68;
    unint64_t v69 = HIDWORD(v66);
    BOOL v70 = (int)v66 < 1;
    if ((int)v66 < 1) {
      unint64_t v69 = 0;
    }
    uint64_t v71 = v63 + v69;
    uint64_t v72 = (v66 + 1);
    unint64_t v73 = v66 & 0xFFFFFFFF00000000;
    if (!v70) {
      uint64_t v72 = 0;
    }
    unint64_t v66 = v72 | v73;
    uint64_t v63 = v71 + 1;
  }
  while (v63 != 6);
  *(void *)&v93[8] = *(void *)(a3 + 16);
  *(void *)&long long v88 = &v92;
  *((void *)&v88 + 1) = a7;
  sub_1D0DF1BF0(a6, (float **)&v88);
}

void sub_1D0E6520C(int a1, uint64_t a2, uint64_t a3, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = a4 + 1;
  v69.columns[0] = (simd_float3)a4[1];
  v69.columns[2] = *(simd_float3 *)((char *)a4 + 40);
  v69.columns[1] = *(simd_float3 *)((char *)a4 + 28);
  simd_float3x3 v70 = __invert_f3(v69);
  float v35 = v70.columns[0].f32[0];
  simd_float3 v12 = v70.columns[0];
  v12.i32[3] = v70.columns[1].i32[0];
  v65[0] = v12;
  v65[1] = vextq_s8(vextq_s8((int8x16_t)v70.columns[1], (int8x16_t)v70.columns[1], 0xCuLL), (int8x16_t)v70.columns[2], 8uLL);
  __int32 v66 = v70.columns[2].i32[2];
  LODWORD(v33) = *(void *)(a2 + 12);
  *(float32x2_t *)v39.columns[0].f32 = vadd_f32(*(float32x2_t *)(a2 + 4), vmul_f32(*(float32x2_t *)(a2 + 12), (float32x2_t)0x3F0000003F000000));
  v39.columns[0].i32[2] = 1065353216;
  v40.i64[0] = (uint64_t)v65;
  v40.i64[1] = (uint64_t)&v39;
  uint64_t v63 = 0;
  float v64 = 0.0;
  sub_1D0DF1DA0((float *)&v63, (float **)&v40);
  float v13 = vmuls_n_f32(v33, v35);
  if (v13 < 0.000001) {
    float v13 = 0.000001;
  }
  float v36 = (float)((float)((float)((float)(*(float *)&v63 * *(float *)&v63)
                              + (float)(*((float *)&v63 + 1) * *((float *)&v63 + 1)))
                      + (float)(v64 * v64))
              * (float)a1)
      / v13;
  float v14 = 1.0 / sqrtf((float)(*(float *)&v63 * *(float *)&v63) + (float)(v64 * v64));
  v57[0] = v64 * v14;
  v57[1] = 0.0;
  v57[2] = *(float *)&v63 * v14;
  uint64_t v58 = 0x3F80000000000000;
  int v59 = 0;
  float v60 = -(float)(*(float *)&v63 * v14);
  float v34 = (float)(a1 - 1) * 0.5;
  int v61 = 0;
  float v62 = v64 * v14;
  v40.i64[0] = (uint64_t)v57;
  v40.i64[1] = (uint64_t)&v63;
  sub_1D0DF1DA0((float *)&v63, (float **)&v40);
  LODWORD(v63) = 0;
  long long v51 = xmmword_1D0E81470;
  float v15 = 1.0 / sqrtf((float)(*((float *)&v63 + 1) * *((float *)&v63 + 1)) + (float)(v64 * v64));
  float v52 = v64 * v15;
  float v53 = *((float *)&v63 + 1) * v15;
  int v54 = 0;
  float v55 = -(float)(*((float *)&v63 + 1) * v15);
  float v56 = v64 * v15;
  v40.i64[0] = (uint64_t)&v51;
  v40.i64[1] = (uint64_t)v57;
  simd_float3 v48 = 0u;
  simd_float3 v49 = 0u;
  __int32 v50 = 0;
  sub_1D0DF1BF0((uint64_t)&v48, (float **)&v40);
  __float2 v16 = __sincosf_stret(*(float *)(a2 + 20) / 57.296);
  v39.columns[0].f32[0] = -v16.__sinval;
  *(uint64_t *)((char *)v39.columns[0].i64 + 4) = LODWORD(v16.__cosval);
  v40.i64[0] = (uint64_t)&v48;
  v40.i64[1] = (uint64_t)&v39;
  uint64_t v46 = 0;
  int v47 = 0;
  sub_1D0DF1DA0((float *)&v46, (float **)&v40);
  float v17 = 1.0 / sqrtf((float)(*(float *)&v46 * *(float *)&v46) + (float)(*((float *)&v46 + 1) * *((float *)&v46 + 1)));
  v44[0] = *((float *)&v46 + 1) * v17;
  v44[1] = *(float *)&v46 * v17;
  v44[2] = 0.0;
  v44[3] = -(float)(*(float *)&v46 * v17);
  v44[4] = *((float *)&v46 + 1) * v17;
  long long v45 = xmmword_1D0E818A0;
  v40.i64[0] = (uint64_t)v44;
  v40.i64[1] = (uint64_t)&v48;
  sub_1D0DF1BF0((uint64_t)&v48, (float **)&v40);
  *(_DWORD *)(a5 + 8) = a1;
  *(_DWORD *)(a5 + 12) = a1;
  v39.columns[0] = v48;
  v39.columns[1] = v49;
  v39.columns[2].i32[0] = v50;
  *(uint64_t *)((char *)v39.columns[2].i64 + 4) = 0;
  v39.columns[2].i32[3] = 0;
  simd_float3 v40 = (simd_float3)0x3F800000uLL;
  *(void *)&v41[4] = 0;
  *(void *)&v41[12] = 0x3F80000000000000;
  *(_DWORD *)unsigned int v41 = 1065353216;
  float32x2_t v42 = 0;
  float v43 = 0.0;
  *(void *)&v68[0] = &v39;
  *((void *)&v68[0] + 1) = (char *)v11 + 36;
  sub_1D0DF1BF0((uint64_t)&v40, (float **)v68);
  v67[0] = (float *)&v39;
  v67[1] = (float *)v11 + 18;
  *(void *)((char *)v68 + 4) = 0;
  HIDWORD(v68[0]) = 0;
  sub_1D0DF1DA0((float *)v68 + 1, v67);
  v71.columns[1].i32[0] = 0;
  float32x2_t v42 = vadd_f32(*(float32x2_t *)((char *)v68 + 4), 0);
  float v43 = *((float *)v68 + 3) + 0.0;
  long long v18 = *(_OWORD *)v41;
  *(simd_float3 *)(a5 + 52) = v40;
  *(_OWORD *)(a5 + 68) = v18;
  *(_DWORD *)(a5 + 84) = *(_DWORD *)&v41[16];
  *(float32x2_t *)(a5 + 88) = v42;
  *(float *)(a5 + 96) = v43;
  *(float *)(a5 + 16) = v36;
  *(void *)(a5 + 20) = 0;
  *(_DWORD *)(a5 + 28) = 0;
  *(float *)(a5 + 32) = v36;
  *(_DWORD *)(a5 + 36) = 0;
  *(float *)(a5 + 40) = v34;
  *(float *)(a5 + 44) = v34;
  *(_DWORD *)(a5 + 48) = 1065353216;
  v67[0] = (float *)&v48;
  v71.columns[0] = (simd_float3)LODWORD(v36);
  v71.columns[1].i64[1] = 0;
  v71.columns[1].f32[1] = v36;
  *(void *)&v68[0] = v11;
  *((void *)&v68[0] + 1) = v67;
  __asm { FMOV            V2.4S, #1.0 }
  v71.columns[2].f32[0] = v34;
  v71.columns[2].f32[1] = v34;
  simd_float3x3 v72 = __invert_f3(v71);
  v72.columns[0].i32[3] = v72.columns[1].i32[0];
  simd_float3 v40 = v72.columns[0];
  *(int8x16_t *)unsigned int v41 = vextq_s8(vextq_s8((int8x16_t)v72.columns[1], (int8x16_t)v72.columns[1], 0xCuLL), (int8x16_t)v72.columns[2], 8uLL);
  *(_DWORD *)&v41[16] = v72.columns[2].i32[2];
  v39.columns[0].i64[0] = (uint64_t)v68;
  v39.columns[0].i64[1] = (uint64_t)&v40;
  sub_1D0E65674(a6, (uint64_t *)&v39);
  uint64_t v24 = 0;
  memset(&v39, 0, 32);
  v39.columns[0].i32[0] = 1065353216;
  v39.columns[1].i32[0] = 1065353216;
  unint64_t v25 = 0x100000000;
  long long v26 = (__int32 *)a3;
  v39.columns[2].i32[0] = 1065353216;
  do
  {
    __int32 v27 = *v26++;
    v39.columns[0].i32[v24] = v27;
    unint64_t v28 = HIDWORD(v25);
    BOOL v29 = (int)v25 < 1;
    if ((int)v25 < 1) {
      unint64_t v28 = 0;
    }
    uint64_t v30 = v24 + v28;
    uint64_t v31 = (v25 + 1);
    unint64_t v32 = v25 & 0xFFFFFFFF00000000;
    if (!v29) {
      uint64_t v31 = 0;
    }
    unint64_t v25 = v31 | v32;
    uint64_t v24 = v30 + 1;
  }
  while (v24 != 6);
  v39.columns[1].i64[1] = *(void *)(a3 + 16);
  v23.columns[2].i64[0] = v39.columns[1].i64[1];
  v23.columns[2].i32[2] = v39.columns[2].i32[0];
  v23.columns[0] = v39.columns[0];
  v23.columns[1] = *(simd_float3 *)((char *)v39.columns + 12);
  simd_float3x3 v73 = __invert_f3(v23);
  v73.columns[0].i32[3] = v73.columns[1].i32[0];
  simd_float3 v40 = v73.columns[0];
  *(int8x16_t *)unsigned int v41 = vextq_s8(vextq_s8((int8x16_t)v73.columns[1], (int8x16_t)v73.columns[1], 0xCuLL), (int8x16_t)v73.columns[2], 8uLL);
  *(_DWORD *)&v41[16] = v73.columns[2].i32[2];
  *(void *)&v68[0] = &v40;
  *((void *)&v68[0] + 1) = a6;
  sub_1D0DF1BF0(a7, (float **)v68);
}

__n64 sub_1D0E65674(uint64_t a1, uint64_t *a2)
{
  size_t v3 = (float *)a2[1];
  if (v3 == (float *)a1)
  {
    float v13 = 0.0;
    long long v11 = 0u;
    long long v12 = 0u;
    sub_1D0E65674(&v11);
    result.n64_u64[0] = v11;
    long long v10 = v12;
    *(_OWORD *)a1 = v11;
    *(_OWORD *)(a1 + 16) = v10;
    *(float *)(a1 + 32) = v13;
  }
  else
  {
    uint64_t v4 = *a2;
    long long v11 = 0u;
    long long v12 = 0u;
    float v13 = 0.0;
    sub_1D0E21CFC((uint64_t)&v11, v4);
    result.n64_u32[1] = 0;
    long long v5 = v11;
    uint64_t v6 = *((void *)&v12 + 1);
    *(float *)a1 = (float)((float)((float)(*(float *)&v11 * *v3) + 0.0) + (float)(*((float *)&v11 + 3) * v3[1]))
                 + (float)(*((float *)&v12 + 2) * v3[2]);
    uint64_t v7 = v12;
    *(float *)(a1 + 4) = (float)((float)((float)(*((float *)&v5 + 1) * *v3) + 0.0) + (float)(*(float *)&v12 * v3[1]))
                       + (float)(*((float *)&v6 + 1) * v3[2]);
    float v8 = v13;
    *(float *)(a1 + 8) = (float)((float)((float)(*((float *)&v5 + 2) * *v3) + 0.0) + (float)(*((float *)&v7 + 1) * v3[1]))
                       + (float)(v13 * v3[2]);
    *(float *)(a1 + 12) = (float)((float)((float)(*(float *)&v5 * v3[3]) + 0.0) + (float)(*((float *)&v5 + 3) * v3[4]))
                        + (float)(*(float *)&v6 * v3[5]);
    *(float *)(a1 + 16) = (float)((float)((float)(*((float *)&v5 + 1) * v3[3]) + 0.0) + (float)(*(float *)&v7 * v3[4]))
                        + (float)(*((float *)&v6 + 1) * v3[5]);
    *(float *)(a1 + 20) = (float)((float)((float)(*((float *)&v5 + 2) * v3[3]) + 0.0)
                                + (float)(*((float *)&v7 + 1) * v3[4]))
                        + (float)(v8 * v3[5]);
    *(float *)(a1 + 24) = (float)((float)((float)(*(float *)&v5 * v3[6]) + 0.0) + (float)(*((float *)&v5 + 3) * v3[7]))
                        + (float)(*(float *)&v6 * v3[8]);
    *(float *)(a1 + 28) = (float)((float)((float)(*((float *)&v5 + 1) * v3[6]) + 0.0) + (float)(*(float *)&v7 * v3[7]))
                        + (float)(*((float *)&v6 + 1) * v3[8]);
    result.n64_f32[0] = (float)((float)((float)(*((float *)&v5 + 2) * v3[6]) + 0.0)
                              + (float)(*((float *)&v7 + 1) * v3[7]))
                      + (float)(v8 * v3[8]);
    *(_DWORD *)(a1 + 32) = result.n64_u32[0];
  }
  return result;
}

BOOL sub_1D0E657D8(uint64_t a1, char **a2)
{
  BOOL result = 0;
  unsigned int v34 = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v4 + 8) == 2) {
    return result;
  }
  uint64_t v6 = (*(uint64_t (**)(void, unsigned int *, uint64_t))(*(void *)v4 + 144))(*(void *)(a1 + 8), &v34, 4);
  if (v6 < 1) {
    return 0;
  }
  *(void *)(v4 + 16) += v6;
  if (v6 != 4) {
    return 0;
  }
  uint64_t v7 = v34;
  float v8 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v10 = v9 - *a2;
  uint64_t v11 = v10 >> 3;
  unint64_t v12 = v34 - (v10 >> 3);
  if (v34 <= (unint64_t)(v10 >> 3))
  {
    if (v34 < (unint64_t)(v10 >> 3)) {
      a2[1] = &v8[8 * v34];
    }
    goto LABEL_28;
  }
  float v13 = a2[2];
  if (v12 > (v13 - v9) >> 3)
  {
    uint64_t v14 = v13 - v8;
    uint64_t v15 = v14 >> 2;
    if (v14 >> 2 <= (unint64_t)v34) {
      uint64_t v15 = v34;
    }
    BOOL v16 = (unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8;
    unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v16) {
      unint64_t v17 = v15;
    }
    if (v17 >> 61) {
      sub_1D0DE8CE0();
    }
    uint64_t v18 = 8 * v17;
    int32x2_t v19 = (char *)operator new(8 * v17);
    float v20 = &v19[8 * v11];
    unint64_t v32 = v19;
    float v33 = &v19[v18];
    bzero(v20, 8 * v12);
    long long v21 = &v20[8 * v12];
    if (v9 == v8)
    {
      float v8 = v9;
      simd_float3x3 v23 = v33;
      goto LABEL_25;
    }
    unint64_t v22 = v9 - v8 - 8;
    if (v22 >= 0x58)
    {
      simd_float3x3 v23 = v33;
      if ((unint64_t)(&v9[-v10] - v32) >= 0x20)
      {
        uint64_t v24 = (v22 >> 3) + 1;
        unint64_t v25 = &v32[8 * v11 - 16];
        long long v26 = (long long *)(v9 - 16);
        uint64_t v27 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v28 = *v26;
          *((_OWORD *)v25 - 1) = *(v26 - 1);
          *(_OWORD *)unint64_t v25 = v28;
          v25 -= 32;
          v26 -= 2;
          v27 -= 4;
        }
        while (v27);
        v20 -= 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        v9 -= 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        if (v24 == (v24 & 0x3FFFFFFFFFFFFFFCLL)) {
          goto LABEL_25;
        }
      }
    }
    else
    {
      simd_float3x3 v23 = v33;
    }
    do
    {
      uint64_t v29 = *((void *)v9 - 1);
      v9 -= 8;
      *((void *)v20 - 1) = v29;
      v20 -= 8;
    }
    while (v9 != v8);
    float v8 = *a2;
LABEL_25:
    *a2 = v20;
    a2[1] = v21;
    a2[2] = v23;
    if (v8) {
      operator delete(v8);
    }
    goto LABEL_27;
  }
  bzero(a2[1], 8 * v12);
  a2[1] = &v9[8 * v12];
LABEL_27:
  float v8 = *a2;
LABEL_28:
  uint64_t v30 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v30 + 8) == 2)
  {
    uint64_t v31 = -1;
  }
  else
  {
    uint64_t v31 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)v30 + 144))(v30, v8, 8 * v7);
    if (v31 >= 1) {
      *(void *)(v30 + 16) += v31;
    }
  }
  return v31 == 8 * v7;
}

uint64_t sub_1D0E65A60(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  if (v1)
  {
    free(*(void **)(v1 + 456));
    sub_1D0E2B740(v1);
    JUMPOUT(0x1D25F16B0);
  }
  return result;
}

void sub_1D0E65AC0(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

void sub_1D0E65AFC(uint64_t a1, _DWORD *a2, unsigned int *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (*(void *)a1 == *(void *)(a1 + 8)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *(int **)a1;
  }
  uint64_t v7 = *((void *)a3 + 1);
  uint64_t v8 = a3[5];
  uint64_t v9 = *a3;
  if (v6 == (int *)(v7 - 4 * v8))
  {
    memptr[0] = 0;
    malloc_type_posix_memalign(memptr, 0x20uLL, (4 * v9 + 31) & 0x7FFFFFFE0, 0x49090899uLL);
    uint64_t v18 = (char *)memptr[0];
    if (!v9) {
      goto LABEL_24;
    }
    unint64_t v19 = (v9 - 1) & 0x3FFFFFFFFFFFFFFFLL;
    if (v19 < 7)
    {
      float v20 = (char *)memptr[0];
    }
    else
    {
      float v20 = (char *)memptr[0];
      if ((void *)((char *)memptr[0] - (char *)v6) >= (void *)0x20)
      {
        uint64_t v21 = (v19 + 1) & 0x7FFFFFFFFFFFFFF8;
        unint64_t v22 = (char *)memptr[0] + 16;
        simd_float3x3 v23 = (long long *)(v6 + 4);
        uint64_t v24 = v21;
        do
        {
          long long v25 = *v23;
          *(v22 - 1) = *(v23 - 1);
          _OWORD *v22 = v25;
          v22 += 2;
          v23 += 2;
          v24 -= 8;
        }
        while (v24);
        if (v19 + 1 == v21)
        {
LABEL_24:
          uint64_t v28 = *a3;
          if (v28)
          {
            uint64_t v29 = *((void *)a3 + 1);
            unint64_t v30 = (v28 - 1) & 0x3FFFFFFFFFFFFFFFLL;
            if (v30 < 7)
            {
              uint64_t v31 = v18;
              unint64_t v32 = (_DWORD *)*((void *)a3 + 1);
            }
            else
            {
              uint64_t v31 = v18;
              unint64_t v32 = (_DWORD *)*((void *)a3 + 1);
              if ((unint64_t)(v29 - (void)v18) >= 0x20)
              {
                uint64_t v33 = (v30 + 1) & 0x7FFFFFFFFFFFFFF8;
                uint64_t v31 = &v18[4 * v33];
                unsigned int v34 = (_OWORD *)(v29 + 16);
                float v35 = (long long *)(v18 + 16);
                uint64_t v36 = v33;
                do
                {
                  long long v37 = *v35;
                  *(v34 - 1) = *(v35 - 1);
                  *unsigned int v34 = v37;
                  v34 += 2;
                  v35 += 2;
                  v36 -= 8;
                }
                while (v36);
                if (v30 + 1 == v33) {
                  goto LABEL_34;
                }
                unint64_t v32 = (_DWORD *)(v29 + 4 * v33);
              }
            }
            __float2 v38 = (_DWORD *)(v29 + 4 * v28);
            do
            {
              int v39 = *(_DWORD *)v31;
              v31 += 4;
              *v32++ = v39;
            }
            while (v32 != v38);
          }
LABEL_34:
          free(v18);
          uint64_t v7 = *((void *)a3 + 1);
          uint64_t v10 = -(uint64_t)a3[5];
          goto LABEL_35;
        }
        float v20 = &v18[4 * v21];
        v6 += v21;
      }
    }
    do
    {
      int v27 = *v6++;
      *(_DWORD *)float v20 = v27;
      v20 += 4;
    }
    while (v20 != &v18[4 * v9]);
    goto LABEL_24;
  }
  uint64_t v10 = -v8;
  if (!v9) {
    goto LABEL_35;
  }
  unint64_t v11 = (v9 - 1) & 0x3FFFFFFFFFFFFFFFLL;
  if (v11 < 7)
  {
    unint64_t v12 = (_DWORD *)*((void *)a3 + 1);
    do
    {
LABEL_20:
      int v26 = *v6++;
      *v12++ = v26;
    }
    while (v12 != (_DWORD *)(v7 + 4 * v9));
    goto LABEL_35;
  }
  unint64_t v12 = (_DWORD *)*((void *)a3 + 1);
  if ((unint64_t)(v7 - (void)v6) < 0x20) {
    goto LABEL_20;
  }
  uint64_t v13 = 0;
  uint64_t v14 = (v11 + 1) & 0x7FFFFFFFFFFFFFF8;
  uint64_t v15 = v14;
  do
  {
    BOOL v16 = (_OWORD *)(v7 + v13 * 4);
    long long v17 = *(_OWORD *)&v6[v13 + 4];
    *BOOL v16 = *(_OWORD *)&v6[v13];
    v16[1] = v17;
    v13 += 8;
    v15 -= 8;
  }
  while (v15);
  if (v11 + 1 != v14)
  {
    unint64_t v12 = (_DWORD *)(v7 + 4 * v14);
    v6 += v14;
    goto LABEL_20;
  }
LABEL_35:
  uint64_t v55 = a1 + 456;
  memptr[1] = &v55;
  memptr[2] = a2;
  int v60 = 1065353216;
  uint64_t v40 = v7 + 4 * v10;
  if (*(void *)(a1 + 456) == v40 || *((void *)a2 + 1) - 4 * a2[5] == v40)
  {
    size_t v41 = (4 * *(unsigned int *)(a1 + 476) + 31) & 0x7FFFFFFE0;
    v56[1] = (void *)(v41 >> 2);
    uint64_t v58 = 0;
    malloc_type_posix_memalign(&v58, 0x20uLL, v41, 0x49090899uLL);
    v56[0] = v58;
    int v57 = *(_DWORD *)(v55 + 20);
    sub_1D0E65EF8((uint64_t)v56, (uint64_t)memptr);
    uint64_t v42 = *a3;
    float v43 = v56[0];
    if (v42)
    {
      float32x2_t v44 = (float32x4_t *)*((void *)a3 + 1);
      unint64_t v45 = (v42 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      if (v45 >= 0xB)
      {
        if (v44 >= (float32x4_t *)((char *)v56[0] + 4 * v42)
          || (v46 = (float *)v56[0], int v47 = (float *)*((void *)a3 + 1), v56[0] >= &v44->f32[v42]))
        {
          uint64_t v48 = (v45 + 1) & 0x7FFFFFFFFFFFFFF8;
          uint64_t v46 = (float *)((char *)v56[0] + 4 * v48);
          simd_float3 v49 = v44 + 1;
          __int32 v50 = (float32x4_t *)((char *)v56[0] + 16);
          uint64_t v51 = v48;
          do
          {
            float32x4_t v52 = vaddq_f32(*v50, *v49);
            v49[-1] = vaddq_f32(v50[-1], v49[-1]);
            *simd_float3 v49 = v52;
            v49 += 2;
            v50 += 2;
            v51 -= 8;
          }
          while (v51);
          if (v45 + 1 == v48) {
            goto LABEL_51;
          }
          int v47 = &v44->f32[v48];
        }
      }
      else
      {
        uint64_t v46 = (float *)v56[0];
        int v47 = (float *)*((void *)a3 + 1);
      }
      float v53 = &v44->f32[v42];
      do
      {
        float v54 = *v46++;
        float *v47 = v54 + *v47;
        ++v47;
      }
      while (v47 != v53);
    }
LABEL_51:
    free(v43);
    return;
  }
  if (*(_DWORD *)(a1 + 472) * *(_DWORD *)(a1 + 476))
  {
    if (*a2) {
      cva::VecLib<float>::gemm();
    }
  }
}

void sub_1D0E65EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void ****)(a2 + 8);
  long long v5 = *(void **)a1;
  uint64_t v6 = *v4;
  if (**v4 == v5 || (uint64_t v7 = *(void *)(a2 + 16), (void *)(*(void *)(v7 + 8) - 4 * *(unsigned int *)(v7 + 20)) == v5))
  {
    size_t v8 = (4 * *((unsigned int *)v6 + 5) + 31) & 0x7FFFFFFE0;
    size_t v13 = v8 >> 2;
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 0x20uLL, v8, 0x49090899uLL);
    unint64_t v12 = memptr;
    int v14 = *(_DWORD *)(**(void **)(a2 + 8) + 20);
    sub_1D0E65EF8(&v12, a2);
    uint64_t v9 = *(void **)a1;
    size_t v10 = v13;
    *(void *)a1 = v12;
    *(void *)(a1 + 8) = v10;
    *(_DWORD *)(a1 + 16) = v14;
    free(v9);
  }
  else
  {
    if (*((_DWORD *)v6 + 4) * *((_DWORD *)v6 + 5) && *(_DWORD *)v7) {
      cva::VecLib<float>::gemm();
    }
    uint64_t v11 = *(unsigned int *)(a1 + 16);
    if (v11)
    {
      bzero(v5, 4 * v11);
    }
  }
}

uint64_t **sub_1D0E66034(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t v6 = a1 + 1;
  long long v5 = a1[1];
  if (v5)
  {
    int v7 = *((char *)a2 + 23);
    if (v7 >= 0) {
      size_t v8 = a2;
    }
    else {
      size_t v8 = *a2;
    }
    if (v7 >= 0) {
      size_t v9 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v9 = (size_t)a2[1];
    }
    while (1)
    {
      size_t v10 = (uint64_t **)v5;
      size_t v13 = (const void *)v5[4];
      uint64_t v11 = v5 + 4;
      unint64_t v12 = v13;
      int v14 = *((char *)v11 + 23);
      if (v14 >= 0) {
        uint64_t v15 = v11;
      }
      else {
        uint64_t v15 = v12;
      }
      if (v14 >= 0) {
        size_t v16 = *((unsigned __int8 *)v11 + 23);
      }
      else {
        size_t v16 = v11[1];
      }
      if (v16 >= v9) {
        size_t v17 = v9;
      }
      else {
        size_t v17 = v16;
      }
      int v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0) {
          goto LABEL_8;
        }
LABEL_22:
        int v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0) {
            return v10;
          }
        }
        else if (v16 >= v9)
        {
          return v10;
        }
        long long v5 = v10[1];
        if (!v5)
        {
          uint64_t v6 = v10 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v9 >= v16) {
          goto LABEL_22;
        }
LABEL_8:
        long long v5 = *v10;
        uint64_t v6 = v10;
        if (!*v10) {
          goto LABEL_29;
        }
      }
    }
  }
  size_t v10 = a1 + 1;
LABEL_29:
  float v20 = operator new(0x50uLL);
  uint64_t v21 = v20 + 4;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_1D0DCB370(v21, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)uint64_t v21 = *(_OWORD *)a3;
    v20[6] = *(void *)(a3 + 16);
  }
  v20[7] = 0;
  v20[8] = 0;
  v20[9] = 0;
  *float v20 = 0;
  v20[1] = 0;
  v20[2] = v10;
  int *v6 = v20;
  unint64_t v22 = (uint64_t *)**a1;
  simd_float3x3 v23 = v20;
  if (v22)
  {
    *a1 = v22;
    simd_float3x3 v23 = *v6;
  }
  sub_1D0DCEC98(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v20;
}

uint64_t sub_1D0E661AC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  if (v1)
  {
    if (*(char *)(v1 + 95) < 0)
    {
      operator delete(*(void **)(v1 + 72));
      if ((*(char *)(v1 + 71) & 0x80000000) == 0)
      {
LABEL_4:
        uint64_t v2 = *(void **)(v1 + 24);
        if (!v2) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
    else if ((*(char *)(v1 + 71) & 0x80000000) == 0)
    {
      goto LABEL_4;
    }
    operator delete(*(void **)(v1 + 48));
    uint64_t v2 = *(void **)(v1 + 24);
    if (!v2)
    {
LABEL_6:
      size_t v3 = *(void **)v1;
      if (*(void *)v1)
      {
        *(void *)(v1 + 8) = v3;
        operator delete(v3);
      }
      JUMPOUT(0x1D25F16B0);
    }
LABEL_5:
    *(void *)(v1 + 32) = v2;
    operator delete(v2);
    goto LABEL_6;
  }
  return result;
}

void sub_1D0E66254(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E66290(uint64_t a1, void *a2)
{
  if ((void *)a1 != a2)
  {
    uint64_t v4 = *a2;
    *(_DWORD *)(a1 + 8) = *((_DWORD *)a2 + 2);
    *(void *)a1 = v4;
    uint64_t v5 = *(void *)((char *)a2 + 12);
    *(_DWORD *)(a1 + 20) = *((_DWORD *)a2 + 5);
    *(void *)(a1 + 12) = v5;
    *(_DWORD *)(a1 + 24) = *((_DWORD *)a2 + 6);
    uint64_t v6 = (void **)(a1 + 32);
    size_t v7 = *((unsigned __int8 *)a2 + 55);
    if (*(char *)(a1 + 55) < 0)
    {
      if ((v7 & 0x80u) == 0) {
        size_t v9 = a2 + 4;
      }
      else {
        size_t v9 = (void *)a2[4];
      }
      if ((v7 & 0x80u) == 0) {
        size_t v10 = v7;
      }
      else {
        size_t v10 = a2[5];
      }
      sub_1D0DF92F0(v6, v9, v10);
    }
    else if ((v7 & 0x80) != 0)
    {
      sub_1D0DF922C(v6, (void *)a2[4], a2[5]);
    }
    else
    {
      long long v8 = *((_OWORD *)a2 + 2);
      *(void *)(a1 + 48) = a2[6];
      *(_OWORD *)uint64_t v6 = v8;
    }
    uint64_t v11 = (void **)(a1 + 56);
    char v12 = *((unsigned char *)a2 + 79);
    if (*(char *)(a1 + 79) < 0)
    {
      if (v12 >= 0) {
        int v14 = a2 + 7;
      }
      else {
        int v14 = (void *)a2[7];
      }
      if (v12 >= 0) {
        size_t v15 = *((unsigned __int8 *)a2 + 79);
      }
      else {
        size_t v15 = a2[8];
      }
      sub_1D0DF92F0(v11, v14, v15);
    }
    else if ((*((unsigned char *)a2 + 79) & 0x80) != 0)
    {
      sub_1D0DF922C(v11, (void *)a2[7], a2[8]);
    }
    else
    {
      long long v13 = *(_OWORD *)(a2 + 7);
      *(void *)(a1 + 72) = a2[9];
      *(_OWORD *)uint64_t v11 = v13;
    }
    size_t v16 = (void **)(a1 + 80);
    char v17 = *((unsigned char *)a2 + 103);
    if (*(char *)(a1 + 103) < 0)
    {
      if (v17 >= 0) {
        int v19 = a2 + 10;
      }
      else {
        int v19 = (void *)a2[10];
      }
      if (v17 >= 0) {
        size_t v20 = *((unsigned __int8 *)a2 + 103);
      }
      else {
        size_t v20 = a2[11];
      }
      sub_1D0DF92F0(v16, v19, v20);
    }
    else if ((*((unsigned char *)a2 + 103) & 0x80) != 0)
    {
      sub_1D0DF922C(v16, (void *)a2[10], a2[11]);
    }
    else
    {
      long long v18 = *((_OWORD *)a2 + 5);
      *(void *)(a1 + 96) = a2[12];
      *(_OWORD *)size_t v16 = v18;
    }
  }
  return a1;
}

void sub_1D0E663D8(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *(char **)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v6 = v5;
  if (a2 <= (v4 - (uint64_t)v5) >> 2)
  {
    if (a2)
    {
      bzero(v5, 4 * a2);
      uint64_t v6 = &v5[4 * a2];
    }
    *(void *)(a1 + 8) = v6;
  }
  else
  {
    size_t v7 = *(char **)a1;
    uint64_t v8 = (uint64_t)&v5[-*(void *)a1];
    uint64_t v9 = v8 >> 2;
    unint64_t v10 = (v8 >> 2) + a2;
    if (v10 >> 62) {
      abort();
    }
    uint64_t v11 = v4 - (void)v7;
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
      if (v12 >> 62) {
        sub_1D0DE8CE0();
      }
      long long v13 = operator new(4 * v12);
    }
    else
    {
      long long v13 = 0;
    }
    int v14 = &v13[4 * v9];
    size_t v15 = 4 * a2;
    size_t v16 = &v13[4 * v12];
    bzero(v14, v15);
    char v17 = &v14[v15];
    if (v5 != v7)
    {
      unint64_t v18 = v5 - v7 - 4;
      if (v18 < 0x2C) {
        goto LABEL_31;
      }
      if ((unint64_t)(v5 - v13 - v8) < 0x20) {
        goto LABEL_31;
      }
      uint64_t v19 = (v18 >> 2) + 1;
      uint64_t v6 = &v5[-4 * (v19 & 0x7FFFFFFFFFFFFFF8)];
      size_t v20 = &v13[4 * v9 - 16];
      uint64_t v21 = v5 - 16;
      uint64_t v22 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v23 = *(_OWORD *)v21;
        *(v20 - 1) = *((_OWORD *)v21 - 1);
        *size_t v20 = v23;
        v20 -= 2;
        v21 -= 32;
        v22 -= 8;
      }
      while (v22);
      v14 -= 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_31:
        do
        {
          int v24 = *((_DWORD *)v6 - 1);
          v6 -= 4;
          *((_DWORD *)v14 - 1) = v24;
          v14 -= 4;
        }
        while (v6 != v7);
      }
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v17;
    *(void *)(a1 + 16) = v16;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

uint64_t sub_1D0E66588(uint64_t result, int *a2, uint64_t **a3, uint64_t a4, int a5)
{
  uint64_t v11 = (int *)result;
LABEL_2:
  unint64_t v12 = a2 - 1;
  long long v13 = v11;
LABEL_3:
  int v267 = a5;
  while (1)
  {
    uint64_t v11 = v13;
    uint64_t v14 = (char *)a2 - (char *)v13;
    unint64_t v15 = a2 - v13;
    if (v6 || !v5)
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          int v136 = *v13;
          uint64_t v137 = **a3;
          v138 = (_DWORD *)(v137 + 12 * *v12);
          v139 = (_DWORD *)(v137 + 12 * *v13);
          if (*v138 < *v139) {
            goto LABEL_185;
          }
          if (*v138 > *v139) {
            return result;
          }
          int v240 = v138[1];
          int v241 = v139[1];
          if (v240 < v241)
          {
LABEL_185:
            BOOL v140 = 1;
          }
          else
          {
            if (v240 > v241) {
              return result;
            }
            int v242 = v138[2];
            int v243 = v139[2];
            BOOL v6 = v242 == v243;
            BOOL v140 = v242 < v243;
            if (v6) {
              return result;
            }
          }
          if (v140)
          {
            *long long v13 = *v12;
            *unint64_t v12 = v136;
          }
          return result;
        case 3uLL:
          uint64_t v141 = **a3;
          return (uint64_t)sub_1D0E6755C(v13, v13 + 1, a2 - 1, v141);
        case 4uLL:
          return (uint64_t)sub_1D0E67774(v13, v13 + 1, v13 + 2, a2 - 1, a3);
        case 5uLL:
          return (uint64_t)sub_1D0E67918(v13, v13 + 1, v13 + 2, v13 + 3, a2 - 1, a3);
        default:
          JUMPOUT(0);
      }
    }
    if (v14 <= 95)
    {
      if (a5)
      {
        if (v13 == a2) {
          return result;
        }
        v142 = v13 + 1;
        if (v13 + 1 == a2) {
          return result;
        }
        uint64_t v143 = 0;
        uint64_t v144 = **a3;
        v145 = v13;
        while (1)
        {
          v192 = v145;
          v145 = v142;
          int v194 = *v192;
          int v193 = v192[1];
          v195 = (int *)(v144 + 12 * v193);
          v196 = (unsigned int *)(v144 + 12 * *v192);
          BOOL result = *v196;
          if (*v195 < (int)result) {
            goto LABEL_261;
          }
          if (*v195 > (int)result) {
            goto LABEL_259;
          }
          int v204 = v195[1];
          BOOL result = v196[1];
          if (v204 < (int)result)
          {
LABEL_261:
            BOOL v197 = 1;
          }
          else
          {
            if (v204 > (int)result) {
              goto LABEL_259;
            }
            signed int v205 = v195[2];
            signed int v206 = v196[2];
            BOOL v6 = v205 == v206;
            BOOL v197 = v205 < v206;
            if (v6) {
              goto LABEL_259;
            }
          }
          if (v197) {
            break;
          }
LABEL_259:
          v142 = v145 + 1;
          v143 += 4;
          if (v145 + 1 == a2) {
            return result;
          }
        }
        uint64_t v198 = v143;
        while (1)
        {
          v191 = v192;
          *(int *)((char *)v13 + v198 + 4) = v194;
          if (!v198)
          {
            v191 = v13;
            goto LABEL_258;
          }
          int v194 = *(int *)((char *)v13 + v198 - 4);
          v199 = (_DWORD *)(v144 + 12 * v194);
          BOOL result = *v195;
          if ((int)result < *v199) {
            goto LABEL_268;
          }
          if ((int)result > *v199) {
            goto LABEL_258;
          }
          BOOL result = v195[1];
          int v200 = v199[1];
          if ((int)result >= v200)
          {
            if ((int)result > v200)
            {
              v191 = (int *)((char *)v13 + v198);
LABEL_258:
              int *v191 = v193;
              goto LABEL_259;
            }
            signed int v201 = v195[2];
            signed int v202 = v199[2];
            BOOL v6 = v201 == v202;
            BOOL result = v201 < v202;
            if (v6) {
              goto LABEL_258;
            }
          }
          else
          {
LABEL_268:
            BOOL result = 1;
          }
          v192 = v191 - 1;
          v198 -= 4;
          if ((result & 1) == 0) {
            goto LABEL_258;
          }
        }
      }
      if (v13 == a2) {
        return result;
      }
      v245 = v13 + 1;
      if (v13 + 1 == a2) {
        return result;
      }
      uint64_t v246 = **a3;
      while (1)
      {
        v247 = v11;
        uint64_t v11 = v245;
        int v249 = *v247;
        int v248 = v247[1];
        v250 = (_DWORD *)(v246 + 12 * v248);
        v251 = (_DWORD *)(v246 + 12 * *v247);
        if (*v250 < *v251) {
          goto LABEL_342;
        }
        if (*v250 > *v251) {
          goto LABEL_340;
        }
        int v262 = v250[1];
        int v263 = v251[1];
        if (v262 < v263)
        {
LABEL_342:
          BOOL v252 = 1;
        }
        else
        {
          if (v262 > v263) {
            goto LABEL_340;
          }
          int v264 = v250[2];
          int v265 = v251[2];
          BOOL v6 = v264 == v265;
          BOOL v252 = v264 < v265;
          if (v6) {
            goto LABEL_340;
          }
        }
        if (v252) {
          break;
        }
LABEL_340:
        v245 = v11 + 1;
        if (v11 + 1 == a2) {
          return result;
        }
      }
      while (1)
      {
        v253 = v247;
        int v254 = *--v247;
        v247[2] = v249;
        int v249 = v254;
        v255 = (_DWORD *)(v246 + 12 * v254);
        if (*v250 < *v255) {
          goto LABEL_347;
        }
        if (*v250 > *v255) {
          goto LABEL_339;
        }
        int v256 = v250[1];
        int v257 = v255[1];
        if (v256 >= v257)
        {
          if (v256 > v257
            || ((v259 = v250[2], v260 = v255[2], BOOL v6 = v259 == v260, v258 = v259 < v260, v6) ? (v261 = 0) : (v261 = 1),
                !v261))
          {
LABEL_339:
            int *v253 = v248;
            goto LABEL_340;
          }
        }
        else
        {
LABEL_347:
          BOOL v258 = 1;
        }
        if (!v258) {
          goto LABEL_339;
        }
      }
    }
    if (!a4) {
      break;
    }
    unint64_t v16 = v15 >> 1;
    char v17 = &v13[v15 >> 1];
    uint64_t v18 = **a3;
    if ((unint64_t)v14 >= 0x201)
    {
      sub_1D0E6755C(v11, &v11[v15 >> 1], a2 - 1, v18);
      uint64_t v19 = &v11[v16];
      sub_1D0E6755C(v11 + 1, v19 - 1, a2 - 2, **a3);
      sub_1D0E6755C(v11 + 2, &v11[v16 + 1], a2 - 3, **a3);
      BOOL result = (uint64_t)sub_1D0E6755C(v19 - 1, v17, &v11[v16 + 1], **a3);
      int v20 = *v11;
      *uint64_t v11 = *v19;
      *uint64_t v19 = v20;
      a5 = v267;
    }
    else
    {
      BOOL result = (uint64_t)sub_1D0E6755C(&v11[v15 >> 1], v11, a2 - 1, v18);
    }
    --a4;
    int v21 = *v11;
    int v22 = *v11;
    uint64_t v23 = **a3;
    if (a5)
    {
      int v24 = *(_DWORD *)(v23 + 12 * v22);
      goto LABEL_23;
    }
    long long v25 = (int *)(v23 + 12 * *(v11 - 1));
    int v26 = (int *)(v23 + 12 * v22);
    int v24 = *v26;
    if (*v25 < *v26) {
      goto LABEL_16;
    }
    if (*v25 > v24) {
      goto LABEL_97;
    }
    int v27 = v25[1];
    int v28 = v26[1];
    if (v27 < v28)
    {
LABEL_16:
      BOOL v29 = 1;
      goto LABEL_22;
    }
    if (v27 > v28 || ((v30 = v25[2], v31 = v26[2], BOOL v6 = v30 == v31, v29 = v30 < v31, v6) ? (v32 = 0) : (v32 = 1), !v32))
    {
LABEL_97:
      v84 = (_DWORD *)(v23 + 12 * *v12);
      if (v24 < *v84) {
        goto LABEL_98;
      }
      if (v24 <= *v84)
      {
        int v131 = v26[1];
        int v132 = v84[1];
        if (v131 < v132)
        {
LABEL_98:
          BOOL v85 = 1;
        }
        else
        {
          if (v131 > v132) {
            goto LABEL_115;
          }
          int v133 = v26[2];
          int v134 = v84[2];
          BOOL v6 = v133 == v134;
          BOOL v85 = v133 < v134;
          if (v6) {
            goto LABEL_115;
          }
        }
        if (!v85) {
          goto LABEL_115;
        }
        long long v13 = v11;
        while (2)
        {
          while (2)
          {
            int v86 = v13[1];
            ++v13;
            float v87 = (_DWORD *)(v23 + 12 * v86);
            if (v24 < *v87)
            {
LABEL_104:
              BOOL v90 = 1;
            }
            else
            {
              if (v24 > *v87) {
                goto LABEL_106;
              }
              int v88 = v26[1];
              int v89 = v87[1];
              if (v88 < v89) {
                goto LABEL_104;
              }
              if (v88 <= v89)
              {
                int v91 = v26[2];
                int v92 = v87[2];
                BOOL v6 = v91 == v92;
                BOOL v90 = v91 < v92;
                if (v6) {
                  continue;
                }
              }
              else
              {
LABEL_106:
                BOOL v90 = 0;
              }
            }
            break;
          }
          if (v90) {
            goto LABEL_130;
          }
          continue;
        }
      }
LABEL_115:
      float32x2_t v94 = v11 + 1;
      while (2)
      {
        long long v13 = v94;
        if (v94 < a2)
        {
          float v95 = (_DWORD *)(v23 + 12 * *v94);
          if (v24 < *v95) {
            goto LABEL_118;
          }
          if (v24 <= *v95)
          {
            int v97 = v26[1];
            int v98 = v95[1];
            if (v97 < v98)
            {
LABEL_118:
              BOOL v96 = 1;
              float32x2_t v94 = v13 + 1;
            }
            else
            {
              if (v97 > v98) {
                goto LABEL_120;
              }
              int v99 = v26[2];
              int v100 = v95[2];
              BOOL v6 = v99 == v100;
              BOOL v96 = v99 < v100;
              int v101 = !v6;
              float32x2_t v94 = v13 + 1;
              if (!v101) {
                continue;
              }
            }
          }
          else
          {
LABEL_120:
            BOOL v96 = 0;
            float32x2_t v94 = v13 + 1;
          }
          if (v96) {
            break;
          }
          continue;
        }
        break;
      }
LABEL_130:
      v102 = a2;
      if (v13 < a2)
      {
        v103 = a2 - 1;
        do
        {
          v102 = v103;
          v104 = (_DWORD *)(v23 + 12 * *v103);
          if (v24 < *v104) {
            goto LABEL_135;
          }
          if (v24 > *v104) {
            break;
          }
          int v105 = v26[1];
          int v106 = v104[1];
          if (v105 >= v106)
          {
            if (v105 > v106) {
              break;
            }
            int v108 = v26[2];
            int v109 = v104[2];
            BOOL v6 = v108 == v109;
            BOOL v107 = v108 < v109;
            if (v6) {
              break;
            }
          }
          else
          {
LABEL_135:
            BOOL v107 = 1;
          }
          v103 = v102 - 1;
        }
        while (v107);
      }
      if (v13 < v102)
      {
        int v111 = *v13;
        int v112 = *v102;
        do
        {
          *long long v13 = v112;
          int *v102 = v111;
          int v113 = *v26;
          do
          {
            do
            {
              int v114 = v13[1];
              ++v13;
              int v111 = v114;
              v115 = (_DWORD *)(v23 + 12 * v114);
              if (v113 < *v115)
              {
LABEL_149:
                BOOL v118 = 1;
                break;
              }
              if (v113 > *v115) {
                goto LABEL_151;
              }
              int v116 = v26[1];
              int v117 = v115[1];
              if (v116 < v117) {
                goto LABEL_149;
              }
              if (v116 > v117)
              {
LABEL_151:
                BOOL v118 = 0;
                break;
              }
              int v119 = v26[2];
              int v120 = v115[2];
              BOOL v6 = v119 == v120;
              BOOL v118 = v119 < v120;
            }
            while (v6);
          }
          while (!v118);
          v122 = v102 - 1;
          while (1)
          {
            v102 = v122;
            int v112 = *v122;
            v123 = (_DWORD *)(v23 + 12 * *v122);
            if (v113 >= *v123)
            {
              if (v113 > *v123) {
                goto LABEL_144;
              }
              int v124 = v26[1];
              int v125 = v123[1];
              if (v124 >= v125) {
                break;
              }
            }
            BOOL v126 = 1;
LABEL_168:
            v122 = v102 - 1;
            if (!v126) {
              goto LABEL_144;
            }
          }
          if (v124 <= v125)
          {
            int v127 = v26[2];
            int v128 = v123[2];
            BOOL v6 = v127 == v128;
            BOOL v126 = v127 < v128;
            if (!v6) {
              goto LABEL_168;
            }
          }
LABEL_144:
          ;
        }
        while (v13 < v102);
      }
      v130 = v13 - 1;
      BOOL v5 = v13 - 1 >= v11;
      BOOL v6 = v13 - 1 == v11;
      if (v13 - 1 != v11) {
        *uint64_t v11 = *v130;
      }
      a5 = 0;
      int *v130 = v21;
      goto LABEL_3;
    }
LABEL_22:
    if (!v29) {
      goto LABEL_97;
    }
LABEL_23:
    uint64_t v33 = (int *)(v23 + 12 * v22);
    unsigned int v34 = v11 + 1;
    while (1)
    {
      float v35 = v34;
      int v36 = *v34;
      long long v37 = (_DWORD *)(v23 + 12 * *v34);
      if (*v37 >= v24)
      {
        if (*v37 > v24) {
          goto LABEL_34;
        }
        int v38 = v37[1];
        int v39 = v33[1];
        if (v38 >= v39) {
          break;
        }
      }
      BOOL v40 = 1;
LABEL_33:
      unsigned int v34 = v35 + 1;
      if (!v40) {
        goto LABEL_34;
      }
    }
    if (v38 <= v39)
    {
      int v41 = v37[2];
      int v42 = v33[2];
      BOOL v6 = v41 == v42;
      BOOL v40 = v41 < v42;
      if (!v6) {
        goto LABEL_33;
      }
    }
LABEL_34:
    float32x2_t v44 = v35 - 1;
    unint64_t v45 = a2;
    if (v35 - 1 != v11)
    {
      while (1)
      {
        int v46 = *--v45;
        int v47 = (_DWORD *)(v23 + 12 * v46);
        if (*v47 < v24) {
          goto LABEL_36;
        }
        if (*v47 > v24) {
          goto LABEL_38;
        }
        int v49 = v47[1];
        int v50 = v33[1];
        if (v49 < v50)
        {
LABEL_36:
          BOOL v48 = 1;
LABEL_39:
          if (v48) {
            goto LABEL_63;
          }
        }
        else
        {
          if (v49 > v50)
          {
LABEL_38:
            BOOL v48 = 0;
            goto LABEL_39;
          }
          int v51 = v47[2];
          int v52 = v33[2];
          BOOL v6 = v51 == v52;
          BOOL v48 = v51 < v52;
          if (!v6) {
            goto LABEL_39;
          }
        }
      }
    }
    unint64_t v45 = a2;
    while (v35 < v45)
    {
      int v54 = *--v45;
      uint64_t v55 = (_DWORD *)(v23 + 12 * v54);
      if (*v55 < v24) {
        goto LABEL_51;
      }
      if (*v55 > v24) {
        goto LABEL_53;
      }
      int v57 = v55[1];
      int v58 = v33[1];
      if (v57 < v58)
      {
LABEL_51:
        BOOL v56 = 1;
LABEL_54:
        if (v56) {
          break;
        }
      }
      else
      {
        if (v57 > v58)
        {
LABEL_53:
          BOOL v56 = 0;
          goto LABEL_54;
        }
        int v59 = v55[2];
        int v60 = v33[2];
        BOOL v6 = v59 == v60;
        BOOL v56 = v59 < v60;
        if (!v6) {
          goto LABEL_54;
        }
      }
    }
LABEL_63:
    if (v35 < v45)
    {
      int v62 = *v45;
      int v63 = v36;
      float v64 = v35;
      long long v65 = v45;
      while (2)
      {
        *float v64 = v62;
        *long long v65 = v63;
        int v66 = *v33;
        v67 = v64 + 1;
        while (1)
        {
          float v64 = v67;
          int v63 = *v67;
          int v68 = (_DWORD *)(v23 + 12 * *v67);
          if (*v68 >= v66)
          {
            if (*v68 > v66) {
              goto LABEL_77;
            }
            int v69 = v68[1];
            int v70 = v33[1];
            if (v69 >= v70) {
              break;
            }
          }
          BOOL v71 = 1;
LABEL_76:
          v67 = v64 + 1;
          if (!v71) {
            goto LABEL_77;
          }
        }
        if (v69 <= v70)
        {
          int v72 = v68[2];
          int v73 = v33[2];
          BOOL v6 = v72 == v73;
          BOOL v71 = v72 < v73;
          if (!v6) {
            goto LABEL_76;
          }
        }
LABEL_77:
        float32x2_t v44 = v64 - 1;
LABEL_78:
        while (2)
        {
          int v75 = *--v65;
          int v62 = v75;
          float v76 = (_DWORD *)(v23 + 12 * v75);
          if (*v76 < v66)
          {
LABEL_81:
            BOOL v79 = 1;
          }
          else
          {
            if (*v76 > v66) {
              goto LABEL_83;
            }
            int v77 = v76[1];
            int v78 = v33[1];
            if (v77 < v78) {
              goto LABEL_81;
            }
            if (v77 <= v78)
            {
              int v80 = v76[2];
              int v81 = v33[2];
              BOOL v6 = v80 == v81;
              BOOL v79 = v80 < v81;
              if (v6) {
                continue;
              }
            }
            else
            {
LABEL_83:
              BOOL v79 = 0;
            }
          }
          break;
        }
        if (v79)
        {
          if (v64 >= v65) {
            break;
          }
          continue;
        }
        goto LABEL_78;
      }
    }
    if (v44 != v11) {
      *uint64_t v11 = *v44;
    }
    *float32x2_t v44 = v21;
    if (v35 < v45)
    {
LABEL_96:
      BOOL result = sub_1D0E66588(v11, v44, a3, a4, a5 & 1);
      a5 = 0;
      long long v13 = v44 + 1;
      goto LABEL_3;
    }
    BOOL v83 = sub_1D0E67B2C(v11, v44, a3);
    long long v13 = v44 + 1;
    BOOL result = sub_1D0E67B2C(v44 + 1, a2, a3);
    if (result)
    {
      a2 = v44;
      if (v83) {
        return result;
      }
      goto LABEL_2;
    }
    if (!v83) {
      goto LABEL_96;
    }
  }
  if (v13 == a2) {
    return result;
  }
  int64_t v146 = (v15 - 2) >> 1;
  v147 = *a3;
  int64_t v148 = v146;
  while (2)
  {
    int64_t v149 = v148;
    if (v146 < v148) {
      goto LABEL_204;
    }
    uint64_t v150 = (2 * v148) | 1;
    v151 = &v13[v150];
    uint64_t v152 = 2 * v148 + 2;
    uint64_t v153 = *v147;
    if (v152 < (uint64_t)v15)
    {
      v154 = (_DWORD *)(v153 + 12 * *v151);
      v155 = (_DWORD *)(v153 + 12 * v151[1]);
      if (*v154 < *v155) {
        goto LABEL_210;
      }
      if (*v154 <= *v155)
      {
        int v156 = v154[1];
        int v157 = v155[1];
        if (v156 >= v157)
        {
          if (v156 <= v157)
          {
            int v189 = v154[2];
            int v190 = v155[2];
            BOOL v6 = v189 == v190;
            BOOL v159 = v189 < v190;
            int v158 = !v6;
            goto LABEL_211;
          }
        }
        else
        {
LABEL_210:
          int v158 = 1;
          BOOL v159 = 1;
LABEL_211:
          if ((v158 & v159) != 0)
          {
            ++v151;
            uint64_t v150 = 2 * v149 + 2;
          }
        }
      }
    }
    v160 = &v13[v149];
    int v161 = *v151;
    int v162 = *v160;
    v163 = (_DWORD *)(v153 + 12 * *v151);
    BOOL result = v153 + 12 * *v160;
    if (*v163 >= *(_DWORD *)result)
    {
      if (*v163 > *(_DWORD *)result) {
        goto LABEL_238;
      }
      int v164 = v163[1];
      int v165 = *(_DWORD *)(result + 4);
      if (v164 >= v165)
      {
        if (v164 <= v165)
        {
          int v167 = v163[2];
          int v168 = *(_DWORD *)(result + 8);
          BOOL v6 = v167 == v168;
          BOOL v166 = v167 < v168;
          if (!v6) {
            goto LABEL_217;
          }
        }
        while (1)
        {
LABEL_238:
          v183 = v151;
          int *v160 = v161;
          if (v146 < v150)
          {
LABEL_203:
            int *v183 = v162;
            goto LABEL_204;
          }
          uint64_t v184 = (2 * v150) | 1;
          v151 = &v13[v184];
          uint64_t v185 = 2 * v150 + 2;
          if (v185 >= (uint64_t)v15)
          {
LABEL_246:
            uint64_t v150 = (2 * v150) | 1;
            goto LABEL_247;
          }
          v186 = (_DWORD *)(v153 + 12 * *v151);
          v187 = (_DWORD *)(v153 + 12 * v151[1]);
          if (*v186 < *v187) {
            goto LABEL_241;
          }
          if (*v186 > *v187) {
            goto LABEL_246;
          }
          int v176 = v186[1];
          int v177 = v187[1];
          BOOL v178 = v176 <= v177;
          if (v176 < v177)
          {
LABEL_241:
            int v182 = 1;
            BOOL v181 = 1;
          }
          else
          {
            uint64_t v150 = v184;
            if (!v178) {
              goto LABEL_247;
            }
            int v179 = v186[2];
            int v180 = v187[2];
            BOOL v6 = v179 == v180;
            BOOL v181 = v179 < v180;
            int v182 = !v6;
          }
          if ((v182 & v181) != 0)
          {
            ++v151;
            uint64_t v150 = v185;
          }
          else
          {
            uint64_t v150 = v184;
          }
LABEL_247:
          int v161 = *v151;
          v188 = (_DWORD *)(v153 + 12 * *v151);
          if (*v188 < *(_DWORD *)result) {
            goto LABEL_248;
          }
          if (*v188 > *(_DWORD *)result)
          {
LABEL_250:
            BOOL v174 = 0;
            goto LABEL_251;
          }
          int v170 = v188[1];
          int v171 = *(_DWORD *)(result + 4);
          if (v170 < v171)
          {
LABEL_248:
            BOOL v174 = 1;
LABEL_251:
            v160 = v183;
            if (v174) {
              goto LABEL_203;
            }
          }
          else
          {
            if (v170 > v171) {
              goto LABEL_250;
            }
            int v172 = v188[2];
            int v173 = *(_DWORD *)(result + 8);
            BOOL v6 = v172 == v173;
            BOOL v174 = v172 < v173;
            int v175 = !v6;
            v160 = v183;
            if (v175) {
              goto LABEL_251;
            }
          }
        }
      }
    }
    BOOL v166 = 1;
LABEL_217:
    if (!v166) {
      goto LABEL_238;
    }
LABEL_204:
    int64_t v148 = v149 - 1;
    if (v149) {
      continue;
    }
    break;
  }
  uint64_t v208 = (unint64_t)v14 >> 2;
  while (2)
  {
    if (v208 < 2) {
      goto LABEL_287;
    }
    uint64_t v209 = 0;
    int v210 = *v13;
    v211 = *a3;
    v212 = v13;
    while (2)
    {
      v214 = v212;
      v212 += v209 + 1;
      uint64_t v215 = 2 * v209;
      uint64_t v209 = (2 * v209) | 1;
      if (v215 + 2 < v208)
      {
        BOOL result = *v211 + 12 * *v212;
        v216 = (_DWORD *)(*v211 + 12 * v212[1]);
        if (*(_DWORD *)result < *v216) {
          goto LABEL_291;
        }
        if (*(_DWORD *)result > *v216) {
          goto LABEL_294;
        }
        int v217 = *(_DWORD *)(result + 4);
        int v218 = v216[1];
        if (v217 < v218)
        {
LABEL_291:
          BOOL result = 1;
          BOOL v213 = 1;
LABEL_292:
          if ((result & v213) != 0)
          {
            ++v212;
            uint64_t v209 = v215 + 2;
          }
        }
        else if (v217 <= v218)
        {
          int v219 = *(_DWORD *)(result + 8);
          int v220 = v216[2];
          BOOL v6 = v219 == v220;
          BOOL v213 = v219 < v220;
          BOOL result = !v6;
          goto LABEL_292;
        }
      }
LABEL_294:
      int *v214 = *v212;
      if (v209 <= (uint64_t)((unint64_t)(v208 - 2) >> 1)) {
        continue;
      }
      break;
    }
    v221 = a2 - 1;
    if (v212 == a2 - 1)
    {
      int *v212 = v210;
      goto LABEL_287;
    }
    int *v212 = *v221;
    int *v221 = v210;
    uint64_t v222 = (char *)v212 - (char *)v13 + 4;
    if (v222 >= 5)
    {
      unint64_t v223 = (((unint64_t)v222 >> 2) - 2) >> 1;
      v224 = &v13[v223];
      int v225 = *v224;
      int v226 = *v212;
      uint64_t v227 = *v211;
      v228 = (unsigned int *)(v227 + 12 * *v224);
      v229 = (_DWORD *)(v227 + 12 * *v212);
      BOOL result = *v228;
      if ((int)result < *v229) {
        goto LABEL_306;
      }
      if ((int)result <= *v229)
      {
        BOOL result = v228[1];
        int v236 = v229[1];
        if ((int)result < v236)
        {
LABEL_306:
          BOOL result = 1;
        }
        else
        {
          if ((int)result > v236) {
            goto LABEL_287;
          }
          signed int v237 = v228[2];
          signed int v238 = v229[2];
          BOOL v6 = v237 == v238;
          BOOL result = v237 < v238;
          if (v6) {
            goto LABEL_287;
          }
        }
        if (result)
        {
          do
          {
            v230 = v224;
            int *v212 = v225;
            if (!v223) {
              break;
            }
            unint64_t v223 = (v223 - 1) >> 1;
            v224 = &v13[v223];
            int v225 = *v224;
            v231 = (unsigned int *)(v227 + 12 * *v224);
            BOOL result = *v231;
            if ((int)result < *v229) {
              goto LABEL_312;
            }
            if ((int)result > *v229) {
              break;
            }
            BOOL result = v231[1];
            int v232 = v229[1];
            if ((int)result >= v232)
            {
              if ((int)result > v232) {
                break;
              }
              signed int v233 = v231[2];
              signed int v234 = v229[2];
              BOOL v6 = v233 == v234;
              BOOL result = v233 < v234;
              if (v6) {
                break;
              }
            }
            else
            {
LABEL_312:
              BOOL result = 1;
            }
            v212 = v230;
          }
          while ((result & 1) != 0);
          int *v230 = v226;
        }
      }
    }
LABEL_287:
    --a2;
    BOOL v178 = (unint64_t)v208-- > 2;
    if (v178) {
      continue;
    }
    return result;
  }
}

int *sub_1D0E6755C(int *result, int *a2, int *a3, uint64_t a4)
{
  int v4 = *a2;
  int v5 = *result;
  BOOL v6 = (int *)(a4 + 12 * *a2);
  size_t v7 = (int *)(a4 + 12 * *result);
  int v8 = *v6;
  if (*v6 < *v7) {
    goto LABEL_2;
  }
  if (v8 > *v7) {
    goto LABEL_11;
  }
  int v26 = v6[1];
  int v27 = v7[1];
  if (v26 < v27)
  {
LABEL_2:
    BOOL v9 = 1;
  }
  else
  {
    if (v26 > v27) {
      goto LABEL_11;
    }
    int v28 = v6[2];
    int v29 = v7[2];
    BOOL v24 = v28 == v29;
    BOOL v9 = v28 < v29;
    if (v24) {
      goto LABEL_11;
    }
  }
  if (v9)
  {
    unint64_t v10 = (_DWORD *)(a4 + 12 * *a3);
    if (*v10 < v8) {
      goto LABEL_7;
    }
    if (*v10 > v8) {
      goto LABEL_46;
    }
    int v11 = v10[1];
    int v12 = v6[1];
    if (v11 >= v12)
    {
      if (v11 > v12) {
        goto LABEL_46;
      }
      int v36 = v10[2];
      int v37 = v6[2];
      BOOL v24 = v36 == v37;
      BOOL v13 = v36 < v37;
      if (v24) {
        goto LABEL_46;
      }
    }
    else
    {
LABEL_7:
      BOOL v13 = 1;
    }
    if (v13)
    {
      *BOOL result = *a3;
LABEL_50:
      *a3 = v5;
      return result;
    }
LABEL_46:
    *BOOL result = v4;
    *a2 = v5;
    int v39 = (int *)(a4 + 12 * *a3);
    if (*v39 < *v7) {
      goto LABEL_47;
    }
    if (*v39 > *v7) {
      return result;
    }
    int v41 = v39[1];
    int v42 = v7[1];
    if (v41 < v42)
    {
LABEL_47:
      BOOL v40 = 1;
    }
    else
    {
      if (v41 > v42) {
        return result;
      }
      int v43 = v39[2];
      int v44 = v7[2];
      BOOL v24 = v43 == v44;
      BOOL v40 = v43 < v44;
      if (v24) {
        return result;
      }
    }
    if (v40)
    {
      *a2 = *a3;
      goto LABEL_50;
    }
    return result;
  }
LABEL_11:
  uint64_t v14 = (_DWORD *)(a4 + 12 * *a3);
  if (*v14 < v8) {
    goto LABEL_12;
  }
  if (*v14 > v8) {
    return result;
  }
  int v20 = v14[1];
  int v21 = v6[1];
  if (v20 < v21)
  {
LABEL_12:
    BOOL v15 = 1;
  }
  else
  {
    if (v20 > v21) {
      return result;
    }
    int v22 = v14[2];
    int v23 = v6[2];
    BOOL v24 = v22 == v23;
    BOOL v15 = v22 < v23;
    if (v24) {
      return result;
    }
  }
  if (!v15) {
    return result;
  }
  *a2 = *a3;
  *a3 = v4;
  int v16 = *result;
  char v17 = (_DWORD *)(a4 + 12 * *a2);
  uint64_t v18 = (_DWORD *)(a4 + 12 * *result);
  if (*v17 < *v18) {
    goto LABEL_15;
  }
  if (*v17 > *v18) {
    return result;
  }
  int v31 = v17[1];
  int v32 = v18[1];
  if (v31 < v32)
  {
LABEL_15:
    BOOL v19 = 1;
  }
  else
  {
    if (v31 > v32) {
      return result;
    }
    int v33 = v17[2];
    int v34 = v18[2];
    BOOL v24 = v33 == v34;
    BOOL v19 = v33 < v34;
    if (v24) {
      return result;
    }
  }
  if (v19)
  {
    *BOOL result = *a2;
    *a2 = v16;
  }
  return result;
}

int *sub_1D0E67774(int *a1, int *a2, int *a3, int *a4, uint64_t **a5)
{
  BOOL result = sub_1D0E6755C(a1, a2, a3, **a5);
  int v11 = *a3;
  uint64_t v12 = **a5;
  BOOL v13 = (_DWORD *)(v12 + 12 * *a4);
  uint64_t v14 = (_DWORD *)(v12 + 12 * *a3);
  if (*v13 < *v14) {
    goto LABEL_2;
  }
  if (*v13 > *v14) {
    return result;
  }
  int v26 = v13[1];
  int v27 = v14[1];
  if (v26 < v27)
  {
LABEL_2:
    BOOL v15 = 1;
LABEL_3:
    if (!v15) {
      return result;
    }
    *a3 = *a4;
    *a4 = v11;
    int v16 = *a2;
    char v17 = (_DWORD *)(v12 + 12 * *a3);
    uint64_t v18 = (_DWORD *)(v12 + 12 * *a2);
    if (*v17 < *v18) {
      goto LABEL_5;
    }
    if (*v17 > *v18) {
      return result;
    }
    int v32 = v17[1];
    int v33 = v18[1];
    if (v32 < v33)
    {
LABEL_5:
      BOOL v19 = 1;
    }
    else
    {
      if (v32 > v33) {
        return result;
      }
      int v34 = v17[2];
      int v35 = v18[2];
      BOOL v30 = v34 == v35;
      BOOL v19 = v34 < v35;
      if (v30) {
        return result;
      }
    }
    if (!v19) {
      return result;
    }
    *a2 = *a3;
    *a3 = v16;
    int v20 = *a1;
    int v21 = (_DWORD *)(v12 + 12 * *a2);
    int v22 = (_DWORD *)(v12 + 12 * *a1);
    if (*v21 < *v22) {
      goto LABEL_10;
    }
    if (*v21 > *v22) {
      return result;
    }
    int v23 = v21[1];
    int v24 = v22[1];
    if (v23 >= v24)
    {
      if (v23 > v24) {
        return result;
      }
      int v37 = v21[2];
      int v38 = v22[2];
      BOOL v30 = v37 == v38;
      BOOL v25 = v37 < v38;
      if (v30) {
        return result;
      }
    }
    else
    {
LABEL_10:
      BOOL v25 = 1;
    }
    if (v25)
    {
      *a1 = *a2;
      *a2 = v20;
    }
    return result;
  }
  if (v26 <= v27)
  {
    int v28 = v13[2];
    int v29 = v14[2];
    BOOL v30 = v28 == v29;
    BOOL v15 = v28 < v29;
    if (!v30) {
      goto LABEL_3;
    }
  }
  return result;
}

int *sub_1D0E67918(int *a1, int *a2, int *a3, int *a4, int *a5, uint64_t **a6)
{
  BOOL result = sub_1D0E67774(a1, a2, a3, a4, a6);
  int v13 = *a4;
  uint64_t v14 = **a6;
  BOOL v15 = (_DWORD *)(v14 + 12 * *a5);
  int v16 = (_DWORD *)(v14 + 12 * *a4);
  if (*v15 < *v16) {
    goto LABEL_2;
  }
  if (*v15 > *v16) {
    return result;
  }
  int v32 = v15[1];
  int v33 = v16[1];
  if (v32 < v33)
  {
LABEL_2:
    BOOL v17 = 1;
LABEL_3:
    if (!v17) {
      return result;
    }
    *a4 = *a5;
    *a5 = v13;
    int v18 = *a3;
    BOOL v19 = (_DWORD *)(v14 + 12 * *a4);
    int v20 = (_DWORD *)(v14 + 12 * *a3);
    if (*v19 < *v20) {
      goto LABEL_5;
    }
    if (*v19 > *v20) {
      return result;
    }
    int v38 = v19[1];
    int v39 = v20[1];
    if (v38 < v39)
    {
LABEL_5:
      BOOL v21 = 1;
    }
    else
    {
      if (v38 > v39) {
        return result;
      }
      int v40 = v19[2];
      int v41 = v20[2];
      BOOL v36 = v40 == v41;
      BOOL v21 = v40 < v41;
      if (v36) {
        return result;
      }
    }
    if (!v21) {
      return result;
    }
    *a3 = *a4;
    *a4 = v18;
    int v22 = *a2;
    int v23 = (_DWORD *)(v14 + 12 * *a3);
    int v24 = (_DWORD *)(v14 + 12 * *a2);
    if (*v23 < *v24) {
      goto LABEL_8;
    }
    if (*v23 > *v24) {
      return result;
    }
    int v43 = v23[1];
    int v44 = v24[1];
    if (v43 < v44)
    {
LABEL_8:
      BOOL v25 = 1;
    }
    else
    {
      if (v43 > v44) {
        return result;
      }
      int v45 = v23[2];
      int v46 = v24[2];
      BOOL v36 = v45 == v46;
      BOOL v25 = v45 < v46;
      if (v36) {
        return result;
      }
    }
    if (!v25) {
      return result;
    }
    *a2 = *a3;
    *a3 = v22;
    int v26 = *a1;
    int v27 = (_DWORD *)(v14 + 12 * *a2);
    int v28 = (_DWORD *)(v14 + 12 * *a1);
    if (*v27 < *v28) {
      goto LABEL_13;
    }
    if (*v27 > *v28) {
      return result;
    }
    int v29 = v27[1];
    int v30 = v28[1];
    if (v29 >= v30)
    {
      if (v29 > v30) {
        return result;
      }
      int v48 = v27[2];
      int v49 = v28[2];
      BOOL v36 = v48 == v49;
      BOOL v31 = v48 < v49;
      if (v36) {
        return result;
      }
    }
    else
    {
LABEL_13:
      BOOL v31 = 1;
    }
    if (v31)
    {
      *a1 = *a2;
      *a2 = v26;
    }
    return result;
  }
  if (v32 <= v33)
  {
    int v34 = v15[2];
    int v35 = v16[2];
    BOOL v36 = v34 == v35;
    BOOL v17 = v34 < v35;
    if (!v36) {
      goto LABEL_3;
    }
  }
  return result;
}

BOOL sub_1D0E67B2C(int *a1, int *a2, uint64_t **a3)
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      int v8 = *(a2 - 1);
      int v9 = *a1;
      uint64_t v10 = **a3;
      int v11 = (_DWORD *)(v10 + 12 * v8);
      uint64_t v12 = (_DWORD *)(v10 + 12 * *a1);
      if (*v11 < *v12) {
        goto LABEL_3;
      }
      if (*v11 > *v12) {
        return result;
      }
      int v40 = v11[1];
      int v41 = v12[1];
      if (v40 < v41)
      {
LABEL_3:
        BOOL v13 = 1;
LABEL_4:
        if (v13)
        {
          *a1 = v8;
          *(a2 - 1) = v9;
        }
        return result;
      }
      if (v40 <= v41)
      {
        int v42 = v11[2];
        int v43 = v12[2];
        BOOL v33 = v42 == v43;
        BOOL v13 = v42 < v43;
        if (!v33) {
          goto LABEL_4;
        }
      }
      return result;
    case 3:
      sub_1D0E6755C(a1, a1 + 1, a2 - 1, **a3);
      return 1;
    case 4:
      sub_1D0E67774(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      sub_1D0E67918(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      uint64_t v14 = a1 + 2;
      sub_1D0E6755C(a1, a1 + 1, a1 + 2, **a3);
      BOOL v15 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v16 = 0;
      int v17 = 0;
      uint64_t v18 = **a3;
      while (2)
      {
        int v20 = *v15;
        int v21 = *v14;
        int v22 = (_DWORD *)(v18 + 12 * *v15);
        int v23 = (_DWORD *)(v18 + 12 * *v14);
        if (*v22 < *v23) {
          goto LABEL_13;
        }
        if (*v22 > *v23) {
          goto LABEL_11;
        }
        int v35 = v22[1];
        int v36 = v23[1];
        if (v35 < v36)
        {
LABEL_13:
          BOOL v24 = 1;
        }
        else
        {
          if (v35 > v36) {
            goto LABEL_11;
          }
          int v37 = v22[2];
          int v38 = v23[2];
          BOOL v33 = v37 == v38;
          BOOL v24 = v37 < v38;
          if (v33) {
            goto LABEL_11;
          }
        }
        if (v24)
        {
          uint64_t v25 = v16;
          while (1)
          {
            *(int *)((char *)a1 + v25 + 12) = v21;
            if (v25 == -8) {
              break;
            }
            uint64_t v27 = v25;
            int v21 = *(int *)((char *)a1 + v25 + 4);
            int v28 = (_DWORD *)(v18 + 12 * v21);
            if (*v22 < *v28) {
              goto LABEL_16;
            }
            if (*v22 > *v28) {
              goto LABEL_9;
            }
            int v29 = v22[1];
            int v30 = v28[1];
            if (v29 < v30)
            {
LABEL_16:
              BOOL v26 = 1;
            }
            else if (v29 > v30 {
                   || ((v31 = v22[2], v32 = v28[2], v33 = v31 == v32, BOOL v26 = v31 < v32, v33) ? (v34 = 0) : (v34 = 1), !v34))
            }
            {
LABEL_9:
              BOOL v19 = (int *)((char *)a1 + v27 + 8);
              goto LABEL_10;
            }
            uint64_t v25 = v27 - 4;
            if (!v26) {
              goto LABEL_9;
            }
          }
          BOOL v19 = a1;
LABEL_10:
          *BOOL v19 = v20;
          if (++v17 == 8) {
            return v15 + 1 == a2;
          }
        }
LABEL_11:
        uint64_t v14 = v15;
        v16 += 4;
        if (++v15 == a2) {
          return 1;
        }
        continue;
      }
  }
}

void sub_1D0E67DEC(uint64_t a1, uint64_t *a2, uint64_t *a3, size_t __sz)
{
  uint64_t v6 = a2;
  uint64_t v8 = *(void *)(a1 + 16);
  int v9 = *(char **)a1;
  if (__sz <= (v8 - *(void *)a1) >> 4)
  {
    BOOL v13 = *(char **)(a1 + 8);
    unint64_t v14 = (v13 - v9) >> 4;
    if (v14 >= __sz)
    {
      if (a2 != a3)
      {
        do
        {
          uint64_t v20 = *v6;
          uint64_t v19 = v6[1];
          if (v19) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
          }
          int v21 = (std::__shared_weak_count *)*((void *)v9 + 1);
          *(void *)int v9 = v20;
          *((void *)v9 + 1) = v19;
          if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
          v9 += 16;
          v6 += 2;
        }
        while (v6 != a3);
        BOOL v13 = *(char **)(a1 + 8);
      }
      for (; v13 != v9; v13 -= 16)
      {
        int v30 = (std::__shared_weak_count *)*((void *)v13 - 1);
        if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
      *(void *)(a1 + 8) = v9;
    }
    else
    {
      BOOL v15 = &a2[2 * v14];
      if (v13 != v9)
      {
        do
        {
          uint64_t v17 = *v6;
          uint64_t v16 = v6[1];
          if (v16) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
          }
          uint64_t v18 = (std::__shared_weak_count *)*((void *)v9 + 1);
          *(void *)int v9 = v17;
          *((void *)v9 + 1) = v16;
          if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
            std::__shared_weak_count::__release_weak(v18);
          }
          v6 += 2;
          v9 += 16;
        }
        while (v6 != v15);
        int v9 = *(char **)(a1 + 8);
      }
      int v28 = v9;
      if (v15 != a3)
      {
        int v28 = v9;
        do
        {
          uint64_t v29 = v15[1];
          *(void *)int v28 = *v15;
          *((void *)v28 + 1) = v29;
          if (v29) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v29 + 8), 1uLL, memory_order_relaxed);
          }
          v28 += 16;
          v15 += 2;
        }
        while (v15 != a3);
      }
      *(void *)(a1 + 8) = v28;
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v10 = *(char **)(a1 + 8);
      int v11 = *(char **)a1;
      if (v10 != v9)
      {
        do
        {
          uint64_t v12 = (std::__shared_weak_count *)*((void *)v10 - 1);
          if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
            std::__shared_weak_count::__release_weak(v12);
          }
          v10 -= 16;
        }
        while (v10 != v9);
        int v11 = *(char **)a1;
      }
      *(void *)(a1 + 8) = v9;
      operator delete(v11);
      uint64_t v8 = 0;
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
    if (__sz >> 60) {
      goto LABEL_55;
    }
    uint64_t v22 = v8 >> 3;
    if (v8 >> 3 <= __sz) {
      uint64_t v22 = __sz;
    }
    BOOL v23 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0;
    unint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
    if (!v23) {
      unint64_t v24 = v22;
    }
    if (v24 >> 60) {
LABEL_55:
    }
      abort();
    uint64_t v25 = 2 * v24;
    BOOL v26 = operator new(16 * v24);
    *(void *)a1 = v26;
    *(void *)(a1 + 8) = v26;
    for (*(void *)(a1 + 16) = &v26[v25]; v6 != a3; v6 += 2)
    {
      uint64_t v27 = v6[1];
      *BOOL v26 = *v6;
      v26[1] = v27;
      if (v27) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v27 + 8), 1uLL, memory_order_relaxed);
      }
      v26 += 2;
    }
    *(void *)(a1 + 8) = v26;
  }
}

uint64_t sub_1D0E6812C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  *(void *)(a1 + 8) = *(void *)a1;
  *(void *)(a1 + 32) = *(void *)(a1 + 24);
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  *(void *)(a1 + 104) = *(void *)(a1 + 96);
  *(void *)(a1 + 128) = *(void *)(a1 + 120);
  *(void *)(a1 + 152) = *(void *)(a1 + 144);
  *(void *)(a1 + 176) = *(void *)(a1 + 168);
  *(void *)(a1 + 200) = *(void *)(a1 + 192);
  BOOL v71 = (void **)(a1 + 216);
  *(void *)(a1 + 224) = *(void *)(a1 + 216);
  uint64_t v6 = (void *)(a1 + 248);
  sub_1D0E2BA28(*(char **)(a1 + 248));
  *(void *)(a1 + 240) = v6;
  void *v6 = 0;
  *(void *)(a1 + 256) = 0;
  sub_1D0E2B93C(*(char **)(a1 + 272));
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0;
  *(void *)(a1 + 264) = a1 + 272;
  if (*(char *)(a1 + 455) < 0)
  {
    **(unsigned char **)(a1 + 432) = 0;
    *(void *)(a1 + 440) = 0;
  }
  else
  {
    *(unsigned char *)(a1 + 432) = 0;
    *(unsigned char *)(a1 + 455) = 0;
  }
  sub_1D0E75668(&v99, *a2, (const void **)a3);
  if (v99)
  {
    (*(void (**)(uint64_t *__return_ptr))(*(void *)v99 + 64))(&v97);
    size_t v7 = (cva::Path *)cva::Path::Path();
    cva::Path::directory((uint64_t *)__p, v7);
    uint64_t v8 = cva::Path::string((cva::Path *)__p);
    if (*(char *)(v8 + 23) < 0)
    {
      sub_1D0DCB370(v95, *(void **)v8, *(void *)(v8 + 8));
    }
    else
    {
      *(_OWORD *)float v95 = *(_OWORD *)v8;
      uint64_t v96 = *(void *)(v8 + 16);
    }
    cva::Path::~Path((cva::Path *)__p);
    cva::Path::~Path((cva::Path *)&v103);
    uint64_t v94 = 0;
    uint64_t v93 = 0;
    uint64_t v92 = 0;
    uint64_t v91 = 0;
    uint64_t v90 = 0;
    uint64_t v89 = 0;
    char v88 = 7;
    strcpy((char *)&__src, "default");
    BOOL v13 = sub_1D0E6C968((uint64_t **)(a1 + 240), (const void **)&__src, (uint64_t)&__src);
    __asm { FMOV            V8.2S, #1.0 }
    v13[7] = _D8;
    *((_DWORD *)v13 + 16) = 1065353216;
    *(uint64_t **)((char *)v13 + 68) = 0;
    *(uint64_t **)((char *)v13 + 76) = (uint64_t *)0x4270000000000000;
    uint64_t v18 = (void **)(v13 + 11);
    if (*((char *)v13 + 111) < 0) {
      operator delete(*v18);
    }
    uint64_t v19 = (void **)(v13 + 14);
    std::__shared_weak_count *v18 = 0;
    v13[12] = 0;
    v13[13] = 0;
    if (*((char *)v13 + 135) < 0) {
      operator delete(*v19);
    }
    uint64_t v20 = (void **)(v13 + 17);
    *uint64_t v19 = 0;
    v13[15] = 0;
    v13[16] = 0;
    if (*((char *)v13 + 159) < 0) {
      operator delete(*v20);
    }
    *uint64_t v20 = 0;
    v13[18] = 0;
    v13[19] = 0;
    int v21 = sub_1D0E66034((uint64_t **)(a1 + 264), (const void **)&__src, (uint64_t)&__src);
    uint64_t v22 = v21[8];
    if (v22 == v21[7] || (BOOL v23 = (void *)*(v22 - 2), v23[1] != *v23) || v23[4] != v23[3]) {
      operator new();
    }
    char v79 = 0;
    int v77 = &unk_1F26F42D8;
    int v81 = 1;
    unint64_t v24 = (void **)(a1 + 432);
    uint64_t v82 = 0;
    uint64_t v25 = (uint64_t (**)(void))&unk_1F26F43A8;
    BOOL v83 = &v97;
    char v84 = 0;
    char v85 = 1;
    int v86 = 6;
    int v80 = &unk_1F26F43A8;
    int v78 = &v80;
    memset(&v103, 0, sizeof(v103));
    while (1)
    {
      LOBYTE(__p[0]) = 0;
      while (v25[11]() == 1)
      {
        if (LOBYTE(__p[0]) > 0x20u || ((1 << SLOBYTE(__p[0])) & 0x100002600) == 0) {
          break;
        }
        uint64_t v27 = v78;
        if (*((_DWORD *)v78 + 2) != 2)
        {
          uint64_t v28 = (*((uint64_t (**)(void **, void **, uint64_t))*v78 + 18))(v78, __p, 1);
          if (v28 >= 1) {
            v27[2] = (char *)v27[2] + v28;
          }
        }
        uint64_t v25 = (uint64_t (**)(void))*v78;
      }
      LOBYTE(v73[0]) = 0;
      if ((*((uint64_t (**)(void **, void *, uint64_t))*v78 + 11))(v78, v73, 1) != 1
        || LOBYTE(v73[0]) != 35)
      {
        break;
      }
      (*((void (**)(void **__return_ptr))*v78 + 9))(__p);
      if (v102 >= 0) {
        uint64_t v29 = __p;
      }
      else {
        uint64_t v29 = (void **)__p[0];
      }
      if (v102 >= 0) {
        std::string::size_type v30 = HIBYTE(v102);
      }
      else {
        std::string::size_type v30 = (std::string::size_type)__p[1];
      }
      std::string::append(&v103, (const std::string::value_type *)v29, v30);
      if (SHIBYTE(v102) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v25 = (uint64_t (**)(void))*v78;
    }
    int v72 = (void *)a1;
    if (*(char *)(a1 + 455) < 0) {
      operator delete(*v24);
    }
    *(_OWORD *)unint64_t v24 = *(_OWORD *)&v103.__r_.__value_.__l.__data_;
    *(void *)(a1 + 448) = *((void *)&v103.__r_.__value_.__l + 2);
    if (v85 && ((*((uint64_t (**)(void **))*v78 + 4))(v78) & 1) == 0)
    {
      v75[1] = 0;
      v75[0] = 0;
      uint64_t v76 = 0;
      char v85 = (*((uint64_t (**)(void **))*v78 + 4))(v78) ^ 1;
      (*((void (**)(void **__return_ptr))*v78 + 9))(__p);
      if (SHIBYTE(v76) < 0) {
        operator delete(v75[0]);
      }
      *(_OWORD *)int v75 = *(_OWORD *)__p;
      uint64_t v76 = v102;
      v73[1] = 0;
      char v74 = 0;
      v73[0] = &unk_1F26F42D8;
      operator new();
    }
    int v31 = *(char **)(a1 + 216);
    int v32 = *(char **)(a1 + 224);
    for (uint64_t i = v32 - v31; v32 != v31; uint64_t i = v32 - v31)
    {
      uint64_t v34 = i >> 4;
      if (i >> 4 >= (unint64_t)((uint64_t)(v72[22] - v72[21]) >> 4)) {
        break;
      }
      unint64_t v35 = v72[29];
      if ((unint64_t)v32 < v35)
      {
        *(void *)int v32 = 0;
        *((void *)v32 + 1) = 0;
        v32 += 16;
      }
      else
      {
        unint64_t v36 = v34 + 1;
        if ((unint64_t)(v34 + 1) >> 60) {
LABEL_132:
        }
          abort();
        uint64_t v37 = v35 - (void)v31;
        if (v37 >> 3 > v36) {
          unint64_t v36 = v37 >> 3;
        }
        unint64_t v38 = (unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v36;
        if (v38)
        {
          if (v38 >> 60) {
LABEL_133:
          }
            sub_1D0DE8CE0();
          int v39 = (char *)operator new(16 * v38);
        }
        else
        {
          int v39 = 0;
        }
        int v40 = &v39[16 * v34];
        *(void *)int v40 = 0;
        *((void *)v40 + 1) = 0;
        int v41 = v40;
        if (v32 != v31)
        {
          do
          {
            *((_OWORD *)v41 - 1) = *((_OWORD *)v32 - 1);
            v41 -= 16;
            v32 -= 16;
          }
          while (v32 != v31);
          int v31 = (char *)*v71;
        }
        int v32 = v40 + 16;
        v72[27] = v41;
        v72[28] = v40 + 16;
        v72[29] = &v39[16 * v38];
        if (v31) {
          operator delete(v31);
        }
      }
      v72[28] = v32;
      int v31 = (char *)v72[27];
    }
    int v42 = (unsigned char *)v72[18];
    int v43 = (char *)v72[19];
    unint64_t v44 = 0xAAAAAAAAAAAAAAABLL * ((v43 - v42) >> 2);
    if (v43 == v42)
    {
LABEL_94:
      int v46 = 1;
    }
    else
    {
      while (1)
      {
        unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v72[13] - v72[12]) >> 2);
        _CF = v44 >= v45;
        int v46 = v44 < v45;
        if (_CF) {
          break;
        }
        unint64_t v47 = v72[20];
        if ((unint64_t)v43 < v47)
        {
          *(void *)int v43 = 0;
          *((_DWORD *)v43 + 2) = 0;
          v43 += 12;
        }
        else
        {
          if (v44 > 0x1555555555555554) {
            goto LABEL_132;
          }
          unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v47 - (void)v42) >> 2);
          if (2 * v48 <= v44 + 1) {
            uint64_t v49 = v44 + 1;
          }
          else {
            uint64_t v49 = 2 * v48;
          }
          if (v48 >= 0xAAAAAAAAAAAAAAALL) {
            unint64_t v50 = 0x1555555555555555;
          }
          else {
            unint64_t v50 = v49;
          }
          if (v50 > 0x1555555555555555) {
            goto LABEL_133;
          }
          uint64_t v51 = 12 * v50;
          int v52 = (char *)operator new(12 * v50);
          float v53 = &v52[12 * v44];
          *(void *)float v53 = 0;
          *((_DWORD *)v53 + 2) = 0;
          for (j = v53; v43 != v42; *((_DWORD *)j + 2) = v56)
          {
            uint64_t v55 = *(void *)(v43 - 12);
            v43 -= 12;
            int v56 = *((_DWORD *)v43 + 2);
            *(void *)(j - 12) = v55;
            j -= 12;
          }
          int v43 = v53 + 12;
          v72[18] = j;
          v72[19] = v53 + 12;
          v72[20] = &v52[v51];
          if (v42) {
            operator delete(v42);
          }
        }
        v72[19] = v43;
        int v42 = (unsigned char *)v72[18];
        unint64_t v44 = 0xAAAAAAAAAAAAAAABLL * ((v43 - v42) >> 2);
        if (v43 == v42) {
          goto LABEL_94;
        }
      }
    }
    uint64_t v57 = (uint64_t)(v72[22] - v72[21]) >> 4;
    BOOL v58 = v72[25] == v72[24] || v57 == (uint64_t)(v72[25] - v72[24]) >> 4;
    if (v58 && ((uint64_t v59 = v72[28] - v72[27]) == 0 || v57 == v59 >> 4))
    {
      char v11 = 0;
      uint64_t v62 = v72[16] - v72[15];
      unint64_t v63 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v72[13] - v72[12]) >> 2);
      if (v62) {
        BOOL v64 = v63 == 0xAAAAAAAAAAAAAAABLL * (v62 >> 2);
      }
      else {
        BOOL v64 = 1;
      }
      int v65 = v64;
      if (((v63 != v44) & ~v46) == 0 && v65)
      {
        v72[52] = v72[51];
        uint64_t v67 = v72[42];
        uint64_t v66 = v72[43];
        if (v66 != v67)
        {
          uint64_t v68 = v72[43];
          do
          {
            int v70 = *(void **)(v68 - 24);
            v68 -= 24;
            int v69 = v70;
            if (v70)
            {
              *(void *)(v66 - 16) = v69;
              operator delete(v69);
            }
            uint64_t v66 = v68;
          }
          while (v68 != v67);
        }
        v72[43] = v67;
        char v11 = 1;
      }
    }
    else
    {
      char v11 = 0;
    }
    int v77 = &unk_1F26F42D8;
    int v80 = &unk_1F26F43A8;
    if (v84)
    {
      if (v83)
      {
        int v60 = sub_1D0E76720(v83);
        MEMORY[0x1D25F16B0](v60, 0x20C4093837F09);
      }
      BOOL v83 = 0;
    }
    int v77 = &unk_1F26F4208;
    if (v79 && v78) {
      (*((void (**)(void **))*v78 + 1))(v78);
    }
    if (v88 < 0)
    {
      operator delete(__src);
      if ((SHIBYTE(v96) & 0x80000000) == 0) {
        goto LABEL_112;
      }
    }
    else if ((SHIBYTE(v96) & 0x80000000) == 0)
    {
      goto LABEL_112;
    }
    operator delete(v95[0]);
LABEL_112:
    sub_1D0E76720(&v97);
    uint64_t v12 = v100;
    if (!v100) {
      return v11 & 1;
    }
    goto LABEL_113;
  }
  sub_1D0E5C8F8(__p);
  if (*(char *)(a3 + 23) >= 0) {
    LOBYTE(v9) = a3;
  }
  else {
    int v9 = *(const void **)a3;
  }
  sub_1D0E5E098((uint64_t)v98, __p, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/geometry/src/three_d/quad_mesh.cpp", 1230, "could not open file %s", (char)v9);
  sub_1D0E6054C((uint64_t)v98);
  uint64_t v10 = (std::__shared_weak_count *)__p[1];
  if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  char v11 = 0;
  uint64_t v12 = v100;
  if (v100)
  {
LABEL_113:
    if (!atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v11 & 1;
}

void sub_1D0E6C530(char **a1, unint64_t a2)
{
  int v5 = a1[1];
  int v4 = a1[2];
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - v5) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v12 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(a1[1], v12);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    uint64_t v6 = *a1;
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    unint64_t v8 = v7 + a2;
    if (v7 + a2 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((v4 - v6) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 > 0xAAAAAAAAAAAAAAALL) {
        sub_1D0DE8CE0();
      }
      char v11 = (char *)operator new(24 * v10);
    }
    else
    {
      char v11 = 0;
    }
    BOOL v13 = &v11[24 * v7];
    unint64_t v14 = &v11[24 * v10];
    size_t v15 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v13, v15);
    uint64_t v16 = &v13[v15];
    if (v5 != v6)
    {
      do
      {
        long long v17 = *(_OWORD *)(v5 - 24);
        *((void *)v13 - 1) = *((void *)v5 - 1);
        *(_OWORD *)(v13 - 24) = v17;
        v13 -= 24;
        v5 -= 24;
      }
      while (v5 != v6);
      int v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v14;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

BOOL sub_1D0E6C6DC(uint64_t a1, uint64_t *a2)
{
  BOOL result = 0;
  unsigned int v14 = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v4 + 8) != 2)
  {
    uint64_t v6 = (*(uint64_t (**)(void, unsigned int *, uint64_t))(*(void *)v4 + 144))(*(void *)(a1 + 8), &v14, 4);
    if (v6 >= 1 && (*(void *)(v4 + 16) += v6, v6 == 4))
    {
      uint64_t v7 = v14;
      uint64_t v8 = *a2;
      unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 2);
      BOOL v10 = v14 >= v9;
      unint64_t v11 = v14 - v9;
      if (v11 != 0 && v10)
      {
        sub_1D0E52CFC((uint64_t)a2, v11);
        uint64_t v8 = *a2;
      }
      else if (!v10)
      {
        a2[1] = v8 + 12 * v14;
      }
      uint64_t v12 = *(void *)(a1 + 8);
      if (*(_DWORD *)(v12 + 8) == 2)
      {
        uint64_t v13 = -1;
      }
      else
      {
        uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v12 + 144))(v12, v8, 12 * v7);
        if (v13 >= 1) {
          *(void *)(v12 + 16) += v13;
        }
      }
      return v13 == 12 * v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL sub_1D0E6C82C(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  unsigned int v14 = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v4 + 8) != 2)
  {
    uint64_t v6 = (*(uint64_t (**)(void, unsigned int *, uint64_t))(*(void *)v4 + 144))(*(void *)(a1 + 8), &v14, 4);
    if (v6 >= 1 && (*(void *)(v4 + 16) += v6, v6 == 4))
    {
      uint64_t v7 = v14;
      uint64_t v8 = *(char **)a2;
      unint64_t v9 = (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 4;
      BOOL v10 = v14 >= v9;
      unint64_t v11 = v14 - v9;
      if (v11 != 0 && v10)
      {
        sub_1D0E52BC4((char **)a2, v11);
        uint64_t v8 = *(char **)a2;
      }
      else if (!v10)
      {
        *(void *)(a2 + 8) = &v8[16 * v14];
      }
      uint64_t v12 = *(void *)(a1 + 8);
      if (*(_DWORD *)(v12 + 8) == 2)
      {
        uint64_t v13 = -1;
      }
      else
      {
        uint64_t v13 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)v12 + 144))(v12, v8, 16 * v7);
        if (v13 >= 1) {
          *(void *)(v12 + 16) += v13;
        }
      }
      return v13 == 16 * v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t **sub_1D0E6C968(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t v6 = a1 + 1;
  int v5 = a1[1];
  if (v5)
  {
    int v7 = *((char *)a2 + 23);
    if (v7 >= 0) {
      uint64_t v8 = a2;
    }
    else {
      uint64_t v8 = *a2;
    }
    if (v7 >= 0) {
      size_t v9 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v9 = (size_t)a2[1];
    }
    while (1)
    {
      BOOL v10 = (uint64_t **)v5;
      uint64_t v13 = (const void *)v5[4];
      unint64_t v11 = v5 + 4;
      uint64_t v12 = v13;
      int v14 = *((char *)v11 + 23);
      if (v14 >= 0) {
        size_t v15 = v11;
      }
      else {
        size_t v15 = v12;
      }
      if (v14 >= 0) {
        size_t v16 = *((unsigned __int8 *)v11 + 23);
      }
      else {
        size_t v16 = v11[1];
      }
      if (v16 >= v9) {
        size_t v17 = v9;
      }
      else {
        size_t v17 = v16;
      }
      int v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0) {
          goto LABEL_8;
        }
LABEL_22:
        int v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0) {
            return v10;
          }
        }
        else if (v16 >= v9)
        {
          return v10;
        }
        int v5 = v10[1];
        if (!v5)
        {
          uint64_t v6 = v10 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v9 >= v16) {
          goto LABEL_22;
        }
LABEL_8:
        int v5 = *v10;
        uint64_t v6 = v10;
        if (!*v10) {
          goto LABEL_29;
        }
      }
    }
  }
  BOOL v10 = a1 + 1;
LABEL_29:
  uint64_t v20 = (char *)operator new(0xA0uLL);
  int v21 = v20 + 32;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_1D0DCB370(v21, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)int v21 = *(_OWORD *)a3;
    *((void *)v20 + 6) = *(void *)(a3 + 16);
  }
  __asm { FMOV            V0.2S, #1.0 }
  *((void *)v20 + 7) = _D0;
  *((_DWORD *)v20 + 16) = 1065353216;
  *(void *)(v20 + 68) = 0;
  *(void *)(v20 + 76) = 0x4270000000000000;
  *(_OWORD *)(v20 + 88) = 0u;
  *(_OWORD *)(v20 + 104) = 0u;
  *(_OWORD *)(v20 + 120) = 0u;
  *(_OWORD *)(v20 + 136) = 0u;
  *((void *)v20 + 19) = 0;
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  *((void *)v20 + 2) = v10;
  char *v6 = (uint64_t *)v20;
  uint64_t v27 = (uint64_t *)**a1;
  uint64_t v28 = (uint64_t *)v20;
  if (v27)
  {
    *a1 = v27;
    uint64_t v28 = *v6;
  }
  sub_1D0DCEC98(a1[1], v28);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v20;
}

uint64_t sub_1D0E6CB08(uint64_t a1)
{
  if ((*(char *)(a1 + 103) & 0x80000000) == 0)
  {
    if ((*(char *)(a1 + 79) & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    operator delete(*(void **)(a1 + 56));
    if ((*(char *)(a1 + 55) & 0x80000000) == 0) {
      return a1;
    }
LABEL_7:
    operator delete(*(void **)(a1 + 32));
    return a1;
  }
  operator delete(*(void **)(a1 + 80));
  if (*(char *)(a1 + 79) < 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (*(char *)(a1 + 55) < 0) {
    goto LABEL_7;
  }
  return a1;
}

unsigned char *sub_1D0E6CB70(void *a1, uint64_t a2)
{
  uint64_t v4 = (char *)operator new(0x78uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)uint64_t v4 = &unk_1F26F5088;
  *(_OWORD *)(v4 + 24) = 0u;
  BOOL result = v4 + 72;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  if (*(char *)(a2 + 23) < 0)
  {
    BOOL result = sub_1D0DCB370(result, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)BOOL result = *(_OWORD *)a2;
    *((void *)v4 + 11) = *(void *)(a2 + 16);
  }
  *((void *)v4 + 12) = 0;
  *((void *)v4 + 13) = 0;
  *((void *)v4 + 14) = 0;
  *a1 = v4 + 24;
  a1[1] = v4;
  return result;
}

BOOL sub_1D0E6CC10(uint64_t a1, uint64_t *a2)
{
  BOOL result = 0;
  unsigned int v14 = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v4 + 8) != 2)
  {
    uint64_t v6 = (*(uint64_t (**)(void, unsigned int *, uint64_t))(*(void *)v4 + 144))(*(void *)(a1 + 8), &v14, 4);
    if (v6 >= 1 && (*(void *)(v4 + 16) += v6, v6 == 4))
    {
      uint64_t v7 = v14;
      uint64_t v8 = *a2;
      unint64_t v9 = (a2[1] - *a2) >> 2;
      BOOL v10 = v14 >= v9;
      unint64_t v11 = v14 - v9;
      if (v11 != 0 && v10)
      {
        sub_1D0E663D8((uint64_t)a2, v11);
        uint64_t v8 = *a2;
      }
      else if (!v10)
      {
        a2[1] = v8 + 4 * v14;
      }
      uint64_t v12 = *(void *)(a1 + 8);
      if (*(_DWORD *)(v12 + 8) == 2)
      {
        uint64_t v13 = -1;
      }
      else
      {
        uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v12 + 144))(v12, v8, 4 * v7);
        if (v13 >= 1) {
          *(void *)(v12 + 16) += v13;
        }
      }
      return v13 == 4 * v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_1D0E6CD4C(uint64_t a1, long long *a2)
{
  int v5 = *(void **)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  if ((unint64_t)v5 >= v4)
  {
    uint64_t v8 = *(void **)a1;
    uint64_t v9 = ((uint64_t)v5 - *(void *)a1) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      abort();
    }
    uint64_t v11 = v4 - (void)v8;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    BOOL v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0;
    unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    if (!v12) {
      unint64_t v13 = v10;
    }
    if (v13 >> 60) {
      sub_1D0DE8CE0();
    }
    uint64_t v14 = 16 * v13;
    size_t v15 = (char *)operator new(16 * v13);
    size_t v16 = &v15[16 * v9];
    long long v17 = *a2;
    *(_OWORD *)size_t v16 = *a2;
    if (*((void *)&v17 + 1))
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
      uint64_t v8 = *(void **)a1;
      int v5 = *(void **)(a1 + 8);
    }
    int v18 = &v15[v14];
    uint64_t v7 = v16 + 16;
    if (v5 == v8)
    {
      *(void *)a1 = v16;
      *(void *)(a1 + 8) = v7;
      *(void *)(a1 + 16) = v18;
    }
    else
    {
      do
      {
        long long v19 = *((_OWORD *)v5 - 1);
        v5 -= 2;
        *((_OWORD *)v16 - 1) = v19;
        v16 -= 16;
        void *v5 = 0;
        v5[1] = 0;
      }
      while (v5 != v8);
      uint64_t v8 = *(void **)a1;
      uint64_t v20 = *(void **)(a1 + 8);
      *(void *)a1 = v16;
      *(void *)(a1 + 8) = v7;
      for (*(void *)(a1 + 16) = v18; v20 != v8; v20 -= 2)
      {
        int v21 = (std::__shared_weak_count *)*(v20 - 1);
        if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
    }
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    uint64_t v6 = *((void *)a2 + 1);
    void *v5 = *(void *)a2;
    v5[1] = v6;
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = v5 + 2;
  }
  *(void *)(a1 + 8) = v7;
}

uint64_t *sub_1D0E6CED0(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t v6 = a1 + 1;
  int v5 = a1[1];
  if (!v5)
  {
    unint64_t v10 = a1 + 1;
    goto LABEL_29;
  }
  int v7 = *((char *)a2 + 23);
  if (v7 >= 0) {
    uint64_t v8 = a2;
  }
  else {
    uint64_t v8 = *a2;
  }
  if (v7 >= 0) {
    uint64_t v9 = (const void *)*((unsigned __int8 *)a2 + 23);
  }
  else {
    uint64_t v9 = a2[1];
  }
  do
  {
    while (1)
    {
      unint64_t v10 = (uint64_t **)v5;
      uint64_t v13 = v5[4];
      uint64_t v11 = v5 + 4;
      BOOL v12 = (void *)v13;
      int v14 = *((char *)v11 + 23);
      size_t v15 = v14 >= 0 ? v11 : v12;
      size_t v16 = v14 >= 0 ? (const void *)*((unsigned __int8 *)v11 + 23) : (const void *)v11[1];
      size_t v17 = (size_t)(v16 >= v9 ? v9 : v16);
      int v18 = memcmp(v8, v15, v17);
      if (v18) {
        break;
      }
      if (v9 >= v16) {
        goto LABEL_22;
      }
LABEL_8:
      int v5 = *v10;
      uint64_t v6 = v10;
      if (!*v10) {
        goto LABEL_29;
      }
    }
    if (v18 < 0) {
      goto LABEL_8;
    }
LABEL_22:
    BOOL result = (uint64_t *)memcmp(v15, v8, v17);
    if (result)
    {
      if ((result & 0x80000000) == 0) {
        return result;
      }
    }
    else if (v16 >= v9)
    {
      return result;
    }
    int v5 = v10[1];
  }
  while (v5);
  uint64_t v6 = v10 + 1;
LABEL_29:
  uint64_t v20 = operator new(0x50uLL);
  v20[2] = *(_OWORD *)a3;
  *((void *)v20 + 6) = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(_OWORD *)((char *)v20 + 56) = *(_OWORD *)(a3 + 24);
  *((void *)v20 + 9) = *(void *)(a3 + 40);
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 40) = 0;
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  *((void *)v20 + 2) = v10;
  char *v6 = (uint64_t *)v20;
  int v21 = (uint64_t *)**a1;
  if (v21)
  {
    *a1 = v21;
    uint64_t v22 = *v6;
  }
  else
  {
    uint64_t v22 = (uint64_t *)v20;
  }
  BOOL result = sub_1D0DCEC98(a1[1], v22);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t sub_1D0E6D034(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    unint64_t v4 = *(void **)(a1 + 24);
    if (v3 != v2)
    {
      do
      {
        int v5 = *(std::__shared_weak_count **)(v3 - 8);
        if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      unint64_t v4 = *(void **)(a1 + 24);
    }
    *(void *)(a1 + 32) = v2;
    operator delete(v4);
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char *sub_1D0E6D0F8(char *__dst, long long *a2, long long *a3)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_1D0DCB370(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v5;
  }
  uint64_t v6 = __dst + 24;
  if (*((char *)a3 + 23) < 0)
  {
    sub_1D0DCB370(v6, *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v7 = *a3;
    *((void *)__dst + 5) = *((void *)a3 + 2);
    *(_OWORD *)uint64_t v6 = v7;
  }
  return __dst;
}

uint64_t sub_1D0E6D174(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
LABEL_5:
    operator delete(*(void **)a1);
    return a1;
  }
  if (*(char *)(a1 + 23) < 0) {
    goto LABEL_5;
  }
  return a1;
}

void sub_1D0E6D1C8(uint64_t a1)
{
  if (*(char *)(a1 + 119) < 0)
  {
    operator delete(*(void **)(a1 + 96));
    if ((*(char *)(a1 + 95) & 0x80000000) == 0)
    {
LABEL_3:
      uint64_t v2 = *(void **)(a1 + 48);
      if (!v2) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(char *)(a1 + 95) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)(a1 + 72));
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
LABEL_4:
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
LABEL_5:
  uint64_t v3 = *(void **)(a1 + 24);
  if (v3)
  {
    *(void *)(a1 + 32) = v3;
    operator delete(v3);
  }
}

void sub_1D0E6D254(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F26F5088;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

void sub_1D0E6D2A8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F26F5088;
  std::__shared_weak_count::~__shared_weak_count(this);
}

char *sub_1D0E6D2C8(char **a1, uint64_t a2)
{
  uint64_t v2 = (a1[1] - *a1) >> 4;
  unint64_t v3 = v2 + 1;
  if ((unint64_t)(v2 + 1) >> 60) {
    abort();
  }
  uint64_t v5 = a1[2] - *a1;
  if (v5 >> 3 > v3) {
    unint64_t v3 = v5 >> 3;
  }
  BOOL v6 = (unint64_t)v5 >= 0x7FFFFFFFFFFFFFF0;
  unint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
  if (!v6) {
    unint64_t v7 = v3;
  }
  if (v7 >> 60) {
    sub_1D0DE8CE0();
  }
  uint64_t v9 = 16 * v7;
  unint64_t v10 = (char *)operator new(16 * v7);
  uint64_t v11 = &v10[16 * v2];
  *(_OWORD *)uint64_t v11 = *(_OWORD *)a2;
  BOOL v12 = v11 + 16;
  uint64_t v13 = &v10[v9];
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  int v14 = *a1;
  size_t v15 = a1[1];
  if (v15 == *a1)
  {
    *a1 = v11;
    a1[1] = v12;
    a1[2] = v13;
  }
  else
  {
    do
    {
      long long v16 = *((_OWORD *)v15 - 1);
      v15 -= 16;
      *((_OWORD *)v11 - 1) = v16;
      v11 -= 16;
      *(void *)size_t v15 = 0;
      *((void *)v15 + 1) = 0;
    }
    while (v15 != v14);
    size_t v15 = *a1;
    size_t v17 = a1[1];
    *a1 = v11;
    a1[1] = v12;
    for (a1[2] = v13; v17 != v15; v17 -= 16)
    {
      int v18 = (std::__shared_weak_count *)*((void *)v17 - 1);
      if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  if (v15) {
    operator delete(v15);
  }
  return v12;
}

BOOL sub_1D0E6D414(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 23);
  if ((v1 & 0x80u) != 0) {
    uint64_t v1 = *(void *)(a1 + 8);
  }
  return v1 == 0;
}

void sub_1D0E6D434(uint64_t a1, int a2)
{
  uint64_t v5 = *(char **)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  BOOL v6 = v5;
  if ((unint64_t)v5 >= v4)
  {
    uint64_t v8 = *(char **)a1;
    uint64_t v9 = (uint64_t)&v5[-*(void *)a1];
    uint64_t v10 = v9 >> 2;
    unint64_t v11 = (v9 >> 2) + 1;
    if (v11 >> 62) {
      abort();
    }
    uint64_t v12 = v4 - (void)v8;
    if (v12 >> 1 > v11) {
      unint64_t v11 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      if (v13 >> 62) {
        sub_1D0DE8CE0();
      }
      int v14 = operator new(4 * v13);
    }
    else
    {
      int v14 = 0;
    }
    size_t v15 = &v14[4 * v10];
    long long v16 = &v14[4 * v13];
    *size_t v15 = a2;
    unint64_t v7 = v15 + 1;
    if (v5 != v8)
    {
      unint64_t v17 = v5 - v8 - 4;
      if (v17 < 0x2C) {
        goto LABEL_27;
      }
      if ((unint64_t)(v5 - v14 - v9) < 0x20) {
        goto LABEL_27;
      }
      uint64_t v18 = (v17 >> 2) + 1;
      BOOL v6 = &v5[-4 * (v18 & 0x7FFFFFFFFFFFFFF8)];
      long long v19 = &v14[4 * v10 - 16];
      uint64_t v20 = v5 - 16;
      uint64_t v21 = v18 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v22 = *(_OWORD *)v20;
        *(v19 - 1) = *((_OWORD *)v20 - 1);
        *long long v19 = v22;
        v19 -= 2;
        v20 -= 32;
        v21 -= 8;
      }
      while (v21);
      v15 -= v18 & 0x7FFFFFFFFFFFFFF8;
      if (v18 != (v18 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_27:
        do
        {
          int v23 = *((_DWORD *)v6 - 1);
          v6 -= 4;
          *--size_t v15 = v23;
        }
        while (v6 != v8);
      }
    }
    *(void *)a1 = v15;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v16;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v5 = a2;
    unint64_t v7 = v5 + 4;
  }
  *(void *)(a1 + 8) = v7;
}

void sub_1D0E6D590(char **a1, _OWORD *a2)
{
  uint64_t v5 = a1[1];
  unint64_t v4 = (unint64_t)a1[2];
  if ((unint64_t)v5 >= v4)
  {
    unint64_t v7 = *a1;
    uint64_t v8 = (v5 - *a1) >> 4;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 60) {
      abort();
    }
    uint64_t v10 = v4 - (void)v7;
    if (v10 >> 3 > v9) {
      unint64_t v9 = v10 >> 3;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      if (v11 >> 60) {
        sub_1D0DE8CE0();
      }
      uint64_t v12 = (char *)operator new(16 * v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    unint64_t v13 = &v12[16 * v8];
    *(_OWORD *)unint64_t v13 = *a2;
    BOOL v6 = v13 + 16;
    if (v5 != v7)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v5 - 1);
        v13 -= 16;
        v5 -= 16;
      }
      while (v5 != v7);
      uint64_t v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v6;
    a1[2] = &v12[16 * v11];
    if (v5) {
      operator delete(v5);
    }
  }
  else
  {
    *(_OWORD *)uint64_t v5 = *a2;
    BOOL v6 = v5 + 16;
  }
  a1[1] = v6;
}

void sub_1D0E6D690(char **a1, uint64_t *a2)
{
  uint64_t v5 = a1[1];
  unint64_t v4 = (unint64_t)a1[2];
  if ((unint64_t)v5 >= v4)
  {
    uint64_t v8 = *a1;
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0x1555555555555555) {
      abort();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - (void)v8) >> 2);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v12 = 0x1555555555555555;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 > 0x1555555555555555) {
        sub_1D0DE8CE0();
      }
      unint64_t v13 = (char *)operator new(12 * v12);
    }
    else
    {
      unint64_t v13 = 0;
    }
    int v14 = &v13[12 * v9];
    *(void *)int v14 = *a2;
    *((_DWORD *)v14 + 2) = *((_DWORD *)a2 + 2);
    unint64_t v7 = v14 + 12;
    if (v5 != v8)
    {
      do
      {
        uint64_t v15 = *(void *)(v5 - 12);
        v5 -= 12;
        int v16 = *((_DWORD *)v5 + 2);
        *(void *)(v14 - 12) = v15;
        v14 -= 12;
        *((_DWORD *)v14 + 2) = v16;
      }
      while (v5 != v8);
      uint64_t v5 = *a1;
    }
    *a1 = v14;
    a1[1] = v7;
    a1[2] = &v13[12 * v12];
    if (v5) {
      operator delete(v5);
    }
  }
  else
  {
    uint64_t v6 = *a2;
    *((_DWORD *)v5 + 2) = *((_DWORD *)a2 + 2);
    *(void *)uint64_t v5 = v6;
    unint64_t v7 = v5 + 12;
  }
  a1[1] = v7;
}

void sub_1D0E6D7C0(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4208;
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
    *(void *)(a1 + 8) = 0;
  }
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E6D858(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4208;
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

uint64_t *sub_1D0E6D8D0(uint64_t *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  a1[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *(unsigned int *)(*a2 + 92);
  size_t v6 = (4 * v5 + 31) & 0x7FFFFFFE0;
  a1[2] = 0;
  a1[3] = v6 >> 2;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
  unint64_t v7 = memptr;
  a1[2] = (uint64_t)memptr;
  *((_DWORD *)a1 + 8) = v5;
  if (v5) {
    bzero(v7, 4 * v5);
  }
  uint64_t v8 = *(unsigned int *)(*a2 + 40);
  unint64_t v9 = *(char **)(*a2 + 24);
  size_t v10 = (4 * v8 + 31) & 0x7FFFFFFE0;
  a1[5] = 0;
  a1[6] = v10 >> 2;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, v10, 0x49090899uLL);
  unint64_t v11 = (char *)memptr;
  a1[5] = (uint64_t)memptr;
  *((_DWORD *)a1 + 14) = v8;
  if (v9 == v11)
  {
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 0x20uLL, v10, 0x49090899uLL);
    long long v19 = (char *)memptr;
    if (v8)
    {
      unint64_t v20 = (v8 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      if (v20 < 7)
      {
        uint64_t v21 = (char *)memptr;
      }
      else
      {
        uint64_t v21 = (char *)memptr;
        if ((unint64_t)((unsigned char *)memptr - v9) >= 0x20)
        {
          uint64_t v22 = (v20 + 1) & 0x7FFFFFFFFFFFFFF8;
          int v23 = (char *)memptr + 16;
          unint64_t v24 = (long long *)(v9 + 16);
          uint64_t v25 = v22;
          do
          {
            long long v26 = *v24;
            *(v23 - 1) = *(v24 - 1);
            *int v23 = v26;
            v23 += 2;
            v24 += 2;
            v25 -= 8;
          }
          while (v25);
          if (v20 + 1 == v22) {
            goto LABEL_26;
          }
          uint64_t v21 = &v19[4 * v22];
          v9 += 4 * v22;
        }
      }
      do
      {
        int v29 = *(_DWORD *)v9;
        v9 += 4;
        *(_DWORD *)uint64_t v21 = v29;
        v21 += 4;
      }
      while (v21 != &v19[4 * v8]);
    }
LABEL_26:
    std::string::size_type v30 = (void *)a1[5];
    a1[5] = (uint64_t)v19;
    a1[6] = v10 >> 2;
    *((_DWORD *)a1 + 14) = v8;
    free(v30);
    goto LABEL_27;
  }
  if (!v8) {
    goto LABEL_27;
  }
  unint64_t v12 = (v8 - 1) & 0x3FFFFFFFFFFFFFFFLL;
  if (v12 < 7)
  {
    unint64_t v13 = v11;
LABEL_21:
    uint64_t v27 = &v11[4 * v8];
    do
    {
      int v28 = *(_DWORD *)v9;
      v9 += 4;
      *(_DWORD *)unint64_t v13 = v28;
      v13 += 4;
    }
    while (v13 != v27);
    goto LABEL_27;
  }
  unint64_t v13 = v11;
  if ((unint64_t)(v11 - v9) < 0x20) {
    goto LABEL_21;
  }
  uint64_t v14 = (v12 + 1) & 0x7FFFFFFFFFFFFFF8;
  uint64_t v15 = v11 + 16;
  int v16 = (long long *)(v9 + 16);
  uint64_t v17 = v14;
  do
  {
    long long v18 = *v16;
    *(v15 - 1) = *(v16 - 1);
    *uint64_t v15 = v18;
    v15 += 2;
    v16 += 2;
    v17 -= 8;
  }
  while (v17);
  if (v12 + 1 != v14)
  {
    unint64_t v13 = &v11[4 * v14];
    v9 += 4 * v14;
    goto LABEL_21;
  }
LABEL_27:
  uint64_t v31 = *(unsigned int *)(*a2 + 40);
  int v32 = *(_DWORD *)(*a2 + 44) - 1;
  BOOL v33 = *(char **)(*a2 + 24);
  uint64_t v34 = (int *)&v33[4 * v31];
  uint64_t v35 = (v32 * v31);
  size_t v36 = (4 * v35 + 31) & 0x7FFFFFFE0;
  a1[8] = 0;
  a1[9] = v36 >> 2;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, v36, 0x49090899uLL);
  uint64_t v37 = (char *)memptr;
  a1[8] = (uint64_t)memptr;
  *((_DWORD *)a1 + 20) = v31;
  *((_DWORD *)a1 + 21) = v32;
  if (v33 == v37)
  {
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 0x20uLL, v36, 0x49090899uLL);
    int v40 = (char *)memptr;
    if (v35)
    {
      unint64_t v41 = (v35 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      if (v41 >= 7)
      {
        int v42 = (char *)memptr;
        if ((unint64_t)((unsigned char *)memptr - v33 - 4 * v31) >= 0x20)
        {
          unint64_t v51 = v41 + 1;
          uint64_t v52 = 4 * (v51 & 0x7FFFFFFFFFFFFFF8);
          int v42 = (char *)memptr + v52;
          float v53 = (long long *)&v33[4 * v31 + 16];
          int v54 = (char *)memptr + 16;
          uint64_t v55 = v51 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v56 = *v53;
            *(v54 - 1) = *(v53 - 1);
            *int v54 = v56;
            v53 += 2;
            v54 += 2;
            v55 -= 8;
          }
          while (v55);
          if (v51 == (v51 & 0x7FFFFFFFFFFFFFF8)) {
            goto LABEL_48;
          }
          uint64_t v34 = (int *)((char *)v34 + v52);
        }
      }
      else
      {
        int v42 = (char *)memptr;
      }
      do
      {
        int v57 = *v34++;
        *(_DWORD *)int v42 = v57;
        v42 += 4;
      }
      while (v42 != &v40[4 * v35]);
    }
LABEL_48:
    BOOL v58 = (void *)a1[8];
    a1[8] = (uint64_t)v40;
    a1[9] = v36 >> 2;
    *((_DWORD *)a1 + 20) = v31;
    *((_DWORD *)a1 + 21) = v32;
    free(v58);
    goto LABEL_49;
  }
  if (!v35) {
    goto LABEL_49;
  }
  unint64_t v38 = (v35 - 1) & 0x3FFFFFFFFFFFFFFFLL;
  if (v38 < 7)
  {
    int v39 = v37;
    goto LABEL_39;
  }
  int v39 = v37;
  if ((unint64_t)(v37 - v33 - 4 * v31) < 0x20)
  {
LABEL_39:
    uint64_t v49 = &v37[4 * v35];
    do
    {
      int v50 = *v34++;
      *(_DWORD *)int v39 = v50;
      v39 += 4;
    }
    while (v39 != v49);
    goto LABEL_49;
  }
  unint64_t v43 = v38 + 1;
  uint64_t v44 = 4 * (v43 & 0x7FFFFFFFFFFFFFF8);
  int v39 = &v37[v44];
  unint64_t v45 = (long long *)&v33[4 * v31 + 16];
  int v46 = v37 + 16;
  uint64_t v47 = v43 & 0x7FFFFFFFFFFFFFF8;
  do
  {
    long long v48 = *v45;
    *(v46 - 1) = *(v45 - 1);
    _OWORD *v46 = v48;
    v45 += 2;
    v46 += 2;
    v47 -= 8;
  }
  while (v47);
  if (v43 != (v43 & 0x7FFFFFFFFFFFFFF8))
  {
    uint64_t v34 = (int *)((char *)v34 + v44);
    goto LABEL_39;
  }
LABEL_49:
  *((unsigned char *)a1 + 88) = 0;
  uint64_t v59 = a1 + 11;
  *((unsigned char *)a1 + 136) = 0;
  uint64_t v60 = *a1;
  if (*(unsigned char *)(*a1 + 240))
  {
    *(_OWORD *)(a1 + 13) = 0u;
    *(_OWORD *)(a1 + 15) = 0u;
    *uint64_t v59 = 0u;
    *((unsigned char *)a1 + 136) = 1;
    uint64_t v61 = *(unsigned int *)(v60 + 184);
    if (v61) {
      memmove(v59, *(const void **)(v60 + 168), 4 * v61);
    }
  }
  return a1;
}

void sub_1D0E6DCF8(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a1;
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a1 + 2;
  if (a1 + 2 == (uint64_t *)a2)
  {
    unsigned int v9 = *((_DWORD *)a1 + 8);
  }
  else
  {
    unint64_t v5 = *(unsigned int *)(a2 + 16);
    if (v5)
    {
      size_t v6 = (void *)a1[2];
      size_t v7 = 4 * v5;
      if (v2[3] < v5)
      {
        free(v6);
        size_t v8 = (v7 + 31) & 0x7FFFFFFE0;
        v2[2] = 0;
        v2[3] = v8 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v8, 0x49090899uLL);
        size_t v6 = memptr;
        v2[2] = (uint64_t)memptr;
      }
      memcpy(v6, *(const void **)a2, v7);
    }
    else
    {
      free((void *)*v3);
      uint64_t *v3 = 0;
      v3[1] = 0;
    }
    unsigned int v9 = *(_DWORD *)(a2 + 16);
    *((_DWORD *)v2 + 8) = v9;
  }
  uint64_t v10 = *v2;
  uint64_t v11 = *(unsigned int *)(*v2 + 88);
  size_t v12 = *(void *)(*v2 + 72);
  unint64_t v158 = __PAIR64__(v9, v11);
  size_t v159 = v12;
  uint64_t v160 = v11;
  size_t v13 = (4 * v11 + 31) & 0x7FFFFFFE0;
  size_t v156 = v13 >> 2;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, v13, 0x49090899uLL);
  v155 = (char *)memptr;
  LODWORD(v157) = v11;
  int v162 = (void **)&v158;
  v163 = (int *)v3;
  v135 = v3;
  int v164 = 1065353216;
  sub_1D0E3D2F4((uint64_t)&v155, (uint64_t)&memptr);
  uint64_t v15 = (void **)(v2 + 5);
  uint64_t v14 = (int *)v2[5];
  int v16 = **(_DWORD **)(v10 + 96);
  uint64_t v17 = *(void *)(v10 + 48);
  LODWORD(v151) = *(_DWORD *)(v10 + 64);
  HIDWORD(v151) = v16;
  uint64_t v152 = v17;
  int v153 = (int)v151;
  unsigned int v154 = 0;
  unint64_t v18 = *(unsigned int *)(v10 + 40);
  uint64_t v142 = v10;
  long long v19 = *(int **)(v10 + 24);
  if (v18 != *((_DWORD *)v2 + 14))
  {
    if (v19 != v14)
    {
      *((_DWORD *)v2 + 14) = v18;
      if (v18)
      {
        if (v2[6] < v18)
        {
          free(v14);
          size_t v20 = (4 * v18 + 31) & 0x7FFFFFFE0;
          v2[5] = 0;
          v2[6] = v20 >> 2;
          memptr = 0;
          malloc_type_posix_memalign(&memptr, 0x20uLL, v20, 0x49090899uLL);
          uint64_t v14 = (int *)memptr;
          v2[5] = (uint64_t)memptr;
        }
      }
      else
      {
        free(v14);
        uint64_t v14 = 0;
        *uint64_t v15 = 0;
        v2[6] = 0;
      }
      LODWORD(v18) = *((_DWORD *)v2 + 14);
      goto LABEL_24;
    }
    size_t v21 = (4 * v18 + 31) & 0x7FFFFFFE0;
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 0x20uLL, v21, 0x49090899uLL);
    uint64_t v22 = (char *)memptr;
    if (v19 != memptr)
    {
      if (v18)
      {
        unint64_t v23 = (v18 - 1) & 0x3FFFFFFFFFFFFFFFLL;
        if (v23 < 7)
        {
          unint64_t v24 = (char *)memptr;
        }
        else
        {
          unint64_t v24 = (char *)memptr;
          if ((unint64_t)((unsigned char *)memptr - (unsigned char *)v19) >= 0x20)
          {
            uint64_t v25 = 0;
            uint64_t v26 = (v23 + 1) & 0x7FFFFFFFFFFFFFF8;
            uint64_t v27 = v26;
            do
            {
              int v28 = &v22[v25 * 4];
              long long v29 = *(_OWORD *)&v19[v25 + 4];
              *(_OWORD *)int v28 = *(_OWORD *)&v19[v25];
              *((_OWORD *)v28 + 1) = v29;
              v25 += 8;
              v27 -= 8;
            }
            while (v27);
            if (v23 + 1 == v26) {
              goto LABEL_53;
            }
            unint64_t v24 = &v22[4 * v26];
            v19 += v26;
          }
        }
        do
        {
          int v134 = *v19++;
          *(_DWORD *)unint64_t v24 = v134;
          v24 += 4;
        }
        while (v24 != &v22[4 * v18]);
      }
      goto LABEL_53;
    }
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 0x20uLL, v21, 0x49090899uLL);
    uint64_t v22 = (char *)memptr;
    if (v18)
    {
      unint64_t v45 = (v18 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      int v46 = v19;
      uint64_t v47 = (char *)memptr;
      if (v45 >= 7)
      {
        int v46 = v19;
        uint64_t v47 = (char *)memptr;
        if ((unint64_t)((unsigned char *)memptr - (unsigned char *)v19) >= 0x20)
        {
          uint64_t v48 = (v45 + 1) & 0x7FFFFFFFFFFFFFF8;
          int v46 = &v19[v48];
          uint64_t v49 = (char *)memptr + 16;
          int v50 = (long long *)(v19 + 4);
          uint64_t v51 = v48;
          do
          {
            long long v52 = *v50;
            *(v49 - 1) = *(v50 - 1);
            *uint64_t v49 = v52;
            v49 += 2;
            v50 += 2;
            v51 -= 8;
          }
          while (v51);
          if (v45 + 1 == v48) {
            goto LABEL_50;
          }
          uint64_t v47 = &v22[4 * v48];
        }
      }
      do
      {
        int v53 = *v46++;
        *(_DWORD *)uint64_t v47 = v53;
        v47 += 4;
      }
      while (v47 != &v22[4 * v18]);
    }
LABEL_50:
    free(v19);
    goto LABEL_53;
  }
LABEL_24:
  if (v19 == v14)
  {
    size_t v21 = (4 * v18 + 31) & 0x7FFFFFFE0;
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 0x20uLL, v21, 0x49090899uLL);
    uint64_t v22 = (char *)memptr;
    if (v18)
    {
      unint64_t v37 = (v18 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      if (v37 < 7)
      {
        unint64_t v38 = (char *)memptr;
      }
      else
      {
        unint64_t v38 = (char *)memptr;
        if ((unint64_t)((unsigned char *)memptr - (unsigned char *)v19) >= 0x20)
        {
          uint64_t v39 = 0;
          uint64_t v40 = (v37 + 1) & 0x7FFFFFFFFFFFFFF8;
          uint64_t v41 = v40;
          do
          {
            int v42 = &v22[v39 * 4];
            long long v43 = *(_OWORD *)&v19[v39 + 4];
            *(_OWORD *)int v42 = *(_OWORD *)&v19[v39];
            *((_OWORD *)v42 + 1) = v43;
            v39 += 8;
            v41 -= 8;
          }
          while (v41);
          if (v37 + 1 == v40) {
            goto LABEL_53;
          }
          unint64_t v38 = &v22[4 * v40];
          v19 += v40;
        }
      }
      do
      {
        int v54 = *v19++;
        *(_DWORD *)unint64_t v38 = v54;
        v38 += 4;
      }
      while (v38 != &v22[4 * v18]);
    }
LABEL_53:
    uint64_t v55 = (void *)v2[5];
    v2[5] = (uint64_t)v22;
    v2[6] = v21 >> 2;
    *((_DWORD *)v2 + 14) = v18;
    free(v55);
    goto LABEL_54;
  }
  if (!v18) {
    goto LABEL_54;
  }
  unint64_t v30 = (v18 - 1) & 0x3FFFFFFFFFFFFFFFLL;
  if (v30 < 7)
  {
    uint64_t v31 = v14;
    do
    {
LABEL_40:
      int v44 = *v19++;
      *v31++ = v44;
    }
    while (v31 != &v14[v18]);
    goto LABEL_54;
  }
  uint64_t v31 = v14;
  if ((unint64_t)((char *)v14 - (char *)v19) < 0x20) {
    goto LABEL_40;
  }
  uint64_t v32 = (v30 + 1) & 0x7FFFFFFFFFFFFFF8;
  BOOL v33 = v14 + 4;
  uint64_t v34 = (long long *)(v19 + 4);
  uint64_t v35 = v32;
  do
  {
    long long v36 = *v34;
    *(v33 - 1) = *(v34 - 1);
    _OWORD *v33 = v36;
    v33 += 2;
    v34 += 2;
    v35 -= 8;
  }
  while (v35);
  if (v30 + 1 != v32)
  {
    uint64_t v31 = &v14[v32];
    v19 += v32;
    goto LABEL_40;
  }
LABEL_54:
  long long v56 = v155;
  int v147 = v16;
  int64_t v148 = v155;
  int v140 = v157;
  int v149 = v157;
  int v150 = 0;
  int v162 = &v151;
  v163 = &v147;
  int v164 = 1065353216;
  if ((void *)(v152 - 4 * v154) == *v15)
  {
    unsigned int v57 = v151;
LABEL_62:
    size_t v59 = (4 * v57 + 31) & 0x7FFFFFFE0;
    size_t v159 = v59 >> 2;
    v144[0] = 0;
    malloc_type_posix_memalign(v144, 0x20uLL, v59, 0x49090899uLL);
    unint64_t v158 = (unint64_t)v144[0];
    LODWORD(v160) = v151;
    sub_1D0E3C230((uint64_t)&v158, (uint64_t)&memptr);
    uint64_t v60 = *((unsigned int *)v2 + 14);
    uint64_t v61 = (void *)v158;
    if (v60)
    {
      unint64_t v62 = v2[5];
      unint64_t v63 = (v60 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      if (v63 >= 0xB)
      {
        if (v62 >= v158 + 4 * v60 || (BOOL v64 = (float *)v158, v65 = (float *)v2[5], v158 >= v62 + 4 * v60))
        {
          uint64_t v66 = (v63 + 1) & 0x7FFFFFFFFFFFFFF8;
          BOOL v64 = (float *)(v158 + 4 * v66);
          uint64_t v67 = (float32x4_t *)(v62 + 16);
          uint64_t v68 = (float32x4_t *)(v158 + 16);
          uint64_t v69 = v66;
          do
          {
            float32x4_t v70 = vaddq_f32(*v68, *v67);
            v67[-1] = vaddq_f32(v68[-1], v67[-1]);
            float32x4_t *v67 = v70;
            v67 += 2;
            v68 += 2;
            v69 -= 8;
          }
          while (v69);
          if (v63 + 1 == v66) {
            goto LABEL_73;
          }
          int v65 = (float *)(v62 + 4 * v66);
        }
      }
      else
      {
        BOOL v64 = (float *)v158;
        int v65 = (float *)v2[5];
      }
      BOOL v71 = (float *)(v62 + 4 * v60);
      do
      {
        float v72 = *v64++;
        *int v65 = v72 + *v65;
        ++v65;
      }
      while (v65 != v71);
    }
LABEL_73:
    free(v61);
    goto LABEL_74;
  }
  unsigned int v57 = v151;
  if (v155 == *v15) {
    goto LABEL_62;
  }
  if (HIDWORD(v151) * v151) {
    BOOL v58 = v16 == 0;
  }
  else {
    BOOL v58 = 1;
  }
  if (!v58) {
    cva::VecLib<float>::gemm();
  }
LABEL_74:
  int v73 = (void **)(v2 + 8);
  uint64_t v74 = (*(_DWORD *)(v142 + 44) - 1);
  unsigned int v75 = 3 * (*(_DWORD *)(v142 + 40) / 3u);
  *((_DWORD *)v2 + 20) = v75;
  *((_DWORD *)v2 + 21) = v74;
  uint64_t v141 = v74;
  unint64_t v76 = v75 * v74;
  if (v76)
  {
    if (v2[9] < v76)
    {
      free((void *)v2[8]);
      size_t v77 = (4 * v76 + 31) & 0x7FFFFFFE0;
      v2[8] = 0;
      v2[9] = v77 >> 2;
      memptr = 0;
      malloc_type_posix_memalign(&memptr, 0x20uLL, v77, 0x49090899uLL);
      v2[8] = (uint64_t)memptr;
    }
  }
  else
  {
    free(*v73);
    *int v73 = 0;
    v2[9] = 0;
  }
  if ((int)v141 >= 1)
  {
    uint64_t v78 = 0;
    int v79 = 1;
    v138 = v56;
    v139 = v2;
    uint64_t v137 = v2 + 8;
    while (1)
    {
      int v83 = v78++;
      int v84 = *(_DWORD *)(*(void *)(v142 + 96) + 4 * v78);
      uint64_t v85 = *(void *)(v142 + 48);
      LODWORD(v158) = *(_DWORD *)(v142 + 64);
      HIDWORD(v158) = v84;
      size_t v159 = v85 + 4 * (v158 * v16);
      LODWORD(v160) = v158;
      HIDWORD(v160) = v158 * v16;
      int v147 = v84;
      int64_t v148 = &v56[4 * v16];
      int v149 = v140;
      int v150 = v16;
      int v143 = v16;
      uint64_t v86 = *(void *)(v142 + 24);
      int v87 = *(_DWORD *)(v142 + 40);
      uint64_t v88 = (v87 * v78);
      uint64_t v89 = (int *)(v86 + 4 * v88);
      uint64_t v90 = *((unsigned int *)v2 + 20);
      uint64_t v91 = (v90 * v83);
      uint64_t v92 = v2[8];
      uint64_t v93 = v92 + 4 * v91;
      if (v86 == v92)
      {
        int v136 = v83;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, (4 * v90 + 31) & 0x7FFFFFFE0, 0x49090899uLL);
        uint64_t v96 = (char *)memptr;
        if (v90)
        {
          unint64_t v97 = (v90 - 1) & 0x3FFFFFFFFFFFFFFFLL;
          unint64_t v98 = v97 + 1;
          if (v97 >= 7)
          {
            uint64_t v99 = (char *)memptr;
            uint64_t v100 = v92 + 4 * v91;
            if ((char *)memptr - v86 + -4 * v88 < (char *)0x20) {
              goto LABEL_101;
            }
            uint64_t v108 = 4 * (v98 & 0x7FFFFFFFFFFFFFF8);
            uint64_t v89 = (int *)((char *)v89 + v108);
            int v109 = (char *)memptr + 16;
            v110 = (long long *)(v86 + 4 * (v87 * v79) + 16);
            uint64_t v111 = v98 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v112 = *v110;
              *(v109 - 1) = *(v110 - 1);
              *int v109 = v112;
              v109 += 2;
              v110 += 2;
              v111 -= 8;
            }
            while (v111);
            if (v98 != (v98 & 0x7FFFFFFFFFFFFFF8))
            {
              uint64_t v99 = &v96[v108];
              goto LABEL_101;
            }
          }
          else
          {
            uint64_t v99 = (char *)memptr;
            uint64_t v100 = v92 + 4 * v91;
            do
            {
LABEL_101:
              int v113 = *v89++;
              *(_DWORD *)uint64_t v99 = v113;
              v99 += 4;
            }
            while (v99 != &v96[4 * v90]);
          }
          if (v97 >= 0xB)
          {
            int v114 = v96;
            v115 = (_DWORD *)v100;
            if ((unint64_t)(v92 + 4 * v91 - (void)v96) < 0x20) {
              goto LABEL_109;
            }
            uint64_t v116 = 4 * (v98 & 0x7FFFFFFFFFFFFFF8);
            int v114 = &v96[v116];
            int v117 = (_OWORD *)(v100 + 16);
            BOOL v118 = (long long *)(v96 + 16);
            uint64_t v119 = v98 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v120 = *v118;
              *(v117 - 1) = *(v118 - 1);
              *int v117 = v120;
              v117 += 2;
              v118 += 2;
              v119 -= 8;
            }
            while (v119);
            if (v98 != (v98 & 0x7FFFFFFFFFFFFFF8))
            {
              uint64_t v100 = v92 + 4 * v91;
              v115 = (_DWORD *)(v100 + v116);
              goto LABEL_109;
            }
          }
          else
          {
            int v114 = v96;
            v115 = (_DWORD *)v100;
            do
            {
LABEL_109:
              int v121 = *(_DWORD *)v114;
              v114 += 4;
              *v115++ = v121;
            }
            while (v115 != (_DWORD *)(v100 + 4 * v90));
          }
        }
        free(v96);
        long long v56 = v138;
        uint64_t v2 = v139;
        LODWORD(v90) = *((_DWORD *)v139 + 20);
        int v80 = v143;
        int v81 = v137;
        int v83 = v136;
        goto LABEL_81;
      }
      if (v90) {
        break;
      }
      long long v56 = v138;
      uint64_t v2 = v139;
      int v80 = v143;
      int v81 = v137;
LABEL_81:
      uint64_t v82 = *v81;
      LODWORD(v144[0]) = v90;
      v144[1] = (void *)(v82 + 4 * (v90 * v83));
      int v145 = v90;
      int v146 = v90 * v83;
      int v162 = (void **)&v158;
      v163 = &v147;
      int v164 = 1065353216;
      sub_1D0E3C074((unsigned int *)v144, (uint64_t)&memptr);
      int v16 = v84 + v80;
      ++v79;
      if (v78 == v141) {
        goto LABEL_111;
      }
    }
    unint64_t v94 = (v90 - 1) & 0x3FFFFFFFFFFFFFFFLL;
    if (v94 >= 0xF)
    {
      unint64_t v101 = v92 + 4 * v91 - (v86 + 4 * v88);
      float v95 = (_DWORD *)(v92 + 4 * v91);
      uint64_t v2 = v139;
      int v81 = v137;
      if (v101 >= 0x20)
      {
        uint64_t v102 = (v94 + 1) & 0x7FFFFFFFFFFFFFF8;
        v89 += v102;
        std::string v103 = (_OWORD *)(v93 + 16);
        uint64_t v104 = (long long *)(v86 + 4 * (v87 * v79) + 16);
        uint64_t v105 = v102;
        do
        {
          long long v106 = *v104;
          *(v103 - 1) = *(v104 - 1);
          _OWORD *v103 = v106;
          v103 += 2;
          v104 += 2;
          v105 -= 8;
        }
        while (v105);
        if (v94 + 1 == v102) {
          goto LABEL_95;
        }
        float v95 = (_DWORD *)(v93 + 4 * v102);
      }
    }
    else
    {
      float v95 = (_DWORD *)(v92 + 4 * v91);
      uint64_t v2 = v139;
      int v81 = v137;
    }
    do
    {
      int v107 = *v89++;
      *v95++ = v107;
    }
    while (v95 != (_DWORD *)(v93 + 4 * v90));
LABEL_95:
    int v80 = v143;
    long long v56 = v138;
    goto LABEL_81;
  }
LABEL_111:
  free(v56);
  uint64_t v122 = *v2;
  if (*(unsigned char *)(*v2 + 240))
  {
    v123 = (float *)(v2 + 11);
    uint64_t v124 = *(unsigned int *)(v122 + 184);
    if (v124) {
      memmove(v2 + 11, *(const void **)(v122 + 168), 4 * v124);
    }
    unsigned int v125 = *((_DWORD *)v2 + 8);
    uint64_t v126 = *(unsigned int *)(v122 + 232);
    int v127 = *(float **)(v122 + 216);
    v155 = (char *)__PAIR64__(v125, v126);
    size_t v156 = (size_t)v127;
    uint64_t v157 = v126;
    int v162 = (void **)&v155;
    v163 = (int *)v135;
    int v164 = 1065353216;
    if (v127 == v123 || (float *)*v135 == v123)
    {
      size_t v128 = (4 * v126 + 31) & 0x7FFFFFFE0;
      size_t v159 = v128 >> 2;
      v151 = 0;
      malloc_type_posix_memalign(&v151, 0x20uLL, v128, 0x49090899uLL);
      unint64_t v158 = (unint64_t)v151;
      LODWORD(v160) = v155;
      sub_1D0E3D2F4((uint64_t)&v158, (uint64_t)&memptr);
      v129 = (float *)(v2 + 17);
      v130 = (void *)v158;
      if ((unint64_t)v123 >= v158 + 48 || (int v131 = (float *)v158, v158 >= (unint64_t)v129))
      {
        int v131 = (float *)(v158 + 32);
        float32x4_t v132 = vaddq_f32(*(float32x4_t *)(v158 + 16), *(float32x4_t *)(v2 + 13));
        *(float32x4_t *)(v2 + 11) = vaddq_f32(*(float32x4_t *)v158, *(float32x4_t *)(v2 + 11));
        *(float32x4_t *)(v2 + 13) = v132;
        v123 = (float *)(v2 + 15);
      }
      do
      {
        float v133 = *v131++;
        float *v123 = v133 + *v123;
        ++v123;
      }
      while (v123 != v129);
      free(v130);
    }
    else if (v125 * v126)
    {
      if (v125) {
        cva::VecLib<float>::gemm();
      }
    }
  }
}

uint64_t *sub_1D0E6E85C(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *BOOL result = *a2;
  *a2 = v2;
  uint64_t v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  uint64_t v4 = result[2];
  uint64_t v5 = result[3];
  result[2] = 0;
  result[3] = 0;
  int v6 = *((_DWORD *)result + 8);
  *((_DWORD *)result + 8) = 0;
  result[2] = a2[2];
  result[3] = a2[3];
  *((_DWORD *)result + 8) = *((_DWORD *)a2 + 8);
  a2[2] = v4;
  a2[3] = v5;
  *((_DWORD *)a2 + 8) = v6;
  uint64_t v7 = result[5];
  uint64_t v8 = result[6];
  result[5] = 0;
  result[6] = 0;
  int v9 = *((_DWORD *)result + 14);
  *((_DWORD *)result + 14) = 0;
  result[5] = a2[5];
  result[6] = a2[6];
  *((_DWORD *)result + 14) = *((_DWORD *)a2 + 14);
  a2[5] = v7;
  a2[6] = v8;
  *((_DWORD *)a2 + 14) = v9;
  uint64_t v10 = result[8];
  uint64_t v11 = result[9];
  uint64_t v12 = result[10];
  result[8] = 0;
  result[9] = 0;
  result[10] = 0;
  result[8] = a2[8];
  result[9] = a2[9];
  result[10] = a2[10];
  a2[8] = v10;
  a2[9] = v11;
  a2[10] = v12;
  size_t v13 = (long long *)(result + 11);
  uint64_t v14 = (long long *)(a2 + 11);
  if ((*((unsigned char *)result + 136) != 0) != (*((unsigned char *)a2 + 136) != 0))
  {
    if (*((unsigned char *)result + 136))
    {
      long long v15 = *v13;
      long long v16 = *(_OWORD *)(result + 15);
      *(_OWORD *)(a2 + 13) = *(_OWORD *)(result + 13);
      *(_OWORD *)(a2 + 15) = v16;
      *uint64_t v14 = v15;
      *((unsigned char *)a2 + 136) = 1;
      if (*((unsigned char *)result + 136)) {
        *((unsigned char *)result + 136) = 0;
      }
    }
    else
    {
      long long v22 = *v14;
      long long v23 = *(_OWORD *)(a2 + 15);
      *(_OWORD *)(result + 13) = *(_OWORD *)(a2 + 13);
      *(_OWORD *)(result + 15) = v23;
      *size_t v13 = v22;
      *((unsigned char *)result + 136) = 1;
      if (*((unsigned char *)a2 + 136)) {
        *((unsigned char *)a2 + 136) = 0;
      }
    }
  }
  else if (*((unsigned char *)result + 136))
  {
    long long v17 = *v13;
    long long v18 = *(_OWORD *)(result + 13);
    long long v19 = *(_OWORD *)(result + 15);
    long long v21 = *(_OWORD *)(a2 + 13);
    long long v20 = *(_OWORD *)(a2 + 15);
    *size_t v13 = *v14;
    *(_OWORD *)(result + 13) = v21;
    *(_OWORD *)(result + 15) = v20;
    *(_OWORD *)(a2 + 13) = v18;
    *(_OWORD *)(a2 + 15) = v19;
    *uint64_t v14 = v17;
  }
  return result;
}

uint64_t sub_1D0E6E9F8(char *__s2, int *a2)
{
  if (!strcmp("failed", __s2))
  {
    int v5 = 0;
  }
  else if (!strcmp("only_rigid_success", __s2))
  {
    int v5 = 1;
  }
  else
  {
    if (strcmp("success", __s2)) {
      return 0;
    }
    int v5 = 2;
  }
  *a2 = v5;
  return 1;
}

uint64_t sub_1D0E6EA7C(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48))
  {
    if (*(unsigned char *)(a1 + 48))
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(void *)(a1 + 4) = *(void *)(a2 + 4);
      *(void *)(a1 + 12) = *(void *)(a2 + 12);
      long long v4 = *(_OWORD *)(a2 + 20);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 20) = v4;
    }
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    *(unsigned char *)(a1 + 48) = 0;
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(void *)(a1 + 4) = *(void *)(a2 + 4);
    *(void *)(a1 + 12) = *(void *)(a2 + 12);
    long long v5 = *(_OWORD *)(a2 + 20);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 20) = v5;
    *(unsigned char *)(a1 + 48) = 1;
  }
  if (*(unsigned __int8 *)(a1 + 104) == *(unsigned __int8 *)(a2 + 104))
  {
    if (*(unsigned char *)(a1 + 104))
    {
      *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
      *(void *)(a1 + 60) = *(void *)(a2 + 60);
      *(void *)(a1 + 68) = *(void *)(a2 + 68);
      long long v6 = *(_OWORD *)(a2 + 76);
      *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
      *(_OWORD *)(a1 + 76) = v6;
    }
  }
  else if (*(unsigned char *)(a1 + 104))
  {
    *(unsigned char *)(a1 + 104) = 0;
  }
  else
  {
    *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
    *(void *)(a1 + 60) = *(void *)(a2 + 60);
    *(void *)(a1 + 68) = *(void *)(a2 + 68);
    long long v7 = *(_OWORD *)(a2 + 76);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 76) = v7;
    *(unsigned char *)(a1 + 104) = 1;
  }
  uint64_t v8 = (uint64_t *)(a1 + 112);
  int v9 = (uint64_t *)(a2 + 112);
  if (*(unsigned __int8 *)(a1 + 120) == *(unsigned __int8 *)(a2 + 120))
  {
    if (*(unsigned char *)(a1 + 120)) {
      sub_1D0E62E50(v8, *v9);
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 120)) {
      sub_1D0E624FC();
    }
    sub_1D0E638FC(v8);
    *(unsigned char *)(a1 + 120) = 0;
  }
  if (*(unsigned __int8 *)(a1 + 152) == *(unsigned __int8 *)(a2 + 152))
  {
    if (*(unsigned char *)(a1 + 152))
    {
      uint64_t v10 = *(void *)(a1 + 128);
      uint64_t v11 = *(void *)(a1 + 136);
      uint64_t v12 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = v12;
      *(void *)(a2 + 128) = v10;
      *(void *)(a2 + 136) = v11;
      *(_DWORD *)(a1 + 144) = *(_DWORD *)(a2 + 144);
      *(_DWORD *)(a2 + 144) = 0;
    }
  }
  else if (*(unsigned char *)(a1 + 152))
  {
    free(*(void **)(a1 + 128));
    *(unsigned char *)(a1 + 152) = 0;
  }
  else
  {
    *(void *)(a1 + 128) = 0;
    *(void *)(a1 + 136) = 0;
    uint64_t v13 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = v13;
    *(void *)(a2 + 128) = 0;
    *(void *)(a2 + 136) = 0;
    *(_DWORD *)(a1 + 144) = *(_DWORD *)(a2 + 144);
    *(_DWORD *)(a2 + 144) = 0;
    *(unsigned char *)(a1 + 152) = 1;
  }
  long long v14 = *(_OWORD *)(a2 + 160);
  *(void *)(a2 + 160) = 0;
  *(void *)(a2 + 168) = 0;
  long long v15 = *(std::__shared_weak_count **)(a1 + 168);
  *(_OWORD *)(a1 + 160) = v14;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *, uint64_t *))v15->__on_zero_shared)(v15, v9);
    std::__shared_weak_count::__release_weak(v15);
  }
  return a1;
}

uint64_t sub_1D0E6ECA4(cva::DictionaryHandler *a1)
{
  if (cva::DictionaryHandler::hasKey(a1, "rotation")
    && cva::DictionaryHandler::hasKey(a1, "translation"))
  {
    cva::DictionaryHandler::item(&v3, a1, "rotation");
    cva::ItemHandler::getMatrix<float>();
  }
  return 0;
}

uint64_t sub_1D0E6EDF4(uint64_t a1)
{
  v25[39] = *(cva::DictionaryHandler **)MEMORY[0x1E4F143B8];
  cva::DictionaryHandler::readJsonFile();
  uint64_t v2 = v25[0];
  uint64_t v3 = (std::__shared_weak_count *)v25[1];
  if (!v25[0]) {
    goto LABEL_30;
  }
  if ((cva::DictionaryHandler::hasKey(v25[0], "tracking_state") & 1) != 0
    || cva::DictionaryHandler::hasKey(v25[0], "landmarks"))
  {
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 72);
    unint64_t v6 = 0x7E3F1F8FC7E3F1F9 * ((v4 - v5) >> 4);
    if (v4 == v5)
    {
      sub_1D0E4F558((char **)(a1 + 64), 1 - v6);
    }
    else if (v6 >= 2)
    {
      for (i = v5 + 1168; v4 != i; uint64_t v4 = sub_1D0E0DC44(v4 - 1168))
        ;
      *(void *)(a1 + 72) = i;
    }
    if (cva::DictionaryHandler::hasKey(v2, "tracking_state"))
    {
      cva::DictionaryHandler::item((uint64_t *)v25, v2, "tracking_state");
      cva::ItemHandler::getDictionary((uint64_t *)&v21, (cva::ItemHandler *)v25);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v25);
      if (cva::DictionaryHandler::hasKey(v21, "meta")
        && (cva::DictionaryHandler::hasKey(v21, "data") & 1) != 0)
      {
        cva::DictionaryHandler::item((uint64_t *)v25, v21, "meta");
        cva::ItemHandler::getDictionary((uint64_t *)&v19, (cva::ItemHandler *)v25);
        cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v25);
        if (cva::DictionaryHandler::hasKey(v19, "version"))
        {
          cva::DictionaryHandler::item((uint64_t *)v24, v19, "version");
          cva::ItemHandler::getVector<int>();
        }
        sub_1D0E5C8F8(v24);
        sub_1D0E5E098((uint64_t)v25, v24, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/tracking/src/io/framesequencedata.cpp", 971, "failure reading tracking dictionary: missing version", v18);
        sub_1D0E6054C((uint64_t)v25);
        long long v14 = (std::__shared_weak_count *)v24[1];
        if (v24[1] && !atomic_fetch_add((atomic_ullong *volatile)v24[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
        long long v15 = v20;
        if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      else
      {
        sub_1D0E5C8F8(v24);
        sub_1D0E5E098((uint64_t)v25, v24, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/tracking/src/io/framesequencedata.cpp", 962, "failure reading tracking dictionary: missing meta", v18);
        sub_1D0E6054C((uint64_t)v25);
        uint64_t v10 = (std::__shared_weak_count *)v24[1];
        if (v24[1] && !atomic_fetch_add((atomic_ullong *volatile)v24[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      uint64_t v11 = v22;
      if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
      goto LABEL_30;
    }
    sub_1D0E5C8F8(v24);
    uint64_t v8 = "failure reading tracking dictionary: missing tracking_state";
    uint64_t v9 = 954;
    goto LABEL_26;
  }
  if ((cva::DictionaryHandler::hasKey(v25[0], "meta") & 1) == 0)
  {
    sub_1D0E5C8F8(v24);
    uint64_t v8 = "failure reading tracking dictionary: missing meta";
    uint64_t v9 = 1093;
LABEL_26:
    sub_1D0E5E098((uint64_t)v25, v24, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/tracking/src/io/framesequencedata.cpp", v9, v8, v18);
    sub_1D0E6054C((uint64_t)v25);
    uint64_t v12 = (std::__shared_weak_count *)v24[1];
    if (v24[1] && !atomic_fetch_add((atomic_ullong *volatile)v24[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    goto LABEL_30;
  }
  cva::DictionaryHandler::item((uint64_t *)v25, v25[0], "meta");
  cva::ItemHandler::getDictionary((uint64_t *)v24, (cva::ItemHandler *)v25);
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v25);
  if (cva::DictionaryHandler::hasKey(v24[0], "version"))
  {
    cva::DictionaryHandler::item((uint64_t *)__p, v24[0], "version");
    cva::ItemHandler::getVector<int>();
  }
  sub_1D0E5C8F8(__p);
  sub_1D0E5E098((uint64_t)v25, __p, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/tracking/src/io/framesequencedata.cpp", 1100, "failure reading tracking dictionary: missing version", v18);
  sub_1D0E6054C((uint64_t)v25);
  long long v16 = (std::__shared_weak_count *)__p[1];
  if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  long long v17 = (std::__shared_weak_count *)v24[1];
  if (v24[1] && !atomic_fetch_add((atomic_ullong *volatile)v24[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
LABEL_30:
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  return 0;
}

uint64_t sub_1D0E716C8(cva::DictionaryHandler *a1)
{
  if (cva::DictionaryHandler::hasKey(a1, "blendshapes"))
  {
    if (cva::DictionaryHandler::hasKey(a1, "blendshape_names"))
    {
      cva::DictionaryHandler::item((uint64_t *)&memptr, a1, "blendshapes");
      cva::ItemHandler::getVector<float>();
    }
    sub_1D0E5C8F8(&__src);
    sub_1D0E5E098((uint64_t)v8, &__src, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/tracking/src/io/framesequencedata.cpp", 525, "failure reading tracking dictionary: missing blendshape names", v4);
    sub_1D0E6054C((uint64_t)v8);
    uint64_t v2 = v7;
    if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return 0;
}

uint64_t sub_1D0E721B4(cva::DictionaryHandler *a1)
{
  if (cva::DictionaryHandler::hasKey(a1, "face_box"))
  {
    cva::DictionaryHandler::item(v7, a1, "face_box");
    cva::ItemHandler::getDictionary((uint64_t *)&__p, (cva::ItemHandler *)v7);
    uint64_t v3 = (cva::DictionaryHandler *)__p;
    uint64_t v2 = v6;
    std::string __p = 0;
    unint64_t v6 = 0;
    cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v7);
    if (cva::DictionaryHandler::hasKey(v3, "x")
      && cva::DictionaryHandler::hasKey(v3, "y")
      && cva::DictionaryHandler::hasKey(v3, "w")
      && cva::DictionaryHandler::hasKey(v3, "h"))
    {
      cva::DictionaryHandler::item((uint64_t *)&__p, v3, "x");
      cva::ItemHandler::getValue<float>();
    }
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return 0;
}

unint64_t sub_1D0E724A4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v41 = a2;
  if (a3)
  {
    unint64_t v3 = a3;
    uint64_t v4 = a1;
    unint64_t v5 = 0;
    unint64_t v39 = a3;
    uint64_t v40 = a1;
    while (1)
    {
      uint64_t v6 = *(void *)(v4 + 24);
      long long v7 = (std::string *)(v6 + 24);
      int v8 = *(char *)(v6 + 47);
      if ((v8 & 0x80000000) == 0) {
        break;
      }
      unint64_t v16 = *(void *)(v6 + 32);
      if (!(v16 >> 24))
      {
        size_t v17 = 0x1000000 - v16;
        if (v17 >= v3 - v5) {
          size_t v10 = v3 - v5;
        }
        else {
          size_t v10 = v17;
        }
        if (v10)
        {
          uint64_t v11 = (char *)(v41 + v5);
          uint64_t v12 = (char *)(v41 + v5 + v10);
          size_t v9 = *(void *)(v6 + 32);
          unint64_t v18 = *(void *)(v6 + 40);
          unint64_t v14 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - 1;
          unint64_t v15 = *(void *)(v6 + 24);
          unint64_t v13 = HIBYTE(v18);
LABEL_18:
          if (v15 <= (unint64_t)v11 && v15 + v9 + 1 > (unint64_t)v11)
          {
            if (v10 > 0x16)
            {
              uint64_t v26 = (v10 & 0x1FFFFF8) + 8;
              if ((v10 | 7) != 0x17) {
                uint64_t v26 = v10 | 7;
              }
              uint64_t v27 = v26 + 1;
              p_dst = (void **)operator new(v26 + 1);
              size_t v43 = v10;
              int64_t v44 = v27 | 0x8000000000000000;
              __dst = p_dst;
            }
            else
            {
              HIBYTE(v44) = v10;
              p_dst = (void **)&__dst;
            }
            memcpy(p_dst, v11, v10);
            *((unsigned char *)p_dst + v10) = 0;
            if (v44 >= 0) {
              int v28 = (const std::string::value_type *)&__dst;
            }
            else {
              int v28 = (const std::string::value_type *)__dst;
            }
            if (v44 >= 0) {
              std::string::size_type v29 = HIBYTE(v44);
            }
            else {
              std::string::size_type v29 = v43;
            }
            std::string::append(v7, v28, v29);
            if (SHIBYTE(v44) < 0) {
              operator delete(__dst);
            }
            uint64_t v4 = v40;
          }
          else
          {
            if (v14 - v9 >= v10)
            {
              if ((v13 & 0x80) != 0) {
                unint64_t v24 = (unsigned char *)v7->__r_.__value_.__r.__words[0];
              }
              else {
                unint64_t v24 = (unsigned char *)(v6 + 24);
              }
            }
            else
            {
              if (0x7FFFFFFFFFFFFFF7 - v14 < v10 + v9 - v14) {
                abort();
              }
              if (v8 < 0) {
                long long v7 = (std::string *)v7->__r_.__value_.__r.__words[0];
              }
              size_t v20 = 0x7FFFFFFFFFFFFFF7;
              if (v14 <= 0x3FFFFFFFFFFFFFF2)
              {
                unint64_t v21 = 2 * v14;
                if (v10 + v9 > 2 * v14) {
                  unint64_t v21 = v10 + v9;
                }
                uint64_t v22 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v21 | 7) != 0x17) {
                  uint64_t v22 = v21 | 7;
                }
                if (v21 >= 0x17) {
                  size_t v20 = v22 + 1;
                }
                else {
                  size_t v20 = 23;
                }
              }
              long long v23 = operator new(v20);
              unint64_t v24 = v23;
              if (v9) {
                memmove(v23, v7, v9);
              }
              if (v14 != 22) {
                operator delete(v7);
              }
              *(void *)(v6 + 32) = v9;
              *(void *)(v6 + 40) = v20 | 0x8000000000000000;
              *(void *)(v6 + 24) = v24;
              uint64_t v4 = v40;
            }
            unint64_t v30 = &v24[v9];
            if (v10 >= 0x20)
            {
              if ((unint64_t)(&v24[v9] - v11) < 0x20)
              {
                unint64_t v3 = v39;
                goto LABEL_65;
              }
              size_t v31 = v10 & 0x1FFFFE0;
              v30 += v31;
              uint64_t v32 = (long long *)(v11 + 16);
              BOOL v33 = &v24[v9 + 16];
              size_t v34 = v31;
              do
              {
                long long v35 = *v32;
                *(v33 - 1) = *(v32 - 1);
                _OWORD *v33 = v35;
                v32 += 2;
                v33 += 2;
                v34 -= 32;
              }
              while (v34);
              unint64_t v3 = v39;
              if (v10 != v31)
              {
                v11 += v31;
                goto LABEL_65;
              }
            }
            else
            {
              unint64_t v3 = v39;
              do
              {
LABEL_65:
                char v36 = *v11++;
                *v30++ = v36;
              }
              while (v11 != v12);
            }
            unsigned char *v30 = 0;
            size_t v37 = v10 + v9;
            if (*(char *)(v6 + 47) < 0) {
              *(void *)(v6 + 32) = v37;
            }
            else {
              *(unsigned char *)(v6 + 47) = v37 & 0x7F;
            }
          }
        }
LABEL_4:
        v5 += v10;
        goto LABEL_5;
      }
      if (!sub_1D0E727C8(*(std::string **)(v4 + 24))) {
        return v5;
      }
LABEL_5:
      if (v5 >= v3) {
        return v5;
      }
    }
    size_t v9 = *(unsigned __int8 *)(v6 + 47);
    if (0x1000000 - v9 >= v3 - v5) {
      size_t v10 = v3 - v5;
    }
    else {
      size_t v10 = 0x1000000 - *(unsigned __int8 *)(v6 + 47);
    }
    if (v10)
    {
      uint64_t v11 = (char *)(v41 + v5);
      uint64_t v12 = (char *)(v41 + v5 + v10);
      LOBYTE(v13) = *(unsigned char *)(v6 + 47);
      unint64_t v14 = 22;
      unint64_t v15 = v6 + 24;
      goto LABEL_18;
    }
    goto LABEL_4;
  }
  return 0;
}

uint64_t sub_1D0E727C8(std::string *a1)
{
  if ((SHIBYTE(a1[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*((unsigned char *)&a1[1].__r_.__value_.__s + 23)) {
      goto LABEL_3;
    }
    return 1;
  }
  if (!a1[1].__r_.__value_.__l.__size_) {
    return 1;
  }
LABEL_3:
  p_data = (void **)&a1[1].__r_.__value_.__l.__data_;
  uint64_t v3 = *(void *)(a1->__r_.__value_.__r.__words[0] + 16);
  p_size_t size = &a1[2].__r_.__value_.__l.__size_;
  unint64_t v5 = (void *)a1[2].__r_.__value_.__r.__words[2];
  uint64_t v6 = *(v5 - 1);
  if (v3 != v6)
  {
    data = a1[3].__r_.__value_.__l.__data_;
    size_t size = (void *)a1[2].__r_.__value_.__l.__size_;
    if (data == size)
    {
      if (data)
      {
        a1[2].__r_.__value_.__r.__words[2] = (std::string::size_type)data;
        operator delete(data);
        *p_size_t size = 0;
        a1[2].__r_.__value_.__r.__words[2] = 0;
        a1[3].__r_.__value_.__r.__words[0] = 0;
      }
      uint64_t v11 = operator new(0x10uLL);
      a1[2].__r_.__value_.__l.__size_ = (std::string::size_type)v11;
      size_t v9 = v11 + 2;
      a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)(v11 + 2);
      *uint64_t v11 = 0;
      v11[1] = 0;
    }
    else if (v5 == size)
    {
      void *v5 = 0;
      v5[1] = 0;
      size_t v9 = v5 + 2;
    }
    else
    {
      *size_t size = 0;
      size[1] = 0;
      size_t v9 = size + 2;
    }
    a1[2].__r_.__value_.__r.__words[2] = (std::string::size_type)v9;
    a1[3].__r_.__value_.__l.__size_ = 0;
  }
  __p[0] = 0;
  __p[1] = 0;
  int64_t v45 = 0;
  int v12 = HIDWORD(a1[3].__r_.__value_.__r.__words[2]);
  if (v12 == -1)
  {
    sub_1D0E5C8F8(&v46);
    sub_1D0E5E098((uint64_t)&v48, &v46, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/CompressedDevice.cpp", 206, "missing legacy compression!", v42);
    sub_1D0E6054C((uint64_t)&v48);
    unint64_t v14 = v47;
    if (v47 && !atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
LABEL_23:
    LOBYTE(v13) = HIBYTE(v45);
    if ((SHIBYTE(v45) & 0x80000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_26;
  }
  if (v12 || __p == p_data) {
    goto LABEL_23;
  }
  if ((SHIBYTE(a1[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    *(_OWORD *)std::string __p = *(_OWORD *)p_data;
    int64_t v45 = a1[1].__r_.__value_.__r.__words[2];
    LOBYTE(v13) = HIBYTE(v45);
    if (SHIBYTE(v45) < 0) {
      goto LABEL_26;
    }
LABEL_24:
    int64_t v13 = v13;
    goto LABEL_27;
  }
  sub_1D0DF922C(__p, a1[1].__r_.__value_.__l.__data_, a1[1].__r_.__value_.__l.__size_);
  LOBYTE(v13) = HIBYTE(v45);
  if ((SHIBYTE(v45) & 0x80000000) == 0) {
    goto LABEL_24;
  }
LABEL_26:
  int64_t v13 = (int64_t)__p[1];
LABEL_27:
  int64_t v46 = v13;
  if (HIDWORD(a1[3].__r_.__value_.__r.__words[2]) == -1)
  {
    *(void *)&long long v48 = v13;
    uint64_t v43 = v13 + 0x277C6CE4B6031;
    uint64_t v22 = (void *)a1->__r_.__value_.__r.__words[0];
    if (*(_DWORD *)(a1->__r_.__value_.__r.__words[0] + 8) != 1)
    {
      uint64_t v23 = (*(uint64_t (**)(std::string::size_type, uint64_t *, uint64_t))(*v22 + 152))(a1->__r_.__value_.__r.__words[0], &v43, 8);
      if (v23 >= 1)
      {
        v22[2] += v23;
        if (v23 == 8)
        {
          unint64_t v24 = (void *)a1->__r_.__value_.__r.__words[0];
          if (*(_DWORD *)(a1->__r_.__value_.__r.__words[0] + 8) != 1)
          {
            uint64_t v25 = (*(uint64_t (**)(std::string::size_type, long long *, uint64_t))(*v24 + 152))(a1->__r_.__value_.__r.__words[0], &v48, 8);
            if (v25 >= 1)
            {
              v24[2] += v25;
              if (v25 == 8)
              {
                uint64_t v26 = (void *)a1->__r_.__value_.__r.__words[0];
                if (*(_DWORD *)(a1->__r_.__value_.__r.__words[0] + 8) == 1)
                {
                  uint64_t v27 = -1;
                }
                else
                {
                  if (v45 >= 0) {
                    int v28 = __p;
                  }
                  else {
                    int v28 = (void **)__p[0];
                  }
                  uint64_t v27 = (*(uint64_t (**)(std::string::size_type, void **, void))(*v26 + 152))(a1->__r_.__value_.__r.__words[0], v28, v48);
                  if (v27 >= 1) {
                    v26[2] += v27;
                  }
                }
                if (v27 == (void)v48) {
                  goto LABEL_53;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    std::string::size_type v15 = a1->__r_.__value_.__r.__words[0];
    *(void *)&long long v48 = &unk_1F26F4208;
    *((void *)&v48 + 1) = v15;
    char v49 = 0;
    uint64_t v43 = 0x277C6CE4B6030;
    if (*(_DWORD *)(v15 + 8) != 1)
    {
      uint64_t v16 = (*(uint64_t (**)(std::string::size_type, uint64_t *, uint64_t))(*(void *)v15 + 152))(v15, &v43, 8);
      if (v16 > 0)
      {
        *(void *)(v15 + 16) += v16;
        if (v16 == 8)
        {
          LODWORD(v43) = 0;
          uint64_t v17 = *((void *)&v48 + 1);
          if (*(_DWORD *)(*((void *)&v48 + 1) + 8) != 1)
          {
            uint64_t v18 = (*(uint64_t (**)(void, uint64_t *, uint64_t))(**((void **)&v48 + 1) + 152))(*((void *)&v48 + 1), &v43, 4);
            if (v18 > 0)
            {
              *(void *)(v17 + 16) += v18;
              if (v18 == 4)
              {
                LODWORD(v43) = HIDWORD(a1[3].__r_.__value_.__r.__words[2]);
                uint64_t v19 = *((void *)&v48 + 1);
                if (*(_DWORD *)(*((void *)&v48 + 1) + 8) != 1)
                {
                  uint64_t v20 = (*(uint64_t (**)(void, uint64_t *, uint64_t))(**((void **)&v48 + 1) + 152))(*((void *)&v48 + 1), &v43, 4);
                  if (v20 > 0)
                  {
                    *(void *)(v19 + 16) += v20;
                    if (v20 == 4)
                    {
                      uint64_t v21 = SHIBYTE(a1[1].__r_.__value_.__r.__words[2]) < 0
                          ? a1[1].__r_.__value_.__l.__size_
                          : HIBYTE(a1[1].__r_.__value_.__r.__words[2]);
                      uint64_t v43 = v21;
                      uint64_t v30 = *((void *)&v48 + 1);
                      if (*(_DWORD *)(*((void *)&v48 + 1) + 8) != 1)
                      {
                        uint64_t v31 = (*(uint64_t (**)(void, uint64_t *, uint64_t))(**((void **)&v48 + 1) + 152))(*((void *)&v48 + 1), &v43, 8);
                        if (v31 > 0)
                        {
                          *(void *)(v30 + 16) += v31;
                          if (v31 == 8)
                          {
                            uint64_t v32 = *((void *)&v48 + 1);
                            if (*(_DWORD *)(*((void *)&v48 + 1) + 8) != 1)
                            {
                              uint64_t v33 = (*(uint64_t (**)(void, int64_t *, uint64_t))(**((void **)&v48 + 1)
                                                                                                 + 152))(*((void *)&v48 + 1), &v46, 8);
                              if (v33 >= 1)
                              {
                                *(void *)(v32 + 16) += v33;
                                if (v33 == 8)
                                {
                                  uint64_t v34 = *((void *)&v48 + 1);
                                  if (*(_DWORD *)(*((void *)&v48 + 1) + 8) == 1)
                                  {
                                    uint64_t v35 = -1;
                                  }
                                  else
                                  {
                                    if (v45 >= 0) {
                                      unint64_t v39 = __p;
                                    }
                                    else {
                                      unint64_t v39 = (void **)__p[0];
                                    }
                                    uint64_t v40 = (*(uint64_t (**)(void, void **, int64_t))(**((void **)&v48 + 1) + 152))(*((void *)&v48 + 1), v39, v46);
                                    uint64_t v35 = v40;
                                    if (v40 >= 1) {
                                      *(void *)(v34 + 16) += v40;
                                    }
                                  }
                                  int64_t v41 = v46;
                                  sub_1D0E76938((uint64_t)&v48);
                                  if (v35 != v41) {
                                    goto LABEL_68;
                                  }
LABEL_53:
                                  if (v3 == v6)
                                  {
                                    if (SHIBYTE(a1[1].__r_.__value_.__r.__words[2]) < 0) {
                                      std::string::size_type v29 = a1[1].__r_.__value_.__l.__size_;
                                    }
                                    else {
                                      std::string::size_type v29 = HIBYTE(a1[1].__r_.__value_.__r.__words[2]);
                                    }
                                    std::string::size_type v37 = v29 + *(void *)(a1[2].__r_.__value_.__r.__words[2] - 16);
                                    uint64_t v38 = *(void *)(a1->__r_.__value_.__r.__words[0] + 16);
                                    *(void *)&long long v48 = v37;
                                    *((void *)&v48 + 1) = v38;
                                    sub_1D0E6D590((char **)&a1[2].__r_.__value_.__l.__size_, &v48);
                                    ++a1[3].__r_.__value_.__l.__size_;
                                  }
                                  a1[2].__r_.__value_.__r.__words[0] = 0;
                                  std::string::reserve(a1 + 1, 0x1000000uLL);
                                  if (SHIBYTE(a1[1].__r_.__value_.__r.__words[2]) < 0)
                                  {
                                    p_data = (void **)a1[1].__r_.__value_.__l.__data_;
                                    a1[1].__r_.__value_.__l.__size_ = 0;
                                  }
                                  else
                                  {
                                    *((unsigned char *)&a1[1].__r_.__value_.__s + 23) = 0;
                                  }
                                  *(unsigned char *)p_data = 0;
                                  uint64_t v10 = 1;
                                  if (SHIBYTE(v45) < 0) {
                                    goto LABEL_69;
                                  }
                                  return v10;
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
    *(void *)&long long v48 = &unk_1F26F4208;
    if (v49 && *((void *)&v48 + 1)) {
      (*(void (**)(void))(**((void **)&v48 + 1) + 8))(*((void *)&v48 + 1));
    }
  }
LABEL_68:
  uint64_t v10 = 0;
  if (SHIBYTE(v45) < 0) {
LABEL_69:
  }
    operator delete(__p[0]);
  return v10;
}

unint64_t sub_1D0E72E8C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v7 = *(void *)(a1 + 24);
        unint64_t v8 = *(void *)(v7 + 48);
        size_t v9 = (void *)(v7 + 24);
        if (*(char *)(v7 + 47) < 0) {
          break;
        }
        unint64_t v10 = *(unsigned __int8 *)(v7 + 47);
        BOOL v11 = v10 > v8;
        size_t v12 = v10 - v8;
        if (!v11) {
          goto LABEL_3;
        }
        if (v12 >= a3 - v6) {
          size_t v13 = a3 - v6;
        }
        else {
          size_t v13 = v12;
        }
        if (v13) {
          goto LABEL_12;
        }
LABEL_13:
        v6 += v13;
        *(void *)(v7 + 48) = v8 + v13;
        if (v6 >= a3) {
          return v6;
        }
      }
      unint64_t v14 = *(void *)(v7 + 32);
      BOOL v11 = v14 > v8;
      size_t v15 = v14 - v8;
      if (v11)
      {
        if (v15 >= a3 - v6) {
          size_t v13 = a3 - v6;
        }
        else {
          size_t v13 = v15;
        }
        size_t v9 = (void *)*v9;
        if (!v13) {
          goto LABEL_13;
        }
LABEL_12:
        memmove((void *)(a2 + v6), (char *)v9 + v8, v13);
        uint64_t v7 = *(void *)(a1 + 24);
        unint64_t v8 = *(void *)(v7 + 48);
        goto LABEL_13;
      }
LABEL_3:
      if (!sub_1D0E72F6C((void *)v7) || v6 >= a3) {
        return v6;
      }
    }
  }
  return 0;
}

uint64_t sub_1D0E72F6C(void *a1)
{
  if ((*(unsigned int (**)(void))(*(void *)*a1 + 32))(*a1))
  {
    uint64_t v2 = 0;
    *((unsigned char *)a1 + 88) = 1;
    return v2;
  }
  uint64_t v3 = *(void *)(*a1 + 16);
  std::string::size_type v4 = sub_1D0E731EC(a1, (_DWORD *)a1 + 23);
  if (v4 == -1)
  {
    (*(void (**)(void, uint64_t))(*(void *)*a1 + 128))(*a1, v3);
    return 0;
  }
  std::string::size_type v5 = v4;
  memset(&__p, 0, sizeof(__p));
  if (v4) {
    std::string::append(&__p, v4, 0);
  }
  unint64_t v6 = (void *)*a1;
  if (*(_DWORD *)(*a1 + 8) == 2)
  {
    uint64_t v7 = -1;
  }
  else
  {
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    uint64_t v7 = (*(uint64_t (**)(void, std::string *, std::string::size_type))(*v6 + 144))(*a1, p_p, v5);
    if (v7 >= 1) {
      v6[2] += v7;
    }
  }
  if (v7 != v5) {
    goto LABEL_20;
  }
  int v9 = *((_DWORD *)a1 + 23);
  if (v9)
  {
    if (v9 == -1)
    {
      sub_1D0E5C8F8(&v21);
      sub_1D0E5E098((uint64_t)v23, &v21, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/CompressedDevice.cpp", 232, "missing legacy compression!", __p.__r_.__value_.__s.__data_[0]);
      sub_1D0E6054C((uint64_t)v23);
      unint64_t v10 = v22;
      if (v22)
      {
        if (!atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
    }
LABEL_20:
    uint64_t v2 = 0;
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return v2;
    }
LABEL_21:
    operator delete(__p.__r_.__value_.__l.__data_);
    return v2;
  }
  std::string::size_type v12 = a1[5];
  long long v13 = *(_OWORD *)(a1 + 3);
  *((std::string *)a1 + 1) = __p;
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
  __p.__r_.__value_.__r.__words[2] = v12;
  uint64_t v14 = a1[7];
  uint64_t v15 = (a1[8] - v14) >> 4;
  uint64_t v16 = v15 - 1;
  uint64_t v17 = (uint64_t *)(v14 + 24);
  uint64_t v18 = 1;
  while (v15 != v18)
  {
    uint64_t v19 = *v17;
    v17 += 2;
    ++v18;
    if (v19 == *(void *)(*a1 + 16))
    {
      uint64_t v16 = v18 - 2;
      break;
    }
  }
  a1[10] = v16;
  a1[6] = 0;
  uint64_t v2 = 1;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_21;
  }
  return v2;
}

uint64_t sub_1D0E731EC(void *a1, _DWORD *a2)
{
  if ((*(uint64_t (**)(void))(*(void *)*a1 + 32))(*a1)) {
    return -1;
  }
  uint64_t v4 = *a1;
  unint64_t v5 = *(void *)(*a1 + 16);
  unint64_t v6 = *(void *)(a1[8] - 8);
  if (v5 > v6) {
    return -1;
  }
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (*((_DWORD *)a1 + 23) == -1)
  {
    sub_1D0E5C8F8(&v19);
    sub_1D0E5E098((uint64_t)v23, &v19, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/CompressedDevice.cpp", 271, "missing legacy compression!", v18);
    sub_1D0E6054C((uint64_t)v23);
    uint64_t v7 = (std::__shared_weak_count *)*((void *)&v19 + 1);
    if (*((void *)&v19 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v19 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    return -1;
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  *(void *)&long long v19 = &unk_1F26F4208;
  *((void *)&v19 + 1) = v4;
  char v20 = 0;
  if (*(_DWORD *)(v4 + 8) == 2)
  {
    *(void *)&long long v19 = &unk_1F26F4208;
    return -1;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)v4 + 144))(v4, &v22, 8);
  if (v8 < 1) {
    goto LABEL_37;
  }
  *(void *)(v4 + 16) += v8;
  if (v8 != 8 || v22 != 0x277C6CE4B6030) {
    goto LABEL_37;
  }
  if (*(_DWORD *)(*((void *)&v19 + 1) + 8) == 2) {
    goto LABEL_37;
  }
  uint64_t v10 = (*(uint64_t (**)(void, char *, uint64_t))(**((void **)&v19 + 1) + 144))(*((void *)&v19 + 1), (char *)&v21 + 4, 4);
  if (v10 < 1) {
    goto LABEL_37;
  }
  *(void *)(*((void *)&v19 + 1) + 16) += v10;
  BOOL v11 = v10 == 4 && HIDWORD(v21) == 0;
  if (!v11
    || *(_DWORD *)(*((void *)&v19 + 1) + 8) == 2
    || (v12 = (*(uint64_t (**)(void, uint64_t *, uint64_t))(**((void **)&v19 + 1) + 144))(*((void *)&v19 + 1), &v21, 4), v12 < 1)|| (*(void *)(*((void *)&v19 + 1) + 16) += v12, v12 != 4)|| v21|| (v13 = *((_DWORD *)a1 + 23)) != 0 && v13 != -2|| *(_DWORD *)(*((void *)&v19 + 1) + 8) == 2|| (uint64_t v14 = (*(uint64_t (**)(void, uint64_t *, uint64_t))(**((void **)&v19 + 1) + 144))(*((void *)&v19 + 1), &v24, 8), v14 < 1)|| (*(void *)(*((void *)&v19 + 1) + 16) += v14, v14 != 8)|| *(_DWORD *)(*((void *)&v19 + 1) + 8) == 2|| (v15 = (*(uint64_t (**)(void, uint64_t *, uint64_t))(**((void **)&v19 + 1) + 144))(*((void *)&v19 + 1), &v25, 8),
        v15 < 1)
    || (*(void *)(*((void *)&v19 + 1) + 16) += v15, v15 != 8))
  {
LABEL_37:
    *(void *)&long long v19 = &unk_1F26F4208;
    if (v20)
    {
      if (*((void *)&v19 + 1)) {
        (*(void (**)(void))(**((void **)&v19 + 1) + 8))(*((void *)&v19 + 1));
      }
    }
    return -1;
  }
  *a2 = v21;
  sub_1D0E76938((uint64_t)&v19);
  if (v5 == v6)
  {
    uint64_t v16 = v25 + *(void *)(*a1 + 16);
    *(void *)&long long v19 = v24 + *(void *)(a1[8] - 16);
    *((void *)&v19 + 1) = v16;
    sub_1D0E6D590((char **)a1 + 7, &v19);
  }
  return v25;
}

uint64_t sub_1D0E735CC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a1 + 8) & 3) == 1) {
    return sub_1D0E735E8((void *)a1, a2);
  }
  else {
    return 0;
  }
}

uint64_t sub_1D0E735E8(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    return 0;
  }
  uint64_t v4 = a1[3];
  if (*(unsigned char *)(v4 + 88))
  {
    if ((*(uint64_t (**)(void *))(*a1 + 104))(a1) < a2) {
      return 0;
    }
    uint64_t v4 = a1[3];
  }
  uint64_t v5 = *(void *)(v4 + 80);
  uint64_t v6 = *(void *)(*(void *)(v4 + 56) + 16 * v5);
  if (*(char *)(v4 + 47) < 0) {
    uint64_t v7 = *(void *)(v4 + 32);
  }
  else {
    uint64_t v7 = *(unsigned __int8 *)(v4 + 47);
  }
  uint64_t v9 = v7 + v6;
  BOOL v10 = __OFSUB__(a2, v6);
  uint64_t v11 = a2 - v6;
  if (v11 < 0 != v10 || v9 < a2)
  {
    uint64_t v13 = *(void *)(*(void *)v4 + 16);
    while (1)
    {
      uint64_t v14 = (void *)a1[3];
      uint64_t v15 = v14[8];
      if (*(void *)(v15 - 16) >= a2) {
        break;
      }
      if (!(*(unsigned int (**)(void, void))(*(void *)*v14 + 128))(*v14, *(void *)(v15 - 8))
        || ((*(uint64_t (**)(void))(**(void **)a1[3] + 32))(*(void *)a1[3]) & 1) != 0
        || sub_1D0E731EC((void *)a1[3], (_DWORD *)(a1[3] + 92)) == -1)
      {
        goto LABEL_19;
      }
    }
    uint64_t v17 = v14[7];
    uint64_t v18 = v15 - v17;
    uint64_t v19 = (int)(v18 >> 4);
    char v20 = (uint64_t *)(v17 + 16 * (int)((unint64_t)v18 >> 4) - 16);
    do
    {
      --v19;
      uint64_t v21 = *v20;
      v20 -= 2;
    }
    while (v21 > a2);
    int v22 = (*(uint64_t (**)(void, void))(*(void *)*v14 + 128))(*v14, *(void *)(v17 + 16 * v19 + 8));
    uint64_t v16 = (void *)a1[3];
    uint64_t v23 = *(void *)(v16[7] + 16 * (int)v19);
    uint64_t v24 = a2 - v23;
    if (v22)
    {
      if (a2 == v23)
      {
        if (*((char *)v16 + 47) < 0)
        {
          *(unsigned char *)v16[3] = 0;
          v16[4] = 0;
        }
        else
        {
          *((unsigned char *)v16 + 24) = 0;
          *((unsigned char *)v16 + 47) = 0;
        }
        goto LABEL_33;
      }
      if (sub_1D0E72F6C(v16))
      {
LABEL_33:
        uint64_t v26 = a1[3];
        *(void *)(v26 + 48) = v24;
        *(void *)(v26 + 80) = (int)v19;
        goto LABEL_22;
      }
LABEL_19:
      uint64_t v16 = (void *)a1[3];
    }
    v16[10] = v5;
    (*(void (**)(void, uint64_t))(*(void *)*v16 + 128))(*v16, v13);
    return 0;
  }
  *(void *)(v4 + 48) = v11;
LABEL_22:
  a1[2] = a2;
  return 1;
}

uint64_t sub_1D0E73830(void *a1)
{
  return (*(uint64_t (**)(void *))(*a1 + 104))(a1) - a1[2];
}

uint64_t sub_1D0E7387C(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 8) & 3) != 1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 24);
  if (!*(unsigned char *)(v2 + 88))
  {
    uint64_t v3 = *(void *)(*(void *)v2 + 16);
    while (1)
    {
      int v4 = (*(uint64_t (**)(void, void))(***(void ***)(a1 + 24) + 128))(**(void **)(a1 + 24), *(void *)(*(void *)(*(void *)(a1 + 24) + 64) - 8));
      if ((*(uint64_t (**)(void))(***(void ***)(a1 + 24) + 32))(**(void **)(a1 + 24))) {
        break;
      }
      if (!v4 || sub_1D0E731EC(*(void **)(a1 + 24), (_DWORD *)(*(void *)(a1 + 24) + 92)) == -1) {
        goto LABEL_10;
      }
    }
    if (v4) {
      goto LABEL_13;
    }
LABEL_10:
    sub_1D0E5C8F8(&v7);
    sub_1D0E5E098((uint64_t)v9, &v7, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/CompressedDevice.cpp", 551, "couldn't load data for size()", v7);
    sub_1D0E6054C((uint64_t)v9);
    uint64_t v6 = v8;
    if (v8)
    {
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
LABEL_13:
    (*(void (**)(void, uint64_t))(***(void ***)(a1 + 24) + 128))(**(void **)(a1 + 24), v3);
    uint64_t v2 = *(void *)(a1 + 24);
  }
  return *(void *)(*(void *)(v2 + 64) - 16);
}

uint64_t sub_1D0E73A28()
{
  return 0;
}

uint64_t sub_1D0E73A30(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = *(void *)(v2 + 48);
  if ((*(char *)(v2 + 47) & 0x80000000) == 0)
  {
    if (v3 == *(unsigned __int8 *)(v2 + 47)) {
      goto LABEL_3;
    }
    return 0;
  }
  if (v3 != *(void *)(v2 + 32)) {
    return 0;
  }
LABEL_3:
  uint64_t result = (*(uint64_t (**)(void))(**(void **)v2 + 32))();
  if (result) {
    return (*(uint64_t (**)(void *))(*a1 + 104))(a1) == a1[2];
  }
  return result;
}

uint64_t sub_1D0E73AE0(uint64_t a1)
{
  sub_1D0E73B40(*(std::string **)(a1 + 24));
  uint64_t v2 = *(uint64_t (**)(void))(***(void ***)(a1 + 24) + 24);
  return v2();
}

void sub_1D0E73B40(std::string *a1)
{
  if ((*(unsigned int (**)(std::string::size_type))(*(void *)a1->__r_.__value_.__l.__data_ + 16))(a1->__r_.__value_.__r.__words[0]))
  {
    if ((*(unsigned char *)(a1->__r_.__value_.__r.__words[0] + 8) & 2) != 0 && (sub_1D0E727C8(a1) & 1) == 0)
    {
      sub_1D0E5C8F8(&v3);
      sub_1D0E5E098((uint64_t)v5, &v3, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/CompressedDevice.cpp", 439, "Could not write final block", v3);
      sub_1D0E6054C((uint64_t)v5);
      uint64_t v2 = v4;
      if (v4)
      {
        if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
          std::__shared_weak_count::__release_weak(v2);
        }
      }
    }
  }
}

uint64_t sub_1D0E73C34()
{
  return 1;
}

void sub_1D0E73C3C(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4498;
  uint64_t v1 = (std::string **)(a1 + 24);
  sub_1D0E73B40(*(std::string **)(a1 + 24));
  sub_1D0E73CB0(v1);
  JUMPOUT(0x1D25F16B0);
}

std::string **sub_1D0E73CB0(std::string **a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    sub_1D0E73B40(*a1);
    size_t size = (void *)v2[2].__r_.__value_.__l.__size_;
    if (size)
    {
      v2[2].__r_.__value_.__r.__words[2] = (std::string::size_type)size;
      operator delete(size);
    }
    if (SHIBYTE(v2[1].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v2[1].__r_.__value_.__l.__data_);
    }
    int v4 = (std::__shared_weak_count *)v2->__r_.__value_.__r.__words[2];
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    MEMORY[0x1D25F16B0](v2, 0x1072C40C1316463);
  }
  return a1;
}

uint64_t sub_1D0E73D6C(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4498;
  uint64_t v2 = (std::string **)(a1 + 24);
  sub_1D0E73B40(*(std::string **)(a1 + 24));
  sub_1D0E73CB0(v2);
  return a1;
}

void sub_1D0E73DC0(uint64_t a1)
{
  if ((~*(_DWORD *)(a1 + 8) & 3) != 0)
  {
    uint64_t v3 = *(void **)(a1 + 24);
    int v4 = *((_DWORD *)v3 + 23);
    if (v4 == -2)
    {
      uint64_t v10 = 0;
      uint64_t v6 = (*(uint64_t (**)(void, uint64_t *, uint64_t))(*(void *)*v3 + 88))(*v3, &v10, 8);
      uint64_t v3 = *(void **)(a1 + 24);
      if (v6 != 8 || v10 == 0x277C6CE4B6030)
      {
        if (*((_DWORD *)v3 + 23) != -1)
        {
LABEL_7:
          if ((*((char *)v3 + 47) & 0x80000000) == 0)
          {
LABEL_8:
            uint64_t v5 = v3 + 3;
            *((unsigned char *)v3 + 47) = 0;
LABEL_20:
            unsigned char *v5 = 0;
            *(void *)(*(void *)(a1 + 24) + 48) = 0;
            sub_1D0E735E8((void *)a1, 0);
            return;
          }
LABEL_19:
          uint64_t v5 = (unsigned char *)v3[3];
          v3[4] = 0;
          goto LABEL_20;
        }
      }
      else
      {
        *((_DWORD *)v3 + 23) = -1;
      }
    }
    else if (v4 != -1)
    {
      goto LABEL_7;
    }
    sub_1D0E5C8F8(&v10);
    sub_1D0E5E098((uint64_t)v9, &v10, 0, 0, "[RELEASE WARNING]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/CompressedDevice.cpp", 505, "Legacy CompressedDevice format is deprecated, consider converting your data", v9[0]);
    sub_1D0E6054C((uint64_t)v9);
    uint64_t v8 = v11;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    uint64_t v3 = *(void **)(a1 + 24);
    if ((*((char *)v3 + 47) & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
  sub_1D0E5C8F8(&v10);
  sub_1D0E5E098((uint64_t)v12, &v10, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/CompressedDevice.cpp", 488, "Could not open IO device", v9[0]);
  sub_1D0E6054C((uint64_t)v12);
  uint64_t v1 = v11;
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void sub_1D0E73FE4(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  *(unsigned char *)(a1 + 136) = 1;
  std::mutex::unlock(v3);
  sub_1D0E74040(v2);
}

void sub_1D0E74040(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 16);
  std::mutex::lock((std::mutex *)(a1 + 16));
  if (*(void *)(a1 + 152))
  {
    uint64_t v3 = (uint64_t *)(a1 + 136);
    uint64_t v4 = *(void *)(a1 + 136);
    uint64_t v5 = *(uint64_t **)(a1 + 144);
    uint64_t v6 = *v5;
    *(void *)(v6 + 8) = *(void *)(v4 + 8);
    **(void **)(v4 + 8) = v6;
    *(void *)(a1 + 152) = 0;
    if (v5 != (uint64_t *)(a1 + 136))
    {
      do
      {
        uint64_t v7 = (uint64_t *)v5[1];
        uint64_t v8 = (std::__shared_weak_count *)v5[3];
        if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
        operator delete(v5);
        uint64_t v5 = v7;
      }
      while (v7 != v3);
    }
  }
  std::mutex::unlock(v2);
}

BOOL sub_1D0E74128(uint64_t a1, void *a2)
{
  return sub_1D0E74130(a1 + 8, a2);
}

BOOL sub_1D0E74130(uint64_t a1, void *a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 16);
  std::mutex::lock((std::mutex *)(a1 + 16));
  int v5 = *(unsigned __int8 *)(a1 + 128);
  if (*(unsigned char *)(a1 + 128))
  {
    std::mutex::unlock(v4);
  }
  else
  {
    uint64_t v6 = operator new(0x20uLL);
    uint64_t v7 = a2[1];
    v6[2] = *a2;
    v6[3] = v7;
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = *(void *)(a1 + 136);
    void *v6 = v8;
    v6[1] = a1 + 136;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 136) = v6;
    uint64_t v9 = *(void *)(a1 + 152) + 1;
    *(void *)(a1 + 152) = v9;
    int v10 = *(_DWORD *)(a1 + 8);
    if (v10 < (int)v9 && (v10 & 0x80000000) == 0)
    {
      do
      {
        uint64_t v11 = *(uint64_t **)(a1 + 144);
        uint64_t v12 = *v11;
        *(void *)(v12 + 8) = v11[1];
        *(void *)v11[1] = v12;
        *(void *)(a1 + 152) = v9 - 1;
        uint64_t v13 = (std::__shared_weak_count *)v11[3];
        if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
        operator delete(v11);
        uint64_t v9 = *(void *)(a1 + 152);
        int v14 = *(_DWORD *)(a1 + 8);
      }
      while (v14 < (int)v9 && (v14 & 0x80000000) == 0);
    }
    std::mutex::unlock(v4);
    std::condition_variable::notify_one((std::condition_variable *)(a1 + 80));
  }
  return v5 == 0;
}

void sub_1D0E7426C(uint64_t a1)
{
  sub_1D0E742A4(a1);
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E742A4(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F3840;
  *(void *)(a1 + 8) = &unk_1F26F4628;
  if (*(void *)(a1 + 160))
  {
    uint64_t v2 = (uint64_t *)(a1 + 144);
    uint64_t v3 = *(void *)(a1 + 144);
    uint64_t v4 = *(uint64_t **)(a1 + 152);
    uint64_t v5 = *v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *(void *)(a1 + 160) = 0;
    if (v4 != (uint64_t *)(a1 + 144))
    {
      do
      {
        uint64_t v6 = (uint64_t *)v4[1];
        uint64_t v7 = (std::__shared_weak_count *)v4[3];
        if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
        operator delete(v4);
        uint64_t v4 = v6;
      }
      while (v6 != v2);
    }
  }
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  return a1;
}

uint64_t sub_1D0E743BC(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 16);
  std::mutex::lock((std::mutex *)(a1 + 16));
  uint64_t v3 = *(unsigned int *)(a1 + 152);
  std::mutex::unlock(v2);
  return v3;
}

uint64_t sub_1D0E743F8(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  v21.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 16);
  v21.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 16));
  BOOL v8 = 0;
  uint64_t v9 = *(void *)(a1 + 152);
  if (a3 >= 1 && !v9)
  {
    BOOL v8 = a4 != 0;
    if (a4)
    {
      if (!*(unsigned char *)(a4 + 8)) {
        goto LABEL_37;
      }
      std::mutex::unlock(*(std::mutex **)a4);
      *(unsigned char *)(a4 + 8) = 0;
    }
    std::chrono::steady_clock::now();
    v10.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    if (v10.__d_.__rep_)
    {
      if (v10.__d_.__rep_ < 1)
      {
        if ((unint64_t)v10.__d_.__rep_ < 0xFFDF3B645A1CAC09)
        {
          uint64_t v11 = 0x8000000000000000;
          goto LABEL_14;
        }
      }
      else if ((unint64_t)v10.__d_.__rep_ > 0x20C49BA5E353F7)
      {
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
        if (v11 <= ((1000000 * a3) ^ 0x7FFFFFFFFFFFFFFFLL)) {
          v12.__d_.__rep_ = v11 + 1000000 * a3;
        }
        else {
          v12.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
        }
        std::condition_variable::__do_timed_wait((std::condition_variable *)(a1 + 80), &v21, v12);
        std::chrono::steady_clock::now();
        uint64_t v9 = *(void *)(a1 + 152);
        goto LABEL_18;
      }
      uint64_t v11 = 1000 * v10.__d_.__rep_;
      goto LABEL_14;
    }
    uint64_t v11 = 0;
    goto LABEL_14;
  }
LABEL_18:
  if (v9)
  {
    uint64_t v13 = *(void *)(a1 + 144);
    uint64_t v15 = *(void *)(v13 + 16);
    uint64_t v14 = *(void *)(v13 + 24);
    if (v14) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v16 = (std::__shared_weak_count *)a2[1];
    *a2 = v15;
    a2[1] = v14;
    if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
    uint64_t v17 = *(uint64_t **)(a1 + 144);
    uint64_t v18 = *v17;
    *(void *)(v18 + 8) = v17[1];
    *(void *)v17[1] = v18;
    --*(void *)(a1 + 152);
    uint64_t v19 = (std::__shared_weak_count *)v17[3];
    if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
    operator delete(v17);
  }
  if (v21.__owns_) {
    std::mutex::unlock(v21.__m_);
  }
  if (!v8) {
    return v9 != 0;
  }
  if (*(void *)a4)
  {
    if (!*(unsigned char *)(a4 + 8))
    {
      std::mutex::lock(*(std::mutex **)a4);
      *(unsigned char *)(a4 + 8) = 1;
      return v9 != 0;
    }
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::lock: references null mutex");
  }
  std::__throw_system_error(11, "unique_lock::lock: already locked");
LABEL_37:
  std::__throw_system_error(1, "unique_lock::unlock: not locked");
  return sub_1D0E7466C();
}

void sub_1D0E7466C(uint64_t a1@<X0>, void *a2@<X8>)
{
  v9.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 16);
  v9.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 16));
  for (uint64_t i = *(void *)(a1 + 152); !i; uint64_t i = *(void *)(a1 + 152))
    std::condition_variable::wait((std::condition_variable *)(a1 + 80), &v9);
  uint64_t v5 = *(uint64_t **)(a1 + 144);
  uint64_t v6 = v5[3];
  *a2 = v5[2];
  a2[1] = v6;
  if (v6)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    uint64_t v5 = *(uint64_t **)(a1 + 144);
    uint64_t i = *(void *)(a1 + 152);
    uint64_t v7 = (std::__shared_weak_count *)v5[3];
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *v5;
  *(void *)(v8 + 8) = v5[1];
  *(void *)v5[1] = v8;
  *(void *)(a1 + 152) = i - 1;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  operator delete(v5);
  if (v9.__owns_) {
    std::mutex::unlock(v9.__m_);
  }
}

void sub_1D0E74774(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4628;
  if (*(void *)(a1 + 152))
  {
    uint64_t v2 = (uint64_t *)(a1 + 136);
    uint64_t v3 = *(void *)(a1 + 136);
    uint64_t v4 = *(uint64_t **)(a1 + 144);
    uint64_t v5 = *v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *(void *)(a1 + 152) = 0;
    if (v4 != (uint64_t *)(a1 + 136))
    {
      do
      {
        uint64_t v6 = (uint64_t *)v4[1];
        uint64_t v7 = (std::__shared_weak_count *)v4[3];
        if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
        operator delete(v4);
        uint64_t v4 = v6;
      }
      while (v6 != v2);
    }
  }
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 80));
  std::mutex::~mutex((std::mutex *)(a1 + 16));
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E7488C(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4628;
  if (*(void *)(a1 + 152))
  {
    uint64_t v2 = (uint64_t *)(a1 + 136);
    uint64_t v3 = *(void *)(a1 + 136);
    uint64_t v4 = *(uint64_t **)(a1 + 144);
    uint64_t v5 = *v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *(void *)(a1 + 152) = 0;
    if (v4 != (uint64_t *)(a1 + 136))
    {
      do
      {
        uint64_t v6 = (uint64_t *)v4[1];
        uint64_t v7 = (std::__shared_weak_count *)v4[3];
        if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
        operator delete(v4);
        uint64_t v4 = v6;
      }
      while (v6 != v2);
    }
  }
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 80));
  std::mutex::~mutex((std::mutex *)(a1 + 16));
  return a1;
}

void sub_1D0E74988(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = *((unsigned __int8 *)a2 + 23);
  uint64_t v5 = (void *)*a2;
  unint64_t v6 = a2[1];
  if ((v4 & 0x80u) == 0) {
    unint64_t v7 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    unint64_t v7 = a2[1];
  }
  if (v7 >= 2) {
    size_t v8 = 2;
  }
  else {
    size_t v8 = v7;
  }
  HIBYTE(v54) = v8;
  if (v8)
  {
    if ((v4 & 0x80u) != 0) {
      a2 = v5;
    }
    memcpy(&__dst, a2, v8);
    unsigned int v9 = HIBYTE(v54);
    unint64_t v7 = (unint64_t)v53;
  }
  else
  {
    unsigned int v9 = 0;
  }
  *((unsigned char *)&__dst + v8) = 0;
  if ((v9 & 0x80u) == 0) {
    unint64_t v7 = v9;
  }
  if (v7 == 2)
  {
    p_dst = __dst;
    if ((v9 & 0x80u) == 0) {
      p_dst = (void **)&__dst;
    }
    if (*(_WORD *)p_dst == 12067)
    {
      if ((v4 & 0x80) != 0)
      {
        if (v6 < 2) {
          goto LABEL_126;
        }
      }
      else
      {
        unint64_t v6 = v4;
        uint64_t v5 = v2;
        if (v4 <= 1) {
          goto LABEL_126;
        }
      }
      size_t v12 = v6 - 2;
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        goto LABEL_126;
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        uint64_t v13 = operator new(v14 + 1);
        __src[1] = (void *)v12;
        unint64_t v56 = v15 | 0x8000000000000000;
        __src[0] = v13;
      }
      else
      {
        HIBYTE(v56) = v12;
        uint64_t v13 = __src;
        if (!v12)
        {
LABEL_37:
          *((unsigned char *)v13 + v12) = 0;
          if (v54 < 0) {
            goto LABEL_38;
          }
          goto LABEL_20;
        }
      }
      memmove(v13, (char *)v5 + 2, v12);
      goto LABEL_37;
    }
  }
  if ((v4 & 0x80) != 0)
  {
    sub_1D0DCB370(__src, v5, v6);
    if ((v9 & 0x80) != 0) {
      goto LABEL_38;
    }
LABEL_20:
    int v11 = SHIBYTE(v56);
    if ((SHIBYTE(v56) & 0x80000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_39;
  }
  *(_OWORD *)std::string __src = *(_OWORD *)v2;
  unint64_t v56 = v2[2];
  if ((v9 & 0x80) == 0) {
    goto LABEL_20;
  }
LABEL_38:
  operator delete(__dst);
  int v11 = SHIBYTE(v56);
  if ((SHIBYTE(v56) & 0x80000000) == 0)
  {
LABEL_21:
    if (!v11)
    {
      *(_OWORD *)a1 = *(_OWORD *)__src;
      *(void *)(a1 + 16) = v56;
      return;
    }
    goto LABEL_40;
  }
LABEL_39:
  if (!__src[1])
  {
    sub_1D0DCB370((unsigned char *)a1, __src[0], 0);
    goto LABEL_124;
  }
LABEL_40:
  __dst = 0;
  int v53 = 0;
  uint64_t v54 = 0;
  cva::utils::string::split();
  std::string __p = 0;
  int v50 = 0;
  uint64_t v51 = 0;
  uint64_t v16 = __dst;
  int64_t v17 = (char *)v53 - (char *)__dst;
  if (v53 != __dst)
  {
    unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (v17 >> 3);
    if (v18 <= 0xAAAAAAAAAAAAAAALL)
    {
      uint64_t v19 = (void **)operator new(v17);
      unint64_t v20 = 0;
      std::string __p = v19;
      int v50 = (char *)v19;
      uint64_t v51 = (char *)&v19[3 * v18];
      while (1)
      {
        uint64_t v22 = (uint64_t)&v16[3 * v20];
        char v23 = *(unsigned char *)(v22 + 23);
        if (v23 < 0)
        {
          if (!*(void *)(v22 + 8)) {
            goto LABEL_43;
          }
        }
        else if (!*(unsigned char *)(v22 + 23))
        {
          goto LABEL_43;
        }
        if (v23 >= 0) {
          uint64_t v24 = *(unsigned __int8 *)(v22 + 23);
        }
        else {
          uint64_t v24 = *(void *)(v22 + 8);
        }
        if (v24 == 2)
        {
          if (v23 >= 0) {
            uint64_t v26 = (char *)&v16[3 * v20];
          }
          else {
            uint64_t v26 = *(char **)v22;
          }
          if (*(_WORD *)v26 != 11822)
          {
LABEL_63:
            if (v19 >= (void **)v51)
            {
              std::unique_lock<std::mutex> v21 = sub_1D0E57204((uint64_t)&__p, v22);
            }
            else
            {
              if ((*(unsigned char *)(v22 + 23) & 0x80) != 0)
              {
                sub_1D0DCB370(v19, *(void **)v22, *(void *)(v22 + 8));
              }
              else
              {
                long long v27 = *(_OWORD *)v22;
                v19[2] = *(void **)(v22 + 16);
                *(_OWORD *)uint64_t v19 = v27;
              }
              std::unique_lock<std::mutex> v21 = (char *)(v19 + 3);
            }
            goto LABEL_101;
          }
          int v28 = (void **)__p;
          if (v19 == __p) {
            goto LABEL_78;
          }
          std::unique_lock<std::mutex> v21 = (char *)(v19 - 3);
          uint64_t v29 = *((unsigned __int8 *)v19 - 1);
          int v30 = (char)v29;
          if ((v29 & 0x80u) != 0) {
            uint64_t v29 = (uint64_t)*(v19 - 2);
          }
          if (v29 != 2) {
            goto LABEL_76;
          }
          uint64_t v31 = *(void ***)v21;
          if (v30 >= 0) {
            uint64_t v31 = v19 - 3;
          }
          if (*(_WORD *)v31 == 11822)
          {
LABEL_78:
            if (v19 >= (void **)v51)
            {
              unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * (((char *)v19 - (unsigned char *)__p) >> 3);
              unint64_t v35 = v34 + 1;
              if (v34 + 1 > 0xAAAAAAAAAAAAAAALL) {
                break;
              }
              if (0x5555555555555556 * ((v51 - (unsigned char *)__p) >> 3) > v35) {
                unint64_t v35 = 0x5555555555555556 * ((v51 - (unsigned char *)__p) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((v51 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
                unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v36 = v35;
              }
              if (v36)
              {
                if (v36 > 0xAAAAAAAAAAAAAAALL) {
                  sub_1D0DE8CE0();
                }
                std::string::size_type v37 = (char *)operator new(24 * v36);
              }
              else
              {
                std::string::size_type v37 = 0;
              }
              uint64_t v38 = &v37[24 * v34];
              *(void *)uint64_t v38 = 11822;
              v38[23] = 2;
              unint64_t v39 = &v37[24 * v36];
              v57.__r_.__value_.__r.__words[0] = 0;
              *(std::string::size_type *)((char *)v57.__r_.__value_.__r.__words + 7) = 0;
              std::unique_lock<std::mutex> v21 = v38 + 24;
              if (v19 == v28)
              {
                std::string __p = v38;
                int v50 = v38 + 24;
                uint64_t v51 = &v37[24 * v36];
              }
              else
              {
                do
                {
                  long long v40 = *(_OWORD *)(v19 - 3);
                  *((void *)v38 - 1) = *(v19 - 1);
                  *(_OWORD *)(v38 - 24) = v40;
                  v38 -= 24;
                  *(v19 - 2) = 0;
                  *(v19 - 1) = 0;
                  *(v19 - 3) = 0;
                  v19 -= 3;
                }
                while (v19 != v28);
                uint64_t v19 = (void **)__p;
                int64_t v41 = (void **)v50;
                std::string __p = v38;
                int v50 = v21;
                uint64_t v51 = v39;
                while (v41 != v19)
                {
                  if (*((char *)v41 - 1) < 0) {
                    operator delete(*(v41 - 3));
                  }
                  v41 -= 3;
                }
              }
              if (!v19) {
                goto LABEL_101;
              }
              uint64_t v32 = v19;
LABEL_100:
              operator delete(v32);
            }
            else
            {
              *uint64_t v19 = (void *)11822;
              uint64_t v33 = *(void **)((char *)v57.__r_.__value_.__r.__words + 7);
              v19[1] = (void *)v57.__r_.__value_.__r.__words[0];
              *(void **)((char *)v19 + 15) = v33;
              *((unsigned char *)v19 + 23) = 2;
              std::unique_lock<std::mutex> v21 = (char *)(v19 + 3);
            }
          }
          else
          {
LABEL_76:
            if (v30 < 0)
            {
              uint64_t v32 = *(void ***)v21;
              goto LABEL_100;
            }
          }
LABEL_101:
          int v50 = v21;
          goto LABEL_44;
        }
        if (v24 != 1) {
          goto LABEL_63;
        }
        uint64_t v25 = v23 >= 0 ? (char *)&v16[3 * v20] : *(char **)v22;
        if (*v25 != 46) {
          goto LABEL_63;
        }
LABEL_43:
        std::unique_lock<std::mutex> v21 = (char *)v19;
LABEL_44:
        ++v20;
        uint64_t v16 = __dst;
        uint64_t v19 = (void **)v21;
        if (v20 >= 0xAAAAAAAAAAAAAAABLL * (v53 - __dst)) {
          goto LABEL_102;
        }
      }
    }
LABEL_126:
    abort();
  }
LABEL_102:
  cva::utils::string::join();
  char v42 = std::string::insert(&v57, 0, "/", 1uLL);
  *(std::string *)a1 = *v42;
  v42->__r_.__value_.__r.__words[0] = 0;
  v42->__r_.__value_.__l.__size_ = 0;
  v42->__r_.__value_.__r.__words[2] = 0;
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v57.__r_.__value_.__l.__data_);
  }
  uint64_t v43 = (char *)__p;
  if (__p)
  {
    int64_t v44 = (void **)v50;
    int64_t v45 = __p;
    if (v50 != __p)
    {
      do
      {
        if (*((char *)v44 - 1) < 0) {
          operator delete(*(v44 - 3));
        }
        v44 -= 3;
      }
      while (v44 != (void **)v43);
      int64_t v45 = __p;
    }
    int v50 = v43;
    operator delete(v45);
    int64_t v46 = __dst;
    if (!__dst)
    {
LABEL_112:
      if ((SHIBYTE(v56) & 0x80000000) == 0) {
        return;
      }
      goto LABEL_124;
    }
  }
  else
  {
    int64_t v46 = __dst;
    if (!__dst) {
      goto LABEL_112;
    }
  }
  uint64_t v47 = v53;
  long long v48 = v46;
  if (v53 != v46)
  {
    do
    {
      if (*((char *)v47 - 1) < 0) {
        operator delete(*(v47 - 3));
      }
      v47 -= 3;
    }
    while (v47 != v46);
    long long v48 = __dst;
  }
  int v53 = v46;
  operator delete(v48);
  if (SHIBYTE(v56) < 0) {
LABEL_124:
  }
    operator delete(__src[0]);
}

void sub_1D0E74FC8(void *a1, uint64_t a2)
{
  if (*(void *)(a2 + 24)) {
    operator new();
  }
  uint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a2 + 8);
  }
  if (v3)
  {
    cva::Path::Path();
    if (cva::Path::exists((cva::Path *)v4))
    {
      if (cva::Path::isRegularFile((cva::Path *)v4)) {
        operator new();
      }
    }
    *a1 = 0;
    a1[1] = 0;
    cva::Path::~Path((cva::Path *)v4);
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

uint64_t **sub_1D0E751D8(uint64_t **a1, const void **a2, uint64_t a3)
{
  unint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    int v7 = *((char *)a2 + 23);
    if (v7 >= 0) {
      size_t v8 = a2;
    }
    else {
      size_t v8 = *a2;
    }
    if (v7 >= 0) {
      size_t v9 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v9 = (size_t)a2[1];
    }
    while (1)
    {
      std::chrono::system_clock::time_point v10 = (uint64_t **)v5;
      uint64_t v13 = (const void *)v5[4];
      int v11 = v5 + 4;
      size_t v12 = v13;
      int v14 = *((char *)v11 + 23);
      if (v14 >= 0) {
        uint64_t v15 = v11;
      }
      else {
        uint64_t v15 = v12;
      }
      if (v14 >= 0) {
        size_t v16 = *((unsigned __int8 *)v11 + 23);
      }
      else {
        size_t v16 = v11[1];
      }
      if (v16 >= v9) {
        size_t v17 = v9;
      }
      else {
        size_t v17 = v16;
      }
      int v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0) {
          goto LABEL_8;
        }
LABEL_22:
        int v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0) {
            return v10;
          }
        }
        else if (v16 >= v9)
        {
          return v10;
        }
        uint64_t v5 = v10[1];
        if (!v5)
        {
          unint64_t v6 = v10 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v9 >= v16) {
          goto LABEL_22;
        }
LABEL_8:
        uint64_t v5 = *v10;
        unint64_t v6 = v10;
        if (!*v10) {
          goto LABEL_29;
        }
      }
    }
  }
  std::chrono::system_clock::time_point v10 = a1 + 1;
LABEL_29:
  unint64_t v20 = operator new(0x48uLL);
  std::unique_lock<std::mutex> v21 = v20 + 4;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_1D0DCB370(v21, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)std::unique_lock<std::mutex> v21 = *(_OWORD *)a3;
    v20[6] = *(void *)(a3 + 16);
  }
  v20[7] = 0;
  v20[8] = 0;
  *unint64_t v20 = 0;
  v20[1] = 0;
  v20[2] = v10;
  uint64_t *v6 = v20;
  uint64_t v22 = (uint64_t *)**a1;
  char v23 = v20;
  if (v22)
  {
    *a1 = v22;
    char v23 = *v6;
  }
  sub_1D0DCEC98(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v20;
}

uint64_t sub_1D0E7534C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_1D0E7537C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E753BC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_1D0E753EC(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

uint64_t *sub_1D0E75428(uint64_t a1, const void **a2)
{
  uint64_t v2 = (uint64_t *)(a1 + 8);
  uint64_t v3 = *(uint64_t **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  int v7 = (uint64_t *)(a1 + 8);
  do
  {
    while (1)
    {
      int v8 = *((char *)v3 + 55);
      size_t v9 = v8 >= 0 ? v3 + 4 : (uint64_t *)v3[4];
      size_t v10 = v8 >= 0 ? *((unsigned __int8 *)v3 + 55) : v3[5];
      size_t v11 = v6 >= v10 ? v10 : v6;
      int v12 = memcmp(v9, v5, v11);
      if (v12) {
        break;
      }
      if (v10 >= v6) {
        goto LABEL_23;
      }
LABEL_9:
      uint64_t v3 = (uint64_t *)v3[1];
      if (!v3) {
        goto LABEL_24;
      }
    }
    if (v12 < 0) {
      goto LABEL_9;
    }
LABEL_23:
    int v7 = v3;
    uint64_t v3 = (uint64_t *)*v3;
  }
  while (v3);
LABEL_24:
  if (v7 == v2) {
    return v2;
  }
  int v13 = *((char *)v7 + 55);
  if (v13 >= 0) {
    int v14 = v7 + 4;
  }
  else {
    int v14 = (const void *)v7[4];
  }
  if (v13 >= 0) {
    size_t v15 = *((unsigned __int8 *)v7 + 55);
  }
  else {
    size_t v15 = v7[5];
  }
  if (v15 >= v6) {
    size_t v16 = v6;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v5, v14, v16);
  if (!v17)
  {
    if (v6 >= v15) {
      return v7;
    }
    return v2;
  }
  if (v17 < 0) {
    return v2;
  }
  return v7;
}

uint64_t sub_1D0E75534(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_1D0E75558(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F26F50F8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

void sub_1D0E755AC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F26F50F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t sub_1D0E755D0(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_1D0E755F4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F26F5018;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

void sub_1D0E75648(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F26F5018;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1D0E75668(void *a1, uint64_t a2, const void **a3)
{
  *a1 = 0;
  a1[1] = 0;
  sub_1D0E74988((uint64_t)__p, a3);
  if ((uint64_t *)(a2 + 40) != sub_1D0E75428(a2 + 32, a3)
    || sub_1D0E75428(a2 + 32, (const void **)__p) != (uint64_t *)(a2 + 40))
  {
    sub_1D0E74FC8(&__dst, a2);
    size_t v6 = operator new(0x38uLL);
    v6[1] = 0;
    v6[2] = 0;
    void *v6 = &unk_1F26F5018;
    *((_DWORD *)v6 + 8) = *(_DWORD *)(__dst.__r_.__value_.__r.__words[0] + 8);
    v6[5] = 0;
    v6[3] = &unk_1F26F42F8;
    operator new();
  }
  unint64_t v7 = *((unsigned __int8 *)a3 + 23);
  int v8 = (const void **)*a3;
  unint64_t v9 = (unint64_t)a3[1];
  if ((v7 & 0x80u) == 0) {
    std::string::size_type size = *((unsigned __int8 *)a3 + 23);
  }
  else {
    std::string::size_type size = (std::string::size_type)a3[1];
  }
  if (size >= 2) {
    size_t v11 = 2;
  }
  else {
    size_t v11 = size;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v11;
  if (v11)
  {
    if ((v7 & 0x80u) == 0) {
      int v12 = a3;
    }
    else {
      int v12 = v8;
    }
    memcpy(&__dst, v12, v11);
    unsigned int v13 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
    std::string::size_type size = __dst.__r_.__value_.__l.__size_;
  }
  else
  {
    unsigned int v13 = 0;
  }
  __dst.__r_.__value_.__s.__data_[v11] = 0;
  if ((v13 & 0x80u) == 0) {
    std::string::size_type size = v13;
  }
  if (size != 2) {
    goto LABEL_22;
  }
  p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
  if ((v13 & 0x80u) == 0) {
    p_dst = &__dst;
  }
  if (LOWORD(p_dst->__r_.__value_.__l.__data_) != 12067)
  {
LABEL_22:
    if ((v7 & 0x80) != 0)
    {
      sub_1D0DCB370(v43, v8, v9);
      if ((v13 & 0x80) == 0) {
        goto LABEL_27;
      }
    }
    else
    {
      *(_OWORD *)uint64_t v43 = *(_OWORD *)a3;
      int64_t v44 = (int64_t)a3[2];
      if ((v13 & 0x80) == 0) {
        goto LABEL_27;
      }
    }
    goto LABEL_26;
  }
  if ((v7 & 0x80) != 0)
  {
    if (v9 < 2) {
      goto LABEL_96;
    }
  }
  else
  {
    unint64_t v9 = v7;
    int v8 = a3;
    if (v7 <= 1) {
      goto LABEL_96;
    }
  }
  size_t v36 = v9 - 2;
  if (v9 - 2 > 0x7FFFFFFFFFFFFFF7) {
    goto LABEL_96;
  }
  if (v36 >= 0x17)
  {
    uint64_t v38 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v36 | 7) != 0x17) {
      uint64_t v38 = v36 | 7;
    }
    uint64_t v39 = v38 + 1;
    std::string::size_type v37 = operator new(v38 + 1);
    v43[1] = (void *)v36;
    int64_t v44 = v39 | 0x8000000000000000;
    v43[0] = v37;
    goto LABEL_93;
  }
  HIBYTE(v44) = v9 - 2;
  std::string::size_type v37 = v43;
  if (v36) {
LABEL_93:
  }
    memmove(v37, (char *)v8 + 2, v36);
  *((unsigned char *)v37 + v36) = 0;
  if ((*((unsigned char *)&__dst.__r_.__value_.__s + 23) & 0x80) != 0) {
LABEL_26:
  }
    operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_27:
  char v15 = *(unsigned char *)(a2 + 23);
  if ((v15 & 0x80000000) == 0)
  {
    if (*(unsigned char *)(a2 + 23)) {
      goto LABEL_29;
    }
LABEL_37:
    if (SHIBYTE(v44) < 0)
    {
      sub_1D0DCB370(v41, v43[0], (unint64_t)v43[1]);
    }
    else
    {
      *(_OWORD *)int64_t v41 = *(_OWORD *)v43;
      int64_t v42 = v44;
    }
    goto LABEL_58;
  }
  if (!*(void *)(a2 + 8)) {
    goto LABEL_37;
  }
LABEL_29:
  if (v15 >= 0) {
    size_t v16 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v16 = *(void *)(a2 + 8);
  }
  unint64_t v17 = v16 + 1;
  if (v16 + 1 > 0x7FFFFFFFFFFFFFF7) {
    goto LABEL_96;
  }
  if (v17 >= 0x17)
  {
    uint64_t v19 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v19 = v17 | 7;
    }
    uint64_t v20 = v19 + 1;
    int v18 = (std::string *)operator new(v19 + 1);
    __dst.__r_.__value_.__l.__size_ = v16 + 1;
    __dst.__r_.__value_.__r.__words[2] = v20 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v18;
  }
  else
  {
    memset(&__dst, 0, sizeof(__dst));
    int v18 = &__dst;
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v16 + 1;
    if (!v16) {
      goto LABEL_46;
    }
  }
  if (v15 >= 0) {
    std::unique_lock<std::mutex> v21 = (const void *)a2;
  }
  else {
    std::unique_lock<std::mutex> v21 = *(const void **)a2;
  }
  memmove(v18, v21, v16);
LABEL_46:
  *(_WORD *)((char *)&v18->__r_.__value_.__l.__data_ + v16) = 47;
  if (v44 >= 0) {
    uint64_t v22 = v43;
  }
  else {
    uint64_t v22 = (void **)v43[0];
  }
  if (v44 >= 0) {
    std::string::size_type v23 = HIBYTE(v44);
  }
  else {
    std::string::size_type v23 = (std::string::size_type)v43[1];
  }
  uint64_t v24 = std::string::append(&__dst, (const std::string::value_type *)v22, v23);
  int64_t v25 = v24->__r_.__value_.__r.__words[2];
  *(_OWORD *)int64_t v41 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  int64_t v42 = v25;
  v24->__r_.__value_.__l.__size_ = 0;
  v24->__r_.__value_.__r.__words[2] = 0;
  v24->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
LABEL_58:
  uint64_t v26 = v41;
  cva::Path::Path();
  char v27 = cva::Path::exists((cva::Path *)&__dst);
  cva::Path::~Path((cva::Path *)&__dst);
  if ((v27 & 1) == 0)
  {
    uint64_t v26 = v43;
    cva::Path::Path();
    int v28 = cva::Path::exists((cva::Path *)&__dst);
    cva::Path::~Path((cva::Path *)&__dst);
    if (!v28)
    {
      unint64_t v35 = (std::__shared_weak_count *)a1[1];
      *a1 = 0;
      a1[1] = 0;
      if (!v35) {
        goto LABEL_76;
      }
      goto LABEL_75;
    }
  }
  if (*((char *)v26 + 23) < 0) {
    uint64_t v26 = (void **)*v26;
  }
  int v40 = 1;
  uint64_t v29 = operator new(0x2A0uLL);
  v29[1] = 0;
  v29[2] = 0;
  void *v29 = &unk_1F26F4FE0;
  size_t v30 = strlen((const char *)v26);
  if (v30 > 0x7FFFFFFFFFFFFFF7) {
LABEL_96:
  }
    abort();
  std::string::size_type v31 = v30;
  if (v30 >= 0x17)
  {
    uint64_t v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v30 | 7) != 0x17) {
      uint64_t v33 = v30 | 7;
    }
    uint64_t v34 = v33 + 1;
    uint64_t v32 = (std::string *)operator new(v33 + 1);
    __dst.__r_.__value_.__l.__size_ = v31;
    __dst.__r_.__value_.__r.__words[2] = v34 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v32;
    goto LABEL_69;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v30;
  uint64_t v32 = &__dst;
  if (v30) {
LABEL_69:
  }
    memmove(v32, v26, v31);
  v32->__r_.__value_.__s.__data_[v31] = 0;
  sub_1D0E777A8((uint64_t)(v29 + 3), (long long *)&__dst, &v40);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  unint64_t v35 = (std::__shared_weak_count *)a1[1];
  *a1 = v29 + 3;
  a1[1] = v29;
  if (!v35)
  {
LABEL_76:
    if ((SHIBYTE(v42) & 0x80000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_82;
  }
LABEL_75:
  if (atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_76;
  }
  ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
  std::__shared_weak_count::__release_weak(v35);
  if ((SHIBYTE(v42) & 0x80000000) == 0)
  {
LABEL_77:
    if ((SHIBYTE(v44) & 0x80000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_83;
  }
LABEL_82:
  operator delete(v41[0]);
  if ((SHIBYTE(v44) & 0x80000000) == 0)
  {
LABEL_78:
    if ((v46 & 0x80000000) == 0) {
      return;
    }
    goto LABEL_79;
  }
LABEL_83:
  operator delete(v43[0]);
  if (v46 < 0) {
LABEL_79:
  }
    operator delete(__p[0]);
}

CMTime *sub_1D0E75D88(CMTime *result, uint64_t a2, uint64_t a3)
{
  int v4 = result;
  int v5 = *(_DWORD *)(a2 + 24);
  if (v5)
  {
    if (v5 != 1) {
      goto LABEL_18;
    }
    if ((*(unsigned char *)(a2 + 12) & 1) == 0)
    {
LABEL_7:
      LODWORD(result[1].value) = 0;
      result->value = 0x7FF8000000000000;
      return result;
    }
  }
  int v6 = *(_DWORD *)(a3 + 24);
  if (v6)
  {
    if (v6 != 1) {
      goto LABEL_18;
    }
    if ((*(unsigned char *)(a3 + 12) & 1) == 0) {
      goto LABEL_7;
    }
    if (v5 != 1)
    {
      memset(&v14, 0, sizeof(v14));
      CMTimeMakeWithSeconds(&v14, *(Float64 *)a2, 1000000);
      int v6 = *(_DWORD *)(a3 + 24);
      goto LABEL_13;
    }
  }
  else if (v5 != 1)
  {
    *(double *)&CMTimeValue v7 = *(double *)a2 + *(double *)a3;
    LODWORD(result[1].value) = 0;
    result->value = v7;
    return result;
  }
  CMTime v14 = *(CMTime *)a2;
LABEL_13:
  memset(&v13, 0, sizeof(v13));
  if (!v6)
  {
    CMTimeMakeWithSeconds(&v13, *(Float64 *)a3, 1000000);
    goto LABEL_17;
  }
  if (v6 == 1)
  {
    CMTime v13 = *(CMTime *)a3;
LABEL_17:
    memset(&v12, 0, sizeof(v12));
    CMTime lhs = v14;
    CMTime v10 = v13;
    uint64_t result = CMTimeAdd(&v12, &lhs, &v10);
    CMTime *v4 = v12;
    LODWORD(v4[1].value) = 1;
    return result;
  }
LABEL_18:
  uint64_t v8 = sub_1D0E221E0();
  return (CMTime *)sub_1D0E75EF8(v8, v9);
}

uint64_t sub_1D0E75EF8(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 24);
  if (v3)
  {
    if (v3 != 1) {
      goto LABEL_27;
    }
    if ((*(unsigned char *)(a1 + 12) & 1) == 0) {
      return 129;
    }
  }
  int v4 = *(_DWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_27;
    }
    if ((*(unsigned char *)(a2 + 12) & 1) == 0) {
      return 129;
    }
    if (v3 != 1)
    {
      memset(&v13, 0, sizeof(v13));
      CMTimeMakeWithSeconds(&v13, *(Float64 *)a1, 1000000);
      int v4 = *(_DWORD *)(a2 + 24);
      goto LABEL_20;
    }
LABEL_18:
    CMTime v13 = *(CMTime *)a1;
LABEL_20:
    memset(&v12, 0, sizeof(v12));
    if (!v4)
    {
      CMTimeMakeWithSeconds(&v12, *(Float64 *)a2, 1000000);
LABEL_24:
      CMTime time1 = v13;
      CMTime v10 = v12;
      int32_t v8 = CMTimeCompare(&time1, &v10);
      if (v8 < 0) {
        return 0xFFFFFFFFLL;
      }
      else {
        return v8 != 0;
      }
    }
    if (v4 == 1)
    {
      CMTime v12 = *(CMTime *)a2;
      goto LABEL_24;
    }
LABEL_27:
    uint64_t v9 = sub_1D0E221E0();
    return sub_1D0E7604C(v9);
  }
  double v6 = *(double *)a2;
  if (v3 == 1) {
    goto LABEL_18;
  }
  if (*(double *)a1 == v6) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = -127;
  }
  if (*(double *)a1 > v6) {
    unsigned int v7 = 1;
  }
  if (*(double *)a1 < v6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v7;
  }
}

size_t sub_1D0E7604C(uint64_t a1, const void *a2, uint64_t a3)
{
  size_t v3 = a3 & ~(a3 >> 63);
  if (a3 >= 1)
  {
    uint64_t v7 = *(void *)(a1 + 16);
    double v6 = *(void ***)(a1 + 24);
    int64_t v8 = v7 + v3;
    if (v8 <= (*v6)[1]) {
      int64_t v9 = (*v6)[1];
    }
    else {
      int64_t v9 = v8;
    }
    sub_1D0E767A0(v6, v9);
    memcpy((void *)(***(void ***)(a1 + 24) + *(void *)(a1 + 16)), a2, v3);
  }
  return v3;
}

size_t sub_1D0E760C0(uint64_t a1, void *__dst, int64_t a3)
{
  if (a3 < 0) {
    return -1;
  }
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = **(void ***)(a1 + 24);
  if (v4[1] - v3 >= a3) {
    size_t v5 = a3;
  }
  else {
    size_t v5 = v4[1] - v3;
  }
  if (v5) {
    memcpy(__dst, (const void *)(*v4 + v3), v5);
  }
  return v5;
}

uint64_t sub_1D0E76120(uint64_t a1)
{
  return *(void *)(**(void **)(a1 + 24) + 8);
}

BOOL sub_1D0E76130(void *a1)
{
  uint64_t v1 = a1[2];
  return v1 >= (*(uint64_t (**)(void *))(*a1 + 104))(a1);
}

void sub_1D0E76180(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F43A8;
  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v2 = *(uint64_t **)(a1 + 24);
    if (v2)
    {
      uint64_t v3 = sub_1D0E76720(v2);
      MEMORY[0x1D25F16B0](v3, 0x20C4093837F09);
    }
    *(void *)(a1 + 24) = 0;
  }
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E7620C(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F43A8;
  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v2 = *(uint64_t **)(a1 + 24);
    if (v2)
    {
      uint64_t v3 = sub_1D0E76720(v2);
      MEMORY[0x1D25F16B0](v3, 0x20C4093837F09);
    }
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t sub_1D0E76278(uint64_t a1, const void *a2, unint64_t a3)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  if (!a2)
  {
    sub_1D0E5C8F8(&v11);
    sub_1D0E5E098((uint64_t)v13, &v11, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/fsByteArray.cpp", 42, "assert %s failed. The byte array cannot be created with invalid data.%s", (char)"data");
    sub_1D0E6054C((uint64_t)v13);
    uint64_t v7 = v12;
    if (v12)
    {
      if (!atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    sub_1D0E5C8F8(&v11);
    sub_1D0E5E098((uint64_t)v10, &v11, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/fsByteArray.cpp", 43, "assert %s failed. The byte array cannot be created with a negative size.%s", (char)"size >= 0");
    sub_1D0E6054C((uint64_t)v10);
    int64_t v8 = v12;
    if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    sub_1D0E76444(a1, a3);
  }
  else
  {
    int v6 = sub_1D0E76444(a1, a3);
    if (a3 && v6) {
      memcpy(*(void **)a1, a2, a3);
    }
  }
  return a1;
}

uint64_t sub_1D0E76444(uint64_t a1, unint64_t a2)
{
  if (*(unsigned char *)(a1 + 24))
  {
    if (a2 < 0x7FFFFFFFFFFFFFFFLL) {
      operator new[]();
    }
    sub_1D0E5C8F8(&v6);
    sub_1D0E5E098((uint64_t)v5, &v6, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/fsByteArray.cpp", 107, "trying to expand the buffer with invalid size", v5[0]);
    uint64_t v2 = v5;
  }
  else
  {
    sub_1D0E5C8F8(&v6);
    sub_1D0E5E098((uint64_t)v8, &v6, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/fsByteArray.cpp", 102, "cannot expand a non-owned data buffer.", v5[0]);
    uint64_t v2 = v8;
  }
  sub_1D0E6054C((uint64_t)v2);
  uint64_t v3 = v7;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  return 0;
}

void sub_1D0E765E0()
{
}

uint64_t *sub_1D0E76720(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if (*(unsigned char *)(v2 + 24))
    {
      *(void *)(v2 + 8) = 0;
      if (*(void *)v2)
      {
        **(unsigned char **)uint64_t v2 = 0;
        if (*(void *)v2) {
          MEMORY[0x1D25F1690](*(void *)v2, 0x1000C8077774924);
        }
      }
    }
    *(void *)uint64_t v2 = 0;
    *(void *)(v2 + 16) = 0;
    MEMORY[0x1D25F16B0](v2, 0x1010C40A6225C5ALL);
  }
  return a1;
}

void sub_1D0E767A0(void **a1, int64_t a2)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    int v4 = *a1;
    if (v4[1] != a2)
    {
      if (v4[2] > a2)
      {
LABEL_6:
        v4[1] = a2;
        *(unsigned char *)(*v4 + a2) = 0;
        return;
      }
      if (sub_1D0E76444((uint64_t)v4, a2))
      {
        int v4 = *a1;
        goto LABEL_6;
      }
      sub_1D0E5C8F8(&v6);
      sub_1D0E5E098((uint64_t)v8, &v6, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/fsByteArray.cpp", 257, "could not extend buffer size", v6);
      sub_1D0E6054C((uint64_t)v8);
      size_t v5 = v7;
      if (v7)
      {
        if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
  }
}

void sub_1D0E768A0(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4208;
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
    *(void *)(a1 + 8) = 0;
  }
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E76938(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4208;
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

BOOL sub_1D0E769B0(uint64_t a1, std::string *a2)
{
  BOOL result = 0;
  unsigned int v13 = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v4 + 8) == 2) {
    return result;
  }
  uint64_t v6 = (*(uint64_t (**)(void, unsigned int *, uint64_t))(*(void *)v4 + 144))(*(void *)(a1 + 8), &v13, 4);
  if (v6 < 1) {
    return 0;
  }
  *(void *)(v4 + 16) += v6;
  if (v6 != 4) {
    return 0;
  }
  uint64_t v7 = v13;
  if ((SHIBYTE(a2->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    unint64_t size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (size >= v13)
    {
      *((unsigned char *)&a2->__r_.__value_.__s + 23) = v13 & 0x7F;
      int64_t v9 = a2;
      goto LABEL_19;
    }
LABEL_9:
    std::string::append(a2, v13 - size, 0);
    if (!v13) {
      return 1;
    }
    goto LABEL_10;
  }
  unint64_t size = a2->__r_.__value_.__l.__size_;
  if (size < v13) {
    goto LABEL_9;
  }
  int64_t v9 = (std::string *)a2->__r_.__value_.__r.__words[0];
  a2->__r_.__value_.__l.__size_ = v13;
LABEL_19:
  v9->__r_.__value_.__s.__data_[v7] = 0;
  if (!v13) {
    return 1;
  }
LABEL_10:
  uint64_t v10 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v10 + 8) == 2)
  {
    uint64_t v11 = -1;
  }
  else
  {
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      CMTime v12 = (uint64_t *)a2;
    }
    else {
      CMTime v12 = (uint64_t *)a2->__r_.__value_.__r.__words[0];
    }
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v10 + 144))(v10, v12);
    if (v11 >= 1) {
      *(void *)(v10 + 16) += v11;
    }
  }
  return v11 == v13;
}

uint64_t sub_1D0E76B28(uint64_t result, char *in)
{
  uint64_t v2 = in;
  uint64_t v3 = (unsigned char *)result;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = in[23];
  if (v4 < 0)
  {
    if (*((void *)in + 1) != 36)
    {
LABEL_8:
      *(unsigned char *)BOOL result = 0;
      *(unsigned char *)(result + 16) = 0;
      return result;
    }
    uint64_t v2 = *(const char **)in;
  }
  else if (v4 != 36)
  {
    goto LABEL_8;
  }
  BOOL result = uuid_parse(v2, uu);
  if (result)
  {
    char v5 = 0;
    unsigned char *v3 = 0;
  }
  else
  {
    *(_OWORD *)uint64_t v3 = *(_OWORD *)uu;
    char v5 = 1;
  }
  v3[16] = v5;
  return result;
}

uint64_t sub_1D0E76BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 8) == 3 && *(_DWORD *)(a1 + 640) != 28)
  {
    uint64_t v6 = (void *)(a1 + 32);
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)v6 + *(void *)(*v6 - 24)), *(_DWORD *)((char *)v6 + *(void *)(*v6 - 24) + 32) | 4);
    }
    *(_DWORD *)(a1 + 640) = 28;
    uint64_t v7 = std::filebuf::open();
    int64_t v8 = (std::ios_base *)((char *)v6 + *(void *)(*(void *)(a1 + 32) - 24));
    if (v7) {
      std::ios_base::iostate v9 = 0;
    }
    else {
      std::ios_base::iostate v9 = v8->__rdstate_ | 4;
    }
    std::ios_base::clear(v8, v9);
  }
  uint64_t result = -1;
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v11 = *(void **)(a1 + 24);
    if (v11)
    {
      uint64_t result = 0;
      if (a2)
      {
        if (a3)
        {
          std::ios_base::clear((std::ios_base *)((char *)v11 + *(void *)(*v11 - 24)), 0);
          CMTime v12 = *(void **)(a1 + 24);
          uint64_t v13 = (uint64_t)v12 + *(void *)(v12[2] - 24) + 16;
          if ((*(unsigned char *)(v13 + 32) & 5) != 0)
          {
            uint64_t v14 = -1;
          }
          else
          {
            (*(void (**)(_OWORD *__return_ptr))(**(void **)(v13 + 40) + 32))(v33);
            uint64_t v14 = v34;
            CMTime v12 = *(void **)(a1 + 24);
          }
          uint64_t v15 = *(void *)(a1 + 16);
          if (v14 != v15)
          {
            if (v12)
            {
              std::ios_base::clear((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)), 0);
              uint64_t v15 = *(void *)(a1 + 16);
              uint64_t v16 = *(void *)(a1 + 24);
            }
            else
            {
              uint64_t v16 = 0;
            }
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            MEMORY[0x1D25F13D0](v23, v16 + 16);
            uint64_t v17 = v16 + 16 + *(void *)(*(void *)(v16 + 16) - 24);
            if ((*(unsigned char *)(v17 + 32) & 5) == 0)
            {
              uint64_t v18 = *(void *)(v17 + 40);
              v33[0] = v24;
              v33[1] = v25;
              v33[2] = v26;
              v33[3] = v27;
              v33[6] = v30;
              v33[7] = v31;
              v33[4] = v28;
              v33[5] = v29;
              uint64_t v34 = v15;
              (*(void (**)(void *__return_ptr))(*(void *)v18 + 40))(v32);
              if (v32[16] == -1) {
                std::ios_base::clear((std::ios_base *)(v16 + 16 + *(void *)(*(void *)(v16 + 16) - 24)), *(_DWORD *)(v16 + 16 + *(void *)(*(void *)(v16 + 16) - 24) + 32) | 4);
              }
            }
            MEMORY[0x1D25F13E0](v23);
            CMTime v12 = *(void **)(a1 + 24);
          }
          uint64_t v19 = (uint64_t)v12 + *(void *)(v12[2] - 24) + 16;
          if ((*(unsigned char *)(v19 + 32) & 5) != 0)
          {
            uint64_t v20 = -1;
          }
          else
          {
            (*(void (**)(_OWORD *__return_ptr))(**(void **)(v19 + 40) + 32))(v33);
            uint64_t v20 = v34;
            CMTime v12 = *(void **)(a1 + 24);
          }
          if (v20 == *(void *)(a1 + 16))
          {
            std::ostream::write();
            std::unique_lock<std::mutex> v21 = *(void **)(a1 + 24);
            if (v21)
            {
              std::ios_base::clear((std::ios_base *)((char *)v21 + *(void *)(*v21 - 24)), 0);
              std::unique_lock<std::mutex> v21 = *(void **)(a1 + 24);
            }
            uint64_t v22 = (uint64_t)v21 + *(void *)(v21[2] - 24) + 16;
            if ((*(unsigned char *)(v22 + 32) & 5) == 0)
            {
              (*(void (**)(_OWORD *__return_ptr))(**(void **)(v22 + 40) + 32))(v33);
              if (v34 != -1) {
                return v34 - v20;
              }
            }
          }
          else if (v12)
          {
            std::ios_base::clear((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)), 0);
          }
          return -1;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1D0E77024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 8) == 3 && *(_DWORD *)(a1 + 640) != 12)
  {
    uint64_t v6 = (void *)(a1 + 32);
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)v6 + *(void *)(*v6 - 24)), *(_DWORD *)((char *)v6 + *(void *)(*v6 - 24) + 32) | 4);
    }
    *(_DWORD *)(a1 + 640) = 12;
    uint64_t v7 = std::filebuf::open();
    int64_t v8 = (std::ios_base *)((char *)v6 + *(void *)(*(void *)(a1 + 32) - 24));
    if (v7) {
      std::ios_base::iostate v9 = 0;
    }
    else {
      std::ios_base::iostate v9 = v8->__rdstate_ | 4;
    }
    std::ios_base::clear(v8, v9);
  }
  uint64_t v10 = -1;
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v11 = *(void **)(a1 + 24);
    if (v11)
    {
      uint64_t v10 = 0;
      if (a2)
      {
        if (a3)
        {
          std::ios_base::clear((std::ios_base *)((char *)v11 + *(void *)(*v11 - 24)), 0);
          std::istream::tellg();
          if (v16 != *(void *)(a1 + 16))
          {
            CMTime v12 = *(void **)(a1 + 24);
            if (v12) {
              std::ios_base::clear((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)), 0);
            }
            std::istream::seekg();
          }
          std::istream::tellg();
          uint64_t v13 = *(void **)(a1 + 24);
          if (v15 == *(void *)(a1 + 16))
          {
            std::istream::read();
            uint64_t v13 = *(void **)(a1 + 24);
            uint64_t v10 = v13[1];
LABEL_20:
            std::ios_base::clear((std::ios_base *)((char *)v13 + *(void *)(*v13 - 24)), 0);
            return v10;
          }
          uint64_t v10 = -1;
          if (v13) {
            goto LABEL_20;
          }
        }
      }
    }
  }
  return v10;
}

BOOL sub_1D0E7724C(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)(a1 + 8) = *a2;
  if (*(void *)(a1 + 176)) {
    (*(void (**)(uint64_t))(*(void *)a1 + 24))(a1);
  }
  if ((*a2 & 2) != 0) {
    int v4 = 20;
  }
  else {
    int v4 = 4;
  }
  *(_DWORD *)(a1 + 640) = v4 & 0xFFFFFFF7 | (8 * (*a2 & 1));
  uint64_t v5 = std::filebuf::open();
  uint64_t v6 = (std::ios_base *)(a1 + 32 + *(void *)(*(void *)(a1 + 32) - 24));
  if (v5) {
    std::ios_base::iostate v7 = 0;
  }
  else {
    std::ios_base::iostate v7 = v6->__rdstate_ | 4;
  }
  std::ios_base::clear(v6, v7);
  (*(void (**)(uint64_t))(*(void *)a1 + 120))(a1);
  return *(_DWORD *)(a1 + 32 + *(void *)(*(void *)(a1 + 32) - 24) + 32) == 0;
}

uint64_t sub_1D0E77364(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2) {
    std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24)), 0);
  }
  std::istream::tellg();
  if (*(_DWORD *)(a1 + 32 + *(void *)(*(void *)(a1 + 32) - 24) + 32)) {
    return -1;
  }
  std::istream::seekg();
  std::istream::tellg();
  uint64_t v3 = v5;
  std::istream::seekg();
  return v3;
}

uint64_t sub_1D0E7746C()
{
  return 1;
}

uint64_t sub_1D0E77474(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8) == 3 && *(_DWORD *)(a1 + 640) != 28)
  {
    uint64_t v2 = (void *)(a1 + 32);
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24)), *(_DWORD *)((char *)v2 + *(void *)(*v2 - 24) + 32) | 4);
    }
    *(_DWORD *)(a1 + 640) = 28;
    uint64_t v3 = std::filebuf::open();
    int v4 = (std::ios_base *)((char *)v2 + *(void *)(*(void *)(a1 + 32) - 24));
    if (v3) {
      std::ios_base::iostate v5 = 0;
    }
    else {
      std::ios_base::iostate v5 = v4->__rdstate_ | 4;
    }
    std::ios_base::clear(v4, v5);
  }
  uint64_t v6 = *(void *)(a1 + 24) + 16;
  return MEMORY[0x1F417E838](v6);
}

void sub_1D0E77560(uint64_t a1)
{
  if (!std::filebuf::close())
  {
    uint64_t v2 = (std::ios_base *)(a1 + 32 + *(void *)(*(void *)(a1 + 32) - 24));
    std::ios_base::iostate v3 = v2->__rdstate_ | 4;
    std::ios_base::clear(v2, v3);
  }
}

BOOL sub_1D0E775C8(uint64_t a1)
{
  return *(void *)(a1 + 176) != 0;
}

void sub_1D0E775D8(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4228;
  if (*(char *)(a1 + 639) < 0) {
    operator delete(*(void **)(a1 + 616));
  }
  *(void *)(a1 + 32) = &unk_1F26F4A68;
  *(void *)(a1 + 464) = off_1F26F4AB8;
  *(void *)(a1 + 48) = off_1F26F4A90;
  MEMORY[0x1D25F1350](a1 + 56);
  std::iostream::~basic_iostream();
  MEMORY[0x1D25F1640](a1 + 464);
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E776D0(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4228;
  if (*(char *)(a1 + 639) < 0) {
    operator delete(*(void **)(a1 + 616));
  }
  *(void *)(a1 + 32) = &unk_1F26F4A68;
  *(void *)(a1 + 464) = off_1F26F4AB8;
  *(void *)(a1 + 48) = off_1F26F4A90;
  MEMORY[0x1D25F1350](a1 + 56);
  std::iostream::~basic_iostream();
  MEMORY[0x1D25F1640](a1 + 464);
  return a1;
}

uint64_t sub_1D0E777A8(uint64_t a1, long long *a2, _DWORD *a3)
{
  *(_DWORD *)(a1 + 8) = *a3;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = a1 + 32;
  *(void *)a1 = &unk_1F26F4228;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = off_1F26F4A90;
  *(void *)(a1 + 32) = &unk_1F26F3BE0;
  *(void *)(a1 + 464) = &unk_1F26F3C08;
  std::ios_base::init((std::ios_base *)(a1 + 464), (void *)(a1 + 56));
  *(void *)(a1 + 600) = 0;
  *(_DWORD *)(a1 + 608) = -1;
  *(void *)(a1 + 32) = &unk_1F26F4A68;
  *(void *)(a1 + 464) = off_1F26F4AB8;
  *(void *)(a1 + 48) = off_1F26F4A90;
  MEMORY[0x1D25F1340](a1 + 56);
  uint64_t v6 = (unsigned char *)(a1 + 616);
  if (*((char *)a2 + 23) < 0)
  {
    sub_1D0DCB370(v6, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    *(void *)(a1 + 632) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v6 = v7;
  }
  *(_DWORD *)(a1 + 640) = 0;
  if (*a3 == 3)
  {
    cva::Path::Path();
    char v8 = cva::Path::exists((cva::Path *)v14);
    cva::Path::~Path((cva::Path *)v14);
    if ((v8 & 1) == 0)
    {
      v14[0] = 2;
      (*(void (**)(uint64_t, _DWORD *))(*(void *)a1 + 136))(a1, v14);
    }
  }
  if (((*(uint64_t (**)(uint64_t, _DWORD *))(*(void *)a1 + 136))(a1, a3) & 1) == 0)
  {
    sub_1D0E5C8F8(&v12);
    if (*((char *)a2 + 23) >= 0) {
      LOBYTE(v9) = (_BYTE)a2;
    }
    else {
      std::ios_base::iostate v9 = *(void **)a2;
    }
    sub_1D0E5E098((uint64_t)v14, &v12, 0, 0, "[RELEASE ERROR  ]", "/Library/Caches/com.apple.xbs/Sources/AppleCVA/shared/src/modules/avatar/shrek/libs/alg/utils/src/fsFileDevice.cpp", 48, "Could not open file device %s", (char)v9);
    sub_1D0E6054C((uint64_t)v14);
    uint64_t v10 = v13;
    if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return a1;
}

uint64_t sub_1D0E77A40(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)(a1 + 8) = *a2;
  return 1;
}

uint64_t sub_1D0E77A50(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    return 0;
  }
  if ((*(uint64_t (**)(void *))(*a1 + 104))(a1) < a2) {
    return 0;
  }
  a1[2] = a2;
  return 1;
}

uint64_t sub_1D0E77AC0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 128))(a1, 0);
}

void sub_1D0E77AE8(_DWORD *a1)
{
  if (a1[2] == 2) {
    operator new();
  }
  (*(void (**)(_DWORD *))(*(void *)a1 + 112))(a1);
  sub_1D0E765E0();
}

uint64_t sub_1D0E77C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = -1;
  if ((a3 & 0x8000000000000000) == 0 && *(_DWORD *)(a1 + 8) != 2)
  {
    uint64_t v3 = 0;
    if (a2)
    {
      if (a3)
      {
        uint64_t v7 = *(void *)(a1 + 16);
        (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 128))(a1, v7);
        if (*(_DWORD *)(a1 + 8) == 2)
        {
          uint64_t v3 = -1;
        }
        else
        {
          uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 144))(a1, a2, a3);
          uint64_t v3 = v8;
          if (v8 >= 1) {
            *(void *)(a1 + 16) += v8;
          }
        }
        (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 128))(a1, v7);
      }
    }
  }
  return v3;
}

uint64_t sub_1D0E77D70(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    return -1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v3 = a1[2];
  uint64_t v4 = v3 + a2;
  uint64_t v5 = (*(uint64_t (**)(void *))(*a1 + 104))(a1);
  if (v4 >= v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  if (v4 >= 0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((*(unsigned int (**)(void *, uint64_t))(*a1 + 128))(a1, v7)) {
    return a1[2] - v3;
  }
  else {
    return -1;
  }
}

void sub_1D0E77E2C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(_DWORD *)(a1 + 8) == 2)
  {
    *(unsigned char *)(a2 + 23) = 0;
    *(unsigned char *)a2 = 0;
  }
  else
  {
    std::string::value_type __c = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    *(void *)a2 = 0;
    do
    {
      if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1)) {
        break;
      }
      if (*(_DWORD *)(a1 + 8) == 2) {
        break;
      }
      uint64_t v4 = (*(uint64_t (**)(uint64_t, std::string::value_type *, uint64_t))(*(void *)a1 + 144))(a1, &__c, 1);
      if (v4 < 1) {
        break;
      }
      *(void *)(a1 + 16) += v4;
      if (v4 != 1) {
        break;
      }
      std::string::push_back((std::string *)a2, __c);
    }
    while (__c != 10);
  }
}

void sub_1D0E77F18(_DWORD *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_1D0E77F28(uint64_t a1, _DWORD *a2)
{
  if (a2[2] == 2) {
    operator new();
  }
  (*(void (**)(_DWORD *))(*(void *)a2 + 112))(a2);
  sub_1D0E765E0();
}

uint64_t sub_1D0E780A4()
{
  return 0;
}

uint64_t sub_1D0E780AC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    return *(unsigned int *)((char *)v1 + *(void *)(*v1 - 24) + 32);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

BOOL sub_1D0E780DC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (!v1) {
    return 1;
  }
  std::ios_base::clear((std::ios_base *)((char *)v1 + *(void *)(*v1 - 24)), 0);
  std::istream::seekg();
  uint64_t v3 = *(void *)(a1 + 16);
  std::istream::tellg();
  return v3 >= v5;
}

void sub_1D0E78188(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F42D8;
  *(void *)(a1 + 24) = &unk_1F26F43A8;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(uint64_t **)(a1 + 48);
    if (v2)
    {
      uint64_t v3 = sub_1D0E76720(v2);
      MEMORY[0x1D25F16B0](v3, 0x20C4093837F09);
    }
    *(void *)(a1 + 48) = 0;
  }
  *(void *)a1 = &unk_1F26F4208;
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    *(void *)(a1 + 8) = 0;
  }
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E78288(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F42D8;
  *(void *)(a1 + 24) = &unk_1F26F43A8;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(uint64_t **)(a1 + 48);
    if (v2)
    {
      uint64_t v3 = sub_1D0E76720(v2);
      MEMORY[0x1D25F16B0](v3, 0x20C4093837F09);
    }
    *(void *)(a1 + 48) = 0;
  }
  *(void *)a1 = &unk_1F26F4208;
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

uint64_t sub_1D0E78368(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 48))();
  }
  return result;
}

void sub_1D0E78398(void *a1)
{
  *a1 = &unk_1F26F4160;
  uint64_t v1 = a1 + 1;
  uint64_t v2 = (void *)a1[4];
  if (v2 == v1)
  {
    (*(void (**)(void *))(*v1 + 32))(v1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  JUMPOUT(0x1D25F16B0);
}

void *sub_1D0E7845C(void *a1)
{
  *a1 = &unk_1F26F4160;
  uint64_t v2 = a1 + 1;
  uint64_t v3 = (void *)a1[4];
  if (v3 == v2)
  {
    (*(void (**)(void *))(*v2 + 32))(v2);
  }
  else if (v3)
  {
    (*(void (**)(void *))(*v3 + 40))(v3);
  }
  return a1;
}

void sub_1D0E78500(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  uint64_t v7 = *a2;
  uint64_t v8 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 24))(a1, &v7);
  uint64_t v6 = v8;
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  *(unsigned char *)(a1 + 120) = 1;
  std::mutex::unlock(v4);
  std::condition_variable::notify_one((std::condition_variable *)(a1 + 72));
}

uint64_t sub_1D0E785EC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 152);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 48))();
  }
  return result;
}

void sub_1D0E7861C(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4568;
  uint64_t v2 = a1 + 128;
  uint64_t v3 = *(void *)(a1 + 152);
  if (v3 == v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  }
  else if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  *(void *)a1 = &unk_1F26F41D8;
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 72));
  std::mutex::~mutex((std::mutex *)(a1 + 8));
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E78710(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4568;
  uint64_t v2 = a1 + 128;
  uint64_t v3 = *(void *)(a1 + 152);
  if (v3 == v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  }
  else if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  *(void *)a1 = &unk_1F26F41D8;
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 72));
  std::mutex::~mutex((std::mutex *)(a1 + 8));
  return a1;
}

uint64_t sub_1D0E787E8(uint64_t result)
{
  uint64_t v1 = *(void ***)(result + 24);
  if (v1)
  {
    if (*v1) {
      os_release(*v1);
    }
    JUMPOUT(0x1D25F16B0);
  }
  return result;
}

void sub_1D0E78848(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E78884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 24);
  uint64_t v4 = (void *)*v3;
  if (*(_DWORD *)(*v3 + 8) == 1) {
    return -1;
  }
  uint64_t v6 = v3[4] + v3[3] - v4[2];
  if (v6 < a3) {
    a3 = v6;
  }
  uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t))(*v4 + 152))(v4, a2, a3);
  if (result >= 1) {
    v4[2] += result;
  }
  return result;
}

uint64_t sub_1D0E78910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 24);
  uint64_t v4 = (void *)*v3;
  if (*(_DWORD *)(*v3 + 8) == 2) {
    return -1;
  }
  uint64_t v6 = v3[4] + v3[3] - v4[2];
  if (v6 < a3) {
    a3 = v6;
  }
  uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t))(*v4 + 144))(v4, a2, a3);
  if (result >= 1) {
    v4[2] += result;
  }
  return result;
}

uint64_t sub_1D0E7899C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0 || (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1) < a2) {
    return 0;
  }
  *(void *)(a1 + 16) = a2;
  uint64_t v5 = *(uint64_t (**)(void))(***(void ***)(a1 + 24) + 128);
  return v5();
}

uint64_t sub_1D0E78A44(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 24) + 32);
}

BOOL sub_1D0E78A50(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1) == *(void *)(a1 + 16)
      && *(void *)(**(void **)(a1 + 24) + 16) >= *(void *)(*(void *)(a1 + 24) + 32)
                                                     + *(void *)(*(void *)(a1 + 24) + 24);
}

void sub_1D0E78AC4(void *a1)
{
  *a1 = &unk_1F26F42F8;
  uint64_t v1 = a1[3];
  if (v1)
  {
    uint64_t v2 = *(std::__shared_weak_count **)(v1 + 16);
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
    MEMORY[0x1D25F16B0](v1, 0x1060C40484961F0);
  }
  JUMPOUT(0x1D25F16B0);
}

void *sub_1D0E78B94(void *a1)
{
  *a1 = &unk_1F26F42F8;
  uint64_t v2 = a1[3];
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 16);
    if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    MEMORY[0x1D25F16B0](v2, 0x1060C40484961F0);
  }
  return a1;
}

void sub_1D0E78C44(uint64_t a1)
{
  sub_1D0E78C7C(a1);
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E78C7C(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4548;
  sub_1D0E78DA0(a1, 0);
  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t v2 = *(void *)(a1 + 120);
    if (v2)
    {
      uint64_t v3 = *(std::__shared_weak_count **)(v2 + 8);
      if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
      MEMORY[0x1D25F16B0](v2, 0x1020C407E10CFCBLL);
    }
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 112);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  std::mutex::~mutex((std::mutex *)(a1 + 40));
  std::thread::~thread((std::thread *)(a1 + 32));
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 24);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  return a1;
}

void sub_1D0E78DA0(uint64_t a1, int a2)
{
  if (a2) {
    unsigned int v3 = 2;
  }
  else {
    unsigned int v3 = 1;
  }
  atomic_store(v3, (unsigned int *)(a1 + 8));
  uint64_t v4 = (std::mutex *)(a1 + 40);
  std::mutex::lock((std::mutex *)(a1 + 40));
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 24);
  if (v5)
  {
    uint64_t v6 = std::__shared_weak_count::lock(v5);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)(a1 + 16);
      if (v8)
      {
        std::mutex::lock((std::mutex *)(v8 + 16));
        std::condition_variable::notify_all((std::condition_variable *)(v8 + 80));
        std::mutex::unlock((std::mutex *)(v8 + 16));
      }
      if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  std::mutex::unlock(v4);
  uint64_t v10 = *(void *)(a1 + 32);
  std::ios_base::iostate v9 = (std::thread *)(a1 + 32);
  if (v10)
  {
    std::thread::join(v9);
  }
}

uint64_t **sub_1D0E78EA4(uint64_t **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (!v2) {
    return a1;
  }
  if (*((unsigned char *)v2 + 80))
  {
    unsigned int v3 = (std::__shared_weak_count *)v2[9];
    if (v3)
    {
      if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
        if ((*((char *)v2 + 39) & 0x80000000) == 0) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
    }
  }
  if (*((char *)v2 + 39) < 0) {
LABEL_6:
  }
    operator delete((void *)v2[2]);
LABEL_7:
  uint64_t v4 = *v2;
  uint64_t *v2 = 0;
  if (v4)
  {
    uint64_t v5 = MEMORY[0x1D25F1470]();
    MEMORY[0x1D25F16B0](v5, 0x20C4093837F09);
  }
  MEMORY[0x1D25F16B0](v2, 0x1032C40E68F9261);
  return a1;
}

void sub_1D0E78F84(uint64_t *a1)
{
  uint64_t v4 = a1;
  long long v24 = a1;
  uint64_t v1 = std::__thread_local_data();
  uint64_t v2 = (const void *)*v4;
  uint64_t *v4 = 0;
  pthread_setspecific(v1->__key_, v2);
  uint64_t v3 = v4[1];
  sub_1D0E79318(v3, (uint64_t)(v4 + 2));
  long long v29 = (std::mutex *)(v3 + 40);
  char v30 = 1;
  std::mutex::lock((std::mutex *)(v3 + 40));
  LODWORD(v4) = 60000;
  do
  {
    uint64_t v5 = *(std::__shared_weak_count **)(v3 + 24);
    if (!v5) {
      break;
    }
    uint64_t v6 = std::__shared_weak_count::lock(v5);
    if (!v6) {
      break;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v3 + 16);
    if (!v8 || (unsigned int v9 = atomic_load((unsigned int *)(v3 + 8)), v9 == 1))
    {
      int v10 = 3;
      goto LABEL_8;
    }
    unsigned int v11 = atomic_load((unsigned int *)(v3 + 8));
    if (v11 == 2) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = (uint64_t *)v4;
    }
    uint64_t v27 = 0;
    long long v28 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t *, uint64_t *, std::mutex **))(*(void *)v8 + 24))(v8, &v27, v4, &v29))
    {
      if (!v30)
      {
        std::__throw_system_error(1, "unique_lock::unlock: not locked");
LABEL_45:
        std::__throw_system_error(1, "unique_lock::lock: references null mutex");
LABEL_46:
        std::__throw_system_error(11, "unique_lock::lock: already locked");
        sub_1D0E79318(v22, v23);
        return;
      }
      std::mutex::unlock(v29);
      char v30 = 0;
      uint64_t v12 = v27;
      uint64_t v13 = *(std::__shared_weak_count **)(v3 + 112);
      uint64_t v25 = *(void *)(v3 + 104);
      long long v26 = v13;
      if (v13) {
        atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(uint64_t, uint64_t *))(*(void *)v12 + 16))(v12, &v25);
      uint64_t v14 = v26;
      if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
      if (!v29) {
        goto LABEL_45;
      }
      if (v30) {
        goto LABEL_46;
      }
      std::mutex::lock(v29);
      char v30 = 1;
    }
    else
    {
      unsigned int v15 = atomic_load((unsigned int *)(v3 + 8));
      if (v15 == 2)
      {
        int v10 = 3;
        uint64_t v16 = v28;
        if (v28) {
          goto LABEL_27;
        }
        goto LABEL_8;
      }
    }
    int v10 = 0;
    uint64_t v16 = v28;
    if (v28)
    {
LABEL_27:
      if (!atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
LABEL_8:
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  while (!v10);
  if (v30) {
    std::mutex::unlock(v29);
  }
  if (*(unsigned char *)(v3 + 128))
  {
    uint64_t v17 = *(void *)(v3 + 120);
    if (*(unsigned char *)(v17 + 56))
    {
      os_workgroup_leave(**(os_workgroup_t **)v17, (os_workgroup_join_token_t)(v17 + 16));
      uint64_t v18 = *(void *)(v3 + 120);
      *(unsigned char *)(v18 + 56) = 0;
      uint64_t v19 = *(std::__shared_weak_count **)(v18 + 8);
      *(void *)uint64_t v18 = 0;
      *(void *)(v18 + 8) = 0;
      if (v19)
      {
        if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }
    }
    if (*(unsigned char *)(v3 + 128))
    {
      uint64_t v20 = *(void *)(v3 + 120);
      if (v20)
      {
        std::unique_lock<std::mutex> v21 = *(std::__shared_weak_count **)(v20 + 8);
        if (v21)
        {
          if (!atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
        MEMORY[0x1D25F16B0](v20, 0x1020C407E10CFCBLL);
      }
      *(unsigned char *)(v3 + 128) = 0;
    }
  }
  sub_1D0E78EA4(&v24);
}

void sub_1D0E79318(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    if (!*(void *)(a2 + 8)) {
      goto LABEL_7;
    }
    uint64_t v4 = *(const char **)a2;
    goto LABEL_6;
  }
  uint64_t v4 = (const char *)a2;
  if (*(unsigned char *)(a2 + 23)) {
LABEL_6:
  }
    pthread_setname_np(v4);
LABEL_7:
  uint64_t v5 = pthread_self();
  int v15 = 0;
  if (!pthread_getschedparam(v5, &v15, &v16))
  {
    uint64_t v6 = (sched_param *)(a2 + 32);
    if (!*(unsigned char *)(a2 + 36)) {
      uint64_t v6 = &v16;
    }
    int sched_priority = v6->sched_priority;
    uint64_t v8 = (int *)(a2 + 24);
    if (!*(unsigned char *)(a2 + 28)) {
      uint64_t v8 = &v15;
    }
    int v9 = *v8;
    v16.int sched_priority = sched_priority;
    pthread_setschedparam(v5, v9, &v16);
  }
  if (*(unsigned char *)(a2 + 41))
  {
    if (!*(unsigned char *)(a2 + 40))
    {
      pthread_set_timeshare_self();
      if (!*(unsigned char *)(a2 + 64)) {
        return;
      }
      goto LABEL_17;
    }
    pthread_set_fixedpriority_self();
  }
  if (!*(unsigned char *)(a2 + 64)) {
    return;
  }
LABEL_17:
  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t v10 = *(void *)(a1 + 120);
    if (*(unsigned char *)(v10 + 56))
    {
      os_workgroup_leave(**(os_workgroup_t **)v10, (os_workgroup_join_token_t)(v10 + 16));
      uint64_t v11 = *(void *)(a1 + 120);
      *(unsigned char *)(v11 + 56) = 0;
      uint64_t v12 = *(std::__shared_weak_count **)(v11 + 8);
      *(void *)uint64_t v11 = 0;
      *(void *)(v11 + 8) = 0;
      if (v12)
      {
        if (!atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
    if (*(unsigned char *)(a1 + 128))
    {
      uint64_t v13 = *(void *)(a1 + 120);
      if (v13)
      {
        uint64_t v14 = *(std::__shared_weak_count **)(v13 + 8);
        if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
        MEMORY[0x1D25F16B0](v13, 0x1020C407E10CFCBLL);
      }
      *(unsigned char *)(a1 + 128) = 0;
    }
  }
  if (*(void *)(a2 + 48)) {
    operator new();
  }
}

void sub_1D0E7965C(uint64_t a1)
{
}

void sub_1D0E79664(uint64_t a1, int a2)
{
  uint64_t v4 = **(void **)(a1 + 8);
  std::mutex::lock((std::mutex *)(v4 + 16));
  *(unsigned char *)(v4 + 128) = 1;
  std::mutex::unlock((std::mutex *)(v4 + 16));
  if ((a2 & 1) == 0)
  {
    (*(void (**)(void))(***(void ***)(a1 + 8) + 48))(**(void **)(a1 + 8));
    (*(void (**)(void))(***(void ***)(a1 + 8) + 40))(**(void **)(a1 + 8));
  }
  unint64_t v5 = *(void *)(*(void *)(a1 + 8) + 24) - *(void *)(*(void *)(a1 + 8) + 16);
  if ((int)(v5 >> 4) >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5 & 0xFFFFFFFF0;
    do
    {
      sub_1D0E78DA0(*(void *)(*(void *)(*(void *)(a1 + 8) + 16) + v6), a2);
      v6 += 16;
    }
    while (v7 != v6);
  }
}

uint64_t sub_1D0E79750(uint64_t a1)
{
  return (*(uint64_t (**)(void))(***(void ***)(a1 + 8) + 32))();
}

void sub_1D0E7977C(uint64_t a1)
{
  sub_1D0E797B4(a1);
  JUMPOUT(0x1D25F16B0);
}

uint64_t sub_1D0E797B4(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F37C8;
  uint64_t v2 = **(void **)(a1 + 8);
  std::mutex::lock((std::mutex *)(v2 + 16));
  *(unsigned char *)(v2 + 128) = 1;
  std::mutex::unlock((std::mutex *)(v2 + 16));
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(v3 + 24) - *(void *)(v3 + 16);
  if ((int)(v4 >> 4) >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v4 & 0xFFFFFFFF0;
    do
    {
      sub_1D0E78DA0(*(void *)(*(void *)(*(void *)(a1 + 8) + 16) + v5), 1);
      v5 += 16;
    }
    while (v6 != v5);
    uint64_t v3 = *(void *)(a1 + 8);
    if (!v3) {
      return a1;
    }
  }
  if (*(unsigned char *)(v3 + 104))
  {
    uint64_t v7 = *(std::__shared_weak_count **)(v3 + 96);
    if (v7)
    {
      if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
        if ((*(char *)(v3 + 63) & 0x80000000) == 0) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }
  if (*(char *)(v3 + 63) < 0) {
LABEL_9:
  }
    operator delete(*(void **)(v3 + 40));
LABEL_10:
  uint64_t v8 = *(void *)(v3 + 16);
  if (v8)
  {
    uint64_t v9 = *(void *)(v3 + 24);
    uint64_t v10 = *(void **)(v3 + 16);
    if (v9 != v8)
    {
      do
      {
        uint64_t v11 = *(std::__shared_weak_count **)(v9 - 8);
        if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
        v9 -= 16;
      }
      while (v9 != v8);
      uint64_t v10 = *(void **)(v3 + 16);
    }
    *(void *)(v3 + 24) = v8;
    operator delete(v10);
  }
  uint64_t v12 = *(std::__shared_weak_count **)(v3 + 8);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  MEMORY[0x1D25F16B0](v3, 0x1032C406B5009FBLL);
  return a1;
}

uint64_t sub_1D0E799C4(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_1D0E799E8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F26F5130;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

void sub_1D0E79A3C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F26F5130;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t sub_1D0E79A60(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_1D0E79A84(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F26F51A0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F16B0);
}

void sub_1D0E79AD8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F26F51A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1D0E79AF8(void *a1)
{
  *a1 = &unk_1F26F37C8;
  operator new();
}

void sub_1D0E7A558(uint64_t a1)
{
}

void sub_1D0E7A568(char *__p)
{
  if (__p[88])
  {
    uint64_t v2 = (std::__shared_weak_count *)*((void *)__p + 10);
    if (v2)
    {
      if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
        if ((__p[47] & 0x80000000) == 0) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
  }
  if (__p[47] < 0) {
LABEL_5:
  }
    operator delete(*((void **)__p + 3));
LABEL_6:
  uint64_t v3 = (std::__shared_weak_count *)*((void *)__p + 2);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  operator delete(__p);
}

void sub_1D0E7A650(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 88)
    || (uint64_t v2 = *(std::__shared_weak_count **)(a1 + 80)) == 0
    || atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((*(char *)(a1 + 47) & 0x80000000) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    operator delete(*(void **)(a1 + 24));
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
    if (!v3) {
      return;
    }
    goto LABEL_9;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  if (*(char *)(a1 + 47) < 0) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v3) {
    return;
  }
LABEL_9:
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

unsigned char *sub_1D0E7A744(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)a2 = &unk_1F26F4A18;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t result = (unsigned char *)(a2 + 24);
  if (*(char *)(a1 + 47) < 0)
  {
    uint64_t result = sub_1D0DCB370(result, *(void **)(a1 + 24), *(void *)(a1 + 32));
  }
  else
  {
    long long v7 = *(_OWORD *)(a1 + 24);
    *(void *)(a2 + 40) = *(void *)(a1 + 40);
    *(_OWORD *)uint64_t result = v7;
  }
  long long v8 = *(_OWORD *)(a1 + 48);
  *(_WORD *)(a2 + 64) = *(_WORD *)(a1 + 64);
  *(_OWORD *)(a2 + 48) = v8;
  *(unsigned char *)(a2 + 72) = 0;
  *(unsigned char *)(a2 + 88) = 0;
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v9 = *(void *)(a1 + 80);
    *(void *)(a2 + 72) = *(void *)(a1 + 72);
    *(void *)(a2 + 80) = v9;
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    *(unsigned char *)(a2 + 88) = 1;
  }
  return result;
}

void *sub_1D0E7A808(uint64_t a1)
{
  uint64_t v2 = operator new(0x60uLL);
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  void *v2 = &unk_1F26F4A18;
  v2[1] = v5;
  v2[2] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = v2 + 3;
  if (*(char *)(a1 + 47) < 0)
  {
    sub_1D0DCB370(v6, *(void **)(a1 + 24), *(void *)(a1 + 32));
  }
  else
  {
    *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 24);
    v3[5] = *(void *)(a1 + 40);
  }
  *((_OWORD *)v3 + 3) = *(_OWORD *)(a1 + 48);
  *((_WORD *)v3 + 32) = *(_WORD *)(a1 + 64);
  *((unsigned char *)v3 + 72) = 0;
  *((unsigned char *)v3 + 88) = 0;
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v7 = *(void *)(a1 + 80);
    v3[9] = *(void *)(a1 + 72);
    v3[10] = v7;
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    *((unsigned char *)v3 + 88) = 1;
  }
  return v3;
}

void sub_1D0E7A8D8(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4A18;
  if (*(unsigned char *)(a1 + 88)
    && (uint64_t v2 = *(std::__shared_weak_count **)(a1 + 80)) != 0
    && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    if ((*(char *)(a1 + 47) & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((*(char *)(a1 + 47) & 0x80000000) == 0)
  {
LABEL_6:
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
    if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    JUMPOUT(0x1D25F16B0);
  }
  operator delete(*(void **)(a1 + 24));
  goto LABEL_6;
}

uint64_t sub_1D0E7A9EC(uint64_t a1)
{
  *(void *)a1 = &unk_1F26F4A18;
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v2 = *(std::__shared_weak_count **)(a1 + 80);
    if (v2)
    {
      if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
        if ((*(char *)(a1 + 47) & 0x80000000) == 0) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
  }
  if (*(char *)(a1 + 47) < 0) {
LABEL_5:
  }
    operator delete(*(void **)(a1 + 24));
LABEL_6:
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  return a1;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
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

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1F40DBB30]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x1F40DBB38](retstr, clock);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD00](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFDB0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1F4124C48]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1F4124C78]();
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E93A8](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x1F4103340]();
}

uint64_t VTImageRotationSessionInvalidate()
{
  return MEMORY[0x1F4103348]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x1F4103360]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionCopyProperty(VTSessionRef session, CFStringRef propertyKey, CFAllocatorRef allocator, void *propertyValueOut)
{
  return MEMORY[0x1F4103520](session, propertyKey, allocator, propertyValueOut);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t cva::ItemHandler::createData(cva::ItemHandler *this, const __CFData *a2)
{
  return MEMORY[0x1F41138F0](this, a2);
}

void cva::ItemHandler::createValue<std::string>()
{
  while (1)
    ;
}

void cva::ItemHandler::createValue<BOOL>()
{
  while (1)
    ;
}

void cva::ItemHandler::createValue<double>()
{
  while (1)
    ;
}

void cva::ItemHandler::createValue<float>()
{
  while (1)
    ;
}

void cva::ItemHandler::createValue<int>()
{
  while (1)
    ;
}

void cva::ItemHandler::createValue<unsigned int>()
{
  while (1)
    ;
}

void cva::ItemHandler::createValue<unsigned long long>()
{
  while (1)
    ;
}

void cva::ItemHandler::createMatrix<float>()
{
  while (1)
    ;
}

void cva::ItemHandler::createVector<float>()
{
  while (1)
    ;
}

void cva::ItemHandler::createVector<int>()
{
  while (1)
    ;
}

void cva::ItemHandler::createVector<unsigned int>()
{
  while (1)
    ;
}

uint64_t cva::ItemHandler::ItemHandler(cva::ItemHandler *this, const void *a2)
{
  return MEMORY[0x1F41138F8](this, a2);
}

uint64_t cva::ItemHandler::ItemHandler()
{
  return MEMORY[0x1F4113900]();
}

{
  return MEMORY[0x1F4113908]();
}

void cva::ItemHandler::~ItemHandler(cva::ItemHandler *this)
{
}

uint64_t cva::ArrayHandler::addItem(cva::ArrayHandler *this, const cva::ItemHandler *a2)
{
  return MEMORY[0x1F4113918](this, a2);
}

uint64_t cva::ArrayHandler::ArrayHandler(cva::ArrayHandler *this)
{
  return MEMORY[0x1F4113920](this);
}

void cva::ArrayHandler::~ArrayHandler(cva::ArrayHandler *this)
{
}

uint64_t cva::DictionaryHandler::removeItem(cva::DictionaryHandler *this, const char *a2)
{
  return MEMORY[0x1F4113930](this, a2);
}

uint64_t cva::DictionaryHandler::readJsonFile()
{
  return MEMORY[0x1F4113938]();
}

uint64_t cva::DictionaryHandler::setItem(cva::DictionaryHandler *this, const __CFString *a2, const cva::ItemHandler *a3)
{
  return MEMORY[0x1F4113940](this, a2, a3);
}

uint64_t cva::DictionaryHandler::setItem(cva::DictionaryHandler *this, const char *a2, const cva::ItemHandler *a3)
{
  return MEMORY[0x1F4113948](this, a2, a3);
}

uint64_t cva::DictionaryHandler::DictionaryHandler()
{
  return MEMORY[0x1F4113950]();
}

uint64_t cva::DictionaryHandler::DictionaryHandler(cva::DictionaryHandler *this, __CFDictionary *a2)
{
  return MEMORY[0x1F4113958](this, a2);
}

uint64_t cva::DictionaryHandler::DictionaryHandler(cva::DictionaryHandler *this, const __CFDictionary *a2)
{
  return MEMORY[0x1F4113960](this, a2);
}

uint64_t cva::DictionaryHandler::DictionaryHandler(cva::DictionaryHandler *this)
{
  return MEMORY[0x1F4113968](this);
}

void cva::DictionaryHandler::~DictionaryHandler(cva::DictionaryHandler *this)
{
}

uint64_t cva::DictionaryHandler::operator=()
{
  return MEMORY[0x1F4113978]();
}

uint64_t cva::pixelBufferCreate(cva *this, uint64_t a2, uint64_t a3, uint64_t a4, __CVBuffer **a5, unsigned int a6, unsigned int a7, unsigned int a8, BOOL a9, BOOL a10)
{
  return MEMORY[0x1F4113980](this, a2, a3, a4, a5);
}

void cva::imageViewFromPixelBuffer<float>()
{
  while (1)
    ;
}

void cva::imageViewFromPixelBuffer<unsigned char>()
{
  while (1)
    ;
}

void cva::imageViewFromPixelBuffer<unsigned short>()
{
  while (1)
    ;
}

uint64_t cva::pixelBufferConvertARGBToYpCbCr()
{
  return MEMORY[0x1F4113988]();
}

void cva::createCVPixelBufferFromImageCopy<unsigned char>()
{
  while (1)
    ;
}

uint64_t cva::Path::concatenate()
{
  return MEMORY[0x1F4113990]();
}

uint64_t cva::Path::append()
{
  return MEMORY[0x1F4113998]();
}

uint64_t cva::Path::Path(cva::Path *this, const char *a2)
{
  return MEMORY[0x1F41139A0](this, a2);
}

uint64_t cva::Path::Path()
{
  return MEMORY[0x1F41139A8]();
}

uint64_t cva::Path::Path(cva::Path *this, const cva::Path *a2)
{
  return MEMORY[0x1F41139B0](this, a2);
}

void cva::Path::~Path(cva::Path *this)
{
}

uint64_t cva::utils::string::iends_with()
{
  return MEMORY[0x1F41139C0]();
}

uint64_t cva::utils::string::join()
{
  return MEMORY[0x1F41139C8]();
}

uint64_t cva::utils::string::split()
{
  return MEMORY[0x1F41139D0]();
}

uint64_t cva::utils::string::iequals()
{
  return MEMORY[0x1F41139D8]();
}

uint64_t cva::utils::string::to_lower()
{
  return MEMORY[0x1F41139E0]();
}

void cva::VecLib<float>::gemm()
{
  while (1)
    ;
}

uint64_t cva::Sprintf::sprintf(cva::Sprintf *this, const char *a2, ...)
{
  return MEMORY[0x1F4113A10](this, a2);
}

uint64_t cva::ItemHandler::getDictionary(cva::ItemHandler *this)
{
  return MEMORY[0x1F4113A30](this);
}

uint64_t cva::ItemHandler::isMatrixTypeOfSize(cva::ItemHandler *this)
{
  return MEMORY[0x1F4113A38](this);
}

uint64_t cva::ItemHandler::getData(cva::ItemHandler *this)
{
  return MEMORY[0x1F4113A40](this);
}

uint64_t cva::ItemHandler::getArray(cva::ItemHandler *this)
{
  return MEMORY[0x1F4113A48](this);
}

void cva::ItemHandler::getValue<std::string>()
{
  while (1)
    ;
}

void cva::ItemHandler::getValue<BOOL>()
{
  while (1)
    ;
}

void cva::ItemHandler::getValue<double>()
{
  while (1)
    ;
}

void cva::ItemHandler::getValue<float>()
{
  while (1)
    ;
}

void cva::ItemHandler::getValue<int>()
{
  while (1)
    ;
}

void cva::ItemHandler::getValue<unsigned int>()
{
  while (1)
    ;
}

void cva::ItemHandler::getValue<unsigned long long>()
{
  while (1)
    ;
}

void cva::ItemHandler::getMatrix<float>()
{
  while (1)
    ;
}

uint64_t cva::ItemHandler::getObject(cva::ItemHandler *this)
{
  return MEMORY[0x1F4113A50](this);
}

void cva::ItemHandler::getVector<float>()
{
  while (1)
    ;
}

void cva::ItemHandler::getVector<int>()
{
  while (1)
    ;
}

void cva::ItemHandler::getVector<unsigned int>()
{
  while (1)
    ;
}

uint64_t cva::ArrayHandler::item(cva::ArrayHandler *this)
{
  return MEMORY[0x1F4113A58](this);
}

uint64_t cva::ArrayHandler::size(cva::ArrayHandler *this)
{
  return MEMORY[0x1F4113A60](this);
}

uint64_t cva::DictionaryHandler::getDictionary(cva::DictionaryHandler *this)
{
  return MEMORY[0x1F4113A68](this);
}

uint64_t cva::DictionaryHandler::item(cva::DictionaryHandler *this, const __CFString *a2)
{
  return MEMORY[0x1F4113A70](this, a2);
}

uint64_t cva::DictionaryHandler::item(cva::DictionaryHandler *this, const char *a2)
{
  return MEMORY[0x1F4113A78](this, a2);
}

uint64_t cva::DictionaryHandler::hasKey(cva::DictionaryHandler *this, const __CFString *a2)
{
  return MEMORY[0x1F4113A80](this, a2);
}

uint64_t cva::DictionaryHandler::hasKey(cva::DictionaryHandler *this, const char *a2)
{
  return MEMORY[0x1F4113A88](this, a2);
}

uint64_t cva::DictionaryHandler::getKeys(cva::DictionaryHandler *this)
{
  return MEMORY[0x1F4113A90](this);
}

uint64_t cva::Path::isAbsolute(cva::Path *this)
{
  return MEMORY[0x1F4113A98](this);
}

uint64_t cva::Path::isDirectory(cva::Path *this)
{
  return MEMORY[0x1F4113AA0](this);
}

uint64_t cva::Path::isRegularFile(cva::Path *this)
{
  return MEMORY[0x1F4113AA8](this);
}

uint64_t cva::Path::stem(cva::Path *this)
{
  return MEMORY[0x1F4113AB0](this);
}

uint64_t cva::Path::exists(cva::Path *this)
{
  return MEMORY[0x1F4113AB8](this);
}

uint64_t cva::Path::string(cva::Path *this)
{
  return MEMORY[0x1F4113AC0](this);
}

uint64_t cva::Path::absolute(cva::Path *this)
{
  return MEMORY[0x1F4113AC8](this);
}

uint64_t cva::Path::filename(cva::Path *this)
{
  return MEMORY[0x1F4113AD0](this);
}

uint64_t cva::Path::directory(cva::Path *this)
{
  return MEMORY[0x1F4113AD8](this);
}

uint64_t cva::Path::extension(cva::Path *this)
{
  return MEMORY[0x1F4113AE0](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1F417E4A0](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E5D0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x1F417E6D0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1F417E728]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1F417E730]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1F417E740]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1F417E748]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1F417E768]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x1F417E778]();
}

{
  return MEMORY[0x1F417E780]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x1F417E788]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1F417E7D8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1F417E840]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E878]();
}

{
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E890]();
}

{
  return MEMORY[0x1F417E898]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x1F417E968](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x1F417E9B0]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::__assoc_sub_state::wait(std::__assoc_sub_state *this)
{
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x1F417EAA0]();
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

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1F417EC90]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1F417ECA0]();
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x1F417ECA8](__t);
}

void std::locale::~locale(std::locale *this)
{
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
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::rethrow_exception(std::exception_ptr a1)
{
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

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  MEMORY[0x1F40C9BF0]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  result.columns[1] = v2;
  result.columns[0] = v1;
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x1F40C9BF8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__float cosval = v2;
  result.__sinval = v1;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

float acosf(float a1)
{
  MEMORY[0x1F40CA340](a1);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x1F40CA3D8](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

uint64_t c_network_get_input_names()
{
  return MEMORY[0x1F4117FD8]();
}

uint64_t c_network_get_output_names()
{
  return MEMORY[0x1F4117FF0]();
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1F40CBD88]();
}

uint64_t e5rt_buffer_object_create_from_iosurface()
{
  return MEMORY[0x1F4118068]();
}

uint64_t e5rt_buffer_object_get_iosurface()
{
  return MEMORY[0x1F4118080]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x1F4118098]();
}

uint64_t e5rt_e5_compiler_compile()
{
  return MEMORY[0x1F41180B8]();
}

uint64_t e5rt_e5_compiler_create()
{
  return MEMORY[0x1F41180D0]();
}

uint64_t e5rt_e5_compiler_options_create()
{
  return MEMORY[0x1F41180E0]();
}

uint64_t e5rt_e5_compiler_options_release()
{
  return MEMORY[0x1F4118100]();
}

uint64_t e5rt_e5_compiler_options_set_compute_device_types_mask()
{
  return MEMORY[0x1F4118118]();
}

uint64_t e5rt_e5_compiler_release()
{
  return MEMORY[0x1F41181A0]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x1F41181C8]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x1F41181D8]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x1F41181E8]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x1F4118228]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x1F4118230]();
}

uint64_t e5rt_execution_stream_operation_get_input_names()
{
  return MEMORY[0x1F4118250]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x1F4118268]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x1F4118278]();
}

uint64_t e5rt_execution_stream_operation_get_output_names()
{
  return MEMORY[0x1F4118288]();
}

uint64_t e5rt_execution_stream_operation_prepare_op_for_encode()
{
  return MEMORY[0x1F4118298]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x1F41182A8]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x1F41182E0]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x1F41182F0]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x1F4118308]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x1F4118318]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x1F4118360]();
}

uint64_t e5rt_io_port_is_tensor()
{
  return MEMORY[0x1F4118390]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x1F4118398]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x1F41183C0]();
}

uint64_t e5rt_precompiled_compute_op_create_options_create_with_program_function()
{
  return MEMORY[0x1F41183E8]();
}

uint64_t e5rt_precompiled_compute_op_create_options_release()
{
  return MEMORY[0x1F4118400]();
}

uint64_t e5rt_program_function_release()
{
  return MEMORY[0x1F4118458]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x1F4118498]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x1F41184A0]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x1F4118500]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x1F4118538]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_pack()
{
  return MEMORY[0x1F4118540]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x1F4118550]();
}

uint64_t e5rt_tensor_desc_dtype_get_element_size()
{
  return MEMORY[0x1F4118558]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x1F4118560]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x1F4118570]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x1F4118590]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x1F41185A0]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x1F41185B0]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x1F41185B8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1F4118648]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1F4118668]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1F4118678]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x1F41186D8]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1F41186E0]();
}

uint64_t espresso_network_declare_input()
{
  return MEMORY[0x1F4118760]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x1F4118770]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1F41187A0]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1F41187D8]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1F41187F0]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

float hypotf(float a1, float a2)
{
  MEMORY[0x1F40CC640](a1, a2);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1F40CCBA0](memptr, alignment, size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

float nextafterf(float a1, float a2)
{
  MEMORY[0x1F40CD000](a1, a2);
  return result;
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_workgroup_attr_set_flags()
{
  return MEMORY[0x1F40CD678]();
}

uint64_t os_workgroup_create()
{
  return MEMORY[0x1F40CD6A0]();
}

int os_workgroup_join(os_workgroup_t wg, os_workgroup_join_token_t token_out)
{
  return MEMORY[0x1F40CD6F8](wg, token_out);
}

void os_workgroup_leave(os_workgroup_t wg, os_workgroup_join_token_t token)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

uint64_t pthread_set_fixedpriority_self()
{
  return MEMORY[0x1F40CDB40]();
}

uint64_t pthread_set_timeshare_self()
{
  return MEMORY[0x1F40CDB50]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1F40CDB68](a1, *(void *)&a2, a3);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int sched_get_priority_min(int a1)
{
  return MEMORY[0x1F40CDEC0](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
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

float tanf(float a1)
{
  MEMORY[0x1F40CE428](a1);
  return result;
}

kern_return_t thread_policy_get(thread_inspect_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return MEMORY[0x1F40CE538](*(void *)&thread, *(void *)&flavor, policy_info, policy_infoCnt, get_default);
}

void uuid_generate(uuid_t out)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C78](src, dest, rotationConstant, backColor, *(void *)&flags);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}