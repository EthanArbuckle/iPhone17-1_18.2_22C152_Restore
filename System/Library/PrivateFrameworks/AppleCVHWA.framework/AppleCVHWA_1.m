void *sub_2194E1AB4(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (***v5)(void);
  void (***v6)(void);
  void *v7;
  void (***v8)(void);
  void (***v9)(void);
  void (***v10)(void);
  void (**v11)(void);
  BOOL v12;
  void *v13;
  void *v14;

  v2 = (void *)a1[32];
  a1[32] = 0;
  if (v2) {
    sub_2194C9AB0((uint64_t)(a1 + 32), v2);
  }
  v3 = (void *)a1[31];
  a1[31] = 0;
  if (v3)
  {
    v4 = (void *)v3[9];
    if (v4)
    {
      v3[10] = v4;
      operator delete(v4);
    }
    v5 = (void (***)(void))v3[6];
    if (v5)
    {
      v6 = (void (***)(void))v3[7];
      v7 = (void *)v3[6];
      if (v6 != v5)
      {
        v8 = v6 - 18;
        v9 = v6 - 18;
        v10 = v6 - 18;
        do
        {
          v11 = *v10;
          v10 -= 18;
          (*v11)(v9);
          v8 -= 18;
          v12 = v9 == v5;
          v9 = v10;
        }
        while (!v12);
        v7 = (void *)v3[6];
      }
      v3[7] = v5;
      operator delete(v7);
    }
    MEMORY[0x21D48B5B0](v3, 0x1020C4024B85F43);
  }
  v13 = (void *)a1[28];
  if (v13)
  {
    a1[29] = v13;
    operator delete(v13);
  }
  v14 = (void *)a1[25];
  if (v14)
  {
    a1[26] = v14;
    operator delete(v14);
  }
  return a1;
}

void *sub_2194E1BB8(void *result, char *__src, char *a3, size_t __sz)
{
  v6 = __src;
  v7 = result;
  uint64_t v8 = result[2];
  v9 = (char *)*result;
  if (__sz > (v8 - *result) >> 2)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (__sz >> 62) {
      goto LABEL_22;
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= __sz) {
      uint64_t v10 = __sz;
    }
    BOOL v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v11) {
      unint64_t v12 = v10;
    }
    if (v12 >> 62) {
LABEL_22:
    }
      sub_219486AE4();
    uint64_t v13 = 4 * v12;
    result = operator new(4 * v12);
    v9 = (char *)result;
    void *v7 = result;
    v7[1] = result;
    v7[2] = (char *)result + v13;
    size_t v14 = a3 - v6;
    if (v14) {
      result = memcpy(result, v6, v14);
    }
    v15 = (void **)(v7 + 1);
    goto LABEL_21;
  }
  v15 = (void **)(result + 1);
  v16 = (unsigned char *)result[1];
  unint64_t v17 = (v16 - v9) >> 2;
  if (v17 >= __sz)
  {
    size_t v14 = a3 - __src;
    if (a3 == __src) {
      goto LABEL_21;
    }
    v19 = (void *)*result;
LABEL_20:
    result = memmove(v19, __src, v14);
    goto LABEL_21;
  }
  v18 = &__src[4 * v17];
  if (v16 != v9)
  {
    result = memmove((void *)*result, __src, v16 - v9);
    v9 = (char *)*v15;
  }
  size_t v14 = a3 - v18;
  if (v14)
  {
    v19 = v9;
    __src = v18;
    goto LABEL_20;
  }
LABEL_21:
  *v15 = &v9[v14];
  return result;
}

void sub_2194E1D04(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

uint64_t sub_2194E1D3C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    JUMPOUT(0x21D48B570);
  }
  return result;
}

uint64_t sub_2194E1D5C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "N4cv3d3vio8cv_types12ArrayDeleterIhEE") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"N4cv3d3vio8cv_types12ArrayDeleterIhEE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "N4cv3d3vio8cv_types12ArrayDeleterIhEE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"N4cv3d3vio8cv_types12ArrayDeleterIhEE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t sub_2194E1DD0(uint64_t a1)
{
  BOOL v1 = (*(_DWORD *)a1 | 2) == 2 && *(unsigned char *)(a1 + 120) != 0;
  if (*(unsigned char *)(a1 + 224)) {
    int v2 = v1;
  }
  else {
    int v2 = 1;
  }
  if (*(unsigned char *)(a1 + 225)) {
    BOOL v1 = v2;
  }
  if (*(_DWORD *)a1) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned char *)(a1 + 224) == 0;
  }
  int v4 = !v3 || v1;
  if (*(unsigned char *)(a1 + 224))
  {
    unsigned int v5 = *(_DWORD *)(a1 + 240);
    if (*(_DWORD *)(a1 + 244) <= 0x100u)
    {
      BOOL v6 = v5 >= 0x4000;
      BOOL v7 = v5 == 0x4000;
    }
    else
    {
      BOOL v6 = 1;
      BOOL v7 = 0;
    }
    int v8 = !v7 && v6;
    float v9 = *(float *)(a1 + 296);
    if (v9 < 0.0) {
      int v8 = 1;
    }
    if (v9 > 1.0) {
      int v8 = 1;
    }
    if (*(_DWORD *)(a1 + 232) > 0x200u) {
      int v8 = 1;
    }
    v4 |= v8;
  }
  unsigned int v10 = v4 ^ 1;
  if (*(_DWORD *)(a1 + 64) < 0x40u) {
    return v10;
  }
  else {
    return 0;
  }
}

BOOL sub_2194E1E6C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 < 0xA0) {
    return 0;
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 < 0xA0) {
    return 0;
  }
  if ((*(_DWORD *)a1 | 2) == 2)
  {
    if (v1 > 0x280) {
      return 0;
    }
  }
  else if (v1 > 0x1000)
  {
    return 0;
  }
  if (v3 > 0x2000) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 225)) {
    BOOL v4 = *(unsigned char *)(a1 + 224) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  return !v4;
}

float sub_2194E1EE8(unint64_t a1, unint64_t a2, void *a3)
{
  memset(v16, 0, sizeof(v16));
  v17[0] = xmmword_21950D640;
  v17[1] = xmmword_21950D650;
  uint64_t v18 = 10;
  if (a2 <= 2) {
    sub_219509D78();
  }
  if (a2 - 2 >= 9) {
    sub_219509D40();
  }
  unint64_t v6 = a2 - 3;
  a3[7] = 0;
  *(_OWORD *)(a3 + 5) = 0u;
  *(_OWORD *)(a3 + 3) = 0u;
  if (a2 - 3 >= 3)
  {
    memcpy(a3 + 3, v17, 8 * a2 - 40);
    unint64_t v7 = a2 - 5;
    if (a2 - 5 < 4) {
      goto LABEL_14;
    }
    v6 -= v7 & 0xFFFFFFFFFFFFFFFCLL;
    int64x2_t v8 = 0uLL;
    int64x2_t v9 = (int64x2_t)a1;
    unsigned int v10 = (int8x16_t *)&v16[a2 - 6];
    unint64_t v11 = v7 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      int8x16_t v13 = *v10;
      int8x16_t v12 = v10[1];
      v10 -= 2;
      int64x2_t v9 = vsubq_s64(v9, (int64x2_t)vextq_s8(v12, v12, 8uLL));
      int64x2_t v8 = vsubq_s64(v8, (int64x2_t)vextq_s8(v13, v13, 8uLL));
      v11 -= 4;
    }
    while (v11);
    a1 = vaddvq_s64(vaddq_s64(v8, v9));
    if (v7 != (v7 & 0xFFFFFFFFFFFFFFFCLL))
    {
LABEL_14:
      do
        a1 -= v16[v6--];
      while (v6 > 2);
    }
  }
  unint64_t v14 = (unint64_t)(float)((float)a1 * 0.21);
  a3[2] = v14;
  float result = (float)a1 * 0.25;
  *a3 = a1 - (v14 + (unint64_t)result);
  a3[1] = (unint64_t)result;
  return result;
}

void sub_2194E2040(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5, float a6)
{
  unint64_t v6 = a3 - 2;
  if (a3 <= 2) {
    sub_219509E20();
  }
  if (v6 > 8) {
    sub_219509DE8();
  }
  uint64_t v8 = 0;
  unint64_t v9 = a4 >> 5;
  unint64_t v10 = a4;
  do
  {
    unint64_t v11 = *(void *)(a1 + 8 * v8);
    uint64_t v12 = *(void *)(a2 + 24 * v8 + 8);
    int8x16_t v13 = *(const void **)(a2 + 24 * v8);
    int64_t v14 = v12 - (void)v13;
    if (v12 - (uint64_t)v13 < 0) {
      sub_219486AE4();
    }
    unint64_t v15 = v14 >> 2;
    v16 = (char *)operator new(v12 - (void)v13);
    memcpy(v16, v13, v14);
    unint64_t v17 = &v16[(v14 & 0xFFFFFFFFFFFFFFFCLL) - 4];
    if (v17 != v16)
    {
      int v18 = *(_DWORD *)v17;
      uint64_t v19 = 4 * v15;
      v20 = v16 - 8;
      do
      {
        v18 += *(_DWORD *)&v20[v19];
        *(_DWORD *)&v20[v19] = v18;
        v19 -= 4;
      }
      while (v19 != 4);
    }
    unint64_t v21 = (unint64_t)(float)((float)v11 * a6);
    if (v15 <= v9) {
      unint64_t v22 = v15 - 1;
    }
    else {
      unint64_t v22 = v9;
    }
    unint64_t v23 = v10;
    if (*(unsigned int *)&v16[4 * v22] >= v21)
    {
      uint64_t v24 = 32 * (v22 + 1);
      if (v22 + 1 >= v15)
      {
LABEL_17:
        unint64_t v23 = v24 - 32 * v21 / *(unsigned int *)v17;
      }
      else
      {
        v25 = &v16[4 * v22 + 4];
        unint64_t v26 = ~v22 + v15;
        while (1)
        {
          unint64_t v27 = *(unsigned int *)v25;
          uint64_t v28 = v21 - v27;
          if (v21 > v27) {
            break;
          }
          v24 += 32;
          v25 += 4;
          if (!--v26)
          {
            uint64_t v24 = 8 * v14;
            goto LABEL_17;
          }
        }
        unint64_t v29 = (*((_DWORD *)v25 - 1) - v27);
        if (v24 - 32 * v28 / v29 <= v10) {
          unint64_t v23 = v10;
        }
        else {
          unint64_t v23 = v24 - 32 * v28 / v29;
        }
      }
    }
    *(void *)(a5 + 8 * v8) = v23;
    operator delete(v16);
    if (*(void *)(a5 + 8 * v8) < v10) {
      sub_219509DB0();
    }
    ++v8;
  }
  while (v8 != v6);
}

void sub_2194E2220(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2194E223C(unsigned int a1, unsigned int a2)
{
  if (a1 - 160 >= 0xF61) {
    sub_219509E90();
  }
  if (a2 - 160 >= 0x1F61) {
    sub_219509E58();
  }
  if (a2 > 0x140 && a1 > 0x140) {
    return 5;
  }
  else {
    return 4;
  }
}

uint64_t sub_2194E2288(unsigned int a1, unsigned int a2)
{
  if (a1 > 0x2000) {
    sub_219509F00();
  }
  if (a2 >= 5) {
    sub_219509EC8();
  }
  return (a1 + (1 << a2) - 1) >> a2;
}

void sub_2194E22C8(unsigned __int32 a1, unsigned __int32 a2, int a3, int a4, unsigned int *a5, double a6, uint32x4_t a7)
{
  unint64_t v7 = a5;
  unsigned int v12 = a2 - a1;
  if (a2 <= a1)
  {
    if (*a5 != 1) {
      sub_219509F70();
    }
    if (!a4) {
      return;
    }
LABEL_83:
    v7[497] = 32;
    v7[507] = 20;
    v7[499] = 16;
    v7[509] = 20;
    v7[501] = 8;
    v7[511] = 20;
    v7[503] = 4;
    v7[513] = 20;
    uint32x4_t v95 = (uint32x4_t)xmmword_21950D680;
    *(_OWORD *)(v7 + 517) = xmmword_21950D680;
    v7[505] = 4;
    v7[515] = 10;
    v7[521] = 2;
    uint64_t v96 = *v7;
    if (v96 < 2) {
      goto LABEL_139;
    }
    if (v96 >= 4)
    {
      uint64_t v97 = v96 & 0xFFFFFFFC;
      uint32x4_t v95 = 0uLL;
      v99 = (__int32 *)(v7 + 207);
      uint64_t v100 = v97;
      a7 = 0uLL;
      do
      {
        v101.i32[0] = *(v99 - 30);
        v101.i32[1] = *(v99 - 20);
        v102.i32[0] = *(v99 - 10);
        v102.i32[1] = *v99;
        *(int32x2_t *)v95.i8 = vmax_s32(v101, *(int32x2_t *)v95.i8);
        *(int32x2_t *)a7.i8 = vmax_s32(v102, *(int32x2_t *)a7.i8);
        v99 += 40;
        v100 -= 4;
      }
      while (v100);
      int32x2_t v103 = vmax_s32(*(int32x2_t *)v95.i8, *(int32x2_t *)a7.i8);
      *(int32x2_t *)v95.i8 = vpmax_s32(v103, v103);
      int v98 = v95.i32[0];
      if (v97 == v96) {
        goto LABEL_93;
      }
    }
    else
    {
      uint64_t v97 = 0;
      int v98 = 0;
    }
    v104 = &v7[10 * v97 + 177];
    uint64_t v105 = v96 - v97;
    do
    {
      int v107 = *v104;
      v104 += 10;
      int v106 = v107;
      if (v107 > v98) {
        int v98 = v106;
      }
      --v105;
    }
    while (v105);
LABEL_93:
    if (v98 > 0) {
      v7[497] = (v98 + 19) / 20;
    }
    if (v96 >= 4)
    {
      uint64_t v108 = v96 & 0xFFFFFFFC;
      uint32x4_t v95 = 0uLL;
      v110 = (__int32 *)(v7 + 209);
      uint64_t v111 = v108;
      a7 = 0uLL;
      do
      {
        v112.i32[0] = *(v110 - 30);
        v112.i32[1] = *(v110 - 20);
        v113.i32[0] = *(v110 - 10);
        v113.i32[1] = *v110;
        *(int32x2_t *)v95.i8 = vmax_s32(v112, *(int32x2_t *)v95.i8);
        *(int32x2_t *)a7.i8 = vmax_s32(v113, *(int32x2_t *)a7.i8);
        v110 += 40;
        v111 -= 4;
      }
      while (v111);
      int32x2_t v114 = vmax_s32(*(int32x2_t *)v95.i8, *(int32x2_t *)a7.i8);
      *(int32x2_t *)v95.i8 = vpmax_s32(v114, v114);
      int v109 = v95.i32[0];
      if (v108 == v96) {
        goto LABEL_104;
      }
    }
    else
    {
      uint64_t v108 = 0;
      int v109 = 0;
    }
    uint64_t v115 = v96 - v108;
    v116 = &v7[10 * v108 + 179];
    do
    {
      int v118 = *v116;
      v116 += 10;
      int v117 = v118;
      if (v118 > v109) {
        int v109 = v117;
      }
      --v115;
    }
    while (v115);
LABEL_104:
    if (v109 >= 1) {
      v7[499] = (v109 + 19) / 20;
    }
    if (v96 >= 4)
    {
      uint64_t v119 = v96 & 0xFFFFFFFC;
      uint32x4_t v95 = 0uLL;
      v121 = (__int32 *)(v7 + 211);
      uint64_t v122 = v119;
      a7 = 0uLL;
      do
      {
        v123.i32[0] = *(v121 - 30);
        v123.i32[1] = *(v121 - 20);
        v124.i32[0] = *(v121 - 10);
        v124.i32[1] = *v121;
        *(int32x2_t *)v95.i8 = vmax_s32(v123, *(int32x2_t *)v95.i8);
        *(int32x2_t *)a7.i8 = vmax_s32(v124, *(int32x2_t *)a7.i8);
        v121 += 40;
        v122 -= 4;
      }
      while (v122);
      int32x2_t v125 = vmax_s32(*(int32x2_t *)v95.i8, *(int32x2_t *)a7.i8);
      *(int32x2_t *)v95.i8 = vpmax_s32(v125, v125);
      int v120 = v95.i32[0];
      if (v119 == v96) {
        goto LABEL_115;
      }
    }
    else
    {
      uint64_t v119 = 0;
      int v120 = 0;
    }
    uint64_t v126 = v96 - v119;
    v127 = &v7[10 * v119 + 181];
    do
    {
      int v129 = *v127;
      v127 += 10;
      int v128 = v129;
      if (v129 > v120) {
        int v120 = v128;
      }
      --v126;
    }
    while (v126);
LABEL_115:
    if (v120 >= 1) {
      v7[501] = (v120 + 19) / 20;
    }
    if (v96 >= 4)
    {
      uint64_t v130 = v96 & 0xFFFFFFFC;
      uint32x4_t v95 = 0uLL;
      v132 = (__int32 *)(v7 + 213);
      uint64_t v133 = v130;
      a7 = 0uLL;
      do
      {
        v134.i32[0] = *(v132 - 30);
        v134.i32[1] = *(v132 - 20);
        v135.i32[0] = *(v132 - 10);
        v135.i32[1] = *v132;
        *(int32x2_t *)v95.i8 = vmax_s32(v134, *(int32x2_t *)v95.i8);
        *(int32x2_t *)a7.i8 = vmax_s32(v135, *(int32x2_t *)a7.i8);
        v132 += 40;
        v133 -= 4;
      }
      while (v133);
      int32x2_t v136 = vmax_s32(*(int32x2_t *)v95.i8, *(int32x2_t *)a7.i8);
      *(int32x2_t *)v95.i8 = vpmax_s32(v136, v136);
      int v131 = v95.i32[0];
      if (v130 == v96) {
        goto LABEL_126;
      }
    }
    else
    {
      uint64_t v130 = 0;
      int v131 = 0;
    }
    uint64_t v137 = v96 - v130;
    v138 = &v7[10 * v130 + 183];
    do
    {
      int v140 = *v138;
      v138 += 10;
      int v139 = v140;
      if (v140 > v131) {
        int v131 = v139;
      }
      --v137;
    }
    while (v137);
LABEL_126:
    if (v131 >= 1) {
      v7[503] = (v131 + 19) / 20;
    }
    if (v96 >= 4)
    {
      uint64_t v141 = v96 & 0xFFFFFFFC;
      uint32x4_t v95 = 0uLL;
      v143 = (__int32 *)(v7 + 215);
      uint64_t v144 = v141;
      a7 = 0uLL;
      do
      {
        v145.i32[0] = *(v143 - 30);
        v145.i32[1] = *(v143 - 20);
        v146.i32[0] = *(v143 - 10);
        v146.i32[1] = *v143;
        *(int32x2_t *)v95.i8 = vmax_s32(v145, *(int32x2_t *)v95.i8);
        *(int32x2_t *)a7.i8 = vmax_s32(v146, *(int32x2_t *)a7.i8);
        v143 += 40;
        v144 -= 4;
      }
      while (v144);
      int32x2_t v147 = vmax_s32(*(int32x2_t *)v95.i8, *(int32x2_t *)a7.i8);
      *(int32x2_t *)v95.i8 = vpmax_s32(v147, v147);
      int v142 = v95.i32[0];
      if (v141 == v96)
      {
LABEL_137:
        if (v142 >= 1) {
          v7[505] = (v142 + 9) / 10;
        }
LABEL_139:
        v95.i32[0] = a1;
        a7.i32[0] = a2;
        int8x16_t v152 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_u32(a7, v95), 0), (int8x16_t)xmmword_21950D6A0, (int8x16_t)xmmword_21950D690);
        if (a2 <= a1) {
          int v153 = 7;
        }
        else {
          int v153 = 21;
        }
        float v154 = (float)a3 / 640.0;
        int v155 = a3 + 255;
        if (a3 < -255) {
          int v155 = a3 + 510;
        }
        int v156 = v7[507];
        int v157 = v155 >> 8;
        if (v154 < 1.0) {
          int v156 = (int)(float)(v154 * (float)v156);
        }
        if (v157 <= v156) {
          int v157 = v156;
        }
        if (v157 <= 2) {
          int v158 = 2;
        }
        else {
          int v158 = v157;
        }
        int v159 = v152.i32[0];
        if (v158 >= v152.i32[0]) {
          int v158 = v152.i32[0];
        }
        v7[508] = 0;
        while (a3 % v159)
        {
          BOOL v160 = v159-- <= v158;
          if (v160)
          {
            v7[508] = v158;
            v7[498] = (a3 + v158 - 1) / v158;
            goto LABEL_159;
          }
        }
        v7[508] = v159;
        v7[498] = a3 / v159;
LABEL_159:
        int v161 = a3 + 2;
        if (a3 >= -1) {
          int v161 = a3 + 1;
        }
        int v162 = v161 >> 1;
        int v163 = v162 + 255;
        if (v162 < -255) {
          int v163 = v162 + 510;
        }
        int v164 = v163 >> 8;
        int v165 = v7[509];
        if (v154 < 1.0) {
          int v165 = (int)(float)(v154 * (float)v165);
        }
        if (v164 <= v165) {
          int v164 = v165;
        }
        if (v164 <= 2) {
          int v164 = 2;
        }
        int v166 = v152.i32[1];
        if (v164 >= v152.i32[1]) {
          int v164 = v152.i32[1];
        }
        v7[510] = 0;
        while (v162 % v166)
        {
          BOOL v160 = v166-- <= v164;
          if (v160)
          {
            v7[510] = v164;
            v7[500] = (v162 + v164 - 1) / v164;
            goto LABEL_177;
          }
        }
        v7[510] = v166;
        v7[500] = v162 / v166;
LABEL_177:
        if (v162 >= -1) {
          int v167 = v162 + 1;
        }
        else {
          int v167 = v162 + 2;
        }
        int v168 = v167 >> 1;
        int v169 = v168 + 255;
        if (v168 < -255) {
          int v169 = v168 + 510;
        }
        int v170 = v169 >> 8;
        int v171 = v7[511];
        if (v154 < 1.0) {
          int v171 = (int)(float)(v154 * (float)v171);
        }
        if (v170 <= v171) {
          int v170 = v171;
        }
        if (v170 <= 2) {
          int v170 = 2;
        }
        int v172 = v152.i32[2];
        if (v170 >= v152.i32[2]) {
          int v170 = v152.i32[2];
        }
        v7[512] = 0;
        while (v168 % v172)
        {
          BOOL v160 = v172-- <= v170;
          if (v160)
          {
            v7[512] = v170;
            v7[502] = (v168 + v170 - 1) / v170;
            goto LABEL_196;
          }
        }
        v7[512] = v172;
        v7[502] = v168 / v172;
LABEL_196:
        if (v168 >= -1) {
          int v173 = v168 + 1;
        }
        else {
          int v173 = v168 + 2;
        }
        int v174 = v173 >> 1;
        int v175 = v174 + 255;
        if (v174 < -255) {
          int v175 = v174 + 510;
        }
        int v176 = v175 >> 8;
        int v177 = v7[513];
        if (v154 < 1.0) {
          int v177 = (int)(float)(v154 * (float)v177);
        }
        if (v176 <= v177) {
          int v176 = v177;
        }
        if (v176 <= 2) {
          int v176 = 2;
        }
        int v178 = v152.i32[3];
        if (v176 >= v152.i32[3]) {
          int v176 = v152.i32[3];
        }
        v7[514] = 0;
        while (v174 % v178)
        {
          BOOL v160 = v178-- <= v176;
          if (v160)
          {
            v7[514] = v176;
            v7[504] = (v174 + v176 - 1) / v176;
            goto LABEL_215;
          }
        }
        v7[514] = v178;
        v7[504] = v174 / v178;
LABEL_215:
        if (v174 >= -1) {
          int v179 = v174 + 1;
        }
        else {
          int v179 = v174 + 2;
        }
        int v180 = v179 >> 1;
        int v181 = v180 + 255;
        if (v180 < -255) {
          int v181 = v180 + 510;
        }
        int v182 = v7[515];
        int v183 = v181 >> 8;
        if (v154 < 1.0) {
          int v182 = (int)(float)(v154 * (float)v182);
        }
        if (v183 <= v182) {
          int v183 = v182;
        }
        if (v183 <= 2) {
          int v183 = 2;
        }
        if (v183 >= v153) {
          int v183 = v153;
        }
        v7[516] = 0;
        while (v180 % v153)
        {
          BOOL v160 = v153-- <= v183;
          if (v160)
          {
            v7[516] = v183;
            v7[506] = (v180 + v183 - 1) / v183;
            goto LABEL_234;
          }
        }
        v7[516] = v153;
        v7[506] = v180 / v153;
LABEL_234:
        if (v96)
        {
          do
          {
            int v184 = v7[17];
            *(void *)(v7 + 337) = v184;
            if (v184 >= -1) {
              int v185 = v184 + 1;
            }
            else {
              int v185 = v184 + 2;
            }
            int v186 = v185 >> 1;
            *(void *)(v7 + 339) = v186;
            if (v186 >= -1) {
              int v187 = v186 + 1;
            }
            else {
              int v187 = v186 + 2;
            }
            int v188 = v187 >> 1;
            *(void *)(v7 + 341) = v188;
            if (v188 >= -1) {
              int v189 = v188 + 1;
            }
            else {
              int v189 = v188 + 2;
            }
            int v190 = v189 >> 1;
            *(void *)(v7 + 343) = v190;
            if (v190 >= -1) {
              int v191 = v190 + 1;
            }
            else {
              int v191 = v190 + 2;
            }
            *(void *)(v7 + 345) = (v191 >> 1);
            v7 += 10;
            --v96;
          }
          while (v96);
        }
        return;
      }
    }
    else
    {
      uint64_t v141 = 0;
      int v142 = 0;
    }
    uint64_t v148 = v96 - v141;
    v149 = &v7[10 * v141 + 185];
    do
    {
      int v151 = *v149;
      v149 += 10;
      int v150 = v151;
      if (v151 > v142) {
        int v142 = v150;
      }
      --v148;
    }
    while (v148);
    goto LABEL_137;
  }
  bzero(a5, 0x828uLL);
  uint64_t v13 = (float)(ceilf((float)v12 / (float)(a1 - 160)) + 1.0);
  if (v13 >= 0x11) {
    sub_219509F38();
  }
  unsigned int *v7 = v13;
  uint64_t v14 = (v13 - 1);
  float v15 = ceilf((float)((float)(v13 * a1 - a2) / (float)v14) * 0.5);
  unsigned int v16 = (float)(v15 + v15);
  unsigned int v17 = a1 - v16;
  v7[1] = 0;
  v7[v14 + 1] = v12;
  if (v14 >= 2)
  {
    if (v14 < 9)
    {
      uint64_t v18 = 1;
LABEL_12:
      unint64_t v26 = &v7[v18 + 1];
      unsigned int v27 = v17 * v18;
      uint64_t v28 = v14 - v18;
      do
      {
        *v26++ = v27;
        v27 += v17;
        --v28;
      }
      while (v28);
      goto LABEL_14;
    }
    unint64_t v19 = (v14 - 1) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v18 = v19 | 1;
    int32x4_t v20 = vdupq_n_s32(v17);
    int32x4_t v21 = (int32x4_t)xmmword_21950D660;
    unint64_t v22 = (int32x4_t *)(v7 + 6);
    v23.i64[0] = 0x400000004;
    v23.i64[1] = 0x400000004;
    v24.i64[0] = 0x800000008;
    v24.i64[1] = 0x800000008;
    unint64_t v25 = v19;
    do
    {
      v22[-1] = vmulq_s32(v20, v21);
      *unint64_t v22 = vmulq_s32(v20, vaddq_s32(v21, v23));
      int32x4_t v21 = vaddq_s32(v21, v24);
      v22 += 2;
      v25 -= 8;
    }
    while (v25);
    if (v14 - 1 != v19) {
      goto LABEL_12;
    }
  }
LABEL_14:
  unint64_t v29 = operator new(4 * (v13 + 1));
  bzero(v29, 4 * (v13 + 1));
  *unint64_t v29 = 0;
  v29[1] = ((a2 - v17 * (v13 - 2)) >> 1) + 1;
  v29[v13] = a2;
  if (v13 < 3) {
    goto LABEL_22;
  }
  unsigned int v30 = v17 + 1;
  unsigned int v31 = v29[1];
  uint64_t v32 = v13 - 2;
  if ((unint64_t)(v13 - 2) < 8)
  {
    unint64_t v33 = 2;
    int v34 = v29[1];
LABEL_20:
    int v41 = v34 + a1 - v16 + 1;
    v42 = &v29[v33];
    uint64_t v43 = v13 - v33;
    do
    {
      *v42++ = v41;
      v41 += v30;
      --v43;
    }
    while (v43);
    goto LABEL_22;
  }
  int v34 = v31 + v30 * (v32 & 0xFFFFFFF8);
  unint64_t v33 = v32 & 0xFFFFFFFFFFFFFFF8 | 2;
  int32x4_t v35 = vdupq_n_s32(v30);
  int32x4_t v36 = vmlaq_s32(vdupq_n_s32(v31), v35, (int32x4_t)xmmword_21950D670);
  int32x4_t v37 = vdupq_n_s32(4 * v30);
  v38 = (int32x4_t *)(v29 + 6);
  unint64_t v39 = v32 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    int32x4_t v40 = vaddq_s32(v36, v37);
    v38[-1] = vaddq_s32(v35, v36);
    int32x4_t *v38 = vaddq_s32(v35, v40);
    int32x4_t v36 = vaddq_s32(v40, v37);
    v38 += 2;
    v39 -= 8;
  }
  while (v39);
  if (v32 != (v32 & 0xFFFFFFFFFFFFFFF8)) {
    goto LABEL_20;
  }
LABEL_22:
  if (v13)
  {
    int v44 = *v29;
    unsigned int v45 = v7[1];
    BOOL v46 = __OFSUB__(*v29, v45);
    int v47 = *v29 - v45;
    if (v47 < 0 != v46)
    {
      v74 = "active_region_x[i] >= static_cast<int32_t>(config.kp_offset_x[i])";
      uint64_t v192 = 214;
      goto LABEL_251;
    }
    v7[17] = v47;
    v7[18] = 0;
    int v48 = v29[1];
    int v49 = v48 - v44;
    v7[177] = v49;
    v7[178] = a3;
    if (v47 >= -1) {
      int v50 = v47 + 1;
    }
    else {
      int v50 = v47 + 2;
    }
    int v51 = v50 >> 1;
    *(void *)(v7 + 19) = (v50 >> 1);
    int v52 = v49 + 2;
    if (v49 >= -1) {
      int v52 = v49 + 1;
    }
    int v53 = v52 >> 1;
    v7[179] = v52 >> 1;
    int v54 = a3 + 2;
    if (a3 >= -1) {
      int v54 = a3 + 1;
    }
    int v55 = v54 >> 1;
    v7[180] = v55;
    if (v51 >= -1) {
      int v56 = v51 + 1;
    }
    else {
      int v56 = v51 + 2;
    }
    int v57 = v56 >> 1;
    *(void *)(v7 + 21) = v57;
    if (v53 >= -1) {
      int v58 = v53 + 1;
    }
    else {
      int v58 = v53 + 2;
    }
    int v59 = v58 >> 1;
    v7[181] = v58 >> 1;
    int v60 = v55 + 2;
    if (v55 >= -1) {
      int v60 = v55 + 1;
    }
    int v61 = v60 >> 1;
    v7[182] = v61;
    if (v57 >= -1) {
      int v62 = v57 + 1;
    }
    else {
      int v62 = v57 + 2;
    }
    int v63 = v62 >> 1;
    *(void *)(v7 + 23) = (v62 >> 1);
    int v64 = v59 + 2;
    if (v59 >= -1) {
      int v64 = v59 + 1;
    }
    int v65 = v64 >> 1;
    v7[183] = v64 >> 1;
    int v66 = v61 + 2;
    if (v61 >= -1) {
      int v66 = v61 + 1;
    }
    int v67 = v66 >> 1;
    v7[184] = v67;
    if (v63 >= -1) {
      int v68 = v63 + 1;
    }
    else {
      int v68 = v63 + 2;
    }
    v7[25] = v68 >> 1;
    v7[26] = 0;
    if (v65 >= -1) {
      int v69 = v65 + 1;
    }
    else {
      int v69 = v65 + 2;
    }
    v7[185] = v69 >> 1;
    int v70 = v67 + 2;
    if (v67 >= -1) {
      int v70 = v67 + 1;
    }
    int v71 = v70 >> 1;
    v7[186] = v71;
    if (v13 != 1)
    {
      uint64_t v72 = 0;
      uint64_t v73 = 0;
      v74 = "active_region_x[i] >= static_cast<int32_t>(config.kp_offset_x[i])";
      while (1)
      {
        signed int v75 = v7[v73 + 2];
        int v76 = v48 - v75;
        if (v48 < v75)
        {
          uint64_t v192 = 214;
          goto LABEL_251;
        }
        v77 = &v7[v72];
        v7[v72 + 27] = v76;
        if (v76 <= 0x4F) {
          break;
        }
        int v78 = v29[v73 + 2];
        uint64_t v79 = v73 + 1;
        int v80 = v78 - v48;
        v77[187] = v80;
        v77[188] = a3;
        int v81 = v76 + 2;
        if (v76 >= -1) {
          int v81 = v76 + 1;
        }
        int v82 = v81 >> 1;
        v77[28] = 0;
        v77[29] = v82;
        if (v80 >= -1) {
          int v83 = v80 + 1;
        }
        else {
          int v83 = v80 + 2;
        }
        int v84 = v83 >> 1;
        v77[189] = v84;
        v77[190] = v55;
        if (v82 >= -1) {
          int v85 = v82 + 1;
        }
        else {
          int v85 = v82 + 2;
        }
        int v86 = v85 >> 1;
        v77[30] = 0;
        v77[31] = v86;
        if (v84 >= -1) {
          int v87 = v84 + 1;
        }
        else {
          int v87 = v84 + 2;
        }
        int v88 = v87 >> 1;
        v77[191] = v88;
        v77[192] = v61;
        if (v86 >= -1) {
          int v89 = v86 + 1;
        }
        else {
          int v89 = v86 + 2;
        }
        int v90 = v89 >> 1;
        v77[32] = 0;
        v77[33] = v90;
        if (v88 >= -1) {
          int v91 = v88 + 1;
        }
        else {
          int v91 = v88 + 2;
        }
        int v92 = v91 >> 1;
        v77[193] = v92;
        v77[194] = v67;
        if (v90 >= -1) {
          int v93 = v90 + 1;
        }
        else {
          int v93 = v90 + 2;
        }
        v77[34] = 0;
        v77[35] = v93 >> 1;
        v77[36] = 0;
        if (v92 >= -1) {
          int v94 = v92 + 1;
        }
        else {
          int v94 = v92 + 2;
        }
        v77[195] = v94 >> 1;
        v77[196] = v71;
        v72 += 10;
        uint64_t v73 = v79;
        int v48 = v78;
        if (v13 - 1 == v79) {
          goto LABEL_82;
        }
      }
      uint64_t v192 = 218;
      v74 = "i == 0 || static_cast<uint32_t>(config.active_region_start[i][0].X) >= kOverlapWidth";
LABEL_251:
      sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGeneratorUtils.cpp", v192, v74, (void (*)(void *))sub_2194FF9C0);
      abort();
    }
  }
LABEL_82:
  operator delete(v29);
  if (a4) {
    goto LABEL_83;
  }
}

void sub_2194E2F60(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2194E2F74(_DWORD *a1)
{
  return (((a1[505] * *a1 * a1[506]) << a1[521])
                      + ((a1[503] * *a1 * a1[504]) << a1[520])
                      + ((a1[501] * *a1 * a1[502]) << a1[519])
                      + ((a1[499] * *a1 * a1[500]) << a1[518])
                      + ((a1[497] * *a1 * a1[498]) << a1[517]));
}

uint64_t sub_2194E3004(uint64_t a1, _OWORD *a2)
{
  *(void *)a1 = &unk_26CAD6B70;
  *(_OWORD *)(a1 + 8) = xmmword_21950D6B0;
  *(void *)(a1 + 24) = 0x10000004000;
  *(_DWORD *)(a1 + 32) = 14;
  *(_DWORD *)(a1 + 68) = 0x4000;
  *(_OWORD *)(a1 + 36) = xmmword_21950D74C;
  *(_OWORD *)(a1 + 52) = unk_21950D75C;
  *(_OWORD *)(a1 + 72) = xmmword_21950D6C0;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(void *)(a1 + 536) = 0;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  *(_OWORD *)(a1 + 520) = 0u;
  *(void *)(a1 + 544) = 0x1000000001;
  *(_OWORD *)(a1 + 552) = 0u;
  *(_OWORD *)(a1 + 568) = 0u;
  *(_OWORD *)(a1 + 584) = 0u;
  *(void *)(a1 + 600) = 0;
  *(_OWORD *)(a1 + 608) = xmmword_21950D6D0;
  *(_OWORD *)(a1 + 8) = *a2;
  long long v3 = a2[1];
  long long v4 = a2[2];
  long long v5 = a2[3];
  *(_OWORD *)(a1 + 72) = a2[4];
  *(_OWORD *)(a1 + 56) = v5;
  *(_OWORD *)(a1 + 40) = v4;
  *(_OWORD *)(a1 + 24) = v3;
  int v6 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 != 128 && v6 != 256 && v6 != 512)
  {
    sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorMatcher.cpp", 59, "IsConfigValid(config) && \"Invalid configuration\"", (void (*)(void *))sub_2194FF9C0);
    abort();
  }
  unint64_t v7 = (32 * *(_DWORD *)(a1 + 12));
  if (v7)
  {
    sub_2194E4978((char **)(a1 + 496), v7);
    uint64_t v8 = *(void *)(a1 + 472);
    uint64_t v9 = *(void *)(a1 + 480);
    unint64_t v10 = (32 * *(_DWORD *)(a1 + 12));
  }
  else
  {
    unint64_t v10 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  unint64_t v11 = 0x8E38E38E38E38E39 * ((v9 - v8) >> 2);
  if (v10 <= v11)
  {
    if (v10 < v11) {
      *(void *)(a1 + 480) = v8 + 36 * v10;
    }
  }
  else
  {
    sub_2194E4B90((void **)(a1 + 472), v10 - v11);
  }
  *(_DWORD *)(a1 + 548) = *(_DWORD *)(a1 + 8) >> 5;
  return a1;
}

void sub_2194E31F8(_Unwind_Exception *a1)
{
  long long v3 = *(void **)(v1 + 520);
  if (v3)
  {
    *(void *)(v1 + 528) = v3;
    operator delete(v3);
  }
  sub_219509FA8((void **)(v1 + 496), (void **)(v1 + 472), (void *)v1, (void **)(v1 + 88));
  _Unwind_Resume(a1);
}

void sub_2194E322C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_2194E3290(a1);
  sub_2194E340C(a1, a3);
  sub_2194E3770();

  sub_2194E3888(a1, a3);
}

uint64_t sub_2194E3290(uint64_t result)
{
  *(_OWORD *)(result + 568) = 0u;
  *(_OWORD *)(result + 584) = 0u;
  *(_OWORD *)(result + 552) = 0u;
  *(void *)(result + 96) = *(void *)(result + 88);
  *(void *)(result + 120) = *(void *)(result + 112);
  *(void *)(result + 144) = *(void *)(result + 136);
  *(void *)(result + 168) = *(void *)(result + 160);
  *(void *)(result + 192) = *(void *)(result + 184);
  *(void *)(result + 216) = *(void *)(result + 208);
  *(void *)(result + 240) = *(void *)(result + 232);
  *(void *)(result + 264) = *(void *)(result + 256);
  *(void *)(result + 288) = *(void *)(result + 280);
  *(void *)(result + 312) = *(void *)(result + 304);
  *(void *)(result + 336) = *(void *)(result + 328);
  *(void *)(result + 360) = *(void *)(result + 352);
  *(void *)(result + 384) = *(void *)(result + 376);
  *(void *)(result + 408) = *(void *)(result + 400);
  *(void *)(result + 432) = *(void *)(result + 424);
  *(void *)(result + 456) = *(void *)(result + 448);
  *(void *)(result + 528) = *(void *)(result + 520);
  uint64_t v1 = *(_OWORD **)(result + 496);
  unint64_t v2 = *(void *)(result + 504) - (void)v1;
  *(void *)(result + 600) = 0;
  if ((uint64_t)v2 >= 1)
  {
    unint64_t v3 = v2 >> 4;
    unint64_t v4 = (v2 >> 4) - (v2 > 0xF) + 1;
    if (v4 < 8)
    {
      long long v5 = v1;
LABEL_7:
      unint64_t v8 = v3 + 1;
      do
      {
        *v5++ = xmmword_21950D6E0;
        --v8;
      }
      while (v8 > 1);
      goto LABEL_9;
    }
    v3 -= v4 & 0xFFFFFFFFFFFFFFF8;
    long long v5 = &v1[v4 & 0xFFFFFFFFFFFFFFF8];
    int v6 = v1 + 4;
    unint64_t v7 = v4 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      *(v6 - 2) = xmmword_21950D6E0;
      *(v6 - 1) = xmmword_21950D6E0;
      *(v6 - 4) = xmmword_21950D6E0;
      *(v6 - 3) = xmmword_21950D6E0;
      v6[2] = xmmword_21950D6E0;
      v6[3] = xmmword_21950D6E0;
      _OWORD *v6 = xmmword_21950D6E0;
      v6[1] = xmmword_21950D6E0;
      v6 += 8;
      v7 -= 8;
    }
    while (v7);
    if (v4 != (v4 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_7;
    }
  }
LABEL_9:
  uint64_t v9 = *(void *)(result + 472);
  uint64_t v10 = *(void *)(result + 480) - v9;
  if (v10 >= 1)
  {
    unint64_t v11 = v10 / 0x24uLL + 1;
    do
    {
      *(void *)uint64_t v9 = 0xFFFFFFFFFFFFFLL;
      *(void *)(v9 + 16) = 0;
      *(void *)(v9 + 24) = 0;
      *(void *)(v9 + 8) = 0;
      --v11;
      *(unsigned char *)(v9 + 32) = 0;
      v9 += 36;
    }
    while (v11 > 1);
  }
  return result;
}

uint64_t sub_2194E340C(uint64_t result, uint64_t *a2)
{
  if ((*(_DWORD *)(result + 12) & 0x7FFFFFF) != 0)
  {
    unint64_t v2 = a2;
    unsigned int v3 = 0;
    uint64_t v4 = *a2;
    uint64_t v48 = result;
    do
    {
      uint64_t v5 = v4 + 200 * v3;
      if (*(_DWORD *)(v5 + 16) == 0x3FFF) {
        break;
      }
      uint64_t v6 = 0;
      int v7 = 0;
      unsigned int v49 = v3;
      uint64_t v53 = v3;
      unsigned int v51 = (*(_DWORD *)(v5 + 12) >> 5) + 8 * *(unsigned __int8 *)(v5 + 24);
      unint64_t v8 = (void *)(result + 24 * v51);
      uint64_t v10 = (char *)v8[12];
      v8 += 12;
      uint64_t v9 = v10;
      int v52 = (void **)(v8 - 1);
      int v54 = (char **)v8;
      int v55 = v8 + 1;
      do
      {
        uint64_t v11 = v6 + v53;
        unsigned int v12 = (_OWORD *)(v4 + 200 * (v6 + v53));
        uint64_t v13 = (int *)(v12 + 8);
        uint64_t v14 = (_OWORD *)((char *)v12 + 132);
        int v56 = v7;
        if ((unint64_t)v9 >= *v55)
        {
          unint64_t v19 = (char *)*v52;
          unint64_t v20 = 0x8F5C28F5C28F5C29 * ((v9 - (unsigned char *)*v52) >> 3);
          unint64_t v21 = v20 + 1;
          if (v20 + 1 > 0x147AE147AE147AELL) {
            sub_219486AE4();
          }
          if (0x1EB851EB851EB852 * ((uint64_t)(*v55 - (void)v19) >> 3) > v21) {
            unint64_t v21 = 0x1EB851EB851EB852 * ((uint64_t)(*v55 - (void)v19) >> 3);
          }
          if (0x8F5C28F5C28F5C29 * ((uint64_t)(*v55 - (void)v19) >> 3) >= 0xA3D70A3D70A3D7) {
            unint64_t v22 = 0x147AE147AE147AELL;
          }
          else {
            unint64_t v22 = v21;
          }
          if (v22 > 0x147AE147AE147AELL) {
            sub_219486AFC();
          }
          uint64_t v23 = 200 * v22;
          int32x4_t v24 = (char *)operator new(200 * v22);
          unint64_t v25 = &v24[200 * v20];
          int v26 = *v13;
          long long v27 = *v12;
          long long v28 = v12[1];
          long long v29 = v12[3];
          *((_OWORD *)v25 + 2) = v12[2];
          *((_OWORD *)v25 + 3) = v29;
          *(_OWORD *)unint64_t v25 = v27;
          *((_OWORD *)v25 + 1) = v28;
          long long v30 = v12[4];
          long long v31 = v12[5];
          long long v32 = v12[7];
          *((_OWORD *)v25 + 6) = v12[6];
          *((_OWORD *)v25 + 7) = v32;
          *((_OWORD *)v25 + 4) = v30;
          *((_OWORD *)v25 + 5) = v31;
          *((_DWORD *)v25 + 32) = v26;
          *((_DWORD *)v25 + 49) = v11;
          long long v33 = *(_OWORD *)((char *)v12 + 164);
          long long v34 = *(_OWORD *)((char *)v12 + 180);
          long long v35 = *(_OWORD *)((char *)v12 + 148);
          *(_OWORD *)(v25 + 132) = *v14;
          *(_OWORD *)(v25 + 180) = v34;
          *(_OWORD *)(v25 + 164) = v33;
          *(_OWORD *)(v25 + 148) = v35;
          if (v9 == v19)
          {
            BOOL v46 = &v24[200 * v20];
          }
          else
          {
            int32x4_t v36 = &v24[200 * v20];
            do
            {
              *(_OWORD *)(v36 - 200) = *(_OWORD *)(v9 - 200);
              long long v37 = *(_OWORD *)(v9 - 184);
              long long v38 = *(_OWORD *)(v9 - 168);
              long long v39 = *(_OWORD *)(v9 - 152);
              *(_OWORD *)(v36 - 136) = *(_OWORD *)(v9 - 136);
              *(_OWORD *)(v36 - 152) = v39;
              *(_OWORD *)(v36 - 168) = v38;
              *(_OWORD *)(v36 - 184) = v37;
              long long v40 = *(_OWORD *)(v9 - 120);
              long long v41 = *(_OWORD *)(v9 - 104);
              long long v42 = *(_OWORD *)(v9 - 88);
              *(_OWORD *)(v36 - 72) = *(_OWORD *)(v9 - 72);
              *(_OWORD *)(v36 - 88) = v42;
              *(_OWORD *)(v36 - 104) = v41;
              *(_OWORD *)(v36 - 120) = v40;
              long long v43 = *(_OWORD *)(v9 - 56);
              long long v44 = *(_OWORD *)(v9 - 40);
              long long v45 = *(_OWORD *)(v9 - 24);
              BOOL v46 = v36 - 200;
              *((void *)v36 - 1) = *((void *)v9 - 1);
              *(_OWORD *)(v36 - 24) = v45;
              *(_OWORD *)(v36 - 40) = v44;
              *(_OWORD *)(v36 - 56) = v43;
              v9 -= 200;
              v36 -= 200;
            }
            while (v9 != v19);
          }
          *int v52 = v46;
          uint64_t v9 = v25 + 200;
          *int v54 = v25 + 200;
          *int v55 = &v24[v23];
          if (v19) {
            operator delete(v19);
          }
          unint64_t v2 = a2;
        }
        else
        {
          int v15 = *v13;
          memmove(v9, v12, 0x80uLL);
          *((_DWORD *)v9 + 32) = v15;
          *(_OWORD *)(v9 + 132) = 0u;
          *(_OWORD *)(v9 + 148) = 0u;
          *(_OWORD *)(v9 + 164) = 0u;
          *(_OWORD *)(v9 + 180) = 0u;
          *((_DWORD *)v9 + 49) = v11;
          long long v16 = *v14;
          long long v17 = *(_OWORD *)((char *)v12 + 148);
          long long v18 = *(_OWORD *)((char *)v12 + 164);
          *(_OWORD *)(v9 + 180) = *(_OWORD *)((char *)v12 + 180);
          *(_OWORD *)(v9 + 164) = v18;
          *(_OWORD *)(v9 + 148) = v17;
          *(_OWORD *)(v9 + 132) = v16;
          v9 += 200;
        }
        *int v54 = v9;
        uint64_t v4 = *v2;
        uint64_t v47 = *v2 + 200 * v11;
        int v7 = v56 | (*(_DWORD *)(v47 + 16) == 0x3FFF);
        if (!(v56 & 1 | (*(_DWORD *)(v47 + 16) == 0x3FFF))
          && (*(_DWORD *)(v47 + 12) >> 5) + 8 * *(unsigned __int8 *)(v47 + 24) != v51)
        {
          sub_21950A114();
        }
        ++v6;
      }
      while (v6 != 32);
      unsigned int v3 = v49 + 32;
      float result = v48;
    }
    while (v49 + 32 != 32 * *(_DWORD *)(v48 + 12));
  }
  else
  {
    unsigned int v3 = 0;
  }
  *(_DWORD *)(result + 604) = v3;
  return result;
}

uint64_t sub_2194E3770()
{
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v2 = result;
  if ((*(_DWORD *)(result + 12) & 0x7FFFFFF) != 0)
  {
    unsigned int v3 = v1;
    unsigned int v4 = 0;
    do
    {
      if (*(_DWORD *)(*v3 + 200 * v4 + 16) == 0x3FFF) {
        break;
      }
      sub_2194E44F0((uint64_t)v8, v3, v4);
      sub_2194E3D24(v2, v8, v9);
      if ((((_BYTE)v9 + 1) & 7) != 0) {
        int v5 = v9 + 1;
      }
      else {
        int v5 = v9 - 7;
      }
      sub_2194E3D24(v2, v8, v5);
      int v6 = v9 - 1;
      if (v9 == 8) {
        int v6 = 15;
      }
      int v7 = v9 >= 1 ? v6 : 7;
      uint64_t result = sub_2194E3D24(v2, v8, v7);
      v4 += 32;
    }
    while (v4 != 32 * *(_DWORD *)(v2 + 12));
  }
  else
  {
    unsigned int v4 = 0;
  }
  *(_DWORD *)(v2 + 576) = v4 >> 5;
  return result;
}

void sub_2194E3888(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 12);
  if ((v3 & 0x7FFFFFF) != 0)
  {
    uint64_t v4 = 0;
    unsigned int v51 = (_DWORD **)(a1 + 520);
    int v5 = *(_DWORD **)(a1 + 528);
    int v59 = a2;
    while (1)
    {
      int v7 = (int *)(*(void *)(a1 + 496) + 16 * v4);
      uint64_t v8 = v7[1];
      int v9 = *(_DWORD **)(a1 + 520);
      unint64_t v10 = 0x4EC4EC4EC4EC4EC5 * (v5 - v9);
      if (v10 >= (*(_DWORD *)(a1 + 16) - 1) || v8 == 0xFFFFF) {
        goto LABEL_5;
      }
      uint64_t v12 = *(void *)(a1 + 472) + 36 * ((v8 - (*(void *)(a1 + 608) >> 4)) & 0xFFFFFFFFFFFFFFFLL);
      if (*(void *)(a1 + 616) + (4 * v4) != *(_DWORD *)(v12 + 4)) {
        goto LABEL_5;
      }
      unsigned int v13 = *(_DWORD *)(v12 + 24);
      if (v13 >= 0x1000) {
        sub_21950A14C();
      }
      int v14 = *v7;
      int v15 = *(_DWORD *)(v12 + 16);
      int v16 = *(_DWORD *)(v12 + 20);
      char v17 = *(unsigned char *)(v12 + 32);
      int v18 = *(_DWORD *)(v12 + 28);
      int v19 = *(_DWORD *)(v12 + 12);
      uint64_t v20 = *a2 + 200 * v4;
      int v21 = *(_DWORD *)v20;
      int v22 = *(_DWORD *)(v20 + 4);
      int v23 = *(_DWORD *)(v20 + 16);
      int v24 = *(_DWORD *)(v20 + 32);
      char v25 = *(unsigned char *)(v20 + 24);
      if (v16)
      {
        char v26 = v17 & 1;
        *(_DWORD *)(*a2 + 200 * v4 + 128) = v16;
        unint64_t v27 = *(void *)(a1 + 536);
        if ((unint64_t)v5 >= v27) {
          goto LABEL_19;
        }
      }
      else
      {
        int v16 = *(_DWORD *)(a1 + 544);
        if ((v16 + 1) > 1) {
          int v28 = v16 + 1;
        }
        else {
          int v28 = 1;
        }
        *(_DWORD *)(a1 + 544) = v28;
        char v26 = v17 & 1;
        *(_DWORD *)(*a2 + 200 * v4 + 128) = v16;
        unint64_t v27 = *(void *)(a1 + 536);
        if ((unint64_t)v5 >= v27)
        {
LABEL_19:
          unint64_t v29 = v10 + 1;
          if (v10 + 1 > 0x4EC4EC4EC4EC4ECLL) {
            sub_219486AE4();
          }
          unint64_t v30 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v27 - (void)v9) >> 2);
          if (2 * v30 > v29) {
            unint64_t v29 = 2 * v30;
          }
          if (v30 >= 0x276276276276276) {
            unint64_t v31 = 0x4EC4EC4EC4EC4ECLL;
          }
          else {
            unint64_t v31 = v29;
          }
          unint64_t v60 = v31;
          if (v31)
          {
            char v52 = v26;
            int v53 = v19;
            int v54 = v18;
            int v55 = v24;
            char v56 = v25;
            int v57 = v21;
            int v58 = v15;
            if (v31 > 0x4EC4EC4EC4EC4ECLL) {
              goto LABEL_57;
            }
            int v32 = v22;
            int v33 = v23;
            long long v34 = (char *)operator new(52 * v31);
            int v23 = v33;
            int v22 = v32;
            int v21 = v57;
            int v15 = v58;
            int v24 = v55;
            char v25 = v56;
            int v19 = v53;
            int v18 = v54;
            char v26 = v52;
          }
          else
          {
            long long v34 = 0;
          }
          long long v35 = &v34[4 * (v5 - v9)];
          *(_DWORD *)long long v35 = v19;
          *((_DWORD *)v35 + 1) = v18;
          v35[8] = v26;
          *((_DWORD *)v35 + 3) = v15;
          *((_DWORD *)v35 + 4) = v13;
          *((_DWORD *)v35 + 5) = v21;
          *((_DWORD *)v35 + 6) = v24;
          v35[28] = v25;
          *((_DWORD *)v35 + 8) = v22;
          *((_DWORD *)v35 + 9) = v4;
          *((_DWORD *)v35 + 10) = v23;
          *((_DWORD *)v35 + 11) = v14;
          *((_DWORD *)v35 + 12) = v16;
          int32x4_t v36 = v35;
          if (v5 == v9)
          {
            *(void *)(a1 + 520) = v35;
            int v6 = v35 + 52;
            *(void *)(a1 + 528) = v35 + 52;
            *(void *)(a1 + 536) = &v34[52 * v60];
            if (v5) {
              goto LABEL_32;
            }
          }
          else
          {
            do
            {
              long long v37 = *(_OWORD *)(v5 - 13);
              long long v38 = *(_OWORD *)(v5 - 9);
              long long v39 = *(_OWORD *)(v5 - 5);
              *((_DWORD *)v36 - 1) = *(v5 - 1);
              *(_OWORD *)(v36 - 20) = v39;
              *(_OWORD *)(v36 - 36) = v38;
              *(_OWORD *)(v36 - 52) = v37;
              v36 -= 52;
              v5 -= 13;
            }
            while (v5 != v9);
            int v5 = *v51;
            *(void *)(a1 + 520) = v36;
            int v6 = v35 + 52;
            *(void *)(a1 + 528) = v35 + 52;
            *(void *)(a1 + 536) = &v34[52 * v60];
            if (v5) {
LABEL_32:
            }
              operator delete(v5);
          }
          a2 = v59;
          goto LABEL_4;
        }
      }
      *int v5 = v19;
      v5[1] = v18;
      *((unsigned char *)v5 + 8) = v26;
      v5[3] = v15;
      v5[4] = v13;
      v5[5] = v21;
      v5[6] = v24;
      *((unsigned char *)v5 + 28) = v25;
      v5[8] = v22;
      v5[9] = v4;
      v5[10] = v23;
      v5[11] = v14;
      int v6 = v5 + 13;
      v5[12] = v16;
LABEL_4:
      *(void *)(a1 + 528) = v6;
      int v3 = *(_DWORD *)(a1 + 12);
      int v5 = v6;
LABEL_5:
      if (++v4 >= (unint64_t)(32 * v3)) {
        goto LABEL_37;
      }
    }
  }
  int v5 = *(_DWORD **)(a1 + 528);
LABEL_37:
  v61[8] = 0;
  *(void *)int v61 = 0;
  memset(&v61[12], 0, 17);
  unint64_t v40 = *(void *)(a1 + 536);
  if ((unint64_t)v5 >= v40)
  {
    long long v42 = *(_DWORD **)(a1 + 520);
    unint64_t v43 = 0x4EC4EC4EC4EC4EC5 * (v5 - v42) + 1;
    if (v43 > 0x4EC4EC4EC4EC4ECLL) {
      sub_219486AE4();
    }
    unint64_t v44 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v40 - (void)v42) >> 2);
    if (2 * v44 > v43) {
      unint64_t v43 = 2 * v44;
    }
    if (v44 >= 0x276276276276276) {
      unint64_t v45 = 0x4EC4EC4EC4EC4ECLL;
    }
    else {
      unint64_t v45 = v43;
    }
    if (v45)
    {
      if (v45 > 0x4EC4EC4EC4EC4ECLL) {
LABEL_57:
      }
        sub_219486AFC();
      BOOL v46 = (char *)operator new(52 * v45);
    }
    else
    {
      BOOL v46 = 0;
    }
    uint64_t v47 = &v46[4 * (v5 - v42)];
    *(_OWORD *)uint64_t v47 = *(_OWORD *)v61;
    *((_OWORD *)v47 + 1) = *(_OWORD *)&v61[16];
    *((_OWORD *)v47 + 2) = xmmword_21950D6F0;
    *((_DWORD *)v47 + 12) = 0;
    long long v41 = v47 + 52;
    if (v5 != v42)
    {
      do
      {
        long long v48 = *(_OWORD *)(v5 - 13);
        long long v49 = *(_OWORD *)(v5 - 9);
        long long v50 = *(_OWORD *)(v5 - 5);
        *((_DWORD *)v47 - 1) = *(v5 - 1);
        *(_OWORD *)(v47 - 20) = v50;
        *(_OWORD *)(v47 - 36) = v49;
        *(_OWORD *)(v47 - 52) = v48;
        v47 -= 52;
        v5 -= 13;
      }
      while (v5 != v42);
      int v5 = *(_DWORD **)(a1 + 520);
    }
    *(void *)(a1 + 520) = v47;
    *(void *)(a1 + 528) = v41;
    *(void *)(a1 + 536) = &v46[52 * v45];
    if (v5) {
      operator delete(v5);
    }
  }
  else
  {
    *(_OWORD *)int v5 = *(_OWORD *)v61;
    *((_OWORD *)v5 + 1) = *(_OWORD *)&v61[16];
    *((_OWORD *)v5 + 2) = xmmword_21950D6F0;
    v5[12] = 0;
    long long v41 = v5 + 13;
  }
  *(void *)(a1 + 528) = v41;
}

uint64_t sub_2194E3D24(uint64_t result, _DWORD *a2, int a3)
{
  uint64_t v3 = result + 24 * a3;
  uint64_t v6 = *(void *)(v3 + 88);
  int v5 = (uint64_t *)(v3 + 88);
  uint64_t v4 = v6;
  if (v5[1] != v6)
  {
    int v7 = (_DWORD *)result;
    uint64_t v8 = 0;
    unsigned int v9 = 0;
    do
    {
      uint64_t v10 = v4 + 200 * v8;
      if (*(_DWORD *)(v10 + 16) == 0x3FFF) {
        return result;
      }
      uint64_t v23 = 0;
      uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, char *, uint64_t *))(*(void *)v7 + 16))(v7, v10, (char *)&v23 + 4, &v23);
      if (SHIDWORD(v23) > v7[20] || SHIDWORD(v23) < v7[18] || (int)v23 > v7[21] || (int)v23 < v7[19])
      {
        int v11 = 0;
        ++v7[140];
      }
      else
      {
        int v11 = 1;
      }
      uint64_t v12 = 32;
      unsigned int v13 = a2;
      while (1)
      {
        int v14 = v13[4];
        if (v14 == 0x3FFF) {
          break;
        }
        unsigned int v15 = (HIDWORD(v23) - (*v13 >> 6)) * (HIDWORD(v23) - (*v13 >> 6))
            + (v23 - (v13[1] >> 6)) * (v23 - (v13[1] >> 6));
        unsigned int v16 = v7[6];
        BOOL v17 = v15 > v16;
        BOOL v18 = v15 <= v16;
        if (v17)
        {
          ++v7[141];
          int v14 = v13[4];
        }
        int v19 = v14 - *(_DWORD *)(v10 + 16);
        if (v19 < 0) {
          int v19 = -v19;
        }
        if (v19 > v7[7])
        {
          BOOL v18 = 0;
          ++v7[142];
        }
        int v20 = v13[3] - *(_DWORD *)(v10 + 12);
        if (v20 < 0) {
          int v20 = *(_DWORD *)(v10 + 12) - v13[3];
        }
        if (v20 > 0x80) {
          int v20 = 256 - v20;
        }
        if (v20 > v7[8])
        {
          ++v7[143];
LABEL_10:
          ++v7[139];
          v13 += 50;
          if (!--v12) {
            break;
          }
        }
        else
        {
          if ((v11 & v18) != 1) {
            goto LABEL_10;
          }
          ++v7[138];
          int v22 = 0;
          uint64_t result = (*(uint64_t (**)(_DWORD *, _DWORD *, uint64_t, int *))(*(void *)v7 + 24))(v7, v13, v10, &v22);
          v13 += 50;
          if (!--v12) {
            break;
          }
        }
      }
      uint64_t v4 = *v5;
      uint64_t v8 = ++v9;
    }
    while (0x8F5C28F5C28F5C29 * ((v5[1] - *v5) >> 3) > v9);
  }
  return result;
}

uint64_t sub_2194E3F94(uint64_t result, int *a2, uint64_t a3, unsigned int *a4, int32x4_t a5)
{
  uint64_t v5 = *(unsigned int *)(result + 548);
  if (v5 > 0x10) {
    sub_219509698();
  }
  if (!v5)
  {
    *a4 = 0;
    goto LABEL_12;
  }
  if (v5 < 8)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 0;
LABEL_15:
    uint64_t v18 = v5 - v6;
    uint64_t v19 = 4 * v6 + 132;
    int v20 = (int *)((char *)a2 + v19);
    int v21 = (int *)(a3 + v19);
    do
    {
      int v23 = *v21++;
      int v22 = v23;
      int v24 = *v20++;
      int v25 = v24 ^ v22;
      if (v25)
      {
        a5.i32[0] = v25;
        *(int8x8_t *)a5.i8 = vcnt_s8(*(int8x8_t *)a5.i8);
        a5.i16[0] = vaddlv_u8(*(uint8x8_t *)a5.i8);
        v7 += a5.i32[0];
      }
      --v18;
    }
    while (v18);
    goto LABEL_9;
  }
  uint64_t v6 = v5 & 0x18;
  int32x4_t v8 = (int32x4_t)veorq_s8(*(int8x16_t *)(a2 + 33), *(int8x16_t *)(a3 + 132));
  int32x4_t v9 = (int32x4_t)veorq_s8(*(int8x16_t *)(a2 + 37), *(int8x16_t *)(a3 + 148));
  int32x4_t v10 = (int32x4_t)vbicq_s8((int8x16_t)vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8((int8x16_t)v8))), (int8x16_t)vceqzq_s32(v8));
  int32x4_t v11 = (int32x4_t)vbicq_s8((int8x16_t)vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8((int8x16_t)v9))), (int8x16_t)vceqzq_s32(v9));
  if ((v5 & 0xFFFFFFF8) != 8)
  {
    int32x4_t v12 = (int32x4_t)veorq_s8(*(int8x16_t *)(a2 + 41), *(int8x16_t *)(a3 + 164));
    int32x4_t v13 = (int32x4_t)veorq_s8(*(int8x16_t *)(a2 + 45), *(int8x16_t *)(a3 + 180));
    int32x4_t v10 = vaddq_s32(v10, (int32x4_t)vbicq_s8((int8x16_t)vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8((int8x16_t)v12))), (int8x16_t)vceqzq_s32(v12)));
    int32x4_t v11 = vaddq_s32(v11, (int32x4_t)vbicq_s8((int8x16_t)vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8((int8x16_t)v13))), (int8x16_t)vceqzq_s32(v13)));
  }
  a5 = vaddq_s32(v11, v10);
  unsigned int v7 = vaddvq_s32(a5);
  if (v6 != v5) {
    goto LABEL_15;
  }
LABEL_9:
  *a4 = v7;
  if (v7 >= 0x1D8) {
    sub_21950A184();
  }
  if (v7 > *(_DWORD *)(result + 20))
  {
    ++*(_DWORD *)(result + 584);
    return result;
  }
LABEL_12:
  ++*(_DWORD *)(result + 580);
  unsigned int v14 = *a4;
  uint64_t v15 = *(unsigned int *)(a3 + 196);
  uint64_t v16 = *(void *)(result + 496);
  BOOL v17 = (unsigned int *)(v16 + 16 * v15);
  if (*a4 >= *v17)
  {
    if (v14 == *v17)
    {
      unsigned int v26 = a2[5];
      uint64_t v27 = v16 + 16 * v15;
      int v28 = (unsigned int *)(v27 + 8);
      unsigned int v29 = *(_DWORD *)(v27 + 8);
      if (v26 < v29)
      {
        int v31 = *(_DWORD *)(v27 + 4);
        unint64_t v30 = (_DWORD *)(v27 + 4);
        if (v31 == 0xFFFFF)
        {
          ++*(_DWORD *)(result + 596);
          unsigned int v14 = *a4;
        }
        *BOOL v17 = v14;
        *unint64_t v30 = (*(void *)(result + 608) + (unint64_t)(16 * a2[49])) >> 4;
        unsigned int v29 = a2[5];
        *int v28 = v29;
        *(_DWORD *)(v16 + 16 * v15 + 12) = (a2[3] >> 5) + 8 * *((unsigned __int8 *)a2 + 24);
        unsigned int v26 = a2[5];
      }
      if (v26 == v29)
      {
        uint64_t v32 = v16 + 16 * v15;
        if ((a2[3] >> 5) + 8 * *((unsigned __int8 *)a2 + 24) < *(_DWORD *)(v32 + 12))
        {
          *BOOL v17 = *a4;
          *(_DWORD *)(v32 + 4) = (*(void *)(result + 608) + (unint64_t)(16 * a2[49])) >> 4;
          *int v28 = a2[5];
          *(_DWORD *)(v32 + 12) = (a2[3] >> 5) + 8 * *((unsigned __int8 *)a2 + 24);
        }
      }
    }
  }
  else
  {
    if (v17[1] == 0xFFFFF) {
      ++*(_DWORD *)(result + 596);
    }
    else {
      ++*(_DWORD *)(result + 600);
    }
    *BOOL v17 = *a4;
    v17[1] = (*(void *)(result + 608) + (unint64_t)(16 * a2[49])) >> 4;
    uint64_t v33 = v16 + 16 * v15;
    *(_DWORD *)(v33 + 8) = a2[5];
    *(_DWORD *)(v33 + 12) = (a2[3] >> 5) + 8 * *((unsigned __int8 *)a2 + 24);
  }
  unsigned int v34 = *a4;
  unsigned int v35 = a2[49];
  uint64_t v36 = *(void *)(result + 472);
  long long v37 = (unsigned int *)(v36 + 36 * v35);
  if (*a4 < *v37)
  {
    uint64_t v38 = v36 + 36 * v35;
    int v40 = *(_DWORD *)(v38 + 4);
    long long v39 = (_DWORD *)(v38 + 4);
    if (v40 == 0xFFFFF) {
      ++*(_DWORD *)(result + 588);
    }
    else {
      ++*(_DWORD *)(result + 592);
    }
    *long long v37 = *a4;
    *long long v39 = *(_DWORD *)(result + 616) + 4 * v15;
    uint64_t v48 = v36 + 36 * v35;
    *(_DWORD *)(v48 + 8) = *(_DWORD *)(a3 + 20);
    int v47 = *a2;
LABEL_39:
    *(_DWORD *)(v48 + 12) = v47;
    int v49 = a2[32];
    *(_DWORD *)(v48 + 16) = a2[1];
    *(_DWORD *)(v48 + 20) = v49;
    *(_DWORD *)(v48 + 24) = v35;
    *(_DWORD *)(v48 + 28) = a2[8];
    *(unsigned char *)(v48 + 32) = *((unsigned char *)a2 + 24);
    return result;
  }
  if (v34 == *v37)
  {
    uint64_t v41 = v36 + 36 * v35;
    unsigned int v43 = *(_DWORD *)(v41 + 8);
    long long v42 = (_DWORD *)(v41 + 8);
    if (*(_DWORD *)(a3 + 20) < v43)
    {
      uint64_t v44 = v36 + 36 * v35;
      int v46 = *(_DWORD *)(v44 + 4);
      unint64_t v45 = (_DWORD *)(v44 + 4);
      if (v46 == 0xFFFFF)
      {
        ++*(_DWORD *)(result + 588);
        unsigned int v34 = *a4;
      }
      *long long v37 = v34;
      *unint64_t v45 = *(_DWORD *)(result + 616) + 4 * v15;
      _DWORD *v42 = *(_DWORD *)(a3 + 20);
      int v47 = *a2;
      uint64_t v48 = v36 + 36 * v35;
      goto LABEL_39;
    }
  }
  return result;
}

void sub_2194E4384(int *a1, unsigned int *a2, int *a3, _DWORD *a4)
{
  unint64_t v6 = (unint64_t)*a2 >> 6;
  unint64_t v7 = (unint64_t)a2[1] >> 6;
  uint64_t v8 = a1[10] * (uint64_t)(int)v7 + a1[9] * (uint64_t)(int)v6 + a1[11];
  uint64_t v9 = a1[13] * (uint64_t)(int)v7 + a1[12] * (uint64_t)(int)v6 + a1[14];
  uint64_t v10 = a1[16] * (uint64_t)(int)v7 + a1[15] * (uint64_t)(int)v6 + a1[17];
  if (v10)
  {
    double v11 = sub_2194F4294(16, (double)v8);
    double v12 = sub_2194F4294(16, (double)v9);
    double v13 = sub_2194F4294(16, (double)v10);
    sub_2194F42E0(v13);
    double v15 = v11 * v14;
    double v16 = v12 * v14;
    uint64_t v17 = (uint64_t)sub_2194F4294(16, v15);
    uint64_t v18 = (uint64_t)sub_2194F4294(16, v16);
    if ((int)v17 >= 1023) {
      int v19 = 1023;
    }
    else {
      int v19 = v17;
    }
    if (v19 <= -1024) {
      int v19 = -1024;
    }
  }
  else
  {
    unint64_t v20 = (unint64_t)v8 >> 14;
    if ((int)v20 >= 1023) {
      LODWORD(v20) = 1023;
    }
    if ((int)v20 <= -1024) {
      int v19 = -1024;
    }
    else {
      int v19 = v20;
    }
    uint64_t v18 = (unint64_t)v9 >> 14;
  }
  if ((int)v18 >= 1023) {
    LODWORD(v18) = 1023;
  }
  if ((int)v18 <= -1024) {
    LODWORD(v18) = -1024;
  }
  *a3 = v19;
  *a4 = v18;
}

void sub_2194E44B8(void *a1)
{
  sub_2194CCFD8(a1);

  JUMPOUT(0x21D48B5B0);
}

uint64_t sub_2194E44F0(uint64_t a1, void *a2, unsigned int a3)
{
  *(void *)(a1 + 192) = 0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_DWORD *)(a1 + 16) = 0x3FFF;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(void *)(a1 + 392) = 0;
  *(_DWORD *)(a1 + 216) = 0x3FFF;
  *(_OWORD *)(a1 + 528) = 0u;
  *(_OWORD *)(a1 + 544) = 0u;
  *(_OWORD *)(a1 + 560) = 0u;
  *(_OWORD *)(a1 + 576) = 0u;
  *(void *)(a1 + 592) = 0;
  *(_DWORD *)(a1 + 416) = 0x3FFF;
  *(void *)(a1 + 792) = 0;
  *(_OWORD *)(a1 + 760) = 0u;
  *(_OWORD *)(a1 + 776) = 0u;
  *(_OWORD *)(a1 + 728) = 0u;
  *(_OWORD *)(a1 + 744) = 0u;
  *(_DWORD *)(a1 + 616) = 0x3FFF;
  *(_OWORD *)(a1 + 928) = 0u;
  *(_OWORD *)(a1 + 944) = 0u;
  *(_OWORD *)(a1 + 960) = 0u;
  *(_OWORD *)(a1 + 976) = 0u;
  *(void *)(a1 + 992) = 0;
  *(_DWORD *)(a1 + 816) = 0x3FFF;
  *(_OWORD *)(a1 + 1128) = 0u;
  *(_OWORD *)(a1 + 1144) = 0u;
  *(_OWORD *)(a1 + 1160) = 0u;
  *(_OWORD *)(a1 + 1176) = 0u;
  *(void *)(a1 + 1192) = 0;
  *(_DWORD *)(a1 + 1016) = 0x3FFF;
  *(void *)(a1 + 1392) = 0;
  *(_OWORD *)(a1 + 1376) = 0u;
  *(_OWORD *)(a1 + 1360) = 0u;
  *(_OWORD *)(a1 + 1344) = 0u;
  *(_OWORD *)(a1 + 1328) = 0u;
  *(_DWORD *)(a1 + 1216) = 0x3FFF;
  *(void *)(a1 + 1592) = 0;
  *(_OWORD *)(a1 + 1560) = 0u;
  *(_OWORD *)(a1 + 1576) = 0u;
  *(_OWORD *)(a1 + 1528) = 0u;
  *(_OWORD *)(a1 + 1544) = 0u;
  *(_DWORD *)(a1 + 1416) = 0x3FFF;
  *(void *)(a1 + 1792) = 0;
  *(_OWORD *)(a1 + 1776) = 0u;
  *(_OWORD *)(a1 + 1760) = 0u;
  *(_OWORD *)(a1 + 1744) = 0u;
  *(_OWORD *)(a1 + 1728) = 0u;
  *(_DWORD *)(a1 + 1616) = 0x3FFF;
  *(void *)(a1 + 1992) = 0;
  *(_OWORD *)(a1 + 1960) = 0u;
  *(_OWORD *)(a1 + 1976) = 0u;
  *(_OWORD *)(a1 + 1928) = 0u;
  *(_OWORD *)(a1 + 1944) = 0u;
  *(_DWORD *)(a1 + 1816) = 0x3FFF;
  *(void *)(a1 + 2192) = 0;
  *(_OWORD *)(a1 + 2176) = 0u;
  *(_OWORD *)(a1 + 2160) = 0u;
  *(_OWORD *)(a1 + 2144) = 0u;
  *(_OWORD *)(a1 + 2128) = 0u;
  *(_DWORD *)(a1 + 2016) = 0x3FFF;
  *(void *)(a1 + 2392) = 0;
  *(_OWORD *)(a1 + 2360) = 0u;
  *(_OWORD *)(a1 + 2376) = 0u;
  *(_OWORD *)(a1 + 2328) = 0u;
  *(_OWORD *)(a1 + 2344) = 0u;
  *(_DWORD *)(a1 + 2216) = 0x3FFF;
  *(void *)(a1 + 2592) = 0;
  *(_OWORD *)(a1 + 2576) = 0u;
  *(_OWORD *)(a1 + 2560) = 0u;
  *(_OWORD *)(a1 + 2544) = 0u;
  *(_OWORD *)(a1 + 2528) = 0u;
  *(_DWORD *)(a1 + 2416) = 0x3FFF;
  *(void *)(a1 + 2792) = 0;
  *(_OWORD *)(a1 + 2760) = 0u;
  *(_OWORD *)(a1 + 2776) = 0u;
  *(_OWORD *)(a1 + 2728) = 0u;
  *(_OWORD *)(a1 + 2744) = 0u;
  *(_DWORD *)(a1 + 2616) = 0x3FFF;
  *(void *)(a1 + 2992) = 0;
  *(_OWORD *)(a1 + 2976) = 0u;
  *(_OWORD *)(a1 + 2960) = 0u;
  *(_OWORD *)(a1 + 2944) = 0u;
  *(_OWORD *)(a1 + 2928) = 0u;
  *(_DWORD *)(a1 + 2816) = 0x3FFF;
  *(void *)(a1 + 3192) = 0;
  *(_OWORD *)(a1 + 3160) = 0u;
  *(_OWORD *)(a1 + 3176) = 0u;
  *(_OWORD *)(a1 + 3128) = 0u;
  *(_OWORD *)(a1 + 3144) = 0u;
  *(_DWORD *)(a1 + 3016) = 0x3FFF;
  *(void *)(a1 + 3392) = 0;
  *(_OWORD *)(a1 + 3376) = 0u;
  *(_OWORD *)(a1 + 3360) = 0u;
  *(_OWORD *)(a1 + 3344) = 0u;
  *(_OWORD *)(a1 + 3328) = 0u;
  *(_DWORD *)(a1 + 3216) = 0x3FFF;
  *(void *)(a1 + 3592) = 0;
  *(_OWORD *)(a1 + 3560) = 0u;
  *(_OWORD *)(a1 + 3576) = 0u;
  *(_OWORD *)(a1 + 3528) = 0u;
  *(_OWORD *)(a1 + 3544) = 0u;
  *(_DWORD *)(a1 + 3416) = 0x3FFF;
  *(void *)(a1 + 3792) = 0;
  *(_OWORD *)(a1 + 3776) = 0u;
  *(_OWORD *)(a1 + 3760) = 0u;
  *(_OWORD *)(a1 + 3744) = 0u;
  *(_OWORD *)(a1 + 3728) = 0u;
  *(_DWORD *)(a1 + 3616) = 0x3FFF;
  *(void *)(a1 + 3992) = 0;
  *(_OWORD *)(a1 + 3960) = 0u;
  *(_OWORD *)(a1 + 3976) = 0u;
  *(_OWORD *)(a1 + 3928) = 0u;
  *(_OWORD *)(a1 + 3944) = 0u;
  *(_DWORD *)(a1 + 3816) = 0x3FFF;
  *(void *)(a1 + 4192) = 0;
  *(_OWORD *)(a1 + 4176) = 0u;
  *(_OWORD *)(a1 + 4160) = 0u;
  *(_OWORD *)(a1 + 4144) = 0u;
  *(_OWORD *)(a1 + 4128) = 0u;
  *(_DWORD *)(a1 + 4016) = 0x3FFF;
  *(void *)(a1 + 4392) = 0;
  *(_OWORD *)(a1 + 4360) = 0u;
  *(_OWORD *)(a1 + 4376) = 0u;
  *(_OWORD *)(a1 + 4328) = 0u;
  *(_OWORD *)(a1 + 4344) = 0u;
  *(_DWORD *)(a1 + 4216) = 0x3FFF;
  *(void *)(a1 + 4592) = 0;
  *(_OWORD *)(a1 + 4576) = 0u;
  *(_OWORD *)(a1 + 4560) = 0u;
  *(_OWORD *)(a1 + 4544) = 0u;
  *(_OWORD *)(a1 + 4528) = 0u;
  *(_DWORD *)(a1 + 4416) = 0x3FFF;
  *(void *)(a1 + 4792) = 0;
  *(_OWORD *)(a1 + 4760) = 0u;
  *(_OWORD *)(a1 + 4776) = 0u;
  *(_OWORD *)(a1 + 4728) = 0u;
  *(_OWORD *)(a1 + 4744) = 0u;
  *(_DWORD *)(a1 + 4616) = 0x3FFF;
  *(void *)(a1 + 4992) = 0;
  *(_OWORD *)(a1 + 4976) = 0u;
  *(_OWORD *)(a1 + 4960) = 0u;
  *(_OWORD *)(a1 + 4944) = 0u;
  *(_OWORD *)(a1 + 4928) = 0u;
  *(_DWORD *)(a1 + 4816) = 0x3FFF;
  *(void *)(a1 + 5192) = 0;
  *(_OWORD *)(a1 + 5160) = 0u;
  *(_OWORD *)(a1 + 5176) = 0u;
  *(_OWORD *)(a1 + 5128) = 0u;
  *(_OWORD *)(a1 + 5144) = 0u;
  *(_DWORD *)(a1 + 5016) = 0x3FFF;
  *(void *)(a1 + 5392) = 0;
  *(_OWORD *)(a1 + 5376) = 0u;
  *(_OWORD *)(a1 + 5360) = 0u;
  *(_OWORD *)(a1 + 5344) = 0u;
  *(_OWORD *)(a1 + 5328) = 0u;
  *(_DWORD *)(a1 + 5216) = 0x3FFF;
  *(void *)(a1 + 5592) = 0;
  *(_OWORD *)(a1 + 5560) = 0u;
  *(_OWORD *)(a1 + 5576) = 0u;
  *(_OWORD *)(a1 + 5528) = 0u;
  *(_OWORD *)(a1 + 5544) = 0u;
  *(_DWORD *)(a1 + 5416) = 0x3FFF;
  *(void *)(a1 + 5792) = 0;
  *(_OWORD *)(a1 + 5776) = 0u;
  *(_OWORD *)(a1 + 5760) = 0u;
  *(_OWORD *)(a1 + 5744) = 0u;
  *(_OWORD *)(a1 + 5728) = 0u;
  *(_DWORD *)(a1 + 5616) = 0x3FFF;
  *(void *)(a1 + 5992) = 0;
  *(_OWORD *)(a1 + 5960) = 0u;
  *(_OWORD *)(a1 + 5976) = 0u;
  *(_OWORD *)(a1 + 5928) = 0u;
  *(_OWORD *)(a1 + 5944) = 0u;
  *(_DWORD *)(a1 + 5816) = 0x3FFF;
  *(void *)(a1 + 6192) = 0;
  *(_OWORD *)(a1 + 6176) = 0u;
  *(_OWORD *)(a1 + 6160) = 0u;
  *(_OWORD *)(a1 + 6144) = 0u;
  *(_OWORD *)(a1 + 6128) = 0u;
  *(_DWORD *)(a1 + 6016) = 0x3FFF;
  *(void *)(a1 + 6392) = 0;
  *(_OWORD *)(a1 + 6360) = 0u;
  *(_OWORD *)(a1 + 6376) = 0u;
  *(_OWORD *)(a1 + 6328) = 0u;
  *(_OWORD *)(a1 + 6344) = 0u;
  *(_DWORD *)(a1 + 6216) = 0x3FFF;
  uint64_t v6 = *a2 + 200 * a3;
  int v7 = *(_DWORD *)(v6 + 128);
  long long v19 = *(_OWORD *)(v6 + 132);
  long long v21 = *(_OWORD *)(v6 + 148);
  long long v23 = *(_OWORD *)(v6 + 164);
  long long v25 = *(_OWORD *)(v6 + 180);
  memmove((void *)a1, (const void *)v6, 0x80uLL);
  *(_OWORD *)(a1 + 132) = v19;
  *(_OWORD *)(a1 + 148) = v21;
  *(_OWORD *)(a1 + 164) = v23;
  *(_DWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 180) = v25;
  *(_DWORD *)(a1 + 196) = a3;
  int v8 = *(_DWORD *)(a1 + 16);
  int v9 = (*(_DWORD *)(a1 + 12) >> 5) + 8 * *(unsigned __int8 *)(a1 + 24);
  *(_DWORD *)(a1 + 6404) = v9;
  int v10 = v8 == 0x3FFF;
  if (v8 != 0x3FFF)
  {
    if ((*(_DWORD *)(a1 + 12) >> 5) + 8 * *(unsigned __int8 *)(a1 + 24) != v9) {
LABEL_8:
    }
      sub_21950A1BC();
    int v10 = 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = -31;
  do
  {
    unsigned int v14 = a3 + v12 + 32;
    uint64_t v15 = *a2 + 200 * v14;
    int v16 = *(_DWORD *)(v15 + 128);
    long long v20 = *(_OWORD *)(v15 + 132);
    long long v22 = *(_OWORD *)(v15 + 148);
    long long v24 = *(_OWORD *)(v15 + 164);
    long long v26 = *(_OWORD *)(v15 + 180);
    uint64_t v17 = a1 + v11;
    memmove((void *)(a1 + v11 + 200), (const void *)v15, 0x80uLL);
    *(_DWORD *)(v17 + 328) = v16;
    *(_OWORD *)(v17 + 332) = v20;
    *(_OWORD *)(v17 + 348) = v22;
    *(_OWORD *)(v17 + 364) = v24;
    *(_OWORD *)(v17 + 380) = v26;
    *(_DWORD *)(v17 + 396) = v14;
    v10 |= *(_DWORD *)(a1 + v11 + 216) == 0x3FFF;
    if ((v10 & 1) == 0 && (*(_DWORD *)(v17 + 212) >> 5) + 8 * *(unsigned __int8 *)(v17 + 224) != *(_DWORD *)(a1 + 6404)) {
      goto LABEL_8;
    }
    v11 += 200;
  }
  while (!__CFADD__(v12++, 1));
  *(_DWORD *)(a1 + 6400) = a3;
  return a1;
}

void sub_2194E4978(char **a1, unint64_t a2)
{
  uint64_t v5 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = v5;
  if (a2 <= (v4 - v5) >> 4)
  {
    if (a2)
    {
      unint64_t v13 = (a2 - 1) & 0xFFFFFFFFFFFFFFFLL;
      if (v13 < 7) {
        goto LABEL_37;
      }
      unint64_t v14 = v13 + 1;
      uint64_t v6 = &v5[16 * (v14 & 0x1FFFFFFFFFFFFFF8)];
      uint64_t v15 = v5 + 64;
      uint64_t v16 = v14 & 0x1FFFFFFFFFFFFFF8;
      do
      {
        *(v15 - 2) = xmmword_21950D6E0;
        *(v15 - 1) = xmmword_21950D6E0;
        *(v15 - 4) = xmmword_21950D6E0;
        *(v15 - 3) = xmmword_21950D6E0;
        v15[2] = xmmword_21950D6E0;
        v15[3] = xmmword_21950D6E0;
        *uint64_t v15 = xmmword_21950D6E0;
        v15[1] = xmmword_21950D6E0;
        v15 += 8;
        v16 -= 8;
      }
      while (v16);
      if (v14 != (v14 & 0x1FFFFFFFFFFFFFF8))
      {
LABEL_37:
        do
        {
          *(_OWORD *)uint64_t v6 = xmmword_21950D6E0;
          v6 += 16;
        }
        while (v6 != &v5[16 * a2]);
      }
      uint64_t v6 = &v5[16 * a2];
    }
    a1[1] = v6;
  }
  else
  {
    int v7 = *a1;
    uint64_t v8 = (v5 - *a1) >> 4;
    unint64_t v9 = v8 + a2;
    if ((v8 + a2) >> 60) {
      sub_219486AE4();
    }
    uint64_t v10 = v4 - v7;
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
        sub_219486AFC();
      }
      uint64_t v12 = (char *)operator new(16 * v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v17 = &v12[16 * v8];
    uint64_t v18 = &v17[16 * a2];
    unint64_t v19 = (a2 - 1) & 0xFFFFFFFFFFFFFFFLL;
    long long v20 = v17;
    if (v19 < 7) {
      goto LABEL_38;
    }
    unint64_t v21 = v19 + 1;
    long long v20 = &v17[16 * (v21 & 0x1FFFFFFFFFFFFFF8)];
    long long v22 = v17 + 64;
    uint64_t v23 = v21 & 0x1FFFFFFFFFFFFFF8;
    do
    {
      *(v22 - 2) = xmmword_21950D6E0;
      *(v22 - 1) = xmmword_21950D6E0;
      *(v22 - 4) = xmmword_21950D6E0;
      *(v22 - 3) = xmmword_21950D6E0;
      v22[2] = xmmword_21950D6E0;
      v22[3] = xmmword_21950D6E0;
      *long long v22 = xmmword_21950D6E0;
      v22[1] = xmmword_21950D6E0;
      v22 += 8;
      v23 -= 8;
    }
    while (v23);
    if (v21 != (v21 & 0x1FFFFFFFFFFFFFF8))
    {
LABEL_38:
      do
      {
        *(_OWORD *)long long v20 = xmmword_21950D6E0;
        v20 += 16;
      }
      while (v20 != v18);
    }
    long long v24 = &v12[16 * v11];
    if (v5 == v7)
    {
      long long v26 = *a1;
      *a1 = v17;
      a1[1] = v18;
      a1[2] = v24;
      if (!v26) {
        return;
      }
      goto LABEL_28;
    }
    do
    {
      long long v25 = v17 - 16;
      *((_OWORD *)v17 - 1) = *((_OWORD *)v6 - 1);
      v6 -= 16;
      v17 -= 16;
    }
    while (v6 != v7);
    long long v26 = *a1;
    *a1 = v25;
    a1[1] = v18;
    a1[2] = v24;
    if (v26)
    {
LABEL_28:
      operator delete(v26);
    }
  }
}

void sub_2194E4B90(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if (0x8E38E38E38E38E39 * ((v5 - (unsigned char *)v4) >> 2) >= a2)
  {
    if (a2)
    {
      unint64_t v11 = &v4[9 * a2];
      uint64_t v12 = 36 * a2;
      do
      {
        v4[8] = 0;
        *(void *)uint64_t v4 = 0xFFFFFFFFFFFFFLL;
        *((void *)v4 + 2) = 0;
        *((void *)v4 + 3) = 0;
        *((void *)v4 + 1) = 0;
        *((unsigned char *)v4 + 32) = 0;
        v4 += 9;
        v12 -= 36;
      }
      while (v12);
      uint64_t v4 = v11;
    }
    a1[1] = v4;
  }
  else
  {
    unint64_t v6 = 0x8E38E38E38E38E39 * (((char *)v4 - (unsigned char *)*a1) >> 2);
    unint64_t v7 = v6 + a2;
    if (v6 + a2 > 0x71C71C71C71C71CLL) {
      sub_219486AE4();
    }
    unint64_t v8 = 0x8E38E38E38E38E39 * ((v5 - (unsigned char *)*a1) >> 2);
    if (2 * v8 > v7) {
      unint64_t v7 = 2 * v8;
    }
    if (v8 >= 0x38E38E38E38E38ELL) {
      unint64_t v9 = 0x71C71C71C71C71CLL;
    }
    else {
      unint64_t v9 = v7;
    }
    if (v9)
    {
      if (v9 > 0x71C71C71C71C71CLL) {
        sub_219486AFC();
      }
      uint64_t v10 = (char *)operator new(36 * v9);
    }
    else
    {
      uint64_t v10 = 0;
    }
    unint64_t v13 = &v10[36 * v6];
    uint64_t v14 = 36 * a2;
    uint64_t v15 = &v13[36 * a2];
    uint64_t v16 = v13;
    do
    {
      *((_DWORD *)v16 + 8) = 0;
      *(void *)uint64_t v16 = 0xFFFFFFFFFFFFFLL;
      *((void *)v16 + 2) = 0;
      *((void *)v16 + 3) = 0;
      *((void *)v16 + 1) = 0;
      v16[32] = 0;
      v16 += 36;
      v14 -= 36;
    }
    while (v14);
    uint64_t v17 = &v10[36 * v9];
    unint64_t v19 = (char *)*a1;
    uint64_t v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 36);
        long long v21 = *(_OWORD *)(v18 - 20);
        *(v13 - 4) = *(v18 - 4);
        *(_OWORD *)(v13 - 20) = v21;
        *(_OWORD *)(v13 - 36) = v20;
        v13 -= 36;
        v18 -= 36;
      }
      while (v18 != v19);
      uint64_t v18 = (char *)*a1;
    }
    *a1 = v13;
    a1[1] = v15;
    a1[2] = v17;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

void sub_2194E4D68(uint64_t a1)
{
  *(_DWORD *)a1 = 1;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = a1 + 16;
  *(void *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(void *)(a1 + 256) = sub_2194E703C;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_DWORD *)(a1 + 296) = 1065353216;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  operator new();
}

void sub_2194E4E5C(_Unwind_Exception *a1)
{
  unint64_t v8 = *(void **)(v1 + 328);
  if (v8)
  {
    *(void *)(v1 + 336) = v8;
    operator delete(v8);
    unint64_t v9 = *v6;
    if (!*v6)
    {
LABEL_3:
      sub_2194E4FB8(v3);
      uint64_t v10 = *(void *)(v1 + 248);
      *(void *)(v1 + 248) = 0;
      if (!v10)
      {
LABEL_8:
        uint64_t v12 = *(void **)(v1 + 224);
        if (v12)
        {
          *(void *)(v1 + 232) = v12;
          operator delete(v12);
          unint64_t v13 = *(void **)(v1 + 200);
          if (!v13)
          {
LABEL_10:
            uint64_t v14 = *(void **)(v1 + 176);
            if (!v14) {
              goto LABEL_11;
            }
            goto LABEL_20;
          }
        }
        else
        {
          unint64_t v13 = *(void **)(v1 + 200);
          if (!v13) {
            goto LABEL_10;
          }
        }
        *(void *)(v1 + 208) = v13;
        operator delete(v13);
        uint64_t v14 = *(void **)(v1 + 176);
        if (!v14)
        {
LABEL_11:
          uint64_t v15 = *(void **)(v1 + 152);
          if (!v15) {
            goto LABEL_12;
          }
          goto LABEL_21;
        }
LABEL_20:
        *(void *)(v1 + 184) = v14;
        operator delete(v14);
        uint64_t v15 = *(void **)(v1 + 152);
        if (!v15)
        {
LABEL_12:
          uint64_t v16 = *(void **)(v1 + 128);
          if (!v16) {
            goto LABEL_13;
          }
          goto LABEL_22;
        }
LABEL_21:
        *(void *)(v1 + 160) = v15;
        operator delete(v15);
        uint64_t v16 = *(void **)(v1 + 128);
        if (!v16)
        {
LABEL_13:
          uint64_t v17 = *(void **)(v1 + 104);
          if (!v17) {
            goto LABEL_14;
          }
          goto LABEL_23;
        }
LABEL_22:
        *(void *)(v1 + 136) = v16;
        operator delete(v16);
        uint64_t v17 = *(void **)(v1 + 104);
        if (!v17)
        {
LABEL_14:
          uint64_t v18 = *(void **)(v1 + 80);
          if (!v18) {
            goto LABEL_15;
          }
          goto LABEL_24;
        }
LABEL_23:
        *(void *)(v1 + 112) = v17;
        operator delete(v17);
        uint64_t v18 = *(void **)(v1 + 80);
        if (!v18)
        {
LABEL_15:
          unint64_t v19 = *(void **)(v1 + 56);
          if (!v19) {
            goto LABEL_16;
          }
          goto LABEL_25;
        }
LABEL_24:
        *(void *)(v1 + 88) = v18;
        operator delete(v18);
        unint64_t v19 = *(void **)(v1 + 56);
        if (!v19)
        {
LABEL_16:
          long long v20 = *v5;
          if (!*v5) {
            goto LABEL_17;
          }
          goto LABEL_26;
        }
LABEL_25:
        *(void *)(v1 + 64) = v19;
        operator delete(v19);
        long long v20 = *v5;
        if (!*v5)
        {
LABEL_17:
          sub_21948CFDC(v2, *v4);
          _Unwind_Resume(a1);
        }
LABEL_26:
        *(void *)(v1 + 40) = v20;
        operator delete(v20);
        sub_21948CFDC(v2, *v4);
        _Unwind_Resume(a1);
      }
LABEL_7:
      (*(void (**)(void))(v1 + 256))();
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v9 = *v6;
    if (!*v6) {
      goto LABEL_3;
    }
  }
  *(void *)(v1 + 312) = v9;
  operator delete(v9);
  sub_2194E4FB8(v3);
  uint64_t v11 = *(void *)(v1 + 248);
  *(void *)(v1 + 248) = 0;
  if (!v11) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

uint64_t sub_2194E4FB8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_2194E5008(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 328);
  if (v2)
  {
    *(void *)(a1 + 336) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 304);
  if (v3)
  {
    *(void *)(a1 + 312) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)(a1 + 280);
  if (v4)
  {
    do
    {
      uint64_t v5 = (void *)*v4;
      operator delete(v4);
      uint64_t v4 = v5;
    }
    while (v5);
  }
  unint64_t v6 = *(void **)(a1 + 264);
  *(void *)(a1 + 264) = 0;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = *(void *)(a1 + 248);
  *(void *)(a1 + 248) = 0;
  if (v7) {
    (*(void (**)(void))(a1 + 256))();
  }
  unint64_t v8 = *(void **)(a1 + 224);
  if (v8)
  {
    *(void *)(a1 + 232) = v8;
    operator delete(v8);
  }
  unint64_t v9 = *(void **)(a1 + 200);
  if (v9)
  {
    *(void *)(a1 + 208) = v9;
    operator delete(v9);
  }
  uint64_t v10 = *(void **)(a1 + 176);
  if (v10)
  {
    *(void *)(a1 + 184) = v10;
    operator delete(v10);
  }
  uint64_t v11 = *(void **)(a1 + 152);
  if (v11)
  {
    *(void *)(a1 + 160) = v11;
    operator delete(v11);
  }
  uint64_t v12 = *(void **)(a1 + 128);
  if (v12)
  {
    *(void *)(a1 + 136) = v12;
    operator delete(v12);
  }
  unint64_t v13 = *(void **)(a1 + 104);
  if (v13)
  {
    *(void *)(a1 + 112) = v13;
    operator delete(v13);
  }
  uint64_t v14 = *(void **)(a1 + 80);
  if (v14)
  {
    *(void *)(a1 + 88) = v14;
    operator delete(v14);
  }
  uint64_t v15 = *(void **)(a1 + 56);
  if (v15)
  {
    *(void *)(a1 + 64) = v15;
    operator delete(v15);
  }
  uint64_t v16 = *(void **)(a1 + 32);
  if (v16)
  {
    *(void *)(a1 + 40) = v16;
    operator delete(v16);
  }
  sub_21948CFDC(a1 + 8, *(void **)(a1 + 16));
  return a1;
}

void sub_2194E512C(void *a1, unint64_t **a2)
{
  unint64_t v2 = (uint64_t)(a1[5] - a1[4]) >> 8;
  unint64_t v3 = v2 + ((uint64_t)(a1[8] - a1[7]) >> 8);
  uint64_t v5 = *a2;
  uint64_t v4 = a2[1];
  if (v3 < v4 - *a2) {
    sub_21950A1F4();
  }
  uint64_t v7 = (void **)(a1 + 10);
  unint64_t v8 = (char *)a1[10];
  for (a1[11] = v8; v5 != v4; unint64_t v8 = v9)
  {
    unint64_t v10 = *v5;
    if (*v5 > v3) {
      sub_21950A22C();
    }
    if (v10 >= v2) {
      uint64_t v11 = 7;
    }
    else {
      uint64_t v11 = 4;
    }
    uint64_t v12 = a1[v11];
    if (v10 >= v2) {
      unint64_t v13 = v2;
    }
    else {
      unint64_t v13 = 0;
    }
    uint64_t v14 = (long long *)(v12 + ((v10 - v13) << 8));
    long long v49 = v14[12];
    long long v50 = v14[13];
    long long v51 = v14[14];
    long long v52 = v14[15];
    long long v45 = v14[8];
    long long v46 = v14[9];
    long long v47 = v14[10];
    long long v48 = v14[11];
    long long v41 = v14[4];
    long long v42 = v14[5];
    long long v43 = v14[6];
    long long v44 = v14[7];
    long long v37 = *v14;
    long long v38 = v14[1];
    long long v39 = v14[2];
    long long v40 = v14[3];
    unint64_t v15 = a1[12];
    if ((unint64_t)v8 < v15)
    {
      memmove(v8, v14, 0x100uLL);
      unint64_t v9 = v8 + 256;
    }
    else
    {
      uint64_t v16 = (char *)*v7;
      uint64_t v17 = (v8 - (unsigned char *)*v7) >> 8;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 56) {
        sub_219486AE4();
      }
      uint64_t v19 = v15 - (void)v16;
      if (v19 >> 7 > v18) {
        unint64_t v18 = v19 >> 7;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFF00) {
        unint64_t v20 = 0xFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        if (HIBYTE(v20)) {
          sub_219486AFC();
        }
        long long v21 = (char *)operator new(v20 << 8);
      }
      else
      {
        long long v21 = 0;
      }
      long long v22 = &v21[256 * v17];
      *((_OWORD *)v22 + 12) = v49;
      *((_OWORD *)v22 + 13) = v50;
      *((_OWORD *)v22 + 14) = v51;
      *((_OWORD *)v22 + 15) = v52;
      *((_OWORD *)v22 + 8) = v45;
      *((_OWORD *)v22 + 9) = v46;
      *((_OWORD *)v22 + 10) = v47;
      *((_OWORD *)v22 + 11) = v48;
      *((_OWORD *)v22 + 4) = v41;
      *((_OWORD *)v22 + 5) = v42;
      *((_OWORD *)v22 + 6) = v43;
      *((_OWORD *)v22 + 7) = v44;
      *(_OWORD *)long long v22 = v37;
      *((_OWORD *)v22 + 1) = v38;
      *((_OWORD *)v22 + 2) = v39;
      *((_OWORD *)v22 + 3) = v40;
      uint64_t v23 = v22;
      if (v8 != v16)
      {
        do
        {
          long long v24 = *((_OWORD *)v8 - 16);
          long long v25 = *((_OWORD *)v8 - 15);
          long long v26 = *((_OWORD *)v8 - 13);
          *((_OWORD *)v23 - 14) = *((_OWORD *)v8 - 14);
          *((_OWORD *)v23 - 13) = v26;
          *((_OWORD *)v23 - 16) = v24;
          *((_OWORD *)v23 - 15) = v25;
          long long v27 = *((_OWORD *)v8 - 12);
          long long v28 = *((_OWORD *)v8 - 11);
          long long v29 = *((_OWORD *)v8 - 9);
          *((_OWORD *)v23 - 10) = *((_OWORD *)v8 - 10);
          *((_OWORD *)v23 - 9) = v29;
          *((_OWORD *)v23 - 12) = v27;
          *((_OWORD *)v23 - 11) = v28;
          long long v30 = *((_OWORD *)v8 - 8);
          long long v31 = *((_OWORD *)v8 - 7);
          long long v32 = *((_OWORD *)v8 - 5);
          *((_OWORD *)v23 - 6) = *((_OWORD *)v8 - 6);
          *((_OWORD *)v23 - 5) = v32;
          *((_OWORD *)v23 - 8) = v30;
          *((_OWORD *)v23 - 7) = v31;
          long long v33 = *((_OWORD *)v8 - 4);
          long long v34 = *((_OWORD *)v8 - 3);
          long long v35 = *((_OWORD *)v8 - 1);
          *((_OWORD *)v23 - 2) = *((_OWORD *)v8 - 2);
          *((_OWORD *)v23 - 1) = v35;
          *((_OWORD *)v23 - 4) = v33;
          *((_OWORD *)v23 - 3) = v34;
          v23 -= 256;
          v8 -= 256;
        }
        while (v8 != v16);
        unint64_t v8 = (char *)*v7;
      }
      uint64_t v36 = &v21[256 * v20];
      unint64_t v9 = v22 + 256;
      a1[10] = v23;
      a1[11] = v22 + 256;
      a1[12] = v36;
      if (v8) {
        operator delete(v8);
      }
    }
    a1[11] = v9;
    ++v5;
  }
}

void sub_2194E53C0(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 80);
    unint64_t v3 = *(char **)(a1 + 88);
    if ((uint64_t)&v3[-v2] <= 0x8000)
    {
LABEL_6:
      sub_2194E70B8(v2, v3, (uint64_t)&v3[-v2] >> 8, 0, 0);
    }
    else
    {
      uint64_t v4 = (const std::nothrow_t *)MEMORY[0x263F8C180];
      unint64_t v5 = (uint64_t)&v3[-v2] >> 8;
      while (1)
      {
        unint64_t v6 = (char *)operator new(v5 << 8, v4);
        if (v6) {
          break;
        }
        BOOL v7 = v5 > 1;
        v5 >>= 1;
        if (!v7) {
          goto LABEL_6;
        }
      }
      unint64_t v8 = v6;
      sub_2194E70B8(v2, v3, (uint64_t)&v3[-v2] >> 8, v6, v5);
      operator delete(v8);
    }
  }
}

void sub_2194E54AC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(void *)(a1 + 40) - v4;
    uint64_t v6 = *(void *)(a1 + 56);
    unint64_t v7 = *(void *)(a1 + 64) - v6;
    int v54 = operator new(0x204uLL);
    bzero(v54, 0x204uLL);
    unint64_t v8 = (v7 >> 8) + (v5 >> 8);
    unint64_t v55 = v8;
    if ((v7 >> 8) + (v5 >> 8))
    {
      size_t v9 = 2 * v8;
      int v53 = (char *)operator new(2 * v8);
      bzero(v53, v9);
      uint64_t v10 = (v5 >> 8);
      uint64_t v11 = (int *)v54;
      if (!v10) {
        goto LABEL_16;
      }
    }
    else
    {
      int v53 = 0;
      uint64_t v10 = (v5 >> 8);
      uint64_t v11 = (int *)v54;
      if (!v10) {
        goto LABEL_16;
      }
    }
    unint64_t v18 = (unsigned char *)(v4 + 24);
    uint64_t v19 = v53 + 1;
    uint64_t v20 = v10;
    do
    {
      unint64_t v21 = (unint64_t)*((unsigned int *)v18 - 3) >> 5;
      int v22 = *v18 + (*((_DWORD *)v18 - 4) >> 4);
      *(v19 - 1) = v21;
      unsigned char *v19 = v22;
      unsigned char *v18 = 0;
      if ((v22 - 1) >= 8u)
      {
        sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointDescriptorStore.cpp", 138, "scale > 0 && scale <= kMaxNumOfScalesMinus2", (void (*)(void *))sub_2194FF9C0);
        abort();
      }
      uint64_t v23 = 8 * v21 + v22;
      v18 += 256;
      ++v11[v23];
      v19 += 2;
      --v20;
    }
    while (v20);
LABEL_16:
    uint64_t v24 = (v7 >> 8);
    if ((v7 >> 8))
    {
      long long v25 = (unsigned char *)(v6 + 24);
      long long v26 = &v53[2 * v10 + 1];
      do
      {
        int v27 = (*((_DWORD *)v25 - 3) >> 5) + 8;
        int v28 = *v25 + (*((_DWORD *)v25 - 4) >> 4);
        *(v26 - 1) = (*((_DWORD *)v25 - 3) >> 5) + 8;
        *long long v26 = v28;
        unsigned char *v25 = 1;
        if ((v28 - 1) >= 8u)
        {
          sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointDescriptorStore.cpp", 154, "scale > 0 && scale <= kMaxNumOfScalesMinus2", (void (*)(void *))sub_2194FF9C0);
          abort();
        }
        uint64_t v29 = 8 * v27 + v28;
        ++v11[v29];
        v25 += 256;
        v26 += 2;
        --v24;
      }
      while (v24);
    }
    memset(v59, 0, 24);
    if (v55)
    {
      sub_21948B1D8((uint64_t)v59, v55);
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      long long v33 = *(unsigned __int16 **)(a1 + 80);
      uint64_t v34 = *(void *)(a1 + 32);
      uint64_t v35 = v59[0];
      do
      {
        unint64_t v36 = *v33 | (*((_DWORD *)v33 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)v33 + 12) << 32) | ((unint64_t)*((unsigned __int8 *)v33 + 8) << 40) | ((unint64_t)(*((_DWORD *)v33 + 7) & 0x7FFF) << 48) | ((unint64_t)*((unsigned __int8 *)v33 + 24) << 63);
        long long v37 = (unsigned __int16 *)(v34 + (v31 << 8));
        if (v36 == (*v37 | (*((_DWORD *)v37 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)v37 + 12) << 32) | ((unint64_t)*((unsigned __int8 *)v37 + 8) << 40) | ((unint64_t)(*((_DWORD *)v37 + 7) & 0x7FFF) << 48) | ((unint64_t)*((unsigned __int8 *)v37 + 24) << 63)))
        {
          *(void *)(v35 + 8 * v31++) = v32;
        }
        else
        {
          long long v38 = (unsigned __int16 *)(*(void *)(a1 + 56) + (v30 << 8));
          if (v36 == (*v38 | (*((_DWORD *)v38 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)v38
                                                                                              + 12) << 32) | ((unint64_t)*((unsigned __int8 *)v38 + 8) << 40) | ((unint64_t)(*((_DWORD *)v38 + 7) & 0x7FFF) << 48) | ((unint64_t)*((unsigned __int8 *)v38 + 24) << 63)))
          {
            *(void *)(v35 + 8 * (v30 + v10)) = v32;
            ++v30;
          }
        }
        v33 += 128;
        ++v32;
      }
      while (v55 != v32);
    }
    int v39 = *v11;
    for (uint64_t i = 1; i != 129; ++i)
    {
      v39 += v11[i];
      v11[i] = v39;
    }
    char v56 = 0;
    int v57 = 0;
    int v58 = 0;
    if (v55)
    {
      long long v41 = (char *)operator new(8 * v55);
      char v56 = v41;
      int v58 = &v41[8 * v55];
      bzero(v41, 8 * v55);
      int v57 = v58;
      long long v42 = operator new(8 * v55);
      bzero(v42, 8 * v55);
      uint64_t v43 = 0;
      uint64_t v44 = v59[0];
      long long v45 = (unsigned __int8 *)(v53 + 1);
      do
      {
        uint64_t v46 = *(v45 - 1);
        unsigned int v47 = *v45;
        v45 += 2;
        long long v48 = &v11[8 * v46 + v47];
        uint64_t v49 = *(v48 - 1);
        *(v48 - 1) = v49 + 1;
        *(void *)&v41[8 * v49] = v43;
        *((void *)v42 + *(void *)(v44 + 8 * v43++)) = v49;
      }
      while (v55 != v43);
    }
    sub_2194E512C((void *)a1, (unint64_t **)&v56);
    long long v50 = *(_OWORD *)(a1 + 176);
    *(_OWORD *)(a1 + 176) = *(_OWORD *)(a1 + 200);
    *(_OWORD *)(a1 + 200) = v50;
    uint64_t v51 = *(void *)(a1 + 192);
    *(void *)(a1 + 192) = *(void *)(a1 + 216);
    *(void *)(a1 + 216) = v51;
    operator new();
  }
  uint64_t v12 = *(void *)(a1 + 80);
  unint64_t v13 = *(char **)(a1 + 88);
  if ((uint64_t)&v13[-v12] <= 0x8000)
  {
LABEL_9:
    sub_2194E70B8(v12, v13, (uint64_t)&v13[-v12] >> 8, 0, 0);
  }
  else
  {
    uint64_t v14 = (const std::nothrow_t *)MEMORY[0x263F8C180];
    unint64_t v15 = (uint64_t)&v13[-v12] >> 8;
    while (1)
    {
      uint64_t v16 = (char *)operator new(v15 << 8, v14);
      if (v16) {
        break;
      }
      BOOL v17 = v15 > 1;
      v15 >>= 1;
      if (!v17) {
        goto LABEL_9;
      }
    }
    long long v52 = v16;
    sub_2194E70B8(v12, v13, (uint64_t)&v13[-v12] >> 8, v16, v15);
    operator delete(v52);
  }
}

void sub_2194E60A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, char a19, void *a20,uint64_t a21,void *a22)
{
  sub_21948CFDC((uint64_t)&a19, a20);
  if (a17)
  {
    operator delete(a17);
    uint64_t v24 = a22;
    if (!a22)
    {
LABEL_3:
      long long v25 = *(void **)(v22 - 112);
      if (!v25) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v24 = a22;
    if (!a22) {
      goto LABEL_3;
    }
  }
  operator delete(v24);
  long long v25 = *(void **)(v22 - 112);
  if (!v25)
  {
LABEL_4:
    long long v26 = a9;
    if (!a9) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_8:
  *(void *)(v22 - 104) = v25;
  operator delete(v25);
  long long v26 = a9;
  if (!a9)
  {
LABEL_5:
    operator delete(__p);
    _Unwind_Resume(a1);
  }
LABEL_9:
  operator delete(v26);
  operator delete(__p);
  _Unwind_Resume(a1);
}

float *sub_2194E61D4(uint64_t a1, unint64_t a2, const float *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  unint64_t v7 = *(float **)a1;
  uint64_t result = v7;
  if (a2 > (v6 - (uint64_t)v7) >> 2)
  {
    if (v7)
    {
      *(void *)(a1 + 8) = v7;
      operator delete(v7);
      uint64_t v6 = 0;
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
    if (a2 >> 62) {
      goto LABEL_38;
    }
    uint64_t v9 = v6 >> 1;
    if (v6 >> 1 <= a2) {
      uint64_t v9 = a2;
    }
    BOOL v10 = (unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v10) {
      unint64_t v11 = v9;
    }
    if (v11 >> 62) {
LABEL_38:
    }
      sub_219486AE4();
    uint64_t v12 = v11;
    uint64_t result = (float *)operator new(4 * v11);
    *(void *)a1 = result;
    *(void *)(a1 + 16) = &result[v12];
    unint64_t v13 = &result[a2];
    float v14 = *a3;
    unint64_t v15 = (a2 - 1) & 0x3FFFFFFFFFFFFFFFLL;
    uint64_t v16 = result;
    if (v15 < 7) {
      goto LABEL_41;
    }
    unint64_t v17 = v15 + 1;
    uint64_t v16 = &result[v17 & 0x7FFFFFFFFFFFFFF8];
    int32x4_t v18 = vdupq_n_s32(LODWORD(v14));
    uint64_t v19 = (int32x4_t *)(result + 4);
    uint64_t v20 = v17 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      v19[-1] = v18;
      int32x4_t *v19 = v18;
      v19 += 2;
      v20 -= 8;
    }
    while (v20);
    if (v17 != (v17 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_41:
      do
        *v16++ = v14;
      while (v16 != v13);
    }
    goto LABEL_37;
  }
  unint64_t v21 = *(float32x4_t **)(a1 + 8);
  int64_t v22 = (char *)v21 - (char *)v7;
  unint64_t v23 = ((char *)v21 - (char *)v7) >> 2;
  if (v23 >= a2) {
    unint64_t v24 = a2;
  }
  else {
    unint64_t v24 = ((char *)v21 - (char *)v7) >> 2;
  }
  if (v24)
  {
    if (v24 < 8 || v7 < a3 + 1 && &v7[v24] > a3) {
      goto LABEL_42;
    }
    uint64_t result = &v7[v24 & 0xFFFFFFFFFFFFFFF8];
    float32x4_t v25 = vld1q_dup_f32(a3);
    long long v26 = (float32x4_t *)(v7 + 4);
    unint64_t v27 = v24 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      v26[-1] = v25;
      *long long v26 = v25;
      v26 += 2;
      v27 -= 8;
    }
    while (v27);
    BOOL v28 = v24 == (v24 & 0xFFFFFFFFFFFFFFF8);
    v24 &= 7u;
    if (!v28)
    {
LABEL_42:
      do
      {
        *result++ = *a3;
        --v24;
      }
      while (v24);
    }
  }
  BOOL v10 = a2 >= v23;
  unint64_t v29 = a2 - v23;
  if (v29 == 0 || !v10)
  {
    unint64_t v13 = &v7[a2];
LABEL_37:
    *(void *)(a1 + 8) = v13;
    return result;
  }
  uint64_t v30 = (float32x4_t *)((char *)v21 + 4 * v29);
  unint64_t v31 = 4 * a2 - (v22 & 0xFFFFFFFFFFFFFFFCLL) - 4;
  if (v31 < 0x4C || v21 < (float32x4_t *)(a3 + 1) && (char *)&v21->i32[1] + v31 > (char *)a3) {
    goto LABEL_43;
  }
  uint64_t v32 = (v31 >> 2) + 1;
  long long v33 = (float32x4_t *)((char *)v21 + 4 * (v32 & 0x7FFFFFFFFFFFFFF8));
  float32x4_t v34 = vld1q_dup_f32(a3);
  uint64_t v35 = v21 + 1;
  uint64_t v36 = v32 & 0x7FFFFFFFFFFFFFF8;
  do
  {
    v35[-1] = v34;
    *uint64_t v35 = v34;
    v35 += 2;
    v36 -= 8;
  }
  while (v36);
  unint64_t v21 = v33;
  if (v32 != (v32 & 0x7FFFFFFFFFFFFFF8))
  {
LABEL_43:
    do
    {
      v21->f32[0] = *a3;
      unint64_t v21 = (float32x4_t *)((char *)v21 + 4);
    }
    while (v21 != v30);
  }
  *(void *)(a1 + 8) = v30;
  return result;
}

void sub_2194E63FC(uint64_t a1, void *a2, uint64_t *a3, unsigned int a4, unsigned int a5, unsigned int a6, int a7)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v17 = 0;
  uint64_t v11 = *a3;
  int v12 = *(_DWORD *)(*a3 + 4 * a5);
  if (*(_DWORD *)(*a2 + 4 * a4) != -1)
  {
    if (v12 == -1)
    {
      MEMORY[0x21D48B320](__p, "curr idx");
      sub_2194E6EC4(a2, a6, a7, (uint64_t *)__p);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v19 = a4;
        _os_log_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "curr index: %u is duplicate", buf, 8u);
      }
      unint64_t v13 = "false && \"Unexpected: curr idx is duplicate\"";
      uint64_t v14 = 369;
    }
    else
    {
      MEMORY[0x21D48B320](__p, "curr & prev idx");
      sub_2194E6EC4(a2, a6, a7, (uint64_t *)__p);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        unsigned int v19 = a4;
        __int16 v20 = 1024;
        unsigned int v21 = a5;
        _os_log_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "duplicate indices pair: {%u, %u}", buf, 0xEu);
      }
      unint64_t v13 = "false && \"Unexpected: curr & prev idx are duplicates\"";
      uint64_t v14 = 364;
    }
LABEL_17:
    sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointDescriptorStore.cpp", v14, v13, (void (*)(void *))sub_2194FF9C0);
    abort();
  }
  if (v12 != -1)
  {
    MEMORY[0x21D48B320](__p, "prev idx");
    sub_2194E6EC4(a2, a6, a7, (uint64_t *)__p);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v19 = a5;
      _os_log_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "prev index: %u is duplicate", buf, 8u);
    }
    unint64_t v13 = "false && \"Unexpected: prev idx is duplicate\"";
    uint64_t v14 = 374;
    goto LABEL_17;
  }
  *(_DWORD *)(*a2 + 4 * a4) = a5;
  *(_DWORD *)(v11 + 4 * a5) = a4;
  if (SHIBYTE(v17) < 0)
  {
    operator delete(__p[0]);
  }
}

void sub_2194E66A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2194E66C0(void *a1, int a2, int a3)
{
  unint64_t v7 = (char *)a1[17];
  unint64_t v6 = a1[18];
  unint64_t v8 = v7;
  if ((unint64_t)v7 >= v6)
  {
    BOOL v10 = (char *)a1[16];
    uint64_t v11 = (v7 - v10) >> 3;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 61) {
      sub_219486AE4();
    }
    uint64_t v13 = v6 - (void)v10;
    if (v13 >> 2 > v12) {
      unint64_t v12 = v13 >> 2;
    }
    BOOL v14 = (unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8;
    unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v14) {
      unint64_t v15 = v12;
    }
    if (v15 >> 61) {
      sub_219486AFC();
    }
    uint64_t v16 = 8 * v15;
    uint64_t v17 = operator new(8 * v15);
    int32x4_t v18 = &v17[8 * v11];
    _DWORD *v18 = a2;
    v18[1] = a3;
    uint64_t v9 = v18 + 2;
    if (v7 != v10)
    {
      unint64_t v19 = v7 - v10 - 8;
      if (v19 < 0x58) {
        goto LABEL_23;
      }
      if ((unint64_t)(v10 - v17) < 0x20) {
        goto LABEL_23;
      }
      uint64_t v20 = (v19 >> 3) + 1;
      uint64_t v21 = 8 * (v20 & 0x3FFFFFFFFFFFFFFCLL);
      unint64_t v8 = &v7[-v21];
      int32x4_t v18 = (_DWORD *)((char *)v18 - v21);
      uint64_t v22 = &v17[8 * v11 - 16];
      unint64_t v23 = v7 - 16;
      uint64_t v24 = v20 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v25 = *(_OWORD *)v23;
        *(v22 - 1) = *((_OWORD *)v23 - 1);
        *uint64_t v22 = v25;
        v22 -= 2;
        v23 -= 32;
        v24 -= 4;
      }
      while (v24);
      if (v20 != (v20 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_23:
        do
        {
          uint64_t v26 = *((void *)v8 - 1);
          v8 -= 8;
          *((void *)v18 - 1) = v26;
          v18 -= 2;
        }
        while (v8 != v10);
      }
    }
    a1[16] = v18;
    a1[17] = v9;
    a1[18] = &v17[v16];
    if (v10) {
      operator delete(v10);
    }
  }
  else
  {
    *(_DWORD *)unint64_t v7 = a2;
    *((_DWORD *)v7 + 1) = a3;
    uint64_t v9 = v7 + 8;
  }
  a1[17] = v9;
}

void sub_2194E6820(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = (*(void *)(a1 + 40) - *(void *)(a1 + 32)) >> 8;
  uint64_t v6 = (*(void *)(a1 + 64) - *(void *)(a1 + 56)) >> 8;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v7 = (v6 + v5);
  if (!(v6 + v5))
  {
    __p = 0;
    goto LABEL_9;
  }
  unint64_t v8 = (unint64_t *)operator new(8 * v7);
  uint64_t v20 = v8;
  uint64_t v22 = &v8[v7];
  bzero(v8, 8 * v7);
  uint64_t v21 = v22;
  __p = v8;
  if ((unint64_t)(8 * v7 - 8) < 0x18)
  {
    uint64_t v9 = 0;
    BOOL v10 = v8;
    do
LABEL_8:
      *v10++ = v9++;
    while (v10 != &v8[v7]);
    goto LABEL_9;
  }
  unint64_t v11 = ((unint64_t)(8 * v7 - 8) >> 3) + 1;
  uint64_t v9 = v11 & 0x3FFFFFFFFFFFFFFCLL;
  BOOL v10 = &v8[v11 & 0x3FFFFFFFFFFFFFFCLL];
  int64x2_t v12 = (int64x2_t)xmmword_21950BFE0;
  uint64_t v13 = (int64x2_t *)(v8 + 2);
  int64x2_t v14 = vdupq_n_s64(2uLL);
  int64x2_t v15 = vdupq_n_s64(4uLL);
  uint64_t v16 = v11 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v13[-1] = v12;
    *uint64_t v13 = vaddq_s64(v12, v14);
    int64x2_t v12 = vaddq_s64(v12, v15);
    v13 += 2;
    v16 -= 4;
  }
  while (v16);
  if (v11 != v9) {
    goto LABEL_8;
  }
LABEL_9:
  sub_2194E512C((void *)a1, &v20);
  if (a3)
  {
    long long v17 = *(_OWORD *)(a1 + 176);
    *(_OWORD *)(a1 + 176) = *(_OWORD *)(a1 + 200);
    *(_OWORD *)(a1 + 200) = v17;
    uint64_t v18 = *(void *)(a1 + 192);
    *(void *)(a1 + 192) = *(void *)(a1 + 216);
    *(void *)(a1 + 216) = v18;
    operator new();
  }
  if (__p) {
    operator delete(__p);
  }
}

void sub_2194E6E74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2194E6EC4(void *a1, unsigned int a2, int a3, uint64_t *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a4 + 23) >= 0) {
      unint64_t v8 = a4;
    }
    else {
      unint64_t v8 = (uint64_t *)*a4;
    }
    *(_DWORD *)buf = 67109378;
    int v14 = a3;
    __int16 v15 = 2080;
    uint64_t v16 = v8;
    _os_log_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "TID %u, %s duplicate", buf, 0x12u);
  }
  if (a2)
  {
    uint64_t v9 = 0;
    uint64_t v10 = a2;
    unint64_t v11 = &_os_log_internal;
    do
    {
      int v12 = *(_DWORD *)(*a1 + 4 * v9);
      if (v12 != -1 && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v14 = v9;
        __int16 v15 = 1024;
        LODWORD(v16) = v12;
        _os_log_impl(&dword_219476000, v11, OS_LOG_TYPE_DEFAULT, "curr to prev: %u -> %u.", buf, 0xEu);
      }
      ++v9;
    }
    while (v10 != v9);
  }
}

void *sub_2194E703C(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *result;
    *uint64_t v1 = 0;
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
    JUMPOUT(0x21D48B5B0);
  }
  return result;
}

uint64_t sub_2194E70B8(uint64_t result, char *a2, unint64_t a3, char *a4, uint64_t a5)
{
  if (a3 < 2) {
    return result;
  }
  uint64_t v6 = (char *)result;
  if (a3 == 2)
  {
    unint64_t v8 = a2 - 256;
    unsigned int v7 = *((_DWORD *)a2 - 64);
    unsigned int v9 = *(a2 - 232);
    unsigned int v10 = *(unsigned __int8 *)(result + 24);
    if (v9 < v10
      || v10 >= v9
      && ((unsigned int v11 = *((_DWORD *)a2 - 62), v12 = *(_DWORD *)(result + 8), v11 < v12)
       || v12 >= v11
       && ((unsigned int v13 = *((_DWORD *)a2 - 63), v14 = *(_DWORD *)(result + 4), v13 < v14)
        || v14 >= v13
        && (v7 < *(_DWORD *)result
         || *(_DWORD *)result >= v7
         && ((unsigned int v15 = *((_DWORD *)a2 - 57), v16 = *(_DWORD *)(result + 28), v15 < v16)
          || v16 >= v15 && *((_DWORD *)a2 - 61) < *(_DWORD *)(result + 12))))))
    {
      long long v161 = *(_OWORD *)(result + 192);
      long long v163 = *(_OWORD *)(result + 208);
      long long v165 = *(_OWORD *)(result + 224);
      long long v166 = *(_OWORD *)(result + 240);
      long long v153 = *(_OWORD *)(result + 128);
      long long v155 = *(_OWORD *)(result + 144);
      long long v157 = *(_OWORD *)(result + 160);
      long long v159 = *(_OWORD *)(result + 176);
      long long v145 = *(_OWORD *)(result + 64);
      long long v147 = *(_OWORD *)(result + 80);
      long long v149 = *(_OWORD *)(result + 96);
      long long v151 = *(_OWORD *)(result + 112);
      long long v137 = *(_OWORD *)result;
      long long v139 = *(_OWORD *)(result + 16);
      long long v141 = *(_OWORD *)(result + 32);
      long long v143 = *(_OWORD *)(result + 48);
      long long v17 = *(_OWORD *)v8;
      long long v18 = *((_OWORD *)a2 - 15);
      long long v19 = *((_OWORD *)a2 - 13);
      *(_OWORD *)(result + 32) = *((_OWORD *)a2 - 14);
      *(_OWORD *)(result + 48) = v19;
      *(_OWORD *)uint64_t result = v17;
      *(_OWORD *)(result + 16) = v18;
      long long v20 = *((_OWORD *)a2 - 12);
      long long v21 = *((_OWORD *)a2 - 11);
      long long v22 = *((_OWORD *)a2 - 9);
      *(_OWORD *)(result + 96) = *((_OWORD *)a2 - 10);
      *(_OWORD *)(result + 112) = v22;
      *(_OWORD *)(result + 64) = v20;
      *(_OWORD *)(result + 80) = v21;
      long long v23 = *((_OWORD *)a2 - 8);
      long long v24 = *((_OWORD *)a2 - 7);
      long long v25 = *((_OWORD *)a2 - 5);
      *(_OWORD *)(result + 160) = *((_OWORD *)a2 - 6);
      *(_OWORD *)(result + 176) = v25;
      *(_OWORD *)(result + 128) = v23;
      *(_OWORD *)(result + 144) = v24;
      long long v26 = *((_OWORD *)a2 - 4);
      long long v27 = *((_OWORD *)a2 - 3);
      long long v28 = *((_OWORD *)a2 - 1);
      *(_OWORD *)(result + 224) = *((_OWORD *)a2 - 2);
      *(_OWORD *)(result + 240) = v28;
      *(_OWORD *)(result + 192) = v26;
      *(_OWORD *)(result + 208) = v27;
      *((_OWORD *)a2 - 4) = v161;
      *((_OWORD *)a2 - 3) = v163;
      *((_OWORD *)a2 - 2) = v165;
      *((_OWORD *)a2 - 1) = v166;
      *((_OWORD *)a2 - 8) = v153;
      *((_OWORD *)a2 - 7) = v155;
      *((_OWORD *)a2 - 6) = v157;
      *((_OWORD *)a2 - 5) = v159;
      *((_OWORD *)a2 - 12) = v145;
      *((_OWORD *)a2 - 11) = v147;
      *((_OWORD *)a2 - 10) = v149;
      *((_OWORD *)a2 - 9) = v151;
      *(_OWORD *)unint64_t v8 = v137;
      *((_OWORD *)a2 - 15) = v139;
      *((_OWORD *)a2 - 14) = v141;
      *((_OWORD *)a2 - 13) = v143;
    }
    return result;
  }
  if ((uint64_t)a3 > 128)
  {
    int v68 = a4;
    unint64_t v69 = a3 >> 1;
    uint64_t v70 = result + (a3 >> 1 << 8);
    unint64_t v71 = a3 >> 1;
    if ((uint64_t)a3 > a5)
    {
      sub_2194E70B8(result, v70, v71, a4, a5);
      sub_2194E70B8(&v6[256 * (a3 >> 1)], a2, a3 - (a3 >> 1), v68, a5);
      return (uint64_t)sub_2194E7F38(v6, &v6[256 * (a3 >> 1)], a2, a3 >> 1, a3 - (a3 >> 1), v68, a5);
    }
    sub_2194E7804(result, v70, v71, a4);
    uint64_t v72 = &v68[256 * v69];
    uint64_t result = sub_2194E7804((uint64_t)&v6[256 * (a3 >> 1)], (uint64_t)a2, a3 - (a3 >> 1), v72);
    uint64_t v73 = &v68[256 * a3];
    v74 = v72;
    while (1)
    {
      if (v74 == v73)
      {
        if (v68 != v72)
        {
          uint64_t v107 = 0;
          do
          {
            uint64_t v108 = (unsigned int *)&v6[v107];
            long long v109 = *(_OWORD *)&v68[v107];
            long long v110 = *(_OWORD *)&v68[v107 + 16];
            long long v111 = *(_OWORD *)&v68[v107 + 48];
            *((_OWORD *)v108 + 2) = *(_OWORD *)&v68[v107 + 32];
            *((_OWORD *)v108 + 3) = v111;
            *(_OWORD *)uint64_t v108 = v109;
            *((_OWORD *)v108 + 1) = v110;
            long long v112 = *(_OWORD *)&v68[v107 + 64];
            long long v113 = *(_OWORD *)&v68[v107 + 80];
            long long v114 = *(_OWORD *)&v68[v107 + 112];
            *((_OWORD *)v108 + 6) = *(_OWORD *)&v68[v107 + 96];
            *((_OWORD *)v108 + 7) = v114;
            *((_OWORD *)v108 + 4) = v112;
            *((_OWORD *)v108 + 5) = v113;
            long long v115 = *(_OWORD *)&v68[v107 + 128];
            long long v116 = *(_OWORD *)&v68[v107 + 144];
            long long v117 = *(_OWORD *)&v68[v107 + 176];
            *((_OWORD *)v108 + 10) = *(_OWORD *)&v68[v107 + 160];
            *((_OWORD *)v108 + 11) = v117;
            *((_OWORD *)v108 + 8) = v115;
            *((_OWORD *)v108 + 9) = v116;
            long long v118 = *(_OWORD *)&v68[v107 + 192];
            long long v119 = *(_OWORD *)&v68[v107 + 208];
            long long v120 = *(_OWORD *)&v68[v107 + 240];
            *((_OWORD *)v108 + 14) = *(_OWORD *)&v68[v107 + 224];
            *((_OWORD *)v108 + 15) = v120;
            *((_OWORD *)v108 + 12) = v118;
            *((_OWORD *)v108 + 13) = v119;
            v107 += 256;
          }
          while (&v68[v107] != v72);
        }
        return result;
      }
      unsigned int v87 = v74[24];
      unsigned int v88 = v68[24];
      if (v87 < v88
        || v88 >= v87
        && ((unsigned int v101 = *((_DWORD *)v74 + 2), v102 = *((_DWORD *)v68 + 2), v101 < v102)
         || v102 >= v101
         && ((unsigned int v103 = *((_DWORD *)v74 + 1), v104 = *((_DWORD *)v68 + 1), v103 < v104)
          || v104 >= v103
          && (*(_DWORD *)v74 < *(_DWORD *)v68
           || *(_DWORD *)v68 >= *(_DWORD *)v74
           && ((unsigned int v105 = *((_DWORD *)v74 + 7), v106 = *((_DWORD *)v68 + 7), v105 < v106)
            || v106 >= v105 && *((_DWORD *)v74 + 3) < *((_DWORD *)v68 + 3))))))
      {
        long long v75 = *(_OWORD *)v74;
        long long v76 = *((_OWORD *)v74 + 1);
        long long v77 = *((_OWORD *)v74 + 3);
        *((_OWORD *)v6 + 2) = *((_OWORD *)v74 + 2);
        *((_OWORD *)v6 + 3) = v77;
        *(_OWORD *)uint64_t v6 = v75;
        *((_OWORD *)v6 + 1) = v76;
        long long v78 = *((_OWORD *)v74 + 4);
        long long v79 = *((_OWORD *)v74 + 5);
        long long v80 = *((_OWORD *)v74 + 7);
        *((_OWORD *)v6 + 6) = *((_OWORD *)v74 + 6);
        *((_OWORD *)v6 + 7) = v80;
        *((_OWORD *)v6 + 4) = v78;
        *((_OWORD *)v6 + 5) = v79;
        long long v81 = *((_OWORD *)v74 + 8);
        long long v82 = *((_OWORD *)v74 + 9);
        long long v83 = *((_OWORD *)v74 + 11);
        *((_OWORD *)v6 + 10) = *((_OWORD *)v74 + 10);
        *((_OWORD *)v6 + 11) = v83;
        *((_OWORD *)v6 + 8) = v81;
        *((_OWORD *)v6 + 9) = v82;
        long long v84 = *((_OWORD *)v74 + 12);
        long long v85 = *((_OWORD *)v74 + 13);
        long long v86 = *((_OWORD *)v74 + 15);
        *((_OWORD *)v6 + 14) = *((_OWORD *)v74 + 14);
        *((_OWORD *)v6 + 15) = v86;
        *((_OWORD *)v6 + 12) = v84;
        *((_OWORD *)v6 + 13) = v85;
        v74 += 256;
        v6 += 256;
        if (v68 == v72) {
          goto LABEL_76;
        }
      }
      else
      {
        long long v89 = *(_OWORD *)v68;
        long long v90 = *((_OWORD *)v68 + 1);
        long long v91 = *((_OWORD *)v68 + 3);
        *((_OWORD *)v6 + 2) = *((_OWORD *)v68 + 2);
        *((_OWORD *)v6 + 3) = v91;
        *(_OWORD *)uint64_t v6 = v89;
        *((_OWORD *)v6 + 1) = v90;
        long long v92 = *((_OWORD *)v68 + 4);
        long long v93 = *((_OWORD *)v68 + 5);
        long long v94 = *((_OWORD *)v68 + 7);
        *((_OWORD *)v6 + 6) = *((_OWORD *)v68 + 6);
        *((_OWORD *)v6 + 7) = v94;
        *((_OWORD *)v6 + 4) = v92;
        *((_OWORD *)v6 + 5) = v93;
        long long v95 = *((_OWORD *)v68 + 8);
        long long v96 = *((_OWORD *)v68 + 9);
        long long v97 = *((_OWORD *)v68 + 11);
        *((_OWORD *)v6 + 10) = *((_OWORD *)v68 + 10);
        *((_OWORD *)v6 + 11) = v97;
        *((_OWORD *)v6 + 8) = v95;
        *((_OWORD *)v6 + 9) = v96;
        long long v98 = *((_OWORD *)v68 + 12);
        long long v99 = *((_OWORD *)v68 + 13);
        long long v100 = *((_OWORD *)v68 + 15);
        *((_OWORD *)v6 + 14) = *((_OWORD *)v68 + 14);
        *((_OWORD *)v6 + 15) = v100;
        *((_OWORD *)v6 + 12) = v98;
        *((_OWORD *)v6 + 13) = v99;
        v68 += 256;
        v6 += 256;
        if (v68 == v72)
        {
LABEL_76:
          if (v74 != v73)
          {
            uint64_t v121 = 0;
            do
            {
              uint64_t v122 = (unsigned int *)&v6[v121];
              long long v123 = *(_OWORD *)&v74[v121];
              long long v124 = *(_OWORD *)&v74[v121 + 16];
              long long v125 = *(_OWORD *)&v74[v121 + 48];
              *((_OWORD *)v122 + 2) = *(_OWORD *)&v74[v121 + 32];
              *((_OWORD *)v122 + 3) = v125;
              *(_OWORD *)uint64_t v122 = v123;
              *((_OWORD *)v122 + 1) = v124;
              long long v126 = *(_OWORD *)&v74[v121 + 64];
              long long v127 = *(_OWORD *)&v74[v121 + 80];
              long long v128 = *(_OWORD *)&v74[v121 + 112];
              *((_OWORD *)v122 + 6) = *(_OWORD *)&v74[v121 + 96];
              *((_OWORD *)v122 + 7) = v128;
              *((_OWORD *)v122 + 4) = v126;
              *((_OWORD *)v122 + 5) = v127;
              long long v129 = *(_OWORD *)&v74[v121 + 128];
              long long v130 = *(_OWORD *)&v74[v121 + 144];
              long long v131 = *(_OWORD *)&v74[v121 + 176];
              *((_OWORD *)v122 + 10) = *(_OWORD *)&v74[v121 + 160];
              *((_OWORD *)v122 + 11) = v131;
              *((_OWORD *)v122 + 8) = v129;
              *((_OWORD *)v122 + 9) = v130;
              long long v132 = *(_OWORD *)&v74[v121 + 192];
              long long v133 = *(_OWORD *)&v74[v121 + 208];
              long long v134 = *(_OWORD *)&v74[v121 + 240];
              *((_OWORD *)v122 + 14) = *(_OWORD *)&v74[v121 + 224];
              *((_OWORD *)v122 + 15) = v134;
              *((_OWORD *)v122 + 12) = v132;
              *((_OWORD *)v122 + 13) = v133;
              v121 += 256;
            }
            while (&v74[v121] != v73);
          }
          return result;
        }
      }
    }
  }
  if ((char *)result == a2) {
    return result;
  }
  uint64_t v30 = (unsigned int *)(result + 256);
  if ((char *)(result + 256) == a2) {
    return result;
  }
  uint64_t v31 = 0;
  uint64_t v32 = (unsigned int *)result;
  while (2)
  {
    long long v33 = v32;
    uint64_t v32 = v30;
    unsigned int v34 = *((unsigned __int8 *)v33 + 280);
    unsigned int v35 = v33[66];
    unsigned int v36 = v33[65];
    unsigned int v37 = *v30;
    unsigned int v38 = v33[71];
    unsigned int v39 = v33[67];
    uint64_t result = *((unsigned __int8 *)v33 + 24);
    if (v34 >= result)
    {
      if (result < v34) {
        goto LABEL_22;
      }
      uint64_t result = v33[2];
      if (v35 >= result)
      {
        if (result < v35) {
          goto LABEL_22;
        }
        uint64_t result = v33[1];
        if (v36 >= result)
        {
          if (result < v36) {
            goto LABEL_22;
          }
          uint64_t result = *v33;
          if (v37 >= result)
          {
            if (result < v37) {
              goto LABEL_22;
            }
            uint64_t result = v33[7];
            if (v38 >= result)
            {
              if (result < v38) {
                goto LABEL_22;
              }
              uint64_t result = v33[3];
              if (v39 >= result) {
                goto LABEL_22;
              }
            }
          }
        }
      }
    }
    uint64_t result = *((void *)v33 + 34);
    __int16 v135 = *(_WORD *)((char *)v33 + 281);
    char v136 = *((unsigned char *)v33 + 283);
    long long v146 = *((_OWORD *)v33 + 22);
    long long v148 = *((_OWORD *)v33 + 23);
    long long v142 = *((_OWORD *)v33 + 20);
    long long v144 = *((_OWORD *)v33 + 21);
    long long v154 = *((_OWORD *)v33 + 26);
    long long v156 = *((_OWORD *)v33 + 27);
    long long v150 = *((_OWORD *)v33 + 24);
    long long v152 = *((_OWORD *)v33 + 25);
    long long v162 = *((_OWORD *)v33 + 30);
    long long v164 = *((_OWORD *)v33 + 31);
    long long v158 = *((_OWORD *)v33 + 28);
    long long v160 = *((_OWORD *)v33 + 29);
    long long v138 = *((_OWORD *)v33 + 18);
    long long v140 = *((_OWORD *)v33 + 19);
    long long v40 = *(_OWORD *)v33;
    long long v41 = *((_OWORD *)v33 + 1);
    long long v42 = *((_OWORD *)v33 + 3);
    *((_OWORD *)v32 + 2) = *((_OWORD *)v33 + 2);
    *((_OWORD *)v32 + 3) = v42;
    *(_OWORD *)uint64_t v32 = v40;
    *((_OWORD *)v32 + 1) = v41;
    long long v43 = *((_OWORD *)v33 + 4);
    long long v44 = *((_OWORD *)v33 + 5);
    long long v45 = *((_OWORD *)v33 + 7);
    *((_OWORD *)v32 + 6) = *((_OWORD *)v33 + 6);
    *((_OWORD *)v32 + 7) = v45;
    *((_OWORD *)v32 + 4) = v43;
    *((_OWORD *)v32 + 5) = v44;
    long long v46 = *((_OWORD *)v33 + 8);
    long long v47 = *((_OWORD *)v33 + 9);
    long long v48 = *((_OWORD *)v33 + 11);
    *((_OWORD *)v32 + 10) = *((_OWORD *)v33 + 10);
    *((_OWORD *)v32 + 11) = v48;
    *((_OWORD *)v32 + 8) = v46;
    *((_OWORD *)v32 + 9) = v47;
    long long v49 = *((_OWORD *)v33 + 12);
    long long v50 = *((_OWORD *)v33 + 13);
    long long v51 = *((_OWORD *)v33 + 15);
    *((_OWORD *)v32 + 14) = *((_OWORD *)v33 + 14);
    *((_OWORD *)v32 + 15) = v51;
    *((_OWORD *)v32 + 12) = v49;
    *((_OWORD *)v32 + 13) = v50;
    if (v33 == (unsigned int *)v6)
    {
LABEL_20:
      long long v33 = (unsigned int *)v6;
      goto LABEL_21;
    }
    uint64_t v52 = v31;
    while (1)
    {
      int v61 = &v6[v52];
      unsigned int v62 = *(_DWORD *)&v6[v52 - 256];
      unsigned int v63 = v6[v52 - 232];
      if (v34 < v63) {
        goto LABEL_26;
      }
      if (v63 < v34) {
        goto LABEL_21;
      }
      unsigned int v64 = *((_DWORD *)v61 - 62);
      if (v35 < v64) {
        goto LABEL_26;
      }
      if (v64 < v35) {
        goto LABEL_21;
      }
      unsigned int v65 = *((_DWORD *)v61 - 63);
      if (v36 < v65) {
        goto LABEL_26;
      }
      if (v65 < v36) {
        goto LABEL_21;
      }
      if (v37 < v62) {
        goto LABEL_26;
      }
      if (v62 < v37) {
        break;
      }
      unsigned int v66 = *((_DWORD *)v61 - 57);
      if (v38 >= v66 && (v66 < v38 || v39 >= *((_DWORD *)v61 - 61))) {
        goto LABEL_21;
      }
LABEL_26:
      v33 -= 64;
      long long v53 = *(_OWORD *)&v6[v52 - 48];
      *((_OWORD *)v61 + 12) = *(_OWORD *)&v6[v52 - 64];
      *((_OWORD *)v61 + 13) = v53;
      long long v54 = *(_OWORD *)&v6[v52 - 16];
      *((_OWORD *)v61 + 14) = *(_OWORD *)&v6[v52 - 32];
      *((_OWORD *)v61 + 15) = v54;
      long long v55 = *(_OWORD *)&v6[v52 - 112];
      *((_OWORD *)v61 + 8) = *(_OWORD *)&v6[v52 - 128];
      *((_OWORD *)v61 + 9) = v55;
      long long v56 = *(_OWORD *)&v6[v52 - 80];
      *((_OWORD *)v61 + 10) = *(_OWORD *)&v6[v52 - 96];
      *((_OWORD *)v61 + 11) = v56;
      long long v57 = *(_OWORD *)&v6[v52 - 176];
      *((_OWORD *)v61 + 4) = *(_OWORD *)&v6[v52 - 192];
      *((_OWORD *)v61 + 5) = v57;
      long long v58 = *(_OWORD *)&v6[v52 - 144];
      *((_OWORD *)v61 + 6) = *(_OWORD *)&v6[v52 - 160];
      *((_OWORD *)v61 + 7) = v58;
      long long v59 = *(_OWORD *)&v6[v52 - 240];
      *(_OWORD *)int v61 = *(_OWORD *)&v6[v52 - 256];
      *((_OWORD *)v61 + 1) = v59;
      long long v60 = *(_OWORD *)&v6[v52 - 208];
      *((_OWORD *)v61 + 2) = *(_OWORD *)&v6[v52 - 224];
      *((_OWORD *)v61 + 3) = v60;
      v52 -= 256;
      if (!v52) {
        goto LABEL_20;
      }
    }
    long long v33 = (unsigned int *)&v6[v52];
LABEL_21:
    *long long v33 = v37;
    v33[1] = v36;
    v33[2] = v35;
    v33[3] = v39;
    *((void *)v33 + 2) = result;
    *((unsigned char *)v33 + 24) = v34;
    *(_WORD *)((char *)v33 + 25) = v135;
    *((unsigned char *)v33 + 27) = v136;
    v33[7] = v38;
    *((_OWORD *)v33 + 4) = v142;
    *((_OWORD *)v33 + 5) = v144;
    *((_OWORD *)v33 + 8) = v150;
    *((_OWORD *)v33 + 9) = v152;
    *((_OWORD *)v33 + 12) = v158;
    *((_OWORD *)v33 + 13) = v160;
    *((_OWORD *)v33 + 14) = v162;
    *((_OWORD *)v33 + 15) = v164;
    *((_OWORD *)v33 + 10) = v154;
    *((_OWORD *)v33 + 11) = v156;
    *((_OWORD *)v33 + 6) = v146;
    *((_OWORD *)v33 + 7) = v148;
    *((_OWORD *)v33 + 2) = v138;
    *((_OWORD *)v33 + 3) = v140;
LABEL_22:
    uint64_t v30 = v32 + 64;
    v31 += 256;
    if (v32 + 64 != (unsigned int *)a2) {
      continue;
    }
    return result;
  }
}

uint64_t sub_2194E7804(uint64_t result, uint64_t a2, unint64_t a3, _OWORD *a4)
{
  if (a3)
  {
    uint64_t v4 = a4;
    uint64_t v7 = result;
    if (a3 == 2)
    {
      long long v21 = (long long *)(a2 - 256);
      unsigned int v20 = *(_DWORD *)(a2 - 256);
      unsigned int v22 = *(unsigned __int8 *)(a2 - 232);
      unsigned int v23 = *(unsigned __int8 *)(result + 24);
      if (v22 < v23
        || v23 >= v22
        && ((unsigned int v185 = *(_DWORD *)(a2 - 248), v186 = *(_DWORD *)(result + 8), v185 < v186)
         || v186 >= v185
         && ((unsigned int v187 = *(_DWORD *)(a2 - 252), v188 = *(_DWORD *)(result + 4), v187 < v188)
          || v188 >= v187
          && (v20 < *(_DWORD *)result
           || *(_DWORD *)result >= v20
           && ((unsigned int v189 = *(_DWORD *)(a2 - 228), v190 = *(_DWORD *)(result + 28), v189 < v190)
            || v190 >= v189 && *(_DWORD *)(a2 - 244) < *(_DWORD *)(result + 12))))))
      {
        long long v24 = *v21;
        long long v25 = *(_OWORD *)(a2 - 240);
        long long v26 = *(_OWORD *)(a2 - 208);
        a4[2] = *(_OWORD *)(a2 - 224);
        a4[3] = v26;
        *a4 = v24;
        a4[1] = v25;
        long long v27 = *(_OWORD *)(a2 - 192);
        long long v28 = *(_OWORD *)(a2 - 176);
        long long v29 = *(_OWORD *)(a2 - 144);
        a4[6] = *(_OWORD *)(a2 - 160);
        a4[7] = v29;
        a4[4] = v27;
        a4[5] = v28;
        long long v30 = *(_OWORD *)(a2 - 128);
        long long v31 = *(_OWORD *)(a2 - 112);
        long long v32 = *(_OWORD *)(a2 - 80);
        a4[10] = *(_OWORD *)(a2 - 96);
        a4[11] = v32;
        a4[8] = v30;
        a4[9] = v31;
        long long v33 = *(_OWORD *)(a2 - 64);
        long long v34 = *(_OWORD *)(a2 - 48);
        long long v35 = *(_OWORD *)(a2 - 16);
        a4[14] = *(_OWORD *)(a2 - 32);
        a4[15] = v35;
        a4[12] = v33;
        a4[13] = v34;
        long long v36 = *(_OWORD *)result;
        long long v37 = *(_OWORD *)(result + 16);
        long long v38 = *(_OWORD *)(result + 48);
        a4[18] = *(_OWORD *)(result + 32);
        a4[19] = v38;
        a4[16] = v36;
        a4[17] = v37;
        long long v39 = *(_OWORD *)(result + 64);
        long long v40 = *(_OWORD *)(result + 80);
        long long v41 = *(_OWORD *)(result + 112);
        a4[22] = *(_OWORD *)(result + 96);
        a4[23] = v41;
        a4[20] = v39;
        a4[21] = v40;
        long long v42 = *(_OWORD *)(result + 128);
        long long v43 = *(_OWORD *)(result + 144);
        long long v44 = *(_OWORD *)(result + 176);
        a4[26] = *(_OWORD *)(result + 160);
        a4[27] = v44;
        a4[24] = v42;
        a4[25] = v43;
        long long v45 = *(_OWORD *)(result + 192);
        long long v46 = *(_OWORD *)(result + 208);
        long long v47 = *(_OWORD *)(result + 224);
        long long v48 = *(_OWORD *)(result + 240);
      }
      else
      {
        long long v114 = *(_OWORD *)result;
        long long v115 = *(_OWORD *)(result + 16);
        long long v116 = *(_OWORD *)(result + 48);
        a4[2] = *(_OWORD *)(result + 32);
        a4[3] = v116;
        *a4 = v114;
        a4[1] = v115;
        long long v117 = *(_OWORD *)(result + 64);
        long long v118 = *(_OWORD *)(result + 80);
        long long v119 = *(_OWORD *)(result + 112);
        a4[6] = *(_OWORD *)(result + 96);
        a4[7] = v119;
        a4[4] = v117;
        a4[5] = v118;
        long long v120 = *(_OWORD *)(result + 128);
        long long v121 = *(_OWORD *)(result + 144);
        long long v122 = *(_OWORD *)(result + 176);
        a4[10] = *(_OWORD *)(result + 160);
        a4[11] = v122;
        a4[8] = v120;
        a4[9] = v121;
        long long v123 = *(_OWORD *)(result + 192);
        long long v124 = *(_OWORD *)(result + 208);
        long long v125 = *(_OWORD *)(result + 240);
        a4[14] = *(_OWORD *)(result + 224);
        a4[15] = v125;
        a4[12] = v123;
        a4[13] = v124;
        long long v126 = *v21;
        long long v127 = *(_OWORD *)(a2 - 240);
        long long v128 = *(_OWORD *)(a2 - 208);
        a4[18] = *(_OWORD *)(a2 - 224);
        a4[19] = v128;
        a4[16] = v126;
        a4[17] = v127;
        long long v129 = *(_OWORD *)(a2 - 192);
        long long v130 = *(_OWORD *)(a2 - 176);
        long long v131 = *(_OWORD *)(a2 - 144);
        a4[22] = *(_OWORD *)(a2 - 160);
        a4[23] = v131;
        a4[20] = v129;
        a4[21] = v130;
        long long v132 = *(_OWORD *)(a2 - 128);
        long long v133 = *(_OWORD *)(a2 - 112);
        long long v134 = *(_OWORD *)(a2 - 80);
        a4[26] = *(_OWORD *)(a2 - 96);
        a4[27] = v134;
        a4[24] = v132;
        a4[25] = v133;
        long long v45 = *(_OWORD *)(a2 - 64);
        long long v46 = *(_OWORD *)(a2 - 48);
        long long v47 = *(_OWORD *)(a2 - 32);
        long long v48 = *(_OWORD *)(a2 - 16);
      }
      a4[30] = v47;
      a4[31] = v48;
      a4[28] = v45;
      a4[29] = v46;
    }
    else if (a3 == 1)
    {
      long long v8 = *(_OWORD *)result;
      long long v9 = *(_OWORD *)(result + 16);
      long long v10 = *(_OWORD *)(result + 48);
      a4[2] = *(_OWORD *)(result + 32);
      a4[3] = v10;
      *a4 = v8;
      a4[1] = v9;
      long long v11 = *(_OWORD *)(result + 64);
      long long v12 = *(_OWORD *)(result + 80);
      long long v13 = *(_OWORD *)(result + 112);
      a4[6] = *(_OWORD *)(result + 96);
      a4[7] = v13;
      a4[4] = v11;
      a4[5] = v12;
      long long v14 = *(_OWORD *)(result + 128);
      long long v15 = *(_OWORD *)(result + 144);
      long long v16 = *(_OWORD *)(result + 176);
      a4[10] = *(_OWORD *)(result + 160);
      a4[11] = v16;
      a4[8] = v14;
      a4[9] = v15;
      long long v17 = *(_OWORD *)(result + 192);
      long long v18 = *(_OWORD *)(result + 208);
      long long v19 = *(_OWORD *)(result + 240);
      a4[14] = *(_OWORD *)(result + 224);
      a4[15] = v19;
      a4[12] = v17;
      a4[13] = v18;
    }
    else if ((uint64_t)a3 > 8)
    {
      unint64_t v135 = a3 >> 1;
      unint64_t v136 = a3 >> 1 << 8;
      unint64_t v137 = result + v136;
      sub_2194E70B8(result, result + v136, a3 >> 1, a4, a3 >> 1);
      uint64_t result = sub_2194E70B8(v7 + v136, a2, a3 - v135, (char *)v4 + v136, a3 - v135);
      unint64_t v138 = v7 + v136;
      while (v138 != a2)
      {
        unsigned int v151 = *(unsigned __int8 *)(v138 + 24);
        unsigned int v152 = *(unsigned __int8 *)(v7 + 24);
        if (v151 < v152
          || v152 >= v151
          && ((unsigned int v153 = *(_DWORD *)(v138 + 8), v154 = *(_DWORD *)(v7 + 8), v153 < v154)
           || v154 >= v153
           && ((unsigned int v167 = *(_DWORD *)(v138 + 4), v168 = *(_DWORD *)(v7 + 4), v167 < v168)
            || v168 >= v167
            && (*(_DWORD *)v138 < *(_DWORD *)v7
             || *(_DWORD *)v7 >= *(_DWORD *)v138
             && ((unsigned int v169 = *(_DWORD *)(v138 + 28), v170 = *(_DWORD *)(v7 + 28), v169 < v170)
              || v170 >= v169 && *(_DWORD *)(v138 + 12) < *(_DWORD *)(v7 + 12))))))
        {
          long long v139 = *(_OWORD *)v138;
          long long v140 = *(_OWORD *)(v138 + 16);
          long long v141 = *(_OWORD *)(v138 + 48);
          v4[2] = *(_OWORD *)(v138 + 32);
          v4[3] = v141;
          *uint64_t v4 = v139;
          v4[1] = v140;
          long long v142 = *(_OWORD *)(v138 + 64);
          long long v143 = *(_OWORD *)(v138 + 80);
          long long v144 = *(_OWORD *)(v138 + 112);
          v4[6] = *(_OWORD *)(v138 + 96);
          v4[7] = v144;
          v4[4] = v142;
          v4[5] = v143;
          long long v145 = *(_OWORD *)(v138 + 128);
          long long v146 = *(_OWORD *)(v138 + 144);
          long long v147 = *(_OWORD *)(v138 + 176);
          v4[10] = *(_OWORD *)(v138 + 160);
          v4[11] = v147;
          v4[8] = v145;
          v4[9] = v146;
          long long v148 = *(_OWORD *)(v138 + 192);
          long long v149 = *(_OWORD *)(v138 + 208);
          long long v150 = *(_OWORD *)(v138 + 240);
          v4[14] = *(_OWORD *)(v138 + 224);
          v4[15] = v150;
          v4[12] = v148;
          v4[13] = v149;
          v138 += 256;
          v4 += 16;
          if (v7 == v137) {
            goto LABEL_76;
          }
        }
        else
        {
          long long v155 = *(_OWORD *)v7;
          long long v156 = *(_OWORD *)(v7 + 16);
          long long v157 = *(_OWORD *)(v7 + 48);
          v4[2] = *(_OWORD *)(v7 + 32);
          v4[3] = v157;
          *uint64_t v4 = v155;
          v4[1] = v156;
          long long v158 = *(_OWORD *)(v7 + 64);
          long long v159 = *(_OWORD *)(v7 + 80);
          long long v160 = *(_OWORD *)(v7 + 112);
          v4[6] = *(_OWORD *)(v7 + 96);
          v4[7] = v160;
          v4[4] = v158;
          v4[5] = v159;
          long long v161 = *(_OWORD *)(v7 + 128);
          long long v162 = *(_OWORD *)(v7 + 144);
          long long v163 = *(_OWORD *)(v7 + 176);
          v4[10] = *(_OWORD *)(v7 + 160);
          v4[11] = v163;
          v4[8] = v161;
          v4[9] = v162;
          long long v164 = *(_OWORD *)(v7 + 192);
          long long v165 = *(_OWORD *)(v7 + 208);
          long long v166 = *(_OWORD *)(v7 + 240);
          v4[14] = *(_OWORD *)(v7 + 224);
          v4[15] = v166;
          v4[12] = v164;
          v4[13] = v165;
          v7 += 256;
          v4 += 16;
          if (v7 == v137)
          {
LABEL_76:
            if (v138 != a2)
            {
              unint64_t v191 = 0;
              do
              {
                uint64_t v192 = &v4[v191 / 0x10];
                long long v193 = *(_OWORD *)(v138 + v191);
                long long v194 = *(_OWORD *)(v138 + v191 + 16);
                long long v195 = *(_OWORD *)(v138 + v191 + 48);
                v192[2] = *(_OWORD *)(v138 + v191 + 32);
                v192[3] = v195;
                *uint64_t v192 = v193;
                v192[1] = v194;
                long long v196 = *(_OWORD *)(v138 + v191 + 64);
                long long v197 = *(_OWORD *)(v138 + v191 + 80);
                long long v198 = *(_OWORD *)(v138 + v191 + 112);
                v192[6] = *(_OWORD *)(v138 + v191 + 96);
                v192[7] = v198;
                v192[4] = v196;
                v192[5] = v197;
                long long v199 = *(_OWORD *)(v138 + v191 + 128);
                long long v200 = *(_OWORD *)(v138 + v191 + 144);
                long long v201 = *(_OWORD *)(v138 + v191 + 176);
                v192[10] = *(_OWORD *)(v138 + v191 + 160);
                v192[11] = v201;
                v192[8] = v199;
                v192[9] = v200;
                long long v202 = *(_OWORD *)(v138 + v191 + 192);
                long long v203 = *(_OWORD *)(v138 + v191 + 208);
                long long v204 = *(_OWORD *)(v138 + v191 + 240);
                v192[14] = *(_OWORD *)(v138 + v191 + 224);
                v192[15] = v204;
                v192[12] = v202;
                v192[13] = v203;
                v191 += 256;
              }
              while (v138 + v191 != a2);
            }
            return result;
          }
        }
      }
      if (v7 != v137)
      {
        unint64_t v171 = 0;
        do
        {
          int v172 = &v4[v171 / 0x10];
          long long v173 = *(_OWORD *)(v7 + v171);
          long long v174 = *(_OWORD *)(v7 + v171 + 16);
          long long v175 = *(_OWORD *)(v7 + v171 + 48);
          v172[2] = *(_OWORD *)(v7 + v171 + 32);
          v172[3] = v175;
          *int v172 = v173;
          v172[1] = v174;
          long long v176 = *(_OWORD *)(v7 + v171 + 64);
          long long v177 = *(_OWORD *)(v7 + v171 + 80);
          long long v178 = *(_OWORD *)(v7 + v171 + 112);
          v172[6] = *(_OWORD *)(v7 + v171 + 96);
          v172[7] = v178;
          v172[4] = v176;
          v172[5] = v177;
          long long v179 = *(_OWORD *)(v7 + v171 + 128);
          long long v180 = *(_OWORD *)(v7 + v171 + 144);
          long long v181 = *(_OWORD *)(v7 + v171 + 176);
          v172[10] = *(_OWORD *)(v7 + v171 + 160);
          v172[11] = v181;
          v172[8] = v179;
          v172[9] = v180;
          long long v182 = *(_OWORD *)(v7 + v171 + 192);
          long long v183 = *(_OWORD *)(v7 + v171 + 208);
          long long v184 = *(_OWORD *)(v7 + v171 + 240);
          v172[14] = *(_OWORD *)(v7 + v171 + 224);
          v172[15] = v184;
          v172[12] = v182;
          v172[13] = v183;
          v171 += 256;
        }
        while (v7 + v171 != v137);
      }
    }
    else if (result != a2)
    {
      long long v49 = *(_OWORD *)result;
      long long v50 = *(_OWORD *)(result + 16);
      long long v51 = *(_OWORD *)(result + 48);
      a4[2] = *(_OWORD *)(result + 32);
      a4[3] = v51;
      *a4 = v49;
      a4[1] = v50;
      long long v52 = *(_OWORD *)(result + 64);
      long long v53 = *(_OWORD *)(result + 80);
      long long v54 = *(_OWORD *)(result + 112);
      a4[6] = *(_OWORD *)(result + 96);
      a4[7] = v54;
      a4[4] = v52;
      a4[5] = v53;
      long long v55 = *(_OWORD *)(result + 128);
      long long v56 = *(_OWORD *)(result + 144);
      long long v57 = *(_OWORD *)(result + 176);
      a4[10] = *(_OWORD *)(result + 160);
      a4[11] = v57;
      a4[8] = v55;
      a4[9] = v56;
      long long v58 = *(_OWORD *)(result + 192);
      long long v59 = *(_OWORD *)(result + 208);
      long long v60 = *(_OWORD *)(result + 240);
      a4[14] = *(_OWORD *)(result + 224);
      a4[15] = v60;
      a4[12] = v58;
      a4[13] = v59;
      uint64_t v61 = result + 256;
      if (result + 256 != a2)
      {
        uint64_t v62 = 0;
        unsigned int v63 = a4;
        do
        {
          uint64_t v77 = v7;
          long long v78 = v63;
          uint64_t v7 = v61;
          v63 += 16;
          unsigned int v79 = *(unsigned __int8 *)(v77 + 280);
          unsigned int v80 = *((unsigned __int8 *)v78 + 24);
          if (v79 < v80) {
            goto LABEL_81;
          }
          unsigned int v64 = v63;
          if (v80 >= v79)
          {
            unsigned int v108 = *(_DWORD *)(v77 + 264);
            unsigned int v109 = *((_DWORD *)v78 + 2);
            if (v108 < v109) {
              goto LABEL_81;
            }
            unsigned int v64 = v63;
            if (v109 >= v108)
            {
              unsigned int v110 = *(_DWORD *)(v77 + 260);
              unsigned int v111 = *((_DWORD *)v78 + 1);
              if (v110 < v111
                || (unsigned int v64 = v63, v111 >= v110)
                && (*(_DWORD *)v7 < *(_DWORD *)v78
                 || (unsigned int v64 = v63, *(_DWORD *)v78 >= *(_DWORD *)v7)
                 && ((unsigned int v112 = *(_DWORD *)(v77 + 284), v113 = *((_DWORD *)v78 + 7), v112 < v113)
                  || (unsigned int v64 = v63, v113 >= v112) && (unsigned int v64 = v63, *(_DWORD *)(v77 + 268) < *((_DWORD *)v78 + 3)))))
              {
LABEL_81:
                long long v81 = v78[13];
                v63[12] = v78[12];
                v63[13] = v81;
                long long v82 = v78[15];
                v63[14] = v78[14];
                v63[15] = v82;
                long long v83 = v78[9];
                v63[8] = v78[8];
                v63[9] = v83;
                long long v84 = v78[11];
                v63[10] = v78[10];
                v63[11] = v84;
                long long v85 = v78[5];
                v63[4] = v78[4];
                v63[5] = v85;
                long long v86 = v78[7];
                v63[6] = v78[6];
                v63[7] = v86;
                long long v87 = v78[1];
                *unsigned int v63 = *v78;
                v63[1] = v87;
                long long v88 = v78[3];
                unsigned int v64 = a4;
                v63[2] = v78[2];
                v63[3] = v88;
                if (v78 != a4)
                {
                  uint64_t v89 = v62;
                  while (1)
                  {
                    long long v98 = (_OWORD *)((char *)a4 + v89);
                    unsigned int v99 = *(_DWORD *)((char *)a4 + v89 - 256);
                    unsigned int v100 = *(unsigned __int8 *)(v77 + 280);
                    unsigned int v101 = *((unsigned __int8 *)a4 + v89 - 232);
                    if (v100 >= v101)
                    {
                      if (v101 < v100) {
                        goto LABEL_29;
                      }
                      unsigned int v102 = *(_DWORD *)(v77 + 264);
                      unsigned int v103 = *((_DWORD *)v98 - 62);
                      if (v102 >= v103)
                      {
                        if (v103 < v102) {
                          goto LABEL_29;
                        }
                        unsigned int v104 = *(_DWORD *)(v77 + 260);
                        unsigned int v105 = *((_DWORD *)v98 - 63);
                        if (v104 >= v105)
                        {
                          if (v105 < v104) {
                            goto LABEL_29;
                          }
                          if (*(_DWORD *)v7 >= v99)
                          {
                            if (v99 < *(_DWORD *)v7)
                            {
                              unsigned int v64 = (_OWORD *)((char *)a4 + v89);
                              break;
                            }
                            unsigned int v106 = *(_DWORD *)(v77 + 284);
                            unsigned int v107 = *((_DWORD *)v98 - 57);
                            if (v106 >= v107 && (v107 < v106 || *(_DWORD *)(v77 + 268) >= *((_DWORD *)v98 - 61)))
                            {
LABEL_29:
                              unsigned int v64 = v78;
                              break;
                            }
                          }
                        }
                      }
                    }
                    v78 -= 16;
                    long long v90 = *(_OWORD *)((char *)a4 + v89 - 48);
                    v98[12] = *(_OWORD *)((char *)a4 + v89 - 64);
                    v98[13] = v90;
                    long long v91 = *(_OWORD *)((char *)a4 + v89 - 16);
                    v98[14] = *(_OWORD *)((char *)a4 + v89 - 32);
                    v98[15] = v91;
                    long long v92 = *(_OWORD *)((char *)a4 + v89 - 112);
                    v98[8] = *(_OWORD *)((char *)a4 + v89 - 128);
                    v98[9] = v92;
                    long long v93 = *(_OWORD *)((char *)a4 + v89 - 80);
                    v98[10] = *(_OWORD *)((char *)a4 + v89 - 96);
                    v98[11] = v93;
                    long long v94 = *(_OWORD *)((char *)a4 + v89 - 176);
                    v98[4] = *(_OWORD *)((char *)a4 + v89 - 192);
                    v98[5] = v94;
                    long long v95 = *(_OWORD *)((char *)a4 + v89 - 144);
                    v98[6] = *(_OWORD *)((char *)a4 + v89 - 160);
                    v98[7] = v95;
                    long long v96 = *(_OWORD *)((char *)a4 + v89 - 240);
                    *long long v98 = *(_OWORD *)((char *)a4 + v89 - 256);
                    v98[1] = v96;
                    long long v97 = *(_OWORD *)((char *)a4 + v89 - 208);
                    v98[2] = *(_OWORD *)((char *)a4 + v89 - 224);
                    v98[3] = v97;
                    v89 -= 256;
                    if (!v89)
                    {
                      unsigned int v64 = a4;
                      break;
                    }
                  }
                }
              }
            }
          }
          long long v65 = *(_OWORD *)v7;
          long long v66 = *(_OWORD *)(v7 + 16);
          long long v67 = *(_OWORD *)(v7 + 48);
          v64[2] = *(_OWORD *)(v7 + 32);
          v64[3] = v67;
          *unsigned int v64 = v65;
          v64[1] = v66;
          long long v68 = *(_OWORD *)(v7 + 64);
          long long v69 = *(_OWORD *)(v7 + 80);
          long long v70 = *(_OWORD *)(v7 + 112);
          v64[6] = *(_OWORD *)(v7 + 96);
          v64[7] = v70;
          v64[4] = v68;
          v64[5] = v69;
          long long v71 = *(_OWORD *)(v7 + 128);
          long long v72 = *(_OWORD *)(v7 + 144);
          long long v73 = *(_OWORD *)(v7 + 176);
          v64[10] = *(_OWORD *)(v7 + 160);
          v64[11] = v73;
          v64[8] = v71;
          v64[9] = v72;
          long long v74 = *(_OWORD *)(v7 + 192);
          long long v75 = *(_OWORD *)(v7 + 208);
          long long v76 = *(_OWORD *)(v7 + 240);
          v64[14] = *(_OWORD *)(v7 + 224);
          v64[15] = v76;
          v64[12] = v74;
          v64[13] = v75;
          uint64_t v61 = v7 + 256;
          v62 += 256;
        }
        while (v7 + 256 != a2);
      }
    }
  }
  return result;
}

char *sub_2194E7F38(char *result, char *a2, char *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7)
{
  if (a5)
  {
    uint64_t v7 = a5;
    long long v10 = result;
    uint64_t v235 = a7;
    v236 = a6;
    while (v7 > a7 && a4 > a7)
    {
      if (!a4) {
        return result;
      }
      uint64_t v11 = 0;
      unsigned int v12 = a2[24];
      unsigned int v14 = *(_DWORD *)a2;
      unsigned int v13 = *((_DWORD *)a2 + 1);
      unsigned int v15 = *((_DWORD *)a2 + 7);
      uint64_t v16 = -a4;
      unsigned int v17 = *((_DWORD *)a2 + 2);
      while (1)
      {
        long long v19 = &v10[v11];
        unsigned int v20 = v10[v11 + 24];
        if (v12 < v20) {
          break;
        }
        if (v20 >= v12)
        {
          unsigned int v21 = *((_DWORD *)v19 + 2);
          if (v17 < v21) {
            break;
          }
          if (v21 >= v17)
          {
            unsigned int v22 = *((_DWORD *)v19 + 1);
            if (v13 < v22) {
              break;
            }
            if (v22 >= v13)
            {
              if (v14 < *(_DWORD *)v19) {
                break;
              }
              if (*(_DWORD *)v19 >= v14)
              {
                unsigned int v23 = *((_DWORD *)v19 + 7);
                if (v15 < v23 || v23 >= v15 && *((_DWORD *)a2 + 3) < *((_DWORD *)v19 + 3)) {
                  break;
                }
              }
            }
          }
        }
        v11 += 256;
        if (__CFADD__(v16++, 1)) {
          return result;
        }
      }
      uint64_t v24 = -v16;
      if (-v16 >= v7)
      {
        if (v16 == -1)
        {
          long long v204 = &v10[v11];
          long long v251 = *(_OWORD *)&v10[v11 + 32];
          long long v256 = *(_OWORD *)&v10[v11 + 48];
          long long v241 = *(_OWORD *)&v10[v11];
          long long v246 = *(_OWORD *)&v10[v11 + 16];
          long long v271 = *(_OWORD *)&v10[v11 + 96];
          long long v276 = *(_OWORD *)&v10[v11 + 112];
          long long v261 = *(_OWORD *)&v10[v11 + 64];
          long long v266 = *(_OWORD *)&v10[v11 + 80];
          long long v291 = *(_OWORD *)&v10[v11 + 160];
          long long v296 = *(_OWORD *)&v10[v11 + 176];
          long long v281 = *(_OWORD *)&v10[v11 + 128];
          long long v286 = *(_OWORD *)&v10[v11 + 144];
          long long v310 = *(_OWORD *)&v10[v11 + 224];
          long long v315 = *(_OWORD *)&v10[v11 + 240];
          long long v301 = *(_OWORD *)&v10[v11 + 192];
          long long v306 = *(_OWORD *)&v10[v11 + 208];
          long long v205 = *(_OWORD *)a2;
          long long v206 = *((_OWORD *)a2 + 1);
          long long v207 = *((_OWORD *)a2 + 3);
          *((_OWORD *)v204 + 2) = *((_OWORD *)a2 + 2);
          *((_OWORD *)v204 + 3) = v207;
          *(_OWORD *)long long v204 = v205;
          *((_OWORD *)v204 + 1) = v206;
          long long v208 = *((_OWORD *)a2 + 4);
          long long v209 = *((_OWORD *)a2 + 5);
          long long v210 = *((_OWORD *)a2 + 7);
          *((_OWORD *)v204 + 6) = *((_OWORD *)a2 + 6);
          *((_OWORD *)v204 + 7) = v210;
          *((_OWORD *)v204 + 4) = v208;
          *((_OWORD *)v204 + 5) = v209;
          long long v211 = *((_OWORD *)a2 + 8);
          long long v212 = *((_OWORD *)a2 + 9);
          long long v213 = *((_OWORD *)a2 + 11);
          *((_OWORD *)v204 + 10) = *((_OWORD *)a2 + 10);
          *((_OWORD *)v204 + 11) = v213;
          *((_OWORD *)v204 + 8) = v211;
          *((_OWORD *)v204 + 9) = v212;
          long long v214 = *((_OWORD *)a2 + 12);
          long long v215 = *((_OWORD *)a2 + 13);
          long long v216 = *((_OWORD *)a2 + 15);
          *((_OWORD *)v204 + 14) = *((_OWORD *)a2 + 14);
          *((_OWORD *)v204 + 15) = v216;
          *((_OWORD *)v204 + 12) = v214;
          *((_OWORD *)v204 + 13) = v215;
          *((_OWORD *)a2 + 12) = v301;
          *((_OWORD *)a2 + 13) = v306;
          *((_OWORD *)a2 + 14) = v310;
          *((_OWORD *)a2 + 15) = v315;
          *((_OWORD *)a2 + 8) = v281;
          *((_OWORD *)a2 + 9) = v286;
          *((_OWORD *)a2 + 10) = v291;
          *((_OWORD *)a2 + 11) = v296;
          *((_OWORD *)a2 + 4) = v261;
          *((_OWORD *)a2 + 5) = v266;
          *((_OWORD *)a2 + 6) = v271;
          *((_OWORD *)a2 + 7) = v276;
          *(_OWORD *)a2 = v241;
          *((_OWORD *)a2 + 1) = v246;
          *((_OWORD *)a2 + 2) = v251;
          *((_OWORD *)a2 + 3) = v256;
          return result;
        }
        if (v16 > 0) {
          uint64_t v24 = 1 - v16;
        }
        uint64_t v29 = v24 >> 1;
        long long v28 = &v10[256 * (v24 >> 1) + v11];
        if (a2 == a3)
        {
          uint64_t v26 = 0;
        }
        else
        {
          uint64_t v26 = 0;
          unint64_t v52 = (a3 - a2) >> 8;
          unsigned int v53 = v28[24];
          unsigned int v55 = *(_DWORD *)v28;
          unsigned int v54 = *((_DWORD *)v28 + 1);
          unsigned int v56 = *((_DWORD *)v28 + 7);
          unsigned int v57 = *((_DWORD *)v28 + 2);
          do
          {
            unint64_t v58 = v52 >> 1;
            unint64_t v59 = (v52 >> 1) + v26;
            long long v60 = &a2[256 * v59];
            unsigned int v61 = v60[24];
            if (v61 < v53
              || v53 >= v61
              && ((unsigned int v62 = *((_DWORD *)v60 + 2), v62 < v57)
               || v57 >= v62
               && ((unsigned int v63 = *((_DWORD *)v60 + 1), v63 < v54)
                || v54 >= v63
                && (*(_DWORD *)v60 < v55
                 || v55 >= *(_DWORD *)v60
                 && ((unsigned int v64 = *((_DWORD *)v60 + 7), v64 < v56) || v56 >= v64
                                                             && *((_DWORD *)v60 + 3) < *((_DWORD *)v28 + 3))))))
            {
              uint64_t v26 = v59 + 1;
              unint64_t v58 = v52 + ~v58;
            }
            unint64_t v52 = v58;
          }
          while (v58);
        }
        uint64_t v30 = v26 << 8 >> 8;
        long long v27 = v28;
        long long v31 = &a2[256 * v26];
        if (v28 != a2)
        {
LABEL_49:
          long long v32 = v27;
          if (v26)
          {
            long long v47 = v28 + 256;
            if (v28 + 256 == a2)
            {
              long long v248 = *((_OWORD *)v28 + 2);
              long long v253 = *((_OWORD *)v28 + 3);
              long long v238 = *(_OWORD *)v28;
              long long v243 = *((_OWORD *)v28 + 1);
              long long v268 = *((_OWORD *)v28 + 6);
              long long v273 = *((_OWORD *)v28 + 7);
              long long v258 = *((_OWORD *)v28 + 4);
              long long v263 = *((_OWORD *)v28 + 5);
              long long v288 = *((_OWORD *)v28 + 10);
              long long v293 = *((_OWORD *)v28 + 11);
              long long v278 = *((_OWORD *)v28 + 8);
              long long v283 = *((_OWORD *)v28 + 9);
              long long v308 = *((_OWORD *)v28 + 14);
              long long v312 = *((_OWORD *)v28 + 15);
              long long v298 = *((_OWORD *)v28 + 12);
              long long v303 = *((_OWORD *)v28 + 13);
              int64_t v65 = v31 - a2;
              long long v66 = a3;
              uint64_t v232 = v30;
              v234 = v27;
              uint64_t v67 = v29;
              memmove(v28, a2, v31 - a2);
              uint64_t v29 = v67;
              uint64_t v30 = v232;
              long long v27 = v234;
              a7 = v235;
              a6 = v236;
              a3 = v66;
              long long v32 = &v28[v65];
              *((_OWORD *)v32 + 2) = v248;
              *((_OWORD *)v32 + 3) = v253;
              *(_OWORD *)long long v32 = v238;
              *((_OWORD *)v32 + 1) = v243;
              *((_OWORD *)v32 + 6) = v268;
              *((_OWORD *)v32 + 7) = v273;
              *((_OWORD *)v32 + 4) = v258;
              *((_OWORD *)v32 + 5) = v263;
              *((_OWORD *)v32 + 10) = v288;
              *((_OWORD *)v32 + 11) = v293;
              *((_OWORD *)v32 + 8) = v278;
              *((_OWORD *)v32 + 9) = v283;
              *((_OWORD *)v32 + 14) = v308;
              *((_OWORD *)v32 + 15) = v312;
              *((_OWORD *)v32 + 12) = v298;
              *((_OWORD *)v32 + 13) = v303;
            }
            else if (v26 == 1)
            {
              long long v297 = *((_OWORD *)v31 - 4);
              long long v302 = *((_OWORD *)v31 - 3);
              long long v307 = *((_OWORD *)v31 - 2);
              long long v311 = *((_OWORD *)v31 - 1);
              long long v277 = *((_OWORD *)v31 - 8);
              long long v282 = *((_OWORD *)v31 - 7);
              long long v287 = *((_OWORD *)v31 - 6);
              long long v292 = *((_OWORD *)v31 - 5);
              long long v257 = *((_OWORD *)v31 - 12);
              long long v262 = *((_OWORD *)v31 - 11);
              long long v267 = *((_OWORD *)v31 - 10);
              long long v272 = *((_OWORD *)v31 - 9);
              long long v237 = *((_OWORD *)v31 - 16);
              long long v242 = *((_OWORD *)v31 - 15);
              size_t v48 = v31 - 256 - v27;
              long long v32 = v27 + 256;
              long long v247 = *((_OWORD *)v31 - 14);
              long long v252 = *((_OWORD *)v31 - 13);
              if (v31 - 256 != v28)
              {
                long long v49 = v27 + 256;
                long long v50 = a3;
                uint64_t v231 = v30;
                v233 = v27;
                uint64_t v51 = v29;
                memmove(v49, v28, v48);
                uint64_t v29 = v51;
                uint64_t v30 = v231;
                long long v27 = v233;
                a7 = v235;
                a6 = v236;
                a3 = v50;
              }
              *((_OWORD *)v28 + 2) = v247;
              *((_OWORD *)v28 + 3) = v252;
              *(_OWORD *)long long v28 = v237;
              *((_OWORD *)v28 + 1) = v242;
              *((_OWORD *)v28 + 6) = v267;
              *((_OWORD *)v28 + 7) = v272;
              *((_OWORD *)v28 + 4) = v257;
              *((_OWORD *)v28 + 5) = v262;
              *((_OWORD *)v28 + 10) = v287;
              *((_OWORD *)v28 + 11) = v292;
              *((_OWORD *)v28 + 8) = v277;
              *((_OWORD *)v28 + 9) = v282;
              *((_OWORD *)v28 + 14) = v307;
              *((_OWORD *)v28 + 15) = v311;
              *((_OWORD *)v28 + 12) = v297;
              *((_OWORD *)v28 + 13) = v302;
            }
            else
            {
              uint64_t v68 = (a2 - v27) >> 8;
              uint64_t v69 = (v31 - a2) >> 8;
              if (v68 == v69)
              {
                uint64_t v70 = (v26 << 8) - 256;
                long long v71 = a2;
                do
                {
                  long long v249 = *((_OWORD *)v47 - 14);
                  long long v254 = *((_OWORD *)v47 - 13);
                  long long v239 = *((_OWORD *)v47 - 16);
                  long long v244 = *((_OWORD *)v47 - 15);
                  long long v269 = *((_OWORD *)v47 - 10);
                  long long v274 = *((_OWORD *)v47 - 9);
                  long long v259 = *((_OWORD *)v47 - 12);
                  long long v264 = *((_OWORD *)v47 - 11);
                  long long v289 = *((_OWORD *)v47 - 6);
                  long long v294 = *((_OWORD *)v47 - 5);
                  long long v279 = *((_OWORD *)v47 - 8);
                  long long v284 = *((_OWORD *)v47 - 7);
                  long long v309 = *((_OWORD *)v47 - 2);
                  long long v313 = *((_OWORD *)v47 - 1);
                  long long v299 = *((_OWORD *)v47 - 4);
                  long long v304 = *((_OWORD *)v47 - 3);
                  long long v72 = *(_OWORD *)v71;
                  long long v73 = *((_OWORD *)v71 + 1);
                  long long v74 = *((_OWORD *)v71 + 3);
                  *((_OWORD *)v47 - 14) = *((_OWORD *)v71 + 2);
                  *((_OWORD *)v47 - 13) = v74;
                  *((_OWORD *)v47 - 16) = v72;
                  *((_OWORD *)v47 - 15) = v73;
                  long long v75 = *((_OWORD *)v71 + 4);
                  long long v76 = *((_OWORD *)v71 + 5);
                  long long v77 = *((_OWORD *)v71 + 7);
                  *((_OWORD *)v47 - 10) = *((_OWORD *)v71 + 6);
                  *((_OWORD *)v47 - 9) = v77;
                  *((_OWORD *)v47 - 12) = v75;
                  *((_OWORD *)v47 - 11) = v76;
                  long long v78 = *((_OWORD *)v71 + 8);
                  long long v79 = *((_OWORD *)v71 + 9);
                  long long v80 = *((_OWORD *)v71 + 11);
                  *((_OWORD *)v47 - 6) = *((_OWORD *)v71 + 10);
                  *((_OWORD *)v47 - 5) = v80;
                  *((_OWORD *)v47 - 8) = v78;
                  *((_OWORD *)v47 - 7) = v79;
                  long long v81 = *((_OWORD *)v71 + 12);
                  long long v82 = *((_OWORD *)v71 + 13);
                  long long v83 = *((_OWORD *)v71 + 15);
                  *((_OWORD *)v47 - 2) = *((_OWORD *)v71 + 14);
                  *((_OWORD *)v47 - 1) = v83;
                  *((_OWORD *)v47 - 4) = v81;
                  *((_OWORD *)v47 - 3) = v82;
                  *((_OWORD *)v71 + 12) = v299;
                  *((_OWORD *)v71 + 13) = v304;
                  *((_OWORD *)v71 + 14) = v309;
                  *((_OWORD *)v71 + 15) = v313;
                  *((_OWORD *)v71 + 8) = v279;
                  *((_OWORD *)v71 + 9) = v284;
                  *((_OWORD *)v71 + 10) = v289;
                  *((_OWORD *)v71 + 11) = v294;
                  *((_OWORD *)v71 + 4) = v259;
                  *((_OWORD *)v71 + 5) = v264;
                  *((_OWORD *)v71 + 6) = v269;
                  *((_OWORD *)v71 + 7) = v274;
                  *(_OWORD *)long long v71 = v239;
                  *((_OWORD *)v71 + 1) = v244;
                  *((_OWORD *)v71 + 2) = v249;
                  *((_OWORD *)v71 + 3) = v254;
                  if (v47 == a2) {
                    break;
                  }
                  v71 += 256;
                  v47 += 256;
                  uint64_t v84 = v70;
                  v70 -= 256;
                }
                while (v84);
                long long v32 = a2;
              }
              else
              {
                uint64_t v85 = (v31 - a2) >> 8;
                uint64_t v86 = (a2 - v27) >> 8;
                do
                {
                  uint64_t v87 = v86;
                  uint64_t v86 = v85;
                  uint64_t v85 = v87 % v85;
                }
                while (v85);
                if (v86)
                {
                  long long v88 = &v28[256 * v86];
                  do
                  {
                    long long v250 = *((_OWORD *)v88 - 14);
                    long long v255 = *((_OWORD *)v88 - 13);
                    long long v240 = *((_OWORD *)v88 - 16);
                    long long v245 = *((_OWORD *)v88 - 15);
                    long long v270 = *((_OWORD *)v88 - 10);
                    long long v275 = *((_OWORD *)v88 - 9);
                    long long v260 = *((_OWORD *)v88 - 12);
                    long long v265 = *((_OWORD *)v88 - 11);
                    long long v290 = *((_OWORD *)v88 - 6);
                    long long v295 = *((_OWORD *)v88 - 5);
                    long long v280 = *((_OWORD *)v88 - 8);
                    long long v285 = *((_OWORD *)v88 - 7);
                    long long v89 = *((_OWORD *)v88 - 4);
                    long long v90 = *((_OWORD *)v88 - 3);
                    long long v91 = *((_OWORD *)v88 - 2);
                    long long v92 = *((_OWORD *)v88 - 1);
                    v88 -= 256;
                    long long v314 = v92;
                    long long v300 = v89;
                    long long v305 = v90;
                    long long v93 = &v88[256 * v68];
                    long long v94 = v88;
                    do
                    {
                      long long v95 = v93;
                      long long v96 = *(_OWORD *)v93;
                      long long v97 = *((_OWORD *)v93 + 1);
                      long long v98 = *((_OWORD *)v93 + 3);
                      *((_OWORD *)v94 + 2) = *((_OWORD *)v93 + 2);
                      *((_OWORD *)v94 + 3) = v98;
                      *(_OWORD *)long long v94 = v96;
                      *((_OWORD *)v94 + 1) = v97;
                      long long v99 = *((_OWORD *)v93 + 4);
                      long long v100 = *((_OWORD *)v93 + 5);
                      long long v101 = *((_OWORD *)v93 + 7);
                      *((_OWORD *)v94 + 6) = *((_OWORD *)v93 + 6);
                      *((_OWORD *)v94 + 7) = v101;
                      *((_OWORD *)v94 + 4) = v99;
                      *((_OWORD *)v94 + 5) = v100;
                      long long v102 = *((_OWORD *)v93 + 8);
                      long long v103 = *((_OWORD *)v93 + 9);
                      long long v104 = *((_OWORD *)v93 + 11);
                      *((_OWORD *)v94 + 10) = *((_OWORD *)v93 + 10);
                      *((_OWORD *)v94 + 11) = v104;
                      *((_OWORD *)v94 + 8) = v102;
                      *((_OWORD *)v94 + 9) = v103;
                      long long v105 = *((_OWORD *)v93 + 12);
                      long long v106 = *((_OWORD *)v93 + 13);
                      long long v107 = *((_OWORD *)v93 + 15);
                      *((_OWORD *)v94 + 14) = *((_OWORD *)v93 + 14);
                      *((_OWORD *)v94 + 15) = v107;
                      *((_OWORD *)v94 + 12) = v105;
                      *((_OWORD *)v94 + 13) = v106;
                      uint64_t v108 = (v31 - v93) >> 8;
                      v93 += 256 * v68;
                      BOOL v109 = __OFSUB__(v68, v108);
                      uint64_t v111 = v68 - v108;
                      char v110 = (v111 < 0) ^ v109;
                      unsigned int v112 = &v28[256 * v111];
                      if (!v110) {
                        long long v93 = v112;
                      }
                      long long v94 = v95;
                    }
                    while (v93 != v88);
                    *((_OWORD *)v95 + 2) = v250;
                    *((_OWORD *)v95 + 3) = v255;
                    *(_OWORD *)long long v95 = v240;
                    *((_OWORD *)v95 + 1) = v245;
                    *((_OWORD *)v95 + 6) = v270;
                    *((_OWORD *)v95 + 7) = v275;
                    *((_OWORD *)v95 + 4) = v260;
                    *((_OWORD *)v95 + 5) = v265;
                    *((_OWORD *)v95 + 10) = v290;
                    *((_OWORD *)v95 + 11) = v295;
                    *((_OWORD *)v95 + 8) = v280;
                    *((_OWORD *)v95 + 9) = v285;
                    *((_OWORD *)v95 + 14) = v91;
                    *((_OWORD *)v95 + 15) = v314;
                    *((_OWORD *)v95 + 12) = v300;
                    *((_OWORD *)v95 + 13) = v305;
                  }
                  while (v88 != v28);
                }
                long long v32 = &v28[256 * v69];
              }
            }
          }
          goto LABEL_86;
        }
      }
      else
      {
        if (v7 >= 0) {
          uint64_t v25 = v7;
        }
        else {
          uint64_t v25 = v7 + 1;
        }
        uint64_t v26 = v25 >> 1;
        if (a2 - v10 == v11)
        {
          long long v27 = &v10[v11];
          long long v28 = &v10[v11];
        }
        else
        {
          long long v33 = &a2[256 * v26];
          unint64_t v34 = (a2 - v10 - v11) >> 8;
          unsigned int v35 = v33[24];
          unsigned int v37 = *(_DWORD *)v33;
          unsigned int v36 = *((_DWORD *)v33 + 1);
          unsigned int v38 = *((_DWORD *)v33 + 7);
          unsigned int v39 = *((_DWORD *)v33 + 2);
          unsigned int v40 = *((_DWORD *)v33 + 3);
          long long v28 = &v10[v11];
          do
          {
            unint64_t v41 = v34 >> 1;
            long long v42 = &v28[256 * (v34 >> 1)];
            unsigned int v43 = v42[24];
            if (v35 >= v43)
            {
              if (v43 < v35
                || (unsigned int v44 = *((_DWORD *)v42 + 2), v39 >= v44)
                && (v44 < v39
                 || (unsigned int v45 = *((_DWORD *)v42 + 1), v36 >= v45)
                 && (v45 < v36
                  || v37 >= *(_DWORD *)v42
                  && (*(_DWORD *)v42 < v37
                   || (unsigned int v46 = *((_DWORD *)v42 + 7), v38 >= v46) && (v46 < v38 || v40 >= *((_DWORD *)v42 + 3))))))
              {
                long long v28 = v42 + 256;
                unint64_t v41 = v34 + ~v41;
              }
            }
            unint64_t v34 = v41;
          }
          while (v41);
          long long v27 = v28;
        }
        uint64_t v29 = (v27 - v10 - v11) >> 8;
        uint64_t v30 = v26;
        long long v31 = &a2[256 * v26];
        if (v28 != a2) {
          goto LABEL_49;
        }
      }
      long long v32 = v31;
LABEL_86:
      a4 = -v29 - v16;
      uint64_t v113 = v7 - v30;
      if (v29 + v30 >= v7 - (v29 + v30) - v16)
      {
        a4 = v29;
        uint64_t v116 = v30;
        uint64_t result = (char *)sub_2194E7F38(v32, v31, a3, -v29 - v16, v7 - v30, a6, a7);
        a3 = v32;
        uint64_t v7 = v116;
        v10 += v11;
        a2 = v27;
        a7 = v235;
        a6 = v236;
        if (!v116) {
          return result;
        }
      }
      else
      {
        long long v114 = v27;
        long long v115 = a3;
        uint64_t result = (char *)sub_2194E7F38(&v10[v11], v114, v32, v29, v30, a6, a7);
        a3 = v115;
        uint64_t v7 = v113;
        long long v10 = v32;
        a2 = v31;
        a7 = v235;
        a6 = v236;
        if (!v113) {
          return result;
        }
      }
    }
    if (a4 <= v7)
    {
      if (v10 != a2)
      {
        unint64_t v156 = 0;
        do
        {
          long long v157 = &a6[v156];
          long long v158 = *(_OWORD *)&v10[v156];
          long long v159 = *(_OWORD *)&v10[v156 + 16];
          long long v160 = *(_OWORD *)&v10[v156 + 48];
          *((_OWORD *)v157 + 2) = *(_OWORD *)&v10[v156 + 32];
          *((_OWORD *)v157 + 3) = v160;
          *(_OWORD *)long long v157 = v158;
          *((_OWORD *)v157 + 1) = v159;
          long long v161 = *(_OWORD *)&v10[v156 + 64];
          long long v162 = *(_OWORD *)&v10[v156 + 80];
          long long v163 = *(_OWORD *)&v10[v156 + 112];
          *((_OWORD *)v157 + 6) = *(_OWORD *)&v10[v156 + 96];
          *((_OWORD *)v157 + 7) = v163;
          *((_OWORD *)v157 + 4) = v161;
          *((_OWORD *)v157 + 5) = v162;
          long long v164 = *(_OWORD *)&v10[v156 + 128];
          long long v165 = *(_OWORD *)&v10[v156 + 144];
          long long v166 = *(_OWORD *)&v10[v156 + 176];
          *((_OWORD *)v157 + 10) = *(_OWORD *)&v10[v156 + 160];
          *((_OWORD *)v157 + 11) = v166;
          *((_OWORD *)v157 + 8) = v164;
          *((_OWORD *)v157 + 9) = v165;
          long long v167 = *(_OWORD *)&v10[v156 + 192];
          long long v168 = *(_OWORD *)&v10[v156 + 208];
          long long v169 = *(_OWORD *)&v10[v156 + 240];
          *((_OWORD *)v157 + 14) = *(_OWORD *)&v10[v156 + 224];
          *((_OWORD *)v157 + 15) = v169;
          *((_OWORD *)v157 + 12) = v167;
          *((_OWORD *)v157 + 13) = v168;
          v156 += 256;
        }
        while (&v10[v156] != a2);
        if (v156)
        {
          unsigned int v170 = &a6[v156];
          unint64_t v171 = a6;
          while (a2 != a3)
          {
            unsigned int v184 = a2[24];
            unsigned int v185 = v171[24];
            if (v184 < v185
              || v185 >= v184
              && ((unsigned int v198 = *((_DWORD *)a2 + 2), v199 = *((_DWORD *)v171 + 2), v198 < v199)
               || v199 >= v198
               && ((unsigned int v200 = *((_DWORD *)a2 + 1), v201 = *((_DWORD *)v171 + 1), v200 < v201)
                || v201 >= v200
                && (*(_DWORD *)a2 < *(_DWORD *)v171
                 || *(_DWORD *)v171 >= *(_DWORD *)a2
                 && ((unsigned int v202 = *((_DWORD *)a2 + 7), v203 = *((_DWORD *)v171 + 7), v202 < v203)
                  || v203 >= v202 && *((_DWORD *)a2 + 3) < *((_DWORD *)v171 + 3))))))
            {
              long long v172 = *(_OWORD *)a2;
              long long v173 = *((_OWORD *)a2 + 1);
              long long v174 = *((_OWORD *)a2 + 3);
              *((_OWORD *)v10 + 2) = *((_OWORD *)a2 + 2);
              *((_OWORD *)v10 + 3) = v174;
              *(_OWORD *)long long v10 = v172;
              *((_OWORD *)v10 + 1) = v173;
              long long v175 = *((_OWORD *)a2 + 4);
              long long v176 = *((_OWORD *)a2 + 5);
              long long v177 = *((_OWORD *)a2 + 7);
              *((_OWORD *)v10 + 6) = *((_OWORD *)a2 + 6);
              *((_OWORD *)v10 + 7) = v177;
              *((_OWORD *)v10 + 4) = v175;
              *((_OWORD *)v10 + 5) = v176;
              long long v178 = *((_OWORD *)a2 + 8);
              long long v179 = *((_OWORD *)a2 + 9);
              long long v180 = *((_OWORD *)a2 + 11);
              *((_OWORD *)v10 + 10) = *((_OWORD *)a2 + 10);
              *((_OWORD *)v10 + 11) = v180;
              *((_OWORD *)v10 + 8) = v178;
              *((_OWORD *)v10 + 9) = v179;
              long long v181 = *((_OWORD *)a2 + 12);
              long long v182 = *((_OWORD *)a2 + 13);
              long long v183 = *((_OWORD *)a2 + 15);
              *((_OWORD *)v10 + 14) = *((_OWORD *)a2 + 14);
              *((_OWORD *)v10 + 15) = v183;
              *((_OWORD *)v10 + 12) = v181;
              *((_OWORD *)v10 + 13) = v182;
              a2 += 256;
              v10 += 256;
              if (v170 == v171) {
                return result;
              }
            }
            else
            {
              long long v186 = *(_OWORD *)v171;
              long long v187 = *((_OWORD *)v171 + 1);
              long long v188 = *((_OWORD *)v171 + 3);
              *((_OWORD *)v10 + 2) = *((_OWORD *)v171 + 2);
              *((_OWORD *)v10 + 3) = v188;
              *(_OWORD *)long long v10 = v186;
              *((_OWORD *)v10 + 1) = v187;
              long long v189 = *((_OWORD *)v171 + 4);
              long long v190 = *((_OWORD *)v171 + 5);
              long long v191 = *((_OWORD *)v171 + 7);
              *((_OWORD *)v10 + 6) = *((_OWORD *)v171 + 6);
              *((_OWORD *)v10 + 7) = v191;
              *((_OWORD *)v10 + 4) = v189;
              *((_OWORD *)v10 + 5) = v190;
              long long v192 = *((_OWORD *)v171 + 8);
              long long v193 = *((_OWORD *)v171 + 9);
              long long v194 = *((_OWORD *)v171 + 11);
              *((_OWORD *)v10 + 10) = *((_OWORD *)v171 + 10);
              *((_OWORD *)v10 + 11) = v194;
              *((_OWORD *)v10 + 8) = v192;
              *((_OWORD *)v10 + 9) = v193;
              long long v195 = *((_OWORD *)v171 + 12);
              long long v196 = *((_OWORD *)v171 + 13);
              long long v197 = *((_OWORD *)v171 + 15);
              *((_OWORD *)v10 + 14) = *((_OWORD *)v171 + 14);
              *((_OWORD *)v10 + 15) = v197;
              *((_OWORD *)v10 + 12) = v195;
              *((_OWORD *)v10 + 13) = v196;
              v171 += 256;
              v10 += 256;
              if (v170 == v171) {
                return result;
              }
            }
          }
          return (char *)memmove(v10, v171, a6 - v171 + v156);
        }
      }
    }
    else if (a3 != a2)
    {
      unint64_t v117 = 0;
      do
      {
        long long v118 = &a6[v117];
        long long v119 = *(_OWORD *)&a2[v117];
        long long v120 = *(_OWORD *)&a2[v117 + 16];
        long long v121 = *(_OWORD *)&a2[v117 + 48];
        *((_OWORD *)v118 + 2) = *(_OWORD *)&a2[v117 + 32];
        *((_OWORD *)v118 + 3) = v121;
        *(_OWORD *)long long v118 = v119;
        *((_OWORD *)v118 + 1) = v120;
        long long v122 = *(_OWORD *)&a2[v117 + 64];
        long long v123 = *(_OWORD *)&a2[v117 + 80];
        long long v124 = *(_OWORD *)&a2[v117 + 112];
        *((_OWORD *)v118 + 6) = *(_OWORD *)&a2[v117 + 96];
        *((_OWORD *)v118 + 7) = v124;
        *((_OWORD *)v118 + 4) = v122;
        *((_OWORD *)v118 + 5) = v123;
        long long v125 = *(_OWORD *)&a2[v117 + 128];
        long long v126 = *(_OWORD *)&a2[v117 + 144];
        long long v127 = *(_OWORD *)&a2[v117 + 176];
        *((_OWORD *)v118 + 10) = *(_OWORD *)&a2[v117 + 160];
        *((_OWORD *)v118 + 11) = v127;
        *((_OWORD *)v118 + 8) = v125;
        *((_OWORD *)v118 + 9) = v126;
        long long v128 = *(_OWORD *)&a2[v117 + 192];
        long long v129 = *(_OWORD *)&a2[v117 + 208];
        long long v130 = *(_OWORD *)&a2[v117 + 240];
        *((_OWORD *)v118 + 14) = *(_OWORD *)&a2[v117 + 224];
        *((_OWORD *)v118 + 15) = v130;
        *((_OWORD *)v118 + 12) = v128;
        *((_OWORD *)v118 + 13) = v129;
        v117 += 256;
      }
      while (&a2[v117] != a3);
      if (v117)
      {
        long long v131 = &a6[v117];
        for (uint64_t i = a3 - 256; ; i -= 256)
        {
          if (a2 == v10)
          {
            unint64_t v217 = 0;
            do
            {
              v218 = &i[v217];
              long long v219 = *(_OWORD *)&v131[v217 - 256];
              long long v220 = *(_OWORD *)&v131[v217 - 240];
              long long v221 = *(_OWORD *)&v131[v217 - 208];
              *((_OWORD *)v218 + 2) = *(_OWORD *)&v131[v217 - 224];
              *((_OWORD *)v218 + 3) = v221;
              *(_OWORD *)v218 = v219;
              *((_OWORD *)v218 + 1) = v220;
              long long v222 = *(_OWORD *)&v131[v217 - 192];
              long long v223 = *(_OWORD *)&v131[v217 - 176];
              long long v224 = *(_OWORD *)&v131[v217 - 144];
              *((_OWORD *)v218 + 6) = *(_OWORD *)&v131[v217 - 160];
              *((_OWORD *)v218 + 7) = v224;
              *((_OWORD *)v218 + 4) = v222;
              *((_OWORD *)v218 + 5) = v223;
              long long v225 = *(_OWORD *)&v131[v217 - 128];
              long long v226 = *(_OWORD *)&v131[v217 - 112];
              long long v227 = *(_OWORD *)&v131[v217 - 80];
              *((_OWORD *)v218 + 10) = *(_OWORD *)&v131[v217 - 96];
              *((_OWORD *)v218 + 11) = v227;
              *((_OWORD *)v218 + 8) = v225;
              *((_OWORD *)v218 + 9) = v226;
              long long v228 = *(_OWORD *)&v131[v217 - 64];
              long long v229 = *(_OWORD *)&v131[v217 - 48];
              long long v230 = *(_OWORD *)&v131[v217 - 16];
              *((_OWORD *)v218 + 14) = *(_OWORD *)&v131[v217 - 32];
              *((_OWORD *)v218 + 15) = v230;
              *((_OWORD *)v218 + 12) = v228;
              *((_OWORD *)v218 + 13) = v229;
              v217 -= 256;
            }
            while (&v131[v217] != a6);
            return result;
          }
          long long v145 = a2 - 256;
          unsigned int v146 = *((_DWORD *)a2 - 64);
          unsigned int v147 = *((_DWORD *)v131 - 64);
          unsigned int v148 = *(v131 - 232);
          unsigned int v149 = *(a2 - 232);
          if (v148 >= v149)
          {
            if (v149 < v148) {
              goto LABEL_102;
            }
            unsigned int v150 = *((_DWORD *)v131 - 62);
            unsigned int v151 = *((_DWORD *)a2 - 62);
            if (v150 >= v151)
            {
              if (v151 < v150) {
                goto LABEL_102;
              }
              unsigned int v152 = *((_DWORD *)v131 - 63);
              unsigned int v153 = *((_DWORD *)a2 - 63);
              if (v152 >= v153)
              {
                if (v153 < v152) {
                  goto LABEL_102;
                }
                if (v147 >= v146)
                {
                  if (v146 < v147) {
                    goto LABEL_102;
                  }
                  unsigned int v154 = *((_DWORD *)v131 - 57);
                  unsigned int v155 = *((_DWORD *)a2 - 57);
                  if (v154 >= v155) {
                    break;
                  }
                }
              }
            }
          }
          uint64_t result = a2 - 256;
LABEL_98:
          long long v133 = *(_OWORD *)v145;
          long long v134 = *((_OWORD *)v145 + 1);
          long long v135 = *((_OWORD *)v145 + 3);
          *((_OWORD *)i + 2) = *((_OWORD *)v145 + 2);
          *((_OWORD *)i + 3) = v135;
          *(_OWORD *)uint64_t i = v133;
          *((_OWORD *)i + 1) = v134;
          long long v136 = *((_OWORD *)v145 + 4);
          long long v137 = *((_OWORD *)v145 + 5);
          long long v138 = *((_OWORD *)v145 + 7);
          *((_OWORD *)i + 6) = *((_OWORD *)v145 + 6);
          *((_OWORD *)i + 7) = v138;
          *((_OWORD *)i + 4) = v136;
          *((_OWORD *)i + 5) = v137;
          long long v139 = *((_OWORD *)v145 + 8);
          long long v140 = *((_OWORD *)v145 + 9);
          long long v141 = *((_OWORD *)v145 + 11);
          *((_OWORD *)i + 10) = *((_OWORD *)v145 + 10);
          *((_OWORD *)i + 11) = v141;
          *((_OWORD *)i + 8) = v139;
          *((_OWORD *)i + 9) = v140;
          long long v142 = *((_OWORD *)v145 + 12);
          long long v143 = *((_OWORD *)v145 + 13);
          long long v144 = *((_OWORD *)v145 + 15);
          *((_OWORD *)i + 14) = *((_OWORD *)v145 + 14);
          *((_OWORD *)i + 15) = v144;
          *((_OWORD *)i + 12) = v142;
          *((_OWORD *)i + 13) = v143;
          a2 = result;
          if (v131 == a6) {
            return result;
          }
        }
        if (v155 >= v154)
        {
          uint64_t result = a2 - 256;
          if (*((_DWORD *)v131 - 61) < *((_DWORD *)a2 - 61)) {
            goto LABEL_98;
          }
        }
LABEL_102:
        long long v145 = v131 - 256;
        uint64_t result = a2;
        v131 -= 256;
        goto LABEL_98;
      }
    }
  }
  return result;
}

uint64_t *sub_2194E8B68(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    long long v9 = *(uint64_t ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      long long v10 = *v9;
      if (*v9)
      {
        if (v8.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v12 = v10[1];
            if (v12 == v6)
            {
              if (*((_DWORD *)v10 + 4) == v6) {
                return v10;
              }
            }
            else if ((v12 & (v7 - 1)) != v3)
            {
              goto LABEL_23;
            }
            long long v10 = (uint64_t *)*v10;
            if (!v10) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
            if (v11 != v3) {
              break;
            }
          }
          long long v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
    }
  }
LABEL_23:
  unsigned int v14 = operator new(0x18uLL);
  *unsigned int v14 = 0;
  v14[1] = v6;
  *((_DWORD *)v14 + 4) = *a3;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (v7 && (float)(v16 * (float)v7) >= v15)
  {
    unint64_t v6 = v3;
  }
  else
  {
    BOOL v17 = 1;
    if (v7 >= 3) {
      BOOL v17 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v7);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t prime = v19;
    }
    else {
      size_t prime = v18;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v7 = *(void *)(a1 + 8);
    }
    if (prime > v7) {
      goto LABEL_36;
    }
    if (prime < v7)
    {
      unint64_t v21 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v7 < 3 || (uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v22.i16[0] = vaddlv_u8(v22), v22.u32[0] > 1uLL))
      {
        unint64_t v21 = std::__next_prime(v21);
      }
      else
      {
        uint64_t v23 = 1 << -(char)__clz(v21 - 1);
        if (v21 >= 2) {
          unint64_t v21 = v23;
        }
      }
      if (prime <= v21) {
        size_t prime = v21;
      }
      if (prime < v7) {
LABEL_36:
      }
        sub_2194A32B0(a1, prime);
    }
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        v6 %= v7;
      }
    }
    else
    {
      unint64_t v6 = (v7 - 1) & v6;
    }
  }
  uint64_t v24 = *(void *)a1;
  uint64_t v25 = *(void **)(*(void *)a1 + 8 * v6);
  if (v25)
  {
    *unsigned int v14 = *v25;
LABEL_59:
    void *v25 = v14;
    goto LABEL_60;
  }
  *unsigned int v14 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  *(void *)(v24 + 8 * v6) = a1 + 16;
  if (*v14)
  {
    unint64_t v26 = *(void *)(*v14 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v26 >= v7) {
        v26 %= v7;
      }
    }
    else
    {
      v26 &= v7 - 1;
    }
    uint64_t v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_59;
  }
LABEL_60:
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_2194E8E58(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2194E8E6C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26CAD6BB0;
  *(_OWORD *)(a1 + 8) = xmmword_21950C500;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 32) = xmmword_21950D350;
  *(void *)(a1 + 48) = 16;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 1;
  *(_DWORD *)(a1 + 72) = 0xFFFFF;
  *(_OWORD *)(a1 + 80) = 0u;
  uint64_t v5 = (void *)(a1 + 80);
  *(_OWORD *)(a1 + 200) = 0u;
  unint64_t v6 = (void *)(a1 + 200);
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 137) = 0u;
  unint64_t v7 = (void *)(a1 + 224);
  *(void *)(a1 + 504) = 0;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(void *)(a1 + 488) = a1 + 496;
  *(void *)(a1 + 496) = 0;
  bzero((void *)(a1 + 1216), 0x1000uLL);
  *uint64_t v4 = *(_OWORD *)a2;
  long long v8 = *(_OWORD *)(a2 + 16);
  long long v9 = *(_OWORD *)(a2 + 32);
  long long v10 = *(_OWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 56) = v10;
  *(_OWORD *)(a1 + 40) = v9;
  *(_OWORD *)(a1 + 24) = v8;
  if (v4 == (_OWORD *)a2)
  {
    long long v13 = *(_OWORD *)(a2 + 144);
    long long v14 = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 180) = *(_OWORD *)(a2 + 172);
    *(_OWORD *)(a1 + 168) = v14;
    *(_OWORD *)(a1 + 152) = v13;
  }
  else
  {
    sub_2194E1BB8(v5, *(char **)(a2 + 72), *(char **)(a2 + 80), (uint64_t)(*(void *)(a2 + 80) - *(void *)(a2 + 72)) >> 2);
    sub_2194DDD20((void *)(a1 + 104), *(char **)(a2 + 96), *(char **)(a2 + 104), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a2 + 104) - *(void *)(a2 + 96)) >> 3));
    sub_2194DDD20((void *)(a1 + 128), *(char **)(a2 + 120), *(char **)(a2 + 128), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a2 + 128) - *(void *)(a2 + 120)) >> 3));
    long long v11 = *(_OWORD *)(a2 + 144);
    long long v12 = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 180) = *(_OWORD *)(a2 + 172);
    *(_OWORD *)(a1 + 168) = v12;
    *(_OWORD *)(a1 + 152) = v11;
    sub_2194DDD20(v6, *(char **)(a2 + 192), *(char **)(a2 + 200), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a2 + 200) - *(void *)(a2 + 192)) >> 3));
  }
  *(_OWORD *)(a1 + 512) = xmmword_21950DE88;
  *(_OWORD *)(a1 + 528) = unk_21950DE98;
  *(_OWORD *)(a1 + 544) = xmmword_21950DEA8;
  *(_OWORD *)(a1 + 560) = xmmword_21950D780;
  *(_OWORD *)(a1 + 576) = xmmword_21950D790;
  *(int64x2_t *)(a1 + 592) = vdupq_n_s64(0xBFE6A00000000000);
  *(int64x2_t *)(a1 + 608) = vdupq_n_s64(0x3FE6A00000000000uLL);
  *(_OWORD *)(a1 + 624) = xmmword_21950D7A0;
  *(_OWORD *)(a1 + 640) = xmmword_21950D7B0;
  *(_OWORD *)(a1 + 656) = xmmword_21950DEB8;
  *(_OWORD *)(a1 + 672) = unk_21950DEC8;
  *(_OWORD *)(a1 + 688) = xmmword_21950DED8;
  sub_2194E91D0(a1);
  uint64_t v15 = 0;
  int32x2_t v16 = (int32x2_t)0x100000000;
  float64x2_t v30 = (float64x2_t)vdupq_n_s64(0x40B0000000000000uLL);
  float64x2_t v31 = (float64x2_t)vdupq_n_s64(0x3FB0000000000000uLL);
  float64x2_t v28 = (float64x2_t)vdupq_n_s64(0x40C0000000000000uLL);
  float64x2_t v29 = (float64x2_t)vdupq_n_s64(0x3F30000000000000uLL);
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t v26 = _Q0;
  float64x2_t v27 = (float64x2_t)vdupq_n_s64(0x3F20000000000000uLL);
  do
  {
    v22.i64[0] = v16.i32[0];
    v22.i64[1] = v16.i32[1];
    float64x2_t __y = vmulq_f64(vcvtq_f64_s64(v22), v31);
    long double v33 = pow(1.41421356, __y.f64[1]);
    v23.f64[0] = pow(1.41421356, __y.f64[0]);
    v23.f64[1] = v33;
    uint64_t v24 = (float64x2_t *)(a1 + v15);
    v24[44] = vmulq_f64(vrndmq_f64(vmlaq_f64(v26, v30, v23)), v29);
    v24[60] = vmulq_f64(vrndmq_f64(vmlaq_f64(v26, v28, v23)), v27);
    int32x2_t v16 = vadd_s32(v16, (int32x2_t)0x200000002);
    v15 += 16;
  }
  while (v15 != 256);
  sub_2194E9C1C(v7, *(int *)(a1 + 24) - 2);
  return a1;
}

void sub_2194E91A4(_Unwind_Exception *a1)
{
  sub_21948CFDC(v2 + 488, *v4);
  sub_2194D00E8(v3);
  sub_2194E0A5C(v1);
  _Unwind_Resume(a1);
}

double sub_2194E91D0(uint64_t a1)
{
  *(void *)&long long v1 = 0x100000001;
  *((void *)&v1 + 1) = 0x100000001;
  *(_OWORD *)(a1 + 3440) = xmmword_21950D860;
  *(_OWORD *)(a1 + 1384) = v1;
  *(_OWORD *)(a1 + 1400) = xmmword_21950D870;
  *(_OWORD *)(a1 + 3456) = xmmword_21950D880;
  *(_OWORD *)(a1 + 3472) = xmmword_21950D8A0;
  *(_OWORD *)(a1 + 1416) = xmmword_21950D890;
  *(_OWORD *)(a1 + 1432) = xmmword_21950D8B0;
  *(_OWORD *)(a1 + 3488) = xmmword_21950D8C0;
  *(void *)&long long v1 = 0x700000007;
  *((void *)&v1 + 1) = 0x700000007;
  *(_OWORD *)(a1 + 3504) = xmmword_21950D8D0;
  *(void *)&long long v2 = 0x800000008;
  *((void *)&v2 + 1) = 0x800000008;
  *(_OWORD *)(a1 + 1448) = v1;
  *(_OWORD *)(a1 + 1464) = v2;
  *(_OWORD *)(a1 + 3520) = xmmword_21950D8E0;
  *(_OWORD *)(a1 + 3536) = xmmword_21950D900;
  *(_OWORD *)(a1 + 1480) = xmmword_21950D8F0;
  *(_OWORD *)(a1 + 1496) = xmmword_21950D910;
  *(_OWORD *)(a1 + 3552) = xmmword_21950D920;
  *(_OWORD *)(a1 + 3568) = xmmword_21950D940;
  *(_OWORD *)(a1 + 1512) = xmmword_21950D930;
  *(_OWORD *)(a1 + 1528) = xmmword_21950D950;
  *(_OWORD *)(a1 + 3584) = xmmword_21950D960;
  *(_OWORD *)(a1 + 3600) = xmmword_21950D980;
  *(_OWORD *)(a1 + 1544) = xmmword_21950D970;
  *(_OWORD *)(a1 + 1560) = xmmword_21950D990;
  *(_OWORD *)(a1 + 1576) = xmmword_21950D9A0;
  *(_OWORD *)(a1 + 1592) = xmmword_21950D9B0;
  *(_OWORD *)(a1 + 3648) = xmmword_21950D9C0;
  *(_OWORD *)(a1 + 3664) = xmmword_21950D9E0;
  *(void *)&long long v3 = 0x1900000019;
  *((void *)&v3 + 1) = 0x1900000019;
  *(_OWORD *)(a1 + 1608) = xmmword_21950D9D0;
  *(_OWORD *)(a1 + 1624) = v3;
  *(_OWORD *)(a1 + 3680) = xmmword_21950D9F0;
  *(_OWORD *)(a1 + 3696) = xmmword_21950DA10;
  *(_OWORD *)(a1 + 3712) = xmmword_21950DA30;
  *(_OWORD *)(a1 + 3728) = xmmword_21950DA50;
  *(void *)&long long v3 = 0x1F0000001FLL;
  *((void *)&v3 + 1) = 0x1F0000001FLL;
  *(_OWORD *)(a1 + 1672) = xmmword_21950DA40;
  *(_OWORD *)(a1 + 1688) = v3;
  *(_OWORD *)(a1 + 3744) = xmmword_21950DA60;
  *(_OWORD *)(a1 + 3760) = xmmword_21950DA70;
  *(_OWORD *)(a1 + 3776) = xmmword_21950DA90;
  *(_OWORD *)(a1 + 1736) = xmmword_21950DAA0;
  *(_OWORD *)(a1 + 1752) = xmmword_21950DAC0;
  *(_OWORD *)(a1 + 3808) = xmmword_21950DAD0;
  *(_OWORD *)(a1 + 3824) = xmmword_21950DAF0;
  *(_OWORD *)(a1 + 1768) = xmmword_21950DAE0;
  *(_OWORD *)(a1 + 1784) = xmmword_21950DB00;
  *(_OWORD *)(a1 + 3840) = xmmword_21950DB10;
  *(_OWORD *)(a1 + 3856) = xmmword_21950DB30;
  *(_OWORD *)(a1 + 1800) = xmmword_21950DB20;
  *(_OWORD *)(a1 + 1816) = xmmword_21950DB40;
  *(_OWORD *)(a1 + 3872) = xmmword_21950DB50;
  *(void *)&long long v4 = 0x200000002;
  *((void *)&v4 + 1) = 0x200000002;
  *(_OWORD *)(a1 + 3888) = xmmword_21950DB60;
  *(_OWORD *)(a1 + 1832) = v4;
  *(_OWORD *)(a1 + 1848) = xmmword_21950D890;
  *(_OWORD *)(a1 + 3904) = xmmword_21950DB30;
  *(_OWORD *)(a1 + 3920) = xmmword_21950DB50;
  *(void *)&long long v4 = 0x400000004;
  *((void *)&v4 + 1) = 0x400000004;
  *(_OWORD *)(a1 + 1864) = xmmword_21950DB70;
  *(_OWORD *)(a1 + 1880) = v4;
  *(_OWORD *)(a1 + 3936) = xmmword_21950DB60;
  *(_OWORD *)(a1 + 3952) = xmmword_21950DB30;
  *(_OWORD *)(a1 + 1896) = xmmword_21950DB80;
  *(_OWORD *)(a1 + 1912) = xmmword_21950DB90;
  *(_OWORD *)(a1 + 3968) = xmmword_21950DB50;
  *(void *)&long long v5 = 0x600000006;
  *((void *)&v5 + 1) = 0x600000006;
  *(_OWORD *)(a1 + 3984) = xmmword_21950DBA0;
  *(_OWORD *)(a1 + 1928) = v5;
  *(_OWORD *)(a1 + 1944) = xmmword_21950DBB0;
  *(_OWORD *)(a1 + 4000) = xmmword_21950D920;
  *(_OWORD *)(a1 + 4016) = xmmword_21950DBD0;
  *(_OWORD *)(a1 + 1960) = xmmword_21950DBC0;
  *(_OWORD *)(a1 + 1976) = v2;
  *(_OWORD *)(a1 + 4032) = xmmword_21950DBE0;
  *(_OWORD *)(a1 + 4048) = xmmword_21950D920;
  *(_OWORD *)(a1 + 1992) = xmmword_21950DBF0;
  *(_OWORD *)(a1 + 2008) = xmmword_21950D8F0;
  *(_OWORD *)(a1 + 4064) = xmmword_21950DBD0;
  *(void *)&long long v6 = 0xA0000000ALL;
  *((void *)&v6 + 1) = 0xA0000000ALL;
  *(_OWORD *)(a1 + 4080) = xmmword_21950DBE0;
  *(_OWORD *)(a1 + 2024) = v6;
  *(_OWORD *)(a1 + 2040) = xmmword_21950DC00;
  *(_OWORD *)(a1 + 4096) = xmmword_21950D920;
  *(_OWORD *)(a1 + 4112) = xmmword_21950DBD0;
  *(void *)&long long v7 = 0xC0000000CLL;
  *((void *)&v7 + 1) = 0xC0000000CLL;
  *(_OWORD *)(a1 + 2056) = xmmword_21950DC10;
  *(_OWORD *)(a1 + 2072) = v7;
  *(_OWORD *)(a1 + 4128) = xmmword_21950DC20;
  *(_OWORD *)(a1 + 4144) = xmmword_21950DC40;
  *(_OWORD *)(a1 + 2088) = xmmword_21950DC30;
  *(_OWORD *)(a1 + 2104) = xmmword_21950D930;
  *(_OWORD *)(a1 + 4160) = xmmword_21950DC50;
  *(void *)&long long v6 = 0xE0000000ELL;
  *((void *)&v6 + 1) = 0xE0000000ELL;
  *(_OWORD *)(a1 + 4176) = xmmword_21950DC60;
  *(_OWORD *)(a1 + 2120) = v6;
  *(_OWORD *)(a1 + 2136) = xmmword_21950DC70;
  *(_OWORD *)(a1 + 4192) = xmmword_21950DC40;
  *(_OWORD *)(a1 + 4208) = xmmword_21950DC50;
  *(void *)&long long v5 = 0x1000000010;
  *((void *)&v5 + 1) = 0x1000000010;
  *(_OWORD *)(a1 + 2152) = xmmword_21950DC80;
  *(_OWORD *)(a1 + 2168) = v5;
  *(_OWORD *)(a1 + 4224) = xmmword_21950DC60;
  *(_OWORD *)(a1 + 4240) = xmmword_21950DC40;
  *(_OWORD *)(a1 + 2184) = xmmword_21950DC90;
  *(_OWORD *)(a1 + 2200) = xmmword_21950DCA0;
  *(_OWORD *)(a1 + 4256) = xmmword_21950DC50;
  *(void *)&long long v8 = 0x1200000012;
  *((void *)&v8 + 1) = 0x1200000012;
  *(_OWORD *)(a1 + 4272) = xmmword_21950DCB0;
  *(_OWORD *)(a1 + 2216) = v8;
  *(_OWORD *)(a1 + 2232) = xmmword_21950DCC0;
  *(_OWORD *)(a1 + 4288) = xmmword_21950DCD0;
  *(void *)&long long v2 = 0x1400000014;
  *((void *)&v2 + 1) = 0x1400000014;
  *(_OWORD *)(a1 + 2248) = xmmword_21950DCE0;
  *(_OWORD *)(a1 + 2264) = v2;
  *(_OWORD *)(a1 + 4320) = xmmword_21950DD00;
  *(_OWORD *)(a1 + 4336) = xmmword_21950DCD0;
  *(_OWORD *)(a1 + 2280) = xmmword_21950DD10;
  *(_OWORD *)(a1 + 2296) = xmmword_21950DD20;
  *(void *)&long long v2 = 0x1600000016;
  *((void *)&v2 + 1) = 0x1600000016;
  *(_OWORD *)(a1 + 4368) = xmmword_21950DD00;
  *(_OWORD *)(a1 + 2312) = v2;
  *(_OWORD *)(a1 + 2328) = xmmword_21950DD30;
  *(_OWORD *)(a1 + 4384) = xmmword_21950DCD0;
  *(void *)&long long v7 = 0x1800000018;
  *((void *)&v7 + 1) = 0x1800000018;
  *(_OWORD *)(a1 + 2344) = xmmword_21950DD40;
  *(_OWORD *)(a1 + 2360) = v7;
  *(_OWORD *)(a1 + 2376) = xmmword_21950DD60;
  *(_OWORD *)(a1 + 2392) = xmmword_21950DD80;
  *(void *)&long long v9 = 0x1A0000001ALL;
  *((void *)&v9 + 1) = 0x1A0000001ALL;
  *(_OWORD *)(a1 + 2408) = v9;
  *(_OWORD *)(a1 + 1640) = xmmword_21950DA00;
  *(_OWORD *)(a1 + 1656) = xmmword_21950DA20;
  *(_OWORD *)(a1 + 2424) = xmmword_21950DA20;
  *(_OWORD *)(a1 + 2440) = xmmword_21950DDB0;
  *(void *)&long long v10 = 0x1C0000001CLL;
  *((void *)&v10 + 1) = 0x1C0000001CLL;
  *(_OWORD *)(a1 + 2456) = v10;
  *(_OWORD *)(a1 + 2472) = xmmword_21950DDC0;
  *(_OWORD *)(a1 + 2488) = xmmword_21950DDD0;
  *(void *)&long long v10 = 0x1E0000001ELL;
  *((void *)&v10 + 1) = 0x1E0000001ELL;
  *(_OWORD *)(a1 + 2504) = v10;
  *(_OWORD *)(a1 + 2520) = xmmword_21950DDF0;
  *(_OWORD *)(a1 + 2536) = xmmword_21950DE00;
  *(_OWORD *)(a1 + 2568) = xmmword_21950DE30;
  *(void *)&long long v10 = 0x2000000020;
  *((void *)&v10 + 1) = 0x2000000020;
  *(_OWORD *)(a1 + 2552) = v10;
  *(_OWORD *)(a1 + 1704) = v10;
  *(_OWORD *)(a1 + 1720) = xmmword_21950DA80;
  *(_OWORD *)(a1 + 2584) = xmmword_21950DA80;
  *(void *)&long long v10 = 0x2200000022;
  *((void *)&v10 + 1) = 0x2200000022;
  *(_OWORD *)(a1 + 2600) = v10;
  *(_OWORD *)(a1 + 2616) = xmmword_21950DE40;
  *(_OWORD *)(a1 + 3616) = xmmword_21950D800;
  *(_OWORD *)(a1 + 3632) = xmmword_21950D800;
  *(_OWORD *)(a1 + 3792) = xmmword_21950DAB0;
  *(_OWORD *)(a1 + 4304) = xmmword_21950DCF0;
  *(_OWORD *)(a1 + 4352) = xmmword_21950DCF0;
  *(_OWORD *)(a1 + 2632) = xmmword_21950DE50;
  *(void *)&long long v10 = 0x2400000024;
  *((void *)&v10 + 1) = 0x2400000024;
  *(_OWORD *)(a1 + 2648) = v10;
  *(_DWORD *)(a1 + 2668) = 1;
  *(_DWORD *)(a1 + 2692) = 1;
  *(_DWORD *)(a1 + 2716) = 1;
  *(_DWORD *)(a1 + 2740) = 1;
  *(_DWORD *)(a1 + 2764) = 1;
  *(_DWORD *)(a1 + 2788) = 1;
  *(_DWORD *)(a1 + 2672) = 2;
  *(_DWORD *)(a1 + 2696) = 2;
  *(_DWORD *)(a1 + 2720) = 2;
  *(_DWORD *)(a1 + 2744) = 2;
  *(_DWORD *)(a1 + 2768) = 2;
  *(_DWORD *)(a1 + 2792) = 2;
  *(_DWORD *)(a1 + 2676) = 3;
  *(_DWORD *)(a1 + 2700) = 3;
  *(_DWORD *)(a1 + 2724) = 3;
  *(_DWORD *)(a1 + 2748) = 3;
  *(_DWORD *)(a1 + 2772) = 3;
  *(_DWORD *)(a1 + 2796) = 3;
  *(_DWORD *)(a1 + 2680) = 4;
  *(_DWORD *)(a1 + 2704) = 4;
  *(_DWORD *)(a1 + 2728) = 4;
  *(_DWORD *)(a1 + 2752) = 4;
  *(_DWORD *)(a1 + 2776) = 4;
  *(_DWORD *)(a1 + 2800) = 4;
  *(_DWORD *)(a1 + 2684) = 5;
  *(_DWORD *)(a1 + 2708) = 5;
  *(_DWORD *)(a1 + 2732) = 5;
  *(_DWORD *)(a1 + 2756) = 5;
  *(_DWORD *)(a1 + 2780) = 5;
  *(_DWORD *)(a1 + 2804) = 5;
  *(_DWORD *)(a1 + 2688) = 6;
  *(_DWORD *)(a1 + 2712) = 6;
  *(_DWORD *)(a1 + 2736) = 6;
  *(_DWORD *)(a1 + 2760) = 6;
  *(_DWORD *)(a1 + 2784) = 6;
  *(_DWORD *)(a1 + 2808) = 6;
  *(_DWORD *)(a1 + 2812) = 7;
  *(_DWORD *)(a1 + 2836) = 7;
  *(_DWORD *)(a1 + 2860) = 7;
  *(_DWORD *)(a1 + 2884) = 7;
  *(_DWORD *)(a1 + 2816) = 8;
  *(_DWORD *)(a1 + 2840) = 8;
  *(_DWORD *)(a1 + 2864) = 8;
  *(_DWORD *)(a1 + 2888) = 8;
  *(_DWORD *)(a1 + 2820) = 9;
  *(_DWORD *)(a1 + 2844) = 9;
  *(_DWORD *)(a1 + 2868) = 9;
  *(_DWORD *)(a1 + 2892) = 9;
  *(_DWORD *)(a1 + 2824) = 10;
  *(_DWORD *)(a1 + 2848) = 10;
  *(_DWORD *)(a1 + 2872) = 10;
  *(_DWORD *)(a1 + 2896) = 10;
  *(_DWORD *)(a1 + 2828) = 11;
  *(_DWORD *)(a1 + 2852) = 11;
  *(_DWORD *)(a1 + 2876) = 11;
  *(_DWORD *)(a1 + 2900) = 11;
  *(_DWORD *)(a1 + 2832) = 12;
  *(_DWORD *)(a1 + 2856) = 12;
  *(_DWORD *)(a1 + 2880) = 12;
  *(_DWORD *)(a1 + 2904) = 12;
  *(_DWORD *)(a1 + 4716) = 13;
  *(_DWORD *)(a1 + 4752) = 13;
  *(_DWORD *)(a1 + 2908) = 13;
  *(_DWORD *)(a1 + 2932) = 13;
  *(_DWORD *)(a1 + 2956) = 13;
  *(_DWORD *)(a1 + 2980) = 13;
  *(_DWORD *)(a1 + 4720) = 14;
  *(_DWORD *)(a1 + 4756) = 14;
  *(_DWORD *)(a1 + 2912) = 14;
  *(_DWORD *)(a1 + 2936) = 14;
  *(_DWORD *)(a1 + 2960) = 14;
  *(_DWORD *)(a1 + 2984) = 14;
  *(_DWORD *)(a1 + 4724) = 15;
  *(_DWORD *)(a1 + 4760) = 15;
  *(_DWORD *)(a1 + 2916) = 15;
  *(_DWORD *)(a1 + 2940) = 15;
  *(_DWORD *)(a1 + 2964) = 15;
  *(_DWORD *)(a1 + 2988) = 15;
  *(_DWORD *)(a1 + 4728) = 16;
  *(_DWORD *)(a1 + 4740) = 16;
  *(_DWORD *)(a1 + 2920) = 16;
  *(_DWORD *)(a1 + 2944) = 16;
  *(_DWORD *)(a1 + 2968) = 16;
  *(_DWORD *)(a1 + 2992) = 16;
  *(_DWORD *)(a1 + 4732) = 17;
  *(_DWORD *)(a1 + 4744) = 17;
  *(_DWORD *)(a1 + 2924) = 17;
  *(_DWORD *)(a1 + 2948) = 17;
  *(_DWORD *)(a1 + 2972) = 17;
  *(_DWORD *)(a1 + 2996) = 17;
  *(_DWORD *)(a1 + 4736) = 18;
  *(_DWORD *)(a1 + 4748) = 18;
  *(_DWORD *)(a1 + 2928) = 18;
  *(_DWORD *)(a1 + 2952) = 18;
  *(_DWORD *)(a1 + 2976) = 18;
  *(_DWORD *)(a1 + 3000) = 18;
  *(_DWORD *)(a1 + 4860) = 19;
  *(_DWORD *)(a1 + 4896) = 19;
  *(_DWORD *)(a1 + 3004) = 19;
  *(_DWORD *)(a1 + 3028) = 19;
  *(_DWORD *)(a1 + 4920) = 34;
  *(_DWORD *)(a1 + 4932) = 34;
  *(_DWORD *)(a1 + 5064) = 34;
  *(_DWORD *)(a1 + 5076) = 34;
  *(_DWORD *)(a1 + 4864) = 20;
  *(_DWORD *)(a1 + 4900) = 20;
  *(_DWORD *)(a1 + 3008) = 20;
  *(_DWORD *)(a1 + 3032) = 20;
  *(_DWORD *)(a1 + 4924) = 35;
  *(_DWORD *)(a1 + 4936) = 35;
  *(_DWORD *)(a1 + 5068) = 35;
  *(_DWORD *)(a1 + 5080) = 35;
  *(_DWORD *)(a1 + 4868) = 21;
  *(_DWORD *)(a1 + 4904) = 21;
  *(_DWORD *)(a1 + 3012) = 21;
  *(_DWORD *)(a1 + 3036) = 21;
  *(_DWORD *)(a1 + 2664) = 36;
  *(_DWORD *)(a1 + 4928) = 36;
  *(_DWORD *)(a1 + 4940) = 36;
  *(_DWORD *)(a1 + 5072) = 36;
  *(_DWORD *)(a1 + 5084) = 36;
  *(_DWORD *)(a1 + 4872) = 22;
  *(_DWORD *)(a1 + 4884) = 22;
  *(_DWORD *)(a1 + 3016) = 22;
  *(_DWORD *)(a1 + 3040) = 22;
  *(_DWORD *)(a1 + 4908) = 31;
  *(_DWORD *)(a1 + 4944) = 31;
  *(_DWORD *)(a1 + 5052) = 31;
  *(_DWORD *)(a1 + 5088) = 31;
  *(_DWORD *)(a1 + 4876) = 23;
  *(_DWORD *)(a1 + 4888) = 23;
  *(_DWORD *)(a1 + 3020) = 23;
  *(_DWORD *)(a1 + 3044) = 23;
  *(_DWORD *)(a1 + 4912) = 32;
  *(_DWORD *)(a1 + 4948) = 32;
  *(_DWORD *)(a1 + 5056) = 32;
  *(_DWORD *)(a1 + 5092) = 32;
  *(_DWORD *)(a1 + 4880) = 24;
  *(_DWORD *)(a1 + 4892) = 24;
  *(_DWORD *)(a1 + 3024) = 24;
  *(_DWORD *)(a1 + 3048) = 24;
  *(_DWORD *)(a1 + 4916) = 33;
  *(_DWORD *)(a1 + 4952) = 33;
  *(_DWORD *)(a1 + 5060) = 33;
  *(_DWORD *)(a1 + 5096) = 33;
  *(_DWORD *)(a1 + 4764) = 25;
  *(_DWORD *)(a1 + 4800) = 25;
  *(_DWORD *)(a1 + 4956) = 25;
  *(_DWORD *)(a1 + 4992) = 25;
  *(_DWORD *)(a1 + 3052) = 25;
  *(_DWORD *)(a1 + 3076) = 25;
  *(_DWORD *)(a1 + 4824) = 40;
  *(_DWORD *)(a1 + 4836) = 40;
  *(_DWORD *)(a1 + 5016) = 40;
  *(_DWORD *)(a1 + 5028) = 40;
  *(_DWORD *)(a1 + 5112) = 40;
  *(_DWORD *)(a1 + 5124) = 40;
  *(_DWORD *)(a1 + 4768) = 26;
  *(_DWORD *)(a1 + 4804) = 26;
  *(_DWORD *)(a1 + 4960) = 26;
  *(_DWORD *)(a1 + 4996) = 26;
  *(_DWORD *)(a1 + 3056) = 26;
  *(_DWORD *)(a1 + 3080) = 26;
  *(_DWORD *)(a1 + 4828) = 41;
  *(_DWORD *)(a1 + 4840) = 41;
  *(_DWORD *)(a1 + 5020) = 41;
  *(_DWORD *)(a1 + 5032) = 41;
  *(_DWORD *)(a1 + 5116) = 41;
  *(_DWORD *)(a1 + 5128) = 41;
  *(_DWORD *)(a1 + 4772) = 27;
  *(_DWORD *)(a1 + 4808) = 27;
  *(_DWORD *)(a1 + 4964) = 27;
  *(_DWORD *)(a1 + 5000) = 27;
  *(_DWORD *)(a1 + 3060) = 27;
  *(_DWORD *)(a1 + 3084) = 27;
  *(_DWORD *)(a1 + 4712) = 42;
  *(_DWORD *)(a1 + 4832) = 42;
  *(_DWORD *)(a1 + 4844) = 42;
  *(_DWORD *)(a1 + 5024) = 42;
  *(_DWORD *)(a1 + 5036) = 42;
  *(_DWORD *)(a1 + 5120) = 42;
  *(_DWORD *)(a1 + 5132) = 42;
  *(_DWORD *)(a1 + 4776) = 28;
  *(_DWORD *)(a1 + 4788) = 28;
  *(_DWORD *)(a1 + 4968) = 28;
  *(_DWORD *)(a1 + 4980) = 28;
  *(_DWORD *)(a1 + 3064) = 28;
  *(_DWORD *)(a1 + 3088) = 28;
  *(_DWORD *)(a1 + 4812) = 37;
  *(_DWORD *)(a1 + 4848) = 37;
  *(_DWORD *)(a1 + 5004) = 37;
  *(_DWORD *)(a1 + 5040) = 37;
  *(_DWORD *)(a1 + 5100) = 37;
  *(_DWORD *)(a1 + 5136) = 37;
  *(_DWORD *)(a1 + 4780) = 29;
  *(_DWORD *)(a1 + 4792) = 29;
  *(_DWORD *)(a1 + 4972) = 29;
  *(_DWORD *)(a1 + 4984) = 29;
  *(_DWORD *)(a1 + 3068) = 29;
  *(_DWORD *)(a1 + 3092) = 29;
  *(_DWORD *)(a1 + 4816) = 38;
  *(_DWORD *)(a1 + 4852) = 38;
  *(_DWORD *)(a1 + 5008) = 38;
  *(_DWORD *)(a1 + 5044) = 38;
  *(_DWORD *)(a1 + 5104) = 38;
  *(_DWORD *)(a1 + 5140) = 38;
  *(_DWORD *)(a1 + 4784) = 30;
  *(_DWORD *)(a1 + 4796) = 30;
  *(_DWORD *)(a1 + 4976) = 30;
  *(_DWORD *)(a1 + 4988) = 30;
  *(_DWORD *)(a1 + 3072) = 30;
  *(_DWORD *)(a1 + 3096) = 30;
  *(_DWORD *)(a1 + 4820) = 39;
  *(_DWORD *)(a1 + 4856) = 39;
  *(_DWORD *)(a1 + 5012) = 39;
  *(_DWORD *)(a1 + 5048) = 39;
  *(_DWORD *)(a1 + 5108) = 39;
  *(_DWORD *)(a1 + 5144) = 39;
  *(_OWORD *)(a1 + 3264) = xmmword_21950D660;
  *(_OWORD *)(a1 + 3280) = xmmword_21950D7C0;
  *(_OWORD *)(a1 + 3296) = xmmword_21950D7D0;
  *(_OWORD *)(a1 + 3328) = xmmword_21950D7F0;
  *(_OWORD *)(a1 + 3344) = xmmword_21950D800;
  *(_OWORD *)(a1 + 3408) = xmmword_21950D840;
  *(_OWORD *)(a1 + 3424) = xmmword_21950D850;
  *(_OWORD *)(a1 + 3360) = xmmword_21950D810;
  *(_OWORD *)(a1 + 3376) = xmmword_21950D820;
  *(void *)(a1 + 1376) = 0;
  *(_OWORD *)(a1 + 3392) = xmmword_21950D830;
  double result = 0.0;
  *(_OWORD *)(a1 + 1360) = 0u;
  *(_OWORD *)(a1 + 1344) = 0u;
  *(_OWORD *)(a1 + 1328) = 0u;
  *(_OWORD *)(a1 + 1312) = 0u;
  *(_OWORD *)(a1 + 1296) = 0u;
  *(_OWORD *)(a1 + 1216) = 0u;
  *(_OWORD *)(a1 + 3312) = xmmword_21950D7E0;
  *(_OWORD *)(a1 + 1280) = 0u;
  *(_OWORD *)(a1 + 1264) = 0u;
  *(_OWORD *)(a1 + 1248) = 0u;
  *(_OWORD *)(a1 + 1232) = 0u;
  *(_OWORD *)(a1 + 4400) = xmmword_21950DCF0;
  *(_OWORD *)(a1 + 4416) = xmmword_21950DD50;
  *(_OWORD *)(a1 + 4432) = xmmword_21950DD70;
  *(_OWORD *)(a1 + 4448) = xmmword_21950DD90;
  *(_OWORD *)(a1 + 4464) = xmmword_21950DDA0;
  *(_OWORD *)(a1 + 4480) = xmmword_21950DD70;
  *(_OWORD *)(a1 + 4496) = xmmword_21950DD90;
  *(_OWORD *)(a1 + 4512) = xmmword_21950DDA0;
  *(_OWORD *)(a1 + 4528) = xmmword_21950DD70;
  *(_OWORD *)(a1 + 4544) = xmmword_21950DD90;
  *(_OWORD *)(a1 + 4560) = xmmword_21950DDE0;
  *(_OWORD *)(a1 + 4576) = xmmword_21950DAB0;
  *(_OWORD *)(a1 + 4592) = xmmword_21950DE10;
  *(_OWORD *)(a1 + 4608) = xmmword_21950DE20;
  *(_OWORD *)(a1 + 4624) = xmmword_21950DAB0;
  *(_OWORD *)(a1 + 4640) = xmmword_21950DE10;
  *(_OWORD *)(a1 + 4656) = xmmword_21950DE20;
  *(_OWORD *)(a1 + 4672) = xmmword_21950DAB0;
  *(_OWORD *)(a1 + 4688) = xmmword_21950DE10;
  *(void *)(a1 + 4704) = 0x2900000028;
  return result;
}

void sub_2194E9C1C(void *a1, unint64_t a2)
{
  uint64_t v4 = a1[1];
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3);
  BOOL v6 = a2 >= v5;
  BOOL v7 = a2 > v5;
  unint64_t v8 = a2 - v5;
  if (v7)
  {
    sub_2194BC1C8((uint64_t)a1, v8);
  }
  else if (!v6)
  {
    uint64_t v9 = *a1 + 24 * a2;
    if (v4 != v9)
    {
      uint64_t v10 = a1[1];
      do
      {
        long long v12 = *(void **)(v10 - 24);
        v10 -= 24;
        long long v11 = v12;
        if (v12)
        {
          *(void *)(v4 - 16) = v11;
          operator delete(v11);
        }
        uint64_t v4 = v10;
      }
      while (v10 != v9);
    }
    a1[1] = v9;
  }
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v13 - v14) >> 3);
  if (a2 <= v15)
  {
    if (a2 < v15)
    {
      uint64_t v16 = v14 + 24 * a2;
      if (v13 != v16)
      {
        uint64_t v17 = a1[4];
        do
        {
          unint64_t v19 = *(void **)(v17 - 24);
          v17 -= 24;
          unint64_t v18 = v19;
          if (v19)
          {
            *(void *)(v13 - 16) = v18;
            operator delete(v18);
          }
          uint64_t v13 = v17;
        }
        while (v17 != v16);
      }
      a1[4] = v16;
    }
  }
  else
  {
    sub_2194BC1C8((uint64_t)(a1 + 3), a2 - v15);
  }
  uint64_t v21 = a1[6];
  uint64_t v20 = a1[7];
  unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v20 - v21) >> 3);
  if (a2 <= v22)
  {
    if (a2 < v22)
    {
      uint64_t v23 = v21 + 24 * a2;
      if (v20 != v23)
      {
        uint64_t v24 = a1[7];
        do
        {
          float64x2_t v26 = *(void **)(v24 - 24);
          v24 -= 24;
          uint64_t v25 = v26;
          if (v26)
          {
            *(void *)(v20 - 16) = v25;
            operator delete(v25);
          }
          uint64_t v20 = v24;
        }
        while (v24 != v23);
      }
      a1[7] = v23;
    }
  }
  else
  {
    sub_2194BC1C8((uint64_t)(a1 + 6), a2 - v22);
  }
  uint64_t v28 = a1[9];
  uint64_t v27 = a1[10];
  unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((v27 - v28) >> 3);
  if (a2 <= v29)
  {
    if (a2 < v29)
    {
      uint64_t v30 = v28 + 24 * a2;
      if (v27 != v30)
      {
        uint64_t v31 = a1[10];
        do
        {
          long double v33 = *(void **)(v31 - 24);
          v31 -= 24;
          long long v32 = v33;
          if (v33)
          {
            *(void *)(v27 - 16) = v32;
            operator delete(v32);
          }
          uint64_t v27 = v31;
        }
        while (v31 != v30);
      }
      a1[10] = v30;
    }
  }
  else
  {
    sub_2194BC1C8((uint64_t)(a1 + 9), a2 - v29);
  }
  uint64_t v35 = a1[12];
  uint64_t v34 = a1[13];
  unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((v34 - v35) >> 3);
  if (a2 <= v36)
  {
    if (a2 < v36)
    {
      uint64_t v37 = v35 + 24 * a2;
      if (v34 != v37)
      {
        uint64_t v38 = a1[13];
        do
        {
          unsigned int v40 = *(void **)(v38 - 24);
          v38 -= 24;
          unsigned int v39 = v40;
          if (v40)
          {
            *(void *)(v34 - 16) = v39;
            operator delete(v39);
          }
          uint64_t v34 = v38;
        }
        while (v38 != v37);
      }
      a1[13] = v37;
    }
  }
  else
  {
    sub_2194BC1C8((uint64_t)(a1 + 12), a2 - v36);
  }
  uint64_t v42 = a1[15];
  uint64_t v41 = a1[16];
  unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((v41 - v42) >> 3);
  if (a2 <= v43)
  {
    if (a2 < v43)
    {
      uint64_t v44 = v42 + 24 * a2;
      if (v41 != v44)
      {
        uint64_t v45 = a1[16];
        do
        {
          long long v47 = *(void **)(v45 - 24);
          v45 -= 24;
          unsigned int v46 = v47;
          if (v47)
          {
            *(void *)(v41 - 16) = v46;
            operator delete(v46);
          }
          uint64_t v41 = v45;
        }
        while (v45 != v44);
      }
      a1[16] = v44;
    }
  }
  else
  {
    sub_2194BC1C8((uint64_t)(a1 + 15), a2 - v43);
  }
  uint64_t v49 = a1[18];
  uint64_t v48 = a1[19];
  unint64_t v50 = 0xAAAAAAAAAAAAAAABLL * ((v48 - v49) >> 3);
  if (a2 <= v50)
  {
    if (a2 < v50)
    {
      uint64_t v51 = v49 + 24 * a2;
      if (v48 != v51)
      {
        uint64_t v52 = a1[19];
        do
        {
          unsigned int v54 = *(void **)(v52 - 24);
          v52 -= 24;
          unsigned int v53 = v54;
          if (v54)
          {
            *(void *)(v48 - 16) = v53;
            operator delete(v53);
          }
          uint64_t v48 = v52;
        }
        while (v52 != v51);
      }
      a1[19] = v51;
    }
  }
  else
  {
    sub_2194BC1C8((uint64_t)(a1 + 18), a2 - v50);
  }
  uint64_t v56 = a1[21];
  uint64_t v55 = a1[22];
  unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * ((v55 - v56) >> 3);
  if (a2 <= v57)
  {
    if (a2 < v57)
    {
      uint64_t v58 = v56 + 24 * a2;
      if (v55 != v58)
      {
        uint64_t v59 = a1[22];
        do
        {
          unsigned int v61 = *(void **)(v59 - 24);
          v59 -= 24;
          long long v60 = v61;
          if (v61)
          {
            *(void *)(v55 - 16) = v60;
            operator delete(v60);
          }
          uint64_t v55 = v59;
        }
        while (v59 != v58);
      }
      a1[22] = v58;
    }
  }
  else
  {
    sub_2194BC1C8((uint64_t)(a1 + 21), a2 - v57);
  }
  uint64_t v63 = a1[24];
  uint64_t v62 = a1[25];
  unint64_t v64 = 0xAAAAAAAAAAAAAAABLL * ((v62 - v63) >> 3);
  if (a2 <= v64)
  {
    if (a2 < v64)
    {
      uint64_t v65 = v63 + 24 * a2;
      if (v62 != v65)
      {
        uint64_t v66 = a1[25];
        do
        {
          uint64_t v68 = *(void **)(v66 - 24);
          v66 -= 24;
          uint64_t v67 = v68;
          if (v68)
          {
            *(void *)(v62 - 16) = v67;
            operator delete(v67);
          }
          uint64_t v62 = v66;
        }
        while (v66 != v65);
      }
      a1[25] = v65;
    }
  }
  else
  {
    sub_2194BC1C8((uint64_t)(a1 + 24), a2 - v64);
  }
}

uint64_t sub_2194EA030(uint64_t a1, unsigned int a2)
{
  return ((vcvtd_n_u64_f64(*(double *)(a1 + 8 * (a2 & 0x1F) + 960), 0xDuLL) << (a2 >> 5)) + 8) >> 4;
}

uint64_t sub_2194EA054(uint64_t result, uint64_t a2, _OWORD *a3)
{
  uint64_t v3 = 0;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  do
  {
    uint64_t v4 = (int *)(result + v3);
    char v5 = *(unsigned char *)a3 | (*(_DWORD *)(a2 + 4 * *(int *)(result + v3 + 1216)) < *(_DWORD *)(a2
                                                                                          + 4
                                                                                          * *(int *)(result + v3 + 3264)));
    *(unsigned char *)a3 = v5;
    char v6 = v5 | (2 * (*(_DWORD *)(a2 + 4 * v4[305]) < *(_DWORD *)(a2 + 4 * v4[817])));
    *(unsigned char *)a3 = v6;
    char v7 = v6 | (4 * (*(_DWORD *)(a2 + 4 * v4[306]) < *(_DWORD *)(a2 + 4 * v4[818])));
    *(unsigned char *)a3 = v7;
    char v8 = v7 | (8 * (*(_DWORD *)(a2 + 4 * v4[307]) < *(_DWORD *)(a2 + 4 * v4[819])));
    *(unsigned char *)a3 = v8;
    char v9 = v8 | (16 * (*(_DWORD *)(a2 + 4 * v4[308]) < *(_DWORD *)(a2 + 4 * v4[820])));
    *(unsigned char *)a3 = v9;
    char v10 = v9 | (32 * (*(_DWORD *)(a2 + 4 * v4[309]) < *(_DWORD *)(a2 + 4 * v4[821])));
    *(unsigned char *)a3 = v10;
    char v11 = v10 | ((*(_DWORD *)(a2 + 4 * v4[310]) < *(_DWORD *)(a2 + 4 * v4[822])) << 6);
    *(unsigned char *)a3 = v11;
    *(unsigned char *)a3 = v11 | ((*(_DWORD *)(a2 + 4 * *(int *)(result + v3 + 1244)) < *(_DWORD *)(a2
                                                                                            + 4
                                                                                            * *(int *)(result + v3 + 3292))) << 7);
    a3 = (_OWORD *)((char *)a3 + 1);
    v3 += 32;
  }
  while (v3 != 2048);
  return result;
}

void *sub_2194EA17C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a2;
  uint64_t v303 = *MEMORY[0x263EF8340];
  uint64_t v288 = 0;
  long long v286 = 0u;
  long long v287 = 0u;
  long long v284 = 0u;
  long long v285 = 0u;
  long long v282 = 0u;
  long long v283 = 0u;
  long long v281 = 0u;
  long long v279 = 0u;
  memset(v280, 0, 28);
  long long v277 = 0u;
  long long v278 = 0u;
  long long v275 = 0u;
  long long v276 = 0u;
  long long v273 = 0u;
  long long v274 = 0u;
  long long v271 = 0u;
  long long v272 = 0u;
  uint64_t v6 = *(int *)(a1 + 24);
  uint64_t v7 = v6 - 2;
  if (v6 == 2)
  {
    unint64_t v9 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = *a2;
  if (v6 == 3)
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
LABEL_8:
    uint64_t v19 = v6 - v10 - 2;
    uint64_t v20 = (void *)(v8 + 24 * v10 + 8);
    do
    {
      v9 += (uint64_t)(*v20 - *(v20 - 1)) >> 7;
      v20 += 3;
      --v19;
    }
    while (v19);
    goto LABEL_10;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v13 = (uint64_t *)(v8 + 24);
  unint64_t v14 = v7 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    uint64_t v16 = *(v13 - 3);
    uint64_t v15 = *(v13 - 2);
    uint64_t v18 = *v13;
    uint64_t v17 = v13[1];
    v13 += 6;
    v11 += (v15 - v16) >> 7;
    v12 += (v17 - v18) >> 7;
    v14 -= 2;
  }
  while (v14);
  unint64_t v9 = v12 + v11;
  if (v10 != v7) {
    goto LABEL_8;
  }
LABEL_10:
  uint64_t v22 = *(void *)(a1 + 440);
  uint64_t v21 = *(void *)(a1 + 448);
  uint64_t v252 = *(void *)(a1 + 464);
  uint64_t v253 = *(void *)(a1 + 472);
  uint64_t v23 = (void *)a4[10];
  a4[17] = a4[16];
  uint64_t v24 = a4[12];
  a4[14] = a4[13];
  long long v251 = a4 + 4;
  a4[5] = a4[4];
  uint64_t v25 = a4 + 7;
  a4[8] = a4[7];
  long long v257 = a4 + 10;
  a4[11] = v23;
  if (v9 > (v24 - (uint64_t)v23) >> 8)
  {
    if (HIBYTE(v9)) {
      sub_219486AE4();
    }
    unint64_t v26 = v9 << 8;
    uint64_t v27 = (char *)operator new(v9 << 8);
    a4[10] = v27;
    a4[11] = v27;
    a4[12] = &v27[v26];
    if (v23) {
      operator delete(v23);
    }
  }
  uint64_t v28 = *(void *)(a1 + 368);
  uint64_t v29 = *(void *)(a1 + 376) - v28;
  if (v29)
  {
    unint64_t v30 = v29 / 24;
    if (v30 <= 1) {
      unint64_t v30 = 1;
    }
    uint64_t v31 = (void *)(*(void *)(a1 + 224) + 8);
    long long v32 = (void *)(*(void *)(a1 + 416) + 8);
    long double v33 = (void *)(*(void *)(a1 + 248) + 8);
    uint64_t v34 = (void *)(*(void *)(a1 + 392) + 8);
    uint64_t v35 = (void *)(*(void *)(a1 + 272) + 8);
    unint64_t v36 = (void *)(v28 + 8);
    uint64_t v37 = (void *)(*(void *)(a1 + 296) + 8);
    uint64_t v38 = (void *)(*(void *)(a1 + 344) + 8);
    unsigned int v39 = (void *)(*(void *)(a1 + 320) + 8);
    do
    {
      *uint64_t v31 = *(v31 - 1);
      v31 += 3;
      *long double v33 = *(v33 - 1);
      v33 += 3;
      *uint64_t v35 = *(v35 - 1);
      v35 += 3;
      *uint64_t v37 = *(v37 - 1);
      v37 += 3;
      *unsigned int v39 = *(v39 - 1);
      v39 += 3;
      void *v38 = *(v38 - 1);
      v38 += 3;
      *unint64_t v36 = *(v36 - 1);
      v36 += 3;
      *uint64_t v34 = *(v34 - 1);
      v34 += 3;
      *long long v32 = *(v32 - 1);
      v32 += 3;
      --v30;
    }
    while (v30);
  }
  long long v248 = v25;
  uint64_t v249 = v22;
  uint64_t v250 = v21;
  int v40 = *(_DWORD *)(a1 + 24);
  if ((v40 - 3) <= 0xFFFFFFFD)
  {
    long long v255 = (void *)(a1 + 440);
    uint64_t v256 = 0;
    long long v254 = (void **)(a1 + 464);
    uint64_t v260 = 0;
    uint64_t v41 = 1;
    long long v258 = v4;
    while (1)
    {
      uint64_t v265 = v41 - 1;
      uint64_t v42 = *(void *)(*v4 + 24 * (v41 - 1) + 8) - *(void *)(*v4 + 24 * (v41 - 1));
      if (v42) {
        break;
      }
LABEL_22:
      if (++v41 >= (unint64_t)(v40 - 1)) {
        goto LABEL_129;
      }
    }
    uint64_t v43 = 0;
    uint64_t v44 = v42 >> 7;
    if ((unint64_t)(v42 >> 7) <= 1) {
      uint64_t v44 = 1;
    }
    uint64_t v259 = v44;
    uint64_t v264 = v41;
    while (1)
    {
      while (1)
      {
        uint64_t v261 = v43;
        uint64_t v58 = (long long *)(*(void *)(*v4 + 24 * v265) + (v43 << 7));
        long long v59 = v58[3];
        long long v61 = *v58;
        long long v60 = v58[1];
        *(_OWORD *)&v270[16] = v58[2];
        *(_OWORD *)&v270[32] = v59;
        long long v269 = v61;
        *(_OWORD *)long long v270 = v60;
        long long v62 = v58[6];
        long long v64 = v58[4];
        long long v63 = v58[5];
        *(_OWORD *)&v270[96] = v58[7];
        *(_OWORD *)&v270[64] = v63;
        *(_OWORD *)&v270[80] = v62;
        *(_OWORD *)&v270[48] = v64;
        LODWORD(v62) = v269;
        double v65 = (double)(unint64_t)v62 * 0.015625;
        double v66 = (double)__PAIR64__(*(unsigned int *)&v270[100], DWORD1(v269)) * 0.015625;
        int v67 = DWORD2(v269);
        uint64_t v68 = sub_2194EB19C(a1, a3, SDWORD2(v269), v41, (unsigned int *)&v281, v65, v66);
        uint64_t v69 = (unint64_t *)(*(void *)(a1 + 224) + 24 * v265);
        uint64_t v70 = v69 + 1;
        long long v71 = (_OWORD *)v69[1];
        unint64_t v72 = v69[2];
        if ((unint64_t)v71 >= v72)
        {
          long long v77 = (_OWORD *)*v69;
          unint64_t v78 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)((uint64_t)v71 - *v69) >> 3);
          unint64_t v79 = v78 + 1;
          if (v78 + 1 > 0x222222222222222) {
            sub_219486AE4();
          }
          unint64_t v80 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v72 - (void)v77) >> 3);
          if (2 * v80 > v79) {
            unint64_t v79 = 2 * v80;
          }
          unint64_t v81 = v80 >= 0x111111111111111 ? 0x222222222222222 : v79;
          if (v81)
          {
            if (v81 > 0x222222222222222) {
              sub_219486AFC();
            }
            uint64_t v68 = (uint64_t)operator new(120 * v81);
          }
          else
          {
            uint64_t v68 = 0;
          }
          long long v82 = v286;
          unint64_t v83 = v68 + 120 * v78;
          *(_OWORD *)(v83 + 64) = v285;
          *(_OWORD *)(v83 + 80) = v82;
          *(_OWORD *)(v83 + 96) = v287;
          *(void *)(v83 + 112) = v288;
          long long v84 = v282;
          *(_OWORD *)unint64_t v83 = v281;
          *(_OWORD *)(v83 + 16) = v84;
          long long v85 = v284;
          *(_OWORD *)(v83 + 32) = v283;
          *(_OWORD *)(v83 + 48) = v85;
          unint64_t v86 = v83;
          if (v71 != v77)
          {
            do
            {
              long long v87 = *(_OWORD *)((char *)v71 - 120);
              long long v88 = *(_OWORD *)((char *)v71 - 104);
              long long v89 = *(_OWORD *)((char *)v71 - 88);
              *(_OWORD *)(v86 - 72) = *(_OWORD *)((char *)v71 - 72);
              *(_OWORD *)(v86 - 88) = v89;
              *(_OWORD *)(v86 - 104) = v88;
              *(_OWORD *)(v86 - 120) = v87;
              long long v90 = *(_OWORD *)((char *)v71 - 56);
              long long v91 = *(_OWORD *)((char *)v71 - 40);
              long long v92 = *(_OWORD *)((char *)v71 - 24);
              *(void *)(v86 - 8) = *((void *)v71 - 1);
              *(_OWORD *)(v86 - 24) = v92;
              *(_OWORD *)(v86 - 40) = v91;
              *(_OWORD *)(v86 - 56) = v90;
              v86 -= 120;
              long long v71 = (_OWORD *)((char *)v71 - 120);
            }
            while (v71 != v77);
            long long v71 = (_OWORD *)*v69;
          }
          unint64_t v93 = v68 + 120 * v81;
          *uint64_t v69 = v86;
          long long v76 = (char *)(v83 + 120);
          *uint64_t v70 = v83 + 120;
          v69[2] = v93;
          if (v71) {
            operator delete(v71);
          }
        }
        else
        {
          long long v73 = v286;
          v71[4] = v285;
          v71[5] = v73;
          v71[6] = v287;
          *((void *)v71 + 14) = v288;
          long long v74 = v282;
          *long long v71 = v281;
          v71[1] = v74;
          long long v75 = v284;
          long long v76 = (char *)v71 + 120;
          v71[2] = v283;
          v71[3] = v75;
        }
        *uint64_t v70 = v76;
        double v267 = 0.0;
        double v268 = 0.0;
        double v266 = 0.0;
        sub_2194EB520(v68, &v281, &v268, &v267, &v266);
        if ((int)v268 >= 0x1000) {
          sub_21950A29C();
        }
        __int16 v94 = vcvtas_u32_f32((float)((float)(((vcvtd_n_u64_f64(*(double *)(a1 + 960 + 8 * (BYTE8(v269) & 0x1F)), 0xDuLL) << (DWORD2(v269) >> 5))+ 8) >> 4)* 0.0019531)* 512.0);
        HIDWORD(v269) = (int)v268 >> 4;
        *(_DWORD *)long long v270 = v94 & 0x3FFF;
        sub_2194EB754(a1, a3, v67, v264, (unsigned int *)&v271, v65, v66, v267, v266);
        long long v95 = (void *)(*(void *)(a1 + 248) + 24 * v265);
        long long v96 = v95 + 1;
        long long v97 = (_OWORD *)v95[1];
        unint64_t v98 = v95[2];
        if ((unint64_t)v97 >= v98)
        {
          long long v105 = (_OWORD *)*v95;
          unint64_t v106 = 0x82FA0BE82FA0BE83 * (((uint64_t)v97 - *v95) >> 2);
          unint64_t v107 = v106 + 1;
          if (v106 + 1 > 0x17D05F417D05F41) {
            sub_219486AE4();
          }
          unint64_t v108 = 0x82FA0BE82FA0BE83 * ((uint64_t)(v98 - (void)v105) >> 2);
          if (2 * v108 > v107) {
            unint64_t v107 = 2 * v108;
          }
          unint64_t v109 = v108 >= 0xBE82FA0BE82FA0 ? 0x17D05F417D05F41 : v107;
          if (v109)
          {
            if (v109 > 0x17D05F417D05F41) {
              sub_219486AFC();
            }
            char v110 = (char *)operator new(172 * v109);
          }
          else
          {
            char v110 = 0;
          }
          long long v111 = v280[0];
          unsigned int v112 = &v110[172 * v106];
          *((_OWORD *)v112 + 8) = v279;
          *((_OWORD *)v112 + 9) = v111;
          *(_OWORD *)(v112 + 156) = *(_OWORD *)((char *)v280 + 12);
          long long v113 = v276;
          *((_OWORD *)v112 + 4) = v275;
          *((_OWORD *)v112 + 5) = v113;
          long long v114 = v278;
          *((_OWORD *)v112 + 6) = v277;
          *((_OWORD *)v112 + 7) = v114;
          long long v115 = v272;
          *(_OWORD *)unsigned int v112 = v271;
          *((_OWORD *)v112 + 1) = v115;
          long long v116 = v274;
          *((_OWORD *)v112 + 2) = v273;
          *((_OWORD *)v112 + 3) = v116;
          unint64_t v117 = v112;
          if (v97 != v105)
          {
            do
            {
              long long v118 = *(_OWORD *)((char *)v97 - 172);
              long long v119 = *(_OWORD *)((char *)v97 - 156);
              *(_OWORD *)((char *)v117 - 140) = *(_OWORD *)((char *)v97 - 140);
              *(_OWORD *)((char *)v117 - 156) = v119;
              *(_OWORD *)((char *)v117 - 172) = v118;
              long long v120 = *(_OWORD *)((char *)v97 - 124);
              long long v121 = *(_OWORD *)((char *)v97 - 108);
              long long v122 = *(_OWORD *)((char *)v97 - 92);
              *(_OWORD *)((char *)v117 - 76) = *(_OWORD *)((char *)v97 - 76);
              *(_OWORD *)((char *)v117 - 92) = v122;
              *(_OWORD *)((char *)v117 - 108) = v121;
              *(_OWORD *)((char *)v117 - 124) = v120;
              long long v123 = *(_OWORD *)((char *)v97 - 60);
              long long v124 = *(_OWORD *)((char *)v97 - 44);
              long long v125 = *(_OWORD *)((char *)v97 - 28);
              *(v117 - 1) = *(v97 - 1);
              *(_OWORD *)((char *)v117 - 28) = v125;
              *(_OWORD *)((char *)v117 - 44) = v124;
              *(_OWORD *)((char *)v117 - 60) = v123;
              unint64_t v117 = (_OWORD *)((char *)v117 - 172);
              long long v97 = (_OWORD *)((char *)v97 - 172);
            }
            while (v97 != v105);
            long long v97 = (_OWORD *)*v95;
          }
          *long long v95 = v117;
          long long v104 = v112 + 172;
          *long long v96 = v112 + 172;
          v95[2] = &v110[172 * v109];
          if (v97) {
            operator delete(v97);
          }
        }
        else
        {
          long long v99 = v280[0];
          v97[8] = v279;
          v97[9] = v99;
          *(_OWORD *)((char *)v97 + 156) = *(_OWORD *)((char *)v280 + 12);
          long long v100 = v276;
          v97[4] = v275;
          v97[5] = v100;
          long long v101 = v278;
          v97[6] = v277;
          v97[7] = v101;
          long long v102 = v272;
          *long long v97 = v271;
          v97[1] = v102;
          long long v103 = v274;
          v97[2] = v273;
          v97[3] = v103;
          long long v104 = (char *)v97 + 172;
        }
        uint64_t v126 = 0;
        *long long v96 = v104;
        long long v301 = 0u;
        long long v302 = 0u;
        long long v127 = &v299;
        long long v299 = 0u;
        long long v300 = 0u;
        do
        {
          long long v128 = (int *)(a1 + v126);
          *(unsigned char *)v127 |= (*((_DWORD *)&v271 + *(int *)(a1 + v126 + 1216)) < *((_DWORD *)&v271
                                                                               + *(int *)(a1 + v126 + 3264))) | (2 * (*((_DWORD *)&v271 + v128[305]) < *((_DWORD *)&v271 + v128[817]))) | (4 * (*((_DWORD *)&v271 + v128[306]) < *((_DWORD *)&v271 + v128[818]))) | (8 * (*((_DWORD *)&v271 + v128[307]) < *((_DWORD *)&v271 + v128[819]))) | (16 * (*((_DWORD *)&v271 + v128[308]) < *((_DWORD *)&v271 + v128[820]))) | (32 * (*((_DWORD *)&v271 + v128[309]) < *((_DWORD *)&v271 + v128[821]))) | ((*((_DWORD *)&v271 + v128[310]) < *((_DWORD *)&v271 + v128[822])) << 6) | ((*((_DWORD *)&v271 + v128[311]) < *((_DWORD *)&v271 + v128[823])) << 7);
          long long v127 = (long long *)((char *)v127 + 1);
          v126 += 32;
        }
        while (v126 != 2048);
        sub_2194EDC24((uint64_t)&v295, (unsigned __int8 *)&v299);
        long long v130 = (_OWORD *)a4[11];
        unint64_t v129 = a4[12];
        if ((unint64_t)v130 >= v129)
        {
          long long v144 = (_OWORD *)*v257;
          uint64_t v145 = ((uint64_t)v130 - *v257) >> 8;
          unint64_t v146 = v145 + 1;
          if ((unint64_t)(v145 + 1) >> 56) {
            sub_219486AE4();
          }
          uint64_t v147 = v129 - (void)v144;
          if (v147 >> 7 > v146) {
            unint64_t v146 = v147 >> 7;
          }
          unint64_t v148 = (unint64_t)v147 >= 0x7FFFFFFFFFFFFF00 ? 0xFFFFFFFFFFFFFFLL : v146;
          if (v148)
          {
            if (HIBYTE(v148)) {
              sub_219486AFC();
            }
            unsigned int v149 = (char *)operator new(v148 << 8);
          }
          else
          {
            unsigned int v149 = 0;
          }
          long long v150 = *(_OWORD *)&v270[64];
          unsigned int v151 = &v149[256 * v145];
          *((_OWORD *)v151 + 4) = *(_OWORD *)&v270[48];
          *((_OWORD *)v151 + 5) = v150;
          long long v152 = *(_OWORD *)&v270[96];
          *((_OWORD *)v151 + 6) = *(_OWORD *)&v270[80];
          *((_OWORD *)v151 + 7) = v152;
          long long v153 = *(_OWORD *)v270;
          *(_OWORD *)unsigned int v151 = v269;
          *((_OWORD *)v151 + 1) = v153;
          long long v154 = *(_OWORD *)&v270[32];
          *((_OWORD *)v151 + 2) = *(_OWORD *)&v270[16];
          *((_OWORD *)v151 + 3) = v154;
          long long v155 = v299;
          long long v156 = v300;
          long long v157 = v302;
          *((_OWORD *)v151 + 10) = v301;
          *((_OWORD *)v151 + 11) = v157;
          *((_OWORD *)v151 + 8) = v155;
          *((_OWORD *)v151 + 9) = v156;
          long long v158 = v298;
          *((_OWORD *)v151 + 14) = v297;
          *((_OWORD *)v151 + 15) = v158;
          long long v159 = v296;
          *((_OWORD *)v151 + 12) = v295;
          *((_OWORD *)v151 + 13) = v159;
          long long v160 = v151;
          if (v130 != v144)
          {
            do
            {
              long long v161 = *(v130 - 16);
              long long v162 = *(v130 - 15);
              long long v163 = *(v130 - 13);
              *((_OWORD *)v160 - 14) = *(v130 - 14);
              *((_OWORD *)v160 - 13) = v163;
              *((_OWORD *)v160 - 16) = v161;
              *((_OWORD *)v160 - 15) = v162;
              long long v164 = *(v130 - 12);
              long long v165 = *(v130 - 11);
              long long v166 = *(v130 - 9);
              *((_OWORD *)v160 - 10) = *(v130 - 10);
              *((_OWORD *)v160 - 9) = v166;
              *((_OWORD *)v160 - 12) = v164;
              *((_OWORD *)v160 - 11) = v165;
              long long v167 = *(v130 - 8);
              long long v168 = *(v130 - 7);
              long long v169 = *(v130 - 5);
              *((_OWORD *)v160 - 6) = *(v130 - 6);
              *((_OWORD *)v160 - 5) = v169;
              *((_OWORD *)v160 - 8) = v167;
              *((_OWORD *)v160 - 7) = v168;
              long long v170 = *(v130 - 4);
              long long v171 = *(v130 - 3);
              long long v172 = *(v130 - 1);
              *((_OWORD *)v160 - 2) = *(v130 - 2);
              *((_OWORD *)v160 - 1) = v172;
              *((_OWORD *)v160 - 4) = v170;
              *((_OWORD *)v160 - 3) = v171;
              v160 -= 256;
              v130 -= 16;
            }
            while (v130 != v144);
            long long v130 = (_OWORD *)*v257;
          }
          long long v143 = v151 + 256;
          a4[10] = v160;
          a4[11] = v151 + 256;
          a4[12] = &v149[256 * v148];
          if (v130) {
            operator delete(v130);
          }
        }
        else
        {
          long long v131 = v269;
          long long v132 = *(_OWORD *)v270;
          long long v133 = *(_OWORD *)&v270[32];
          v130[2] = *(_OWORD *)&v270[16];
          v130[3] = v133;
          *long long v130 = v131;
          v130[1] = v132;
          long long v134 = *(_OWORD *)&v270[96];
          long long v136 = *(_OWORD *)&v270[64];
          long long v135 = *(_OWORD *)&v270[80];
          v130[4] = *(_OWORD *)&v270[48];
          v130[5] = v136;
          v130[6] = v135;
          v130[7] = v134;
          long long v137 = v299;
          long long v138 = v300;
          long long v139 = v302;
          v130[10] = v301;
          v130[11] = v139;
          v130[8] = v137;
          v130[9] = v138;
          long long v140 = v295;
          long long v141 = v296;
          long long v142 = v298;
          v130[14] = v297;
          v130[15] = v142;
          v130[12] = v140;
          v130[13] = v141;
          long long v143 = v130 + 16;
        }
        a4[11] = v143;
        sub_2194CF56C((void *)(a1 + 224), &v269, &v299, &v295, v265);
        long long v292 = *(_OWORD *)&v270[57];
        long long v293 = *(_OWORD *)&v270[73];
        v294[0] = *(_OWORD *)&v270[89];
        long long v289 = *(_OWORD *)&v270[9];
        long long v290 = *(_OWORD *)&v270[25];
        *(void *)((char *)v294 + 15) = *(void *)&v270[104];
        uint64_t v41 = v264;
        char v173 = *(unsigned char *)(a1 + 56) ? (v264 - (DWORD2(v269) >> 4)) & 1 : v270[8];
        long long v291 = *(_OWORD *)&v270[41];
        if (!v270[8]) {
          break;
        }
        long long v175 = *(_OWORD **)(a1 + 448);
        unint64_t v174 = *(void *)(a1 + 456);
        if ((unint64_t)v175 >= v174)
        {
          long long v176 = (_OWORD *)*v255;
          uint64_t v177 = ((uint64_t)v175 - *v255) >> 8;
          unint64_t v178 = v177 + 1;
          if ((unint64_t)(v177 + 1) >> 56) {
            sub_219486AE4();
          }
          uint64_t v179 = v174 - (void)v176;
          if (v179 >> 7 > v178) {
            unint64_t v178 = v179 >> 7;
          }
          if ((unint64_t)v179 >= 0x7FFFFFFFFFFFFF00) {
            unint64_t v180 = 0xFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v180 = v178;
          }
          if (v180)
          {
            if (HIBYTE(v180)) {
              sub_219486AFC();
            }
            long long v181 = (char *)operator new(v180 << 8);
          }
          else
          {
            long long v181 = 0;
          }
          unsigned int v203 = &v181[256 * v177];
          *(_OWORD *)unsigned int v203 = v269;
          long long v204 = *(_OWORD *)&v270[41];
          *(_OWORD *)(v203 + 73) = *(_OWORD *)&v270[57];
          long long v205 = *(_OWORD *)&v270[89];
          *(_OWORD *)(v203 + 89) = *(_OWORD *)&v270[73];
          *(_OWORD *)(v203 + 105) = v205;
          long long v206 = *(_OWORD *)&v270[25];
          *(_OWORD *)(v203 + 25) = *(_OWORD *)&v270[9];
          *((void *)v203 + 2) = *(void *)v270;
          v203[24] = v173;
          *((void *)v203 + 15) = *(void *)&v270[104];
          *(_OWORD *)(v203 + 41) = v206;
          *(_OWORD *)(v203 + 57) = v204;
          long long v207 = v302;
          *((_OWORD *)v203 + 10) = v301;
          *((_OWORD *)v203 + 11) = v207;
          long long v208 = v300;
          *((_OWORD *)v203 + 8) = v299;
          *((_OWORD *)v203 + 9) = v208;
          long long v209 = v298;
          *((_OWORD *)v203 + 14) = v297;
          *((_OWORD *)v203 + 15) = v209;
          long long v210 = v296;
          *((_OWORD *)v203 + 12) = v295;
          *((_OWORD *)v203 + 13) = v210;
          long long v211 = v203;
          if (v175 == v176)
          {
            uint64_t v4 = v258;
            uint64_t v41 = v264;
            uint64_t v57 = v261;
            uint64_t v55 = v203 + 256;
            *(void *)(a1 + 440) = v203;
            *(void *)(a1 + 448) = v203 + 256;
            *(void *)(a1 + 456) = &v181[256 * v180];
            if (v175) {
              goto LABEL_113;
            }
          }
          else
          {
            uint64_t v57 = v261;
            do
            {
              long long v212 = *(v175 - 16);
              long long v213 = *(v175 - 15);
              long long v214 = *(v175 - 13);
              *((_OWORD *)v211 - 14) = *(v175 - 14);
              *((_OWORD *)v211 - 13) = v214;
              *((_OWORD *)v211 - 16) = v212;
              *((_OWORD *)v211 - 15) = v213;
              long long v215 = *(v175 - 12);
              long long v216 = *(v175 - 11);
              long long v217 = *(v175 - 9);
              *((_OWORD *)v211 - 10) = *(v175 - 10);
              *((_OWORD *)v211 - 9) = v217;
              *((_OWORD *)v211 - 12) = v215;
              *((_OWORD *)v211 - 11) = v216;
              long long v218 = *(v175 - 8);
              long long v219 = *(v175 - 7);
              long long v220 = *(v175 - 5);
              *((_OWORD *)v211 - 6) = *(v175 - 6);
              *((_OWORD *)v211 - 5) = v220;
              *((_OWORD *)v211 - 8) = v218;
              *((_OWORD *)v211 - 7) = v219;
              long long v221 = *(v175 - 4);
              long long v222 = *(v175 - 3);
              long long v223 = *(v175 - 1);
              *((_OWORD *)v211 - 2) = *(v175 - 2);
              *((_OWORD *)v211 - 1) = v223;
              *((_OWORD *)v211 - 4) = v221;
              *((_OWORD *)v211 - 3) = v222;
              v211 -= 256;
              v175 -= 16;
            }
            while (v175 != v176);
            long long v175 = (_OWORD *)*v255;
            uint64_t v4 = v258;
            uint64_t v41 = v264;
            uint64_t v55 = v203 + 256;
            *(void *)(a1 + 440) = v211;
            *(void *)(a1 + 448) = v203 + 256;
            *(void *)(a1 + 456) = &v181[256 * v180];
            if (v175) {
LABEL_113:
            }
              operator delete(v175);
          }
          uint64_t v56 = v260;
          goto LABEL_28;
        }
        long long v45 = v269;
        *((void *)v175 + 2) = *(void *)v270;
        *long long v175 = v45;
        *((unsigned char *)v175 + 24) = v173;
        long long v46 = v290;
        *(_OWORD *)((char *)v175 + 25) = v289;
        *(_OWORD *)((char *)v175 + 41) = v46;
        long long v47 = v292;
        *(_OWORD *)((char *)v175 + 57) = v291;
        *(_OWORD *)((char *)v175 + 73) = v47;
        long long v48 = v294[0];
        *(_OWORD *)((char *)v175 + 89) = v293;
        *(_OWORD *)((char *)v175 + 105) = v48;
        *((void *)v175 + 15) = *(void *)((char *)v294 + 15);
        long long v49 = v299;
        long long v50 = v300;
        long long v51 = v302;
        v175[10] = v301;
        v175[11] = v51;
        v175[8] = v49;
        v175[9] = v50;
        long long v52 = v295;
        long long v53 = v296;
        long long v54 = v298;
        v175[14] = v297;
        v175[15] = v54;
        uint64_t v55 = v175 + 16;
        v175[12] = v52;
        v175[13] = v53;
        uint64_t v4 = v258;
        uint64_t v56 = v260;
        uint64_t v57 = v261;
LABEL_28:
        *(void *)(a1 + 448) = v55;
        uint64_t v260 = v56 + 1;
        uint64_t v43 = v57 + 1;
        if (v43 == v259) {
          goto LABEL_21;
        }
      }
      long long v183 = *(char **)(a1 + 472);
      unint64_t v182 = *(void *)(a1 + 480);
      if ((unint64_t)v183 >= v182) {
        break;
      }
      long long v184 = v269;
      *((void *)v183 + 2) = *(void *)v270;
      *(_OWORD *)long long v183 = v184;
      v183[24] = v173;
      long long v185 = v290;
      *(_OWORD *)(v183 + 25) = v289;
      *(_OWORD *)(v183 + 41) = v185;
      long long v186 = v292;
      *(_OWORD *)(v183 + 57) = v291;
      *(_OWORD *)(v183 + 73) = v186;
      long long v187 = v294[0];
      *(_OWORD *)(v183 + 89) = v293;
      *(_OWORD *)(v183 + 105) = v187;
      *((void *)v183 + 15) = *(void *)((char *)v294 + 15);
      long long v188 = v299;
      long long v189 = v300;
      long long v190 = v302;
      *((_OWORD *)v183 + 10) = v301;
      *((_OWORD *)v183 + 11) = v190;
      *((_OWORD *)v183 + 8) = v188;
      *((_OWORD *)v183 + 9) = v189;
      long long v191 = v295;
      long long v192 = v296;
      long long v193 = v298;
      *((_OWORD *)v183 + 14) = v297;
      *((_OWORD *)v183 + 15) = v193;
      long long v194 = v183 + 256;
      *((_OWORD *)v183 + 12) = v191;
      *((_OWORD *)v183 + 13) = v192;
      uint64_t v4 = v258;
      uint64_t v195 = v256;
      uint64_t v196 = v261;
LABEL_124:
      *(void *)(a1 + 472) = v194;
      uint64_t v256 = v195 + 1;
      uint64_t v43 = v196 + 1;
      if (v43 == v259)
      {
LABEL_21:
        int v40 = *(_DWORD *)(a1 + 24);
        goto LABEL_22;
      }
    }
    long long v197 = (char *)*v254;
    uint64_t v198 = (v183 - (unsigned char *)*v254) >> 8;
    unint64_t v199 = v198 + 1;
    if ((unint64_t)(v198 + 1) >> 56) {
      sub_219486AE4();
    }
    uint64_t v200 = v182 - (void)v197;
    if (v200 >> 7 > v199) {
      unint64_t v199 = v200 >> 7;
    }
    if ((unint64_t)v200 >= 0x7FFFFFFFFFFFFF00) {
      unint64_t v201 = 0xFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v201 = v199;
    }
    if (v201)
    {
      if (HIBYTE(v201)) {
        sub_219486AFC();
      }
      unsigned int v202 = (char *)operator new(v201 << 8);
    }
    else
    {
      unsigned int v202 = 0;
    }
    long long v224 = &v202[256 * v198];
    *(_OWORD *)long long v224 = v269;
    long long v225 = *(_OWORD *)&v270[41];
    *(_OWORD *)(v224 + 73) = *(_OWORD *)&v270[57];
    long long v226 = *(_OWORD *)&v270[89];
    *(_OWORD *)(v224 + 89) = *(_OWORD *)&v270[73];
    *(_OWORD *)(v224 + 105) = v226;
    long long v227 = *(_OWORD *)&v270[25];
    *(_OWORD *)(v224 + 25) = *(_OWORD *)&v270[9];
    *((void *)v224 + 2) = *(void *)v270;
    v224[24] = v173;
    *((void *)v224 + 15) = *(void *)&v270[104];
    *(_OWORD *)(v224 + 41) = v227;
    *(_OWORD *)(v224 + 57) = v225;
    long long v228 = v302;
    *((_OWORD *)v224 + 10) = v301;
    *((_OWORD *)v224 + 11) = v228;
    long long v229 = v300;
    *((_OWORD *)v224 + 8) = v299;
    *((_OWORD *)v224 + 9) = v229;
    long long v230 = v298;
    *((_OWORD *)v224 + 14) = v297;
    *((_OWORD *)v224 + 15) = v230;
    long long v231 = v296;
    *((_OWORD *)v224 + 12) = v295;
    *((_OWORD *)v224 + 13) = v231;
    uint64_t v232 = v224;
    if (v183 == v197)
    {
      uint64_t v4 = v258;
      uint64_t v41 = v264;
      uint64_t v196 = v261;
      long long v194 = v224 + 256;
      *(void *)(a1 + 464) = v224;
      *(void *)(a1 + 472) = v224 + 256;
      *(void *)(a1 + 480) = &v202[256 * v201];
      if (!v183) {
        goto LABEL_123;
      }
    }
    else
    {
      uint64_t v196 = v261;
      do
      {
        long long v233 = *((_OWORD *)v183 - 16);
        long long v234 = *((_OWORD *)v183 - 15);
        long long v235 = *((_OWORD *)v183 - 13);
        *((_OWORD *)v232 - 14) = *((_OWORD *)v183 - 14);
        *((_OWORD *)v232 - 13) = v235;
        *((_OWORD *)v232 - 16) = v233;
        *((_OWORD *)v232 - 15) = v234;
        long long v236 = *((_OWORD *)v183 - 12);
        long long v237 = *((_OWORD *)v183 - 11);
        long long v238 = *((_OWORD *)v183 - 9);
        *((_OWORD *)v232 - 10) = *((_OWORD *)v183 - 10);
        *((_OWORD *)v232 - 9) = v238;
        *((_OWORD *)v232 - 12) = v236;
        *((_OWORD *)v232 - 11) = v237;
        long long v239 = *((_OWORD *)v183 - 8);
        long long v240 = *((_OWORD *)v183 - 7);
        long long v241 = *((_OWORD *)v183 - 5);
        *((_OWORD *)v232 - 6) = *((_OWORD *)v183 - 6);
        *((_OWORD *)v232 - 5) = v241;
        *((_OWORD *)v232 - 8) = v239;
        *((_OWORD *)v232 - 7) = v240;
        long long v242 = *((_OWORD *)v183 - 4);
        long long v243 = *((_OWORD *)v183 - 3);
        long long v244 = *((_OWORD *)v183 - 1);
        *((_OWORD *)v232 - 2) = *((_OWORD *)v183 - 2);
        *((_OWORD *)v232 - 1) = v244;
        *((_OWORD *)v232 - 4) = v242;
        *((_OWORD *)v232 - 3) = v243;
        v232 -= 256;
        v183 -= 256;
      }
      while (v183 != v197);
      long long v183 = (char *)*v254;
      uint64_t v4 = v258;
      uint64_t v41 = v264;
      long long v194 = v224 + 256;
      *(void *)(a1 + 464) = v232;
      *(void *)(a1 + 472) = v224 + 256;
      *(void *)(a1 + 480) = &v202[256 * v201];
      if (!v183) {
        goto LABEL_123;
      }
    }
    operator delete(v183);
LABEL_123:
    uint64_t v195 = v256;
    goto LABEL_124;
  }
  uint64_t v256 = 0;
  uint64_t v260 = 0;
LABEL_129:
  long long v245 = (char *)(*(void *)(a1 + 464) + ((v253 - v252) << 24 >> 24));
  sub_2194D0C0C(v251, v245, *(char **)(a1 + 472), (uint64_t)(*(void *)(a1 + 472) - (void)v245) >> 8);
  long long v246 = (char *)(*(void *)(a1 + 440) + ((v250 - v249) << 24 >> 24));
  double result = sub_2194D0C0C(v248, v246, *(char **)(a1 + 448), (uint64_t)(*(void *)(a1 + 448) - (void)v246) >> 8);
  if (v260 + v256 != (uint64_t)(a4[11] - a4[10]) >> 8) {
    sub_21950A264();
  }
  return result;
}

uint64_t sub_2194EB19C(uint64_t a1, uint64_t a2, int a3, signed int a4, unsigned int *a5, double a6, double a7)
{
  sub_2194ECC4C(a1, a2, a4, a3, (uint64_t)&v170, (uint64_t)&v141, &v137, a6, a7);
  sub_2194ED460(a1 + 224, &v170, &v141, a4 - 1);
  uint64_t v11 = 144 * v137.i32[0];
  *a5 = sub_2194EDB38(*(void *)(a2 + 48) + v11, *(double *)&v170, *(double *)&v141, v12, v13, v14, v15);
  a5[1] = sub_2194EDB38(*(void *)(a2 + 48) + v11, *((double *)&v170 + 1), *((double *)&v141 + 1), v16, v17, v18, v19);
  a5[2] = sub_2194EDB38(*(void *)(a2 + 48) + v11, v171, v142, v20, v21, v22, v23);
  a5[3] = sub_2194EDB38(*(void *)(a2 + 48) + v11, v172, v143, v24, v25, v26, v27);
  a5[4] = sub_2194EDB38(*(void *)(a2 + 48) + v11, v173, v144, v28, v29, v30, v31);
  a5[5] = sub_2194EDB38(*(void *)(a2 + 48) + v11, v174, v145, v32, v33, v34, v35);
  uint64_t v36 = 144 * v137.i32[1];
  a5[6] = sub_2194EDB38(*(void *)(a2 + 48) + v36, v175, v146, v37, v38, v39, v40);
  a5[7] = sub_2194EDB38(*(void *)(a2 + 48) + v36, v176, v147, v41, v42, v43, v44);
  a5[8] = sub_2194EDB38(*(void *)(a2 + 48) + v36, v177, v148, v45, v46, v47, v48);
  a5[9] = sub_2194EDB38(*(void *)(a2 + 48) + v36, v178, v149, v49, v50, v51, v52);
  a5[10] = sub_2194EDB38(*(void *)(a2 + 48) + v36, v179, v150, v53, v54, v55, v56);
  a5[11] = sub_2194EDB38(*(void *)(a2 + 48) + v36, v180, v151, v57, v58, v59, v60);
  uint64_t v61 = 144 * v138;
  a5[12] = sub_2194EDB38(*(void *)(a2 + 48) + v61, v181, v152, v62, v63, v64, v65);
  a5[13] = sub_2194EDB38(*(void *)(a2 + 48) + v61, v182, v153, v66, v67, v68, v69);
  a5[14] = sub_2194EDB38(*(void *)(a2 + 48) + v61, v183, v154, v70, v71, v72, v73);
  a5[15] = sub_2194EDB38(*(void *)(a2 + 48) + v61, v184, v155, v74, v75, v76, v77);
  a5[16] = sub_2194EDB38(*(void *)(a2 + 48) + v61, v185, v156, v78, v79, v80, v81);
  a5[17] = sub_2194EDB38(*(void *)(a2 + 48) + v61, v186, v157, v82, v83, v84, v85);
  uint64_t v86 = 144 * v139;
  a5[18] = sub_2194EDB38(*(void *)(a2 + 48) + v86, v187, v158, v87, v88, v89, v90);
  a5[19] = sub_2194EDB38(*(void *)(a2 + 48) + v86, v188, v159, v91, v92, v93, v94);
  a5[20] = sub_2194EDB38(*(void *)(a2 + 48) + v86, v189, v160, v95, v96, v97, v98);
  a5[21] = sub_2194EDB38(*(void *)(a2 + 48) + v86, v190, v161, v99, v100, v101, v102);
  a5[22] = sub_2194EDB38(*(void *)(a2 + 48) + v86, v191, v162, v103, v104, v105, v106);
  a5[23] = sub_2194EDB38(*(void *)(a2 + 48) + v86, v192, v163, v107, v108, v109, v110);
  uint64_t v111 = 144 * v140;
  a5[24] = sub_2194EDB38(*(void *)(a2 + 48) + v111, v193, v164, v112, v113, v114, v115);
  a5[25] = sub_2194EDB38(*(void *)(a2 + 48) + v111, v194, v165, v116, v117, v118, v119);
  a5[26] = sub_2194EDB38(*(void *)(a2 + 48) + v111, v195, v166, v120, v121, v122, v123);
  a5[27] = sub_2194EDB38(*(void *)(a2 + 48) + v111, v196, v167, v124, v125, v126, v127);
  a5[28] = sub_2194EDB38(*(void *)(a2 + 48) + v111, v197, v168, v128, v129, v130, v131);
  uint64_t result = sub_2194EDB38(*(void *)(a2 + 48) + v111, v198, v169, v132, v133, v134, v135);
  a5[29] = result;
  return result;
}

double sub_2194EB520(uint64_t a1, _DWORD *a2, double *a3, double *a4, double *a5)
{
  int v8 = a2[1];
  int v9 = a2[3];
  int v10 = a2[4];
  int v11 = v8 + v9 - (*a2 + v10);
  int v12 = v8 + *a2 - (v9 + v10);
  int v13 = a2[10];
  int v14 = a2[11];
  int v15 = a2[8];
  int v16 = a2[7];
  int v17 = v16 + v15 - (v13 + v14);
  int v18 = v16 - (v15 + v13);
  int v20 = a2[12];
  int v19 = a2[13];
  int v21 = a2[15];
  int v22 = a2[16];
  int v23 = v19 + v21 + v11 - (v20 + v22);
  int v24 = v19 + v20 + v12 - (v21 + v22);
  int v25 = a2[22];
  int v26 = a2[23];
  int v27 = a2[20];
  int v28 = a2[19];
  int v29 = v28 + v27 + v17 - (v25 + v26);
  int v30 = v28 + v14 + v18 - (v27 + v25) + v26;
  int v32 = a2[24];
  int v31 = a2[25];
  int v33 = a2[28];
  int v34 = a2[27];
  int v35 = v31
      + v34
      + v23
      - (v32
       + v33)
      + ((1550 * v29 + 512) >> 10)
      + ((1941 * (a2[2] + a2[14] + a2[26] - (a2[5] + a2[17] + a2[29])) + 512) >> 10);
  int v36 = v30
      + ((1941 * (a2[9] + a2[21] - (a2[6] + a2[18])) + 512) >> 10)
      + ((1550 * (v31 + v32 + v24 - (v34 + v33)) + 512) >> 10);
  double v37 = 0.0;
  if (v36 | v35) {
    double v37 = (double)(int)sub_2194F4098(v36, v35);
  }
  *a3 = v37;
  double v38 = sub_2194F4294(13, (double)(v35 * (uint64_t)v35 + v36 * (uint64_t)v36));
  if (v36 | v35)
  {
    double v40 = sub_2194F41DC(v38);
    double v41 = sub_2194F4294(13, (double)v35);
    double v42 = sub_2194F4294(13, (double)v36);
    *a4 = sub_2194F4294(13, v40 * v41);
    double v39 = sub_2194F4294(13, v40 * v42);
  }
  else
  {
    *a4 = 1.0;
    double v39 = 0.0;
  }
  *a5 = v39;
  *a4 = floor(*a4 * 256.0 + 0.5) * 0.00390625;
  double result = floor(*a5 * 256.0 + 0.5) * 0.00390625;
  *a5 = result;
  return result;
}

uint64_t sub_2194EB754(uint64_t a1, uint64_t a2, int a3, signed int a4, unsigned int *a5, double a6, double a7, double a8, double a9)
{
  double v49 = a9;
  v50[0] = a8;
  int v16 = *(_DWORD *)(a1 + 24) - 1;
  if (v16 >= a4) {
    int v16 = a4;
  }
  *a5 = sub_2194EDB38(*(void *)(a2 + 48) + 144 * v16, floor(floor(a6 / (double)(1 << (a4 >> 1)) * 128.0 + 0.5) * 0.0078125 * 64.0 + 0.5) * 0.015625, floor(floor(a7 / (double)(1 << (a4 >> 1)) * 128.0 + 0.5) * 0.0078125 * 64.0 + 0.5) * 0.015625, 128.0, 0.5, 0.0078125, 64.0);
  int v17 = a5 + 3;
  sub_2194ED1A0(a1, a2, a4, a3, (uint64_t)__src, (uint64_t)v47, (uint64_t)v46, v50, a6, a7, &v49);
  sub_2194ED824(a1 + 224, __src, v47, a4 - 1);
  uint64_t v22 = 0;
  for (uint64_t i = 0; i != 28; i += 4)
  {
    uint64_t v24 = 144 * *(int *)&v46[i];
    *(v17 - 2) = sub_2194EDB38(*(void *)(a2 + 48) + v24, *(double *)&__src[v22], *(double *)&v47[v22], v18, v19, v20, v21);
    *(v17 - 1) = sub_2194EDB38(*(void *)(a2 + 48) + v24, *(double *)&__src[v22 + 8], *(double *)&v47[v22 + 8], v25, v26, v27, v28);
    *int v17 = sub_2194EDB38(*(void *)(a2 + 48) + v24, *(double *)&__src[v22 + 16], *(double *)&v47[v22 + 16], v29, v30, v31, v32);
    v17[1] = sub_2194EDB38(*(void *)(a2 + 48) + v24, *(double *)&__src[v22 + 24], *(double *)&v47[v22 + 24], v33, v34, v35, v36);
    _OWORD v17[2] = sub_2194EDB38(*(void *)(a2 + 48) + v24, *(double *)&__src[v22 + 32], *(double *)&v47[v22 + 32], v37, v38, v39, v40);
    uint64_t result = sub_2194EDB38(*(void *)(a2 + 48) + v24, *(double *)&__src[v22 + 40], *(double *)&v47[v22 + 40], v41, v42, v43, v44);
    v17[3] = result;
    v22 += 48;
    v17 += 6;
  }
  return result;
}

void sub_2194EB968(uint64_t a1@<X0>, char **a2@<X8>)
{
  long long v2 = a2;
  v146[2] = *MEMORY[0x263EF8340];
  memset(v145, 0, sizeof(v145));
  v144[2] = xmmword_21950DF08;
  v144[3] = unk_21950DF18;
  v144[4] = xmmword_21950DF28;
  v144[0] = xmmword_21950DEE8;
  v144[1] = unk_21950DEF8;
  memset(v146, 0, 10);
  int v3 = *(_DWORD *)(a1 + 24);
  if ((v3 - 1) <= 1)
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    return;
  }
  uint64_t v5 = *(void *)(a1 + 368);
  unint64_t v6 = v3 - 2;
  if (v6 >= 2)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v8 = v6 | 1;
    int v11 = (uint64_t *)(v5 + 24);
    unint64_t v12 = v6 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      uint64_t v13 = *(v11 - 3);
      uint64_t v14 = *(v11 - 2);
      uint64_t v16 = *v11;
      uint64_t v15 = v11[1];
      v11 += 6;
      v9 += (v14 - v13) >> 7;
      v10 += (v15 - v16) >> 7;
      v12 -= 2;
    }
    while (v12);
    uint64_t v7 = v10 + v9;
    if (v6 == (v6 & 0xFFFFFFFFFFFFFFFELL)) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 1;
  }
  uint64_t v17 = ~v8 + v3;
  double v18 = (uint64_t *)(v5 + 24 * v8 - 24);
  do
  {
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    v18 += 3;
    v7 += (v19 - v20) >> 7;
    --v17;
  }
  while (v17);
LABEL_13:
  *long long v2 = 0;
  v2[1] = 0;
  v2[2] = 0;
  double v143 = 0;
  double v142 = v2;
  if ((v3 - 3) > 0xFFFFFFFD) {
    goto LABEL_46;
  }
  uint64_t v140 = v7;
  double v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  unint64_t v25 = 1;
  do
  {
    if (v21 < v22)
    {
      *(void *)double v21 = v23;
      uint64_t v26 = (uint64_t)(v21 + 8);
      goto LABEL_16;
    }
    uint64_t v27 = (v21 - v24) >> 3;
    unint64_t v28 = v27 + 1;
    if ((unint64_t)(v27 + 1) >> 61) {
      sub_219486AE4();
    }
    if ((v22 - v24) >> 2 > v28) {
      unint64_t v28 = (v22 - v24) >> 2;
    }
    if ((unint64_t)(v22 - v24) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v29 = v28;
    }
    if (v29)
    {
      if (v29 >> 61) {
        sub_219486AFC();
      }
      double v30 = operator new(8 * v29);
      double v31 = &v30[8 * v27];
      *double v31 = v23;
      uint64_t v26 = (uint64_t)(v31 + 1);
      if (v21 == v24) {
        goto LABEL_32;
      }
    }
    else
    {
      double v30 = 0;
      double v31 = (void *)(8 * v27);
      *(void *)(8 * v27) = v23;
      uint64_t v26 = 8 * v27 + 8;
      if (v21 == v24) {
        goto LABEL_32;
      }
    }
    unint64_t v32 = v21 - 8 - v24;
    if (v32 >= 0x168)
    {
      if (&v30[v21 - v24 - 8 - (v32 & 0xFFFFFFFFFFFFFFF8)] > &v30[v21 - v24 - 8])
      {
        double v33 = v21;
      }
      else if (&v21[-(v32 & 0xFFFFFFFFFFFFFFF8) - 8] > v21 - 8)
      {
        double v33 = v21;
      }
      else if ((unint64_t)(v24 - v30) >= 0x20)
      {
        uint64_t v36 = (v32 >> 3) + 1;
        uint64_t v37 = 8 * (v36 & 0x3FFFFFFFFFFFFFFCLL);
        double v33 = &v21[-v37];
        double v31 = (void *)((char *)v31 - v37);
        double v38 = &v30[8 * v27 - 16];
        double v39 = v21 - 16;
        uint64_t v40 = v36 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v41 = *(_OWORD *)v39;
          *(v38 - 1) = *((_OWORD *)v39 - 1);
          _OWORD *v38 = v41;
          v38 -= 2;
          v39 -= 32;
          v40 -= 4;
        }
        while (v40);
        if (v36 == (v36 & 0x3FFFFFFFFFFFFFFCLL)) {
          goto LABEL_32;
        }
      }
      else
      {
        double v33 = v21;
      }
    }
    else
    {
      double v33 = v21;
    }
    do
    {
      uint64_t v34 = *((void *)v33 - 1);
      v33 -= 8;
      *--double v31 = v34;
    }
    while (v33 != v24);
LABEL_32:
    uint64_t v22 = &v30[8 * v29];
    double v143 = v31;
    if (v24)
    {
      uint64_t v35 = v26;
      operator delete(v24);
      uint64_t v26 = v35;
      int v3 = *(_DWORD *)(a1 + 24);
    }
    uint64_t v24 = (char *)v31;
LABEL_16:
    v23 += (uint64_t)(*(void *)(*(void *)(a1 + 368) + 24 * v25 - 16)
                   - *(void *)(*(void *)(a1 + 368) + 24 * v25 - 24)) >> 7;
    ++v25;
    double v21 = (char *)v26;
  }
  while (v25 < v3 - 1);
  uint64_t v7 = v140;
  long long v2 = v142;
LABEL_46:
  if (v7)
  {
    unint64_t v42 = 0;
    int v138 = (uint64_t **)(a1 + 496);
    int v43 = 1;
    do
    {
      BYTE1(v146[1]) = 0;
      *(void *)((char *)v146 + 1) = 0;
      int v137 = v43;
      do
      {
        if ((v3 - 3) > 0xFFFFFFFD) {
          break;
        }
        char v44 = 0;
        unint64_t v45 = 1;
        do
        {
          uint64_t v46 = *(void *)(a1 + 368);
          if (v45 == 1) {
            goto LABEL_132;
          }
          int v47 = *((_DWORD *)&dword_21950DF64 + (int)v45);
          BOOL v48 = __OFSUB__(v43, v47);
          int v49 = v43 - v47;
          if (v49 < 0 == v48)
          {
            int v50 = (v45 & 0x80000000) == 0 ? v45 : (int)v45 + 1;
            int v51 = v49 & 0xF;
            int v53 = -v49;
            BOOL v52 = v53 < 0;
            int v54 = v53 & 0xF;
            int v55 = v52 ? v51 : -v54;
            if (v55 < 1 << (4 - (v50 >> 1)))
            {
LABEL_132:
              if (!*((unsigned char *)v146 + v45))
              {
                uint64_t v56 = 24 * (v45 - 1);
                unint64_t v57 = *((void *)v145 + v45);
                uint64_t v58 = *(void *)(v46 + v56 + 8);
                uint64_t v59 = *(void *)(v46 + v56);
                if (v57 < (v58 - v59) >> 7)
                {
                  double v60 = (long long *)(v59 + (v57 << 7));
                  unint64_t v61 = *((void *)v144 + v45);
                  if (v61 >= (unsigned __int16)*((_DWORD *)v60 + 1) >> 6)
                  {
                    uint64_t v139 = *((void *)v145 + v45);
                    uint64_t v141 = v7;
                    double v62 = (long long *)(*(void *)(*(void *)(a1 + 392) + v56) + (v57 << 6));
                    double v63 = (long long *)(*(void *)(*(void *)(a1 + 416) + v56) + (v57 << 6));
                    double v65 = v2[1];
                    unint64_t v64 = (unint64_t)v2[2];
                    if ((unint64_t)v65 >= v64)
                    {
                      double v79 = *v2;
                      uint64_t v80 = (v65 - *v2) >> 8;
                      unint64_t v81 = v80 + 1;
                      if ((unint64_t)(v80 + 1) >> 56) {
                        sub_219486AE4();
                      }
                      uint64_t v82 = v64 - (void)v79;
                      if (v82 >> 7 > v81) {
                        unint64_t v81 = v82 >> 7;
                      }
                      if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFF00) {
                        unint64_t v83 = 0xFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v83 = v81;
                      }
                      if (v83)
                      {
                        unint64_t v136 = v42;
                        if (HIBYTE(v83)) {
                          sub_219486AFC();
                        }
                        unint64_t v84 = v83;
                        double v85 = (char *)operator new(v83 << 8);
                        unint64_t v83 = v84;
                        unint64_t v42 = v136;
                      }
                      else
                      {
                        double v85 = 0;
                      }
                      uint64_t v86 = &v85[256 * v80];
                      long long v87 = *v60;
                      long long v88 = v60[1];
                      long long v89 = v60[3];
                      *((_OWORD *)v86 + 2) = v60[2];
                      *((_OWORD *)v86 + 3) = v89;
                      *(_OWORD *)uint64_t v86 = v87;
                      *((_OWORD *)v86 + 1) = v88;
                      long long v90 = v60[4];
                      long long v91 = v60[5];
                      long long v92 = v60[7];
                      *((_OWORD *)v86 + 6) = v60[6];
                      *((_OWORD *)v86 + 7) = v92;
                      *((_OWORD *)v86 + 4) = v90;
                      *((_OWORD *)v86 + 5) = v91;
                      long long v93 = *v62;
                      long long v94 = v62[1];
                      long long v95 = v62[3];
                      *((_OWORD *)v86 + 10) = v62[2];
                      *((_OWORD *)v86 + 11) = v95;
                      *((_OWORD *)v86 + 8) = v93;
                      *((_OWORD *)v86 + 9) = v94;
                      long long v96 = *v63;
                      long long v97 = v63[1];
                      long long v98 = v63[3];
                      *((_OWORD *)v86 + 14) = v63[2];
                      *((_OWORD *)v86 + 15) = v98;
                      *((_OWORD *)v86 + 12) = v96;
                      *((_OWORD *)v86 + 13) = v97;
                      double v99 = v86;
                      if (v65 != v79)
                      {
                        do
                        {
                          long long v100 = *((_OWORD *)v65 - 16);
                          long long v101 = *((_OWORD *)v65 - 15);
                          long long v102 = *((_OWORD *)v65 - 13);
                          *((_OWORD *)v99 - 14) = *((_OWORD *)v65 - 14);
                          *((_OWORD *)v99 - 13) = v102;
                          *((_OWORD *)v99 - 16) = v100;
                          *((_OWORD *)v99 - 15) = v101;
                          long long v103 = *((_OWORD *)v65 - 12);
                          long long v104 = *((_OWORD *)v65 - 11);
                          long long v105 = *((_OWORD *)v65 - 9);
                          *((_OWORD *)v99 - 10) = *((_OWORD *)v65 - 10);
                          *((_OWORD *)v99 - 9) = v105;
                          *((_OWORD *)v99 - 12) = v103;
                          *((_OWORD *)v99 - 11) = v104;
                          long long v106 = *((_OWORD *)v65 - 8);
                          long long v107 = *((_OWORD *)v65 - 7);
                          long long v108 = *((_OWORD *)v65 - 5);
                          *((_OWORD *)v99 - 6) = *((_OWORD *)v65 - 6);
                          *((_OWORD *)v99 - 5) = v108;
                          *((_OWORD *)v99 - 8) = v106;
                          *((_OWORD *)v99 - 7) = v107;
                          long long v109 = *((_OWORD *)v65 - 4);
                          long long v110 = *((_OWORD *)v65 - 3);
                          long long v111 = *((_OWORD *)v65 - 1);
                          *((_OWORD *)v99 - 2) = *((_OWORD *)v65 - 2);
                          *((_OWORD *)v99 - 1) = v111;
                          *((_OWORD *)v99 - 4) = v109;
                          *((_OWORD *)v99 - 3) = v110;
                          v99 -= 256;
                          v65 -= 256;
                        }
                        while (v65 != v79);
                        double v65 = v79;
                      }
                      double v78 = v86 + 256;
                      *double v142 = v99;
                      v142[1] = v86 + 256;
                      v142[2] = &v85[256 * v83];
                      if (v65) {
                        operator delete(v65);
                      }
                    }
                    else
                    {
                      long long v66 = *v60;
                      long long v67 = v60[1];
                      long long v68 = v60[3];
                      *((_OWORD *)v65 + 2) = v60[2];
                      *((_OWORD *)v65 + 3) = v68;
                      *(_OWORD *)double v65 = v66;
                      *((_OWORD *)v65 + 1) = v67;
                      long long v69 = v60[4];
                      long long v70 = v60[5];
                      long long v71 = v60[7];
                      *((_OWORD *)v65 + 6) = v60[6];
                      *((_OWORD *)v65 + 7) = v71;
                      *((_OWORD *)v65 + 4) = v69;
                      *((_OWORD *)v65 + 5) = v70;
                      long long v72 = *v62;
                      long long v73 = v62[1];
                      long long v74 = v62[3];
                      *((_OWORD *)v65 + 10) = v62[2];
                      *((_OWORD *)v65 + 11) = v74;
                      *((_OWORD *)v65 + 8) = v72;
                      *((_OWORD *)v65 + 9) = v73;
                      long long v75 = *v63;
                      long long v76 = v63[1];
                      long long v77 = v63[3];
                      *((_OWORD *)v65 + 14) = v63[2];
                      *((_OWORD *)v65 + 15) = v77;
                      *((_OWORD *)v65 + 12) = v75;
                      *((_OWORD *)v65 + 13) = v76;
                      double v78 = v65 + 256;
                    }
                    long long v2 = v142;
                    v142[1] = v78;
                    uint64_t v112 = v143[v45 - 1];
                    double v113 = (uint64_t **)(a1 + 496);
                    while (1)
                    {
                      double v114 = *v113;
                      double v115 = v113;
                      if (!*v113) {
                        break;
                      }
                      while (1)
                      {
                        double v113 = (uint64_t **)v114;
                        unint64_t v116 = v114[4];
                        if (v42 < v116) {
                          break;
                        }
                        if (v116 >= v42)
                        {
                          double v117 = (uint64_t *)v113;
                          uint64_t v120 = v139;
                          uint64_t v123 = v141;
                          int v43 = v137;
                          goto LABEL_117;
                        }
                        double v114 = v113[1];
                        if (!v114)
                        {
                          double v115 = v113 + 1;
                          goto LABEL_91;
                        }
                      }
                    }
LABEL_91:
                    double v117 = (uint64_t *)operator new(0x30uLL);
                    v117[4] = v42;
                    v117[5] = 0;
                    *double v117 = 0;
                    v117[1] = 0;
                    v117[2] = (uint64_t)v113;
                    *double v115 = v117;
                    uint64_t v118 = **(void **)(a1 + 488);
                    double v119 = v117;
                    if (v118)
                    {
                      *(void *)(a1 + 488) = v118;
                      double v119 = *v115;
                    }
                    uint64_t v120 = v139;
                    double v121 = *v138;
                    BOOL v122 = v119 == *v138;
                    *((unsigned char *)v119 + 24) = v122;
                    uint64_t v123 = v141;
                    int v43 = v137;
                    if (!v122)
                    {
                      do
                      {
                        uint64_t v124 = v119[2];
                        if (*(unsigned char *)(v124 + 24)) {
                          break;
                        }
                        double v125 = *(uint64_t **)(v124 + 16);
                        uint64_t v126 = *v125;
                        if (*v125 == v124)
                        {
                          uint64_t v129 = v125[1];
                          if (!v129 || (int v130 = *(unsigned __int8 *)(v129 + 24), v127 = (unsigned char *)(v129 + 24), v130))
                          {
                            if (*(uint64_t **)v124 == v119)
                            {
                              *(unsigned char *)(v124 + 24) = 1;
                              *((unsigned char *)v125 + 24) = 0;
                              uint64_t v133 = *(void *)(v124 + 8);
                              *double v125 = v133;
                              if (v133) {
                                goto LABEL_108;
                              }
                            }
                            else
                            {
                              double v131 = *(uint64_t **)(v124 + 8);
                              uint64_t v132 = *v131;
                              *(void *)(v124 + 8) = *v131;
                              if (v132)
                              {
                                *(void *)(v132 + 16) = v124;
                                double v125 = *(uint64_t **)(v124 + 16);
                              }
                              v131[2] = (uint64_t)v125;
                              *(void *)(*(void *)(v124 + 16) + 8 * (**(void **)(v124 + 16) != v124)) = v131;
                              *double v131 = v124;
                              *(void *)(v124 + 16) = v131;
                              double v125 = (uint64_t *)v131[2];
                              uint64_t v124 = *v125;
                              *((unsigned char *)v131 + 24) = 1;
                              *((unsigned char *)v125 + 24) = 0;
                              uint64_t v133 = *(void *)(v124 + 8);
                              *double v125 = v133;
                              if (v133) {
LABEL_108:
                              }
                                *(void *)(v133 + 16) = v125;
                            }
                            *(void *)(v124 + 16) = v125[2];
                            *(void *)(v125[2] + 8 * (*(void *)v125[2] != (void)v125)) = v124;
                            *(void *)(v124 + 8) = v125;
LABEL_115:
                            v125[2] = v124;
                            break;
                          }
                        }
                        else if (!v126 || (int v128 = *(unsigned __int8 *)(v126 + 24), v127 = (unsigned char *)(v126 + 24), v128))
                        {
                          if (*(uint64_t **)v124 == v119)
                          {
                            uint64_t v135 = v119[1];
                            *(void *)uint64_t v124 = v135;
                            if (v135)
                            {
                              *(void *)(v135 + 16) = v124;
                              double v125 = *(uint64_t **)(v124 + 16);
                            }
                            v119[2] = (uint64_t)v125;
                            *(void *)(*(void *)(v124 + 16) + 8 * (**(void **)(v124 + 16) != v124)) = v119;
                            v119[1] = v124;
                            *(void *)(v124 + 16) = v119;
                            double v125 = (uint64_t *)v119[2];
                            *((unsigned char *)v119 + 24) = 1;
                            *((unsigned char *)v125 + 24) = 0;
                            uint64_t v124 = v125[1];
                            double v134 = *(uint64_t **)v124;
                            v125[1] = *(void *)v124;
                            if (v134) {
LABEL_113:
                            }
                              v134[2] = (uint64_t)v125;
                          }
                          else
                          {
                            *(unsigned char *)(v124 + 24) = 1;
                            *((unsigned char *)v125 + 24) = 0;
                            uint64_t v124 = v125[1];
                            double v134 = *(uint64_t **)v124;
                            v125[1] = *(void *)v124;
                            if (v134) {
                              goto LABEL_113;
                            }
                          }
                          *(void *)(v124 + 16) = v125[2];
                          *(void *)(v125[2] + 8 * (*(void *)v125[2] != (void)v125)) = v124;
                          *(void *)uint64_t v124 = v125;
                          goto LABEL_115;
                        }
                        *(unsigned char *)(v124 + 24) = 1;
                        double v119 = v125;
                        *((unsigned char *)v125 + 24) = v125 == v121;
                        unsigned char *v127 = 1;
                      }
                      while (v125 != v121);
                    }
                    ++*(void *)(a1 + 504);
                    long long v2 = v142;
LABEL_117:
                    v117[5] = v112 + v120;
                    ++v42;
                    ++*((void *)v145 + v45);
                    uint64_t v7 = v123 - 1;
                    int v3 = *(_DWORD *)(a1 + 24);
                    char v44 = 1;
                  }
                  else
                  {
                    *((void *)v144 + v45) = v61 + 1;
                    *((unsigned char *)v146 + v45) = 1;
                  }
                }
              }
            }
          }
          ++v45;
        }
        while (v45 < v3 - 1);
      }
      while ((v44 & 1) != 0);
      ++v43;
    }
    while (v7);
  }
  if (v143)
  {
    operator delete(v143);
  }
}

void sub_2194EC2D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
  {
    operator delete(__p);
    double v18 = *(void **)a15;
    if (!*(void *)a15) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    double v18 = *(void **)a15;
    if (!*(void *)a15) {
      goto LABEL_3;
    }
  }
  *(void *)(a15 + 8) = v18;
  operator delete(v18);
  _Unwind_Resume(exception_object);
}

void sub_2194EC32C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v135 = *MEMORY[0x263EF8340];
  unint64_t v108 = *(void *)(a1 + 48);
  unint64_t v118 = *(void *)(a1 + 40);
  unint64_t v116 = *(void *)(a1 + 32);
  unint64_t v106 = (v116 & 0xFFFFFFFFFFFFFFE0) + 96;
  unint64_t v3 = v106 * v118;
  uint64_t v4 = *(char **)(a2 + 152);
  uint64_t v5 = *(char **)(a2 + 160);
  unint64_t v6 = (void *)(a2 + 152);
  unint64_t v7 = (v5 - v4) >> 2;
  if (v106 * v118 <= v7)
  {
    if (v3 < v7)
    {
      uint64_t v5 = &v4[4 * v3];
      *(void *)(a2 + 160) = v5;
    }
  }
  else
  {
    sub_219488D70((uint64_t)v6, v106 * v118 - v7);
    uint64_t v4 = *(char **)(v2 + 152);
    uint64_t v5 = *(char **)(v2 + 160);
  }
  uint64_t v8 = v5 - v4;
  if (v8 >= 1) {
    bzero(v4, 4 * (((unint64_t)v8 >> 2) - ((unint64_t)v8 > 3)) + 4);
  }
  int32x4_t v126 = 0u;
  int32x4_t v127 = 0u;
  int32x4_t v124 = 0u;
  int32x4_t v125 = 0u;
  memset(v123, 0, sizeof(v123));
  memset(v122, 0, sizeof(v122));
  memset(v121, 0, sizeof(v121));
  uint64_t v9 = *(void *)(v2 + 176);
  uint64_t v10 = *(void *)(v2 + 184);
  int v11 = (void **)(v2 + 176);
  unint64_t v12 = 0x8F5C28F5C28F5C29 * ((v10 - v9) >> 3);
  if (32 * v118 <= v12)
  {
    if (32 * v118 < v12)
    {
      uint64_t v10 = v9 + 6400 * v118;
      *(void *)(v2 + 184) = v10;
    }
  }
  else
  {
    sub_2194D0D58((void **)(v2 + 176), 32 * v118 - v12);
    uint64_t v9 = *(void *)(v2 + 176);
    uint64_t v10 = *(void *)(v2 + 184);
  }
  memset(&v134[12], 0, 72);
  uint64_t v13 = v10 - v9;
  if (v13 >= 1)
  {
    unint64_t v14 = v13 / 0xC8uLL + 1;
    uint64_t v15 = v9 + 20;
    do
    {
      *(_DWORD *)(v15 - 4) = 0x3FFF;
      long long v16 = __dst;
      long long v17 = v129;
      long long v18 = v131;
      *(_OWORD *)(v15 + 32) = v130;
      *(_OWORD *)(v15 + 48) = v18;
      *(_OWORD *)uint64_t v15 = v16;
      *(_OWORD *)(v15 + 16) = v17;
      long long v19 = v132;
      long long v20 = v133;
      long long v21 = *(_OWORD *)&v134[16];
      *(_OWORD *)(v15 + 96) = *(_OWORD *)v134;
      *(_OWORD *)(v15 + 112) = v21;
      *(_OWORD *)(v15 + 64) = v19;
      *(_OWORD *)(v15 + 80) = v20;
      long long v22 = *(_OWORD *)&v134[32];
      long long v23 = *(_OWORD *)&v134[48];
      long long v24 = *(_OWORD *)&v134[64];
      *(_DWORD *)(v15 + 176) = *(_DWORD *)&v134[80];
      *(_OWORD *)(v15 + 144) = v23;
      *(_OWORD *)(v15 + 160) = v24;
      *(_OWORD *)(v15 + 128) = v22;
      --v14;
      v15 += 200;
    }
    while (v14 > 1);
  }
  sub_2194EB968(a1, (char **)__p);
  sub_21948CFDC(v2 + 8, *(void **)(v2 + 16));
  *(void *)(v2 + 8) = v2 + 16;
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  double v113 = (uint64_t **)(v2 + 16);
  uint64_t v25 = *(void *)(v2 + 88) - *(void *)(v2 + 80);
  if (!v25)
  {
    unint64_t v26 = 0;
    goto LABEL_76;
  }
  long long v109 = (void **)(v2 + 8);
  uint64_t v110 = v2;
  unint64_t v26 = 0;
  char v27 = 0;
  unint64_t v28 = 0;
  uint64_t v29 = v116 >> 5;
  unint64_t v30 = v25 >> 8;
  uint64_t v31 = a1;
  unint64_t v32 = (char *)__p[0];
  uint64_t v112 = (void **)(v2 + 176);
  unint64_t v117 = v116 >> 5;
  if (v116 >> 5 <= 1) {
    uint64_t v29 = 1;
  }
  uint64_t __n = 4 * v29;
  if (v30 <= 1) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = v30;
  }
  unint64_t v114 = v29;
  double v115 = v6;
  uint64_t v105 = v29 & 0x7FFFFFFFFFFFFF8;
  uint64_t v111 = v33;
  do
  {
    while (1)
    {
      uint64_t v34 = &v32[256 * v28];
      int v35 = *(unsigned __int16 *)v34;
      int v36 = *((_DWORD *)v34 + 1);
      unsigned int v37 = v34[12];
      int v38 = *((_DWORD *)v34 + 4);
      int v39 = *((_DWORD *)v34 + 5);
      int v40 = v34[24];
      uint64_t v41 = (v37 >> 5) | (8 * v40);
      uint64_t v42 = v124.u32[v41];
      if (v42) {
        break;
      }
      if (!(v27 & 1 | (v26 >= v118)))
      {
        unint64_t v44 = v123[v41];
        if (v108 > v44)
        {
          uint64_t v45 = 4 * v41;
          unsigned int v43 = v26 * v106;
          *(_DWORD *)((char *)v122 + v45) = v26 * v106;
          *(_DWORD *)((char *)v121 + v45) = 32 * v26++;
          v123[(unint64_t)v45 / 4] = v44 + 1;
          goto LABEL_30;
        }
      }
LABEL_21:
      char v27 = 1;
      if (++v28 == v33) {
        goto LABEL_69;
      }
    }
    if (v27) {
      goto LABEL_21;
    }
    unsigned int v43 = *((_DWORD *)v122 + v41);
LABEL_30:
    int v46 = v35 | (v36 << 16);
    int v47 = ((v39 & 7) << 28) | ((v38 & 0x3FFF) << 8);
    unsigned int v48 = v43 + 2 * v42;
    uint64_t v49 = *v115;
    *(_DWORD *)(*v115 + 4 * v48) = v46;
    *(_DWORD *)(v49 + 4 * (v48 + 1)) = v47 | (v40 << 31) | v37;
    if (v117 == 16 && !*(unsigned char *)(v31 + 57))
    {
      int v50 = (long long *)(v34 + 128);
      if (v116 <= 0x1F) {
        goto LABEL_33;
      }
LABEL_35:
      unint64_t v51 = v117 * v42;
      if (v114 >= 0xC && (uint64_t v52 = v49 + 4 * (v51 + v43), (unint64_t)(v52 - (void)v50 + 384) >= 0x20))
      {
        double v78 = v50 + 1;
        double v79 = (_OWORD *)(v52 + 400);
        uint64_t v80 = v105;
        do
        {
          long long v81 = *v78;
          *(v79 - 1) = *(v78 - 1);
          *double v79 = v81;
          v78 += 2;
          v79 += 2;
          v80 -= 8;
        }
        while (v80);
        uint64_t v53 = v105;
        if (v114 == v105) {
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v53 = 0;
      }
      unint64_t v54 = v114 - v53;
      int v55 = (_DWORD *)(v49 + 4 * (v53 + v51 + v43) + 384);
      uint64_t v56 = (int *)v50 + v53;
      do
      {
        int v57 = *v56++;
        *v55++ = v57;
        --v54;
      }
      while (v54);
LABEL_40:
      *(_DWORD *)(v49 + 4 * (v42 + v43 + 64)) = 0;
      long long v130 = 0u;
      long long v131 = 0u;
      long long __dst = 0u;
      long long v129 = 0u;
      memcpy(&__dst, v50, __n);
      goto LABEL_41;
    }
    int v50 = (long long *)(v34 + 192);
    if (v116 > 0x1F) {
      goto LABEL_35;
    }
LABEL_33:
    *(_DWORD *)(v49 + 4 * (v42 + v43 + 64)) = 0;
    long long v130 = 0u;
    long long v131 = 0u;
    long long __dst = 0u;
    long long v129 = 0u;
LABEL_41:
    int v58 = *((_DWORD *)v121 + v41);
    uint64_t v59 = (uint64_t **)(a1 + 496);
    while (1)
    {
      double v60 = *v59;
      unint64_t v61 = v59;
      if (!*v59) {
        break;
      }
      while (1)
      {
        uint64_t v59 = (uint64_t **)v60;
        unint64_t v62 = v60[4];
        if (v28 < v62) {
          break;
        }
        if (v62 >= v28)
        {
          double v63 = (uint64_t *)v59;
          goto LABEL_51;
        }
        double v60 = v59[1];
        if (!v60)
        {
          unint64_t v61 = v59 + 1;
          goto LABEL_47;
        }
      }
    }
LABEL_47:
    double v63 = (uint64_t *)operator new(0x30uLL);
    v63[4] = v28;
    v63[5] = 0;
    *double v63 = 0;
    v63[1] = 0;
    v63[2] = (uint64_t)v59;
    *unint64_t v61 = v63;
    uint64_t v64 = **(void **)(a1 + 488);
    double v65 = v63;
    if (v64)
    {
      *(void *)(a1 + 488) = v64;
      double v65 = *v61;
    }
    sub_21948D030(*(uint64_t **)(a1 + 496), v65);
    ++*(void *)(a1 + 504);
LABEL_51:
    long long v66 = v113;
    long long v67 = *v113;
    unint64_t v68 = v63[5];
LABEL_53:
    long long v69 = v66;
    if (v67)
    {
      while (1)
      {
        long long v66 = (uint64_t **)v67;
        unint64_t v70 = v67[4];
        if (v68 < v70)
        {
          long long v67 = *v66;
          goto LABEL_53;
        }
        if (v70 >= v68) {
          break;
        }
        long long v67 = v66[1];
        if (!v67)
        {
          long long v69 = v66 + 1;
          goto LABEL_58;
        }
      }
      long long v71 = (uint64_t *)v66;
    }
    else
    {
LABEL_58:
      long long v71 = (uint64_t *)operator new(0x30uLL);
      v71[4] = v68;
      v71[5] = 0;
      *long long v71 = 0;
      v71[1] = 0;
      v71[2] = (uint64_t)v66;
      *long long v69 = v71;
      long long v72 = (void *)**v109;
      long long v73 = v71;
      if (v72)
      {
        *long long v109 = v72;
        long long v73 = *v69;
      }
      sub_21948D030(*(uint64_t **)(v110 + 16), v73);
      ++*(void *)(v110 + 24);
    }
    int v11 = v112;
    uint64_t v74 = (v58 + v42);
    v71[5] = v74;
    unint64_t v32 = (char *)__p[0];
    uint64_t v75 = (uint64_t)*v112 + 200 * v74;
    memmove((void *)v75, (char *)__p[0] + 256 * v28, 0x80uLL);
    *(_DWORD *)(v75 + 128) = 0;
    long long v76 = v129;
    *(_OWORD *)(v75 + 132) = __dst;
    *(_OWORD *)(v75 + 148) = v76;
    long long v77 = v131;
    *(_OWORD *)(v75 + 164) = v130;
    *(_OWORD *)(v75 + 180) = v77;
    *(_DWORD *)(v75 + 196) = 0;
    v124.i32[v41] = v42 + 1;
    uint64_t v31 = a1;
    uint64_t v33 = v111;
    if (v42 == 31)
    {
      if (v26 > v118)
      {
        sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointToDescriptor.cpp", 408, "set_count <= max_num_sets", (void (*)(void *))sub_2194FF9C0);
        abort();
      }
      v124.i32[v41] = 0;
    }
    char v27 = 0;
    ++v28;
  }
  while (v28 != v111);
LABEL_69:
  if (v26 > v118)
  {
    uint64_t v2 = v110;
    unint64_t v6 = v115;
    if (vmaxvq_u8((uint8x16_t)vmvnq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_s32(v124), (int16x8_t)vceqzq_s32(v125)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_s32(v126), (int16x8_t)vceqzq_s32(v127))))))
    {
      sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointToDescriptor.cpp", 416, "set_count <= max_num_sets", (void (*)(void *))sub_2194FF9C0);
      abort();
    }
    goto LABEL_71;
  }
  uint64_t v2 = v110;
  unint64_t v6 = v115;
LABEL_76:
  for (uint64_t i = 0; i != 16; ++i)
  {
    __int32 v86 = v124.i32[i];
    if (v86)
    {
      uint64_t v87 = *v6;
      unsigned int v88 = *(_DWORD *)((char *)v122 + i * 4) + 2 * v86;
      *(_DWORD *)(*v6 + 4 * v88) = -1;
      *(_DWORD *)(v87 + 4 * (v88 + 1)) = -1;
      int v89 = *(_DWORD *)((char *)v121 + i * 4);
      memset(&v134[12], 0, 72);
      uint64_t v90 = (uint64_t)*v11 + 200 * (v89 + v86);
      long long v91 = v130;
      *(_OWORD *)(v90 + 68) = v131;
      *(_OWORD *)(v90 + 52) = v91;
      long long v92 = __dst;
      *(_OWORD *)(v90 + 36) = v129;
      *(_OWORD *)(v90 + 20) = v92;
      long long v93 = *(_OWORD *)v134;
      *(_OWORD *)(v90 + 132) = *(_OWORD *)&v134[16];
      *(_OWORD *)(v90 + 116) = v93;
      long long v94 = v132;
      *(_OWORD *)(v90 + 100) = v133;
      *(_OWORD *)(v90 + 84) = v94;
      *(_OWORD *)(v90 + 180) = *(_OWORD *)&v134[64];
      long long v95 = *(_OWORD *)&v134[32];
      *(_OWORD *)(v90 + 164) = *(_OWORD *)&v134[48];
      *(_DWORD *)(v90 + 16) = 0x3FFF;
      *(_DWORD *)(v90 + 196) = *(_DWORD *)&v134[80];
      *(_OWORD *)(v90 + 148) = v95;
    }
  }
LABEL_71:
  if (v26 < v118)
  {
    uint64_t v82 = *(void *)(v2 + 152);
    *(void *)(v82 + 4 * v26 * v106) = -1;
    unint64_t v83 = (v26 * v106) | 2;
    unint64_t v84 = (*(void *)(v2 + 160) - v82) >> 2;
    if (v83 <= v84)
    {
      if (v83 < v84) {
        *(void *)(v2 + 160) = v82 + 4 * v83;
      }
    }
    else
    {
      sub_219488D70((uint64_t)v6, v83 - v84);
    }
    memset(&v134[12], 0, 72);
    uint64_t v96 = *(void *)(v2 + 176) + 6400 * v26;
    long long v97 = v130;
    *(_OWORD *)(v96 + 68) = v131;
    *(_OWORD *)(v96 + 52) = v97;
    long long v98 = __dst;
    *(_OWORD *)(v96 + 36) = v129;
    *(_OWORD *)(v96 + 20) = v98;
    long long v99 = *(_OWORD *)v134;
    *(_OWORD *)(v96 + 132) = *(_OWORD *)&v134[16];
    *(_OWORD *)(v96 + 116) = v99;
    long long v100 = v132;
    *(_OWORD *)(v96 + 100) = v133;
    *(_OWORD *)(v96 + 84) = v100;
    *(_OWORD *)(v96 + 180) = *(_OWORD *)&v134[64];
    long long v101 = *(_OWORD *)&v134[32];
    *(_OWORD *)(v96 + 164) = *(_OWORD *)&v134[48];
    *(_DWORD *)(v96 + 16) = 0x3FFF;
    *(_DWORD *)(v96 + 196) = *(_DWORD *)&v134[80];
    *(_OWORD *)(v96 + 148) = v101;
    unint64_t v102 = (32 * v26) | 1;
    uint64_t v103 = *(void *)(v2 + 176);
    unint64_t v104 = 0x8F5C28F5C28F5C29 * ((*(void *)(v2 + 184) - v103) >> 3);
    if (v102 <= v104)
    {
      if (v102 < v104) {
        *(void *)(v2 + 184) = v103 + 200 * v102;
      }
    }
    else
    {
      sub_2194D0D58(v11, v102 - v104);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_2194ECC14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  if (!__p) {
    _Unwind_Resume(exception_object);
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_2194ECC4C(uint64_t a1, uint64_t a2, signed int a3, int a4, uint64_t a5, uint64_t a6, int32x2_t *a7, double a8, double a9)
{
  int v9 = a4 >> 4;
  signed int v10 = *(_DWORD *)(a1 + 24) - 1;
  if (a4 >> 4 >= a3)
  {
    if (v10 >= a3) {
      int v14 = a3;
    }
    else {
      int v14 = *(_DWORD *)(a1 + 24) - 1;
    }
    a7->i32[0] = v14;
    int32x2_t v11 = (int32x2_t)0x300000002;
    int v13 = a3 + 1;
    int v12 = 4;
  }
  else
  {
    a7->i32[0] = a3;
    int32x2_t v11 = (int32x2_t)0x200000001;
    int v12 = 3;
    int v13 = a3;
  }
  uint64_t v15 = 0;
  if (v10 < v13) {
    int v13 = v10;
  }
  a7->i32[1] = v13;
  a7[1] = vmin_s32(vdup_n_s32(v10), vadd_s32(v11, vdup_n_s32(a3)));
  signed int v16 = v12 + a3;
  if (v10 >= v16) {
    signed int v10 = v16;
  }
  a7[2].i32[0] = v10;
  uint64_t v17 = a1 + 704;
  uint64_t v18 = a1 + 512;
  uint64_t v19 = a1 + 608;
  char v20 = 16 * v9;
  long long v21 = (double *)(a6 + 24);
  uint64_t v22 = *(void *)(a2 + 48);
  long long v23 = (double *)(a5 + 24);
  uint64_t result = 1;
  char v25 = 1;
  do
  {
    int v26 = a7->i32[v15];
    double v27 = *(double *)(v17 + 8 * (v20 & 0x10 | a4 & 0xFu));
    v25 ^= 1u;
    int v28 = 1 << (v26 >> 1);
    double v29 = floor(a8 / (double)v28 * 128.0 + 0.5) * 0.0078125;
    double v30 = (double)(1 << (((v9 + (int)v15) >> 1) - (v26 >> 1) + 1));
    double v31 = floor(a9 / (double)v28 * 128.0 + 0.5) * 0.0078125;
    double v32 = floor(v29 - v27 * v30);
    uint64_t v33 = v22 + 144 * v26;
    double v34 = ceil(v29 + v27 * v30);
    double v35 = (double)(unint64_t)(*(void *)(v33 + 32) - 1);
    double v36 = floor(v31 - v27 * v30);
    double v37 = (double)(unint64_t)(*(void *)(v33 + 48) - 1);
    if (v32 < 0.0) {
      double v32 = 0.0;
    }
    double v38 = ceil(v31 + v27 * v30);
    uint64_t v39 = (16 * (v25 & 1)) & 0xDF | (32 * (v25 & 1));
    int v40 = (double *)(v18 + v39);
    uint64_t v41 = (double *)(v19 + v39);
    double v42 = floor(v27 * *v40 * v30 * 128.0 + 0.5);
    if (v34 > v35) {
      double v34 = v35;
    }
    *(v23 - 3) = v42 * 0.0078125;
    *(v21 - 3) = floor(v27 * *v41 * v30 * 128.0 + 0.5) * 0.0078125;
    if (v36 >= 0.0) {
      double v43 = v36;
    }
    else {
      double v43 = 0.0;
    }
    *(v23 - 3) = floor((v29 + *(v23 - 3)) * 64.0 + 0.5) * 0.015625;
    if (v38 <= v37) {
      double v44 = v38;
    }
    else {
      double v44 = v37;
    }
    *(v21 - 3) = floor((v31 + *(v21 - 3)) * 64.0 + 0.5) * 0.015625;
    double v45 = *(v23 - 3);
    if (v45 >= v32) {
      double v46 = *(v23 - 3);
    }
    else {
      double v46 = v32;
    }
    if (v45 <= v34) {
      double v47 = v46;
    }
    else {
      double v47 = v34;
    }
    *(v23 - 3) = v47;
    double v48 = *(v21 - 3);
    if (v48 >= v43) {
      double v49 = *(v21 - 3);
    }
    else {
      double v49 = v43;
    }
    if (v48 <= v44) {
      double v50 = v49;
    }
    else {
      double v50 = v44;
    }
    *(v21 - 3) = v50;
    *(v23 - 2) = floor(v27 * v40[1] * v30 * 128.0 + 0.5) * 0.0078125;
    *(v21 - 2) = floor(v27 * v41[1] * v30 * 128.0 + 0.5) * 0.0078125;
    *(v23 - 2) = floor((v29 + *(v23 - 2)) * 64.0 + 0.5) * 0.015625;
    *(v21 - 2) = floor((v31 + *(v21 - 2)) * 64.0 + 0.5) * 0.015625;
    double v51 = *(v23 - 2);
    if (v51 >= v32) {
      double v52 = *(v23 - 2);
    }
    else {
      double v52 = v32;
    }
    if (v51 <= v34) {
      double v53 = v52;
    }
    else {
      double v53 = v34;
    }
    *(v23 - 2) = v53;
    double v54 = *(v21 - 2);
    if (v54 >= v43) {
      double v55 = *(v21 - 2);
    }
    else {
      double v55 = v43;
    }
    if (v54 <= v44) {
      double v56 = v55;
    }
    else {
      double v56 = v44;
    }
    *(v21 - 2) = v56;
    *(v23 - 1) = floor(v27 * v40[2] * v30 * 128.0 + 0.5) * 0.0078125;
    *(v21 - 1) = floor(v27 * v41[2] * v30 * 128.0 + 0.5) * 0.0078125;
    *(v23 - 1) = floor((v29 + *(v23 - 1)) * 64.0 + 0.5) * 0.015625;
    *(v21 - 1) = floor((v31 + *(v21 - 1)) * 64.0 + 0.5) * 0.015625;
    double v57 = *(v23 - 1);
    if (v57 >= v32) {
      double v58 = *(v23 - 1);
    }
    else {
      double v58 = v32;
    }
    if (v57 <= v34) {
      double v59 = v58;
    }
    else {
      double v59 = v34;
    }
    *(v23 - 1) = v59;
    double v60 = *(v21 - 1);
    if (v60 >= v43) {
      double v61 = *(v21 - 1);
    }
    else {
      double v61 = v43;
    }
    if (v60 <= v44) {
      double v62 = v61;
    }
    else {
      double v62 = v44;
    }
    *(v21 - 1) = v62;
    *long long v23 = floor(v27 * v40[3] * v30 * 128.0 + 0.5) * 0.0078125;
    *long long v21 = floor(v27 * v41[3] * v30 * 128.0 + 0.5) * 0.0078125;
    *long long v23 = floor((v29 + *v23) * 64.0 + 0.5) * 0.015625;
    *long long v21 = floor((v31 + *v21) * 64.0 + 0.5) * 0.015625;
    if (*v23 >= v32) {
      double v63 = *v23;
    }
    else {
      double v63 = v32;
    }
    if (*v23 <= v34) {
      double v64 = v63;
    }
    else {
      double v64 = v34;
    }
    *long long v23 = v64;
    if (*v21 >= v43) {
      double v65 = *v21;
    }
    else {
      double v65 = v43;
    }
    if (*v21 <= v44) {
      double v66 = v65;
    }
    else {
      double v66 = v44;
    }
    *long long v21 = v66;
    v23[1] = floor(v27 * v40[4] * v30 * 128.0 + 0.5) * 0.0078125;
    v21[1] = floor(v27 * v41[4] * v30 * 128.0 + 0.5) * 0.0078125;
    v23[1] = floor((v29 + v23[1]) * 64.0 + 0.5) * 0.015625;
    v21[1] = floor((v31 + v21[1]) * 64.0 + 0.5) * 0.015625;
    double v67 = v23[1];
    if (v67 >= v32) {
      double v68 = v23[1];
    }
    else {
      double v68 = v32;
    }
    if (v67 <= v34) {
      double v69 = v68;
    }
    else {
      double v69 = v34;
    }
    v23[1] = v69;
    double v70 = v21[1];
    if (v70 >= v43) {
      double v71 = v21[1];
    }
    else {
      double v71 = v43;
    }
    if (v70 <= v44) {
      double v72 = v71;
    }
    else {
      double v72 = v44;
    }
    v21[1] = v72;
    v23[2] = floor(v27 * v40[5] * v30 * 128.0 + 0.5) * 0.0078125;
    v21[2] = floor(v27 * v41[5] * v30 * 128.0 + 0.5) * 0.0078125;
    v23[2] = floor((v29 + v23[2]) * 64.0 + 0.5) * 0.015625;
    v21[2] = floor((v31 + v21[2]) * 64.0 + 0.5) * 0.015625;
    double v73 = v23[2];
    if (v73 >= v32) {
      double v74 = v23[2];
    }
    else {
      double v74 = v32;
    }
    if (v73 <= v34) {
      double v75 = v74;
    }
    else {
      double v75 = v34;
    }
    v23[2] = v75;
    double v76 = v21[2];
    if (v76 >= v43) {
      double v77 = v21[2];
    }
    else {
      double v77 = v43;
    }
    ++v15;
    if (v76 <= v44) {
      double v78 = v77;
    }
    else {
      double v78 = v44;
    }
    v21[2] = v78;
    v20 += 16;
    v21 += 6;
    v23 += 6;
  }
  while (v15 != 5);
  return result;
}

uint64_t sub_2194ED1A0(uint64_t a1, uint64_t a2, signed int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, double *a8, double a9, double a10, double *a11)
{
  int v11 = a4 >> 4;
  signed int v12 = *(_DWORD *)(a1 + 24) - 1;
  if (a4 >> 4 >= a3)
  {
    if (v12 >= a3) {
      int v16 = a3;
    }
    else {
      int v16 = *(_DWORD *)(a1 + 24) - 1;
    }
    *(_DWORD *)a7 = v16;
    int32x4_t v13 = (int32x4_t)xmmword_21950DE60;
    int v15 = a3 + 1;
    int v14 = 6;
  }
  else
  {
    *(_DWORD *)a7 = a3;
    int32x4_t v13 = (int32x4_t)xmmword_21950D660;
    int v14 = 5;
    int v15 = a3;
  }
  uint64_t v17 = 0;
  if (v12 < v15) {
    int v15 = v12;
  }
  *(_DWORD *)(a7 + 4) = v15;
  *(int32x4_t *)(a7 + 8) = vminq_s32(vdupq_n_s32(v12), vaddq_s32(v13, vdupq_n_s32(a3)));
  signed int v18 = v14 + a3;
  if (v12 >= v18) {
    signed int v12 = v18;
  }
  *(_DWORD *)(a7 + 24) = v12;
  uint64_t v19 = a1 + 704;
  uint64_t v20 = *(void *)(a2 + 48);
  uint64_t v21 = a1 + 608;
  uint64_t result = 0x3F80000000000000;
  do
  {
    uint64_t v23 = 0;
    uint64_t v24 = v21 + 48 * (v17 & 1);
    int v25 = *(_DWORD *)(a7 + 4 * v17);
    double v26 = *(double *)(v19 + 8 * (a4 & 0xF | (16 * (v11 & 1u))));
    double v27 = (double)(1 << (v25 >> 1));
    double v28 = floor(a9 / v27 * 128.0 + 0.5) * 0.0078125;
    double v29 = floor(a10 / v27 * 128.0 + 0.5) * 0.0078125;
    double v30 = (double)(1 << ((v11 >> 1) - (v25 >> 1) + 1));
    double v31 = floor(v28 - v26 * v30);
    if (v31 < 0.0) {
      double v31 = 0.0;
    }
    double v32 = ceil(v28 + v26 * v30);
    uint64_t v33 = v20 + 144 * v25;
    uint64_t v34 = *(void *)(v33 + 32) - 1;
    if (v32 > (double)(unint64_t)v34) {
      double v32 = (double)(unint64_t)v34;
    }
    double v35 = floor(v29 - v26 * v30);
    if (v35 < 0.0) {
      double v35 = 0.0;
    }
    double v36 = ceil(v29 + v26 * v30);
    uint64_t v37 = *(void *)(v33 + 48) - 1;
    if (v36 > (double)(unint64_t)v37) {
      double v36 = (double)(unint64_t)v37;
    }
    do
    {
      *(double *)(a5 + v23) = floor((v28+ floor((floor(v26 * *(double *)(v24 + v23 - 96) * *a8 * v30 * 128.0 + 0.5) * 0.0078125- floor(v26 * *(double *)(v24 + v23) * *a11 * v30 * 128.0 + 0.5) * 0.0078125)* 128.0+ 0.5)* 0.0078125)* 64.0+ 0.5)* 0.015625;
      *(double *)(a6 + v23) = floor((v29+ floor((floor(v26 * *(double *)(v24 + v23 - 96) * *a11 * v30 * 128.0 + 0.5) * 0.0078125+ floor(v26 * *(double *)(v24 + v23) * *a8 * v30 * 128.0 + 0.5) * 0.0078125)* 128.0+ 0.5)* 0.0078125)* 64.0+ 0.5)* 0.015625;
      double v38 = *(double *)(a5 + v23);
      if (v38 >= v31) {
        double v39 = *(double *)(a5 + v23);
      }
      else {
        double v39 = v31;
      }
      if (v38 <= v32) {
        double v40 = v39;
      }
      else {
        double v40 = v32;
      }
      *(double *)(a5 + v23) = v40;
      double v41 = *(double *)(a6 + v23);
      if (v41 >= v35) {
        double v42 = *(double *)(a6 + v23);
      }
      else {
        double v42 = v35;
      }
      if (v41 <= v36) {
        double v43 = v42;
      }
      else {
        double v43 = v36;
      }
      *(double *)(a6 + v23) = v43;
      v23 += 8;
    }
    while (v23 != 48);
    ++v11;
    ++v17;
    a6 += 48;
    a5 += 48;
  }
  while (v17 != 7);
  return result;
}

void sub_2194ED460(uint64_t a1, _OWORD *a2, long long *a3, uint64_t a4)
{
  unint64_t v7 = (char **)(*(void *)(a1 + 48) + 24 * a4);
  int v9 = v7 + 1;
  uint64_t v8 = v7[1];
  unint64_t v10 = (unint64_t)v7[2];
  if ((unint64_t)v8 >= v10)
  {
    uint64_t v91 = a4;
    uint64_t v23 = *v7;
    unint64_t v24 = 0xEEEEEEEEEEEEEEEFLL * ((v8 - *v7) >> 4);
    unint64_t v25 = v24 + 1;
    if (v24 + 1 > 0x111111111111111) {
      sub_219486AE4();
    }
    unint64_t v26 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v10 - (void)v23) >> 4);
    if (2 * v26 > v25) {
      unint64_t v25 = 2 * v26;
    }
    if (v26 >= 0x88888888888888) {
      unint64_t v27 = 0x111111111111111;
    }
    else {
      unint64_t v27 = v25;
    }
    if (v27)
    {
      if (v27 > 0x111111111111111) {
        goto LABEL_37;
      }
      double v28 = (char *)operator new(240 * v27);
    }
    else
    {
      double v28 = 0;
    }
    long long v29 = a2[13];
    double v30 = &v28[240 * v24];
    *((_OWORD *)v30 + 12) = a2[12];
    *((_OWORD *)v30 + 13) = v29;
    *((_OWORD *)v30 + 14) = a2[14];
    long long v31 = a2[9];
    *((_OWORD *)v30 + 8) = a2[8];
    *((_OWORD *)v30 + 9) = v31;
    long long v32 = a2[11];
    *((_OWORD *)v30 + 10) = a2[10];
    *((_OWORD *)v30 + 11) = v32;
    long long v33 = a2[5];
    *((_OWORD *)v30 + 4) = a2[4];
    *((_OWORD *)v30 + 5) = v33;
    long long v34 = a2[7];
    *((_OWORD *)v30 + 6) = a2[6];
    *((_OWORD *)v30 + 7) = v34;
    long long v35 = a2[1];
    *(_OWORD *)double v30 = *a2;
    *((_OWORD *)v30 + 1) = v35;
    long long v37 = a2[2];
    long long v36 = a2[3];
    uint64_t v22 = v30 + 240;
    *((_OWORD *)v30 + 2) = v37;
    *((_OWORD *)v30 + 3) = v36;
    if (v8 != v23)
    {
      do
      {
        long long v38 = *((_OWORD *)v8 - 15);
        long long v39 = *((_OWORD *)v8 - 13);
        *((_OWORD *)v30 - 14) = *((_OWORD *)v8 - 14);
        *((_OWORD *)v30 - 13) = v39;
        *((_OWORD *)v30 - 15) = v38;
        long long v40 = *((_OWORD *)v8 - 12);
        long long v41 = *((_OWORD *)v8 - 11);
        long long v42 = *((_OWORD *)v8 - 9);
        *((_OWORD *)v30 - 10) = *((_OWORD *)v8 - 10);
        *((_OWORD *)v30 - 9) = v42;
        *((_OWORD *)v30 - 12) = v40;
        *((_OWORD *)v30 - 11) = v41;
        long long v43 = *((_OWORD *)v8 - 8);
        long long v44 = *((_OWORD *)v8 - 7);
        long long v45 = *((_OWORD *)v8 - 5);
        *((_OWORD *)v30 - 6) = *((_OWORD *)v8 - 6);
        *((_OWORD *)v30 - 5) = v45;
        *((_OWORD *)v30 - 8) = v43;
        *((_OWORD *)v30 - 7) = v44;
        long long v46 = *((_OWORD *)v8 - 4);
        long long v47 = *((_OWORD *)v8 - 3);
        long long v48 = *((_OWORD *)v8 - 1);
        *((_OWORD *)v30 - 2) = *((_OWORD *)v8 - 2);
        *((_OWORD *)v30 - 1) = v48;
        *((_OWORD *)v30 - 4) = v46;
        *((_OWORD *)v30 - 3) = v47;
        v30 -= 240;
        v8 -= 240;
      }
      while (v8 != v23);
      uint64_t v8 = *v7;
    }
    void *v7 = v30;
    void *v9 = v22;
    v7[2] = &v28[240 * v27];
    if (v8) {
      operator delete(v8);
    }
    a4 = v91;
  }
  else
  {
    long long v11 = *a2;
    long long v12 = a2[2];
    *((_OWORD *)v8 + 1) = a2[1];
    *((_OWORD *)v8 + 2) = v12;
    *(_OWORD *)uint64_t v8 = v11;
    long long v13 = a2[3];
    long long v14 = a2[4];
    long long v15 = a2[6];
    *((_OWORD *)v8 + 5) = a2[5];
    *((_OWORD *)v8 + 6) = v15;
    *((_OWORD *)v8 + 3) = v13;
    *((_OWORD *)v8 + 4) = v14;
    long long v16 = a2[7];
    long long v17 = a2[8];
    long long v18 = a2[10];
    *((_OWORD *)v8 + 9) = a2[9];
    *((_OWORD *)v8 + 10) = v18;
    *((_OWORD *)v8 + 7) = v16;
    *((_OWORD *)v8 + 8) = v17;
    long long v19 = a2[11];
    long long v20 = a2[12];
    long long v21 = a2[14];
    *((_OWORD *)v8 + 13) = a2[13];
    *((_OWORD *)v8 + 14) = v21;
    *((_OWORD *)v8 + 11) = v19;
    *((_OWORD *)v8 + 12) = v20;
    uint64_t v22 = v8 + 240;
  }
  void *v9 = v22;
  double v49 = (char **)(*(void *)(a1 + 72) + 24 * a4);
  double v51 = v49 + 1;
  double v50 = v49[1];
  unint64_t v52 = (unint64_t)v49[2];
  if ((unint64_t)v50 < v52)
  {
    long long v53 = *a3;
    long long v54 = a3[2];
    *((_OWORD *)v50 + 1) = a3[1];
    *((_OWORD *)v50 + 2) = v54;
    *(_OWORD *)double v50 = v53;
    long long v55 = a3[3];
    long long v56 = a3[4];
    long long v57 = a3[6];
    *((_OWORD *)v50 + 5) = a3[5];
    *((_OWORD *)v50 + 6) = v57;
    *((_OWORD *)v50 + 3) = v55;
    *((_OWORD *)v50 + 4) = v56;
    long long v58 = a3[7];
    long long v59 = a3[8];
    long long v60 = a3[10];
    *((_OWORD *)v50 + 9) = a3[9];
    *((_OWORD *)v50 + 10) = v60;
    *((_OWORD *)v50 + 7) = v58;
    *((_OWORD *)v50 + 8) = v59;
    long long v61 = a3[11];
    long long v62 = a3[12];
    long long v63 = a3[14];
    *((_OWORD *)v50 + 13) = a3[13];
    *((_OWORD *)v50 + 14) = v63;
    *((_OWORD *)v50 + 11) = v61;
    *((_OWORD *)v50 + 12) = v62;
    double v64 = v50 + 240;
    goto LABEL_36;
  }
  double v65 = *v49;
  unint64_t v66 = 0xEEEEEEEEEEEEEEEFLL * ((v50 - *v49) >> 4);
  unint64_t v67 = v66 + 1;
  if (v66 + 1 > 0x111111111111111) {
    sub_219486AE4();
  }
  unint64_t v68 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v52 - (void)v65) >> 4);
  if (2 * v68 > v67) {
    unint64_t v67 = 2 * v68;
  }
  if (v68 >= 0x88888888888888) {
    unint64_t v69 = 0x111111111111111;
  }
  else {
    unint64_t v69 = v67;
  }
  if (!v69)
  {
    double v70 = 0;
    goto LABEL_31;
  }
  if (v69 > 0x111111111111111) {
LABEL_37:
  }
    sub_219486AFC();
  double v70 = (char *)operator new(240 * v69);
LABEL_31:
  long long v71 = a3[13];
  double v72 = &v70[240 * v66];
  *((_OWORD *)v72 + 12) = a3[12];
  *((_OWORD *)v72 + 13) = v71;
  *((_OWORD *)v72 + 14) = a3[14];
  long long v73 = a3[9];
  *((_OWORD *)v72 + 8) = a3[8];
  *((_OWORD *)v72 + 9) = v73;
  long long v74 = a3[11];
  *((_OWORD *)v72 + 10) = a3[10];
  *((_OWORD *)v72 + 11) = v74;
  long long v75 = a3[5];
  *((_OWORD *)v72 + 4) = a3[4];
  *((_OWORD *)v72 + 5) = v75;
  long long v76 = a3[7];
  *((_OWORD *)v72 + 6) = a3[6];
  *((_OWORD *)v72 + 7) = v76;
  long long v77 = a3[1];
  *(_OWORD *)double v72 = *a3;
  *((_OWORD *)v72 + 1) = v77;
  long long v79 = a3[2];
  long long v78 = a3[3];
  double v64 = v72 + 240;
  *((_OWORD *)v72 + 2) = v79;
  *((_OWORD *)v72 + 3) = v78;
  if (v50 != v65)
  {
    do
    {
      long long v80 = *((_OWORD *)v50 - 15);
      long long v81 = *((_OWORD *)v50 - 13);
      *((_OWORD *)v72 - 14) = *((_OWORD *)v50 - 14);
      *((_OWORD *)v72 - 13) = v81;
      *((_OWORD *)v72 - 15) = v80;
      long long v82 = *((_OWORD *)v50 - 12);
      long long v83 = *((_OWORD *)v50 - 11);
      long long v84 = *((_OWORD *)v50 - 9);
      *((_OWORD *)v72 - 10) = *((_OWORD *)v50 - 10);
      *((_OWORD *)v72 - 9) = v84;
      *((_OWORD *)v72 - 12) = v82;
      *((_OWORD *)v72 - 11) = v83;
      long long v85 = *((_OWORD *)v50 - 8);
      long long v86 = *((_OWORD *)v50 - 7);
      long long v87 = *((_OWORD *)v50 - 5);
      *((_OWORD *)v72 - 6) = *((_OWORD *)v50 - 6);
      *((_OWORD *)v72 - 5) = v87;
      *((_OWORD *)v72 - 8) = v85;
      *((_OWORD *)v72 - 7) = v86;
      long long v88 = *((_OWORD *)v50 - 4);
      long long v89 = *((_OWORD *)v50 - 3);
      long long v90 = *((_OWORD *)v50 - 1);
      *((_OWORD *)v72 - 2) = *((_OWORD *)v50 - 2);
      *((_OWORD *)v72 - 1) = v90;
      *((_OWORD *)v72 - 4) = v88;
      *((_OWORD *)v72 - 3) = v89;
      v72 -= 240;
      v50 -= 240;
    }
    while (v50 != v65);
    double v50 = *v49;
  }
  *double v49 = v72;
  *double v51 = v64;
  v49[2] = &v70[240 * v69];
  if (v50) {
    operator delete(v50);
  }
LABEL_36:
  *double v51 = v64;
}

void sub_2194ED824(uint64_t a1, void *__src, const void *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v8 = (void *)(*(void *)(a1 + 96) + 24 * a4);
  unint64_t v10 = v8 + 1;
  int v9 = (char *)v8[1];
  unint64_t v11 = v8[2];
  if ((unint64_t)v9 >= v11)
  {
    long long v13 = (char *)*v8;
    unint64_t v14 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)&v9[-*v8] >> 4);
    unint64_t v15 = v14 + 1;
    if (v14 + 1 > 0xC30C30C30C30C3) {
      sub_219486AE4();
    }
    unint64_t v16 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v11 - (void)v13) >> 4);
    if (2 * v16 > v15) {
      unint64_t v15 = 2 * v16;
    }
    if (v16 >= 0x61861861861861) {
      unint64_t v17 = 0xC30C30C30C30C3;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v17)
    {
      if (v17 > 0xC30C30C30C30C3) {
        goto LABEL_37;
      }
      long long v18 = (char *)operator new(336 * v17);
    }
    else
    {
      long long v18 = 0;
    }
    long long v19 = &v18[336 * v14];
    long long v20 = &v18[336 * v17];
    memcpy(v19, __src, 0x150uLL);
    long long v12 = v19 + 336;
    if (v9 != v13)
    {
      do
      {
        v9 -= 336;
        v19 -= 336;
        memcpy(v19, v9, 0x150uLL);
      }
      while (v9 != v13);
      int v9 = (char *)*v8;
    }
    *uint64_t v8 = v19;
    *unint64_t v10 = v12;
    v8[2] = v20;
    uint64_t v5 = a3;
    if (v9) {
      operator delete(v9);
    }
    uint64_t v4 = a4;
  }
  else
  {
    memcpy(v9, __src, 0x150uLL);
    long long v12 = v9 + 336;
  }
  *unint64_t v10 = v12;
  long long v21 = (void *)(*(void *)(a1 + 120) + 24 * v4);
  uint64_t v23 = v21 + 1;
  uint64_t v22 = (char *)v21[1];
  unint64_t v24 = v21[2];
  if ((unint64_t)v22 < v24)
  {
    memcpy(v22, v5, 0x150uLL);
    unint64_t v25 = v22 + 336;
    goto LABEL_36;
  }
  unint64_t v26 = (char *)*v21;
  unint64_t v27 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)&v22[-*v21] >> 4);
  unint64_t v28 = v27 + 1;
  if (v27 + 1 > 0xC30C30C30C30C3) {
    sub_219486AE4();
  }
  unint64_t v29 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v24 - (void)v26) >> 4);
  if (2 * v29 > v28) {
    unint64_t v28 = 2 * v29;
  }
  if (v29 >= 0x61861861861861) {
    unint64_t v30 = 0xC30C30C30C30C3;
  }
  else {
    unint64_t v30 = v28;
  }
  if (!v30)
  {
    long long v31 = 0;
    goto LABEL_31;
  }
  if (v30 > 0xC30C30C30C30C3) {
LABEL_37:
  }
    sub_219486AFC();
  long long v31 = (char *)operator new(336 * v30);
LABEL_31:
  long long v32 = &v31[336 * v27];
  long long v33 = &v31[336 * v30];
  memcpy(v32, v5, 0x150uLL);
  unint64_t v25 = v32 + 336;
  if (v22 != v26)
  {
    do
    {
      v22 -= 336;
      v32 -= 336;
      memcpy(v32, v22, 0x150uLL);
    }
    while (v22 != v26);
    uint64_t v22 = (char *)*v21;
  }
  *long long v21 = v32;
  *uint64_t v23 = v25;
  v21[2] = v33;
  if (v22) {
    operator delete(v22);
  }
LABEL_36:
  *uint64_t v23 = v25;
}

void sub_2194EDB00(uint64_t a1)
{
  sub_2194CD684(a1);

  JUMPOUT(0x21D48B5B0);
}

unsigned int sub_2194EDB38(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  int v7 = *(_DWORD *)(a1 + 32) - 1;
  int v8 = *(_DWORD *)(a1 + 48) - 1;
  uint64_t v9 = *(void *)(a1 + 72);
  int v10 = *(_DWORD *)(a1 + 40);
  int v11 = vcvtmd_s64_f64(a2);
  int v12 = vcvtmd_s64_f64(a3);
  int v13 = v11 + 1;
  int v14 = v12 + 1;
  int v15 = v11 & ~(v11 >> 31);
  if (v7 < v15) {
    int v15 = *(_DWORD *)(a1 + 32) - 1;
  }
  int v16 = v12 & ~(v12 >> 31);
  if (v8 < v16) {
    int v16 = *(_DWORD *)(a1 + 48) - 1;
  }
  if (v7 >= (v13 & ~(v13 >> 31))) {
    int v7 = v13 & ~(v13 >> 31);
  }
  if (v8 >= (v14 & ~(v14 >> 31))) {
    int v8 = v14 & ~(v14 >> 31);
  }
  double v17 = (double)v13 - a2;
  uint64_t v18 = v16 * v10;
  LOBYTE(a5) = *(unsigned char *)(v9 + v18 + v15);
  LOBYTE(a7) = *(unsigned char *)(v9 + v18 + v7);
  double v19 = a2 - (double)v11;
  *(double *)&unint64_t v20 = v19 * (double)*(unint64_t *)&a7;
  double v21 = *(double *)&v20 + v17 * (double)*(unint64_t *)&a5;
  uint64_t v22 = v8 * v10;
  LOBYTE(v20) = *(unsigned char *)(v9 + v22 + v15);
  LOBYTE(a7) = *(unsigned char *)(v9 + v22 + v7);
  return vcvtmd_s64_f64(((a3 - (double)v12) * (v19 * (double)*(unint64_t *)&a7 + v17 * (double)v20) + ((double)v14 - a3) * v21)* 16.0+ 0.5);
}

uint64_t sub_2194EDC24(uint64_t result, unsigned __int8 *a2)
{
  unsigned __int8 v2 = a2[9];
  *(unsigned char *)uint64_t result = (4 * v2) & 8;
  char v3 = a2[9] & 4 | (8 * ((v2 & 2) != 0));
  *(unsigned char *)uint64_t result = v3;
  int v4 = v3 & 0x7F | (a2[26] >> 1 << 7);
  *(unsigned char *)uint64_t result = v4;
  int v5 = (a2[26] >> 1) & 0x40 | v4;
  *(unsigned char *)uint64_t result = v5;
  LOBYTE(v5) = v5 | a2[27] & 0x20;
  *(unsigned char *)uint64_t result = v5;
  LOBYTE(v5) = a2[30] & 0x10 | v5;
  *(unsigned char *)uint64_t result = v5;
  *(unsigned char *)uint64_t result = v5 & 0xFC | (a2[31] >> 2) & 3;
  int v6 = (16 * a2[22]) & 0x40;
  *(unsigned char *)(result + 1) = v6;
  unsigned int v7 = v6 & 0xFFFFFFEF | (16 * (a2[26] & 1));
  *(unsigned char *)(result + 1) = v7;
  unsigned int v8 = v7 & 0xFFFFFFDF | (32 * (a2[27] & 1));
  *(unsigned char *)(result + 1) = v8;
  int v9 = v8 | a2[35] & 0x80;
  *(unsigned char *)(result + 1) = v9;
  unsigned int v10 = v9 & 0xFFFFFFFE | (a2[46] >> 6) & 1;
  *(unsigned char *)(result + 1) = v10;
  LOBYTE(v10) = v10 | a2[51] & 6;
  *(unsigned char *)(result + 1) = v10;
  *(unsigned char *)(result + 1) = v10 & 0xF7 | (8 * ((a2[54] & 4) != 0));
  LOBYTE(v10) = a2[9];
  *(unsigned char *)(result + 2) = (v10 & 1) << 6;
  int v11 = (a2[22] >> 1) & 4 | ((v10 & 1) << 6);
  *(unsigned char *)(result + 2) = v11;
  LOBYTE(v10) = v11 | a2[27] & 0x10;
  *(unsigned char *)(result + 2) = v10;
  LOBYTE(v10) = a2[30] & 0x20 | v10;
  *(unsigned char *)(result + 2) = v10;
  LOBYTE(v10) = v10 & 0xF7 | (8 * (a2[35] & 1));
  *(unsigned char *)(result + 2) = v10;
  LOBYTE(v10) = v10 & 0x7F | (a2[35] >> 6 << 7);
  *(unsigned char *)(result + 2) = v10;
  LOBYTE(v10) = v10 | a2[35] & 2;
  *(unsigned char *)(result + 2) = v10;
  *(unsigned char *)(result + 2) = a2[36] & 1 | v10;
  int v12 = (a2[12] >> 3) & 0x10;
  *(unsigned char *)(result + 3) = v12;
  int v13 = (a2[26] >> 1) & 2 | v12;
  *(unsigned char *)(result + 3) = v13;
  unsigned int v14 = v13 & 0xFFFFFFFE | (a2[26] >> 6) & 1;
  *(unsigned char *)(result + 3) = v14;
  LOBYTE(v14) = v14 | a2[35] & 4;
  *(unsigned char *)(result + 3) = v14;
  LOBYTE(v14) = v14 & 0xF7 | (8 * ((a2[48] & 4) != 0));
  *(unsigned char *)(result + 3) = v14;
  LOBYTE(v14) = v14 | a2[53] & 0x20;
  *(unsigned char *)(result + 3) = v14;
  LOBYTE(v14) = v14 & 0x7F | (a2[54] >> 1 << 7);
  *(unsigned char *)(result + 3) = v14;
  *(unsigned char *)(result + 3) = (16 * a2[57]) & 0x40 | v14;
  unsigned int v15 = a2[5];
  *(unsigned char *)(result + 4) = (2 * v15) & 0x10;
  int v16 = (a2[12] >> 3) & 8 | (16 * ((v15 >> 3) & 1));
  *(unsigned char *)(result + 4) = v16;
  LOBYTE(v16) = v16 & 0xDF | (32 * (a2[13] & 1));
  *(unsigned char *)(result + 4) = v16;
  LOBYTE(v16) = (a2[18] >> 3) & 4 | v16;
  *(unsigned char *)(result + 4) = v16;
  LOBYTE(v16) = (a2[21] >> 3) & 2 | v16;
  *(unsigned char *)(result + 4) = v16;
  int v17 = v16 & 0x7F | (a2[40] >> 2 << 7);
  *(unsigned char *)(result + 4) = v17;
  LOBYTE(v17) = v17 & 0xBF | (((a2[40] & 8) != 0) << 6);
  *(unsigned char *)(result + 4) = v17;
  *(unsigned char *)(result + 4) = ((a2[57] & 2) != 0) | v17;
  int v18 = a2[5] & 0x10;
  *(unsigned char *)(result + 5) = v18;
  unsigned int v19 = v18 & 0xFFFFFFBF | ((a2[11] & 1) << 6);
  *(unsigned char *)(result + 5) = v19;
  unsigned int v20 = v19 & 0xFFFFFFFE | (a2[18] >> 4) & 1;
  *(unsigned char *)(result + 5) = v20;
  int v21 = (a2[21] >> 4) & 2 | v20;
  *(unsigned char *)(result + 5) = v21;
  LOBYTE(v21) = v21 & 0xDF | (32 * ((a2[31] & 2) != 0));
  *(unsigned char *)(result + 5) = v21;
  int v22 = v21 & 0x7F | (a2[31] >> 4 << 7);
  *(unsigned char *)(result + 5) = v22;
  LOBYTE(v22) = v22 & 0xF7 | (8 * ((a2[46] & 2) != 0));
  *(unsigned char *)(result + 5) = v22;
  *(unsigned char *)(result + 5) = (a2[46] >> 3) & 4 | v22;
  int v23 = a2[10] >> 7;
  *(unsigned char *)(result + 6) = v23;
  int v24 = v23 & 0x7F | (a2[23] >> 1 << 7);
  *(unsigned char *)(result + 6) = v24;
  LOBYTE(v24) = v24 & 0xBF | (((a2[25] & 8) != 0) << 6);
  *(unsigned char *)(result + 6) = v24;
  LOBYTE(v24) = v24 | a2[36] & 0x20;
  *(unsigned char *)(result + 6) = v24;
  LOBYTE(v24) = (a2[36] >> 2) & 4 | v24;
  *(unsigned char *)(result + 6) = v24;
  LOBYTE(v24) = (a2[39] >> 4) & 2 | v24;
  *(unsigned char *)(result + 6) = v24;
  *(unsigned char *)(result + 6) = (a2[52] >> 2) & 0x18 | v24;
  int v25 = (a2[5] >> 1) & 2;
  *(unsigned char *)(result + 7) = v25;
  unsigned int v26 = v25 & 0xFFFFFFDF | (32 * ((a2[7] >> 2) & 1));
  *(unsigned char *)(result + 7) = v26;
  unsigned int v27 = v26 & 0xFFFFFFEF | (16 * ((a2[23] >> 2) & 1));
  *(unsigned char *)(result + 7) = v27;
  unsigned int v28 = v27 & 0xFFFFFFF7 | (8 * ((a2[25] >> 2) & 1));
  *(unsigned char *)(result + 7) = v28;
  LOBYTE(v28) = v28 & 0xFE | ((a2[39] & 0x10) != 0);
  *(unsigned char *)(result + 7) = v28;
  LOBYTE(v28) = v28 & 0x7F | (a2[48] >> 1 << 7);
  *(unsigned char *)(result + 7) = v28;
  LOBYTE(v28) = (a2[55] >> 4) & 4 | v28;
  *(unsigned char *)(result + 7) = v28;
  *(unsigned char *)(result + 7) = v28 | a2[58] & 0x40;
  LOBYTE(v28) = a2[7] & 2;
  *(unsigned char *)(result + 8) = v28;
  LOBYTE(v28) = v28 & 0xBF | ((a2[23] & 1) << 6);
  *(unsigned char *)(result + 8) = v28;
  int v29 = v28 & 0x7F | (a2[25] >> 4 << 7);
  *(unsigned char *)(result + 8) = v29;
  unsigned int v30 = v29 & 0xFFFFFFCF | (16 * ((a2[32] >> 1) & 3));
  *(unsigned char *)(result + 8) = v30;
  LOBYTE(v30) = v30 | a2[34] & 0xC;
  *(unsigned char *)(result + 8) = v30;
  *(unsigned char *)(result + 8) = v30 & 0xFE | ((a2[47] & 0x20) != 0);
  int v31 = a2[22] & 2;
  *(unsigned char *)(result + 9) = v31;
  unsigned int v32 = v31 & 0xFFFFFFFE | (a2[22] >> 4) & 1;
  *(unsigned char *)(result + 9) = v32;
  int v33 = (a2[27] >> 1) & 4 | v32;
  *(unsigned char *)(result + 9) = v33;
  int v34 = (a2[27] >> 2) & 0x10 | v33;
  *(unsigned char *)(result + 9) = v34;
  LOBYTE(v34) = v34 & 0xDF | (32 * ((a2[30] & 8) != 0));
  *(unsigned char *)(result + 9) = v34;
  LOBYTE(v34) = (a2[30] >> 3) & 8 | v34;
  *(unsigned char *)(result + 9) = v34;
  LOBYTE(v34) = v34 & 0x7F | (a2[44] >> 2 << 7);
  *(unsigned char *)(result + 9) = v34;
  *(unsigned char *)(result + 9) = v34 | a2[49] & 0x40;
  int v35 = a2[14] >> 3;
  *(unsigned char *)(result + 10) = v35 & 8;
  LOBYTE(v35) = (v35 | (32 * a2[40])) & 0x48;
  *(unsigned char *)(result + 10) = v35;
  int v36 = v35 & 0x7F | (a2[40] >> 4 << 7);
  *(unsigned char *)(result + 10) = v36;
  unsigned int v37 = v36 & 0xFFFFFFDF | (32 * (a2[44] & 1));
  *(unsigned char *)(result + 10) = v37;
  int v38 = v37 | a2[44] & 2;
  *(unsigned char *)(result + 10) = v38;
  int v39 = (a2[44] >> 5) & 4 | v38;
  *(unsigned char *)(result + 10) = v39;
  unsigned int v40 = v39 & 0xFFFFFFFE | (a2[44] >> 6) & 1;
  *(unsigned char *)(result + 10) = v40;
  *(unsigned char *)(result + 10) = v40 & 0xEF | (16 * (a2[45] & 1));
  int v41 = a2[16] & 0x10;
  *(unsigned char *)(result + 11) = v41;
  unsigned int v42 = v41 & 0xFFFFFFF7 | (8 * (a2[32] & 1));
  *(unsigned char *)(result + 11) = v42;
  int v43 = (a2[34] >> 2) & 4 | v42;
  *(unsigned char *)(result + 11) = v43;
  LOBYTE(v43) = v43 | a2[36] & 0x40;
  *(unsigned char *)(result + 11) = v43;
  LOBYTE(v43) = v43 & 0xDF | (32 * ((a2[55] & 2) != 0));
  *(unsigned char *)(result + 11) = v43;
  int v44 = v43 & 0x7F | (a2[55] >> 5 << 7);
  *(unsigned char *)(result + 11) = v44;
  LOBYTE(v44) = v44 & 0xFE | ((a2[58] & 2) != 0);
  *(unsigned char *)(result + 11) = v44;
  *(unsigned char *)(result + 11) = (a2[58] >> 4) & 2 | v44;
  LOBYTE(v44) = (a2[9] >> 4) & 2;
  *(unsigned char *)(result + 12) = v44;
  LOBYTE(v44) = a2[14] & 0x20 | v44;
  *(unsigned char *)(result + 12) = v44;
  LOBYTE(v44) = a2[16] & 0x40 | v44;
  *(unsigned char *)(result + 12) = v44;
  LOBYTE(v44) = (a2[16] >> 3) & 4 | v44;
  *(unsigned char *)(result + 12) = v44;
  LOBYTE(v44) = (a2[18] >> 3) & 8 | v44;
  *(unsigned char *)(result + 12) = v44;
  int v45 = v44 & 0x7F | (a2[19] >> 2 << 7);
  *(unsigned char *)(result + 12) = v45;
  LOBYTE(v45) = v45 & 0xEF | (16 * ((a2[21] & 8) != 0));
  *(unsigned char *)(result + 12) = v45;
  *(unsigned char *)(result + 12) = ((a2[39] & 8) != 0) | v45;
  int v46 = (a2[5] >> 4) & 8;
  *(unsigned char *)(result + 13) = v46;
  LOBYTE(v46) = v46 & 0xBF | (((a2[18] & 8) != 0) << 6);
  *(unsigned char *)(result + 13) = v46;
  LOBYTE(v46) = v46 | (a2[20] >> 7);
  *(unsigned char *)(result + 13) = v46;
  int v47 = v46 & 0x7F | (a2[21] >> 6 << 7);
  *(unsigned char *)(result + 13) = v47;
  int v48 = (a2[41] >> 1) & 2 | v47;
  *(unsigned char *)(result + 13) = v48;
  LOBYTE(v48) = v48 | a2[43] & 4;
  *(unsigned char *)(result + 13) = v48;
  LOBYTE(v48) = v48 & 0xEF | (16 * ((a2[49] & 2) != 0));
  *(unsigned char *)(result + 13) = v48;
  *(unsigned char *)(result + 13) = v48 | a2[49] & 0x20;
  int v49 = (a2[1] >> 2) & 0x10;
  *(unsigned char *)(result + 14) = v49;
  int v50 = (a2[13] >> 1) & 4 | v49;
  *(unsigned char *)(result + 14) = v50;
  unsigned int v51 = v50 & 0xFFFFFFBF | (((a2[24] >> 5) & 1) << 6);
  *(unsigned char *)(result + 14) = v51;
  int v52 = v51 | a2[29] & 0x80;
  *(unsigned char *)(result + 14) = v52;
  unsigned int v53 = v52 & 0xFFFFFFFE | (a2[36] >> 3) & 1;
  *(unsigned char *)(result + 14) = v53;
  int v54 = (a2[39] >> 5) & 2 | v53;
  *(unsigned char *)(result + 14) = v54;
  LOBYTE(v54) = v54 & 0xF7 | (8 * ((a2[41] & 2) != 0));
  *(unsigned char *)(result + 14) = v54;
  *(unsigned char *)(result + 14) = (4 * a2[43]) & 0x20 | v54;
  LOBYTE(v54) = *a2 & 4;
  *(unsigned char *)(result + 15) = v54;
  int v55 = v54 & 0x3F | (a2[2] >> 3 << 6);
  *(unsigned char *)(result + 15) = v55;
  unsigned int v56 = v55 & 0xFFFFFFDF | (32 * ((a2[3] >> 2) & 1));
  *(unsigned char *)(result + 15) = v56;
  int v57 = v56 | (a2[23] >> 7);
  *(unsigned char *)(result + 15) = v57;
  int v58 = (a2[28] >> 1) & 2 | v57;
  *(unsigned char *)(result + 15) = v58;
  LOBYTE(v58) = v58 & 0xEF | (16 * ((a2[35] & 8) != 0));
  *(unsigned char *)(result + 15) = v58;
  *(unsigned char *)(result + 15) = (a2[35] >> 2) & 8 | v58;
  int v59 = (a2[19] >> 2) & 2;
  *(unsigned char *)(result + 16) = v59;
  LOBYTE(v59) = v59 & 0xFE | ((a2[20] & 0x40) != 0);
  *(unsigned char *)(result + 16) = v59;
  LOBYTE(v59) = v59 | a2[29] & 0x40;
  *(unsigned char *)(result + 16) = v59;
  int v60 = v59 & 0x7F | (a2[31] >> 6 << 7);
  *(unsigned char *)(result + 16) = v60;
  int v61 = (a2[31] >> 1) & 0x10 | v60;
  *(unsigned char *)(result + 16) = v61;
  LOBYTE(v61) = v61 & 0xDF | (32 * (a2[41] & 1));
  *(unsigned char *)(result + 16) = v61;
  LOBYTE(v61) = (a2[44] >> 1) & 4 | v61;
  *(unsigned char *)(result + 16) = v61;
  *(unsigned char *)(result + 16) = (a2[44] >> 2) & 8 | v61;
  int v62 = *a2 >> 7;
  *(unsigned char *)(result + 17) = v62;
  LOBYTE(v62) = v62 & 0xFD | (2 * (a2[1] & 1));
  *(unsigned char *)(result + 17) = v62;
  LOBYTE(v62) = v62 | a2[3] & 0x80;
  *(unsigned char *)(result + 17) = v62;
  LOBYTE(v62) = v62 & 0xEF | (16 * ((a2[28] & 8) != 0));
  *(unsigned char *)(result + 17) = v62;
  LOBYTE(v62) = (a2[40] >> 1) & 0x20 | v62;
  *(unsigned char *)(result + 17) = v62;
  LOBYTE(v62) = (a2[40] >> 3) & 4 | v62;
  *(unsigned char *)(result + 17) = v62;
  LOBYTE(v62) = (a2[43] >> 1) & 8 | v62;
  *(unsigned char *)(result + 17) = v62;
  *(unsigned char *)(result + 17) = (2 * a2[45]) & 0x40 | v62;
  LOBYTE(v62) = (32 * *a2) & 0x40;
  *(unsigned char *)(result + 18) = v62;
  int v63 = v62 & 0x7F | (*a2 >> 3 << 7);
  *(unsigned char *)(result + 18) = v63;
  LOBYTE(v63) = v63 & 0xFE | a2[4] & 1;
  *(unsigned char *)(result + 18) = v63;
  LOBYTE(v63) = v63 & 0xDF | (32 * ((a2[17] & 2) != 0));
  *(unsigned char *)(result + 18) = v63;
  LOBYTE(v63) = (a2[26] >> 2) & 2 | v63;
  *(unsigned char *)(result + 18) = v63;
  LOBYTE(v63) = (a2[26] >> 3) & 4 | v63;
  *(unsigned char *)(result + 18) = v63;
  LOBYTE(v63) = (a2[34] >> 3) & 0x10 | v63;
  *(unsigned char *)(result + 18) = v63;
  *(unsigned char *)(result + 18) = (4 * a2[36]) & 8 | v63;
  int v64 = a2[1] & 0x20;
  *(unsigned char *)(result + 19) = v64;
  int v65 = (a2[1] >> 1) & 0x40 | v64;
  *(unsigned char *)(result + 19) = v65;
  unsigned int v66 = v65 & 0xFFFFFFF7 | (8 * ((a2[3] >> 1) & 1));
  *(unsigned char *)(result + 19) = v66;
  unsigned int v67 = v66 & 0xFFFFFFEF | (16 * ((a2[3] >> 3) & 1));
  *(unsigned char *)(result + 19) = v67;
  int v68 = (a2[4] >> 4) & 4 | v67;
  *(unsigned char *)(result + 19) = v68;
  LOBYTE(v68) = v68 & 0xFE | ((a2[37] & 4) != 0);
  *(unsigned char *)(result + 19) = v68;
  LOBYTE(v68) = (a2[38] >> 6) & 2 | v68;
  *(unsigned char *)(result + 19) = v68;
  *(unsigned char *)(result + 19) = (2 * a2[45]) & 0x80 | v68;
  int v69 = (a2[25] >> 2) & 0x20;
  *(unsigned char *)(result + 20) = v69;
  LOBYTE(v69) = v69 & 0xF7 | (8 * ((a2[27] & 2) != 0));
  *(unsigned char *)(result + 20) = v69;
  LOBYTE(v69) = (a2[32] >> 1) & 0x40 | v69;
  *(unsigned char *)(result + 20) = v69;
  LOBYTE(v69) = (a2[33] >> 1) & 0x10 | v69;
  *(unsigned char *)(result + 20) = v69;
  LOBYTE(v69) = v69 & 0x7F | (a2[38] >> 6 << 7);
  *(unsigned char *)(result + 20) = v69;
  LOBYTE(v69) = (a2[43] >> 5) & 4 | v69;
  *(unsigned char *)(result + 20) = v69;
  LOBYTE(v69) = v69 | a2[45] & 2;
  *(unsigned char *)(result + 20) = v69;
  *(unsigned char *)(result + 20) = ((a2[45] & 0x10) != 0) | v69;
  int v70 = (a2[4] >> 4) & 2;
  *(unsigned char *)(result + 21) = v70;
  int v71 = v70 | (a2[4] >> 7);
  *(unsigned char *)(result + 21) = v71;
  int v72 = a2[22] & 0x60 | v71;
  *(unsigned char *)(result + 21) = v72;
  int v73 = (a2[37] >> 1) & 4 | v72;
  *(unsigned char *)(result + 21) = v73;
  LOBYTE(v73) = v73 | (a2[47] << 7);
  *(unsigned char *)(result + 21) = v73;
  *(unsigned char *)(result + 21) = v73 & 0xE7 | (8 * (a2[50] & 3));
  int v74 = (a2[41] >> 2) & 0x20;
  *(unsigned char *)(result + 22) = v74;
  int v75 = (a2[42] >> 1) & 0x10 | v74;
  *(unsigned char *)(result + 22) = v75;
  int v76 = v75 | a2[47] & 2;
  *(unsigned char *)(result + 22) = v76;
  unsigned int v77 = v76 & 0xFFFFFFFE | (a2[47] >> 2) & 1;
  *(unsigned char *)(result + 22) = v77;
  LOBYTE(v77) = v77 & 0xF7 | (8 * (a2[55] & 1));
  *(unsigned char *)(result + 22) = v77;
  int v78 = v77 & 0x7F | (a2[56] >> 3 << 7);
  *(unsigned char *)(result + 22) = v78;
  LOBYTE(v78) = v78 & 0xBF | (((a2[56] & 0x10) != 0) << 6);
  *(unsigned char *)(result + 22) = v78;
  *(unsigned char *)(result + 22) = (4 * (a2[58] & 1)) | v78;
  int v79 = (8 * a2[13]) & 0xFF90;
  *(unsigned char *)(result + 23) = (8 * a2[13]) & 0x90;
  int v80 = (a2[14] >> 2) & 0x20 | v79;
  *(unsigned char *)(result + 23) = v80;
  unsigned int v81 = v80 & 0xFFFFFFBF | (((a2[53] >> 2) & 1) << 6);
  *(unsigned char *)(result + 23) = v81;
  int v82 = (a2[54] >> 1) & 4 | v81;
  *(unsigned char *)(result + 23) = v82;
  int v83 = (a2[54] >> 4) & 8 | v82;
  *(unsigned char *)(result + 23) = v83;
  LOBYTE(v83) = v83 & 0xFE | ((a2[57] & 8) != 0);
  *(unsigned char *)(result + 23) = v83;
  *(unsigned char *)(result + 23) = (a2[57] >> 6) & 2 | v83;
  LOBYTE(v83) = (a2[5] >> 2) & 8;
  *(unsigned char *)(result + 24) = v83;
  LOBYTE(v83) = (a2[8] >> 2) & 0x20 | v83;
  *(unsigned char *)(result + 24) = v83;
  int v84 = v83 & 0x7F | (a2[9] >> 6 << 7);
  *(unsigned char *)(result + 24) = v84;
  int v85 = (a2[9] >> 2) & 2 | v84;
  *(unsigned char *)(result + 24) = v85;
  int v86 = (a2[16] >> 5) & 4 | v85;
  *(unsigned char *)(result + 24) = v86;
  LOBYTE(v86) = v86 & 0xBF | (((a2[48] & 0x10) != 0) << 6);
  *(unsigned char *)(result + 24) = v86;
  *(unsigned char *)(result + 24) = v86 | a2[53] & 0x11;
  LOBYTE(v86) = a2[6];
  *(unsigned char *)(result + 25) = 2 * (v86 & 1);
  int v87 = (2 * a2[7]) & 0x10 | (2 * (v86 & 1));
  *(unsigned char *)(result + 25) = v87;
  int v88 = (a2[7] >> 3) & 8 | v87;
  *(unsigned char *)(result + 25) = v88;
  unsigned int v89 = v88 & 0xFFFFFFFE | (a2[11] >> 4) & 1;
  *(unsigned char *)(result + 25) = v89;
  LOBYTE(v89) = v89 | a2[15] & 4;
  *(unsigned char *)(result + 25) = v89;
  LOBYTE(v89) = v89 & 0xDF | (32 * ((a2[16] & 8) != 0));
  *(unsigned char *)(result + 25) = v89;
  LOBYTE(v89) = v89 & 0x7F | (a2[17] >> 2 << 7);
  *(unsigned char *)(result + 25) = v89;
  *(unsigned char *)(result + 25) = v89 | a2[48] & 0x40;
  int v90 = (*a2 >> 1) & 0x20;
  *(unsigned char *)(result + 26) = v90;
  unsigned int v91 = v90 & 0xFFFFFFEF | (16 * ((a2[1] >> 1) & 1));
  *(unsigned char *)(result + 26) = v91;
  LOBYTE(v91) = v91 | a2[11] & 2;
  *(unsigned char *)(result + 26) = v91;
  LOBYTE(v91) = v91 & 0xFE | ((a2[12] & 0x20) != 0);
  *(unsigned char *)(result + 26) = v91;
  LOBYTE(v91) = v91 | (a2[49] << 7);
  *(unsigned char *)(result + 26) = v91;
  LOBYTE(v91) = (a2[49] >> 1) & 0x40 | v91;
  *(unsigned char *)(result + 26) = v91;
  LOBYTE(v91) = (a2[51] >> 1) & 8 | v91;
  *(unsigned char *)(result + 26) = v91;
  *(unsigned char *)(result + 26) = (a2[51] >> 3) & 4 | v91;
  int v92 = (a2[2] >> 1) & 2;
  *(unsigned char *)(result + 27) = v92;
  int v93 = (a2[2] >> 3) & 4 | v92;
  *(unsigned char *)(result + 27) = v93;
  unsigned int v94 = v93 & 0xFFFFFFBF | (((a2[50] >> 5) & 1) << 6);
  *(unsigned char *)(result + 27) = v94;
  unsigned int v95 = v94 & 0xFFFFFFFE | (a2[50] >> 2) & 1;
  *(unsigned char *)(result + 27) = v95;
  LOBYTE(v95) = v95 & 0xDF | (32 * (a2[51] & 1));
  *(unsigned char *)(result + 27) = v95;
  LOBYTE(v95) = v95 & 0x7F | (a2[56] >> 2 << 7);
  *(unsigned char *)(result + 27) = v95;
  LOBYTE(v95) = (a2[56] >> 1) & 0x10 | v95;
  *(unsigned char *)(result + 27) = v95;
  *(unsigned char *)(result + 27) = (8 * (a2[57] & 1)) | v95;
  int v96 = (a2[3] >> 1) & 0x20;
  *(unsigned char *)(result + 28) = v96;
  unsigned int v97 = v96 & 0xFFFFFFFB | (4 * ((a2[4] >> 1) & 1));
  *(unsigned char *)(result + 28) = v97;
  int v98 = (a2[48] >> 2) & 8 | v97;
  *(unsigned char *)(result + 28) = v98;
  LOBYTE(v98) = v98 & 0xEF | (16 * ((a2[51] & 8) != 0));
  *(unsigned char *)(result + 28) = v98;
  LOBYTE(v98) = (a2[51] >> 5) & 2 | v98;
  *(unsigned char *)(result + 28) = v98;
  int v99 = v98 & 0x7F | (a2[52] >> 1 << 7);
  *(unsigned char *)(result + 28) = v99;
  LOBYTE(v99) = v99 & 0xBF | (((a2[53] & 2) != 0) << 6);
  *(unsigned char *)(result + 28) = v99;
  *(unsigned char *)(result + 28) = v99 | (a2[55] >> 7);
  unsigned int v100 = a2[48];
  *(unsigned char *)(result + 29) = (4 * v100) & 0x20;
  int v101 = (a2[48] >> 1) & 0x40 | (32 * ((v100 >> 3) & 1));
  *(unsigned char *)(result + 29) = v101;
  int v102 = (a2[51] >> 5) & 4 | v101;
  *(unsigned char *)(result + 29) = v102;
  unsigned int v103 = v102 & 0xFFFFFFFE | a2[52] & 1;
  *(unsigned char *)(result + 29) = v103;
  int v104 = (a2[52] >> 3) & 2 | v103;
  *(unsigned char *)(result + 29) = v104;
  int v105 = (a2[52] >> 4) & 8 | v104;
  *(unsigned char *)(result + 29) = v105;
  LOBYTE(v105) = v105 & 0xEF | (16 * ((a2[53] & 8) != 0));
  *(unsigned char *)(result + 29) = v105;
  *(unsigned char *)(result + 29) = (a2[56] << 6) & 0x80 | v105;
  int v106 = a2[20];
  *(unsigned char *)(result + 30) = (_BYTE)v106 << 7;
  int v107 = (a2[44] >> 2) & 4 | (v106 << 7);
  *(unsigned char *)(result + 30) = v107;
  unsigned int v108 = v107 & 0xFFFFFFFE | (a2[45] >> 2) & 1;
  *(unsigned char *)(result + 30) = v108;
  int v109 = (a2[54] >> 1) & 8 | v108;
  *(unsigned char *)(result + 30) = v109;
  int v110 = (a2[54] >> 2) & 0x10 | v109;
  *(unsigned char *)(result + 30) = v110;
  LOBYTE(v110) = v110 & 0xFD | (2 * (a2[56] & 1));
  *(unsigned char *)(result + 30) = v110;
  LOBYTE(v110) = v110 & 0xDF | (32 * ((a2[57] & 0x10) != 0));
  *(unsigned char *)(result + 30) = v110;
  *(unsigned char *)(result + 30) = v110 | a2[57] & 0x40;
  unsigned int v111 = a2[20];
  *(unsigned char *)(result + 31) = (v111 & 2) != 0;
  int v112 = (a2[36] >> 3) & 0x10 | (v111 >> 1) & 1;
  *(unsigned char *)(result + 31) = v112;
  LOBYTE(v112) = v112 & 0xBF | ((a2[40] & 1) << 6);
  *(unsigned char *)(result + 31) = v112;
  LOBYTE(v111) = (a2[46] >> 2) & 0x20 | v112;
  *(unsigned char *)(result + 31) = v111;
  LOBYTE(v111) = v111 & 0x7F | (a2[47] >> 3 << 7);
  *(unsigned char *)(result + 31) = v111;
  LOBYTE(v111) = (a2[47] >> 3) & 2 | v111;
  *(unsigned char *)(result + 31) = v111;
  LOBYTE(v111) = (a2[54] >> 2) & 8 | v111;
  *(unsigned char *)(result + 31) = v111;
  *(unsigned char *)(result + 31) = (a2[57] >> 3) & 4 | v111;
  int v113 = 2 * (a2[24] & 1);
  *(unsigned char *)(result + 32) = v113;
  unsigned int v114 = v113 & 0xFFFFFFFE | (a2[24] >> 4) & 1;
  *(unsigned char *)(result + 32) = v114;
  unsigned int v115 = v114 & 0xFFFFFFDF | (32 * ((a2[35] >> 4) & 1));
  *(unsigned char *)(result + 32) = v115;
  unsigned int v116 = v115 & 0xFFFFFFEF | (16 * ((a2[36] >> 2) & 1));
  *(unsigned char *)(result + 32) = v116;
  LOBYTE(v116) = v116 | (a2[42] << 7);
  *(unsigned char *)(result + 32) = v116;
  LOBYTE(v116) = v116 & 0xBF | (((a2[42] & 0x10) != 0) << 6);
  *(unsigned char *)(result + 32) = v116;
  LOBYTE(v116) = v116 | a2[50] & 8;
  *(unsigned char *)(result + 32) = v116;
  *(unsigned char *)(result + 32) = (a2[50] >> 2) & 4 | v116;
  int v117 = (2 * a2[1]) & 0x20;
  *(unsigned char *)(result + 33) = v117;
  unsigned int v118 = v117 & 0xFFFFFFEF | (16 * (a2[2] & 1));
  *(unsigned char *)(result + 33) = v118;
  int v119 = (a2[4] >> 2) & 4 | v118;
  *(unsigned char *)(result + 33) = v119;
  unsigned int v120 = v119 & 0xFFFFFFF7 | (8 * (a2[5] & 1));
  *(unsigned char *)(result + 33) = v120;
  int v121 = v120 | (a2[17] << 7);
  *(unsigned char *)(result + 33) = v121;
  unsigned int v122 = v121 & 0xFFFFFFBF | (((a2[18] >> 2) & 1) << 6);
  *(unsigned char *)(result + 33) = v122;
  LOBYTE(v122) = v122 & 0xFE | ((a2[45] & 8) != 0);
  *(unsigned char *)(result + 33) = v122;
  *(unsigned char *)(result + 33) = (a2[45] >> 6) & 2 | v122;
  int v123 = 2 * (*a2 & 1);
  *(unsigned char *)(result + 34) = v123;
  unsigned int v124 = v123 & 0xFFFFFFFE | (*a2 >> 4) & 1;
  *(unsigned char *)(result + 34) = v124;
  int v125 = v124 | (a2[3] << 7);
  *(unsigned char *)(result + 34) = v125;
  int v126 = (a2[17] >> 1) & 0x10 | v125;
  *(unsigned char *)(result + 34) = v126;
  int v127 = v126 | a2[23] & 0x40;
  *(unsigned char *)(result + 34) = v127;
  int v128 = (a2[24] >> 1) & 0x20 | v127;
  *(unsigned char *)(result + 34) = v128;
  LOBYTE(v128) = v128 & 0xFB | (4 * (a2[37] & 1));
  *(unsigned char *)(result + 34) = v128;
  *(unsigned char *)(result + 34) = (a2[39] >> 4) & 8 | v128;
  int v129 = (a2[1] >> 1) & 6;
  *(unsigned char *)(result + 35) = v129;
  unsigned int v130 = v129 & 0xFFFFFFFE | (a2[3] >> 4) & 1;
  *(unsigned char *)(result + 35) = v130;
  unsigned int v131 = v130 & 0xFFFFFFBF | (((a2[5] >> 1) & 1) << 6);
  *(unsigned char *)(result + 35) = v131;
  unsigned int v132 = v131 & 0xFFFFFFEF | (16 * (a2[33] & 1));
  *(unsigned char *)(result + 35) = v132;
  unsigned int v133 = v132 & 0xFFFFFFDF | (32 * ((a2[33] >> 4) & 1));
  *(unsigned char *)(result + 35) = v133;
  LOBYTE(v133) = v133 | a2[40] & 0x80;
  *(unsigned char *)(result + 35) = v133;
  *(unsigned char *)(result + 35) = v133 & 0xF7 | (8 * (a2[46] & 1));
  LOBYTE(v133) = a2[4] & 4;
  *(unsigned char *)(result + 36) = v133;
  LOBYTE(v133) = (a2[4] >> 2) & 2 | v133;
  *(unsigned char *)(result + 36) = v133;
  LOBYTE(v133) = (a2[27] >> 2) & 0x20 | v133;
  *(unsigned char *)(result + 36) = v133;
  int v134 = v133 & 0x7F | (a2[29] >> 1 << 7);
  *(unsigned char *)(result + 36) = v134;
  LOBYTE(v134) = v134 & 0xBF | ((a2[31] & 1) << 6);
  *(unsigned char *)(result + 36) = v134;
  LOBYTE(v134) = v134 & 0xEF | (16 * (a2[38] & 1));
  *(unsigned char *)(result + 36) = v134;
  LOBYTE(v134) = v134 & 0xF7 | (8 * ((a2[38] & 2) != 0));
  *(unsigned char *)(result + 36) = v134;
  *(unsigned char *)(result + 36) = ((a2[43] & 0x20) != 0) | v134;
  int v135 = *a2 & 0x20;
  *(unsigned char *)(result + 37) = v135;
  int v136 = (a2[2] >> 3) & 0x18 | v135;
  *(unsigned char *)(result + 37) = v136;
  int v137 = (a2[18] >> 6) & 2 | v136;
  *(unsigned char *)(result + 37) = v137;
  LOBYTE(v137) = v137 & 0xFB | (4 * (a2[22] & 1));
  *(unsigned char *)(result + 37) = v137;
  LOBYTE(v137) = v137 & 0xFE | a2[29] & 1;
  *(unsigned char *)(result + 37) = v137;
  LOBYTE(v137) = a2[41] & 0x40 | v137;
  *(unsigned char *)(result + 37) = v137;
  *(unsigned char *)(result + 37) = v137 & 0x7F | (((a2[42] & 0x40) != 0) << 7);
  LOBYTE(v137) = a2[3];
  *(unsigned char *)(result + 38) = (v137 & 0x20) != 0;
  LOBYTE(v112) = (a2[13] >> 1) & 2 | ((v137 & 0x20) != 0);
  *(unsigned char *)(result + 38) = v112;
  LOBYTE(v137) = v112 | a2[14] & 0x10;
  *(unsigned char *)(result + 38) = v137;
  int v138 = v137 & 0x7F | (a2[19] >> 1 << 7);
  *(unsigned char *)(result + 38) = v138;
  unsigned int v139 = v138 & 0xFFFFFFBF | (((a2[26] >> 4) & 1) << 6);
  *(unsigned char *)(result + 38) = v139;
  LOBYTE(v139) = v139 & 0xDF | (32 * ((a2[27] & 4) != 0));
  *(unsigned char *)(result + 38) = v139;
  LOBYTE(v139) = (a2[41] >> 2) & 4 | v139;
  *(unsigned char *)(result + 38) = v139;
  *(unsigned char *)(result + 38) = (a2[43] >> 3) & 8 | v139;
  int v140 = (8 * a2[2]) & 0x10;
  *(unsigned char *)(result + 39) = v140;
  unsigned int v141 = v140 & 0xFFFFFFBF | (((a2[6] >> 3) & 1) << 6);
  *(unsigned char *)(result + 39) = v141;
  int v142 = (a2[13] >> 6) & 2 | v141;
  *(unsigned char *)(result + 39) = v142;
  LOBYTE(v142) = v142 & 0xFE | a2[21] & 1;
  *(unsigned char *)(result + 39) = v142;
  LOBYTE(v142) = v142 & 0xF7 | (8 * (a2[28] & 1));
  *(unsigned char *)(result + 39) = v142;
  LOBYTE(v142) = (a2[30] >> 5) & 4 | v142;
  *(unsigned char *)(result + 39) = v142;
  LOBYTE(v142) = v142 & 0x7F | (a2[32] >> 6 << 7);
  *(unsigned char *)(result + 39) = v142;
  *(unsigned char *)(result + 39) = (a2[33] >> 1) & 0x20 | v142;
  int v143 = (a2[5] >> 4) & 4;
  *(unsigned char *)(result + 40) = v143;
  unsigned int v144 = v143 & 0xFFFFFFF7 | (8 * (a2[7] & 1));
  *(unsigned char *)(result + 40) = v144;
  int v145 = v144 | a2[15] & 2;
  *(unsigned char *)(result + 40) = v145;
  unsigned int v146 = v145 & 0xFFFFFFFE | (a2[16] >> 1) & 1;
  *(unsigned char *)(result + 40) = v146;
  LOBYTE(v146) = v146 & 0xEF | (16 * (a2[19] & 1));
  *(unsigned char *)(result + 40) = v146;
  LOBYTE(v146) = v146 | a2[21] & 0x80;
  *(unsigned char *)(result + 40) = v146;
  LOBYTE(v146) = v146 & 0xBF | ((a2[39] & 1) << 6);
  *(unsigned char *)(result + 40) = v146;
  *(unsigned char *)(result + 40) = (16 * a2[43]) & 0x20 | v146;
  int v147 = (a2[15] >> 2) & 0x10;
  *(unsigned char *)(result + 41) = v147;
  int v148 = (a2[17] >> 1) & 4 | v147;
  *(unsigned char *)(result + 41) = v148;
  unsigned int v149 = v148 & 0xFFFFFFDF | (32 * ((a2[19] >> 4) & 1));
  *(unsigned char *)(result + 41) = v149;
  int v150 = (a2[20] >> 2) & 8 | v149;
  *(unsigned char *)(result + 41) = v150;
  LOBYTE(v150) = v150 | a2[37] & 2;
  *(unsigned char *)(result + 41) = v150;
  LOBYTE(v150) = v150 & 0xFE | ((a2[41] & 8) != 0);
  *(unsigned char *)(result + 41) = v150;
  LOBYTE(v150) = v150 & 0x7F | (a2[49] >> 2 << 7);
  *(unsigned char *)(result + 41) = v150;
  *(unsigned char *)(result + 41) = (4 * a2[49]) & 0x40 | v150;
  int v151 = a2[9] & 0x10;
  *(unsigned char *)(result + 42) = v151;
  unsigned int v152 = v151 & 0xFFFFFFF7 | (8 * ((a2[10] >> 1) & 1));
  *(unsigned char *)(result + 42) = v152;
  int v153 = (a2[10] >> 1) & 0x20 | v152;
  *(unsigned char *)(result + 42) = v153;
  LOBYTE(v153) = v153 | (a2[15] << 7);
  *(unsigned char *)(result + 42) = v153;
  LOBYTE(v153) = v153 & 0xBF | (((a2[16] & 4) != 0) << 6);
  *(unsigned char *)(result + 42) = v153;
  LOBYTE(v153) = (a2[17] >> 4) & 5 | v153;
  *(unsigned char *)(result + 42) = v153;
  *(unsigned char *)(result + 42) = v153 | a2[18] & 2;
  unsigned int v154 = a2[15];
  *(unsigned char *)(result + 43) = (2 * v154) & 0x10;
  int v155 = (a2[17] >> 6) & 2 | (16 * ((v154 >> 3) & 1));
  *(unsigned char *)(result + 43) = v155;
  unsigned int v156 = v155 & 0xFFFFFFFB | (4 * (a2[18] & 1));
  *(unsigned char *)(result + 43) = v156;
  int v157 = (a2[31] >> 4) & 8 | v156;
  *(unsigned char *)(result + 43) = v157;
  unsigned int v158 = v157 & 0xFFFFFFFE | (a2[34] >> 5) & 1;
  *(unsigned char *)(result + 43) = v158;
  unsigned int v159 = v158 & 0xFFFFFFDF | (32 * ((a2[37] >> 4) & 1));
  *(unsigned char *)(result + 43) = v159;
  LOBYTE(v159) = v159 & 0xBF | (((a2[38] & 0x20) != 0) << 6);
  *(unsigned char *)(result + 43) = v159;
  *(unsigned char *)(result + 43) = (8 * a2[58]) & 0x80 | v159;
  int v160 = (a2[19] >> 5) & 4;
  *(unsigned char *)(result + 44) = v160;
  unsigned int v161 = v160 & 0xFFFFFFEF | (16 * ((a2[20] >> 2) & 1));
  *(unsigned char *)(result + 44) = v161;
  int v162 = v161 | a2[37] & 0x80;
  *(unsigned char *)(result + 44) = v162;
  unsigned int v163 = v162 & 0xFFFFFFDF | (32 * ((a2[38] >> 2) & 1));
  *(unsigned char *)(result + 44) = v163;
  unsigned int v164 = v163 & 0xFFFFFFF7 | (8 * ((a2[42] >> 1) & 1));
  *(unsigned char *)(result + 44) = v164;
  int v165 = (a2[42] >> 2) & 2 | v164;
  *(unsigned char *)(result + 44) = v165;
  LOBYTE(v165) = v165 & 0xBF | (((a2[55] & 0x10) != 0) << 6);
  *(unsigned char *)(result + 44) = v165;
  *(unsigned char *)(result + 44) = ((a2[58] & 4) != 0) | v165;
  int v166 = (4 * a2[25]) & 0xFF80;
  *(unsigned char *)(result + 45) = (4 * a2[25]) & 0x80;
  unsigned int v167 = v166 & 0xFFFFFFBF | (((a2[32] >> 3) & 1) << 6);
  *(unsigned char *)(result + 45) = v167;
  int v168 = v167 | a2[32] & 0x10;
  *(unsigned char *)(result + 45) = v168;
  unsigned int v169 = v168 & 0xFFFFFFDF | (32 * ((a2[34] >> 1) & 1));
  *(unsigned char *)(result + 45) = v169;
  int v170 = (a2[34] >> 5) & 2 | v169;
  *(unsigned char *)(result + 45) = v170;
  LOBYTE(v170) = v170 | a2[42] & 4;
  *(unsigned char *)(result + 45) = v170;
  LOBYTE(v170) = v170 & 0xF7 | (8 * (a2[43] & 1));
  *(unsigned char *)(result + 45) = v170;
  *(unsigned char *)(result + 45) = ((a2[55] & 4) != 0) | v170;
  LOBYTE(v170) = (2 * a2[7]) & 0x40;
  *(unsigned char *)(result + 46) = v170;
  int v171 = v170 & 0x7F | (a2[8] >> 5 << 7);
  *(unsigned char *)(result + 46) = v171;
  int v172 = v171 | a2[8] & 4;
  *(unsigned char *)(result + 46) = v172;
  int v173 = (a2[22] >> 6) & 2 | v172;
  *(unsigned char *)(result + 46) = v173;
  unsigned int v174 = v173 & 0xFFFFFFDF | (32 * ((a2[28] >> 4) & 1));
  *(unsigned char *)(result + 46) = v174;
  int v175 = (a2[29] >> 1) & 0x10 | v174;
  *(unsigned char *)(result + 46) = v175;
  LOBYTE(v175) = v175 & 0xFE | ((a2[41] & 0x20) != 0);
  *(unsigned char *)(result + 46) = v175;
  *(unsigned char *)(result + 46) = (a2[42] >> 4) & 8 | v175;
  unsigned int v176 = a2[7];
  *(unsigned char *)(result + 47) = (8 * v176) & 0x80;
  int v177 = (a2[7] >> 2) & 0x20 | (v176 >> 4 << 7);
  *(unsigned char *)(result + 47) = v177;
  int v178 = v177 | a2[8] & 0x40;
  *(unsigned char *)(result + 47) = v178;
  int v179 = a2[23] & 8 | v178;
  *(unsigned char *)(result + 47) = v179;
  unsigned int v180 = v179 & 0xFFFFFFEF | (16 * ((a2[25] >> 1) & 1));
  *(unsigned char *)(result + 47) = v180;
  LOBYTE(v180) = v180 & 0xFB | (4 * ((a2[28] & 2) != 0));
  *(unsigned char *)(result + 47) = v180;
  LOBYTE(v180) = v180 & 0xFE | a2[30] & 1;
  *(unsigned char *)(result + 47) = v180;
  *(unsigned char *)(result + 47) = (a2[49] >> 2) & 2 | v180;
  int v181 = a2[48] & 1;
  *(unsigned char *)(result + 48) = v181;
  int v182 = v181 | (16 * ((a2[6] >> 6) & 1));
  *(unsigned char *)(result + 48) = v182;
  unsigned int v183 = v182 & 0xFFFFFFBF | (((a2[15] >> 5) & 1) << 6);
  *(unsigned char *)(result + 48) = v183;
  int v184 = v183 | a2[15] & 0x80;
  *(unsigned char *)(result + 48) = v184;
  int v185 = (a2[15] >> 1) & 8 | v184;
  *(unsigned char *)(result + 48) = v185;
  LOBYTE(v185) = v185 & 0xDF | (32 * (a2[16] & 1));
  *(unsigned char *)(result + 48) = v185;
  LOBYTE(v185) = (a2[47] >> 5) & 2 | v185;
  *(unsigned char *)(result + 48) = v185;
  *(unsigned char *)(result + 48) = (a2[58] >> 1) & 4 | v185;
  unsigned int v186 = a2[11];
  *(unsigned char *)(result + 49) = (4 * v186) & 0x10;
  int v187 = (a2[11] >> 2) & 2 | (16 * ((v186 >> 2) & 1));
  *(unsigned char *)(result + 49) = v187;
  unsigned int v188 = v187 & 0xFFFFFFDF | (32 * ((a2[12] >> 4) & 1));
  *(unsigned char *)(result + 49) = v188;
  unsigned int v189 = v188 & 0xFFFFFFFE | (a2[12] >> 3) & 1;
  *(unsigned char *)(result + 49) = v189;
  int v190 = (a2[23] >> 2) & 4 | v189;
  *(unsigned char *)(result + 49) = v190;
  int v191 = (a2[25] >> 3) & 8 | v190;
  *(unsigned char *)(result + 49) = v191;
  LOBYTE(v191) = v191 & 0xBF | (((a2[37] & 0x20) != 0) << 6);
  *(unsigned char *)(result + 49) = v191;
  *(unsigned char *)(result + 49) = (32 * a2[39]) & 0x80 | v191;
  int v192 = a2[11] & 0x20;
  *(unsigned char *)(result + 50) = v192;
  unsigned int v193 = v192 & 0xFFFFFFFB | (4 * (a2[12] & 1));
  *(unsigned char *)(result + 50) = v193;
  int v194 = (a2[19] >> 2) & 0x10 | v193;
  *(unsigned char *)(result + 50) = v194;
  unsigned int v195 = v194 & 0xFFFFFFF7 | (8 * ((a2[21] >> 1) & 1));
  *(unsigned char *)(result + 50) = v195;
  unsigned int v196 = v195 & 0xFFFFFFFE | (a2[37] >> 6) & 1;
  *(unsigned char *)(result + 50) = v196;
  LOBYTE(v196) = v196 | a2[39] & 2;
  *(unsigned char *)(result + 50) = v196;
  LOBYTE(v196) = v196 & 0xBF | (((a2[46] & 0x10) != 0) << 6);
  *(unsigned char *)(result + 50) = v196;
  *(unsigned char *)(result + 50) = (16 * a2[55]) & 0x80 | v196;
  LOBYTE(v196) = a2[6] & 2;
  *(unsigned char *)(result + 51) = v196;
  LOBYTE(v196) = (a2[6] >> 1) & 0x40 | v196;
  *(unsigned char *)(result + 51) = v196;
  int v197 = v196 & 0x7F | (a2[21] >> 2 << 7);
  *(unsigned char *)(result + 51) = v197;
  int v198 = (a2[28] >> 3) & 0x10 | v197;
  *(unsigned char *)(result + 51) = v198;
  unsigned int v199 = v198 & 0xFFFFFFDF | (32 * ((a2[29] >> 2) & 1));
  *(unsigned char *)(result + 51) = v199;
  unsigned int v200 = v199 & 0xFFFFFFFE | (a2[46] >> 2) & 1;
  *(unsigned char *)(result + 51) = v200;
  LOBYTE(v200) = v200 & 0xF7 | (8 * ((a2[52] & 4) != 0));
  *(unsigned char *)(result + 51) = v200;
  *(unsigned char *)(result + 51) = (a2[52] >> 1) & 4 | v200;
  LOBYTE(v200) = (2 * a2[6]) & 0x20;
  *(unsigned char *)(result + 52) = v200;
  LOBYTE(v200) = v200 & 0xFE | ((a2[6] & 4) != 0);
  *(unsigned char *)(result + 52) = v200;
  int v201 = v200 & 0x7F | (a2[13] >> 6 << 7);
  *(unsigned char *)(result + 52) = v201;
  int v202 = (a2[13] >> 3) & 4 | v201;
  *(unsigned char *)(result + 52) = v202;
  unsigned int v203 = v202 & 0xFFFFFFBF | (((a2[14] >> 2) & 1) << 6);
  *(unsigned char *)(result + 52) = v203;
  int v204 = (a2[19] >> 4) & 2 | v203;
  *(unsigned char *)(result + 52) = v204;
  LOBYTE(v204) = v204 & 0xEF | (16 * ((a2[38] & 8) != 0));
  *(unsigned char *)(result + 52) = v204;
  *(unsigned char *)(result + 52) = (a2[38] >> 1) & 8 | v204;
  LOBYTE(v204) = a2[53] & 0x40;
  *(unsigned char *)(result + 53) = v204;
  int v205 = v204 & 0x7F | (a2[14] >> 1 << 7);
  *(unsigned char *)(result + 53) = v205;
  unsigned int v206 = v205 & 0xFFFFFFFD | (2 * (a2[14] & 1));
  *(unsigned char *)(result + 53) = v206;
  unsigned int v207 = v206 & 0xFFFFFFFE | (a2[14] >> 3) & 1;
  *(unsigned char *)(result + 53) = v207;
  int v208 = (a2[47] >> 3) & 0x10 | v207;
  *(unsigned char *)(result + 53) = v208;
  LOBYTE(v208) = v208 & 0xDF | (32 * (a2[54] & 1));
  *(unsigned char *)(result + 53) = v208;
  LOBYTE(v208) = (a2[56] >> 3) & 8 | v208;
  *(unsigned char *)(result + 53) = v208;
  *(unsigned char *)(result + 53) = (a2[56] >> 5) & 4 | v208;
  int v209 = 16 * a2[8];
  *(unsigned char *)(result + 54) = v209 & 0x80;
  unsigned int v210 = (v209 | (a2[10] >> 3)) & 0xFFFFFF82;
  *(unsigned char *)(result + 54) = v210;
  unsigned int v211 = v210 & 0xFFFFFFBF | (((a2[20] >> 3) & 1) << 6);
  *(unsigned char *)(result + 54) = v211;
  LOBYTE(v211) = v211 & 0xDF | (32 * ((a2[20] & 0x10) != 0));
  *(unsigned char *)(result + 54) = v211;
  LOBYTE(v211) = (a2[23] >> 3) & 4 | v211;
  *(unsigned char *)(result + 54) = v211;
  LOBYTE(v211) = v211 | (a2[24] >> 7);
  *(unsigned char *)(result + 54) = v211;
  LOBYTE(v211) = (a2[32] >> 1) & 0x10 | v211;
  *(unsigned char *)(result + 54) = v211;
  *(unsigned char *)(result + 54) = (a2[33] >> 4) & 8 | v211;
  LOBYTE(v211) = (2 * a2[6]) & 0x40;
  *(unsigned char *)(result + 55) = v211;
  LOBYTE(v211) = v211 & 0xFE | ((a2[8] & 2) != 0);
  *(unsigned char *)(result + 55) = v211;
  LOBYTE(v211) = (a2[28] >> 3) & 8 | v211;
  *(unsigned char *)(result + 55) = v211;
  LOBYTE(v211) = v211 | a2[30] & 2;
  *(unsigned char *)(result + 55) = v211;
  int v212 = v211 & 0x7F | (a2[33] >> 1 << 7);
  *(unsigned char *)(result + 55) = v212;
  unsigned int v213 = v212 & 0xFFFFFFCF | (16 * ((a2[33] >> 2) & 3));
  *(unsigned char *)(result + 55) = v213;
  *(unsigned char *)(result + 55) = v213 & 0xFB | (4 * (a2[34] & 1));
  LOBYTE(v213) = a2[8];
  *(unsigned char *)(result + 56) = 16 * (v213 & 1);
  int v214 = (a2[8] >> 1) & 8 | (16 * (v213 & 1));
  *(unsigned char *)(result + 56) = v214;
  LOBYTE(v213) = v214 | a2[24] & 2;
  *(unsigned char *)(result + 56) = v213;
  LOBYTE(v213) = v213 & 0xFE | ((a2[24] & 8) != 0);
  *(unsigned char *)(result + 56) = v213;
  LOBYTE(v213) = (a2[46] >> 1) & 4 | v213;
  *(unsigned char *)(result + 56) = v213;
  LOBYTE(v213) = v213 & 0x7F | (a2[50] >> 6 << 7);
  *(unsigned char *)(result + 56) = v213;
  LOBYTE(v213) = (a2[50] >> 1) & 0x40 | v213;
  *(unsigned char *)(result + 56) = v213;
  *(unsigned char *)(result + 56) = (a2[53] >> 2) & 0x20 | v213;
  int v215 = a2[9] & 0x80;
  *(unsigned char *)(result + 57) = v215;
  unsigned int v216 = v215 & 0xFFFFFFEF | (16 * (a2[10] & 1));
  *(unsigned char *)(result + 57) = v216;
  int v217 = v216 | a2[10] & 4;
  *(unsigned char *)(result + 57) = v217;
  int v218 = (a2[10] >> 2) & 8 | v217;
  *(unsigned char *)(result + 57) = v218;
  int v219 = (a2[11] >> 1) & 0x40 | v218;
  *(unsigned char *)(result + 57) = v219;
  LOBYTE(v219) = v219 & 0xDF | (32 * ((a2[12] & 2) != 0));
  *(unsigned char *)(result + 57) = v219;
  LOBYTE(v219) = (a2[24] >> 1) & 2 | v219;
  *(unsigned char *)(result + 57) = v219;
  *(unsigned char *)(result + 57) = v219 | a2[25] & 1;
  unsigned int v220 = a2[10];
  *(unsigned char *)(result + 58) = (8 * v220) & 0x40;
  int v221 = (a2[11] >> 1) & 0x20 | (((v220 >> 3) & 1) << 6);
  *(unsigned char *)(result + 58) = v221;
  unsigned int v222 = v221 & 0xFFFFFFEF | (16 * ((a2[12] >> 2) & 1));
  *(unsigned char *)(result + 58) = v222;
  unsigned int v223 = v222 & 0xFFFFFFFE | (a2[28] >> 5) & 1;
  *(unsigned char *)(result + 58) = v223;
  int v224 = (a2[29] >> 1) & 0xC | v223;
  *(unsigned char *)(result + 58) = v224;
  *(unsigned char *)(result + 58) = (a2[30] >> 1) & 2 | v224;
  *(_DWORD *)(result + 59) = 0;
  *(unsigned char *)(result + 63) = 0;
  return result;
}

void sub_2194EF94C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = xmmword_21950C500;
  *(int64x2_t *)(a1 + 16) = vdupq_n_s64(3uLL);
  *(void *)(a1 + 32) = 1;
  *(_WORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 48) = 2097168;
  *(unsigned char *)(a1 + 52) = 1;
  *(void *)(a1 + 56) = 0x90000002DLL;
  *(_OWORD *)(a1 + 64) = xmmword_21950DF90;
  *(_OWORD *)(a1 + 80) = unk_21950DFA0;
  *(_OWORD *)(a1 + 96) = xmmword_21950DFB0;
  *(_OWORD *)(a1 + 112) = unk_21950DFC0;
  *(_OWORD *)(a1 + 160) = xmmword_21950DFF0;
  *(_OWORD *)(a1 + 176) = unk_21950E000;
  *(_OWORD *)(a1 + 128) = xmmword_21950DFD0;
  *(_OWORD *)(a1 + 144) = unk_21950DFE0;
  *(void *)(a1 + 192) = 1;
  *(_OWORD *)(a1 + 200) = 0u;
  int v4 = (void *)(a1 + 200);
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v5 = *(_OWORD *)(a2 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  long long v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v6;
  long long v8 = *(_OWORD *)(a2 + 80);
  long long v9 = *(_OWORD *)(a2 + 96);
  long long v10 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v10;
  *(_OWORD *)(a1 + 80) = v8;
  *(_OWORD *)(a1 + 96) = v9;
  long long v11 = *(_OWORD *)(a2 + 144);
  long long v12 = *(_OWORD *)(a2 + 160);
  long long v13 = *(_OWORD *)(a2 + 176);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v12;
  *(_OWORD *)(a1 + 176) = v13;
  *(_OWORD *)(a1 + 144) = v11;
  if (a1 != a2)
  {
    sub_2194DDD20(v4, *(char **)(a2 + 200), *(char **)(a2 + 208), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a2 + 208) - *(void *)(a2 + 200)) >> 3));
    sub_2194DDD20((void *)(a1 + 224), *(char **)(a2 + 224), *(char **)(a2 + 232), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a2 + 232) - *(void *)(a2 + 224)) >> 3));
  }
  if (sub_2194F2658((unint64_t *)a2)) {
    operator new();
  }
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/ResponseMapAndKPCGenerator.cpp", 36, "IsResponseMapAndKPCGeneratorConfigValid(config) && \"Invalid configuration\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2194EFC18(_Unwind_Exception *a1)
{
  MEMORY[0x21D48B5B0](v4, 0x1030C40B15F70E4);
  long long v6 = (void *)*v2;
  *unsigned __int8 v2 = 0;
  if (v6) {
    sub_2194C9AB0((uint64_t)v2, v6);
  }
  sub_2194EFC70(v3);
  sub_2194E0AC0(v1);
  _Unwind_Resume(a1);
}

void *sub_2194EFC70(void *a1)
{
  unsigned __int8 v2 = (void *)*a1;
  *a1 = 0;
  if (v2)
  {
    char v3 = (void *)v2[9];
    if (v3)
    {
      v2[10] = v3;
      operator delete(v3);
    }
    uint64_t v4 = (void (***)(void))v2[6];
    if (v4)
    {
      long long v5 = (void (***)(void))v2[7];
      long long v6 = (void *)v2[6];
      if (v5 != v4)
      {
        long long v7 = v5 - 18;
        long long v8 = v5 - 18;
        long long v9 = v5 - 18;
        do
        {
          long long v10 = *v9;
          v9 -= 18;
          (*v10)(v8);
          v7 -= 18;
          BOOL v11 = v8 == v4;
          long long v8 = v9;
        }
        while (!v11);
        long long v6 = (void *)v2[6];
      }
      v2[7] = v4;
      operator delete(v6);
    }
    MEMORY[0x21D48B5B0](v2, 0x1020C4024B85F43);
  }
  return a1;
}

unsigned __int16 *sub_2194EFD44(unsigned __int16 *result, void *a2)
{
  int v140 = result;
  if (a2[2])
  {
    uint64_t v2 = 0;
    uint64_t v138 = *((void *)result + 31);
    unsigned int v139 = a2;
    unint64_t v3 = *(void *)result;
    unint64_t v4 = *((void *)result + 1);
    int32x4_t v143 = vdupq_n_s32(0x7FFF6Fu);
    int32x4_t v144 = vdupq_n_s32(0xFF7FFF70);
    while (1)
    {
      uint64_t v137 = v2;
      uint64_t v134 = a2[3] * v2;
      uint64_t v7 = a2[6] + 144 * v134;
      long long v8 = *(_WORD **)(v7 + 72);
      uint64_t v9 = *(void *)(v138 + 48) + 144 * v134;
      long long v10 = *(__int16 **)(v9 + 72);
      uint64_t v11 = *(void *)(v7 + 40);
      uint64_t v12 = *(void *)(v9 + 40);
      unsigned int v13 = v140[24];
      int v147 = v8;
      int v148 = v8;
      uint64_t v133 = v11;
      unsigned int v149 = &v8[v11];
      unint64_t v14 = v3;
      sub_2194F2370((uint64_t)&v147, v10, 0, v3, v13);
      unint64_t v136 = v4;
      unint64_t v15 = v4 - 1;
      int v16 = &v10[v12];
      unint64_t v142 = v14;
      if (v15 >= 2)
      {
        uint64_t v17 = v133;
        unsigned int v18 = v14 - 1;
        LOWORD(v19) = *v8;
        unint64_t v145 = (v14 - 3);
        uint64_t v20 = 2 * ((v145 + 1) & 0x1FFFFFFF8);
        int v141 = (v14 - 2) & 0xFFFFFFF8 | 1;
        int32x4_t v21 = vdupq_n_s32(v13);
        uint64_t v22 = 2 * v12;
        uint64_t v23 = (uint64_t)&v8[2 * v133 + 1];
        uint64_t v24 = (uint64_t)&v8[v133 + 1];
        uint64_t v25 = 1;
        v26.i64[0] = 0x1000000010;
        v26.i64[1] = 0x1000000010;
        v27.i64[0] = 0x8000800080008000;
        v27.i64[1] = 0x8000800080008000;
        uint64_t v28 = v133;
        while (1)
        {
          unsigned __int16 v33 = v19;
          int v34 = &v8[v17];
          int v35 = &v8[2 * v133];
          unsigned int v19 = (unsigned __int16)v8[v133];
          unsigned int v37 = &v8[v17 + 1];
          int v36 = *v37;
          int v39 = *v35;
          int v38 = v35 + 1;
          int v40 = (-3 * v19 + v36 + v33 + v39) * v13;
          unsigned int v41 = (((v40 + 16) >> 5) + 4) >> 3;
          if (v40 > 8388463) {
            LOWORD(v41) = 0x7FFF;
          }
          if (v40 < -8388752) {
            LOWORD(v41) = 0x8000;
          }
          __int16 *v16 = v41;
          unsigned int v42 = v16 + 1;
          int v43 = v8 + 1;
          if (v18 >= 2) {
            break;
          }
          __int32 v29 = v19;
LABEL_8:
          int v30 = (v29 + v36 - 4 * v36 + *v43 + *v38) * v13;
          unsigned int v31 = (((v30 + 16) >> 5) + 4) >> 3;
          if (v30 > 8388463) {
            LOWORD(v31) = 0x7FFF;
          }
          if (v30 >= -8388752) {
            __int16 v32 = v31;
          }
          else {
            __int16 v32 = 0x8000;
          }
          __int16 *v42 = v32;
          ++v25;
          int v16 = (__int16 *)((char *)v16 + v22);
          v23 += v17 * 2;
          v24 += v17 * 2;
          long long v8 = v34;
          if (v25 == v15) {
            goto LABEL_35;
          }
        }
        if (v145 >= 7)
        {
          unint64_t v47 = 0;
          int v43 = (unsigned __int16 *)((char *)v43 + v20);
          unsigned int v37 = (unsigned __int16 *)((char *)v37 + v20);
          int v38 = (unsigned __int16 *)((char *)v38 + v20);
          unsigned int v42 = (__int16 *)((char *)v42 + v20);
          int8x16_t v48 = (int8x16_t)vdupq_n_s16(v19);
          int v46 = &v34[(unint64_t)v20 / 2];
          do
          {
            int8x16_t v49 = v48;
            int8x16_t v48 = *(int8x16_t *)(v24 + v47);
            uint16x8_t v50 = (uint16x8_t)vextq_s8(v49, v48, 0xEuLL);
            uint16x8_t v51 = *(uint16x8_t *)(v24 + v47 + 2);
            uint16x8_t v52 = *(uint16x8_t *)&v8[v47 / 2 + 1];
            uint16x8_t v53 = *(uint16x8_t *)(v23 + v47);
            int32x4_t v54 = (int32x4_t)vaddl_high_u16(v51, v50);
            int32x4_t v55 = (int32x4_t)vaddl_u16(*(uint16x4_t *)v51.i8, *(uint16x4_t *)v50.i8);
            int32x4_t v56 = vmulq_s32((int32x4_t)vaddw_high_u16(vaddw_high_u16((uint32x4_t)vsubq_s32(v54, (int32x4_t)vshll_high_n_u16((uint16x8_t)v48, 2uLL)), v52), v53), v21);
            int32x4_t v57 = vmulq_s32((int32x4_t)vaddw_u16(vaddw_u16((uint32x4_t)vsubq_s32(v55, (int32x4_t)vshll_n_u16(*(uint16x4_t *)v48.i8, 2uLL)), *(uint16x4_t *)v52.i8), *(uint16x4_t *)v53.i8), v21);
            int32x4_t v58 = (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(v57, v26), 5uLL);
            int8x16_t v59 = (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_s32(v144, v57), (int16x8_t)vcgtq_s32(v144, v56));
            int8x16_t v60 = (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_s32(v57, v143), (int16x8_t)vcgtq_s32(v56, v143));
            *(int8x16_t *)&v16[v47 / 2 + 1] = vbslq_s8(v59, v27, vorrq_s8((int8x16_t)(*(_OWORD *)&v60 & __PAIR128__(0x7FFF7FFF7FFF7FFFLL, 0x7FFF7FFF7FFF7FFFLL)), vbicq_s8((int8x16_t)vrshrn_high_n_s32(vrshrn_n_s32(v58, 3uLL), (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(v56, v26), 5uLL), 3uLL), v60)));
            v47 += 16;
          }
          while (((2 * (v145 + 1)) & 0x3FFFFFFF0) != v47);
          if (v145 + 1 == ((v145 + 1) & 0x1FFFFFFF8))
          {
            __int32 v29 = vmovl_high_u16(*(uint16x8_t *)&v48).i32[3];
LABEL_33:
            uint64_t v28 = v133;
            int v36 = *v37;
            goto LABEL_8;
          }
          unsigned __int16 v45 = v48.u16[7];
          int v44 = v141;
        }
        else
        {
          int v44 = 1;
          unsigned __int16 v45 = v19;
          int v46 = &v8[v17];
        }
        unsigned int v61 = v18 - v44;
        do
        {
          int v62 = (unsigned __int16)v46[2];
          int v46 = v37;
          __int32 v63 = *v37++;
          __int32 v29 = v63;
          int v65 = *v43++;
          int v64 = v65;
          int v66 = *v38++;
          int v67 = (v62 + v45 - 4 * v29 + v64 + v66) * v13;
          unsigned int v68 = (((v67 + 16) >> 5) + 4) >> 3;
          if (v67 > 8388463) {
            LOWORD(v68) = 0x7FFF;
          }
          if (v67 >= -8388752) {
            __int16 v69 = v68;
          }
          else {
            __int16 v69 = 0x8000;
          }
          *v42++ = v69;
          unsigned __int16 v45 = v29;
          --v61;
        }
        while (v61);
        goto LABEL_33;
      }
      int v34 = v8;
      uint64_t v28 = v133;
LABEL_35:
      int v147 = v34;
      int v148 = &v34[v28];
      unsigned int v149 = v148;
      sub_2194F2370((uint64_t)&v147, v16, 0, v142, v13);
      uint64_t v70 = 144 * v134 + 144;
      uint64_t v71 = v139[6] + v70;
      int v72 = *(_WORD **)(v71 + 72);
      uint64_t v73 = *(void *)(v138 + 48) + v70;
      int v74 = *(__int16 **)(v73 + 72);
      uint64_t v75 = *(void *)(v71 + 40);
      unint64_t v76 = v15;
      uint64_t v77 = *(void *)(v73 + 40);
      unsigned int v78 = v140[25];
      int v147 = v72;
      int v148 = v72;
      uint64_t v135 = v75;
      unsigned int v149 = &v72[v75];
      sub_2194F2370((uint64_t)&v147, v74, 0, v142, v78);
      uint64_t v79 = v77;
      int v80 = &v74[v77];
      if (v76 >= 2) {
        break;
      }
      long long v5 = v72;
      uint64_t v6 = v135;
LABEL_4:
      int v147 = v5;
      int v148 = &v5[v6];
      unsigned int v149 = v148;
      uint64_t result = sub_2194F2370((uint64_t)&v147, v80, 0, v142, v78);
      unint64_t v3 = (v142 + 1) >> 1;
      unint64_t v4 = (v136 + 1) >> 1;
      uint64_t v2 = v137 + 1;
      a2 = v139;
      if ((unint64_t)(v137 + 1) >= v139[2]) {
        return result;
      }
    }
    unint64_t v81 = v76;
    uint64_t v82 = v135;
    unsigned int v83 = v142 - 1;
    LOWORD(v84) = *v72;
    unint64_t v146 = (v142 - 3);
    uint64_t v85 = 2 * ((v146 + 1) & 0x1FFFFFFF8);
    int32x4_t v86 = vdupq_n_s32(v78);
    uint64_t v87 = 2 * v79;
    uint64_t v88 = (uint64_t)&v72[2 * v135 + 1];
    uint64_t v89 = (uint64_t)&v72[v135 + 1];
    uint64_t v90 = 1;
    uint64_t v6 = v135;
    while (1)
    {
      unsigned __int16 v95 = v84;
      long long v5 = &v72[v82];
      int v96 = &v72[2 * v135];
      unsigned int v84 = (unsigned __int16)v72[v135];
      int v98 = &v72[v82 + 1];
      int v97 = *v98;
      int v100 = *v96;
      int v99 = v96 + 1;
      int v101 = (-3 * v84 + v97 + v95 + v100) * v78;
      unsigned int v102 = (((v101 + 16) >> 5) + 4) >> 3;
      if (v101 > 8388463) {
        LOWORD(v102) = 0x7FFF;
      }
      if (v101 < -8388752) {
        LOWORD(v102) = 0x8000;
      }
      *int v80 = v102;
      unsigned int v103 = v80 + 1;
      int v104 = v72 + 1;
      if (v83 >= 2) {
        break;
      }
      __int32 v91 = v84;
LABEL_38:
      int v92 = (v91 + v97 - 4 * v97 + *v104 + *v99) * v78;
      unsigned int v93 = (((v92 + 16) >> 5) + 4) >> 3;
      if (v92 > 8388463) {
        LOWORD(v93) = 0x7FFF;
      }
      if (v92 >= -8388752) {
        __int16 v94 = v93;
      }
      else {
        __int16 v94 = 0x8000;
      }
      *unsigned int v103 = v94;
      ++v90;
      int v80 = (__int16 *)((char *)v80 + v87);
      v88 += v82 * 2;
      v89 += v82 * 2;
      int v72 = v5;
      if (v90 == v81) {
        goto LABEL_4;
      }
    }
    if (v146 >= 7)
    {
      unint64_t v108 = 0;
      int v104 = (unsigned __int16 *)((char *)v104 + v85);
      int v98 = (unsigned __int16 *)((char *)v98 + v85);
      int v99 = (unsigned __int16 *)((char *)v99 + v85);
      unsigned int v103 = (__int16 *)((char *)v103 + v85);
      int8x16_t v109 = (int8x16_t)vdupq_n_s16(v84);
      int v107 = &v5[(unint64_t)v85 / 2];
      v110.i64[0] = 0x1000000010;
      v110.i64[1] = 0x1000000010;
      v111.i64[0] = 0x8000800080008000;
      v111.i64[1] = 0x8000800080008000;
      do
      {
        int8x16_t v112 = v109;
        int8x16_t v109 = *(int8x16_t *)(v89 + v108);
        uint16x8_t v113 = (uint16x8_t)vextq_s8(v112, v109, 0xEuLL);
        uint16x8_t v114 = *(uint16x8_t *)(v89 + v108 + 2);
        uint16x8_t v115 = *(uint16x8_t *)&v72[v108 / 2 + 1];
        uint16x8_t v116 = *(uint16x8_t *)(v88 + v108);
        int32x4_t v117 = (int32x4_t)vaddl_high_u16(v114, v113);
        int32x4_t v118 = (int32x4_t)vaddl_u16(*(uint16x4_t *)v114.i8, *(uint16x4_t *)v113.i8);
        int32x4_t v119 = vmulq_s32((int32x4_t)vaddw_high_u16(vaddw_high_u16((uint32x4_t)vsubq_s32(v117, (int32x4_t)vshll_high_n_u16((uint16x8_t)v109, 2uLL)), v115), v116), v86);
        int32x4_t v120 = vmulq_s32((int32x4_t)vaddw_u16(vaddw_u16((uint32x4_t)vsubq_s32(v118, (int32x4_t)vshll_n_u16(*(uint16x4_t *)v109.i8, 2uLL)), *(uint16x4_t *)v115.i8), *(uint16x4_t *)v116.i8), v86);
        int32x4_t v121 = (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(v120, v110), 5uLL);
        int8x16_t v122 = (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_s32(v144, v120), (int16x8_t)vcgtq_s32(v144, v119));
        int8x16_t v123 = (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_s32(v120, v143), (int16x8_t)vcgtq_s32(v119, v143));
        *(int8x16_t *)&v80[v108 / 2 + 1] = vbslq_s8(v122, v111, vorrq_s8((int8x16_t)(*(_OWORD *)&v123 & __PAIR128__(0x7FFF7FFF7FFF7FFFLL, 0x7FFF7FFF7FFF7FFFLL)), vbicq_s8((int8x16_t)vrshrn_high_n_s32(vrshrn_n_s32(v121, 3uLL), (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(v119, v110), 5uLL), 3uLL), v123)));
        v108 += 16;
      }
      while (((2 * (v146 + 1)) & 0x3FFFFFFF0) != v108);
      if (v146 + 1 == ((v146 + 1) & 0x1FFFFFFF8))
      {
        __int32 v91 = vmovl_high_u16(*(uint16x8_t *)&v109).i32[3];
LABEL_63:
        uint64_t v6 = v135;
        int v97 = *v98;
        goto LABEL_38;
      }
      unsigned __int16 v106 = v109.u16[7];
      int v105 = (v142 - 2) & 0xFFFFFFF8 | 1;
    }
    else
    {
      int v105 = 1;
      unsigned __int16 v106 = v84;
      int v107 = &v72[v82];
    }
    unsigned int v124 = v83 - v105;
    do
    {
      int v125 = (unsigned __int16)v107[2];
      int v107 = v98;
      __int32 v126 = *v98++;
      __int32 v91 = v126;
      int v128 = *v104++;
      int v127 = v128;
      int v129 = *v99++;
      int v130 = (v125 + v106 - 4 * v91 + v127 + v129) * v78;
      unsigned int v131 = (((v130 + 16) >> 5) + 4) >> 3;
      if (v130 > 8388463) {
        LOWORD(v131) = 0x7FFF;
      }
      if (v130 >= -8388752) {
        __int16 v132 = v131;
      }
      else {
        __int16 v132 = 0x8000;
      }
      *v103++ = v132;
      unsigned __int16 v106 = v91;
      --v124;
    }
    while (v124);
    goto LABEL_63;
  }
  return result;
}

void sub_2194F047C(uint64_t a1, unsigned int a2)
{
  uint64_t v88 = *(void *)(a1 + 248);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint16x8_t v114 = 0;
  uint16x8_t v115 = 0;
  uint16x8_t v116 = 0;
  int8x16_t v111 = 0;
  int8x16_t v112 = 0;
  uint16x8_t v113 = 0;
  unint64_t v6 = *(void *)(a1 + 8) * *(void *)a1;
  if (v6)
  {
    if (v6 > 0xCCCCCCCCCCCCCCCLL) {
      goto LABEL_122;
    }
    uint64_t v7 = (char *)operator new(20 * v6);
    long long v8 = &v7[20 * v6];
    int8x16_t v111 = v7;
    int8x16_t v112 = v7;
    uint16x8_t v113 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    long long v8 = 0;
  }
  unint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((v8 - v7) >> 2);
  if (v9 < 4) {
    goto LABEL_8;
  }
  if (v9 >= 0x3333333333333334) {
LABEL_122:
  }
    sub_219486AE4();
  unint64_t v10 = v9 >> 2;
  uint16x8_t v114 = (char *)operator new(20 * (v9 >> 2));
  uint16x8_t v115 = v114;
  uint16x8_t v116 = &v114[20 * v10];
LABEL_8:
  uint64_t v11 = *(uint64_t **)(a1 + 256);
  v11[17] = 0;
  v11[18] = 0;
  unint64_t v12 = v11[1];
  if (v12 <= 1) {
    unint64_t v12 = 1;
  }
  v11[19] = v12 - 1;
  unsigned int v13 = (void *)v11[20];
  uint64_t v14 = v11[21] - (void)v13;
  if (v14 >= 1) {
    bzero(v13, 8 * (((unint64_t)v14 >> 3) - ((unint64_t)v14 > 7)) + 8);
  }
  unint64_t v15 = v5 * v4;
  v11[23] = 0;
  v11[24] = 0;
  uint64_t v16 = *v11;
  if (*v11)
  {
    uint64_t v17 = v11[25];
    if (v16 == 1)
    {
      unint64_t v18 = 0;
LABEL_18:
      uint64_t v22 = v16 - v18;
      uint64_t v23 = (void *)(v17 + 24 * v18 + 8);
      do
      {
        *uint64_t v23 = *(v23 - 1);
        v23 += 3;
        --v22;
      }
      while (v22);
      goto LABEL_20;
    }
    unint64_t v18 = v16 & 0xFFFFFFFFFFFFFFFELL;
    unsigned int v19 = (uint64_t *)(v17 + 24);
    unint64_t v20 = v16 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      uint64_t v21 = *v19;
      *(v19 - 2) = *(v19 - 3);
      v19[1] = v21;
      v19 += 6;
      v20 -= 2;
    }
    while (v20);
    if (v16 != v18) {
      goto LABEL_18;
    }
  }
LABEL_20:
  uint64_t v24 = (void *)v11[28];
  uint64_t v25 = v11[29] - (void)v24;
  if (v25 >= 1) {
    bzero(v24, 8 * (((unint64_t)v25 >> 3) - ((unint64_t)v25 > 7)) + 8);
  }
  if (v15)
  {
    unint64_t v26 = 0;
    unint64_t v27 = v15 - 1;
    uint64_t v86 = a2;
    unint64_t v87 = v15;
    unint64_t v94 = v15 - 1;
    while (1)
    {
      uint64_t v28 = *(void *)(v88 + 48);
      uint64_t v29 = v26 | 1;
      uint64_t v30 = *(void *)(v28 + 144 * v26 + 32);
      if (v30 != *(void *)(v28 + 144 * (v26 | 1) + 32)) {
        break;
      }
      uint64_t v31 = *(void *)(v28 + 144 * v26 + 48);
      if (v31 != *(void *)(v28 + 144 * v29 + 48))
      {
        sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/ResponseMapAndKPCGenerator.cpp", 105, "lap_scale0.height() == lap_scale1.height() && \"image height mismatch\"", (void (*)(void *))sub_2194FF9C0);
        goto LABEL_121;
      }
      uint64_t v32 = *(void *)(a1 + 192);
      if (v32 == 1)
      {
        int v33 = v30 - 1;
        int v34 = v31 - 1;
        int v35 = 1;
        BOOL v36 = (int)v31 - 1 > 1 && v33 > 1;
        uint64_t v101 = v26 | 1;
        if (v36) {
          goto LABEL_59;
        }
        goto LABEL_49;
      }
      uint64_t v37 = 40 * v86 + 8 * (v26 >> 1);
      int v38 = (int *)(*(void *)(a1 + 200) + v37);
      int v39 = *v38;
      unsigned int v40 = v38[1];
      if (*v38 <= 1) {
        int v35 = 1;
      }
      else {
        int v35 = *v38;
      }
      unsigned int v41 = (_DWORD *)(*(void *)(a1 + 224) + v37);
      int v42 = v41[1];
      int v43 = *v41 + v39;
      int v44 = v30 - 1;
      if (v44 >= v43) {
        int v33 = v43;
      }
      else {
        int v33 = v44;
      }
      if (v40 <= 1) {
        LODWORD(v32) = 1;
      }
      else {
        LODWORD(v32) = v40;
      }
      int v34 = v42 + v40;
      int v45 = v31 - 1;
      if (v45 < (int)(v42 + v40)) {
        int v34 = v45;
      }
      BOOL v46 = (int)v32 < v34 && v35 < v33;
      uint64_t v101 = v26 | 1;
      if (v46)
      {
LABEL_59:
        unint64_t v100 = v26 >> 1;
        unsigned __int16 v95 = (void *)(v28 + 144 * v26 + 120);
        unint64_t v92 = v26;
        unsigned int v93 = (void *)(v28 + 144 * v29 + 120);
        uint64_t v56 = (int)v32;
        uint64_t v89 = v34;
        uint64_t v90 = v35;
        int v96 = v33;
        do
        {
          uint64_t v57 = 8 * v56 - 8;
          uint64_t v58 = *(void *)(*v95 + v57);
          uint64_t v105 = *(void *)(*v95 + 8 * v56);
          uint64_t v91 = v56 + 1;
          uint64_t v59 = 8 * (v56 + 1);
          uint64_t v104 = *(void *)(*v95 + v59);
          uint64_t v102 = *(void *)(*v93 + 8 * v56);
          uint64_t v103 = *(void *)(*v93 + v57);
          uint64_t v60 = *(void *)(*v93 + v59);
          uint64_t v61 = v90;
          int v97 = v56 << v100;
          uint64_t v98 = v58;
          uint64_t v99 = v56;
          do
          {
            char v110 = 0;
            if (v26
              && sub_2194F2708(v58, v105, v104, v103, v102, v60, v61, *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60), &v110, *(unsigned char *)(a1 + 52)))
            {
              int v63 = *(__int16 *)(*(void *)(*v95 + 8 * v56) + 2 * v61);
              int v64 = v61 << v100;
              char v65 = v110;
              int v66 = v115;
              if (v115 < v116)
              {
                *(_DWORD *)uint16x8_t v115 = v64;
                *((_DWORD *)v66 + 1) = v97;
                *((_DWORD *)v66 + 2) = v26;
                v66[12] = v65;
                int v67 = v66 + 20;
                *((_DWORD *)v66 + 4) = v63;
                int v33 = v96;
                uint64_t v58 = v98;
                uint64_t v56 = v99;
LABEL_85:
                uint16x8_t v115 = v67;
                uint64_t v29 = v101;
                goto LABEL_86;
              }
              unsigned int v68 = v114;
              unint64_t v69 = 0xCCCCCCCCCCCCCCCDLL * ((v115 - v114) >> 2) + 1;
              if (v69 > 0xCCCCCCCCCCCCCCCLL) {
                sub_219486AE4();
              }
              if (0x999999999999999ALL * ((v116 - v114) >> 2) > v69) {
                unint64_t v69 = 0x999999999999999ALL * ((v116 - v114) >> 2);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((v116 - v114) >> 2) >= 0x666666666666666) {
                unint64_t v70 = 0xCCCCCCCCCCCCCCCLL;
              }
              else {
                unint64_t v70 = v69;
              }
              if (v70)
              {
                if (v70 > 0xCCCCCCCCCCCCCCCLL) {
                  sub_219486AFC();
                }
                uint64_t v71 = (char *)operator new(20 * v70);
              }
              else
              {
                uint64_t v71 = 0;
              }
              int v72 = &v71[4 * ((v66 - v68) >> 2)];
              *(_DWORD *)int v72 = v64;
              *((_DWORD *)v72 + 1) = v97;
              unint64_t v26 = v92;
              *((_DWORD *)v72 + 2) = v92;
              v72[12] = v65;
              *((_DWORD *)v72 + 4) = v63;
              uint64_t v73 = v72;
              if (v66 == v68)
              {
                uint64_t v58 = v98;
                uint64_t v56 = v99;
                int v67 = v72 + 20;
                uint16x8_t v114 = v72;
                uint16x8_t v115 = v72 + 20;
                uint16x8_t v116 = &v71[20 * v70];
                if (v66) {
                  goto LABEL_83;
                }
              }
              else
              {
                uint64_t v58 = v98;
                uint64_t v56 = v99;
                do
                {
                  long long v74 = *(_OWORD *)(v66 - 20);
                  *((_DWORD *)v73 - 1) = *((_DWORD *)v66 - 1);
                  *(_OWORD *)(v73 - 20) = v74;
                  v73 -= 20;
                  v66 -= 20;
                }
                while (v66 != v68);
                int v66 = v114;
                int v67 = v72 + 20;
                uint16x8_t v114 = v73;
                uint16x8_t v115 = v72 + 20;
                uint16x8_t v116 = &v71[20 * v70];
                if (v66) {
LABEL_83:
                }
                  operator delete(v66);
              }
              unint64_t v27 = v94;
              int v33 = v96;
              goto LABEL_85;
            }
LABEL_86:
            if (v29 != v27
              && sub_2194F2708(v103, v102, v60, v58, v105, v104, v61, *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60), &v110, *(unsigned char *)(a1 + 52)))
            {
              int v75 = *(__int16 *)(*(void *)(*v93 + 8 * v56) + 2 * v61);
              int v76 = v61 << v100;
              char v77 = v110;
              unsigned int v78 = v112;
              if (v112 < v113)
              {
                *(_DWORD *)int8x16_t v112 = v76;
                *((_DWORD *)v78 + 1) = v97;
                *((_DWORD *)v78 + 2) = v29;
                v78[12] = v77;
                int v62 = v78 + 20;
                *((_DWORD *)v78 + 4) = v75;
                int v33 = v96;
                uint64_t v58 = v98;
                uint64_t v56 = v99;
              }
              else
              {
                uint64_t v79 = v111;
                unint64_t v80 = 0xCCCCCCCCCCCCCCCDLL * ((v112 - v111) >> 2) + 1;
                if (v80 > 0xCCCCCCCCCCCCCCCLL) {
                  sub_219486AE4();
                }
                if (0x999999999999999ALL * ((v113 - v111) >> 2) > v80) {
                  unint64_t v80 = 0x999999999999999ALL * ((v113 - v111) >> 2);
                }
                if (0xCCCCCCCCCCCCCCCDLL * ((v113 - v111) >> 2) >= 0x666666666666666) {
                  unint64_t v81 = 0xCCCCCCCCCCCCCCCLL;
                }
                else {
                  unint64_t v81 = v80;
                }
                if (v81)
                {
                  if (v81 > 0xCCCCCCCCCCCCCCCLL) {
                    sub_219486AFC();
                  }
                  uint64_t v82 = (char *)operator new(20 * v81);
                }
                else
                {
                  uint64_t v82 = 0;
                }
                unsigned int v83 = &v82[4 * ((v78 - v79) >> 2)];
                *(_DWORD *)unsigned int v83 = v76;
                *((_DWORD *)v83 + 1) = v97;
                *((_DWORD *)v83 + 2) = v101;
                v83[12] = v77;
                *((_DWORD *)v83 + 4) = v75;
                unsigned int v84 = v83;
                if (v78 == v79)
                {
                  unint64_t v26 = v92;
                  uint64_t v58 = v98;
                  uint64_t v56 = v99;
                  int v62 = v83 + 20;
                  int8x16_t v111 = v83;
                  int8x16_t v112 = v83 + 20;
                  uint16x8_t v113 = &v82[20 * v81];
                  if (v78) {
                    goto LABEL_105;
                  }
                }
                else
                {
                  unint64_t v26 = v92;
                  uint64_t v58 = v98;
                  uint64_t v56 = v99;
                  do
                  {
                    long long v85 = *(_OWORD *)(v78 - 20);
                    *((_DWORD *)v84 - 1) = *((_DWORD *)v78 - 1);
                    *(_OWORD *)(v84 - 20) = v85;
                    v84 -= 20;
                    v78 -= 20;
                  }
                  while (v78 != v79);
                  unsigned int v78 = v111;
                  int v62 = v83 + 20;
                  int8x16_t v111 = v84;
                  int8x16_t v112 = v83 + 20;
                  uint16x8_t v113 = &v82[20 * v81];
                  if (v78) {
LABEL_105:
                  }
                    operator delete(v78);
                }
                unint64_t v27 = v94;
                int v33 = v96;
              }
              int8x16_t v112 = v62;
              uint64_t v29 = v101;
            }
            ++v61;
          }
          while (v33 != v61);
          uint64_t v56 = v91;
        }
        while (v91 != v89);
      }
LABEL_49:
      if (v26)
      {
        unint64_t v47 = v114;
        for (uint64_t i = v115; v47 != i; v47 += 20)
        {
          int8x16_t v49 = *(void **)(a1 + 256);
          int v50 = *((_DWORD *)v47 + 4);
          long long v108 = *(_OWORD *)v47;
          int v109 = v50;
          sub_2194F0D58(v49, &v108, v26 - 1, *((unsigned int *)v47 + 1) >> (v26 >> 1), 1);
        }
      }
      if (v101 != v94)
      {
        uint16x8_t v51 = v111;
        for (j = v112; v51 != j; v51 += 20)
        {
          uint16x8_t v53 = *(void **)(a1 + 256);
          int v54 = *((_DWORD *)v51 + 4);
          long long v106 = *(_OWORD *)v51;
          int v107 = v54;
          sub_2194F0D58(v53, &v106, v26, *((unsigned int *)v51 + 1) >> (v26 >> 1), 1);
        }
      }
      if (v115 != v114) {
        uint16x8_t v115 = v114;
      }
      int32x4_t v55 = v111;
      if (v112 != v111) {
        int8x16_t v112 = v111;
      }
      v26 += 2;
      unint64_t v27 = v94;
      if (v26 >= v87) {
        goto LABEL_110;
      }
    }
    sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/ResponseMapAndKPCGenerator.cpp", 104, "lap_scale0.width() == lap_scale1.width() && \"image width mismatch\"", (void (*)(void *))sub_2194FF9C0);
LABEL_121:
    abort();
  }
  int32x4_t v55 = v111;
LABEL_110:
  if (v55)
  {
    int8x16_t v112 = v55;
    operator delete(v55);
  }
  if (v114)
  {
    uint16x8_t v115 = v114;
    operator delete(v114);
  }
}

void sub_2194F0CFC(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)(v1 - 136);
  if (v3)
  {
    *(void *)(v1 - 128) = v3;
    operator delete(v3);
    uint64_t v4 = *(void **)(v1 - 112);
    if (!v4) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    uint64_t v4 = *(void **)(v1 - 112);
    if (!v4) {
      goto LABEL_3;
    }
  }
  *(void *)(v1 - 104) = v4;
  operator delete(v4);
  _Unwind_Resume(exception_object);
}

void sub_2194F0D58(void *a1, long long *a2, unint64_t a3, unint64_t a4, int a5)
{
  if (a1[24] >= a3)
  {
    unint64_t v12 = a1[23];
    if (v12 >= a4) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v13 = a1[17];
    uint64_t v14 = a1[18];
    uint64_t v16 = a1[19];
    uint64_t v15 = a1[20];
    a1[23] = v12 + 1;
    a1[18] = v14 + v13;
    a1[19] = v16 + 1;
    *(void *)(v15 + 8 * v16) = v13;
    uint64_t v17 = a1[18];
    for (uint64_t i = a1[19] % a1[a3 + 1]; ; uint64_t i = a1[19] % a1[a3 + 1])
    {
      a1[19] = i;
      a1[17] = 0;
      unint64_t v19 = v17 - *(void *)(v15 + 8 * i);
      a1[18] = v19;
      unint64_t v20 = a1[23];
      if (v20 >= a4) {
        break;
      }
      a1[23] = v20 + 1;
      a1[18] = v19;
      a1[19] = i + 1;
      *(void *)(v15 + 8 * i) = 0;
      uint64_t v17 = a1[18];
    }
    if (v19 >= a1[a3 + 9]) {
      return;
    }
    goto LABEL_12;
  }
  a1[24] = a3;
  unint64_t v10 = (void *)a1[20];
  uint64_t v11 = a1[21] - (void)v10;
  if (v11 >= 1) {
    bzero(v10, 8 * (((unint64_t)v11 >> 3) - ((unint64_t)v11 > 7)) + 8);
  }
  unint64_t v12 = 0;
  a1[23] = 0;
  a1[18] = 0;
  a1[19] = 0;
  a1[17] = 0;
  if (a4) {
    goto LABEL_8;
  }
LABEL_5:
  if (a1[17] + a1[18] >= a1[a3 + 9]) {
    return;
  }
LABEL_12:
  if (a5)
  {
    uint64_t v21 = (char **)(a1[25] + 24 * a3);
    uint64_t v23 = v21 + 1;
    uint64_t v22 = v21[1];
    unint64_t v24 = (unint64_t)v21[2];
    if ((unint64_t)v22 >= v24)
    {
      unint64_t v27 = *v21;
      unint64_t v28 = 0xCCCCCCCCCCCCCCCDLL * ((v22 - *v21) >> 2);
      unint64_t v29 = v28 + 1;
      if (v28 + 1 > 0xCCCCCCCCCCCCCCCLL) {
        sub_219486AE4();
      }
      unint64_t v30 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v24 - (void)v27) >> 2);
      if (2 * v30 > v29) {
        unint64_t v29 = 2 * v30;
      }
      if (v30 >= 0x666666666666666) {
        unint64_t v31 = 0xCCCCCCCCCCCCCCCLL;
      }
      else {
        unint64_t v31 = v29;
      }
      if (v31)
      {
        if (v31 > 0xCCCCCCCCCCCCCCCLL) {
          sub_219486AFC();
        }
        uint64_t v32 = (char *)operator new(20 * v31);
      }
      else
      {
        uint64_t v32 = 0;
      }
      int v33 = &v32[20 * v28];
      *(_OWORD *)int v33 = *a2;
      *((_DWORD *)v33 + 4) = *((_DWORD *)a2 + 4);
      unint64_t v26 = v33 + 20;
      if (v22 != v27)
      {
        do
        {
          long long v34 = *(_OWORD *)(v22 - 20);
          *((_DWORD *)v33 - 1) = *((_DWORD *)v22 - 1);
          *(_OWORD *)(v33 - 20) = v34;
          v33 -= 20;
          v22 -= 20;
        }
        while (v22 != v27);
        uint64_t v22 = *v21;
      }
      *uint64_t v21 = v33;
      *uint64_t v23 = v26;
      v21[2] = &v32[20 * v31];
      if (v22) {
        operator delete(v22);
      }
    }
    else
    {
      long long v25 = *a2;
      *((_DWORD *)v22 + 4) = *((_DWORD *)a2 + 4);
      *(_OWORD *)uint64_t v22 = v25;
      unint64_t v26 = v22 + 20;
    }
    *uint64_t v23 = v26;
  }
  ++a1[17];
  ++*(void *)(a1[28] + 8 * a3);
}

void sub_2194F1004(unsigned __int16 *a1, void *a2, unsigned int a3)
{
  sub_2194EFD44(a1, a2);

  sub_2194F047C((uint64_t)a1, a3);
}

void *sub_2194F1044(void *result)
{
  if (result[2])
  {
    if (result[3])
    {
      MEMORY[0x21D48B9F0](&v1, result[1], *result, 16, 0);
      operator new();
    }
  }
  return result;
}

void sub_2194F1830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v33 = *v29;
  if (*v29)
  {
    v30[16] = v33;
    operator delete(v33);
  }
  long long v34 = (std::__shared_weak_count *)v30[12];
  if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
    std::__shared_weak_count::__release_weak(v34);
  }
  int v35 = (std::__shared_weak_count *)v30[10];
  if (v35)
  {
    if (!atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  *(void *)(v28 + 56) = v30;
  sub_2194F19EC(&a28);
  sub_21947E0B8(v31 - 136);
  _Unwind_Resume(a1);
}

void sub_2194F1908(void *a1)
{
  __cxa_begin_catch(a1);
  free(v1);
  __cxa_rethrow();
}

void sub_2194F191C(_Unwind_Exception *a1)
{
}

void sub_2194F1930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,std::__shared_weak_count *a38,uint64_t a39,std::__shared_weak_count *a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44)
{
  if (__p)
  {
    a44 = (uint64_t)__p;
    operator delete(__p);
  }
  BOOL v46 = a40;
  if (a40 && !atomic_fetch_add(&a40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
    std::__shared_weak_count::__release_weak(v46);
  }
  unint64_t v47 = a38;
  if (a38)
  {
    if (!atomic_fetch_add(&a38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  sub_21947E0B8((uint64_t)&a26);
  sub_21947E0B8(v44 - 136);
  _Unwind_Resume(a1);
}

void *sub_2194F19EC(void *a1)
{
  *a1 = &unk_26CAD6C40;
  uint64_t v2 = (void *)a1[15];
  if (v2)
  {
    a1[16] = v2;
    operator delete(v2);
  }
  unint64_t v3 = (std::__shared_weak_count *)a1[12];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (std::__shared_weak_count *)a1[10];
    if (!v4) {
      return a1;
    }
  }
  else
  {
    uint64_t v4 = (std::__shared_weak_count *)a1[10];
    if (!v4) {
      return a1;
    }
  }
  if (atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_2194F1AEC(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

void sub_2194F1B24(uint64_t a1)
{
}

uint64_t sub_2194F1B2C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3vio16image_processing17ScaleSpacePyramidIsE23MakevImage_BufferSharedEPvEUlPsE_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3vio16image_processing17ScaleSpacePyramidIsE23MakevImage_BufferSharedEPvEUlPsE_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3vio16image_processing17ScaleSpacePyramidIsE23MakevImage_BufferSharedEPvEUlPsE_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3vio16image_processing17ScaleSpacePyramidIsE23MakevImage_BufferSharedEPvEUlPsE_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_2194F1BA0(void *a1)
{
  *a1 = &unk_26CAD6C40;
  uint64_t v2 = (void *)a1[15];
  if (v2)
  {
    a1[16] = v2;
    operator delete(v2);
  }
  unint64_t v3 = (std::__shared_weak_count *)a1[12];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (std::__shared_weak_count *)a1[10];
    if (!v4) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = (std::__shared_weak_count *)a1[10];
    if (!v4) {
      goto LABEL_9;
    }
  }
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
LABEL_9:

  JUMPOUT(0x21D48B5B0);
}

uint64_t sub_2194F1CAC(void *a1, uint64_t a2)
{
  unint64_t v3 = 0x8E38E38E38E38E39 * ((uint64_t)(a1[1] - *a1) >> 4);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x1C71C71C71C71C7) {
    sub_219486AE4();
  }
  if (0x1C71C71C71C71C72 * ((uint64_t)(a1[2] - *a1) >> 4) > v4) {
    unint64_t v4 = 0x1C71C71C71C71C72 * ((uint64_t)(a1[2] - *a1) >> 4);
  }
  if (0x8E38E38E38E38E39 * ((uint64_t)(a1[2] - *a1) >> 4) >= 0xE38E38E38E38E3) {
    unint64_t v6 = 0x1C71C71C71C71C7;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0x1C71C71C71C71C7) {
      sub_219486AFC();
    }
    uint64_t v7 = (char *)operator new(144 * v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v19 = (uint64_t)&v7[144 * v3];
  *((void *)&v20 + 1) = &v7[144 * v6];
  sub_2194F1E98(v19, a2);
  uint64_t v8 = 0;
  unint64_t v10 = (char *)*a1;
  for (uint64_t i = a1[1]; (char *)(i + v8) != v10; sub_2194F1FD0(v8 + v19, v8 + i))
    v8 -= 144;
  unint64_t v12 = (char *)*a1;
  uint64_t v11 = (char *)a1[1];
  *a1 = v19 + v8;
  *(void *)&long long v20 = v19 + 144;
  *(_OWORD *)(a1 + 1) = v20;
  if (v11 != v12)
  {
    uint64_t v13 = v11 - 144;
    uint64_t v14 = v11 - 144;
    uint64_t v15 = v11 - 144;
    do
    {
      uint64_t v16 = *(void (***)(char *))v15;
      v15 -= 144;
      (*v16)(v14);
      v13 -= 144;
      BOOL v17 = v14 == v12;
      uint64_t v14 = v15;
    }
    while (!v17);
  }
  if (v12) {
    operator delete(v12);
  }
  return v19 + 144;
}

void sub_2194F1E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_2194F1F60((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2194F1E98(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26CAD6C40;
  *(unsigned char *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(void *)(a1 + 120) = 0;
  *(_OWORD *)(a1 + 89) = 0u;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  unint64_t v3 = (void *)(a2 + 32);
  sub_2194B2750(a1, (long long *)(a2 + 72), *(void *)(a2 + 32), v3[1], v3[2], *(v3 - 2), *(v3 - 1), *((unsigned __int8 *)v3 - 24), v3 + 9);
  *unint64_t v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  return a1;
}

void sub_2194F1F3C(_Unwind_Exception *a1)
{
  unint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 128) = v4;
    operator delete(v4);
  }
  sub_21950A338(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2194F1F60(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    unint64_t v4 = *(void (***)(void))(i - 144);
    *(void *)(a1 + 16) = i - 144;
    (*v4)();
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_2194F1FD0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 8) = 0;
  *(void *)a1 = &unk_26CAD6C40;
  *(unsigned char *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 89) = 0u;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  uint64_t v3 = *(void *)(a2 + 80);
  *(void *)&long long v6 = *(void *)(a2 + 72);
  *((void *)&v6 + 1) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  sub_2194B2750(a1, &v6, *(void *)(a2 + 32), *(void *)(a2 + 40), *(void *)(a2 + 48), *(void *)(a2 + 16), *(void *)(a2 + 24), *(unsigned __int8 *)(a2 + 8), (uint64_t *)(a2 + 104));
  unint64_t v4 = (std::__shared_weak_count *)*((void *)&v6 + 1);
  if (!*((void *)&v6 + 1)
    || atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v6 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_2194F20E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  long long v6 = v5;
  sub_21947E0B8((uint64_t)va);
  uint64_t v8 = *v6;
  if (*v6)
  {
    *(void *)(v3 + 128) = v8;
    operator delete(v8);
  }
  sub_2194A65B0(v4);
  _Unwind_Resume(a1);
}

uint64_t sub_2194F2118(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  *(void *)a1 = 8;
  *(_OWORD *)(a1 + 200) = 0u;
  uint64_t v5 = a1 + 200;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  long long v6 = *a2;
  long long v7 = a2[1];
  long long v8 = a2[2];
  *(_OWORD *)(a1 + 56) = a2[3];
  *(_OWORD *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 24) = v7;
  *(_OWORD *)(a1 + 8) = v6;
  long long v9 = *a3;
  long long v10 = a3[1];
  long long v11 = a3[2];
  *(_OWORD *)(a1 + 120) = a3[3];
  *(_OWORD *)(a1 + 104) = v11;
  *(_OWORD *)(a1 + 88) = v10;
  *(_OWORD *)(a1 + 72) = v9;
  unint64_t v12 = a4 - 2;
  *(void *)a1 = a4 - 2;
  unint64_t v13 = *(void *)a2;
  unint64_t v14 = *((void *)a2 + 1);
  if (*(void *)a2 <= v14) {
    unint64_t v13 = *((void *)a2 + 1);
  }
  uint64_t v15 = 8 * (*(void *)a2 < v14);
  unint64_t v16 = *((void *)a2 + 2);
  unint64_t v17 = *((void *)a2 + 3);
  BOOL v18 = v13 >= v16;
  if (v13 <= v16) {
    unint64_t v13 = *((void *)a2 + 2);
  }
  if (!v18) {
    uint64_t v15 = 16;
  }
  BOOL v19 = v13 >= v17;
  if (v13 <= v17) {
    unint64_t v13 = *((void *)a2 + 3);
  }
  if (!v19) {
    uint64_t v15 = 24;
  }
  unint64_t v20 = *((void *)a2 + 4);
  unint64_t v21 = *((void *)a2 + 5);
  BOOL v22 = v13 >= v20;
  if (v13 <= v20) {
    unint64_t v13 = *((void *)a2 + 4);
  }
  if (!v22) {
    uint64_t v15 = 32;
  }
  BOOL v23 = v13 >= v21;
  if (v13 <= v21) {
    unint64_t v13 = *((void *)a2 + 5);
  }
  if (!v23) {
    uint64_t v15 = 40;
  }
  unint64_t v24 = *((void *)a2 + 6);
  BOOL v25 = v13 >= v24;
  if (v13 <= v24) {
    unint64_t v13 = *((void *)a2 + 6);
  }
  if (!v25) {
    uint64_t v15 = 48;
  }
  uint64_t v26 = a1 + 224;
  BOOL v18 = v13 >= *((void *)a2 + 7);
  uint64_t v27 = 56;
  if (v18) {
    uint64_t v27 = v15;
  }
  unint64_t v28 = *(void *)((char *)a2 + v27);
  uint64_t v41 = 0;
  if (v28)
  {
    sub_2194DE0F4(a1 + 160, v28, &v41);
    unint64_t v12 = *(void *)a1;
    uint64_t v30 = *(void *)(a1 + 200);
    uint64_t v29 = *(void *)(a1 + 208);
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v29 = 0;
  }
  unint64_t v31 = *(void *)(a1 + 8);
  if (v31 <= 1) {
    unint64_t v31 = 1;
  }
  *(void *)(a1 + 152) = v31 - 1;
  unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((v29 - v30) >> 3);
  if (v12 <= v32)
  {
    if (v12 < v32)
    {
      uint64_t v33 = v30 + 24 * v12;
      if (v29 != v33)
      {
        uint64_t v34 = v29;
        do
        {
          BOOL v36 = *(void **)(v34 - 24);
          v34 -= 24;
          int v35 = v36;
          if (v36)
          {
            *(void *)(v29 - 16) = v35;
            operator delete(v35);
          }
          uint64_t v29 = v34;
        }
        while (v34 != v33);
      }
      *(void *)(a1 + 208) = v33;
    }
  }
  else
  {
    sub_2194BC1C8(v5, v12 - v32);
  }
  unint64_t v37 = *(void *)a1;
  uint64_t v41 = 0;
  uint64_t v38 = *(void *)(a1 + 224);
  unint64_t v39 = (*(void *)(a1 + 232) - v38) >> 3;
  if (v37 <= v39)
  {
    if (v37 < v39) {
      *(void *)(a1 + 232) = v38 + 8 * v37;
    }
  }
  else
  {
    sub_2194DE0F4(v26, v37 - v39, &v41);
  }
  return a1;
}

void sub_2194F231C(_Unwind_Exception *a1)
{
  long long v6 = *v4;
  if (*v4)
  {
    *(void *)(v1 + 232) = v6;
    operator delete(v6);
    sub_21948B590(v3);
    long long v7 = *v2;
    if (!*v2) {
LABEL_3:
    }
      _Unwind_Resume(a1);
  }
  else
  {
    sub_21948B590(v3);
    long long v7 = *v2;
    if (!*v2) {
      goto LABEL_3;
    }
  }
  *(void *)(v1 + 168) = v7;
  operator delete(v7);
  _Unwind_Resume(a1);
}

unsigned __int16 *sub_2194F2370(uint64_t a1, __int16 *a2, unsigned int a3, int a4, unsigned int a5)
{
  uint64_t v5 = *(unsigned __int16 **)(a1 + 8 * a3);
  if (a3 + 1 <= 2) {
    unsigned int v6 = a3 + 1;
  }
  else {
    unsigned int v6 = 0;
  }
  long long v7 = *(unsigned __int16 **)(a1 + 8 * v6);
  unsigned int v8 = a3 + 2;
  if (a3 != 0 && a3 < 0xFFFFFFFE) {
    unsigned int v8 = a3 - 1;
  }
  uint64_t result = *(unsigned __int16 **)(a1 + 8 * v8);
  long long v11 = v7 + 1;
  int v10 = v7[1];
  unint64_t v12 = v5 + 1;
  unsigned int v13 = *v7;
  unint64_t v14 = (uint16x8_t *)(result + 1);
  int v15 = (-3 * v13 + v10 + *v5 + *result) * a5;
  unsigned int v16 = (((v15 + 16) >> 5) + 4) >> 3;
  if (v15 > 8388463) {
    LOWORD(v16) = 0x7FFF;
  }
  if (v15 >= -8388752) {
    __int16 v17 = v16;
  }
  else {
    __int16 v17 = 0x8000;
  }
  *a2 = v17;
  BOOL v18 = (int8x16_t *)(a2 + 1);
  if ((a4 - 1) >= 2)
  {
    uint64_t v19 = (a4 - 3);
    if (v19 >= 7)
    {
      uint64_t v21 = 2 * v19 + 4;
      BOOL v22 = (uint16x8_t *)((char *)a2 + v21);
      BOOL v23 = (int8x16_t *)((char *)result + v21);
      BOOL v25 = v18 < (int8x16_t *)((char *)v5 + v21) && v12 < (unsigned __int16 *)v22;
      BOOL v27 = v18 < v23 && v14 < v22;
      BOOL v28 = v11 >= (unsigned __int16 *)v22 || v18 >= (int8x16_t *)&v7[v19 + 3];
      int v20 = 1;
      if (v28 && !v25 && !v27)
      {
        uint64_t v29 = v19 + 1;
        uint64_t v30 = v29 & 0x1FFFFFFF8;
        unint64_t v31 = &v12[v30];
        long long v11 = (unsigned __int16 *)((char *)v11 + v30 * 2);
        uint64_t result = &v14->u16[v30];
        unint64_t v32 = (int8x16_t *)((char *)v18 + v30 * 2);
        uint64_t v33 = &v7[v30];
        int v20 = v29 & 0xFFFFFFF8 | 1;
        int8x16_t v34 = (int8x16_t)vdupq_n_s16(v13);
        int32x4_t v35 = vdupq_n_s32(a5);
        BOOL v36 = (uint16x8_t *)(v7 + 2);
        int32x4_t v37 = vdupq_n_s32(0xFF7FFF70);
        v38.i64[0] = 0x1000000010;
        v38.i64[1] = 0x1000000010;
        int32x4_t v39 = vdupq_n_s32(0x7FFF6Fu);
        v40.i64[0] = 0x8000800080008000;
        v40.i64[1] = 0x8000800080008000;
        uint64_t v41 = v29 & 0x1FFFFFFF8;
        do
        {
          int8x16_t v42 = v34;
          int8x16_t v34 = *(int8x16_t *)((char *)&v36[-1] + 14);
          uint16x8_t v43 = *v36++;
          uint16x8_t v44 = v43;
          uint16x8_t v45 = (uint16x8_t)vextq_s8(v42, v34, 0xEuLL);
          uint16x8_t v46 = *(uint16x8_t *)v12;
          v12 += 8;
          uint16x8_t v47 = v46;
          uint16x8_t v48 = *v14++;
          uint32x4_t v49 = vaddl_u16(*(uint16x4_t *)v44.i8, *(uint16x4_t *)v45.i8);
          int32x4_t v50 = vmulq_s32((int32x4_t)vaddw_high_u16((uint32x4_t)vsubq_s32((int32x4_t)vaddw_high_u16(vaddl_high_u16(v44, v45), v47), (int32x4_t)vshll_high_n_u16((uint16x8_t)v34, 2uLL)), v48), v35);
          int32x4_t v51 = vmulq_s32((int32x4_t)vaddw_u16((uint32x4_t)vsubq_s32((int32x4_t)vaddw_u16(v49, *(uint16x4_t *)v47.i8), (int32x4_t)vshll_n_u16(*(uint16x4_t *)v34.i8, 2uLL)), *(uint16x4_t *)v48.i8), v35);
          uint32x4_t v52 = (uint32x4_t)vaddq_s32(v50, v38);
          int16x8_t v53 = (int16x8_t)vcgtq_s32(v37, v50);
          int8x16_t v54 = (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_s32(v51, v39), (int16x8_t)vcgtq_s32(v50, v39));
          *v18++ = vbslq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_s32(v37, v51), v53), v40, vorrq_s8((int8x16_t)(*(_OWORD *)&v54 & __PAIR128__(0x7FFF7FFF7FFF7FFFLL, 0x7FFF7FFF7FFF7FFFLL)), vbicq_s8((int8x16_t)vrshrn_high_n_s32(vrshrn_n_s32((int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(v51, v38), 5uLL), 3uLL), (int32x4_t)vshrq_n_u32(v52, 5uLL), 3uLL), v54)));
          v41 -= 8;
        }
        while (v41);
        if (v29 == (v29 & 0x1FFFFFFF8))
        {
          unsigned int v13 = vmovl_high_u16(*(uint16x8_t *)&v34).u32[3];
LABEL_46:
          int v10 = *v11;
          BOOL v18 = v32;
          unint64_t v14 = (uint16x8_t *)result;
          unint64_t v12 = v31;
          goto LABEL_47;
        }
        LOWORD(v13) = v34.i16[7];
        unint64_t v12 = v31;
        unint64_t v14 = (uint16x8_t *)result;
        BOOL v18 = v32;
        long long v7 = v33;
      }
    }
    else
    {
      int v20 = 1;
    }
    int v55 = ~v20 + a4;
    unint64_t v31 = v12;
    uint64_t result = (unsigned __int16 *)v14;
    unint64_t v32 = v18;
    do
    {
      int v56 = v7[2];
      long long v7 = v11;
      unsigned int v58 = *v11++;
      unsigned int v57 = v58;
      int v60 = *v31++;
      int v59 = v60;
      int v61 = *result++;
      int v62 = (v56 + (unsigned __int16)v13 + v59 - 4 * v57 + v61) * a5;
      unsigned int v63 = (((v62 + 16) >> 5) + 4) >> 3;
      if (v62 > 8388463) {
        LOWORD(v63) = 0x7FFF;
      }
      if (v62 >= -8388752) {
        __int16 v64 = v63;
      }
      else {
        __int16 v64 = 0x8000;
      }
      v32->i16[0] = v64;
      unint64_t v32 = (int8x16_t *)((char *)v32 + 2);
      LOWORD(v13) = v57;
      --v55;
    }
    while (v55);
    unsigned int v13 = v57;
    goto LABEL_46;
  }
LABEL_47:
  int v65 = (v10 + v13 + *v12 + v14->u16[0] - 4 * v10) * a5;
  if (v65 <= 8388463) {
    unsigned int v66 = (((v65 + 16) >> 5) + 4) >> 3;
  }
  else {
    LOWORD(v66) = 0x7FFF;
  }
  if (v65 >= -8388752) {
    __int16 v67 = v66;
  }
  else {
    __int16 v67 = 0x8000;
  }
  v18->i16[0] = v67;
  return result;
}

BOOL sub_2194F2658(unint64_t *a1)
{
  BOOL v1 = a1[4] == 1 && a1[3] == 2;
  BOOL result = 0;
  if (v1)
  {
    unint64_t v2 = *a1;
    if (*a1 >= 0xA0)
    {
      unint64_t v3 = a1[1];
      if (v3 >= 0xA0)
      {
        BOOL v4 = v3 > 0x140 && v2 > 0x140;
        unint64_t v5 = a1[2];
        BOOL v6 = v4 || v5 == 4;
        if (v6 && (v2 < 0x141 || v3 < 0x141 || v5 == 5))
        {
          unint64_t v7 = a1[24];
          if (v7)
          {
            if (v7 == 1
              || 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a1[26] - a1[25]) >> 3) == v7
              && 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a1[29] - a1[28]) >> 3) == v7)
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_2194F2708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, __int16 a8, unsigned __int16 a9, char *a10, char a11)
{
  int v11 = *(__int16 *)(a2 + 2 * a7);
  if (v11 >= 0) {
    int v12 = *(__int16 *)(a2 + 2 * a7);
  }
  else {
    int v12 = -v11;
  }
  if (v12 <= a8) {
    return 0;
  }
  uint64_t v13 = a7;
  *a10 = 0;
  uint64_t v14 = a7 - 1;
  int v15 = *(__int16 *)(a1 + 2 * v14);
  int v16 = *(__int16 *)(a1 + 2 * a7);
  uint64_t v17 = a7 + 1;
  int v18 = *(__int16 *)(a1 + 2 * v17);
  if (v15 < v11 && v16 < v11 && v18 < v11)
  {
    int v21 = *(__int16 *)(a2 + 2 * v14);
    int v22 = *(__int16 *)(a2 + 2 * v17);
    if (v21 < v11 && v22 < v11)
    {
      int v28 = *(__int16 *)(a3 + 2 * v14);
      if (v28 < v11)
      {
        int v29 = *(__int16 *)(a3 + 2 * a7);
        if (v29 < v11)
        {
          int v30 = *(__int16 *)(a3 + 2 * v17);
          if (v30 < v11
            && *(__int16 *)(a4 + 2 * v14) < v11
            && *(__int16 *)(a4 + 2 * v13) < v11
            && *(__int16 *)(a4 + 2 * v17) < v11
            && *(__int16 *)(a5 + 2 * v14) < v11
            && *(__int16 *)(a5 + 2 * v13) < v11
            && *(__int16 *)(a5 + 2 * v17) < v11
            && *(__int16 *)(a6 + 2 * v14) < v11
            && *(__int16 *)(a6 + 2 * v13) < v11
            && *(__int16 *)(a6 + 2 * v17) < v11)
          {
            char v31 = 0;
            goto LABEL_56;
          }
        }
      }
    }
  }
  BOOL v24 = v15 <= v11 || v16 <= v11;
  if (v24 || v18 <= v11) {
    return 0;
  }
  int v21 = *(__int16 *)(a2 + 2 * v14);
  int v22 = *(__int16 *)(a2 + 2 * v17);
  BOOL result = 0;
  if (v21 <= v11 || v22 <= v11) {
    return result;
  }
  int v28 = *(__int16 *)(a3 + 2 * v14);
  if (v28 <= v11) {
    return result;
  }
  int v29 = *(__int16 *)(a3 + 2 * v13);
  if (v29 <= v11) {
    return result;
  }
  int v30 = *(__int16 *)(a3 + 2 * v17);
  if (v30 <= v11) {
    return result;
  }
  BOOL result = 0;
  if (*(__int16 *)(a4 + 2 * v14) <= v11) {
    return result;
  }
  if (*(__int16 *)(a4 + 2 * v13) <= v11) {
    return result;
  }
  if (*(__int16 *)(a4 + 2 * v17) <= v11) {
    return result;
  }
  BOOL result = 0;
  if (*(__int16 *)(a5 + 2 * v14) <= v11) {
    return result;
  }
  if (*(__int16 *)(a5 + 2 * v13) <= v11) {
    return result;
  }
  if (*(__int16 *)(a5 + 2 * v17) <= v11) {
    return result;
  }
  BOOL result = 0;
  if (*(__int16 *)(a6 + 2 * v14) <= v11 || *(__int16 *)(a6 + 2 * v13) <= v11 || *(__int16 *)(a6 + 2 * v17) <= v11) {
    return result;
  }
  char v31 = 1;
LABEL_56:
  *a10 = v31;
  if (!a11) {
    return 1;
  }
  int v32 = 2 * v11;
  int v33 = v22 - v32 + v21;
  int v34 = v16 - v32 + v29;
  int v35 = v15 - (v18 + v28) + v30;
  int v36 = v33 >> 4;
  int v37 = v34 >> 4;
  int v38 = v35 >> 4;
  if (v33 >> 4 <= -2047) {
    int v36 = -2047;
  }
  if (v33 >= 0x8000) {
    int v36 = 2047;
  }
  if (v37 <= -2047) {
    int v37 = -2047;
  }
  if (v34 >= 0x8000) {
    int v39 = 2047;
  }
  else {
    int v39 = v37;
  }
  if (v38 <= -2047) {
    int v38 = -2047;
  }
  if (v35 >= 0x8000) {
    int v40 = 2047;
  }
  else {
    int v40 = v38;
  }
  return fabs((double)(uint64_t)(v39 * (uint64_t)v36 - ((unint64_t)(v40 * (uint64_t)v40 + 8) >> 4))) * (double)a9 > (double)((v39 + (uint64_t)v36) * (v39 + (uint64_t)v36));
}

void sub_2194F2994(CVPixelBufferPoolRef pixelBufferPool)
{
  if (pixelBufferPool) {
    CVPixelBufferPoolRelease(pixelBufferPool);
  }
}

void sub_2194F29A0(void *a1)
{
  *a1 = 0;
  a1[1] = sub_2194F2994;
  sub_2194F2B08();
}

void sub_2194F2AD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v12 = *v10;
  *int v10 = 0;
  if (v12) {
    ((void (*)(void))v10[1])();
  }
  _Unwind_Resume(exception_object);
}

void sub_2194F2B08()
{
}

void sub_2194F2CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
}

void sub_2194F2CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

CVPixelBufferRef sub_2194F2CF4@<X0>(CVPixelBufferPoolRef *a1@<X0>, unsigned char *a2@<X8>)
{
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v3 = CVPixelBufferPoolCreatePixelBuffer(0, *a1, &pixelBufferOut);
  kdebug_trace();
  CVPixelBufferRef result = pixelBufferOut;
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = pixelBufferOut == 0;
  }
  if (!v5) {
    sub_2194F3508(pixelBufferOut, &v6);
  }
  *a2 = 0;
  a2[16] = 0;
  return result;
}

void sub_2194F2E20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_21947E0B8((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_2194F2E3C(uint64_t a1, const void *a2, uint64_t a3)
{
  CFMutableDictionaryRef v7 = *(CFMutableDictionaryRef *)a1;
  BOOL v6 = *(std::__shared_weak_count **)(a1 + 8);
  if (v6)
  {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      if (v7) {
        goto LABEL_4;
      }
      return 0;
    }
  }
  if (!v7) {
    return 0;
  }
LABEL_4:
  sub_2194FE514(&v13, a3);
  long long v9 = v13;
  unsigned int v8 = v14;
  if (v14)
  {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
      BOOL v10 = v9 != 0;
      if (!v9) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  BOOL v10 = v9 != 0;
  if (v9) {
LABEL_7:
  }
    sub_2194FF10C((CFMutableDictionaryRef *)a1, a2, v13);
LABEL_8:
  int v11 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  return v10;
}

void sub_2194F2FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL sub_2194F2FC4(uint64_t a1, const void *a2, uint64_t a3)
{
  CFDictionaryRef v7 = *(const __CFDictionary **)a1;
  BOOL v6 = *(std::__shared_weak_count **)(a1 + 8);
  if (v6
    && (atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed),
        !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    if (!v7) {
      return 0;
    }
  }
  else if (!v7)
  {
    return 0;
  }
  if (sub_2194FF114(*(const __CFDictionary **)a1, a2)) {
    return 0;
  }
  long long v9 = *(const void **)a3;
  unsigned int v8 = *(std::__shared_weak_count **)(a3 + 8);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CFTypeRef v14 = v9;
  if (sub_2194FE918(&v14))
  {
    value = (void *)v9;
    uint64_t v13 = v8;
    if (!v8)
    {
LABEL_19:
      BOOL v10 = v9 != 0;
      if (v9) {
        j__CFDictionaryAddValue(*(CFMutableDictionaryRef *)a1, a2, value);
      }
      goto LABEL_21;
    }
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_14:
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    long long v9 = value;
    if (v13)
    {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    goto LABEL_19;
  }
  value = 0;
  uint64_t v13 = 0;
  if (v8) {
    goto LABEL_14;
  }
  BOOL v10 = 0;
LABEL_21:
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  return v10;
}

void sub_2194F31C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_21947E0B8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2194F31D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _Unwind_Exception *a13)
{
  CFTypeRef v14 = exception_object;
  if (v13)
  {
    sub_21950A400(v13, (uint64_t)exception_object, a2, (uint64_t)&a13);
    CFTypeRef v14 = a13;
  }
  _Unwind_Resume(v14);
}

BOOL sub_2194F3200(uint64_t a1, const void *a2, uint64_t a3)
{
  CFMutableDictionaryRef v7 = *(CFMutableDictionaryRef *)a1;
  BOOL v6 = *(std::__shared_weak_count **)(a1 + 8);
  if (v6)
  {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      if (v7) {
        goto LABEL_4;
      }
      return 0;
    }
  }
  if (!v7) {
    return 0;
  }
LABEL_4:
  sub_2194FE3F0(&v13, a3);
  long long v9 = v13;
  unsigned int v8 = v14;
  if (v14)
  {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
      BOOL v10 = v9 != 0;
      if (!v9) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  BOOL v10 = v9 != 0;
  if (v9) {
LABEL_7:
  }
    sub_2194FF10C((CFMutableDictionaryRef *)a1, a2, v13);
LABEL_8:
  int v11 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  return v10;
}

void sub_2194F3374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2194F3388(OpaqueVTPixelTransferSession *a1)
{
  if (a1)
  {
    VTPixelTransferSessionInvalidate(a1);
    CFRelease(a1);
  }
}

VTPixelTransferSessionRef *sub_2194F33C8(VTPixelTransferSessionRef *a1)
{
  *a1 = 0;
  a1[1] = (VTPixelTransferSessionRef)sub_2194F3388;
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  OSStatus v2 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &pixelTransferSessionOut);
  VTPixelTransferSessionRef v3 = pixelTransferSessionOut;
  VTPixelTransferSessionRef v4 = *a1;
  *a1 = pixelTransferSessionOut;
  if (v4)
  {
    ((void (*)(VTPixelTransferSessionRef))a1[1])(v4);
    VTPixelTransferSessionRef v3 = pixelTransferSessionOut;
  }
  a1[1] = (VTPixelTransferSessionRef)sub_2194F3388;
  if (v2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    if (v2)
    {
      sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/AppleUtil/src/CvPixelBufferTransferSession.cpp", 54, "err == kCVReturnSuccess", (void (*)(void *))sub_2194FF9C0);
      abort();
    }
  }
  else
  {
    VTSessionSetProperty(v3, (CFStringRef)*MEMORY[0x263F1EA00], (CFTypeRef)*MEMORY[0x263EFFB40]);
  }
  return a1;
}

void sub_2194F34B0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *v1;
  *BOOL v1 = 0;
  if (v3) {
    ((void (*)(void))v1[1])();
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_2194F34D8(VTPixelTransferSessionRef *a1, __CVBuffer *a2, __CVBuffer *a3)
{
  if (!a2 || !a3) {
    sub_21950A478();
  }
  return VTPixelTransferSessionTransferImage(*a1, a2, a3) == 0;
}

void sub_2194F3508(__CVBuffer *a1@<X0>, __CVBuffer **a2@<X8>)
{
  *a2 = a1;
  operator new();
}

void sub_2194F358C(void *a1)
{
  __cxa_begin_catch(a1);
  kdebug_trace();
  CVPixelBufferRelease(v1);
  __cxa_rethrow();
}

void sub_2194F35BC(_Unwind_Exception *a1)
{
}

void sub_2194F35DC(__CVBuffer *a1@<X0>, int a2@<W1>, int a3@<W8>)
{
  v9[4] = *MEMORY[0x263EF8340];
  if (!a1) {
    sub_21950A4B0();
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType == 1278226488)
  {
LABEL_3:
    sub_2194F3CF0(a3, a1);
  }
  if ((PixelFormatType & 0xFFFFFFEF) == 0x34323066)
  {
    if (!a2)
    {
      CVPixelBufferLockBaseAddress(a1, 0);
      CFMutableDictionaryRef v7 = operator new(0x20uLL);
      void *v7 = &unk_26CAD6260;
      v7[1] = MEMORY[0x263F03DE8];
      v7[2] = a1;
      *((_DWORD *)v7 + 6) = 0;
      v9[3] = v7;
      CVPixelBufferGetWidth(a1);
      CVPixelBufferGetHeight(a1);
      CVPixelBufferGetBaseAddressOfPlane(a1, 0);
      CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
      CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
      CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
      operator new[]();
    }
    goto LABEL_3;
  }
  if (PixelFormatType > 1111970368)
  {
    if (PixelFormatType != 1111970369)
    {
      if (PixelFormatType == 1278226742) {
        goto LABEL_3;
      }
      int v8 = 1647392359;
LABEL_16:
      if (PixelFormatType == v8) {
        sub_21950A520();
      }
      sub_21950A4E8();
    }
  }
  else
  {
    if (PixelFormatType == 24)
    {
      CVPixelBufferGetWidth(a1);
      CVPixelBufferGetHeight(a1);
      CVPixelBufferGetBytesPerRow(a1);
      sub_2194F3DCC(v9, a1);
    }
    if (PixelFormatType != 875836518)
    {
      int v8 = 825437747;
      goto LABEL_16;
    }
  }
  CVPixelBufferGetWidth(a1);
  CVPixelBufferGetHeight(a1);
  CVPixelBufferGetBytesPerRow(a1);
  sub_2194F3DCC(v9, a1);
}

void sub_2194F3B44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_21947E0B8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2194F3B58(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    MEMORY[0x21D48B570](v2, 0x1000C8077774924);
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2194F3B88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __cxa_end_catch();
  sub_2194838AC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_2194F3BF8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

void sub_2194F3C30(uint64_t a1)
{
  BOOL v1 = *(__CVBuffer **)(a1 + 24);
  kdebug_trace();
  CVPixelBufferRelease(v1);
}

uint64_t sub_2194F3C7C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3vio10apple_util20CreateImageDataOwnerEP10__CVBufferE3$_0") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3vio10apple_util20CreateImageDataOwnerEP10__CVBufferE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3vio10apple_util20CreateImageDataOwnerEP10__CVBufferE3$_0")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3vio10apple_util20CreateImageDataOwnerEP10__CVBufferE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_2194F3CF0(int a1, CVPixelBufferRef pixelBuffer)
{
  CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  sub_2194F3DCC(&v3, pixelBuffer);
}

void sub_2194F3DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2194F3DCC(void *a1, CVPixelBufferRef texture)
{
  *a1 = texture;
  operator new();
}

void sub_2194F3E60(void *a1)
{
  __cxa_begin_catch(a1);
  CVPixelBufferUnlockBaseAddress(v1, 1uLL);
  kdebug_trace();
  CVPixelBufferRelease(v1);
  __cxa_rethrow();
}

void sub_2194F3EA0(_Unwind_Exception *a1)
{
}

void sub_2194F3EBC(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

void sub_2194F3EF4(uint64_t a1)
{
  BOOL v1 = *(__CVBuffer **)(a1 + 24);
  CVPixelBufferUnlockBaseAddress(v1, 1uLL);
  kdebug_trace();
  CVPixelBufferRelease(v1);
}

uint64_t sub_2194F3F4C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3vio10apple_util12_GLOBAL__N_115retainAndManageEP10__CVBufferE3$_0") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3vio10apple_util12_GLOBAL__N_115retainAndManageEP10__CVBufferE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3vio10apple_util12_GLOBAL__N_115retainAndManageEP10__CVBufferE3$_0")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3vio10apple_util12_GLOBAL__N_115retainAndManageEP10__CVBufferE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_2194F3FC4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

uint64_t sub_2194F3FFC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    JUMPOUT(0x21D48B570);
  }
  return result;
}

uint64_t sub_2194F401C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3vio10apple_util12_GLOBAL__N_119ConvertYpCbCrToBGRAIhEENS0_8cv_types9ImageDataIT_EEP10__CVBufferEUlPhE_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3vio10apple_util12_GLOBAL__N_119ConvertYpCbCrToBGRAIhEENS0_8cv_types9ImageDataIT_"
                                "EEP10__CVBufferEUlPhE_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3vio10apple_util12_GLOBAL__N_119ConvertYpCbCrToBGRAIhEENS0_8cv_types9ImageDataIT_EEP10__CVBufferEUlPhE_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3vio10apple_util12_GLOBAL__N_119ConvertYpCbCrToBGRAIhEENS0_8cv_types9ImageDataIT_EEP10__CVBufferEUlPhE_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t sub_2194F4090(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t sub_2194F4098(int a1, int a2)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33998, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C33998))
  {
    qword_267C339C0 = (uint64_t)sub_2194F4880(5, 13, 16, 8);
    qword_267C339C8 = v5;
    __cxa_guard_release(&qword_267C33998);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C339A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C339A0))
  {
    qword_267C339D0 = (uint64_t)sub_2194F4718(13, 10, 5, 11, 4);
    qword_267C339D8 = v6;
    __cxa_guard_release(&qword_267C339A0);
  }
  return sub_2194F44F0(a1, a2, qword_267C339C0, qword_267C339C8, 5, 13, 16, 8, qword_267C339D0, qword_267C339D8, 5, 13, 10, 11, 4);
}

void sub_2194F41AC(_Unwind_Exception *a1)
{
}

void sub_2194F41C4(_Unwind_Exception *a1)
{
}

double sub_2194F41DC(double a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C339A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C339A8))
  {
    qword_267C339E0 = (uint64_t)sub_2194F4E4C(6, 13, 13, 7);
    unk_267C339E8 = v5;
    __cxa_guard_release(&qword_267C339A8);
  }
  uint64_t v2 = qword_267C339E0;
  uint64_t v3 = unk_267C339E8;

  return sub_2194F4D3C(v2, v3, 6, 13, 13, 7, a1);
}

void sub_2194F427C(_Unwind_Exception *a1)
{
}

double sub_2194F4294(uint64_t a1, double a2)
{
  if (a2 == 0.0) {
    return 0.0;
  }
  *(void *)&double result = (-1 << (53 - a1)) & COERCE_UNSIGNED_INT64(COERCE_DOUBLE((*(void *)&a2 - (a1 << 52)) & 0xFFF0000000000000)+ a2);
  return result;
}

void sub_2194F42E0(double a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C339B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C339B0))
  {
    qword_267C339F0 = (uint64_t)sub_2194F4880(7, 16, 17, 9);
    qword_267C339F8 = v2;
    __cxa_guard_release(&qword_267C339B0);
  }
  sub_2194F4788(qword_267C339F0, qword_267C339F8, 7, 16, 17, 9, fabs(a1));
}

void sub_2194F4380(_Unwind_Exception *a1)
{
}

void sub_2194F4398(double a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C339B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C339B8))
  {
    qword_267C33A00 = (uint64_t)sub_2194F4AC8(8, 18, 19, 10);
    qword_267C33A08 = v2;
    __cxa_guard_release(&qword_267C339B8);
  }
  sub_2194F4788(qword_267C33A00, qword_267C33A08, 8, 18, 19, 10, fabs(a1));
}

void sub_2194F4438(_Unwind_Exception *a1)
{
}

uint64_t sub_2194F4450(uint64_t a1, uint64_t a2, int a3, int a4, char a5, char a6, int a7, int a8)
{
  if (1 << (a4 - 1) <= a3) {
    return (1 << (a5 - 1));
  }
  char v8 = a4 - 1 - a6;
  int v9 = (a3 >> v8) & ~(1 << a6);
  int v10 = a3 - (a3 >> v8 << v8) + (-1 << (v8 - 1));
  uint64_t v11 = 4 * v9;
  int v12 = *(_DWORD *)(a1 + v11);
  int v13 = *(_DWORD *)(a2 + v11);
  int v14 = a8 + a4;
  char v15 = a8 + a4 - (a7 + 2);
  char v16 = a7 + 2 - (a8 + a4);
  if (a7 + 2 > a8 + a4) {
    char v15 = 0;
  }
  if (a7 + 2 <= v14) {
    char v16 = 0;
  }
  char v17 = v14 + ~a5;
  if (a7 + 2 > a8 + a4) {
    char v17 = a7 - a5 + 1;
  }
  return ((((((v13 * v10) << v16) + (v12 << v15)) >> (v17 - 1)) + 1) >> 1);
}

uint64_t sub_2194F44F0(int a1, int a2, uint64_t a3, uint64_t a4, char a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, int a13, int a14, int a15)
{
  if (a2 >= 0) {
    unsigned int v18 = a2;
  }
  else {
    unsigned int v18 = -a2;
  }
  if (a1 >= 0) {
    unsigned int v19 = a1;
  }
  else {
    unsigned int v19 = -a1;
  }
  if (v18 >= v19) {
    int v20 = v19;
  }
  else {
    int v20 = v18;
  }
  double v21 = (double)v20;
  if (v18 <= v19) {
    int v22 = v19;
  }
  else {
    int v22 = v18;
  }
  double v23 = sub_2194F4788(a3, a4, a5, a6, a7, a8, COERCE_DOUBLE((-1 << (53 - a6)) & COERCE_UNSIGNED_INT64((double)v22)))* COERCE_DOUBLE(v15 & *(void *)&v21);
  long double v24 = ldexp(1.0, a12 - 1);
  uint64_t v25 = sub_2194F4450(a9, a10, (int)(v23 * v24 + 0.5), a12, a13, a11, a14, a15);
  if (((a2 | a1) & 0x80000000) == 0 && v18 >= v19) {
    return v25;
  }
  BOOL v26 = v18 >= v19;
  if (((a2 | a1) & 0x80000000) == 0 && v18 < v19)
  {
    double v27 = ldexp(1.0, a13 + 1);
    double v28 = 0.5;
LABEL_18:
    double v29 = v27 * v28;
    return ((int)v29 - v25);
  }
  BOOL v30 = a1 >= 0 && a2 < 0;
  char v31 = !v30;
  if (v30 && v18 < v19)
  {
    double v34 = ldexp(1.0, a13 + 1);
    double v35 = 0.5;
LABEL_38:
    double v33 = v34 * v35;
    return (v25 + (int)v33);
  }
  if (v18 < v19) {
    char v31 = 1;
  }
  if ((v31 & 1) == 0)
  {
    double v29 = ldexp(1.0, a13 + 1);
    return ((int)v29 - v25);
  }
  if ((a2 & a1) < 0 != __OFSUB__(v18, v19) && v18 >= v19)
  {
    double v33 = ldexp(1.0, a13 + 1);
    return (v25 + (int)v33);
  }
  if ((a2 & a1) < 0 && v18 < v19)
  {
    double v27 = ldexp(1.0, a13 + 1);
    double v28 = 1.5;
    goto LABEL_18;
  }
  BOOL v38 = a1 >= 0 || a2 < 0;
  char v39 = v38;
  if (v38) {
    BOOL v26 = 1;
  }
  if (!v26)
  {
    double v34 = ldexp(1.0, a13 + 1);
    double v35 = 1.5;
    goto LABEL_38;
  }
  if (v18 < v19) {
    char v40 = 1;
  }
  else {
    char v40 = v39;
  }
  if ((v40 & 1) == 0)
  {
    long double v41 = ldexp(1.0, a13 + 1);
    double v29 = v41 + v41;
    return ((int)v29 - v25);
  }
  return v25;
}

void *sub_2194F4718(int a1, int a2, int a3, int a4, int a5)
{
  if (a1 == 10 && a2 == 7 && a3 == 3 && a4 == 7 && a5 == 3) {
    return &unk_267C2B908;
  }
  BOOL v9 = a1 == 13 && a2 == 10 && a3 == 5 && a4 == 11;
  if (v9 && a5 == 4) {
    return &unk_267C2B948;
  }
  else {
    return 0;
  }
}

double sub_2194F4788(uint64_t a1, uint64_t a2, char a3, int a4, int a5, int a6, double a7)
{
  unint64_t v13 = sub_2194F500C(a4, a7);
  char v14 = ~a3 + a4;
  uint64_t v15 = 4 * (int)((v13 >> v14) & ~(1 << a3));
  uint64_t v16 = *(int *)(a1 + v15);
  int v17 = (1 << (v14 - 1)) - v13 + (v13 >> v14 << v14);
  int v18 = *(_DWORD *)(a2 + v15);
  char v19 = a4 + a6 - 1;
  LODWORD(v15) = a4 + a6 - 2;
  char v20 = a5 - v15;
  BOOL v21 = __OFSUB__(v15, a5);
  int v23 = v15 - a5;
  char v22 = (v23 < 0) ^ v21;
  if (v22) {
    LOBYTE(v23) = 0;
  }
  else {
    char v20 = 0;
  }
  if (v22) {
    char v19 = a5 + 1;
  }
  unint64_t v24 = sub_2194F50FC(((v16 << v23) + (1 << (v19 - a4 - 2)) + ((v18 * (uint64_t)v17) << v20)) >> (v19 - a4 - 1), ~((v13 >> 16) >> 16), a4);

  return sub_2194F50BC(v24);
}

void *sub_2194F4880(int a1, int a2, int a3, int a4)
{
  if (a1 == 3 && a2 == 9 && a3 == 10 && a4 == 6) {
    return &unk_267C2DA48;
  }
  if (a4 == 7 && a1 == 5 && a2 == 11 && a3 == 13) {
    return &unk_267C2DAC8;
  }
  if (a4 == 7 && a1 == 5 && a2 == 12 && a3 == 12) {
    return &unk_267C2DBC8;
  }
  if (a1 == 5 && a2 == 13 && a3 == 16 && a4 == 8) {
    return &unk_267C2DCC8;
  }
  if (a4 == 8 && a1 == 6 && a2 == 14 && a3 == 14) {
    return &unk_267C2E0C8;
  }
  if (a1 == 6 && a2 == 15 && a3 == 17 && a4 == 10) {
    return &unk_267C2E2C8;
  }
  if (a1 == 7 && a2 == 13 && a3 == 16 && a4 == 8) {
    return &unk_267C2E8C8;
  }
  if (a4 == 10 && a1 == 7 && a2 == 14 && a3 == 19) {
    return &unk_267C2ECC8;
  }
  BOOL v5 = a1 == 7 && a2 == 16;
  char v6 = v5;
  if (v5 && a3 == 17 && a4 == 9) {
    return &unk_267C2F0C8;
  }
  if (a3 != 20 || a4 != 11) {
    char v6 = 0;
  }
  if (v6) {
    return &unk_267C2F4C8;
  }
  if (a3 == 20 && a1 == 7 && a2 == 17 && a4 == 13) {
    return &unk_267C2F8C8;
  }
  if (a1 != 9 || a2 != 21 || a3 != 26 || a4 != 15) {
    abort();
  }
  return &unk_267C2BA48;
}

void *sub_2194F4AC8(int a1, int a2, int a3, int a4)
{
  if (a1 == 3 && a2 == 9 && a3 == 10 && a4 == 6) {
    return &unk_267C2DA88;
  }
  if (a4 == 7 && a1 == 5 && a2 == 11 && a3 == 13) {
    return &unk_267C2DDC8;
  }
  if (a4 == 7 && a1 == 5 && a2 == 12 && a3 == 12) {
    return &unk_267C2DEC8;
  }
  if (a1 == 5 && a2 == 13 && a3 == 16 && a4 == 8) {
    return &unk_267C2DFC8;
  }
  if (a4 == 8 && a1 == 6 && a2 == 14 && a3 == 14) {
    return &unk_267C2E4C8;
  }
  if (a1 == 6 && a2 == 15 && a3 == 17 && a4 == 10) {
    return &unk_267C2E6C8;
  }
  if (a1 == 7 && a2 == 13 && a3 == 16 && a4 == 8) {
    return &unk_267C2FCC8;
  }
  if (a1 == 7 && a2 == 14 && a3 == 19 && a4 == 10) {
    return &unk_267C300C8;
  }
  BOOL v5 = a1 == 7 && a2 == 16;
  char v6 = v5;
  if (v5 && a3 == 17 && a4 == 9) {
    return &unk_267C304C8;
  }
  if (a3 != 20 || a4 != 11) {
    char v6 = 0;
  }
  if (v6) {
    return &unk_267C308C8;
  }
  if (a3 == 20 && a1 == 7 && a2 == 17 && a4 == 13) {
    return &unk_267C30CC8;
  }
  if (a1 == 8 && a2 == 18 && a3 == 19 && a4 == 10) {
    return &unk_267C310C8;
  }
  if (a1 != 9 || a2 != 21 || a3 != 26 || a4 != 15) {
    abort();
  }
  return &unk_267C2CA48;
}

double sub_2194F4D3C(uint64_t a1, uint64_t a2, char a3, int a4, int a5, int a6, double a7)
{
  unint64_t v13 = sub_2194F500C(a4, a7);
  unsigned int v14 = v13 >> (a4 - a3);
  int v15 = 1 << (a3 - 1);
  int v16 = v14 & ~v15;
  if (((v13 >> 16) & 0x10000) == 0) {
    int v15 = 0;
  }
  uint64_t v17 = 4 * (v15 | v16);
  int v18 = *(_DWORD *)(a1 + v17);
  int v19 = *(_DWORD *)(a2 + v17);
  int v20 = a6 + a4;
  char v21 = a6 + a4 - 1 - a5;
  if (a6 + a4 - 1 < a5) {
    char v21 = 0;
  }
  int v22 = v18 << v21;
  int v23 = ((1 << (a4 - a3 - 1)) - v13 + (v14 << (a4 - a3))) * v19;
  if (v20 - 1 >= a5) {
    char v24 = 0;
  }
  else {
    char v24 = a5 - (a6 + a4 - 1);
  }
  int v25 = v23 << v24;
  if (v20 - 1 < a5) {
    LOBYTE(v20) = a5 + 1;
  }
  unint64_t v26 = sub_2194F50FC((uint64_t)(v22 + (1 << (v20 - a4 - 2)) + v25) >> (v20 - a4 - 1), ~(unsigned __int16)((int)(((int)(v13 >> 16) >> 16) - (((v13 >> 16) & 0x10000) >> 16)) / 2), a4);

  return sub_2194F50BC(v26);
}

void *sub_2194F4E4C(int a1, int a2, int a3, int a4)
{
  if (a3 == 12 && a1 == 5 && a2 == 11 && a4 == 5) {
    return &unk_267C31CC8;
  }
  if (a1 == 5 && a2 == 12 && a3 == 12 && a4 == 7) {
    return &unk_267C31DC8;
  }
  if (a4 == 7 && a2 == 13 && a1 == 6 && a3 == 13) {
    return &unk_267C31EC8;
  }
  if (a3 == 17 && a1 == 7 && a2 == 13 && a4 == 12) {
    return &unk_267C320C8;
  }
  BOOL v5 = a1 == 7 && a2 == 14;
  char v6 = v5;
  if (v5 && a3 == 18 && a4 == 10) {
    return &unk_267C324C8;
  }
  char v7 = v6 ^ 1;
  if (a3 != 19) {
    char v7 = 1;
  }
  if ((v7 & 1) == 0 && a4 == 9) {
    return &unk_267C328C8;
  }
  if (a3 == 18 && a1 == 7 && a2 == 15 && a4 == 8) {
    return &unk_267C32CC8;
  }
  if (a1 == 7 && a2 == 16 && a3 == 17 && a4 == 9) {
    return &unk_267C330C8;
  }
  if (a2 != 15 || a1 != 8 || a3 != 21 || a4 != 11) {
    abort();
  }
  return &unk_267C334C8;
}

unint64_t sub_2194F500C(char a1, double a2)
{
  if (a2 == 0.0) {
    return 0;
  }
  unint64_t v3 = ((*(void *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000uLL) >> (52 - a1)) + 1;
  unint64_t v4 = v3 >> 1;
  unint64_t v5 = v3 >> 1 >> a1;
  unint64_t v6 = v3 >> 2;
  if (v5 == 1)
  {
    __int16 v7 = -1022;
  }
  else
  {
    LODWORD(v6) = v4;
    __int16 v7 = -1023;
  }
  return ((unint64_t)(a1 & 0x1F) << 49) | (*(void *)&a2 >> 15) & 0xFFFF000000000000 | v6 | ((unint64_t)(unsigned __int16)(v7 + ((*(void *)&a2 >> 52) & 0x7FF)) << 32);
}

double sub_2194F50BC(uint64_t a1)
{
  double result = 0.0;
  char v2 = __clz(a1);
  if (a1) {
    *(void *)&double result = ((a1 << 20) + 0x3FF0000000000000) & 0x7FF0000000000000 | ((unint64_t)BYTE6(a1) << 63) | ((unint64_t)a1 << (v2 + 21)) & 0xFFFFFFFFFFFFELL;
  }
  return result;
}

unint64_t sub_2194F50FC(unsigned int a1, unsigned __int16 a2, int a3)
{
  unint64_t v3 = (unint64_t)(a3 & 0x1F) << 49;
  if (!a1) {
    return v3 & 0xFFFFFFFFFFFFFFLL;
  }
  int v4 = (__clz(a1) | 0xFFFFFFE0) + a3;
  if (v4)
  {
    unint64_t v5 = (unint64_t)(a3 & 0x1F) << 49;
    uint64_t v6 = (unsigned __int16)(a2 - v4);
    if (v4 < 0) {
      unint64_t v3 = v5 | (a1 >> -(char)v4) | (v6 << 32);
    }
    else {
      unint64_t v3 = v5 | (a1 << v4) | (v6 << 32);
    }
    return v3 & 0xFFFFFFFFFFFFFFLL;
  }
  return v3 & 0xFF000000000000 | a1 | ((unint64_t)a2 << 32) & 0xFFFFFFFFFFFFFFLL;
}

uint64_t sub_2194F519C(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    gettimeofday((timeval *)v13, 0);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v13;
    if (*(void *)a1) {
      sub_21950A594();
    }
    kdebug_trace();
    char v2 = dispatch_queue_create("com.apple.cvhwa.xpc.client", 0);
    mach_service = xpc_connection_create_mach_service("com.apple.cvhwa.xpc", v2, 0);
    *(void *)a1 = mach_service;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unint64_t v13 = 136315394;
      *(void *)&v13[4] = "com.apple.cvhwa.xpc";
      *(_WORD *)&v13[12] = 2048;
      *(void *)&v13[14] = mach_service;
      _os_log_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_INFO, "VisionHWAClient: Creating XPC connection to %s: %p", v13, 0x16u);
      mach_service = *(_xpc_connection_s **)a1;
    }
    xpc_connection_set_event_handler(mach_service, &unk_26CAD6D50);
    xpc_connection_resume(*(xpc_connection_t *)a1);
    dispatch_release(v2);
    kdebug_trace();
    return 0;
  }
  else
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_21950A558(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return 2;
  }
}

void sub_2194F5340(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_21947E028(a1);
  }
  _Unwind_Resume(a1);
}

const char *sub_2194F5358(unsigned int a1)
{
  if (a1 <= 0x22) {
    return off_2643A5A38[a1];
  }
  else {
    return "kVisionHWAReturnUnknownFailure";
  }
}

uint64_t sub_2194F537C(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x1A) {
    return 4195860702;
  }
  uint64_t v1 = (a1 + 5);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    sub_21950A5CC(v1);
  }
  return v1;
}

uint64_t sub_2194F53F0(uint64_t a1, xpc_object_t *a2, int *a3)
{
  uint64_t v6 = MEMORY[0x21D48BAD0](*a2);
  if (v6 == MEMORY[0x263EF8720])
  {
    xpc_object_t v16 = *a2;
    if (v16 == (xpc_object_t)MEMORY[0x263EF86A8])
    {
      BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v27) {
        sub_21950A658(v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    else
    {
      if (v16 == (xpc_object_t)MEMORY[0x263EF86A0])
      {
        BOOL v36 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v36) {
          sub_21950A694(v36, v37, v38, v39, v40, v41, v42, v43);
        }
        goto LABEL_21;
      }
      xpc_object_t v17 = (xpc_object_t)MEMORY[0x263EF86C0];
      BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v16 == v17)
      {
        if (v18) {
          sub_21950A6D0(v18, v19, v20, v21, v22, v23, v24, v25);
        }
        goto LABEL_21;
      }
      if (v18) {
        sub_21950A70C(v16);
      }
    }
    sub_2194F60A8(a1);
LABEL_21:
    sub_2194F60A8(a1);
    int v15 = 33;
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x263EF8708])
  {
    if (xpc_dictionary_get_BOOL(*a2, "Status")) {
      return 1;
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(*a2, "Error");
    int v15 = sub_2194F537C(uint64);
  }
  else
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      sub_21950A79C(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    int v15 = 34;
  }
LABEL_22:
  *a3 = v15;
  return 0;
}

uint64_t sub_2194F5570(uint64_t a1, CVPixelBufferRef *a2)
{
  if (a1)
  {
    gettimeofday(&v18, 0);
    *(timeval *)(a1 + 48) = v18;
    kdebug_trace();
    v18.tv_sec = (__darwin_time_t)xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64((xpc_object_t)v18.tv_sec, "Command", 0x7D4uLL);
    xpc_object_t v16 = (xpc_object_t *)&v18;
    uint64_t result = sub_2194F5734(&v16, "ActionBuf", a2[1]);
    if (!result)
    {
      uint64_t result = sub_2194F5734(&v16, "OperationBuf", *a2);
      if (!result)
      {
        uint64_t result = sub_2194F5734(&v16, "StatsBuf", a2[2]);
        unsigned int v17 = result;
        if (!result)
        {
          uint64_t v13 = a2[3];
          if (!v13 || (result = sub_2194F5734(&v16, "DtcmMetaBuf", v13), (unsigned int v17 = result) == 0))
          {
            xpc_object_t v14 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)a1, (xpc_object_t)v18.tv_sec);
            xpc_object_t v15 = v14;
            if (sub_2194F53F0(a1, &v15, (int *)&v17)) {
              *(void *)(a1 + 8) = xpc_dictionary_get_uint64(v14, "ClientId");
            }
            xpc_release(v14);
            xpc_release((xpc_object_t)v18.tv_sec);
            kdebug_trace();
            return v17;
          }
        }
      }
    }
  }
  else
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_21950A7D8(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return 2;
  }
  return result;
}

uint64_t sub_2194F5734(xpc_object_t **a1, const char *a2, CVPixelBufferRef pixelBuffer)
{
  IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  if (IOSurface)
  {
    xpc_object_t XPCObject = IOSurfaceCreateXPCObject(IOSurface);
    if (XPCObject)
    {
      uint64_t v7 = XPCObject;
      xpc_dictionary_set_value(**a1, a2, XPCObject);
      xpc_release(v7);
      return 0;
    }
    else
    {
      BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v17) {
        sub_21950A850(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      xpc_release(**a1);
      return 3;
    }
  }
  else
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9) {
      sub_21950A814(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    xpc_release(**a1);
    return 1;
  }
}

uint64_t sub_2194F5810(uint64_t a1, uint64_t a2)
{
  unsigned int v15 = 0;
  gettimeofday((timeval *)&v14, 0);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)&v14.__pn_.__r_.__value_.__l.__data_;
  ++*(_DWORD *)(a1 + 20);
  memset(&v14, 0, sizeof(v14));
  uint64_t v4 = *(unsigned __int8 *)(a2 + 23);
  if ((v4 & 0x80u) == 0) {
    BOOL v5 = (std::string *)a2;
  }
  else {
    BOOL v5 = *(std::string **)a2;
  }
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *(void *)(a2 + 8);
  }
  sub_2194A3B54(&v14.__pn_, v5, (std::string *)((char *)v5 + v4));
  memset(&__p, 0, sizeof(__p));
  __ec.__val_ = 0;
  __ec.__cat_ = std::system_category();
  std::__fs::filesystem::__canonical(&v11, &v14, &__ec);
  std::__fs::filesystem::path __p = v11;
  if (!__ec.__val_)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "ClientId", *(void *)(a1 + 8));
    xpc_dictionary_set_uint64(empty, "Command", 0x7D5uLL);
    if ((__p.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::__fs::filesystem::path *)__p.__pn_.__r_.__value_.__r.__words[0];
    }
    xpc_dictionary_set_string(empty, "BinaryPath", (const char *)p_p);
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)a1, empty);
    v11.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
    sub_2194F53F0(a1, (xpc_object_t *)&v11.__pn_.__r_.__value_.__l.__data_, (int *)&v15);
    xpc_release(v9);
    xpc_release(empty);
    uint64_t v6 = v15;
    if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (__ec.__val_ == 2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_21950A920();
    }
    uint64_t v6 = 22;
    if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_19;
    }
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = 1;
      if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    sub_21950A88C();
    uint64_t v6 = 1;
    if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
LABEL_19:
    }
      operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  }
LABEL_20:
  if (SHIBYTE(v14.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__pn_.__r_.__value_.__l.__data_);
  }
  return v6;
}

void sub_2194F5A10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v20 - 41) < 0) {
    operator delete(*(void **)(v20 - 64));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2194F5A4C(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  unsigned int v14 = 0;
  gettimeofday(&v15, 0);
  *(timeval *)(a1 + 80) = v15;
  ++*(_DWORD *)(a1 + 24);
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "ClientId", *(void *)(a1 + 8));
  xpc_dictionary_set_uint64(empty, "Command", 0x7D6uLL);
  if (*(char *)(a2 + 23) >= 0) {
    xpc_object_t v9 = (const char *)a2;
  }
  else {
    xpc_object_t v9 = *(const char **)a2;
  }
  xpc_dictionary_set_string(empty, "SymbolString", v9);
  xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)a1, empty);
  v15.tv_sec = (__darwin_time_t)v10;
  if (sub_2194F53F0(a1, (xpc_object_t *)&v15, (int *)&v14))
  {
    int uint64 = xpc_dictionary_get_uint64(v10, "SymbolAddr");
    int v12 = xpc_dictionary_get_uint64(v10, "SymbolSize");
    *a3 = uint64;
    *a4 = v12;
  }
  xpc_release(v10);
  xpc_release(empty);
  return v14;
}

uint64_t sub_2194F5B68(uint64_t a1, uint64_t a2, char a3, char a4)
{
  unsigned int v104 = 0;
  ++*(_DWORD *)(a1 + 16);
  kdebug_trace();
  if (!a2)
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      sub_21950A9A8(v9, v10, v11, v12, v13, v14, v15, v16);
      return 2;
    }
    return 2;
  }
  if (a3) {
    LODWORD(v8) = 0;
  }
  else {
    uint64_t v8 = (uint64_t)(*(void *)(a2 + 32) - *(void *)(a2 + 24)) >> 3;
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "IOBufListSize", v8);
  if (a3)
  {
    uint64_t v19 = 2003;
LABEL_9:
    xpc_dictionary_set_uint64(empty, "ClientId", *(void *)(a1 + 8));
    xpc_dictionary_set_uint64(empty, "Command", v19);
    xpc_object_t v20 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)a1, empty);
    __p[0] = v20;
    sub_2194F53F0(a1, __p, (int *)&v104);
    xpc_release(v20);
    xpc_release(empty);
    kdebug_trace();
    return v104;
  }
  if (!v8)
  {
    if (a4) {
      goto LABEL_21;
    }
    goto LABEL_33;
  }
  if (v8 >= 0xB)
  {
LABEL_33:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      sub_21950AA5C(v8);
      return 2;
    }
    return 2;
  }
  if ((a4 & 1) == 0)
  {
    IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(a2 + 8));
    if (IOSurface)
    {
      xpc_object_t XPCObject = IOSurfaceCreateXPCObject(IOSurface);
      if (!XPCObject)
      {
        BOOL v61 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v61) {
          sub_21950AB18(v61, v62, v63, v64, v65, v66, v67, v68);
        }
        return 3;
      }
      uint64_t v23 = XPCObject;
      xpc_dictionary_set_value(empty, "ActionBuf", XPCObject);
      xpc_release(v23);
      uint64_t v24 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)a2);
      if (v24)
      {
        xpc_object_t v25 = IOSurfaceCreateXPCObject(v24);
        if (!v25)
        {
          BOOL v77 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v77) {
            sub_21950AB90(v77, v78, v79, v80, v81, v82, v83, v84);
          }
          return 3;
        }
        unint64_t v26 = v25;
        xpc_dictionary_set_value(empty, "OperationBuf", v25);
        xpc_release(v26);
        BOOL v27 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(a2 + 16));
        if (v27)
        {
          xpc_object_t v28 = IOSurfaceCreateXPCObject(v27);
          if (v28)
          {
            uint64_t v29 = v28;
            xpc_dictionary_set_value(empty, "StatsBuf", v28);
            xpc_release(v29);
            goto LABEL_21;
          }
          BOOL v93 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v93) {
            sub_21950AC08(v93, v94, v95, v96, v97, v98, v99, v100);
          }
          return 3;
        }
        BOOL v85 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v85)
        {
          sub_21950ABCC(v85, v86, v87, v88, v89, v90, v91, v92);
          return 1;
        }
      }
      else
      {
        BOOL v69 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v69)
        {
          sub_21950AB54(v69, v70, v71, v72, v73, v74, v75, v76);
          return 1;
        }
      }
    }
    else
    {
      BOOL v53 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v53)
      {
        sub_21950AADC(v53, v54, v55, v56, v57, v58, v59, v60);
        return 1;
      }
    }
    return 1;
  }
LABEL_21:
  if (!v8)
  {
    uint64_t v19 = 2001;
    goto LABEL_9;
  }
  unint64_t v30 = 0;
  uint64_t v19 = 2001;
  while (1)
  {
    uint64_t v31 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(void *)(a2 + 24) + 8 * v30));
    if (!v31) {
      break;
    }
    xpc_object_t v32 = IOSurfaceCreateXPCObject(v31);
    if (!v32)
    {
      BOOL v45 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v45) {
        sub_21950AA20(v45, v46, v47, v48, v49, v50, v51, v52);
      }
      return 3;
    }
    uint64_t v33 = v32;
    std::to_string(&v101, v30);
    uint64_t v34 = std::string::insert(&v101, 0, "IOBufList");
    long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
    int64_t v103 = v34->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::__fs::filesystem::path __p = v35;
    v34->__r_.__value_.__l.__size_ = 0;
    v34->__r_.__value_.__r.__words[2] = 0;
    v34->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v101.__r_.__value_.__l.__data_);
    }
    if (v103 >= 0) {
      BOOL v36 = __p;
    }
    else {
      BOOL v36 = (void **)__p[0];
    }
    xpc_dictionary_set_value(empty, (const char *)v36, v33);
    xpc_release(v33);
    if (SHIBYTE(v103) < 0) {
      operator delete(__p[0]);
    }
    if (v8 == ++v30) {
      goto LABEL_9;
    }
  }
  BOOL v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (!v37) {
    return 1;
  }
  sub_21950A9E4(v37, v38, v39, v40, v41, v42, v43, v44);
  return 1;
}

void sub_2194F5F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2194F5FA4(uint64_t a1)
{
  unsigned int v14 = 0;
  if (a1)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "Command", 0x7D2uLL);
    xpc_dictionary_set_uint64(empty, "ClientId", *(void *)(a1 + 8));
    xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)a1, empty);
    xpc_object_t v13 = v3;
    sub_2194F53F0(a1, &v13, (int *)&v14);
    xpc_release(v3);
    xpc_release(empty);
    kdebug_trace();
    return v14;
  }
  else
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_21950AC44(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return 2;
  }
}

void sub_2194F60A8(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    xpc_connection_t v2 = *(xpc_connection_t *)a1;
    int v3 = 134217984;
    xpc_connection_t v4 = v2;
    _os_log_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_INFO, "VisionHWACancelXPCConnection: Cancelling XPC connection %p", (uint8_t *)&v3, 0xCu);
  }
  if (*(void *)a1)
  {
    xpc_connection_cancel(*(xpc_connection_t *)a1);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v3) = 0;
      _os_log_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAClient: XPC Connection Cancelled", (uint8_t *)&v3, 2u);
    }
    xpc_release(*(xpc_object_t *)a1);
    *(void *)a1 = 0;
  }
  *(void *)(a1 + 8) = 0;
}

uint64_t sub_2194F61A8(unsigned int a1)
{
  return (a1 < 0x22) & (0x200000300uLL >> a1);
}

void sub_2194F61C4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t sub_2194F61F0(FILE **a1, char *__filename, char *__mode)
{
  uint64_t v3 = 2;
  if (__filename && __mode)
  {
    uint64_t v5 = fopen(__filename, __mode);
    uint64_t v6 = *a1;
    if (!v5)
    {
      *a1 = 0;
      uint64_t v3 = 1;
      if (!v6) {
        return v3;
      }
      goto LABEL_5;
    }
    uint64_t v3 = 0;
    *a1 = v5;
    if (v6) {
LABEL_5:
    }
      fclose(v6);
  }
  return v3;
}

void sub_2194F6258(void *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33A18, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C33A18))
  {
    *a1 = qword_267C33A10;
  }
  else
  {
    sub_2194F6428(&qword_267C33A10);
    __cxa_atexit((void (*)(void *))nullsub_27, &qword_267C33A10, &dword_219476000);
    __cxa_guard_release(&qword_267C33A18);
    *a1 = qword_267C33A10;
  }
}

void sub_2194F62F4(_Unwind_Exception *a1)
{
}

void sub_2194F6310(void *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_267C33A28, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(qword_267C33A28))
  {
    sub_2194F6258(&v4);
    sub_21947DECC(__p, "cv3d");
    sub_2194F9AB0(&v4, (uint64_t)__p, &qword_267C33A20);
    if (v3 < 0) {
      operator delete(__p[0]);
    }
    __cxa_atexit((void (*)(void *))nullsub_1, &qword_267C33A20, &dword_219476000);
    __cxa_guard_release(qword_267C33A28);
  }
  *a1 = qword_267C33A20;
}

void sub_2194F63D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    __cxa_guard_abort(qword_267C33A28);
    _Unwind_Resume(a1);
  }
  __cxa_guard_abort(qword_267C33A28);
  _Unwind_Resume(a1);
}

void sub_2194F6428(void *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33A48, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C33A48))
  {
    *a1 = qword_267C33A40;
  }
  else
  {
    sub_2194F64D8();
    __cxa_atexit((void (*)(void *))nullsub_27, &qword_267C33A40, &dword_219476000);
    __cxa_guard_release(&qword_267C33A48);
    *a1 = qword_267C33A40;
  }
}

void sub_2194F64C0(_Unwind_Exception *a1)
{
}

uint64_t sub_2194F64D8()
{
  sub_2194FA0A4(&qword_267C33A40);
  uint64_t v5 = (void *)qword_267C33A40;
  sub_2194F9AA0(&v5, &v6);
  char v3 = (void *)qword_267C33A40;
  char v2 = 7;
  strcpy((char *)__p, "cv3dapi");
  sub_2194F9AB0(&v3, (uint64_t)__p, &v4);
  if (v2 < 0) {
    operator delete(__p[0]);
  }
  sub_2194F9390(v6);
  sub_2194F94A0(v6, 6);
  return sub_2194F94A0(v4, 6);
}

void sub_2194F658C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2194F65A8(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 56));
    char v3 = *(char **)(v2 + 32);
    if (v3)
    {
      do
      {
        uint64_t v5 = *(char **)v3;
        uint64_t v6 = *((void *)v3 + 5);
        *((void *)v3 + 5) = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
        }
        if (v3[39] < 0) {
          operator delete(*((void **)v3 + 2));
        }
        operator delete(v3);
        char v3 = v5;
      }
      while (v5);
    }
    uint64_t v4 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;
    if (v4) {
      operator delete(v4);
    }
    sub_2194F668C((uint64_t *)(v2 + 8));
    JUMPOUT(0x21D48B5B0);
  }
  return result;
}

uint64_t *sub_2194F668C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 56));
    char v3 = *(char **)(v2 + 32);
    if (v3)
    {
      do
      {
        uint64_t v6 = *(char **)v3;
        uint64_t v7 = *((void *)v3 + 5);
        *((void *)v3 + 5) = 0;
        if (v7) {
          (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
        }
        if (v3[39] < 0) {
          operator delete(*((void **)v3 + 2));
        }
        operator delete(v3);
        char v3 = v6;
      }
      while (v6);
    }
    uint64_t v4 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;
    if (v4) {
      operator delete(v4);
    }
    sub_2194F668C(v2 + 8);
    MEMORY[0x21D48B5B0](v2, 0x10A0C400EF86968);
  }
  return a1;
}

uint64_t sub_2194F675C(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 56)) {
    operator new();
  }
  std::__fs::filesystem::path __p = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  va_copy(__dst, va);
  char v3 = __str;
  unsigned int v4 = vsnprintf(__str, 0x200uLL, __format, va);
  size_t v5 = v4;
  if (v4 >= 0x200)
  {
    char v3 = 0;
    uint64_t v8 = 0;
    size_t v9 = 512;
    while (1)
    {
      if ((int)v4 > 0) {
        size_t v9 = v5 + 1;
      }
      else {
        v9 *= 4;
      }
      unint64_t v10 = v8 - v3;
      size_t v11 = v9 - (v8 - v3);
      if (v9 <= v8 - v3)
      {
        if (v9 < v8 - v3)
        {
          uint64_t v8 = &v3[v9];
          uint64_t v39 = &v3[v9];
        }
        goto LABEL_35;
      }
      if (v40 - v8 < v11) {
        break;
      }
      bzero(v8, v9 - (v8 - v3));
      uint64_t v39 = &v3[v9];
      char v3 = (char *)__p;
      v8 += v11;
LABEL_35:
      va_copy(__dst, va);
      unsigned int v4 = vsnprintf(v3, v9, __format, va);
      size_t v5 = v4;
      if ((v4 & 0x80000000) == 0 && v9 > v4) {
        goto LABEL_3;
      }
    }
    if ((v9 & 0x8000000000000000) != 0) {
      sub_219486AE4();
    }
    unint64_t v12 = 2 * (v40 - v3);
    if (v12 <= v9) {
      unint64_t v12 = v9;
    }
    if ((unint64_t)(v40 - v3) >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v13 = v12;
    }
    unsigned int v14 = (char *)operator new(v13);
    uint64_t v15 = &v14[v10];
    bzero(&v14[v10], v9 - (v8 - v3));
    if (v8 == v3)
    {
LABEL_29:
      uint64_t v8 = &v14[v9];
      std::__fs::filesystem::path __p = v15;
      uint64_t v39 = &v14[v9];
      uint64_t v40 = &v14[v13];
      if (v3) {
        operator delete(v3);
      }
      char v3 = v15;
      goto LABEL_35;
    }
    if (v10 < 8 || (v14 <= &v14[v10 - 1] ? (BOOL v16 = v3 > v8 - 1) : (BOOL v16 = 1), v16 || (unint64_t)(v3 - v14) < 0x20))
    {
      BOOL v17 = v8;
      goto LABEL_26;
    }
    if (v10 >= 0x20)
    {
      unint64_t v20 = v10 & 0xFFFFFFFFFFFFFFE0;
      uint64_t v21 = &v14[v10 - 16];
      uint64_t v22 = v8 - 16;
      unint64_t v23 = v10 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v24 = *(_OWORD *)v22;
        *((_OWORD *)v21 - 1) = *((_OWORD *)v22 - 1);
        *(_OWORD *)uint64_t v21 = v24;
        v21 -= 32;
        v22 -= 32;
        v23 -= 32;
      }
      while (v23);
      if (v10 == v20) {
        goto LABEL_28;
      }
      if ((v10 & 0x18) == 0)
      {
        v15 -= v20;
        BOOL v17 = &v8[-v20];
LABEL_26:
        uint64_t v18 = v15 - 1;
        do
        {
          char v19 = *--v17;
          *v18-- = v19;
        }
        while (v17 != v3);
LABEL_28:
        uint64_t v15 = v14;
        goto LABEL_29;
      }
    }
    else
    {
      unint64_t v20 = 0;
    }
    BOOL v17 = &v8[-(v10 & 0xFFFFFFFFFFFFFFF8)];
    v15 -= v10 & 0xFFFFFFFFFFFFFFF8;
    xpc_object_t v25 = &v14[&v8[-v20] - v3 - 8];
    unint64_t v26 = &v8[-v20 - 8];
    unint64_t v27 = v20 - (v10 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      uint64_t v28 = *(void *)v26;
      v26 -= 8;
      *(void *)xpc_object_t v25 = v28;
      v25 -= 8;
      v27 += 8;
    }
    while (v27);
    if (v10 == (v10 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
LABEL_3:
  uint64_t v6 = *(void *)(a1 + 56);
  if (v4 >= 0x17)
  {
    uint64_t v29 = (v5 & 0xFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v29 = v5 | 7;
    }
    uint64_t v30 = v29 + 1;
    p_dst = (va_list *)operator new(v29 + 1);
    size_t v36 = v5;
    int64_t v37 = v30 | 0x8000000000000000;
    va_list __dst = (va_list)p_dst;
    goto LABEL_52;
  }
  HIBYTE(v37) = v4;
  p_dst = &__dst;
  if (v4) {
LABEL_52:
  }
    memmove(p_dst, v3, v5);
  *((unsigned char *)p_dst + v5) = 0;
  if (v37 >= 0) {
    uint64_t v31 = &__dst;
  }
  else {
    uint64_t v31 = (va_list *)__dst;
  }
  if (v37 >= 0) {
    uint64_t v32 = HIBYTE(v37);
  }
  else {
    uint64_t v32 = v36;
  }
  sub_2194889DC((void *)(v6 + 16), (uint64_t)v31, v32);
  if (SHIBYTE(v37) < 0) {
    operator delete(__dst);
  }
  if (__p) {
    operator delete(__p);
  }
  return a1;
}

void sub_2194F6B5C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_2194F6B90(_Unwind_Exception *a1)
{
  MEMORY[0x21D48B5B0](v1, 0x10B3C40EED050F3);
  _Unwind_Resume(a1);
}

void sub_2194F6BB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18)
{
  if (!__p) {
    _Unwind_Resume(exception_object);
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_2194F6BF8(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  size_t v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  uint64_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_2194F6EA8(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x21D48B530](v1);
  _Unwind_Resume(a1);
}

void sub_2194F6EDC(uint64_t a1, void *a2)
{
  *(void *)a1 = &unk_26CAD6D80;
  *(void *)(a1 + 8) = *a2;
  *(unsigned char *)(a1 + 39) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 40) = 0;
  operator new();
}

void sub_2194F7154(_Unwind_Exception *a1)
{
  sub_21947E0B8(v2);
  sub_2194F72F4((uint64_t *)(v1 + 48));
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*(void **)(v1 + 16));
  }
  _Unwind_Resume(a1);
}

uint64_t sub_2194F71EC(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 16);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

uint64_t *sub_2194F7268(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 64));
    sub_2194FB578(v2 + 40, *(void **)(v2 + 48));
    uint64_t v3 = *(void **)(v2 + 16);
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
    size_t v5 = *(void **)v2;
    *(void *)uint64_t v2 = 0;
    if (v5) {
      operator delete(v5);
    }
    MEMORY[0x21D48B5B0](v2, 0x10A0C4002A566EDLL);
  }
  return a1;
}

uint64_t *sub_2194F72F4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 8);
    if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    MEMORY[0x21D48B5B0](v2, 0x30C40EEE2E2AFLL);
  }
  return a1;
}

uint64_t sub_2194F738C(uint64_t a1, uint64_t *a2, long long *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v8 = *a2;
  *(void *)a1 = &unk_26CAD6D80;
  *(void *)(a1 + 8) = v8;
  if (*((char *)a3 + 23) < 0)
  {
    sub_2194A3460((unsigned char *)(a1 + 16), *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v9 = *a3;
    *(void *)(a1 + 32) = *((void *)a3 + 2);
    *(_OWORD *)(a1 + 16) = v9;
  }
  uint64_t v10 = *a4;
  uint64_t v11 = *(void *)(*a4 + 64);
  *(void *)(a1 + 56) = *(void *)(*a4 + 56);
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 64) = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = *a5;
  if (!*a5) {
    operator new();
  }
  *a5 = 0;
  *(void *)(a1 + 72) = v12;
  return a1;
}

void sub_2194F74A8(_Unwind_Exception *a1)
{
  sub_21947E0B8(v3);
  sub_2194F72F4(v4);
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_2194F74D4(uint64_t a1)
{
  *(void *)a1 = &unk_26CAD6D80;
  uint64_t v2 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = 0;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 64));
    sub_2194FB578(v2 + 40, *(void **)(v2 + 48));
    uint64_t v3 = *(void **)(v2 + 16);
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
    size_t v5 = *(void **)v2;
    *(void *)uint64_t v2 = 0;
    if (v5) {
      operator delete(v5);
    }
    MEMORY[0x21D48B5B0](v2, 0x10A0C4002A566EDLL);
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a1 + 64);
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    uint64_t v7 = *(void *)(a1 + 48);
    *(void *)(a1 + 48) = 0;
    if (!v7) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    *(void *)(a1 + 48) = 0;
    if (!v7) {
      goto LABEL_14;
    }
  }
  uint64_t v8 = *(std::__shared_weak_count **)(v7 + 8);
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  MEMORY[0x21D48B5B0](v7, 0x30C40EEE2E2AFLL);
LABEL_14:
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

void sub_2194F7668(uint64_t a1)
{
  sub_2194F74D4(a1);

  JUMPOUT(0x21D48B5B0);
}

void sub_2194F76A0(void **a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = (std::mutex *)(*a1 + 7);
  std::mutex::lock(v7);
  uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  if ((v8 & 0x80u) == 0) {
    long long v9 = (unsigned char *)a2;
  }
  else {
    long long v9 = *(unsigned char **)a2;
  }
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v10 = 0;
  uint64_t v11 = v6 + 2;
  while (v9[v10] == 46)
  {
    if (v8 == ++v10) {
      goto LABEL_15;
    }
  }
  if (v10 == -1)
  {
LABEL_15:
    *a3 = **a1;
  }
  else
  {
    if (sub_2194F8034((void *)a2))
    {
      if (*(char *)(a2 + 23) < 0)
      {
        sub_2194A3460(&__dst, *(void **)a2, *(void *)(a2 + 8));
      }
      else
      {
        long long __dst = *(_OWORD *)a2;
        uint64_t v14 = *(void *)(a2 + 16);
      }
    }
    else
    {
      sub_2194F82CC(a2, (uint64_t)&__dst);
    }
    uint64_t v12 = sub_2194FB774(v11, (uint64_t)&__dst);
    if (!v12) {
      operator new();
    }
    *a3 = v12[5];
    if (SHIBYTE(v14) < 0) {
      operator delete((void *)__dst);
    }
  }
  std::mutex::unlock(v7);
}

void sub_2194F7EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,char a33)
{
  (*(void (**)(uint64_t))(*(void *)v35 + 8))(v35);
  sub_2194F7268((uint64_t *)(v36 - 136));
  sub_2194E4FB8((uint64_t)&a33);
  MEMORY[0x21D48B5B0](v34, 0x60C4044C4A2DFLL);
  if (*(char *)(v36 - 89) < 0) {
    operator delete(*(void **)(v36 - 112));
  }
  std::mutex::unlock(v33);
  _Unwind_Resume(a1);
}

BOOL sub_2194F8034(void *__s)
{
  uint64_t v2 = *((unsigned __int8 *)__s + 23);
  if (*((char *)__s + 23) < 0)
  {
    uint64_t v4 = __s[1];
    if (v4)
    {
      uint64_t v3 = (void *)*__s;
      goto LABEL_6;
    }
    return 1;
  }
  if (!*((unsigned char *)__s + 23)) {
    return 1;
  }
  uint64_t v3 = __s;
  uint64_t v4 = *((unsigned __int8 *)__s + 23);
LABEL_6:
  uint64_t v5 = 0;
  while (*((unsigned char *)v3 + v5) != 46)
  {
    if (v4 == ++v5) {
      goto LABEL_12;
    }
  }
  if (v4 != v5 && !v5) {
    return 0;
  }
LABEL_12:
  uint64_t v7 = (void *)*__s;
  uint64_t v6 = __s[1];
  if ((v2 & 0x80u) == 0) {
    uint64_t v8 = __s;
  }
  else {
    uint64_t v8 = (void *)*__s;
  }
  if ((v2 & 0x80u) == 0) {
    uint64_t v9 = *((unsigned __int8 *)__s + 23);
  }
  else {
    uint64_t v9 = __s[1];
  }
  uint64_t v10 = (char *)v8 - 1;
  while (v9)
  {
    int v11 = v10[v9--];
    if (v11 == 46)
    {
      if ((v2 & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_25;
    }
  }
  uint64_t v9 = -1;
  if ((v2 & 0x80) == 0)
  {
LABEL_22:
    uint64_t v7 = __s;
    uint64_t v6 = *((unsigned __int8 *)__s + 23);
    if (v9 == v2 - 1) {
      return 0;
    }
    goto LABEL_27;
  }
LABEL_25:
  if (v9 == v6 - 1) {
    return 0;
  }
LABEL_27:
  if (v6 >= 2)
  {
    uint64_t v12 = (char *)v7 + v6;
    size_t v13 = v7;
    do
    {
      uint64_t v14 = (char *)memchr(v13, 46, v6 - 1);
      if (!v14) {
        break;
      }
      if (*(_WORD *)v14 == 11822)
      {
        if (v14 == v12 || v14 - (char *)v7 == -1) {
          break;
        }
        return 0;
      }
      size_t v13 = v14 + 1;
      uint64_t v6 = v12 - (unsigned char *)v13;
    }
    while (v12 - (unsigned char *)v13 >= 2);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_267C33A50, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(qword_267C33A50))
  {
    sub_21947DECC(&qword_267C33B70, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_.");
    __cxa_atexit(MEMORY[0x263F8C0B8], &qword_267C33B70, &dword_219476000);
    __cxa_guard_release(qword_267C33A50);
  }
  int v16 = *((char *)__s + 23);
  if (v16 >= 0) {
    BOOL v17 = (char *)__s;
  }
  else {
    BOOL v17 = (char *)*__s;
  }
  if (v16 >= 0) {
    uint64_t v18 = *((unsigned __int8 *)__s + 23);
  }
  else {
    uint64_t v18 = __s[1];
  }
  if (byte_267C33B87 >= 0) {
    char v19 = &qword_267C33B70;
  }
  else {
    char v19 = (uint64_t *)qword_267C33B70;
  }
  if (byte_267C33B87 >= 0) {
    size_t v20 = byte_267C33B87;
  }
  else {
    size_t v20 = unk_267C33B78;
  }
  if (!v18) {
    return 1;
  }
  uint64_t v21 = v17;
  if (v20)
  {
    while (memchr(v19, *v21, v20))
    {
      ++v21;
      if (!--v18) {
        return 1;
      }
    }
  }
  return v21 - v17 == -1;
}

void sub_2194F82B4(_Unwind_Exception *a1)
{
}

void sub_2194F82CC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (sub_2194F8034((void *)a1))
  {
    if (*(char *)(a1 + 23) < 0)
    {
      uint64_t v4 = *(void **)a1;
      unint64_t v5 = *(void *)(a1 + 8);
      sub_2194A3460((unsigned char *)a2, v4, v5);
    }
    else
    {
      *(_OWORD *)a2 = *(_OWORD *)a1;
      *(void *)(a2 + 16) = *(void *)(a1 + 16);
    }
    return;
  }
  if (*(char *)(a1 + 23) < 0) {
    sub_2194A3460(&__dst, *(void **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __dst = *(std::string *)a1;
  }
  uint64_t v6 = 1;
LABEL_11:
  std::string::size_type v7 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  std::string::size_type size = __dst.__r_.__value_.__l.__size_;
  std::string::size_type v9 = __dst.__r_.__value_.__r.__words[0];
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int64_t v10 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  }
  else {
    int64_t v10 = __dst.__r_.__value_.__l.__size_;
  }
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_dst = &__dst;
  }
  else {
    p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  if (v10 < 2)
  {
    uint64_t v6 = v10;
  }
  else
  {
    uint64_t v12 = (char *)p_dst + v10;
    int64_t v13 = v10;
    uint64_t v14 = p_dst;
    do
    {
      uint64_t v15 = (char *)memchr(v14, 46, v13 - 1);
      if (!v15) {
        break;
      }
      if (*(_WORD *)v15 == 11822)
      {
        if (v15 != v12 && v15 - (char *)p_dst != -1)
        {
          std::string::erase(&__dst, v15 - (char *)p_dst, 1uLL);
          goto LABEL_11;
        }
        break;
      }
      uint64_t v14 = (std::string *)(v15 + 1);
      int64_t v13 = v12 - (char *)v14;
    }
    while (v12 - (char *)v14 >= 2);
  }
  if (v6)
  {
    uint64_t v16 = 0;
    while (p_dst->__r_.__value_.__s.__data_[v16] != 46)
    {
      if (v10 == ++v16) {
        goto LABEL_35;
      }
    }
    if (v10 != v16 && !v16)
    {
      std::string::erase(&__dst, 0, 1uLL);
      std::string::size_type v7 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
      std::string::size_type size = __dst.__r_.__value_.__l.__size_;
      std::string::size_type v9 = __dst.__r_.__value_.__r.__words[0];
    }
  }
LABEL_35:
  if ((v7 & 0x80u) == 0) {
    BOOL v17 = &__dst;
  }
  else {
    BOOL v17 = (std::string *)v9;
  }
  if ((v7 & 0x80u) == 0) {
    uint64_t v18 = v7;
  }
  else {
    uint64_t v18 = size;
  }
  char v19 = (char *)&v17[-1].__r_.__value_.__r.__words[2] + 7;
  while (v18)
  {
    int v20 = v19[v18--];
    if (v20 == 46)
    {
      if ((v7 & 0x80) == 0) {
        goto LABEL_45;
      }
LABEL_48:
      if (v18 == size - 1) {
        goto LABEL_49;
      }
LABEL_52:
      std::string::size_type v21 = __dst.__r_.__value_.__l.__size_;
      if (__dst.__r_.__value_.__l.__size_)
      {
        uint64_t v22 = (std::string *)__dst.__r_.__value_.__r.__words[0];
        goto LABEL_54;
      }
LABEL_61:
      *(unsigned char *)(a2 + 23) = 0;
      *(unsigned char *)a2 = 0;
      if ((v7 & 0x80) == 0) {
        return;
      }
      goto LABEL_136;
    }
  }
  uint64_t v18 = -1;
  if ((v7 & 0x80) != 0) {
    goto LABEL_48;
  }
LABEL_45:
  std::string::size_type size = v7;
  if (v18 == v7 - 1)
  {
LABEL_49:
    std::string::erase(&__dst, size, 1uLL);
    LODWORD(v7) = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_52;
    }
  }
  if (!v7) {
    goto LABEL_61;
  }
  std::string::size_type v21 = v7;
  uint64_t v22 = &__dst;
LABEL_54:
  unint64_t v23 = (std::string *)((char *)v22 + v21);
  std::string::size_type v24 = v21 - 1;
  while (1)
  {
    std::string::value_type v25 = v22->__r_.__value_.__s.__data_[0];
    if ((atomic_load_explicit((atomic_uchar *volatile)qword_267C33A50, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(qword_267C33A50))
    {
      qword_267C33B70 = (uint64_t)operator new(0x48uLL);
      unk_267C33B78 = xmmword_21950E400;
      strcpy((char *)qword_267C33B70, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_.");
      __cxa_atexit(MEMORY[0x263F8C0B8], &qword_267C33B70, &dword_219476000);
      __cxa_guard_release(qword_267C33A50);
    }
    if (std::string::find((const std::string *)&qword_267C33B70, v25, 0) == -1) {
      break;
    }
    uint64_t v22 = (std::string *)((char *)v22 + 1);
    --v24;
    if (v22 == v23) {
      goto LABEL_73;
    }
  }
  if (v22 == v23 || (std::string *)((char *)&v22->__r_.__value_.__l.__data_ + 1) == v23)
  {
    unint64_t v23 = v22;
  }
  else
  {
    uint64_t v26 = 1;
    unint64_t v23 = v22;
    do
    {
      std::string::value_type v27 = v22->__r_.__value_.__s.__data_[v26];
      if ((atomic_load_explicit((atomic_uchar *volatile)qword_267C33A50, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(qword_267C33A50))
      {
        qword_267C33B70 = (uint64_t)operator new(0x48uLL);
        unk_267C33B78 = xmmword_21950E400;
        strcpy((char *)qword_267C33B70, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_.");
        __cxa_atexit(MEMORY[0x263F8C0B8], &qword_267C33B70, &dword_219476000);
        __cxa_guard_release(qword_267C33A50);
      }
      if (std::string::find((const std::string *)&qword_267C33B70, v27, 0) != -1)
      {
        v23->__r_.__value_.__s.__data_[0] = v22->__r_.__value_.__s.__data_[v26];
        unint64_t v23 = (std::string *)((char *)v23 + 1);
      }
      ++v26;
      --v24;
    }
    while (v24);
  }
LABEL_73:
  uint64_t v28 = (char *)&__dst + HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
  {
    uint64_t v29 = &__dst;
  }
  else
  {
    uint64_t v28 = (char *)(__dst.__r_.__value_.__r.__words[0] + __dst.__r_.__value_.__l.__size_);
    uint64_t v29 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  std::string::erase(&__dst, (char *)v23 - (char *)v29, v28 - (char *)v23);
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  unint64_t v60 = 0;
  sub_2194F8BF4((uint64_t)v52, (uint64_t)&__dst, 24);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v51 = 0;
  while (1)
  {
    uint64_t v31 = sub_2194F8F18(v52, (uint64_t)__p, 0x2Eu);
    if ((*((unsigned char *)v31 + *(void *)(*v31 - 24) + 32) & 5) != 0) {
      break;
    }
    uint64_t v32 = v59;
    if ((unint64_t)v59 < v60)
    {
      if (SHIBYTE(v51) < 0)
      {
        sub_2194A3460(v59, __p[0], (unint64_t)__p[1]);
      }
      else
      {
        long long v30 = *(_OWORD *)__p;
        *((void *)v59 + 2) = v51;
        *(_OWORD *)uint64_t v32 = v30;
      }
      uint64_t v59 = v32 + 24;
    }
    else
    {
      uint64_t v59 = sub_2194FB9A4(&v58, (uint64_t)__p);
    }
  }
  if (SHIBYTE(v51) < 0) {
    operator delete(__p[0]);
  }
  v52[0] = *MEMORY[0x263F8C2B8];
  uint64_t v33 = v52[0];
  uint64_t v34 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  uint64_t v35 = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)((char *)v52 + *(void *)(v52[0] - 24)) = v35;
  uint64_t v36 = v34;
  uint64_t v53 = v34;
  uint64_t v54 = MEMORY[0x263F8C318] + 16;
  if (v56 < 0) {
    operator delete(v55);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D48B530](v57);
  std::string::size_type v37 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v37 = __dst.__r_.__value_.__l.__size_;
  }
  if (v37)
  {
    sub_2194F6BF8((uint64_t)v52);
    uint64_t v38 = v58;
    uint64_t v39 = v59;
    if (v58 != v59)
    {
      if (v58[23] < 0)
      {
        sub_2194A3460(__p, *(void **)v58, *((void *)v58 + 1));
      }
      else
      {
        long long v40 = *(_OWORD *)v58;
        uint64_t v51 = *((void *)v58 + 2);
        *(_OWORD *)std::__fs::filesystem::path __p = v40;
      }
      if (v51 >= 0) {
        uint64_t v42 = HIBYTE(v51);
      }
      else {
        uint64_t v42 = (uint64_t)__p[1];
      }
      if (v42)
      {
        if (v51 >= 0) {
          uint64_t v43 = __p;
        }
        else {
          uint64_t v43 = (void **)__p[0];
        }
        sub_2194889DC(&v53, (uint64_t)v43, v42);
      }
      else
      {
        sub_2194889DC(&v53, (uint64_t)"_", 1);
      }
      if (SHIBYTE(v51) < 0) {
        operator delete(__p[0]);
      }
      for (uint64_t i = v38 + 24; i != v39; i += 24)
      {
        if (i[23] < 0)
        {
          sub_2194A3460(__p, *(void **)i, *((void *)i + 1));
        }
        else
        {
          long long v45 = *(_OWORD *)i;
          uint64_t v51 = *((void *)i + 2);
          *(_OWORD *)std::__fs::filesystem::path __p = v45;
        }
        sub_2194889DC(&v53, (uint64_t)".", 1);
        if (v51 >= 0) {
          uint64_t v46 = HIBYTE(v51);
        }
        else {
          uint64_t v46 = (uint64_t)__p[1];
        }
        if (v46)
        {
          if (v51 >= 0) {
            uint64_t v47 = __p;
          }
          else {
            uint64_t v47 = (void **)__p[0];
          }
          sub_2194889DC(&v53, (uint64_t)v47, v46);
        }
        else
        {
          sub_2194889DC(&v53, (uint64_t)"_", 1);
        }
        if (SHIBYTE(v51) < 0) {
          operator delete(__p[0]);
        }
      }
    }
    std::stringbuf::str();
    v52[0] = v33;
    *(void *)((char *)v52 + *(void *)(v33 - 24)) = v35;
    uint64_t v53 = v36;
    uint64_t v54 = MEMORY[0x263F8C318] + 16;
    if (v56 < 0) {
      operator delete(v55);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x21D48B530](v57);
    uint64_t v41 = v58;
    if (!v58) {
      goto LABEL_135;
    }
    goto LABEL_128;
  }
  *(unsigned char *)(a2 + 23) = 1;
  *(_WORD *)a2 = 95;
  uint64_t v41 = v58;
  if (v58)
  {
LABEL_128:
    uint64_t v48 = v59;
    uint64_t v49 = v41;
    if (v59 != v41)
    {
      do
      {
        if (*(v48 - 1) < 0) {
          operator delete(*((void **)v48 - 3));
        }
        v48 -= 24;
      }
      while (v48 != v41);
      uint64_t v49 = v58;
    }
    uint64_t v59 = v41;
    operator delete(v49);
  }
LABEL_135:
  if ((*((unsigned char *)&__dst.__r_.__value_.__s + 23) & 0x80) == 0) {
    return;
  }
LABEL_136:
  operator delete(__dst.__r_.__value_.__l.__data_);
}

void sub_2194F8B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18)
{
  __cxa_guard_abort(qword_267C33A50);
  if (*(char *)(v18 - 89) < 0) {
    operator delete(*(void **)(v18 - 112));
  }
  _Unwind_Resume(a1);
}

uint64_t sub_2194F8BF4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v6 = a1 + 16;
  uint64_t v7 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  uint64_t v8 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v9 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v10 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v10;
  *(void *)(a1 + *(void *)(v10 - 24)) = v9;
  *(void *)(a1 + 8) = 0;
  int v11 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v11, (void *)(a1 + 24));
  uint64_t v12 = MEMORY[0x263F8C328] + 24;
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  uint64_t v13 = v8[5];
  uint64_t v14 = v8[4];
  *(void *)(a1 + 16) = v14;
  *(void *)(v6 + *(void *)(v14 - 24)) = v13;
  uint64_t v15 = v8[1];
  *(void *)a1 = v15;
  *(void *)(a1 + *(void *)(v15 - 24)) = v8[6];
  *(void *)a1 = v12;
  *(void *)(a1 + 128) = v5;
  *(void *)(a1 + 16) = v7;
  std::streambuf::basic_streambuf();
  uint64_t v16 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 24) = v16;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = a3;
  std::stringbuf::str();
  return a1;
}

void sub_2194F8EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (*(char *)(v11 + 111) < 0) {
    operator delete(*v10);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D48B530](a10);
  _Unwind_Resume(a1);
}

void *sub_2194F8F18(void *a1, uint64_t a2, unsigned __int8 a3)
{
  MEMORY[0x21D48B380](&v11, a1, 1);
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    uint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_2194F9078(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x2194F9038);
  }
  __cxa_rethrow();
}

void sub_2194F90F4(_Unwind_Exception *a1)
{
}

void **sub_2194F9108(void **a1)
{
  uint64_t v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v3 = (void **)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_2194F917C(char *a1, char **a2)
{
  int v2 = *((char *)a2 + 23);
  if (v2 >= 0) {
    unint64_t v3 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    unint64_t v3 = (unint64_t)a2[1];
  }
  unint64_t v4 = a1[23];
  if (a1[23] < 0)
  {
    unint64_t v5 = *((void *)a1 + 1);
    if (v3 <= v5) {
      return 0;
    }
  }
  else
  {
    unint64_t v5 = a1[23];
    if (v3 <= v4) {
      return 0;
    }
  }
  if (!v5) {
    return 1;
  }
  if (v2 >= 0) {
    uint64_t v7 = (char *)a2;
  }
  else {
    uint64_t v7 = *a2;
  }
  if ((v4 & 0x80u) == 0) {
    uint64_t v8 = a1;
  }
  else {
    uint64_t v8 = *(char **)a1;
  }
  if ((v4 & 0x80u) == 0) {
    int64_t v9 = a1[23];
  }
  else {
    int64_t v9 = *((void *)a1 + 1);
  }
  if (v9)
  {
    if ((uint64_t)v3 >= v9)
    {
      uint64_t v10 = &v7[v3];
      int v11 = *v8;
      int64_t v12 = v3;
      uint64_t v13 = v7;
      while (1)
      {
        int64_t v14 = v12 - v9;
        if (v14 == -1) {
          break;
        }
        uint64_t result = (uint64_t)memchr(v13, v11, v14 + 1);
        if (!result) {
          return result;
        }
        uint64_t v15 = result;
        uint64_t result = memcmp((const void *)result, v8, v9);
        if (!result)
        {
          if ((char *)v15 == v10 || (char *)v15 != v7) {
            return result;
          }
          goto LABEL_30;
        }
        uint64_t result = 0;
        uint64_t v13 = (char *)(v15 + 1);
        int64_t v12 = (int64_t)&v10[-v15 - 1];
        if (v12 < v9) {
          return result;
        }
      }
    }
    return 0;
  }
LABEL_30:
  if (v7[v9] != 46 || v3 <= v9 + 1) {
    return 0;
  }
  while (v7[v9 + 1] == 46)
  {
    uint64_t result = 0;
    if (v3 - 1 == ++v9) {
      return result;
    }
  }
  return v9 != -2;
}

uint64_t sub_2194F931C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_2194F9390(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(*(void *)(a1 + 72) + 64);
  std::mutex::lock(v2);
  unint64_t v3 = *(void **)(a1 + 72);
  unint64_t v4 = (void *)v3[6];
  v3 += 6;
  sub_2194FB578((uint64_t)(v3 - 1), v4);
  *(v3 - 1) = v3;
  *unint64_t v3 = 0;
  v3[1] = 0;

  std::mutex::unlock(v2);
}

void **sub_2194F93EC(void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    unint64_t v3 = (char *)a1[1];
    unint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        unint64_t v5 = (std::__shared_weak_count *)*((void *)v3 - 1);
        if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      unint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_2194F94A0(uint64_t result, int a2)
{
  uint64_t v2 = *(_DWORD ***)(result + 48);
  if (!v2)
  {
    std::mutex::lock((std::mutex *)(*(void *)(result + 8) + 56));
    operator new();
  }
  **uint64_t v2 = a2;
  return result;
}

void sub_2194F9914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11)
{
  if (a11 == a10)
  {
    uint64_t v13 = __p;
    if (!__p) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = __p;
    if (!__p)
    {
LABEL_3:
      std::mutex::unlock(v11);
      _Unwind_Resume(a1);
    }
  }
  operator delete(v13);
  std::mutex::unlock(v11);
  _Unwind_Resume(a1);
}

void sub_2194F996C(_Unwind_Exception *a1)
{
  MEMORY[0x21D48B5B0](v3, 0x1000C4052888210);
  MEMORY[0x21D48B5B0](v2, 0x30C40EEE2E2AFLL);
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2194F99B8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2194F99CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2194FD7AC((uint64_t)&a9);
  std::mutex::unlock(v9);
  _Unwind_Resume(a1);
}

uint64_t sub_2194F99E8(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  do
  {
    uint64_t v4 = *(void *)(v3 + 72);
    unint64_t v5 = *(void **)(v4 + 40);
    uint64_t v6 = (void *)(v4 + 48);
    if (v5 != (void *)(v4 + 48))
    {
      do
      {
        uint64_t result = (*(uint64_t (**)(void, uint64_t))(*(void *)v5[5] + 16))(v5[5], a2);
        uint64_t v7 = (void *)v5[1];
        if (v7)
        {
          do
          {
            uint64_t v8 = v7;
            uint64_t v7 = (void *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            uint64_t v8 = (void *)v5[2];
            BOOL v9 = *v8 == (void)v5;
            unint64_t v5 = v8;
          }
          while (!v9);
        }
        unint64_t v5 = v8;
      }
      while (v8 != v6);
    }
    uint64_t v3 = *(void *)(v3 + 40);
  }
  while (v3);
  return result;
}

void **sub_2194F9AA0@<X0>(void **result@<X0>, void *a2@<X8>)
{
  *a2 = **result;
  return result;
}

void sub_2194F9AB0(void **a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a1;
  sub_2194F76A0(&v3, a2, a3);
}

void sub_2194F9ADC()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

void sub_2194F9E00(_Unwind_Exception *a1)
{
  MEMORY[0x21D48B5B0](v1, 0x1093C402D7449D9);
  MEMORY[0x21D48B5B0](v2, 0x10A1C40DF6760FDLL);
  _Unwind_Resume(a1);
}

void *sub_2194F9ED4()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_267C33A78, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(qword_267C33A78))
  {
    return &qword_267C33D10;
  }
  sub_21947DECC(__p, "%d [%t] %p %c: %m%n");
  sub_2194FA1B0(&qword_267C33D10, (long long *)__p);
  if (v2 < 0) {
    operator delete(__p[0]);
  }
  __cxa_atexit((void (*)(void *))sub_2194FA26C, &qword_267C33D10, &dword_219476000);
  __cxa_guard_release(qword_267C33A78);
  return &qword_267C33D10;
}

void sub_2194F9F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    __cxa_guard_abort(qword_267C33A78);
    _Unwind_Resume(a1);
  }
  __cxa_guard_abort(qword_267C33A78);
  _Unwind_Resume(a1);
}

void *sub_2194F9FD4(void *a1, uint64_t a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >> 60) {
      sub_219486AE4();
    }
    uint64_t v5 = 16 * a3;
    uint64_t v6 = (char *)operator new(16 * a3);
    uint64_t v7 = 0;
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v5];
    do
    {
      uint64_t v8 = a2 + v7;
      BOOL v9 = &v6[v7];
      uint64_t v10 = *(void *)(a2 + v7 + 8);
      *(void *)BOOL v9 = *(void *)(a2 + v7);
      *((void *)v9 + 1) = v10;
      if (v10) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
      }
      v7 += 16;
    }
    while (v8 + 16 != a2 + v5);
    a1[1] = &v6[v7];
  }
  return a1;
}

void sub_2194FA084(_Unwind_Exception *exception_object)
{
  if (*(void *)v1) {
    sub_21950AC80((void **)(v1 + 8), *(char **)v1, (void **)v1);
  }
  _Unwind_Resume(exception_object);
}

long long *sub_2194FA0A8()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_267C33A68, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(qword_267C33A68))
  {
    return &xmmword_267C33B88;
  }
  sub_21947DECC(&xmmword_267C33B88, "ILayout");
  __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_267C33B88, &dword_219476000);
  __cxa_guard_release(qword_267C33A68);
  return &xmmword_267C33B88;
}

void sub_2194FA140(_Unwind_Exception *a1)
{
}

void *sub_2194FA158@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(*(void *)a1 + 48))(&v4);
  *a2 = v4;
  return result;
}

void *sub_2194FA1B0(void *a1, long long *a2)
{
  *a1 = &unk_26CAD6DA0;
  uint64_t v3 = a1 + 1;
  if (*((char *)a2 + 23) < 0)
  {
    sub_2194A3460(v3, *(void **)a2, *((void *)a2 + 1));
    if (atomic_load_explicit((atomic_uchar *volatile)&qword_267C33AA0, memory_order_acquire)) {
      return a1;
    }
  }
  else
  {
    long long v4 = *a2;
    v3[2] = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
    if (atomic_load_explicit((atomic_uchar *volatile)&qword_267C33AA0, memory_order_acquire)) {
      return a1;
    }
  }
  if (!__cxa_guard_acquire(&qword_267C33AA0)) {
    return a1;
  }
  qword_267C33A98 = std::chrono::steady_clock::now().__d_.__rep_;
  __cxa_guard_release(&qword_267C33AA0);
  return a1;
}

uint64_t sub_2194FA26C(uint64_t result)
{
  uint64_t v1 = result;
  *(void *)uint64_t result = &unk_26CAD6DA0;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_2194FA2CC(uint64_t a1)
{
  *(void *)a1 = &unk_26CAD6DA0;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x21D48B5B0);
}

long long *sub_2194FA33C()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33A88, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C33A88))
  {
    return &xmmword_267C33BA0;
  }
  sub_21947DECC(&xmmword_267C33BA0, "PatternLayout");
  __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_267C33BA0, &dword_219476000);
  __cxa_guard_release(&qword_267C33A88);
  return &xmmword_267C33BA0;
}

void sub_2194FA3D4(_Unwind_Exception *a1)
{
}

uint64_t sub_2194FA3EC(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2 / 1000 % 1000;
  if (v3 >= 0) {
    unint64_t v4 = *a2 / 1000 % 1000;
  }
  else {
    unint64_t v4 = v3 + 1000;
  }
  *(void *)&__t.tm_sec = *a2 - 1000 * v4;
  time_t v21 = std::chrono::system_clock::to_time_t((const std::chrono::system_clock::time_point *)&__t);
  uint64_t v5 = localtime_r(&v21, &__t);
  strcpy(__s, "yyyy.mm.dd.HH-MM.SS.fff");
  size_t v6 = strlen(__s);
  strftime(__s, v6, "%Y-%m-%d %H:%M:%S", v5);
  size_t v7 = strlen(__s);
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    sub_21947DF80();
  }
  size_t v8 = v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    p_dst = (void **)operator new(v10 + 1);
    size_t v18 = v8;
    int64_t v19 = v11 | 0x8000000000000000;
    std::string __dst = p_dst;
    goto LABEL_11;
  }
  HIBYTE(v19) = v7;
  p_dst = (void **)&__dst;
  if (v7) {
LABEL_11:
  }
    memcpy(p_dst, __s, v8);
  int64_t v12 = (void *)(a1 + 16);
  *((unsigned char *)p_dst + v8) = 0;
  if (v19 >= 0) {
    uint64_t v13 = (void **)&__dst;
  }
  else {
    uint64_t v13 = __dst;
  }
  if (v19 >= 0) {
    uint64_t v14 = HIBYTE(v19);
  }
  else {
    uint64_t v14 = v18;
  }
  uint64_t v15 = sub_2194889DC(v12, (uint64_t)v13, v14);
  sub_2194889DC(v15, (uint64_t)",", 1);
  if (SHIBYTE(v19) < 0)
  {
    operator delete(__dst);
    if (v4 <= 9) {
      goto LABEL_20;
    }
  }
  else if (v4 <= 9)
  {
LABEL_20:
    sub_2194889DC(v12, (uint64_t)"00", 2);
    return std::ostream::operator<<();
  }
  if (v4 <= 0x63) {
    sub_2194889DC(v12, (uint64_t)"0", 1);
  }
  return std::ostream::operator<<();
}

void sub_2194FA608(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

long long *sub_2194FA630()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33A88, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C33A88))
  {
    return &xmmword_267C33BA0;
  }
  byte_267C33BB7 = 13;
  strcpy((char *)&xmmword_267C33BA0, "PatternLayout");
  __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_267C33BA0, &dword_219476000);
  __cxa_guard_release(&qword_267C33A88);
  return &xmmword_267C33BA0;
}

void sub_2194FA6D8(int a1, uint64_t *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33A90, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C33A90))
  {
    sub_2194FA33C();
    if (byte_267C33BB7 < 0)
    {
      sub_2194A3460(v3, (void *)xmmword_267C33BA0, *((unint64_t *)&xmmword_267C33BA0 + 1));
    }
    else
    {
      *(_OWORD *)uint64_t v3 = xmmword_267C33BA0;
      uint64_t v4 = unk_267C33BB0;
    }
    sub_2194FA0A8();
    if (byte_267C33B9F < 0)
    {
      sub_2194A3460(&__p, (void *)xmmword_267C33B88, *((unint64_t *)&xmmword_267C33B88 + 1));
    }
    else
    {
      long long __p = xmmword_267C33B88;
      uint64_t v6 = unk_267C33B98;
    }
    sub_2194FDF24(qword_267C33BB8, (uint64_t)v3, 2uLL);
    if (SHIBYTE(v6) < 0) {
      operator delete((void *)__p);
    }
    if (SHIBYTE(v4) < 0) {
      operator delete(v3[0]);
    }
    __cxa_atexit((void (*)(void *))sub_2194F9108, qword_267C33BB8, &dword_219476000);
    __cxa_guard_release(&qword_267C33A90);
  }
  if (a2 != qword_267C33BB8) {
    sub_2194FE0E8((uint64_t)a2, (std::string *)qword_267C33BB8[0], unk_267C33BC0, 0xAAAAAAAAAAAAAAABLL * ((unk_267C33BC0 - qword_267C33BB8[0]) >> 3));
  }
}

void sub_2194FA864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
  {
    operator delete(__p);
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      __cxa_guard_abort(&qword_267C33A90);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  __cxa_guard_abort(&qword_267C33A90);
  _Unwind_Resume(a1);
}

void sub_2194FA8C8(_Unwind_Exception *a1)
{
}

void sub_2194FA8E4()
{
}

void sub_2194FA984(_Unwind_Exception *a1)
{
  MEMORY[0x21D48B5B0](v1, 0x1093C402D7449D9);
  _Unwind_Resume(a1);
}

uint64_t sub_2194FA9A8(uint64_t a1, uint64_t a2)
{
  sub_2194F6BF8((uint64_t)v23);
  if (*(char *)(a1 + 31) < 0)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 < 2) {
      goto LABEL_50;
    }
    goto LABEL_5;
  }
  unint64_t v4 = *(unsigned __int8 *)(a1 + 31);
  if (v4 >= 2)
  {
LABEL_5:
    unint64_t v5 = 0;
    uint64_t v6 = (void *)(a1 + 8);
    for (unint64_t i = 1; i < v4; i += 2)
    {
      if (*(char *)(a1 + 31) < 0)
      {
        int v10 = *(char *)(a1 + 31);
        if (*(unsigned char *)(*v6 + v5) != 37)
        {
LABEL_21:
          uint64_t v15 = a1 + 8;
          if (v10 < 0) {
            uint64_t v15 = *v6;
          }
          LOBYTE(v27[0]) = *(unsigned char *)(v15 + v5);
          sub_2194889DC(v24, (uint64_t)v27, 1);
          unint64_t i = v5;
          goto LABEL_8;
        }
      }
      else
      {
        int v10 = *(char *)(a1 + 31);
        if (*((unsigned char *)v6 + v5) != 37) {
          goto LABEL_21;
        }
      }
      uint64_t v11 = a1 + 8;
      if (v10 < 0) {
        uint64_t v11 = *v6;
      }
      int64_t v12 = (unsigned char *)(v11 + i);
      if (v4 <= i + 1) {
        unint64_t v13 = i + 1;
      }
      else {
        unint64_t v13 = v4;
      }
      while (2)
      {
        switch(*v12)
        {
          case '%':
            uint64_t v16 = "%";
            goto LABEL_39;
          case 'F':
            size_t v8 = *(char **)(a2 + 32);
            BOOL v17 = strrchr(v8, 47);
            if (v17)
            {
              size_t v8 = v17 + 1;
            }
            else
            {
              int v20 = strrchr(v8, 92);
              if (v20) {
                size_t v8 = v20 + 1;
              }
            }
            goto LABEL_7;
          case 'L':
            std::ostream::operator<<();
            break;
          case 'c':
            size_t v8 = *(char **)a2;
            goto LABEL_7;
          case 'd':
            sub_2194FA3EC((uint64_t)v23, (void *)(a2 + 16));
            break;
          case 'f':
            size_t v8 = *(char **)(a2 + 48);
            goto LABEL_7;
          case 'm':
            std::stringbuf::str();
            if ((v28 & 0x80u) == 0) {
              size_t v18 = v27;
            }
            else {
              size_t v18 = (void **)v27[0];
            }
            if ((v28 & 0x80u) == 0) {
              uint64_t v19 = v28;
            }
            else {
              uint64_t v19 = (uint64_t)v27[1];
            }
            sub_2194889DC(v24, (uint64_t)v18, v19);
            if ((char)v28 < 0) {
              operator delete(v27[0]);
            }
            break;
          case 'n':
            uint64_t v16 = "\n";
LABEL_39:
            sub_2194889DC(v24, (uint64_t)v16, 1);
            break;
          case 'p':
            size_t v8 = off_2643A5B50[*(unsigned int *)(a2 + 24)];
LABEL_7:
            size_t v9 = strlen(v8);
            sub_2194889DC(v24, (uint64_t)v8, v9);
            break;
          case 'r':
            if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33AA0, memory_order_acquire) & 1) == 0
              && __cxa_guard_acquire(&qword_267C33AA0))
            {
              qword_267C33A98 = std::chrono::steady_clock::now().__d_.__rep_;
              __cxa_guard_release(&qword_267C33AA0);
            }
            std::ostream::operator<<();
            break;
          case 't':
            pthread_self();
            std::ostream::operator<<();
            break;
          default:
            uint64_t v14 = a1 + 8;
            if (*(char *)(a1 + 31) < 0) {
              uint64_t v14 = *v6;
            }
            int64_t v12 = (unsigned char *)(v14 + i++ + 1);
            if (i < v4) {
              continue;
            }
            unint64_t i = v13;
            break;
        }
        break;
      }
LABEL_8:
      unint64_t v5 = i + 1;
    }
  }
LABEL_50:
  std::stringbuf::str();
  v23[0] = *MEMORY[0x263F8C2B8];
  uint64_t v21 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v23 + *(void *)(v23[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v24[0] = v21;
  v24[1] = MEMORY[0x263F8C318] + 16;
  if (v25 < 0) {
    operator delete((void *)v24[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x21D48B530](&v26);
}

void sub_2194FAE04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  if (*(char *)(v2 - 89) < 0)
  {
    operator delete(*(void **)(v2 - 112));
    sub_2194888A4((uint64_t)va);
    _Unwind_Resume(a1);
  }
  sub_2194888A4((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_2194FAF88(void *a1)
{
  uint64_t v2 = a1[1];
  *a1 = &unk_26CAD6DE8;
  a1[1] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_2194FAFF4(void *a1)
{
  uint64_t v2 = a1[1];
  *a1 = &unk_26CAD6DE8;
  a1[1] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  JUMPOUT(0x21D48B5B0);
}

void sub_2194FB080(uint64_t a1, uint64_t a2)
{
  if (((1 << (*(_DWORD *)(a2 + 24) - 1)) | *(_DWORD *)(a1 + 16)) == *(_DWORD *)(a1 + 16))
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33AB0, memory_order_acquire) & 1) == 0)
    {
      uint64_t v8 = a1;
      int v9 = __cxa_guard_acquire(&qword_267C33AB0);
      a1 = v8;
      if (v9)
      {
        __cxa_atexit(MEMORY[0x263F8C118], &stru_267C338C8, &dword_219476000);
        __cxa_guard_release(&qword_267C33AB0);
        a1 = v8;
      }
    }
    (*(void (**)(void **__return_ptr))(**(void **)(a1 + 8) + 40))(&__p);
    std::mutex::lock(&stru_267C338C8);
    int v3 = *(_DWORD *)(a2 + 24);
    if ((v3 - 1) < 3)
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)qword_267C33AB8, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(qword_267C33AB8))
      {
        qword_267C33B60 = MEMORY[0x263F8C100];
        qword_267C33B68 = MEMORY[0x263F8C0F8];
        __cxa_guard_release(qword_267C33AB8);
      }
      if ((v12 & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      if ((v12 & 0x80u) == 0) {
        uint64_t v7 = v12;
      }
      else {
        uint64_t v7 = v11;
      }
      sub_2194889DC((void *)qword_267C33B60, (uint64_t)p_p, v7);
      if (atomic_load_explicit((atomic_uchar *volatile)qword_267C33AB8, memory_order_acquire)) {
        goto LABEL_22;
      }
    }
    else
    {
      if ((v3 - 4) >= 3) {
        goto LABEL_23;
      }
      if ((atomic_load_explicit((atomic_uchar *volatile)qword_267C33AB8, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(qword_267C33AB8))
      {
        qword_267C33B60 = MEMORY[0x263F8C100];
        qword_267C33B68 = MEMORY[0x263F8C0F8];
        __cxa_guard_release(qword_267C33AB8);
      }
      if ((v12 & 0x80u) == 0) {
        unint64_t v4 = &__p;
      }
      else {
        unint64_t v4 = __p;
      }
      if ((v12 & 0x80u) == 0) {
        uint64_t v5 = v12;
      }
      else {
        uint64_t v5 = v11;
      }
      sub_2194889DC((void *)qword_267C33B68, (uint64_t)v4, v5);
      if (atomic_load_explicit((atomic_uchar *volatile)qword_267C33AB8, memory_order_acquire))
      {
LABEL_22:
        std::ostream::flush();
LABEL_23:
        std::mutex::unlock(&stru_267C338C8);
        if ((char)v12 < 0) {
          operator delete(__p);
        }
        return;
      }
    }
    if (__cxa_guard_acquire(qword_267C33AB8))
    {
      qword_267C33B60 = MEMORY[0x263F8C100];
      qword_267C33B68 = MEMORY[0x263F8C0F8];
      __cxa_guard_release(qword_267C33AB8);
    }
    goto LABEL_22;
  }
}

void sub_2194FB2E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2194FB310()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33AA8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C33AA8))
  {
    byte_267C33BE7 = 15;
    strcpy((char *)&qword_267C33BD0, "ConsoleAppender");
    __cxa_atexit(MEMORY[0x263F8C0B8], &qword_267C33BD0, &dword_219476000);
    __cxa_guard_release(&qword_267C33AA8);
  }
  if (byte_267C33BE7 >= 0) {
    return &qword_267C33BD0;
  }
  else {
    return (uint64_t *)qword_267C33BD0;
  }
}

void sub_2194FB3BC(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

uint64_t sub_2194FB3F4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    JUMPOUT(0x21D48B5B0);
  }
  return result;
}

uint64_t sub_2194FB414(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrIN4tlog8LogLevelEE27__shared_ptr_default_deleteIS2_S2_EE") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"NSt3__110shared_ptrIN4tlog8LogLevelEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrIN4tlog8LogLevelEE27__shared_ptr_default_deleteIS2_S2_EE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrIN4tlog8LogLevelEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_2194FB48C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

uint64_t sub_2194FB4C4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_2194FB4F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021950E610) {
    return a1 + 24;
  }
  if (((v3 & 0x800000021950E610 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021950E610)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021950E610 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void sub_2194FB578(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2194FB578(a1, *a2);
    sub_2194FB578(a1, a2[1]);
    unint64_t v4 = (std::__shared_weak_count *)a2[6];
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      uint64_t v5 = a2;
    }
    else
    {
      uint64_t v5 = a2;
    }
    operator delete(v5);
  }
}

uint64_t **sub_2194FB634(uint64_t **a1, long long *a2)
{
  unint64_t v4 = operator new(0x38uLL);
  uint64_t v5 = v4;
  long long v6 = *a2;
  uint64_t v7 = (std::__shared_weak_count *)*((void *)a2 + 2);
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  uint64_t v8 = a1 + 1;
  int v9 = a1[1];
  *((_OWORD *)v4 + 2) = v6;
  v4[6] = v7;
  if (v9)
  {
    while (1)
    {
      while (1)
      {
        int v10 = (uint64_t **)v9;
        unint64_t v11 = v9[4];
        if ((unint64_t)v6 >= v11) {
          break;
        }
        int v9 = (uint64_t *)*v9;
        uint64_t v8 = v10;
        if (!*v10) {
          goto LABEL_9;
        }
      }
      if (v11 >= (unint64_t)v6) {
        break;
      }
      int v9 = (uint64_t *)v9[1];
      if (!v9)
      {
        uint64_t v8 = v10 + 1;
        goto LABEL_9;
      }
    }
    if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    operator delete(v5);
    return v10;
  }
  else
  {
    int v10 = a1 + 1;
LABEL_9:
    *unint64_t v4 = 0;
    v4[1] = 0;
    v4[2] = v10;
    *uint64_t v8 = v4;
    unsigned __int8 v12 = (uint64_t *)**a1;
    unint64_t v13 = v4;
    if (v12)
    {
      *a1 = v12;
      unint64_t v13 = *v8;
    }
    sub_21948D030(a1[1], v13);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    return (uint64_t **)v5;
  }
}

uint64_t *sub_2194FB774(void *a1, uint64_t a2)
{
  uint64_t v2 = (unsigned char *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = sub_2194A2E64((uint64_t)&v25, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v10 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v10 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v7 - 1) & v6;
  }
  unsigned __int8 v12 = *(uint64_t ***)(*a1 + 8 * v10);
  if (v12)
  {
    unint64_t v13 = *v12;
    if (*v12)
    {
      char v14 = v2[23];
      if (v14 >= 0) {
        uint64_t v15 = v2[23];
      }
      else {
        uint64_t v15 = *((void *)v2 + 1);
      }
      if (v14 < 0) {
        uint64_t v2 = *(unsigned char **)v2;
      }
      if (v9.u32[0] < 2uLL)
      {
        uint64_t v16 = *(void *)&v7 - 1;
        while (1)
        {
          uint64_t v21 = v13[1];
          if (v21 == v8)
          {
            uint64_t v22 = *((unsigned __int8 *)v13 + 39);
            if ((v22 & 0x80u) == 0) {
              uint64_t v23 = *((unsigned __int8 *)v13 + 39);
            }
            else {
              uint64_t v23 = v13[3];
            }
            if (v23 == v15)
            {
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp((const void *)v13[2], v2, v13[3])) {
                  return v13;
                }
              }
              else
              {
                if (!*((unsigned char *)v13 + 39)) {
                  return v13;
                }
                uint64_t v24 = 0;
                while (*((unsigned __int8 *)v13 + v24 + 16) == v2[v24])
                {
                  if (v22 == ++v24) {
                    return v13;
                  }
                }
              }
            }
          }
          else if ((v21 & v16) != v10)
          {
            return 0;
          }
          uint64_t result = 0;
          unint64_t v13 = (uint64_t *)*v13;
          if (!v13) {
            return result;
          }
        }
      }
      while (1)
      {
        unint64_t v17 = v13[1];
        if (v17 == v8)
        {
          uint64_t v18 = *((unsigned __int8 *)v13 + 39);
          if ((v18 & 0x80u) == 0) {
            uint64_t v19 = *((unsigned __int8 *)v13 + 39);
          }
          else {
            uint64_t v19 = v13[3];
          }
          if (v19 == v15)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v13[2], v2, v13[3])) {
                return v13;
              }
            }
            else
            {
              if (!*((unsigned char *)v13 + 39)) {
                return v13;
              }
              uint64_t v20 = 0;
              while (*((unsigned __int8 *)v13 + v20 + 16) == v2[v20])
              {
                if (v18 == ++v20) {
                  return v13;
                }
              }
            }
          }
        }
        else
        {
          if (v17 >= *(void *)&v7) {
            v17 %= *(void *)&v7;
          }
          if (v17 != v10) {
            return 0;
          }
        }
        uint64_t result = 0;
        unint64_t v13 = (uint64_t *)*v13;
        if (!v13) {
          return result;
        }
      }
    }
  }
  return 0;
}

char *sub_2194FB9A4(char **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_219486AE4();
  }
  if (0x5555555555555556 * ((a1[2] - v3) >> 3) > v6) {
    unint64_t v6 = 0x5555555555555556 * ((a1[2] - v3) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3) >= 0x555555555555555) {
    unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      sub_219486AFC();
    }
    uint8x8_t v9 = (char *)operator new(24 * v8);
  }
  else
  {
    uint8x8_t v9 = 0;
  }
  unint64_t v10 = &v9[24 * v5];
  uint64_t v16 = v10;
  unint64_t v17 = v10;
  uint64_t v18 = &v9[24 * v8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_2194A3460(v10, *(void **)a2, *(void *)(a2 + 8));
    uint64_t v3 = *a1;
    unint64_t v4 = a1[1];
    unint64_t v10 = v16;
    unint64_t v11 = v17 + 24;
    if (v4 == *a1)
    {
LABEL_17:
      unint64_t v13 = v3;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)unint64_t v10 = *(_OWORD *)a2;
    *((void *)v10 + 2) = *(void *)(a2 + 16);
    unint64_t v11 = v10 + 24;
    if (v4 == v3) {
      goto LABEL_17;
    }
  }
  do
  {
    long long v12 = *(_OWORD *)(v4 - 24);
    *((void *)v10 - 1) = *((void *)v4 - 1);
    *(_OWORD *)(v10 - 24) = v12;
    v10 -= 24;
    *((void *)v4 - 2) = 0;
    *((void *)v4 - 1) = 0;
    *((void *)v4 - 3) = 0;
    v4 -= 24;
  }
  while (v4 != v3);
  unint64_t v13 = *a1;
  uint64_t v3 = a1[1];
LABEL_18:
  *a1 = v10;
  a1[1] = v11;
  a1[2] = v18;
  if (v3 != v13)
  {
    char v14 = (void **)(v3 - 24);
    do
    {
      if (*((char *)v14 + 23) < 0) {
        operator delete(*v14);
      }
      v14 -= 3;
    }
    while (v14 + 3 != (void **)v13);
    uint64_t v3 = v13;
  }
  if (v3) {
    operator delete(v3);
  }
  return v11;
}

void sub_2194FBB68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2194FBB7C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2194FBB7C(uint64_t a1)
{
  uint64_t v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_2194FBBE4(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = HIDWORD(*a2);
  unint64_t v8 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69
     * ((0x9DDFEA08EB382D69 * (v7 ^ (v8 >> 47) ^ v8)) ^ ((0x9DDFEA08EB382D69 * (v7 ^ (v8 >> 47) ^ v8)) >> 47));
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v7 ^ (v8 >> 47) ^ v8)) ^ ((0x9DDFEA08EB382D69 * (v7 ^ (v8 >> 47) ^ v8)) >> 47));
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
    }
    else
    {
      unint64_t v3 = v9 & (v10 - 1);
    }
    long long v12 = *(void **)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      unint64_t v13 = (void *)*v12;
      if (*v12)
      {
        if (v11.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v15 = v13[1];
            if (v15 == v9)
            {
              if (v13[2] == v6) {
                return v13;
              }
            }
            else if ((v15 & (v10 - 1)) != v3)
            {
              goto LABEL_23;
            }
            unint64_t v13 = (void *)*v13;
            if (!v13) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v9)
          {
            if (v13[2] == v6) {
              return v13;
            }
          }
          else
          {
            if (v14 >= v10) {
              v14 %= v10;
            }
            if (v14 != v3) {
              break;
            }
          }
          unint64_t v13 = (void *)*v13;
        }
        while (v13);
      }
    }
  }
LABEL_23:
  unint64_t v17 = operator new(0x18uLL);
  *unint64_t v17 = 0;
  v17[1] = v9;
  _OWORD v17[2] = *a3;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (v10 && (float)(v19 * (float)v10) >= v18)
  {
    uint64_t v20 = *(void *)a1;
    uint64_t v21 = *(void **)(*(void *)a1 + 8 * v3);
    if (v21)
    {
LABEL_26:
      *unint64_t v17 = *v21;
LABEL_61:
      *uint64_t v21 = v17;
      goto LABEL_62;
    }
  }
  else
  {
    BOOL v22 = 1;
    if (v10 >= 3) {
      BOOL v22 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v10);
    unint64_t v24 = vcvtps_u32_f32(v18 / v19);
    if (v23 <= v24) {
      size_t prime = v24;
    }
    else {
      size_t prime = v23;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v10 = *(void *)(a1 + 8);
    }
    if (prime > v10) {
      goto LABEL_37;
    }
    if (prime < v10)
    {
      unint64_t v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v10 < 3 || (uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        unint64_t v26 = std::__next_prime(v26);
      }
      else
      {
        uint64_t v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2) {
          unint64_t v26 = v28;
        }
      }
      if (prime <= v26) {
        size_t prime = v26;
      }
      if (prime < v10) {
LABEL_37:
      }
        sub_2194A32B0(a1, prime);
    }
    unint64_t v10 = *(void *)(a1 + 8);
    unint64_t v29 = v10 - 1;
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
      {
        unint64_t v3 = v9 % v10;
        uint64_t v20 = *(void *)a1;
        uint64_t v21 = *(void **)(*(void *)a1 + 8 * (v9 % v10));
        if (v21) {
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v3 = v9;
        uint64_t v20 = *(void *)a1;
        uint64_t v21 = *(void **)(*(void *)a1 + 8 * v9);
        if (v21) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      unint64_t v3 = v29 & v9;
      uint64_t v20 = *(void *)a1;
      uint64_t v21 = *(void **)(*(void *)a1 + 8 * (v29 & v9));
      if (v21) {
        goto LABEL_26;
      }
    }
  }
  *unint64_t v17 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v17;
  *(void *)(v20 + 8 * v3) = a1 + 16;
  if (*v17)
  {
    unint64_t v30 = *(void *)(*v17 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v30 >= v10) {
        v30 %= v10;
      }
    }
    else
    {
      v30 &= v10 - 1;
    }
    uint64_t v21 = (void *)(*(void *)a1 + 8 * v30);
    goto LABEL_61;
  }
LABEL_62:
  ++*(void *)(a1 + 24);
  return v17;
}

void sub_2194FBF2C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_2194FBF40@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    unint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

uint64_t sub_2194FC074(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  size_t prime = *(void *)(a2 + 8);
  if (prime == 1)
  {
    size_t prime = 2;
LABEL_17:
    sub_2194A32B0(a1, prime);
    goto LABEL_18;
  }
  if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(*(void *)(a2 + 8));
    int8x8_t v5 = *(int8x8_t *)(a1 + 8);
    BOOL v6 = prime >= *(void *)&v5;
    if (prime > *(void *)&v5) {
      goto LABEL_17;
    }
  }
  else
  {
    int8x8_t v5 = 0;
    BOOL v6 = 1;
    if (prime) {
      goto LABEL_17;
    }
  }
  if (!v6)
  {
    unint64_t v7 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v5 < 3uLL || (uint8x8_t v8 = (uint8x8_t)vcnt_s8(v5), v8.i16[0] = vaddlv_u8(v8), v8.u32[0] > 1uLL))
    {
      unint64_t v7 = std::__next_prime(v7);
    }
    else
    {
      uint64_t v9 = 1 << -(char)__clz(v7 - 1);
      if (v7 >= 2) {
        unint64_t v7 = v9;
      }
    }
    if (prime <= v7) {
      size_t prime = v7;
    }
    if (prime < *(void *)&v5) {
      goto LABEL_17;
    }
  }
LABEL_18:
  for (unint64_t i = *(void **)(a2 + 16); i; unint64_t i = (void *)*i)
    sub_2194FC1B8(a1, i + 2, i + 2);
  return a1;
}

void sub_2194FC190(_Unwind_Exception *a1)
{
  sub_2194E4FB8(v1);
  _Unwind_Resume(a1);
}

void sub_2194FC1A4(_Unwind_Exception *a1)
{
  sub_2194E4FB8(v1);
  _Unwind_Resume(a1);
}

void *sub_2194FC1B8(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = HIDWORD(*a2);
  unint64_t v8 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69
     * ((0x9DDFEA08EB382D69 * (v7 ^ (v8 >> 47) ^ v8)) ^ ((0x9DDFEA08EB382D69 * (v7 ^ (v8 >> 47) ^ v8)) >> 47));
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v7 ^ (v8 >> 47) ^ v8)) ^ ((0x9DDFEA08EB382D69 * (v7 ^ (v8 >> 47) ^ v8)) >> 47));
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
    }
    else
    {
      unint64_t v3 = v9 & (v10 - 1);
    }
    long long v12 = *(void **)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      unint64_t v13 = (void *)*v12;
      if (*v12)
      {
        if (v11.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v15 = v13[1];
            if (v15 == v9)
            {
              if (v13[2] == v6) {
                return v13;
              }
            }
            else if ((v15 & (v10 - 1)) != v3)
            {
              goto LABEL_23;
            }
            unint64_t v13 = (void *)*v13;
            if (!v13) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v9)
          {
            if (v13[2] == v6) {
              return v13;
            }
          }
          else
          {
            if (v14 >= v10) {
              v14 %= v10;
            }
            if (v14 != v3) {
              break;
            }
          }
          unint64_t v13 = (void *)*v13;
        }
        while (v13);
      }
    }
  }
LABEL_23:
  unint64_t v17 = operator new(0x18uLL);
  *unint64_t v17 = 0;
  v17[1] = v9;
  _OWORD v17[2] = *a3;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (v10 && (float)(v19 * (float)v10) >= v18)
  {
    uint64_t v20 = *(void *)a1;
    uint64_t v21 = *(void **)(*(void *)a1 + 8 * v3);
    if (v21)
    {
LABEL_26:
      *unint64_t v17 = *v21;
LABEL_61:
      *uint64_t v21 = v17;
      goto LABEL_62;
    }
  }
  else
  {
    BOOL v22 = 1;
    if (v10 >= 3) {
      BOOL v22 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v10);
    unint64_t v24 = vcvtps_u32_f32(v18 / v19);
    if (v23 <= v24) {
      size_t prime = v24;
    }
    else {
      size_t prime = v23;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v10 = *(void *)(a1 + 8);
    }
    if (prime > v10) {
      goto LABEL_37;
    }
    if (prime < v10)
    {
      unint64_t v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v10 < 3 || (uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        unint64_t v26 = std::__next_prime(v26);
      }
      else
      {
        uint64_t v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2) {
          unint64_t v26 = v28;
        }
      }
      if (prime <= v26) {
        size_t prime = v26;
      }
      if (prime < v10) {
LABEL_37:
      }
        sub_2194A32B0(a1, prime);
    }
    unint64_t v10 = *(void *)(a1 + 8);
    unint64_t v29 = v10 - 1;
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
      {
        unint64_t v3 = v9 % v10;
        uint64_t v20 = *(void *)a1;
        uint64_t v21 = *(void **)(*(void *)a1 + 8 * (v9 % v10));
        if (v21) {
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v3 = v9;
        uint64_t v20 = *(void *)a1;
        uint64_t v21 = *(void **)(*(void *)a1 + 8 * v9);
        if (v21) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      unint64_t v3 = v29 & v9;
      uint64_t v20 = *(void *)a1;
      uint64_t v21 = *(void **)(*(void *)a1 + 8 * (v29 & v9));
      if (v21) {
        goto LABEL_26;
      }
    }
  }
  *unint64_t v17 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v17;
  *(void *)(v20 + 8 * v3) = a1 + 16;
  if (*v17)
  {
    unint64_t v30 = *(void *)(*v17 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v30 >= v10) {
        v30 %= v10;
      }
    }
    else
    {
      v30 &= v10 - 1;
    }
    uint64_t v21 = (void *)(*(void *)a1 + 8 * v30);
    goto LABEL_61;
  }
LABEL_62:
  ++*(void *)(a1 + 24);
  return v17;
}

void sub_2194FC500(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_2194FC514(uint64_t a1, uint64_t a2, long long *a3)
{
  int8x8_t v5 = (unsigned char *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = sub_2194A2E64((uint64_t)v44, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v11) {
        unint64_t v3 = v9 % v11;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v9;
    }
    unint64_t v13 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      unint64_t v14 = (unsigned __int8 *)*v13;
      if (*v13)
      {
        char v15 = v5[23];
        if (v15 >= 0) {
          uint64_t v16 = v5[23];
        }
        else {
          uint64_t v16 = *((void *)v5 + 1);
        }
        if (v15 < 0) {
          int8x8_t v5 = *(unsigned char **)v5;
        }
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v21 = *((void *)v14 + 1);
            if (v21 == v10)
            {
              uint64_t v22 = v14[39];
              if ((v22 & 0x80u) == 0) {
                uint64_t v23 = v14[39];
              }
              else {
                uint64_t v23 = *((void *)v14 + 3);
              }
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp(*((const void **)v14 + 2), v5, *((void *)v14 + 3))) {
                    return v14;
                  }
                }
                else
                {
                  if (!v14[39]) {
                    return v14;
                  }
                  uint64_t v24 = 0;
                  while (v14[v24 + 16] == v5[v24])
                  {
                    if (v22 == ++v24) {
                      return v14;
                    }
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            unint64_t v14 = *(unsigned __int8 **)v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = *((void *)v14 + 1);
          if (v17 == v10)
          {
            uint64_t v18 = v14[39];
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = v14[39];
            }
            else {
              uint64_t v19 = *((void *)v14 + 3);
            }
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp(*((const void **)v14 + 2), v5, *((void *)v14 + 3))) {
                  return v14;
                }
              }
              else
              {
                if (!v14[39]) {
                  return v14;
                }
                uint64_t v20 = 0;
                while (v14[v20 + 16] == v5[v20])
                {
                  if (v18 == ++v20) {
                    return v14;
                  }
                }
              }
            }
          }
          else
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
            if (v17 != v3) {
              break;
            }
          }
          unint64_t v14 = *(unsigned __int8 **)v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  char v25 = (void *)(a1 + 16);
  unint64_t v14 = (unsigned __int8 *)operator new(0x30uLL);
  long long v26 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  uint64_t v27 = *((void *)a3 + 2);
  uint64_t v28 = *((void *)a3 + 3);
  *((void *)a3 + 2) = 0;
  *((void *)a3 + 3) = 0;
  v44[0] = v14;
  v44[1] = a1 + 16;
  *(void *)unint64_t v14 = 0;
  *((void *)v14 + 1) = v10;
  *((_OWORD *)v14 + 1) = v26;
  *((void *)v14 + 4) = v27;
  *((void *)v14 + 5) = v28;
  char v45 = 1;
  float v29 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v30 = *(float *)(a1 + 32);
  if (v11 && (float)(v30 * (float)v11) >= v29)
  {
    uint64_t v31 = *(void *)a1;
    uint64_t v32 = *(void **)(*(void *)a1 + 8 * v3);
    if (v32)
    {
LABEL_54:
      *(void *)unint64_t v14 = *v32;
LABEL_89:
      *uint64_t v32 = v14;
      goto LABEL_90;
    }
  }
  else
  {
    BOOL v33 = 1;
    if (v11 >= 3) {
      BOOL v33 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v34 = v33 | (2 * v11);
    unint64_t v35 = vcvtps_u32_f32(v29 / v30);
    if (v34 <= v35) {
      size_t prime = v35;
    }
    else {
      size_t prime = v34;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v37 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v37) {
      goto LABEL_65;
    }
    if (prime < *(void *)&v37)
    {
      unint64_t v38 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v37 < 3uLL || (uint8x8_t v39 = (uint8x8_t)vcnt_s8(v37), v39.i16[0] = vaddlv_u8(v39), v39.u32[0] > 1uLL))
      {
        unint64_t v38 = std::__next_prime(v38);
      }
      else
      {
        uint64_t v40 = 1 << -(char)__clz(v38 - 1);
        if (v38 >= 2) {
          unint64_t v38 = v40;
        }
      }
      if (prime <= v38) {
        size_t prime = v38;
      }
      if (prime < *(void *)&v37) {
LABEL_65:
      }
        sub_2194A32B0(a1, prime);
    }
    unint64_t v11 = *(void *)(a1 + 8);
    unint64_t v41 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        unint64_t v3 = v10 % v11;
        uint64_t v31 = *(void *)a1;
        uint64_t v32 = *(void **)(*(void *)a1 + 8 * (v10 % v11));
        if (v32) {
          goto LABEL_54;
        }
      }
      else
      {
        unint64_t v3 = v10;
        uint64_t v31 = *(void *)a1;
        uint64_t v32 = *(void **)(*(void *)a1 + 8 * v10);
        if (v32) {
          goto LABEL_54;
        }
      }
    }
    else
    {
      unint64_t v3 = v41 & v10;
      uint64_t v31 = *(void *)a1;
      uint64_t v32 = *(void **)(*(void *)a1 + 8 * (v41 & v10));
      if (v32) {
        goto LABEL_54;
      }
    }
  }
  *(void *)unint64_t v14 = *v25;
  void *v25 = v14;
  *(void *)(v31 + 8 * v3) = v25;
  if (*(void *)v14)
  {
    unint64_t v42 = *(void *)(*(void *)v14 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v42 >= v11) {
        v42 %= v11;
      }
    }
    else
    {
      v42 &= v11 - 1;
    }
    uint64_t v32 = (void *)(*(void *)a1 + 8 * v42);
    goto LABEL_89;
  }
LABEL_90:
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_2194FC920(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2194FC938((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_2194FC938(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      uint64_t v3 = *(void *)(v2 + 40);
      *(void *)(v2 + 40) = 0;
      if (v3) {
        (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
      }
      if (*(char *)(v2 + 39) < 0) {
        operator delete(*(void **)(v2 + 16));
      }
    }
    operator delete((void *)v2);
  }
  return a1;
}

void sub_2194FC9B8(void *a1, void *a2, unint64_t a3)
{
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  if (v7 == v6) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = ((v7 - v6) << 6) - 1;
  }
  uint64_t v9 = a1[5];
  unint64_t v10 = v9 + a1[4];
  unint64_t v11 = v8 - v10;
  if (a3 > v11)
  {
    sub_2194FCB14((uint64_t)a1, a3 - v11);
    uint64_t v9 = a1[5];
    uint64_t v6 = a1[1];
    uint64_t v7 = a1[2];
    unint64_t v10 = a1[4] + v9;
  }
  uint8x8_t v12 = (void *)(v6 + 8 * (v10 >> 9));
  if (v7 == v6)
  {
    uint64_t v13 = 0;
    if (a3) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v16 = v13;
    char v15 = v12;
    goto LABEL_23;
  }
  uint64_t v13 = *v12 + 8 * (v10 & 0x1FF);
  if (!a3) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v14 = a3 + ((v13 - *v12) >> 3);
  if (v14 < 1)
  {
    unint64_t v17 = 511 - v14;
    LOWORD(v14) = ~(511 - v14);
    char v15 = &v12[-(v17 >> 9)];
  }
  else
  {
    char v15 = &v12[(unint64_t)v14 >> 9];
  }
  uint64_t v16 = *v15 + 8 * (v14 & 0x1FF);
LABEL_23:
  while (v13 != v16)
  {
    uint64_t v18 = v16;
    if (v12 != v15) {
      uint64_t v18 = *v12 + 4096;
    }
    if (v13 == v18)
    {
      a1[5] = v9;
      if (v12 == v15) {
        return;
      }
    }
    else
    {
      uint64_t v19 = (void *)v13;
      do
      {
        *v19++ = a2[2];
        a2 = (void *)*a2;
      }
      while (v19 != (void *)v18);
      uint64_t v9 = a1[5] + ((v18 - v13) >> 3);
      a1[5] = v9;
      if (v12 == v15) {
        return;
      }
    }
    uint64_t v20 = v12[1];
    ++v12;
    uint64_t v13 = v20;
  }
}

void sub_2194FCB14(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(char **)(a1 + 16);
  uint64_t v4 = (uint64_t)&v3[-*(void *)(a1 + 8)];
  if (v4) {
    unint64_t v5 = a2;
  }
  else {
    unint64_t v5 = a2 + 1;
  }
  if ((v5 & 0x1FF) != 0) {
    unint64_t v6 = (v5 >> 9) + 1;
  }
  else {
    unint64_t v6 = v5 >> 9;
  }
  unint64_t v7 = *(void *)(a1 + 32);
  if (v6 >= v7 >> 9) {
    unint64_t v8 = v7 >> 9;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v6 <= v7 >> 9)
  {
    *(void *)(a1 + 32) = v7 - (v8 << 9);
    if (!v8) {
      return;
    }
    while (1)
    {
      char v15 = *(void **)(a1 + 8);
      uint64_t v16 = (char *)(v15 + 1);
      uint64_t v17 = *v15;
      *(void *)(a1 + 8) = v15 + 1;
      if (v3 == *(char **)(a1 + 24))
      {
        uint64_t v18 = *(char **)a1;
        if ((unint64_t)v16 <= *(void *)a1)
        {
          unint64_t v24 = (v3 - v18) >> 2;
          if (v3 == v18) {
            unint64_t v24 = 1;
          }
          if (v24 >> 61) {
            goto LABEL_161;
          }
          unint64_t v25 = v24 >> 2;
          uint64_t v26 = 8 * v24;
          uint64_t v27 = (char *)operator new(8 * v24);
          uint64_t v28 = &v27[8 * v25];
          int64_t v30 = v3 - v16;
          BOOL v29 = v3 == v16;
          uint64_t v3 = v28;
          if (!v29)
          {
            uint64_t v3 = &v28[v30 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v31 = v30 - 8;
            if ((unint64_t)(v30 - 8) < 0x38)
            {
              uint64_t v32 = &v27[8 * v25];
              goto LABEL_39;
            }
            uint64_t v32 = &v27[8 * v25];
            if ((unint64_t)(v32 - v16) < 0x20) {
              goto LABEL_167;
            }
            uint64_t v33 = (v31 >> 3) + 1;
            uint64_t v34 = 8 * (v33 & 0x3FFFFFFFFFFFFFFCLL);
            uint64_t v32 = &v28[v34];
            v16 += v34;
            unint64_t v35 = (long long *)(v15 + 3);
            uint64_t v36 = &v27[8 * v25 + 16];
            uint64_t v37 = v33 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v38 = *v35;
              *((_OWORD *)v36 - 1) = *(v35 - 1);
              *(_OWORD *)uint64_t v36 = v38;
              v35 += 2;
              v36 += 32;
              v37 -= 4;
            }
            while (v37);
            if (v33 != (v33 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_167:
              do
              {
LABEL_39:
                uint64_t v39 = *(void *)v16;
                v16 += 8;
                *(void *)uint64_t v32 = v39;
                v32 += 8;
              }
              while (v32 != v3);
            }
          }
          *(void *)a1 = v27;
          *(void *)(a1 + 8) = v28;
          *(void *)(a1 + 16) = v3;
          *(void *)(a1 + 24) = &v27[v26];
          if (v18)
          {
            operator delete(v18);
            uint64_t v3 = *(char **)(a1 + 16);
          }
          goto LABEL_21;
        }
        uint64_t v19 = (uint64_t)&v16[-*(void *)a1] >> 3;
        if (v19 >= -1) {
          uint64_t v20 = v19 + 1;
        }
        else {
          uint64_t v20 = v19 + 2;
        }
        uint64_t v21 = v20 >> 1;
        uint64_t v22 = &v16[-8 * (v20 >> 1)];
        int64_t v23 = v3 - v16;
        if (v3 != v16)
        {
          memmove(&v16[-8 * (v20 >> 1)], v16, v3 - v16);
          uint64_t v3 = *(char **)(a1 + 8);
        }
        uint64_t v14 = &v3[-8 * v21];
        uint64_t v3 = &v22[v23];
        *(void *)(a1 + 8) = v14;
        *(void *)(a1 + 16) = &v22[v23];
      }
LABEL_21:
      *(void *)uint64_t v3 = v17;
      uint64_t v3 = (char *)(*(void *)(a1 + 16) + 8);
      *(void *)(a1 + 16) = v3;
      if (!--v8) {
        return;
      }
    }
  }
  unint64_t v9 = v6 - v8;
  uint64_t v10 = *(void *)(a1 + 24) - *(void *)a1;
  uint64_t v11 = v4 >> 3;
  if (v6 - v8 <= (v10 >> 3) - (v4 >> 3))
  {
    if (v9)
    {
      while (*(void *)(a1 + 24) != *(void *)(a1 + 16))
      {
        unint64_t v145 = operator new(0x1000uLL);
        sub_2194FD480((char **)a1, &v145);
        --v6;
        if (!--v9) {
          goto LABEL_136;
        }
      }
      for (uint64_t i = 0; i != v9; ++i)
      {
        unint64_t v145 = operator new(0x1000uLL);
        sub_2194FD610((void **)a1, &v145);
        if (*(void *)(a1 + 16) - *(void *)(a1 + 8) == 8) {
          uint64_t v116 = 511;
        }
        else {
          uint64_t v116 = 512;
        }
        uint64_t v117 = v116 + *(void *)(a1 + 32);
        *(void *)(a1 + 32) = v117;
      }
      unint64_t v8 = v6;
      *(void *)(a1 + 32) = v117 - (v6 << 9);
      if (!v6) {
        return;
      }
    }
    else
    {
LABEL_136:
      *(void *)(a1 + 32) -= v8 << 9;
      if (!v8) {
        return;
      }
    }
    int32x4_t v118 = *(char **)(a1 + 16);
    while (1)
    {
      int32x4_t v120 = *(void **)(a1 + 8);
      int32x4_t v121 = (char *)(v120 + 1);
      uint64_t v122 = *v120;
      *(void *)(a1 + 8) = v120 + 1;
      if (v118 == *(char **)(a1 + 24))
      {
        int8x16_t v123 = *(char **)a1;
        if ((unint64_t)v121 <= *(void *)a1)
        {
          unint64_t v129 = (v118 - v123) >> 2;
          if (v118 == v123) {
            unint64_t v129 = 1;
          }
          if (v129 >> 61) {
            goto LABEL_161;
          }
          unint64_t v130 = v129 >> 2;
          uint64_t v131 = 8 * v129;
          __int16 v132 = (char *)operator new(8 * v129);
          uint64_t v133 = &v132[8 * v130];
          int64_t v134 = v118 - v121;
          BOOL v29 = v118 == v121;
          int32x4_t v118 = v133;
          if (!v29)
          {
            int32x4_t v118 = &v133[v134 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v135 = v134 - 8;
            if ((unint64_t)(v134 - 8) < 0x38)
            {
              unint64_t v136 = &v132[8 * v130];
              goto LABEL_157;
            }
            unint64_t v136 = &v132[8 * v130];
            if ((unint64_t)(v136 - v121) < 0x20) {
              goto LABEL_168;
            }
            uint64_t v137 = (v135 >> 3) + 1;
            uint64_t v138 = 8 * (v137 & 0x3FFFFFFFFFFFFFFCLL);
            unint64_t v136 = &v133[v138];
            v121 += v138;
            unsigned int v139 = (long long *)(v120 + 3);
            int v140 = &v132[8 * v130 + 16];
            uint64_t v141 = v137 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v142 = *v139;
              *((_OWORD *)v140 - 1) = *(v139 - 1);
              *(_OWORD *)int v140 = v142;
              v139 += 2;
              v140 += 32;
              v141 -= 4;
            }
            while (v141);
            if (v137 != (v137 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_168:
              do
              {
LABEL_157:
                uint64_t v143 = *(void *)v121;
                v121 += 8;
                *(void *)unint64_t v136 = v143;
                v136 += 8;
              }
              while (v136 != v118);
            }
          }
          *(void *)a1 = v132;
          *(void *)(a1 + 8) = v133;
          *(void *)(a1 + 16) = v118;
          *(void *)(a1 + 24) = &v132[v131];
          if (v123)
          {
            operator delete(v123);
            int32x4_t v118 = *(char **)(a1 + 16);
          }
          goto LABEL_139;
        }
        uint64_t v124 = (uint64_t)&v121[-*(void *)a1] >> 3;
        if (v124 >= -1) {
          uint64_t v125 = v124 + 1;
        }
        else {
          uint64_t v125 = v124 + 2;
        }
        uint64_t v126 = v125 >> 1;
        int v127 = &v121[-8 * (v125 >> 1)];
        int64_t v128 = v118 - v121;
        if (v118 != v121)
        {
          memmove(&v121[-8 * (v125 >> 1)], v121, v118 - v121);
          int32x4_t v118 = *(char **)(a1 + 8);
        }
        int32x4_t v119 = &v118[-8 * v126];
        int32x4_t v118 = &v127[v128];
        *(void *)(a1 + 8) = v119;
        *(void *)(a1 + 16) = &v127[v128];
      }
LABEL_139:
      *(void *)int32x4_t v118 = v122;
      int32x4_t v118 = (char *)(*(void *)(a1 + 16) + 8);
      *(void *)(a1 + 16) = v118;
      if (!--v8) {
        return;
      }
    }
  }
  if (v10 >> 2 <= v9 + v11) {
    unint64_t v12 = v9 + v11;
  }
  else {
    unint64_t v12 = v10 >> 2;
  }
  if (v12)
  {
    if (v12 >> 61) {
LABEL_161:
    }
      sub_219486AFC();
    uint64_t v13 = (char *)operator new(8 * v12);
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v144 = v8 << 9;
  uint64_t v40 = &v13[8 * (v11 - v8)];
  unint64_t v41 = &v13[8 * v12];
  unint64_t v42 = v40;
  uint64_t v43 = v13;
  do
  {
    uint64_t v44 = operator new(0x1000uLL);
    if (v42 != v41) {
      goto LABEL_49;
    }
    if (v40 > v43)
    {
      char v45 = v43;
      uint64_t v46 = (v40 - v43) >> 3;
      if (v46 >= -1) {
        uint64_t v47 = v46 + 1;
      }
      else {
        uint64_t v47 = v46 + 2;
      }
      uint64_t v48 = v47 >> 1;
      uint64_t v49 = &v40[-8 * (v47 >> 1)];
      uint64_t v50 = v41;
      if (v41 != v40)
      {
        memmove(v49, v40, v41 - v40);
        uint64_t v50 = v40;
      }
      unint64_t v42 = &v49[v41 - v40];
      uint64_t v40 = &v50[-8 * v48];
      uint64_t v43 = v45;
      goto LABEL_49;
    }
    if (v41 == v43) {
      unint64_t v51 = 1;
    }
    else {
      unint64_t v51 = (v41 - v43) >> 2;
    }
    if (v51 >> 61) {
      sub_219486AFC();
    }
    uint64_t v52 = (char *)operator new(8 * v51);
    uint64_t v53 = v43;
    unint64_t v54 = v51 >> 2;
    uint64_t v55 = &v52[8 * (v51 >> 2)];
    unint64_t v42 = v55;
    int64_t v56 = v41 - v40;
    if (v41 != v40)
    {
      unint64_t v42 = &v55[v56 & 0xFFFFFFFFFFFFFFF8];
      unint64_t v57 = v56 - 8;
      if (v57 >= 0x38 && (uint64_t v58 = 8 * v54, (unint64_t)(&v52[8 * v54] - v40) >= 0x20))
      {
        uint64_t v62 = (v57 >> 3) + 1;
        uint64_t v63 = 8 * (v62 & 0x3FFFFFFFFFFFFFFCLL);
        uint64_t v59 = &v55[v63];
        unint64_t v60 = &v40[v63];
        uint64_t v64 = (long long *)(v40 + 16);
        uint64_t v65 = &v52[v58 + 16];
        uint64_t v66 = v62 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v67 = *v64;
          *((_OWORD *)v65 - 1) = *(v64 - 1);
          *(_OWORD *)uint64_t v65 = v67;
          v64 += 2;
          v65 += 32;
          v66 -= 4;
        }
        while (v66);
        if (v62 == (v62 & 0x3FFFFFFFFFFFFFFCLL)) {
          goto LABEL_66;
        }
      }
      else
      {
        uint64_t v59 = &v52[8 * (v51 >> 2)];
        unint64_t v60 = v40;
      }
      do
      {
        uint64_t v61 = *(void *)v60;
        v60 += 8;
        *(void *)uint64_t v59 = v61;
        v59 += 8;
      }
      while (v59 != v42);
    }
LABEL_66:
    unint64_t v41 = &v52[8 * v51];
    if (v53) {
      operator delete(v53);
    }
    uint64_t v40 = &v52[8 * (v51 >> 2)];
    uint64_t v43 = v52;
LABEL_49:
    *(void *)unint64_t v42 = v44;
    v42 += 8;
    --v9;
  }
  while (v9);
  uint64_t v68 = *(void **)(a1 + 8);
  if (v8)
  {
    while (1)
    {
      if (v42 == v41)
      {
        if (v40 <= v43)
        {
          if (v41 == v43) {
            unint64_t v78 = 1;
          }
          else {
            unint64_t v78 = (v41 - v43) >> 2;
          }
          if (v78 >> 61) {
            sub_219486AFC();
          }
          uint64_t v79 = (char *)operator new(8 * v78);
          uint64_t v80 = v79;
          unint64_t v81 = v78 >> 2;
          BOOL v69 = &v79[8 * (v78 >> 2)];
          unint64_t v42 = v69;
          int64_t v82 = v41 - v40;
          if (v41 != v40)
          {
            unint64_t v42 = &v69[v82 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v83 = v82 - 8;
            if (v83 < 0x38 || (uint64_t v84 = 8 * v81, (unint64_t)(&v79[8 * v81] - v40) < 0x20))
            {
              BOOL v85 = &v79[8 * (v78 >> 2)];
              uint64_t v86 = v40;
              goto LABEL_98;
            }
            uint64_t v88 = (v83 >> 3) + 1;
            uint64_t v89 = 8 * (v88 & 0x3FFFFFFFFFFFFFFCLL);
            BOOL v85 = &v69[v89];
            uint64_t v86 = &v40[v89];
            uint64_t v90 = (long long *)(v40 + 16);
            uint64_t v91 = &v79[v84 + 16];
            uint64_t v92 = v88 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v93 = *v90;
              *((_OWORD *)v91 - 1) = *(v90 - 1);
              *(_OWORD *)uint64_t v91 = v93;
              v90 += 2;
              v91 += 32;
              v92 -= 4;
            }
            while (v92);
            if (v88 != (v88 & 0x3FFFFFFFFFFFFFFCLL))
            {
              do
              {
LABEL_98:
                uint64_t v87 = *(void *)v86;
                v86 += 8;
                *(void *)BOOL v85 = v87;
                v85 += 8;
              }
              while (v85 != v42);
            }
          }
          unint64_t v41 = &v79[8 * v78];
          if (v43) {
            operator delete(v43);
          }
          uint64_t v43 = v80;
          goto LABEL_81;
        }
        uint64_t v72 = v43;
        uint64_t v73 = (v40 - v43) >> 3;
        if (v73 >= -1) {
          uint64_t v74 = v73 + 1;
        }
        else {
          uint64_t v74 = v73 + 2;
        }
        uint64_t v75 = v74 >> 1;
        uint64_t v76 = &v40[-8 * (v74 >> 1)];
        BOOL v77 = v41;
        if (v41 != v40)
        {
          memmove(v76, v40, v41 - v40);
          BOOL v77 = v40;
        }
        unint64_t v42 = &v76[v41 - v40];
        BOOL v69 = &v77[-8 * v75];
        uint64_t v43 = v72;
      }
      else
      {
        BOOL v69 = v40;
      }
LABEL_81:
      *(void *)unint64_t v42 = *v68;
      v42 += 8;
      uint64_t v68 = (void *)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v68;
      uint64_t v40 = v69;
      if (!--v8) {
        goto LABEL_75;
      }
    }
  }
  BOOL v69 = v40;
LABEL_75:
  uint64_t v70 = *(void **)(a1 + 16);
  if (v70 != v68)
  {
    do
    {
      if (v69 == v43)
      {
        if (v42 >= v41)
        {
          if (v41 == v43) {
            unint64_t v100 = 1;
          }
          else {
            unint64_t v100 = (v41 - v43) >> 2;
          }
          if (v100 >> 61) {
            sub_219486AFC();
          }
          std::string v101 = (char *)operator new(8 * v100);
          uint64_t v97 = v101;
          unint64_t v102 = (v100 + 3) >> 2;
          BOOL v69 = &v101[8 * v102];
          int64_t v103 = v42 - v43;
          BOOL v29 = v42 == v43;
          unint64_t v42 = v69;
          if (!v29)
          {
            unint64_t v42 = &v69[v103 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v104 = v103 - 8;
            uint64_t v105 = &v101[8 * v102];
            long long v106 = v43;
            if (v104 < 0x38) {
              goto LABEL_169;
            }
            uint64_t v107 = 8 * v102;
            uint64_t v105 = &v101[8 * v102];
            long long v106 = v43;
            if ((unint64_t)(v105 - v43) < 0x20) {
              goto LABEL_169;
            }
            uint64_t v108 = (v104 >> 3) + 1;
            uint64_t v109 = 8 * (v108 & 0x3FFFFFFFFFFFFFFCLL);
            uint64_t v105 = &v69[v109];
            long long v106 = &v43[v109];
            char v110 = (long long *)(v43 + 16);
            int8x16_t v111 = &v101[v107 + 16];
            uint64_t v112 = v108 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v113 = *v110;
              *((_OWORD *)v111 - 1) = *(v110 - 1);
              *(_OWORD *)int8x16_t v111 = v113;
              v110 += 2;
              v111 += 32;
              v112 -= 4;
            }
            while (v112);
            if (v108 != (v108 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_169:
              do
              {
                uint64_t v114 = *(void *)v106;
                v106 += 8;
                *(void *)uint64_t v105 = v114;
                v105 += 8;
              }
              while (v105 != v42);
            }
          }
          unint64_t v41 = &v101[8 * v100];
          if (v43) {
            operator delete(v43);
          }
        }
        else
        {
          uint64_t v95 = (v41 - v42) >> 3;
          if (v95 >= -1) {
            uint64_t v96 = v95 + 1;
          }
          else {
            uint64_t v96 = v95 + 2;
          }
          uint64_t v97 = v43;
          uint64_t v98 = v96 >> 1;
          BOOL v69 = &v97[8 * (v96 >> 1)];
          uint64_t v99 = v97;
          if (v42 != v97)
          {
            memmove(v69, v97, v42 - v97);
            uint64_t v99 = v42;
          }
          unint64_t v42 = &v99[8 * v98];
        }
        uint64_t v43 = v97;
      }
      uint64_t v94 = *--v70;
      *((void *)v69 - 1) = v94;
      v69 -= 8;
    }
    while (v70 != *(void **)(a1 + 8));
  }
  uint64_t v71 = *(char **)a1;
  *(void *)a1 = v43;
  *(void *)(a1 + 8) = v69;
  *(void *)(a1 + 16) = v42;
  *(void *)(a1 + 24) = v41;
  *(void *)(a1 + 32) -= v144;
  if (v71)
  {
    operator delete(v71);
  }
}

void sub_2194FD414(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2194FD460()
{
}

void sub_2194FD480(char **a1, void *a2)
{
  uint64_t v4 = a1[2];
  if (v4 != a1[3]) {
    goto LABEL_22;
  }
  unint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  if (v6 > *a1)
  {
    uint64_t v7 = (v6 - *a1) >> 3;
    if (v7 >= -1) {
      uint64_t v8 = v7 + 1;
    }
    else {
      uint64_t v8 = v7 + 2;
    }
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = -v9;
    uint64_t v11 = &v6[-8 * v9];
    int64_t v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      uint64_t v4 = a1[1];
    }
    uint64_t v13 = &v4[8 * v10];
    uint64_t v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  unint64_t v14 = (v4 - v5) >> 2;
  if (v4 == v5) {
    unint64_t v14 = 1;
  }
  if (v14 >> 61) {
    sub_219486AFC();
  }
  unint64_t v15 = v14 >> 2;
  uint64_t v16 = 8 * v14;
  uint64_t v17 = (char *)operator new(8 * v14);
  uint64_t v18 = &v17[8 * v15];
  int64_t v20 = v4 - v6;
  BOOL v19 = v4 == v6;
  uint64_t v4 = v18;
  if (!v19)
  {
    uint64_t v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      uint64_t v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        uint64_t v31 = *(void *)v6;
        v6 += 8;
        *(void *)uint64_t v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    int64_t v23 = &v17[8 * v15];
    uint64_t v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20) {
      goto LABEL_19;
    }
    uint64_t v24 = (v21 >> 3) + 1;
    uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v22 = &v18[v25];
    uint64_t v26 = &v6[v25];
    uint64_t v27 = (long long *)(v6 + 16);
    uint64_t v28 = v23 + 16;
    uint64_t v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      *uint64_t v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    unint64_t v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_19;
    }
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    uint64_t v4 = a1[2];
  }
LABEL_22:
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_2194FD610(void **a1, void *a2)
{
  uint64_t v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    uint64_t v7 = a1[2];
    unint64_t v6 = a1[3];
    if (v7 >= v6)
    {
      uint64_t v13 = v6 - v4;
      BOOL v12 = v13 == 0;
      unint64_t v14 = v13 >> 2;
      if (v12) {
        unint64_t v14 = 1;
      }
      if (v14 >> 61) {
        sub_219486AFC();
      }
      unint64_t v15 = (v14 + 3) >> 2;
      uint64_t v16 = 8 * v14;
      uint64_t v17 = (char *)operator new(8 * v14);
      unint64_t v5 = &v17[8 * v15];
      uint64_t v18 = v5;
      uint64_t v19 = v7 - v4;
      if (v7 != v4)
      {
        uint64_t v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v20 = v19 - 8;
        unint64_t v21 = &v17[8 * v15];
        uint64_t v22 = v4;
        if (v20 < 0x38) {
          goto LABEL_27;
        }
        int64_t v23 = &v17[8 * v15];
        unint64_t v21 = v23;
        uint64_t v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20) {
          goto LABEL_27;
        }
        uint64_t v24 = (v20 >> 3) + 1;
        uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v21 = &v5[v25];
        uint64_t v22 = &v4[v25];
        uint64_t v26 = (long long *)(v4 + 16);
        uint64_t v27 = v23 + 16;
        uint64_t v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          *uint64_t v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            uint64_t v30 = *(void *)v22;
            v22 += 8;
            *(void *)unint64_t v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        unint64_t v5 = (char *)a1[1];
      }
    }
    else
    {
      uint64_t v8 = (v6 - v7) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v11 = &v7[8 * (v9 >> 1)];
      unint64_t v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        uint64_t v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    unint64_t v5 = (char *)a1[1];
  }
  *((void *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

uint64_t sub_2194FD7AC(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 8);
  uint64_t v3 = *(void ***)(a1 + 16);
  *(void *)(a1 + 40) = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = *(void ***)(a1 + 16);
      uint64_t v2 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 256;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    uint64_t v6 = 512;
LABEL_7:
    *(void *)(a1 + 32) = v6;
  }
  if (v2 != v3)
  {
    do
    {
      uint64_t v7 = *v2++;
      operator delete(v7);
    }
    while (v2 != v3);
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8 != v9) {
      *(void *)(a1 + 16) = v8 + ((v9 - v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_2194FD874(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    *(void *)(a1 + 32) = v4;
    uint64_t v6 = *(void **)(a1 + 8);
    unint64_t v5 = *(char **)(a1 + 16);
    uint64_t v7 = (char *)(v6 + 1);
    uint64_t v8 = *v6;
    *(void *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_80:
      *(void *)unint64_t v5 = v8;
      *(void *)(a1 + 16) += 8;
      return;
    }
    uint64_t v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v31 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v31 = 1;
      }
      if (!(v31 >> 61))
      {
        unint64_t v32 = v31 >> 2;
        uint64_t v33 = 8 * v31;
        uint64_t v34 = (char *)operator new(8 * v31);
        unint64_t v35 = &v34[8 * v32];
        uint64_t v36 = &v34[v33];
        int64_t v38 = v5 - v7;
        BOOL v37 = v5 == v7;
        unint64_t v5 = v35;
        if (!v37)
        {
          unint64_t v5 = &v35[v38 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v39 = v38 - 8;
          if ((unint64_t)(v38 - 8) >= 0x38)
          {
            uint64_t v74 = &v34[8 * v32];
            uint64_t v40 = v74;
            if ((unint64_t)(v74 - v7) >= 0x20)
            {
              uint64_t v75 = (v39 >> 3) + 1;
              uint64_t v76 = 8 * (v75 & 0x3FFFFFFFFFFFFFFCLL);
              uint64_t v40 = &v35[v76];
              v7 += v76;
              BOOL v77 = (long long *)(v6 + 3);
              unint64_t v78 = v74 + 16;
              uint64_t v79 = v75 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v80 = *v77;
                *(v78 - 1) = *(v77 - 1);
                *unint64_t v78 = v80;
                v77 += 2;
                v78 += 2;
                v79 -= 4;
              }
              while (v79);
              if (v75 == (v75 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_78;
              }
            }
          }
          else
          {
            uint64_t v40 = &v34[8 * v32];
          }
          do
          {
            uint64_t v81 = *(void *)v7;
            v7 += 8;
            *(void *)uint64_t v40 = v81;
            v40 += 8;
          }
          while (v40 != v5);
        }
        goto LABEL_78;
      }
LABEL_89:
      sub_219486AFC();
    }
LABEL_5:
    uint64_t v11 = v10 >> 3;
    if (v11 >= -1) {
      uint64_t v12 = v11 + 1;
    }
    else {
      uint64_t v12 = v11 + 2;
    }
    uint64_t v13 = v12 >> 1;
    uint64_t v14 = -v13;
    unint64_t v15 = &v7[-8 * v13];
    int64_t v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      uint64_t v7 = *(char **)(a1 + 8);
    }
    unint64_t v5 = &v15[v16];
    *(void *)(a1 + 8) = &v7[8 * v14];
    *(void *)(a1 + 16) = &v15[v16];
    goto LABEL_80;
  }
  uint64_t v18 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v20 = v18 - v19;
  uint64_t v21 = (v18 - v19) >> 3;
  uint64_t v22 = v17 - *(void *)a1;
  if (v21 < (unint64_t)(v22 >> 3))
  {
    if (v17 != v18)
    {
      uint64_t v91 = operator new(0x1000uLL);
      sub_2194FD480((char **)a1, &v91);
      return;
    }
    uint64_t v91 = operator new(0x1000uLL);
    sub_2194FD610((void **)a1, &v91);
    unint64_t v41 = *(void **)(a1 + 8);
    unint64_t v5 = *(char **)(a1 + 16);
    uint64_t v7 = (char *)(v41 + 1);
    uint64_t v8 = *v41;
    *(void *)(a1 + 8) = v41 + 1;
    if (v5 != *(char **)(a1 + 24)) {
      goto LABEL_80;
    }
    uint64_t v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v42 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v42 = 1;
      }
      if (!(v42 >> 61))
      {
        unint64_t v43 = v42 >> 2;
        uint64_t v44 = 8 * v42;
        uint64_t v34 = (char *)operator new(8 * v42);
        unint64_t v35 = &v34[8 * v43];
        uint64_t v36 = &v34[v44];
        int64_t v45 = v5 - v7;
        BOOL v37 = v5 == v7;
        unint64_t v5 = v35;
        if (!v37)
        {
          unint64_t v5 = &v35[v45 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v46 = v45 - 8;
          if ((unint64_t)(v45 - 8) >= 0x38)
          {
            int64_t v82 = &v34[8 * v43];
            uint64_t v47 = v82;
            if ((unint64_t)(v82 - v7) >= 0x20)
            {
              uint64_t v83 = (v46 >> 3) + 1;
              uint64_t v84 = 8 * (v83 & 0x3FFFFFFFFFFFFFFCLL);
              uint64_t v47 = &v35[v84];
              v7 += v84;
              BOOL v85 = (long long *)(v41 + 3);
              uint64_t v86 = v82 + 16;
              uint64_t v87 = v83 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v88 = *v85;
                *(v86 - 1) = *(v85 - 1);
                *uint64_t v86 = v88;
                v85 += 2;
                v86 += 2;
                v87 -= 4;
              }
              while (v87);
              if (v83 == (v83 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_78;
              }
            }
          }
          else
          {
            uint64_t v47 = &v34[8 * v43];
          }
          do
          {
            uint64_t v89 = *(void *)v7;
            v7 += 8;
            *(void *)uint64_t v47 = v89;
            v47 += 8;
          }
          while (v47 != v5);
        }
LABEL_78:
        *(void *)a1 = v34;
        *(void *)(a1 + 8) = v35;
        *(void *)(a1 + 16) = v5;
        *(void *)(a1 + 24) = v36;
        if (v9)
        {
          operator delete(v9);
          unint64_t v5 = *(char **)(a1 + 16);
        }
        goto LABEL_80;
      }
      goto LABEL_89;
    }
    goto LABEL_5;
  }
  uint64_t v23 = v22 >> 2;
  if (v17 == *(void *)a1) {
    unint64_t v24 = 1;
  }
  else {
    unint64_t v24 = v23;
  }
  if (v24 >> 61) {
    goto LABEL_89;
  }
  uint64_t v25 = (char *)operator new(8 * v24);
  uint64_t v26 = operator new(0x1000uLL);
  uint64_t v27 = &v25[8 * v21];
  uint64_t v28 = &v25[8 * v24];
  if (v21 == v24)
  {
    uint64_t v90 = v26;
    if (v20 < 1)
    {
      if (v18 == v19) {
        unint64_t v48 = 1;
      }
      else {
        unint64_t v48 = v20 >> 2;
      }
      if (v48 >> 61) {
        sub_219486AFC();
      }
      uint64_t v49 = (char *)operator new(8 * v48);
      uint64_t v27 = &v49[8 * (v48 >> 2)];
      uint64_t v28 = &v49[8 * v48];
      operator delete(v25);
      uint64_t v50 = *(void *)(a1 + 8);
      uint64_t v18 = *(void *)(a1 + 16);
      uint64_t v25 = v49;
      *(void *)uint64_t v27 = v90;
      long long v29 = v27 + 8;
      if (v18 == v50) {
        goto LABEL_45;
      }
    }
    else
    {
      unint64_t v30 = v21 + 2;
      if (v21 >= -1) {
        unint64_t v30 = v21 + 1;
      }
      v27 -= 8 * (v30 >> 1);
      *(void *)uint64_t v27 = v26;
      long long v29 = v27 + 8;
      if (v18 == v19) {
        goto LABEL_45;
      }
    }
    do
    {
LABEL_52:
      if (v27 == v25)
      {
        if (v29 >= v28)
        {
          if (v28 == v27) {
            unint64_t v59 = 1;
          }
          else {
            unint64_t v59 = (v28 - v27) >> 2;
          }
          if (v59 >> 61) {
            sub_219486AFC();
          }
          unint64_t v60 = (char *)operator new(8 * v59);
          uint64_t v25 = v60;
          unint64_t v61 = (v59 + 3) >> 2;
          uint64_t v53 = &v60[8 * v61];
          int64_t v62 = v29 - v27;
          BOOL v37 = v29 == v27;
          long long v29 = v53;
          if (!v37)
          {
            long long v29 = &v53[v62 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v63 = v62 - 8;
            uint64_t v64 = &v60[8 * v61];
            uint64_t v65 = v27;
            if (v63 < 0x38) {
              goto LABEL_93;
            }
            uint64_t v66 = 8 * v61;
            uint64_t v64 = &v60[8 * v61];
            uint64_t v65 = v27;
            if ((unint64_t)(v64 - v27) < 0x20) {
              goto LABEL_93;
            }
            uint64_t v67 = (v63 >> 3) + 1;
            uint64_t v68 = 8 * (v67 & 0x3FFFFFFFFFFFFFFCLL);
            uint64_t v64 = &v53[v68];
            uint64_t v65 = &v27[v68];
            BOOL v69 = (long long *)(v27 + 16);
            uint64_t v70 = &v60[v66 + 16];
            uint64_t v71 = v67 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v72 = *v69;
              *((_OWORD *)v70 - 1) = *(v69 - 1);
              *(_OWORD *)uint64_t v70 = v72;
              v69 += 2;
              v70 += 32;
              v71 -= 4;
            }
            while (v71);
            if (v67 != (v67 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_93:
              do
              {
                uint64_t v73 = *(void *)v65;
                v65 += 8;
                *(void *)uint64_t v64 = v73;
                v64 += 8;
              }
              while (v64 != v29);
            }
          }
          uint64_t v28 = &v60[8 * v59];
          operator delete(v27);
        }
        else
        {
          uint64_t v55 = (v28 - v29) >> 3;
          if (v55 >= -1) {
            unint64_t v56 = v55 + 1;
          }
          else {
            unint64_t v56 = v55 + 2;
          }
          unint64_t v57 = &v29[8 * (v56 >> 1)];
          uint64_t v53 = &v57[-(v29 - v27)];
          size_t v58 = v29 - v27;
          BOOL v37 = v29 == v27;
          long long v29 = v57;
          if (!v37) {
            memmove(v53, v27, v58);
          }
          uint64_t v25 = v27;
        }
      }
      else
      {
        uint64_t v53 = v27;
      }
      uint64_t v54 = *(void *)(v18 - 8);
      v18 -= 8;
      *((void *)v53 - 1) = v54;
      unint64_t v51 = v53 - 8;
      uint64_t v27 = v51;
    }
    while (v18 != *(void *)(a1 + 8));
    goto LABEL_46;
  }
  *(void *)uint64_t v27 = v26;
  long long v29 = v27 + 8;
  if (v18 != v19) {
    goto LABEL_52;
  }
LABEL_45:
  unint64_t v51 = v27;
LABEL_46:
  uint64_t v52 = *(char **)a1;
  *(void *)a1 = v25;
  *(void *)(a1 + 8) = v51;
  *(void *)(a1 + 16) = v29;
  *(void *)(a1 + 24) = v28;
  if (v52)
  {
    operator delete(v52);
  }
}

void sub_2194FDDE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  operator delete(__p);
  operator delete(v9);
  _Unwind_Resume(a1);
}

void sub_2194FDE00(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2194FDE14(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2194FDE2C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2194FDE48(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

uint64_t sub_2194FDE80(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_2194FDEB0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrIN4tlog15ConsoleAppenderEE27__shared_ptr_default_deleteIS2_S2_EE") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"NSt3__110shared_ptrIN4tlog15ConsoleAppenderEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrIN4tlog15ConsoleAppenderEE27__shared_ptr_default_deleteIS2_S2_EE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrIN4tlog15ConsoleAppenderEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void *sub_2194FDF24(void *a1, uint64_t a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >= 0xAAAAAAAAAAAAAABLL) {
      sub_219486AE4();
    }
    uint64_t v5 = 24 * a3;
    uint64_t v6 = (char *)operator new(24 * a3);
    uint64_t v7 = 0;
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v5];
    do
    {
      uint64_t v9 = &v6[v7];
      uint64_t v10 = (long long *)(a2 + v7);
      if (*(char *)(a2 + v7 + 23) < 0)
      {
        sub_2194A3460(v9, *(void **)v10, *((void *)v10 + 1));
      }
      else
      {
        long long v8 = *v10;
        *((void *)v9 + 2) = *((void *)v10 + 2);
        *(_OWORD *)uint64_t v9 = v8;
      }
      v7 += 24;
    }
    while (v5 != v7);
    a1[1] = &v6[v7];
  }
  return a1;
}

void sub_2194FE000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_2194FE014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  for (; v11; v11 -= 24)
  {
    if (*(char *)(v10 + v11 - 1) < 0) {
      operator delete(*(void **)(v10 + v11 - 24));
    }
  }
  *(void *)(v9 + 8) = v10;
  sub_2194FE050(&a9);
  _Unwind_Resume(a1);
}

void ***sub_2194FE050(void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    unint64_t v2 = *result;
    unint64_t v3 = (void **)**result;
    if (v3)
    {
      unint64_t v4 = (void **)v2[1];
      uint64_t v5 = **result;
      if (v4 != v3)
      {
        do
        {
          if (*((char *)v4 - 1) < 0) {
            operator delete(*(v4 - 3));
          }
          v4 -= 3;
        }
        while (v4 != v3);
        uint64_t v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

void sub_2194FE0E8(uint64_t a1, std::string *__str, std::string *a3, size_t __sz)
{
  uint64_t v6 = __str;
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(std::string **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(void *)a1) >> 3) >= __sz)
  {
    uint64_t v12 = *(std::string **)(a1 + 8);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)v9) >> 3) >= __sz)
    {
      if (__str == a3)
      {
        uint64_t v20 = *(std::string **)a1;
      }
      else
      {
        uint64_t v20 = *(std::string **)a1;
        do
        {
          std::string::operator=(v9++, v6++);
          ++v20;
        }
        while (v6 != a3);
        uint64_t v12 = *(std::string **)(a1 + 8);
      }
      while (v12 != v20)
      {
        if (SHIBYTE(v12[-1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v12[-1].__r_.__value_.__l.__data_);
        }
        --v12;
      }
      *(void *)(a1 + 8) = v20;
    }
    else
    {
      uint64_t v13 = (std::string *)((char *)__str + 8 * (((char *)v12 - (char *)v9) >> 3));
      if (v12 != v9)
      {
        uint64_t v14 = 8 * (((char *)v12 - (char *)v9) >> 3);
        do
        {
          std::string::operator=(v9++, v6++);
          v14 -= 24;
        }
        while (v14);
        uint64_t v9 = *(std::string **)(a1 + 8);
      }
      unint64_t v15 = v9;
      if (v13 != a3)
      {
        uint64_t v16 = 0;
        do
        {
          uint64_t v18 = &v9[v16];
          uint64_t v19 = (char *)&v13[v16];
          if (SHIBYTE(v13[v16].__r_.__value_.__r.__words[2]) < 0)
          {
            sub_2194A3460(v18, *(void **)v19, *((void *)v19 + 1));
          }
          else
          {
            long long v17 = *(_OWORD *)v19;
            v18->__r_.__value_.__r.__words[2] = *((void *)v19 + 2);
            *(_OWORD *)&v18->__r_.__value_.__l.__data_ = v17;
          }
          ++v16;
        }
        while (&v13[v16] != a3);
        unint64_t v15 = &v9[v16];
      }
      *(void *)(a1 + 8) = v15;
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v10 = *(std::string **)(a1 + 8);
      uint64_t v11 = *(std::string **)a1;
      if (v10 != v9)
      {
        do
        {
          if (SHIBYTE(v10[-1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v10[-1].__r_.__value_.__l.__data_);
          }
          --v10;
        }
        while (v10 != v9);
        uint64_t v11 = *(std::string **)a1;
      }
      *(void *)(a1 + 8) = v9;
      operator delete(v11);
      uint64_t v8 = 0;
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
    if (__sz > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_48;
    }
    unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v22 = 2 * v21;
    if (2 * v21 <= __sz) {
      uint64_t v22 = __sz;
    }
    unint64_t v23 = v21 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v22;
    if (v23 > 0xAAAAAAAAAAAAAAALL) {
LABEL_48:
    }
      sub_219486AE4();
    uint64_t v24 = 24 * v23;
    uint64_t v25 = (char *)operator new(24 * v23);
    *(void *)a1 = v25;
    *(void *)(a1 + 8) = v25;
    *(void *)(a1 + 16) = &v25[v24];
    if (v6 != a3)
    {
      uint64_t v26 = 0;
      do
      {
        uint64_t v27 = &v25[v26 * 24];
        uint64_t v28 = &v6[v26];
        if (SHIBYTE(v6[v26].__r_.__value_.__r.__words[2]) < 0)
        {
          sub_2194A3460(v27, v28->__r_.__value_.__l.__data_, v28->__r_.__value_.__l.__size_);
        }
        else
        {
          *(_OWORD *)uint64_t v27 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
          *((void *)v27 + 2) = *((void *)&v28->__r_.__value_.__l + 2);
        }
        ++v26;
      }
      while (&v6[v26] != a3);
      v25 += v26 * 24;
    }
    *(void *)(a1 + 8) = v25;
  }
}

void sub_2194FE3F4(int *a1)
{
  uint64_t valuePtr = *a1;
  CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberNSIntegerType, &valuePtr);
  operator new();
}

void sub_2194FE4E8(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    j__CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_2194FE500(_Unwind_Exception *a1)
{
}

void sub_2194FE518(unsigned int *a1)
{
  uint64_t valuePtr = *a1;
  CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberNSIntegerType, &valuePtr);
  operator new();
}

void sub_2194FE60C(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    j__CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_2194FE624(_Unwind_Exception *a1)
{
}

void sub_2194FE638(uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  if (v1 >= 0) {
    unint64_t v2 = (const UInt8 *)a1;
  }
  else {
    unint64_t v2 = *(const UInt8 **)a1;
  }
  if (v1 >= 0) {
    CFIndex v3 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    CFIndex v3 = *(void *)(a1 + 8);
  }
  CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, v3, 0x8000100u, 0);
  operator new();
}

void sub_2194FE744(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    j__CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_2194FE75C(_Unwind_Exception *a1)
{
}

void sub_2194FE774(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

void sub_2194FE7AC(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    j__CFRelease(v1);
  }
}

uint64_t sub_2194FE7D0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_2194FE848(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

void sub_2194FE880(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    j__CFRelease(v1);
  }
}

uint64_t sub_2194FE8A4(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t sub_2194FE918(CFTypeRef *a1)
{
  if (!*a1) {
    return 0;
  }
  CFTypeID TypeID = j__CFArrayGetTypeID();
  BOOL v3 = sub_2194FEF04(a1, TypeID);
  CFArrayRef v4 = (const __CFArray *)*a1;
  if (!v3)
  {
    if (v4)
    {
      CFTypeID v11 = j__CFDictionaryGetTypeID();
      if (sub_2194FEF04(a1, v11))
      {
        CFTypeRef ValueAtIndex = *a1;
        return sub_2194FEA40((CFDictionaryRef *)&ValueAtIndex);
      }
    }
    return 1;
  }
  if (!v4) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)*a1);
  if (Count < 1) {
    return 1;
  }
  CFIndex v6 = Count;
  CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(v4, 0);
  uint64_t result = sub_2194FE918(&ValueAtIndex);
  if (result)
  {
    CFIndex v8 = 1;
    do
    {
      CFIndex v9 = v8;
      if (v6 == v8) {
        break;
      }
      CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(v4, v8);
      char v10 = sub_2194FE918(&ValueAtIndex);
      CFIndex v8 = v9 + 1;
    }
    while ((v10 & 1) != 0);
    return v9 >= v6;
  }
  return result;
}

uint64_t sub_2194FEA40(CFDictionaryRef *a1)
{
  CFDictionaryRef v2 = *a1;
  if (!v2) {
    return 0;
  }
  unint64_t Count = CFDictionaryGetCount(v2);
  if (Count)
  {
    if (Count >> 61) {
      sub_219486AE4();
    }
    size_t v4 = 8 * Count;
    uint64_t v5 = (CFTypeRef *)operator new(8 * Count);
    bzero(v5, v4);
    CFIndex v6 = (char *)operator new(v4);
    uint64_t v7 = &v5[v4 / 8];
    bzero(v6, v4);
    CFIndex v8 = &v6[v4];
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = 0;
    CFIndex v6 = 0;
    CFIndex v8 = 0;
  }
  CFDictionaryGetKeysAndValues(*a1, v5, (const void **)v6);
  if (v5 != v7)
  {
    char v10 = v5;
    while (1)
    {
      if (!*v10)
      {
        uint64_t v9 = 0;
        if (v6) {
          goto LABEL_19;
        }
        goto LABEL_20;
      }
      CFTypeID TypeID = j__CFStringGetTypeID();
      if (!sub_2194FEF04(v10, TypeID)) {
        break;
      }
      if (++v10 == v7) {
        goto LABEL_12;
      }
    }
    uint64_t v9 = 0;
    if (v6) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }
LABEL_12:
  if (v6 != v8)
  {
    uint64_t v12 = v6;
    do
    {
      uint64_t v13 = sub_2194FE918(v12);
      uint64_t v9 = v13;
      v12 += 8;
      if (v12 == v8) {
        char v14 = 0;
      }
      else {
        char v14 = v13;
      }
    }
    while ((v14 & 1) != 0);
    if (!v6) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v9 = 1;
  if (v6) {
LABEL_19:
  }
    operator delete(v6);
LABEL_20:
  if (v5) {
    operator delete(v5);
  }
  return v9;
}

void sub_2194FEBA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  operator delete(v11);
  _Unwind_Resume(a1);
}

void sub_2194FEBE8(int a1@<W8>)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);

  sub_2194FEC48(a1, Mutable, 0);
}

void sub_2194FEC48(int a1, CFTypeRef cf, int a3)
{
  if (a3) {
    sub_2194FED84(&v3, cf);
  }
  CFTypeRef v3 = cf;
  operator new();
}

void sub_2194FED54(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    j__CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_2194FED6C(_Unwind_Exception *a1)
{
}

void sub_2194FED84(void *a1, CFTypeRef cf)
{
  if (cf) {
    j__CFRetain(cf);
  }
  *a1 = cf;
  operator new();
}

void sub_2194FEDF8(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    j__CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_2194FEE10(_Unwind_Exception *a1)
{
}

void sub_2194FEE28(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

void sub_2194FEE60(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    j__CFRelease(v1);
  }
}

uint64_t sub_2194FEE84(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIP14__CFDictionaryEC1ES4_EUlS4_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIP14__CFDictionaryEC1ES4_EUlS4_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIP14__CFDictionaryEC1ES4_EUlS4_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIP14__CFDictionaryEC1ES4_EUlS4_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

BOOL sub_2194FEF04(CFTypeRef *a1, uint64_t a2)
{
  return CFGetTypeID(*a1) == a2;
}

void *sub_2194FEF34(void *result)
{
  *uint64_t result = 0;
  result[1] = 0;
  return result;
}

void sub_2194FEF3C()
{
  v1[0] = 0;
  v1[1] = 0;
  uint64_t v0 = v1;
  sub_2194FF5C8();
}

void sub_2194FEF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char *a11)
{
}

void sub_2194FEFB0(uint64_t a1, const void *a2, int a3)
{
  sub_2194FEC48((int)&v3, a2, a3);
}

void sub_2194FF10C(CFMutableDictionaryRef *a1, const void *a2, const void *a3)
{
}

BOOL sub_2194FF114(const __CFDictionary *a1, const void *a2)
{
  return CFDictionaryContainsKey(a1, a2) != 0;
}

void sub_2194FF138(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_2194FF138(a1, *(void *)a2);
    sub_2194FF138(a1, *((void *)a2 + 1));
    if (a2[55] < 0)
    {
      operator delete(*((void **)a2 + 4));
      size_t v4 = a2;
    }
    else
    {
      size_t v4 = a2;
    }
    operator delete(v4);
  }
}

void sub_2194FF1BC()
{
  sub_2194FEBE8((int)theDict);
}

void sub_2194FF500(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14, _Unwind_Exception *a15)
{
  unint64_t v15 = exception_object;
  if (a10)
  {
    sub_21950AD34(a10, (uint64_t)exception_object, a2, (uint64_t)&a15);
    unint64_t v15 = a15;
  }
  if (a12 && !atomic_fetch_add(&a12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  if (a14)
  {
    if (!atomic_fetch_add(&a14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a14->__on_zero_shared)(a14);
      std::__shared_weak_count::__release_weak(a14);
    }
  }
  _Unwind_Resume(v15);
}

void sub_2194FF5C8()
{
}

void sub_2194FF718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __cxa_free_exception(v9);
  sub_21947E0B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2194FF734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_2194FF748(uint64_t result)
{
  return result;
}

void sub_2194FF760(const char *a1, uint64_t a2, const char *a3, void (*a4)(void *))
{
  sub_2194F6BF8((uint64_t)v17);
  sub_2194889DC(v18, (uint64_t)"Assert: ", 8);
  size_t v7 = strlen(a1);
  CFIndex v8 = sub_2194889DC(v18, (uint64_t)a1, v7);
  sub_2194889DC(v8, (uint64_t)":", 1);
  uint64_t v9 = (void *)std::ostream::operator<<();
  char v10 = sub_2194889DC(v9, (uint64_t)" : ", 3);
  size_t v11 = strlen(a3);
  uint64_t v12 = sub_2194889DC(v10, (uint64_t)a3, v11);
  sub_2194889DC(v12, (uint64_t)"\n", 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x263F8C2B8];
  uint64_t v13 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v18[0] = v13;
  v18[1] = MEMORY[0x263F8C318] + 16;
  if (v19 < 0) {
    operator delete((void *)v18[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D48B530](&v20);
  if (v16 >= 0) {
    char v14 = &v15;
  }
  else {
    char v14 = v15;
  }
  a4(v14);
  if (v16 < 0) {
    operator delete(v15);
  }
}

void sub_2194FF990(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2194FF9C0(char *__src)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  strncpy(__dst, __src, 0x400uLL);
  qword_267C33910 = (uint64_t)__dst;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33F10, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C33F10))
  {
    qword_267C33F08 = (uint64_t)os_log_create("CVHWA", (const char *)&unk_219519E0A);
    __cxa_guard_release(&qword_267C33F10);
  }
  CFDictionaryRef v2 = qword_267C33F08;
  if (os_log_type_enabled((os_log_t)qword_267C33F08, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136446210;
    uint64_t v5 = __src;
    _os_log_impl(&dword_219476000, v2, OS_LOG_TYPE_FAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }
  return fputs(__src, (FILE *)*MEMORY[0x263EF8348]);
}

uint64_t sub_2194FFAE4(uint64_t a1)
{
  if (**(void **)(a1 + 32))
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v3)
      {
        int v4 = *(void (**)(uint64_t))(v3 + 24);
        if (!v4) {
          goto LABEL_9;
        }
LABEL_7:
        if (v4) {
          v4(FigBaseObject);
        }
        goto LABEL_9;
      }
      int v4 = (void (*)(uint64_t))MEMORY[0x18];
      if (MEMORY[0x18]) {
        goto LABEL_7;
      }
    }
LABEL_9:
    CFRelease(**(CFTypeRef **)(a1 + 32));
    **(void **)(a1 + 32) = 0;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  if (!CMNotificationCenterRemoveListener()
    || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(void *)(a1 + 32) = 0;
    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  sub_21950ADA4();
  uint64_t v5 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (v5) {
LABEL_13:
  }
    MEMORY[0x21D48B5B0](v5, 0x1020C403A5D3213);
LABEL_14:
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 == a1)
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
    }
    return a1;
  }
}

void sub_2194FFCA4(int a1, uint64_t a2, CFTypeRef cf2)
{
  if (CFEqual((CFTypeRef)*MEMORY[0x263F2C128], cf2))
  {
    int v23 = 1;
    uint64_t v5 = *(void *)(a2 + 24);
    if (v5)
    {
      (*(void (**)(uint64_t, int *))(*(void *)v5 + 48))(v5, &v23);
      return;
    }
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
LABEL_13:
    }
      sub_21950AE54(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (CFEqual((CFTypeRef)*MEMORY[0x263F2C120], cf2))
  {
    int v24 = 2;
    uint64_t v6 = *(void *)(a2 + 24);
    if (v6)
    {
      (*(void (**)(uint64_t, int *))(*(void *)v6 + 48))(v6, &v24);
      return;
    }
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      sub_21950AE18(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

BOOL sub_2194FFDF8(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  int v3 = 4;
  uint64_t v4 = *MEMORY[0x263EFFB08];
  uint64_t v5 = &_os_log_internal;
  while (1)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    CFTypeRef cf = 0;
    CFDictionaryRef v7 = IOServiceMatching("AppleH16CamIn");
    if (IOServiceGetMatchingService(v2, v7))
    {
      uint64_t v8 = dlopen("/System/Library/MediaCapture/H16ISP.mediacapture", 4);
      if (v8
        && (uint64_t v9 = (uint64_t (*)(uint64_t, void, CFTypeRef *))dlsym(v8, "H16ISPCaptureDeviceCreate")) != 0)
      {
        int v10 = v9(v4, 0, &cf);
        CFTypeRef v11 = cf;
        if (cf) {
          goto LABEL_8;
        }
      }
      else
      {
        int v10 = 0;
        CFTypeRef v11 = cf;
        if (cf)
        {
LABEL_8:
          uint64_t v12 = 0;
          goto LABEL_30;
        }
      }
    }
    else
    {
      int v10 = 0;
    }
    CFDictionaryRef v13 = IOServiceMatching("AppleH13CamIn");
    if (IOServiceGetMatchingService(v2, v13))
    {
      uint64_t v14 = dlopen("/System/Library/MediaCapture/H13ISP.mediacapture", 4);
      if (v14
        && (BOOL v15 = (uint64_t (*)(uint64_t, void, CFTypeRef *))dlsym(v14, "H13ISPCaptureDeviceCreate")) != 0)
      {
        int v10 = v15(v4, 0, &cf);
        CFTypeRef v11 = cf;
        if (cf) {
          goto LABEL_25;
        }
      }
      else
      {
        int v10 = 0;
        CFTypeRef v11 = cf;
        if (cf)
        {
LABEL_25:
          uint64_t v12 = 1;
          goto LABEL_30;
        }
      }
    }
    CFDictionaryRef v16 = IOServiceMatching("AppleH10CamIn");
    if (IOServiceGetMatchingService(v2, v16))
    {
      uint64_t v17 = dlopen("/System/Library/MediaCapture/H10ISP.mediacapture", 4);
      if (v17
        && (uint64_t v18 = (uint64_t (*)(uint64_t, void, CFTypeRef *))dlsym(v17, "H10ISPCaptureDeviceCreate")) != 0)
      {
        int v10 = v18(v4, 0, &cf);
        CFTypeRef v11 = cf;
        if (cf) {
          goto LABEL_27;
        }
      }
      else
      {
        int v10 = 0;
        CFTypeRef v11 = cf;
        if (cf)
        {
LABEL_27:
          uint64_t v12 = 2;
          goto LABEL_30;
        }
      }
    }
    CFDictionaryRef v19 = IOServiceMatching("AppleH9CamIn");
    if (IOServiceGetMatchingService(v2, v19))
    {
      uint64_t v20 = dlopen("/System/Library/MediaCapture/H9ISP.mediacapture", 4);
      if (v20
        && (uint64_t v21 = (uint64_t (*)(uint64_t, void, CFTypeRef *))dlsym(v20, "H9ISPCaptureDeviceCreate")) != 0)
      {
        int v10 = v21(v4, 0, &cf);
        CFTypeRef v11 = cf;
        if (!cf)
        {
LABEL_22:
          if (!v6) {
            goto LABEL_32;
          }
          CFTypeRef v11 = 0;
          goto LABEL_31;
        }
      }
      else
      {
        int v10 = 0;
        CFTypeRef v11 = cf;
        if (!cf) {
          goto LABEL_22;
        }
      }
      uint64_t v12 = 3;
LABEL_30:
      *(_DWORD *)(v6 + 8) = off_2643A5BB0[4 * v12 + 3];
LABEL_31:
      *(void *)uint64_t v6 = v11;
      goto LABEL_32;
    }
    CFTypeRef v11 = cf;
    if (v6) {
      goto LABEL_31;
    }
    if (cf) {
      CFRelease(cf);
    }
LABEL_32:
    if (v10 != -536870186) {
      break;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      sub_21950AF00(v24, v3 - 2, &v25);
      if (--v3 <= 1) {
        goto LABEL_43;
      }
    }
    else if (--v3 <= 1)
    {
      goto LABEL_43;
    }
  }
  if (!v10)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    return **(void **)(a1 + 32) != 0;
  }
LABEL_43:
  BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (result)
  {
    sub_21950AE90();
    return 0;
  }
  return result;
}

void sub_219500198(int a1@<W0>, uint64_t *a2@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C33F18, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C33F18))
  {
    __cxa_atexit((void (*)(void *))sub_2195004B4, &qword_267C33F20, &dword_219476000);
    __cxa_guard_release(&qword_267C33F18);
  }
  if (!qword_267C33F28
    || (uint64_t v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_267C33F28)) == 0
    || (uint64_t v5 = qword_267C33F20) == 0)
  {
    operator new();
  }
  uint64_t v6 = v4;
  if (**(void **)(qword_267C33F20 + 32)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = a1 == 0;
  }
  if (v7 || sub_2194FFDF8(qword_267C33F20))
  {
    *a2 = v5;
    a2[1] = (uint64_t)v6;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_219500418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21947E0B8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21950042C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_219500448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  uint64_t v5 = sub_2194FFAE4(v3);
  MEMORY[0x21D48B5B0](v5, 0x1020C40BD065CB0);
  sub_21947E0B8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2195004A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21947E0B8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2195004B4(uint64_t a1)
{
  mach_port_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

uint64_t sub_2195004E4(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  if (!**(void **)(a1 + 32)) {
    return 0;
  }
  uint64_t v8 = *MEMORY[0x263F2C1B8];
  v9[0] = &unk_26CAD7110;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v3 = **(void **)(a1 + 32);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4)
  {
    uint64_t v5 = *(unsigned int (**)(uint64_t, void, uint64_t, uint64_t *))(v4 + 8);
    if (!v5) {
      return 0;
    }
  }
  else
  {
    uint64_t v5 = (unsigned int (*)(uint64_t, void, uint64_t, uint64_t *))MEMORY[8];
    if (!MEMORY[8]) {
      return 0;
    }
  }
  if (!v5) {
    return 0;
  }
  if (v5(v3, *MEMORY[0x263EFFB08], v2, &v7)) {
    return 0;
  }
  else {
    return v7;
  }
}

BOOL sub_219500648(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, void, id))(v4 + 56);
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = (uint64_t (*)(uint64_t, void, id))MEMORY[0x38];
    if (!MEMORY[0x38])
    {
LABEL_7:
      int v6 = -12782;
      goto LABEL_8;
    }
  }
  if (!v5) {
    goto LABEL_7;
  }
  int v6 = v5(a1, *MEMORY[0x263F2C220], v3);
LABEL_8:
  BOOL v7 = v6 == 0;

  return v7;
}

void sub_219500720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_219500730(uint64_t a1)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2195008F4;
  v10[3] = &unk_2643A5B90;
  uint64_t v12 = &v13;
  id v3 = v2;
  CFTypeRef v11 = v3;
  uint64_t v4 = v10;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5)
  {
    int v6 = *(uint64_t (**)(uint64_t, void *))(v5 + 8);
    if (!v6) {
      goto LABEL_9;
    }
  }
  else
  {
    int v6 = (uint64_t (*)(uint64_t, void *))MEMORY[8];
    if (!MEMORY[8])
    {
LABEL_9:

LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
  }
  if (!v6) {
    goto LABEL_9;
  }
  int v7 = v6(a1, v4);

  if (v7 == -12780)
  {
    BOOL v8 = 1;
    goto LABEL_11;
  }
  if (v7) {
    goto LABEL_10;
  }
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v8 = *((_DWORD *)v14 + 6) == 0;
LABEL_11:

  _Block_object_dispose(&v13, 8);
  return v8;
}

void sub_2195008CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_2195008F4(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_219500908(const void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v2)
  {
    id v3 = *(unsigned int (**)(const void *))(v2 + 24);
    if (!v3) {
      goto LABEL_12;
    }
  }
  else
  {
    id v3 = (unsigned int (*)(const void *))MEMORY[0x18];
    if (!MEMORY[0x18]) {
      goto LABEL_12;
    }
  }
  if (v3 && !v3(a1))
  {
    uint64_t v5 = 1;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
LABEL_12:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_21950B008();
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6)
    {
LABEL_14:
      int v7 = *(unsigned int (**)(const void *))(v6 + 24);
      if (!v7) {
        goto LABEL_20;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      goto LABEL_14;
    }
  }
LABEL_10:
  int v7 = (unsigned int (*)(const void *))MEMORY[0x18];
  if (!MEMORY[0x18])
  {
LABEL_20:
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
LABEL_15:
  if (!v7) {
    goto LABEL_20;
  }
  if (v7(a1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
LABEL_18:
      uint64_t v5 = 0;
      goto LABEL_19;
    }
LABEL_21:
    sub_21950AF94();
    goto LABEL_18;
  }
LABEL_19:
  CFRelease(a1);
  return v5;
}

BOOL sub_219500B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7)
  {
    BOOL v8 = *(uint64_t (**)(uint64_t, void, void, uint64_t, uint64_t, void))(v7 + 16);
    if (!v8) {
      goto LABEL_29;
    }
  }
  else
  {
    BOOL v8 = (uint64_t (*)(uint64_t, void, void, uint64_t, uint64_t, void))MEMORY[0x10];
    if (!MEMORY[0x10]) {
      goto LABEL_29;
    }
  }
  if (v8)
  {
    int v9 = v8(a2, 0, 0, a3, a4, 0);
    kdebug_trace();
    if (v9)
    {
      kdebug_trace();
      if ((v9 + 12788) <= 8)
      {
        if (((1 << (v9 - 12)) & 0x1DB) != 0) {
          goto LABEL_30;
        }
        unsigned int v10 = 0;
        CFTypeRef v11 = &_os_log_internal;
        while (1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            sub_21950B15C(v17, v9, &v18);
            usleep(0x3E8u);
            uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
            if (v12)
            {
LABEL_12:
              uint64_t v13 = *(uint64_t (**)(uint64_t, void, void, uint64_t, uint64_t, void))(v12 + 16);
              if (!v13) {
                goto LABEL_18;
              }
              goto LABEL_16;
            }
          }
          else
          {
            usleep(0x3E8u);
            uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
            if (v12) {
              goto LABEL_12;
            }
          }
          uint64_t v13 = (uint64_t (*)(uint64_t, void, void, uint64_t, uint64_t, void))MEMORY[0x10];
          if (!MEMORY[0x10]) {
            goto LABEL_18;
          }
LABEL_16:
          if (!v13)
          {
LABEL_18:
            int v9 = -12782;
            goto LABEL_19;
          }
          int v9 = v13(a2, 0, 0, a3, a4, 0);
LABEL_19:
          if ((v9 == -12786 || v9 == -12783) && v10++ < 9) {
            continue;
          }
          break;
        }
      }
      kdebug_trace();
      if (v9)
      {
        BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
        if (!result) {
          return result;
        }
        sub_21950B0EC();
        return 0;
      }
    }
    return 1;
  }
LABEL_29:
  kdebug_trace();
  kdebug_trace();
LABEL_30:
  BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (result)
  {
    sub_21950B07C();
    return 0;
  }
  return result;
}

BOOL sub_219500E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, unsigned int a7)
{
  kdebug_trace();
  unint64_t v13 = *a6;
  unint64_t v14 = a6[1] - *a6;
  unint64_t v15 = v14 >> 3;
  int v16 = (v14 >> 3) + 3;
  uint64_t v17 = v16;
  if ((v14 >> 3) == -3)
  {
    int v18 = 0;
    goto LABEL_19;
  }
  if ((int)v15 <= -4) {
    sub_219486AE4();
  }
  int v18 = (double *)operator new(16 * v16);
  bzero(v18, 16 * v17);
  if ((int)v15 >= 1)
  {
    unint64_t v19 = *MEMORY[0x263F2C1E0];
    unint64_t v20 = (v14 >> 3);
    if (v20 < 8)
    {
      unint64_t v21 = 0;
      goto LABEL_16;
    }
    BOOL v22 = (unint64_t)v18 >= v13 + 8 * v20 || v13 >= (unint64_t)&v18[2 * v20];
    if (!v22)
    {
      unint64_t v21 = 0;
LABEL_16:
      unint64_t v30 = &v18[2 * v21 + 1];
      unint64_t v31 = (uint64_t *)(v13 + 8 * v21);
      unint64_t v32 = v21 - v20;
      do
      {
        *((void *)v30 - 1) = v19;
        uint64_t v33 = *v31++;
        *(void *)unint64_t v30 = v33;
        v30 += 2;
        BOOL v22 = __CFADD__(v32++, 1);
      }
      while (!v22);
      goto LABEL_19;
    }
    uint64_t v23 = (v14 >> 3) & 3;
    unint64_t v21 = v20 - v23;
    int64x2_t v24 = vdupq_n_s64(v19);
    int v25 = v18 + 4;
    uint64_t v26 = (long long *)(v13 + 16);
    unint64_t v27 = v20 - v23;
    do
    {
      v43.val[1] = (float64x2_t)*(v26 - 1);
      long long v28 = *v26;
      long long v29 = v25 - 4;
      v43.val[0] = (float64x2_t)v24;
      vst2q_f64(v29, v43);
      vst2q_f64(v25, *(float64x2x2_t *)v24.i8);
      v25 += 8;
      v26 += 2;
      v27 -= 4;
    }
    while (v27);
    if (v23) {
      goto LABEL_16;
    }
  }
LABEL_19:
  uint64_t v34 = (void *)((char *)v18 + ((uint64_t)(v14 << 29) >> 28));
  *uint64_t v34 = @"OperationsList";
  v34[1] = a3;
  unint64_t v35 = (void *)((char *)v18 + ((uint64_t)((v14 << 29) + 0x100000000) >> 28));
  *unint64_t v35 = @"ActionsList";
  v35[1] = a4;
  uint64_t v36 = (void *)((char *)v18 + ((uint64_t)((v14 << 29) + 0x200000000) >> 28));
  *uint64_t v36 = @"StatsBuffer";
  v36[1] = a5;
  uint64_t v37 = kdebug_trace();
  BOOL v38 = sub_219500B00(v37, a2, v17, (uint64_t)v18);
  if (!(v38 & a7)) {
    goto LABEL_32;
  }
  kdebug_trace();
  uint64_t v39 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v39)
  {
    uint64_t v40 = *(uint64_t (**)(uint64_t))(v39 + 24);
    if (!v40) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v40 = (uint64_t (*)(uint64_t))MEMORY[0x18];
    if (!MEMORY[0x18]) {
      goto LABEL_26;
    }
  }
  if (v40)
  {
    int v41 = v40(a2);
    goto LABEL_27;
  }
LABEL_26:
  int v41 = -12782;
LABEL_27:
  kdebug_trace();
  if (v41)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      sub_21950B1A0();
    }
    BOOL v38 = 0;
  }
  else
  {
    BOOL v38 = 1;
  }
LABEL_32:
  operator delete(v18);
  return v38;
}

void sub_219501198(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2195011C4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D48B5B0);
}

uint64_t sub_2195011FC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    sub_2194FFAE4(result);
    JUMPOUT(0x21D48B5B0);
  }
  return result;
}

uint64_t sub_219501244(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_2195012B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void sub_2195012D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

__CFDictionary *sub_2195012EC(int a1, int a2, int a3, int a4, int a5, int a6, char a7, int a8)
{
  int v31 = a2;
  int valuePtr = a1;
  int v29 = a4;
  int v30 = a3;
  int v27 = a6;
  int v28 = a5;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFNumberRef v12 = CFNumberCreate(v10, kCFNumberIntType, &valuePtr);
    if (!v12) {
      goto LABEL_13;
    }
    CFNumberRef v13 = v12;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04240], v12);
    CFRelease(v13);
    CFNumberRef v14 = CFNumberCreate(v10, kCFNumberIntType, &v31);
    if (!v14) {
      goto LABEL_13;
    }
    CFNumberRef v15 = v14;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04118], v14);
    CFRelease(v15);
    CFNumberRef v16 = CFNumberCreate(v10, kCFNumberIntType, &v30);
    if (!v16) {
      goto LABEL_13;
    }
    CFNumberRef v17 = v16;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04180], v16);
    CFRelease(v17);
    CFNumberRef v18 = CFNumberCreate(v10, kCFNumberIntType, &v29);
    if (!v18) {
      goto LABEL_13;
    }
    CFNumberRef v19 = v18;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04078], v18);
    CFRelease(v19);
    CFNumberRef v20 = CFNumberCreate(v10, kCFNumberIntType, &v28);
    if (!v20) {
      goto LABEL_13;
    }
    CFNumberRef v21 = v20;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04198], v20);
    CFRelease(v21);
    BOOL v22 = CFDictionaryCreateMutable(v10, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v22)
    {
      uint64_t v23 = v22;
      int64x2_t v24 = (const void *)*MEMORY[0x263EFFB40];
      CFDictionarySetValue(v22, (const void *)*MEMORY[0x263F0EE10], (const void *)*MEMORY[0x263EFFB40]);
      if ((a7 & 1) == 0) {
        CFDictionarySetValue(v23, (const void *)*MEMORY[0x263F0EF30], (const void *)*MEMORY[0x263EFFB38]);
      }
      if (a8) {
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04158], v24);
      }
      CFNumberRef v25 = CFNumberCreate(v10, kCFNumberIntType, &v27);
      CFDictionarySetValue(v23, (const void *)*MEMORY[0x263F0ED58], v25);
      CFRelease(v25);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04130], v23);
    }
    else
    {
LABEL_13:
      uint64_t v23 = Mutable;
      CFMutableDictionaryRef Mutable = 0;
    }
    CFRelease(v23);
  }
  return Mutable;
}

uint64_t sub_219501564(unsigned int a1, unsigned int a2, OSType a3, CVPixelBufferRef *a4, int a5, int a6, int a7, char a8, unsigned __int8 a9)
{
  CFNumberRef v13 = sub_2195012EC(a1, a2, a3, a5, a6, a7, a8, a9);
  if (v13)
  {
    CFNumberRef v14 = v13;
    uint64_t v15 = CVPixelBufferCreate(0, a1, a2, a3, v13, a4);
    CFRelease(v14);
    if (!v15) {
      return v15;
    }
  }
  else
  {
    uint64_t v15 = 4294960636;
  }
  *a4 = 0;
  return v15;
}

void sub_219501614()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 307, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950164C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 316, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501684()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 325, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195016BC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 334, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195016F4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 343, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950172C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 353, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501764()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 362, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950179C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 371, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195017D4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 380, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950180C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 389, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501844()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 398, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950187C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 407, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195018B4()
{
}

void sub_2195018EC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 419, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501924()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtraction.cpp", 428, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950195C()
{
}

void sub_219501994()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 180, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195019CC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 193, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501A04()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 199, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501A3C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 205, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501A74()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 215, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501AAC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 227, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501AE4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 236, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501B1C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 248, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501B54()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 256, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501B8C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 269, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501BC4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 277, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501BFC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 288, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501C34()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 296, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501C6C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 307, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501CA4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 315, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501CDC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 328, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501D14()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 338, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501D4C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 349, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501D84()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 360, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501DBC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 371, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501DF4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 382, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501E2C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 392, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501E64()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 401, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501E9C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 411, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501ED4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 421, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501F0C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 438, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501F44()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 453, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501F7C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 461, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501FB4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 469, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219501FEC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 478, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502024()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 491, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950205C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 499, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502094()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 507, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195020CC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 517, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502104()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 526, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950213C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 537, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502174()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 547, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195021AC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 559, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195021E4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 568, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950221C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 577, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502254()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 586, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950228C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 596, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195022C4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 606, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195022FC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 617, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502334()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 629, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950236C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 644, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195023A4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 657, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195023DC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 666, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502414()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 691, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950244C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 715, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502484()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 728, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195024BC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 738, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195024F4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 751, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950252C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 761, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502564()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 773, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950259C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 782, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195025D4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 794, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950260C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 807, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502644()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 817, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950267C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 827, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195026B4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 837, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195026EC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 847, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502724()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 859, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950275C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 871, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502794()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionConfig.cpp", 885, "cfg != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195027CC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 81, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502804()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 88, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950283C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 95, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502874()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 102, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195028AC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 109, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195028E4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 116, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950291C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 123, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502954()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 130, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950298C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 137, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195029C4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 144, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195029FC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 151, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502A34()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 158, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502A6C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 165, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502AA4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 172, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502ADC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/product/AppleCVHWA/AppleCVHWA/src/CVHWAFeatureExtractionHwBufferInfo.cpp", 179, "hdl != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502B14()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwCvdAllConfigurationUtilsImpl.h", 504, "size == extra_input_size", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502B4C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwCvdAllConfigurationUtilsImpl.h", 483, "size == data_segment_size", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502B84()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwCvdAllConfigurationUtilsImpl.h", 461, "size == itcm_size", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502BBC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwLaccUtilsImpl.h", 33, "base_addr != nullptr && \"address cannot be null\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502BF4()
{
}

void sub_219502C2C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwLaccUtilsImpl.h", 62, "lacc_buffer_size >= input_size && \"buffer size cannot be more than input\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502C64()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwCvdAllConfigurationUtilsImpl.h", 43, "cvd_all_cfg.size() == 1 && octave == 0 && \"Operation buffer is only programmed once for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502C9C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 253, "input_format == CISP_INPUT_FORMAT_RAW8", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502CD4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 259, "octave == 0", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502D0C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwCvdAllConfigurationUtilsImpl.h", 222, "num_octaves == 4 || num_octaves == 5 && \"number of octaves can only be 4 or 5\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502D44()
{
}

void sub_219502D7C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 352, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502DB4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 355, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502DEC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 360, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502E24()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 364, "(FlowType::kFlow1 == flow_) || ((FlowType::kFlow2 == flow_) && octave == 0) && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502E5C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 368, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502E94()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 367, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502ECC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 372, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502F04()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 371, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502F3C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 376, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502F74()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 375, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502FAC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 380, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219502FE4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 379, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950301C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 384, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219503054()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 383, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950308C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 388, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195030C4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 387, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195030FC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 391, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219503134()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 394, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950316C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 403, "FlowType::kFlow2 == flow_ && \"Only supported in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195031A4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwColl.cpp", 431, "FlowType::kFlow2 == flow_ && \"Only supported in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195031DC()
{
}

void sub_219503214()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwCvdAllConfigurationUtils.h", 196, "(config.wmaInitiator[i] >= 0 && config.wmaInitiator[i] < 3) && \"WMA initiator setting is either 0, 1, or 2.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950324C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwCvdAllConfigurationUtils.h", 194, "(config.rmaInitiator[i] >= 0 && config.rmaInitiator[i] < 3) && \"RMA initiator setting is either 0, 1, or 2.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219503284()
{
}

void sub_2195032BC()
{
}

void sub_2195032F4()
{
}

void sub_21950332C()
{
}

void sub_219503364()
{
}

void sub_21950339C()
{
}

void sub_2195033D4()
{
}

void sub_21950340C()
{
}

void sub_219503444()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwPlatformInterface.h", 210, "(n <= 8) && \"number of vector lanes cannot exceed 8\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950347C()
{
}

void sub_2195034B4()
{
}

void sub_2195034EC()
{
}

void sub_219503524()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwPlatformInterface.h", 222, "(n <= 4) && \"number of vector lanes cannot exceed 4\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950355C()
{
}

void sub_219503594()
{
}

void sub_2195035CC()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof BP MCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219503640()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof BP HCnt: %d", v1, v2, v3, v4, v5);
}

void sub_2195036B4()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Mbr StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219503728()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof bus StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_21950379C()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof SB Dr StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219503810()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Hz StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219503884()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof It BCont StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_2195038F8()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Dt BCont StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_21950396C()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Dt SCont StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_2195039E0()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Dt LCont StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219503A54()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Pp ClStCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219503AC8()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Pk Cnt: %d", v1, v2, v3, v4, v5);
}

void sub_219503B3C()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof H Cnt: %d", v1, v2, v3, v4, v5);
}

void sub_219503BB0()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof FR Cnt: %d", v1, v2, v3, v4, v5);
}

void sub_219503C24()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "Final HALT location = %08x", v1, v2, v3, v4, v5);
}

void sub_219503C98()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  sub_2194890EC();
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error addr = 0x%08x_%08x, std::string::size_type size = %d, source = %08x", v0, 0x1Au);
}

void sub_219503D20()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  sub_2194890EC();
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "STAT0 = %08x, STAT1 = %08x, STAT2 = %08x, halt status = %d", v0, 0x1Au);
}

void sub_219503DA8()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sub_2194890EC();
  __int16 v3 = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "LC0 = %08x, LC1 = %08x, LC2 = %08x, LC3 = %08x, RET = %08x", v2, 0x20u);
}

void sub_219503E40(char *a1, void **a2, uint8_t *buf, void *a4)
{
  if (*a1 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  *(_DWORD *)buf = 136446210;
  *a4 = v6;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  if (*a1 < 0) {
    operator delete(*a2);
  }
}

void sub_219503EBC()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "===== HW version %08x =====", v1, v2, v3, v4, v5);
}

void sub_219503F30()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "================ Post-execution State ===============", v0, 2u);
}

void sub_219503F78()
{
}

void sub_219503FB0()
{
}

void sub_219503FE8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwDesgenConfigurationUtilsImpl.h", 540, "curr_desc_size <= kCurrDescriptorDTCMSizeColl", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504020()
{
}

void sub_219504058()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwDesgenConfigurationUtilsImpl.h", 277, "(input_cfg.numberOfOctaves == hw::desgen::ComputeNumOctavesFlow2( input_cfg.inputImageWidth, input_cfg.inputImageHeight)) && \"If width and height are > 320 then number of octaves should be 5 else,\" \"number of octaves should be 4.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504090()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwDesgenConfigurationUtilsImpl.h", 272, "(input_cfg.numberOfOctaves == 4 || input_cfg.numberOfOctaves == 5) && \"Number of octaves can only be 4 or 5.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195040C8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwDesgenConfigurationUtilsImpl.h", 237, "num_stripes == 1", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504100()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwDesgenConfigurationUtilsImpl.h", 234, "hal.numberOfGridElements == feature_detection::kNumRegionOfInterestBlocks", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504138()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwDesgenConfigurationUtilsImpl.h", 233, "hal.minBlockSize == feature_detection::kMinBlockSize", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504170()
{
}

void sub_2195041A8()
{
}

void sub_2195041E0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCollUtils.cpp", 95, "full_desc_min_data.offset == full_desc_max_data.offset + full_desc_max_data.max_size && \"Full desc maxima and Full desc minima should be contiguous in memory\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504218()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCollUtils.cpp", 91, "(full_desc_max_data.offset < full_desc_min_data.offset || config.maxNumberOfKeypoints == 0) && \"Full desc maxima offset should be lower than Full desc minima offset.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504250()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCollUtils.cpp", 77, "config.flow == FlowType::kFlow2 && \"This function is only valid in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504288()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwDesgenUtils.h", 60, "full_desc_min_data.offset == full_desc_max_data.offset + full_desc_max_data.max_size && \"Full desc maxima and Full desc minima should be contiguous in memory\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195042C0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwDesgenUtils.h", 56, "(full_desc_max_data.offset < full_desc_min_data.offset || config.maxNumberOfKeypoints == 0) && \"Full desc maxima offset should be lower than Full desc minima offset.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195042F8()
{
}

void sub_219504330()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwIspDataHandler.h", 297, "FlowType::kFlow2 == flow_ && \"Only valid in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504368()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwIspDataHandler.h", 374, "final_num_keypoints <= (full_desc_data_.num_descriptors + full_desc_min_data_.num_descriptors)", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195043A0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwIspDataHandler.h", 359, "FlowType::kFlow2 == flow_ && \"Only valid in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195043D8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/include/VIO/Hardware/KeyPointAndDescriptorGeneratorUtils.h", 68, "(kp_desc_size + kp_desc_size_min) == kp_idx.size() && \"total kp_desc_size and kp_idx size should match\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504410()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/include/VIO/Hardware/KeyPointAndDescriptorGeneratorUtils.h", 65, "num_buckets_scale >= 1 && \"num of buckets scale should be >= 1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504448()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/include/VIO/Hardware/KeyPointAndDescriptorGeneratorUtils.h", 64, "(num_buckets_x == 1 && num_buckets_y == 1) && \"num_buckets x and y should be 1, other settings are currently not supported\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504480(void **a1, char *a2, void **a3)
{
  uint8_t v5 = (char *)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    BOOL v8 = v5;
    do
    {
      CFAllocatorRef v10 = (void *)*((void *)v8 - 3);
      v8 -= 24;
      uint64_t v9 = v10;
      if (v10)
      {
        *((void *)v5 - 2) = v9;
        operator delete(v9);
      }
      uint8_t v5 = v8;
    }
    while (v8 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

void sub_2195044F8()
{
}

void sub_219504530()
{
}

void sub_219504568()
{
}

void sub_2195045A0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwCvdAllConfigurationUtilsImpl.h", 129, "shortDescriptorSel == static_cast<uint32_t>(ShortDescriptorSel::kNone) && \"shall be kNone here\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195045D8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 246, "input_format == CISP_INPUT_FORMAT_RAW8", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504610()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 252, "octave == 0", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504648()
{
}

void sub_219504680()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 339, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195046B8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 342, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195046F0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 347, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504728()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 351, "(FlowType::kFlow1 == flow_) || ((FlowType::kFlow2 == flow_) && octave == 0) && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504760()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 355, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504798()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 354, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195047D0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 359, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504808()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 358, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504840()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 363, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504878()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 362, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195048B0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 367, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195048E8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 366, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504920()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 371, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504958()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 370, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504990()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 375, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195049C8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 374, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504A00()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 378, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504A38()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 381, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504A70()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 390, "FlowType::kFlow2 == flow_ && \"Only supported in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504AA8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCrete.cpp", 418, "FlowType::kFlow2 == flow_ && \"Only supported in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219504AE0()
{
}

void sub_219504B18()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Mbr StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219504B8C()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof bus StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219504C00()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof SB Dr StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219504C74()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Hz StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219504CE8()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof It BCont StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219504D5C()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Dt BCont StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219504DD0()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Dt SCont StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219504E44()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Dt LCont StCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219504EB8()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Pp ClStCnt: %d", v1, v2, v3, v4, v5);
}

void sub_219504F2C()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Pk Cnt: %d", v1, v2, v3, v4, v5);
}

void sub_219504FA0()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof H Cnt: %d", v1, v2, v3, v4, v5);
}

void sub_219505014()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof FR Cnt: %d", v1, v2, v3, v4, v5);
}

void sub_219505088()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "Final HALT location = %08x", v1, v2, v3, v4, v5);
}

void sub_2195050FC()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  sub_2194890EC();
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error addr = 0x%08x_%08x, std::string::size_type size = %d, source = %08x", v0, 0x1Au);
}

void sub_219505184()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  sub_2194890EC();
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "STAT0 = %08x, STAT1 = %08x, STAT2 = %08x, halt status = %d", v0, 0x1Au);
}

void sub_21950520C()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sub_2194890EC();
  __int16 v3 = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "LC0 = %08x, LC1 = %08x, LC2 = %08x, LC3 = %08x, RET = %08x", v2, 0x20u);
}

void sub_2195052A4()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "===== HW version %08x =====", v1, v2, v3, v4, v5);
}

void sub_219505318()
{
}

void sub_219505350()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCreteUtils.cpp", 122, "full_desc_min_data.offset == full_desc_max_data.offset + full_desc_max_data.max_size && \"Full desc maxima and Full desc minima should be contiguous in memory\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505388()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCreteUtils.cpp", 118, "(full_desc_max_data.offset < full_desc_min_data.offset || config.maxNumberOfKeypoints == 0) && \"Full desc maxima offset should be lower than Full desc minima offset.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195053C0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCreteUtils.cpp", 104, "config.flow == FlowType::kFlow2 && \"This function is only valid in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195053F8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCvdAllConfigurationUtils.cpp", 109, "size == extra_input_size", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505430()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCvdAllConfigurationUtils.cpp", 88, "size == data_segment_size", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505468()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCvdAllConfigurationUtils.cpp", 66, "size == itcm_size", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195054A0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwCvdAllConfigurationUtils.cpp", 350, "FlowType::kFlow0 != flow && \"Flow 0 not supported\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195054D8()
{
}

void sub_219505510()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 95, "(config.inputImageWidth >> (config.numberOfOctaves - 1)) >= hal_.minSupportedWidthFlow1 && \"Min supported width violation\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505548()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 98, "(config.inputImageHeight >> (config.numberOfOctaves - 1)) >= hal_.minSupportedHeightFlow1 && \"Min supported height violation\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505580()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 90, "config.numberOfOctaves <= kMaxNumOctaves && \"Number of octaves has to be smaller than the maximum possible\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195055B8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 85, "hal_.minSupportedWidthFlow1 == hal_.minSupportedHeightFlow1 && \"min supported width and height should match\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195055F0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 149, "flow_ == config.flow && flow_ == FlowType::kFlow2", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505628()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 148, "max_keypoints_ == config.maxNumberOfKeypoints", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505660()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 147, "input_width_ == config.inputImageWidth && input_height_ == config.inputImageHeight", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505698()
{
}

void sub_2195056D0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 207, "octave == 0 && \"Action buffer is only programmed once for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505708()
{
}

void sub_219505740()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 266, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505778()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 269, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195057B0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 274, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195057E8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 278, "(FlowType::kFlow1 == flow_) || ((FlowType::kFlow2 == flow_) && octave == 0) && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505820()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 282, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505858()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 281, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505890()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 286, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195058C8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 285, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505900()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 290, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505938()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 289, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505970()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 294, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195059A8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 293, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195059E0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 298, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505A18()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 297, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505A50()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 302, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505A88()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 301, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505AC0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgen.cpp", 311, "FlowType::kFlow2 == flow_ && \"Only supported in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505AF8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 222, "hal.numberOfGridElements == feature_detection::kNumRegionOfInterestBlocks", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505B30()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 221, "hal.minBlockSize == feature_detection::kMinBlockSize", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505B68()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 267, "block_size >= min_block_size && \"Each block has to be at least 4 pixels big\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505BA0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 266, "(start + block_size * num_blocks <= dimension + block_size - 1) && \"Only the last block can extend beyond the image boundary\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505BD8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 264, "start >= 0 && \"Start should be greater than or equal to 0\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505C10()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 246, "expected_start >= 0 && expected_end > expected_start && expected_end <= dimension", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505C48()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 261, "(expected_end <= start + num_blocks * block_size) && \"User requested end of ROI should be in the HW ROI\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505C80()
{
}

void sub_219505CB8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 274, "(input_cfg.numberOfBinsHardwareX >= hal.minNumberOfBinsHardwareXFlow1 && input_cfg.numberOfBinsHardwareX <= hal.maxNumberOfBinsHardwareXFlow1) && \"numberOfBinsHardwareX has to be between 1 and 64\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505CF0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 277, "(input_cfg.numberOfBinsHardwareY >= hal.minNumberOfBinsHardwareYFlow1 && input_cfg.numberOfBinsHardwareY <= hal.maxNumberOfBinsHardwareYFlow1) && \"numberOfBinsHardwareY has to be between 1 and 64\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505D28()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 401, "(input_cfg.numberOfOctaves == hw::desgen::ComputeNumOctavesFlow2( input_cfg.inputImageWidth, input_cfg.inputImageHeight)) && \"If width and height are > 320 then number of octaves should be 5 else,\" \"number of octaves should be 4.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505D60()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 396, "(input_cfg.numberOfOctaves == 4 || input_cfg.numberOfOctaves == 5) && \"Number of octaves can only be 4 or 5.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505D98()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 718, "set_pointer_num <= kSetPointerMaxNum", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505DD0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 767, "curr_desc_size <= kCurrDescriptorDTCMSize", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505E08()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 783, "FlowType::kFlow0 != flow && \"Flow 0 not supported\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505E40()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 807, "(std::all_of(desgen_cfg.begin(), desgen_cfg.end(), [key_out_max](const HwStatenDesgenCfg& config) { return config.keyFrameMax == key_out_max; })) && \"keyOutMax for all octaves needs to be the same\"",
    (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505E78()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 857, "desgen_cfg.size() == 1 && \"Make sure we are only populating one config for Flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505EB0()
{
}

void sub_219505EE8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 1036, "num_octaves == 4 || num_octaves == 5 && \"number of octaves can only be 4 or 5\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505F20()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenConfigurationUtils.cpp", 1230, "desgen_cfg.size() == 1 && octave == 0 && \"Operation buffer is only programmed once for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505F58()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwDesgenConfigurationUtilsImpl.h", 37, "hal.numberOfGridElements == feature_detection::kNumRegionOfInterestBlocks", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505F90()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwDesgenConfigurationUtilsImpl.h", 36, "hal.minBlockSize == feature_detection::kMinBlockSize", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219505FC8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenUtils.cpp", 35, "kpdesc != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506000()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwDesgenUtils.cpp", 56, "config.flow == FlowType::kFlow2 && \"This function is only valid in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506038()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtraction.cpp", 61, "direct_config.maxInputImageWidth >= direct_config.inputImageWidth && \"Max Width has to be larger than current width\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506070()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtraction.cpp", 63, "direct_config.maxInputImageHeight >= direct_config.inputImageHeight && \"Max height has to be larger than current height\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195060A8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtraction.cpp", 65, "direct_config.inputImageWidth <= direct_config.inputImageStride && \"The stride has to be larger or equal to the image width\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195060E0()
{
}

void sub_219506118()
{
}

void sub_219506150()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtraction.cpp", 67, "direct_config.inputImageStride % KBytesPerRowAlignmentHw == 0 && \"Stride needs to be aligned to 64 bytes\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506188()
{
}

void sub_2195061C0()
{
}

void sub_2195061F8()
{
}

void sub_219506230()
{
}

void sub_219506268()
{
}

void sub_2195062A0()
{
}

void sub_2195062D8()
{
}

void sub_219506310()
{
}

void sub_219506348()
{
}

void sub_219506380()
{
}

void sub_2195063B8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtractionInterface.cpp", 337, "stride == ctx->config.inputImageStride", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195063F0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtractionInterface.cpp", 336, "height == ctx->config.inputImageHeight", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506428()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtractionInterface.cpp", 335, "width == ctx->config.inputImageWidth", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506460()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtractionInterface.cpp", 440, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506498()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtractionInterface.cpp", 448, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195064D0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtractionInterface.cpp", 456, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506508()
{
}

void sub_219506540()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtractionInterface.cpp", 465, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506578()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwFeatureExtractionInterface.cpp", 473, "ctx != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195065B0()
{
}

void sub_2195065E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219506624()
{
  sub_21949D940();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "********* ******** ******* ****** ***** **** *** ** * Failed to create ISP session in XPCServer: error %u", v1, v2, v3, v4, v5);
}

void sub_219506694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2195066D0()
{
  sub_21949D940();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "HwGPWrapper::LoadProgram Error: unspecified error #%u", v1, v2, v3, v4, v5);
}

void sub_219506740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950677C(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = (uint64_t *)*a1;
  }
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "HwGPWrapper::LoadProgram Error: Binary file %s not found.", (uint8_t *)&v2, 0xCu);
}

void sub_21950680C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219506848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219506884()
{
  sub_21949D940();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "ReconnectSession: Failed to create an ISP session with buffers -- error code %u", v1, v2, v3, v4, v5);
}

void sub_2195068F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219506930()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGPWrapper.cpp", 504, "(daemon_client_.conn == nullptr && daemon_client_.client_id == 0) && \"Client should not try to reconnect when both connection and client ID \" \"are non-zero\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2195069A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2195069E0()
{
  sub_21949D940();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "HwGPWrapper::RunL...Program() -- error code returned by daemon: %d", v1, v2, v3, v4, v5);
}

void sub_219506A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219506A8C(char a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109376;
  v2[1] = a2;
  __int16 v3 = 1024;
  int v4 = a1 & 1;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error in VisionHWARequestProcessISPSession: error %u, cached=%d", (uint8_t *)v2, 0xEu);
}

void sub_219506B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219506B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219506B94()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  sub_21949D904();
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Lookup requests sent by client: %d, most recently at %{public}s.%06d", v0, 0x18u);
}

void sub_219506C18()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  sub_21949D904();
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Load requests sent by client: %d, most recently at %{public}s.%06d", v0, 0x18u);
}

void sub_219506C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219506D14()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  sub_21949D928();
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Processing Session created at %{public}s.%06d", v0, 0x12u);
}

void sub_219506D94()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  sub_21949D928();
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "XPC Connection created at %{public}s.%06d", v0, 0x12u);
}

void sub_219506E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219506E50(void **a1, uint64_t a2)
{
  int v4 = *a1;
  *a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

void sub_219506E94(void **__p)
{
  do
  {
    uint64_t v2 = (void **)*__p;
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
    operator delete(__p);
    long long __p = v2;
  }
  while (v2);
}

void sub_219506ED8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 259, "isp_dev_.get() != nullptr && \"Failed to create an ISP device instance\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506F10()
{
}

void sub_219506F48()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 504, "(base != buf) && \"Unnecessary memcpy, source == destination.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506F80()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 452, "(needs_alloc || tracked_cvpb != nullptr) && \"No CVPixelBuffer backing available\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506FB8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 431, "(*counterpart_ptr != *dma_ptr) && \"Shouldn't be in this branch if dma_in_ptr_ == dma_out_ptr_\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219506FF0()
{
}

void sub_219507028()
{
}

void sub_219507060()
{
}

void sub_219507098()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 542, "arg != nullptr && \"arg pointer is NULL\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195070D0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 550, "stack_buffer != nullptr && \"data pointer is NULL\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507108()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 560, "data != nullptr && \"data pointer is NULL\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950717C()
{
}

void sub_2195071B4()
{
}

void sub_2195071EC()
{
}

void sub_219507224()
{
}

void sub_21950725C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 601, "(n <= 8) && \"number of vector lanes cannot exceed 8\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507294()
{
}

void sub_2195072CC()
{
}

void sub_219507304()
{
}

void sub_21950733C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 609, "(n <= 4) && \"number of vector lanes cannot exceed 4\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507374()
{
}

void sub_2195073AC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 679, "(dtcm_base_addr != 0ul && dtcm_top_addr > dtcm_base_addr) && \"Uninitialized platform data memory limits\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195073E4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 681, "(itcm_base_addr != 0ul && itcm_top_addr > itcm_base_addr) && \"Uninitialized platform instruction memory limits\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950741C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219507458(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unexpected program counter: 0x%08x.", (uint8_t *)v1, 8u);
}

void sub_2195074D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219507514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219507550()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 735, "(stack_address >= (dtcm_base_addr) && stack_alloc_end_addr_ <= dtcm_top_addr) && \"Accelerator stack extends outside of DTCM range.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507588()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 725, "(data_address >= (lacc_phys_base_address + dtcm_base_addr) && dtcm_range_max_ <= dtcm_top_addr) && \"Accelerator data extends outside the DTCM range.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195075C0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 717, "(code_address >= (lacc_phys_base_address + itcm_base_addr) && itcm_range_max_ <= itcm_top_addr) && \"Accelerator code extends outside the ITCM range.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195075F8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 677, "(lacc_phys_base_address > 0ull && lacc_phys_base_address != ~0ull) && \"Uninitialized platform base address\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507630()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 1222, "(!info2.enabled || outputBufferIDs[i] != 0) && \"invalid buffer ID configured\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507668()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwGeneralProcessingAPI.cpp", 1215, "(i == 0 || !info.enabled || inputBufferIDs[i] != 0) && \"invalid buffer ID configured\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195076A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2195076DC(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = (uint64_t *)*a1;
  }
  int v2 = 136315138;
  __int16 v3 = v1;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Symbol %s was not found", (uint8_t *)&v2, 0xCu);
}

void sub_21950776C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2195077A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2195077E4()
{
}

void sub_21950781C()
{
}

void sub_219507854()
{
}

void sub_21950788C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 586, "FlowType::kFlow2 == flow_ && \"Keypoint Candidates output only valid for Flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195078C4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 603, "FlowType::kFlow2 == flow_ && \"Keypoints output only valid for Flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195078FC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 331, "FlowType::kFlow1 == flow_ && \"Raw keypoints is only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507934()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 516, "FlowType::kFlow2 == flow_ && \"Full Freak Desc output only valid for Flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950796C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 551, "FlowType::kFlow2 == flow_ && \"Short Freak Desc output only valid for Flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195079A4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 648, "FlowType::kFlow2 == flow_ && \"Binned Desc output only valid for Flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195079DC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 665, "FlowType::kFlow2 == flow_ && \"Bidir Matches only valid for Flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507A14()
{
}

void sub_219507A4C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 475, "extraction_info_->input_image_stride >= extraction_info_->input_image_width && \"Input image stride should be greater or equal to the input image \" \"width in the feature buffer\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507A84()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 472, "extraction_info_->input_image_stride % KBytesPerRowAlignmentHw == 0 && \"Input image stride should be 64 byte aligned in the feature buffer\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507ABC()
{
}

void sub_219507AF4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 493, "output_keypoints_data_.keypoints != nullptr && output_descriptors_data_.descriptors != nullptr", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507B2C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwIspDataHandler.cpp", 484, "NumberOfKeypointsForRelocalizationOnly() == 0 && \"makes sure when adding features, no featues are considered\" \"as relocalization only\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507B64()
{
}

void sub_219507B9C()
{
}

void sub_219507BD4()
{
}

void sub_219507C0C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyConfigurationUtils.cpp", 106, "(input_cfg.numberOfBinsHardwareX >= hal.minNumberOfBinsHardwareX && input_cfg.numberOfBinsHardwareX <= hal.maxNumberOfBinsHardwareX) && \"numberOfBinsHardwareX has to be between 1 and 64\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507C44()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyConfigurationUtils.cpp", 109, "(input_cfg.numberOfBinsHardwareY >= hal.minNumberOfBinsHardwareY && input_cfg.numberOfBinsHardwareY <= hal.maxNumberOfBinsHardwareY) && \"numberOfBinsHardwareY has to be between 1 and 64\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507C7C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyConfigurationUtils.cpp", 165, "(key_cfg.activeStartX + key_cfg.blockSizeX * 5 <= (input_cfg.inputImageWidth >> octave)) && \"Active Area X ends outside image\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507CB4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyConfigurationUtils.cpp", 166, "(key_cfg.activeStartY + key_cfg.blockSizeY * 5 <= (input_cfg.inputImageHeight >> octave)) && \"Active Area Y ends outside image\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507CEC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyConfigurationUtils.cpp", 91, "hal.numberOfGridElements == feature_detection::kNumRegionOfInterestBlocks", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507D24()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyConfigurationUtils.cpp", 90, "hal.minBlockSize == feature_detection::kMinBlockSize", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507D5C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/ImageProcessing/include/VIO/ImageProcessing/PyramidScaleSpace.hpp", 125, "x.height == height && \"Height of input data does not match expected height\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507D94()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/ImageProcessing/include/VIO/ImageProcessing/PyramidScaleSpace.hpp", 123, "x.width == width && \"Width of input data does not match expected width\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507DCC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/ImageProcessing/include/VIO/ImageProcessing/PyramidScaleSpace.hpp", 116, "data.size() == levels().capacity() && \"Input size mismatches the expected size\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

uint64_t sub_219507E04()
{
  sub_2194B84C0();
  do
  {
    sub_2194B84E0();
    (*v0)();
    uint64_t result = sub_2194B84D0();
  }
  while (!v2);
  return result;
}

void sub_219507E54()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/ComputerVisionTypes/include/VIO/ComputerVisionTypes/Image.h", 308, "widthStep >= minimum_width_step && \"widthStep must be at least as big as minimum_width_step.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507E8C(uint64_t a1)
{
  char v2 = *(std::__shared_weak_count **)(a1 + 96);
  if (v2)
  {
    sub_2194B84EC(&v2->__shared_owners_);
    if (!v3)
    {
      sub_2194B84F8();
      v4();
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 80);
  if (v5)
  {
    sub_2194B84EC(&v5->__shared_owners_);
    if (!v6)
    {
      sub_2194B84F8();
      v7();
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

uint64_t sub_219507F44()
{
  sub_2194B84C0();
  do
  {
    sub_2194B84E0();
    (*v0)();
    uint64_t result = sub_2194B84D0();
  }
  while (!v2);
  return result;
}

void sub_219507F94()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyDoGFeatureDetector.cpp", 236, "laplacian_pyr.num_scales_per_octave() == 2 && \"Only supporting binomial gaussian pyramid, with 2 scales per octave\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219507FCC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/FeatureDetection/include/VIO/FeatureDetection/DoGFeatureDetector_impl.h", 557, "buckets_hist.size() == bucket_num && \"Buckets histogram is expected to be allocated on input.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508004()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/FeatureDetection/include/VIO/FeatureDetection/DoGFeatureDetector_impl.h", 528, "num_buckets_x == 1 && num_buckets_y == 1 && \"AssignScaleBuckets_Thresholding() does not support spatial buckets.\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950803C()
{
}

void sub_219508074()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyEngine.cpp", 87, "(config.inputImageWidth >> (config.numberOfOctaves - 1)) >= hal_.minSupportedWidth && \"Min supported width violation\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195080AC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyEngine.cpp", 90, "(config.inputImageHeight >> (config.numberOfOctaves - 1)) >= hal_.minSupportedHeight && \"Min supported height violation\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195080E4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyEngine.cpp", 83, "config.numberOfOctaves <= kMaxNumOctaves && \"Number of octaves has to be smaller than the maximum possible\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950811C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyEngine.cpp", 78, "hal_.minSupportedWidth == hal_.minSupportedHeight && \"min supported width and height should match\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508154()
{
}

void sub_21950818C()
{
}

void sub_2195081C4()
{
}

void sub_2195081FC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwPlatformUtils.h", 274, "val != std::numeric_limits<uint32_t>::max() && \"Passing max value for uint32_t into IncrementIfOdd, most likely\" \"unexpected behaviour\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508234()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/include/VIO/HWFeatureDetection/HwPlatformUtils.h", 278, "val % 2 == 0 && \"IncrementIfOdd should always return an\" \"even number\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950826C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwKeyEngine.cpp", 262, "(std::all_of(key_cfg_.begin(), key_cfg_.end(), [key_out_max](const HwKeyEngineCfg& config) { return config.keyOutMax == key_out_max; })) && \"keyOutMax for all octaves needs to be the same\"",
    (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195082A4()
{
}

void sub_2195082DC(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 134217984;
  *a2 = 1;
  sub_2194BFF04(&dword_219476000, &_os_log_internal, a3, "RMA%zu is set by daemon", a1);
}

void sub_219508324(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 134217984;
  *a2 = 0;
  sub_2194BFF04(&dword_219476000, &_os_log_internal, a3, "RMA%zu is set by daemon", a1);
}

void sub_219508368()
{
  sub_2194890EC();
  sub_2194BFF1C();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

void sub_2195083FC()
{
  sub_2194BFF1C();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x14u);
}

void sub_219508498()
{
  sub_2194890EC();
  sub_2194BFEE8(&dword_219476000, &_os_log_internal, v0, "d StBrpMk[0..2]: 0x%08x 0x%08x 0x%08x, pipe-clean: %d", v1, v2, v3, v4, v5);
}

void sub_219508514()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "d DtAdBrpPCl: %d", v1, v2, v3, v4, v5);
}

void sub_219508588()
{
  sub_2194890EC();
  sub_2194BFEE8(&dword_219476000, &_os_log_internal, v0, "d DtAdBrpEn[0..3]: %d %d %d %d", v1, v2, v3, v4, v5);
}

void sub_219508604()
{
  sub_2194890EC();
  sub_2194BFEE8(&dword_219476000, &_os_log_internal, v0, "d DtAdBrpEOf[0..3]: 0x%08x 0x%08x 0x%08x 0x%08x", v1, v2, v3, v4, v5);
}

void sub_219508680()
{
  sub_2194890EC();
  sub_2194BFEE8(&dword_219476000, &_os_log_internal, v0, "d DtAdBrpBsAd[0..3]: 0x%08x 0x%08x 0x%08x 0x%08x", v1, v2, v3, v4, v5);
}

void sub_2195086FC()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "d PCBrpPCl: %d", v1, v2, v3, v4, v5);
}

void sub_219508770()
{
  sub_2194890EC();
  sub_2194BFEE8(&dword_219476000, &_os_log_internal, v0, "d PCBrpEn[0..3]: %d %d %d %d", v1, v2, v3, v4, v5);
}

void sub_2195087EC()
{
  sub_2194890EC();
  sub_2194BFEE8(&dword_219476000, &_os_log_internal, v0, "d PCBrp[0..3]: 0x%08x 0x%08x 0x%08x 0x%08x", v1, v2, v3, v4, v5);
}

void sub_219508868()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "d En: %d", v1, v2, v3, v4, v5);
}

void sub_2195088DC()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof Clr: %d", v1, v2, v3, v4, v5);
}

void sub_219508950()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "prof En: %d", v1, v2, v3, v4, v5);
}

void sub_2195089C4()
{
  sub_219489114();
  sub_2194890D0(&dword_219476000, &_os_log_internal, v0, "ErrClean: %d", v1, v2, v3, v4, v5);
}

void sub_219508A38(char *a1, uint64_t a2, uint64_t a3)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = v4;
  sub_2194BFF04(&dword_219476000, &_os_log_internal, a3, "%{public}s", (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_219508AA8(char *a1, void **a2, uint8_t *a3, void *a4)
{
  if (*a1 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  *(_DWORD *)a3 = 136446210;
  *a4 = v6;
  sub_2194BFF04(&dword_219476000, &_os_log_internal, (uint64_t)a3, "%{public}s", a3);
  if (*a1 < 0) {
    operator delete(*a2);
  }
}

void sub_219508B1C()
{
  sub_2194BFF1C();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x38u);
}

void sub_219508C00()
{
  sub_2194BFF1C();
  _os_log_error_impl(v0, v1, v2, v3, v4, 2u);
}

void sub_219508C44()
{
}

void sub_219508C7C()
{
}

void sub_219508CB4()
{
}

void sub_219508CEC()
{
}

void sub_219508D24()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwPlatformUtils.cpp", 291, "width * height >= size && \"Buffer for keypoints is too small to contain all keypoints\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508D5C()
{
}

void sub_219508D94()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 223, "lacc_buffer_size >= lacc_tahiti_dp_bin_len", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508DCC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 270, "input_format == CISP_INPUT_FORMAT_RAW8", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508E04()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 276, "octave == 0", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508E3C()
{
}

void sub_219508E74()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 369, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508EAC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 372, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508EE4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 377, "FlowType::kFlow1 == flow_ && \"Only valid for flow1\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508F1C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 381, "(FlowType::kFlow1 == flow_) || ((FlowType::kFlow2 == flow_) && octave == 0) && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508F54()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 385, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508F8C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 384, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508FC4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 389, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219508FFC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 388, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509034()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 393, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950906C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 392, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195090A4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 397, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195090DC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 396, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509114()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 401, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950914C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 400, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509184()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 405, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195091BC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 404, "FlowType::kFlow2 == flow_ && \"Only valid for flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195091F4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 408, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950922C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 411, "octave == 0 && \"Invalid request\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509264()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 420, "FlowType::kFlow2 == flow_ && \"Only supported in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950929C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetection/src/HwTahiti-D93.cpp", 448, "FlowType::kFlow2 == flow_ && \"Only supported in flow2\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195092D4()
{
}

void sub_21950930C()
{
}

void sub_219509344()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetectionUtils/src/HwKeyHeaderParser.cpp", 357, "(ctx->config.hw_platform != hw::desgen::HwPlatform::kHwStaten) && \"Unsupported HW platform\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950937C()
{
}

void sub_2195093B4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/HWFeatureDetectionUtils/src/HwKeyHeaderParser.cpp", 397, "kCVReturnSuccess == err && \"Creating CVPixelBuffer failed!\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195093EC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/FeatureDetection/src/KeyEngineUtils.cpp", 86, "(start + block_size * kNumRegionOfInterestBlocks <= dimension) && \"End should be smaller than size\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509424()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/FeatureDetection/src/KeyEngineUtils.cpp", 87, "block_size >= kMinBlockSize && \"Each block has to be at least 4 pixels big\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950945C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/FeatureDetection/src/KeyEngineUtils.cpp", 84, "start >= 0 && \"Start should be greater than 0\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509494()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/FeatureDetection/src/KeyEngineUtils.cpp", 65, "expected_start >= 0 && expected_end > expected_start && expected_end <= dimension", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195094CC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/FeatureDetection/src/KeyEngineUtils.cpp", 81, "(expected_end <= start + kNumRegionOfInterestBlocks * block_size) && \"User requested end of ROI should be in the HW ROI\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509504()
{
}

void sub_21950953C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/FeatureDetection/src/KeyEngineUtils.cpp", 467, "num_octaves <= static_cast<int32_t>(requested_num_octave)", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509574(uint64_t a1, uint64_t a2)
{
  uint8_t v5 = (void *)sub_2194CC964(a1, a2);
  if (!v7)
  {
    BOOL v8 = v6;
    do
    {
      uint64_t v9 = v4;
      CFTypeRef v11 = (char *)*(v4 - 3);
      v4 -= 3;
      CFAllocatorRef v10 = v11;
      if (v11)
      {
        CFNumberRef v12 = (char *)*(v9 - 2);
        CFNumberRef v13 = v10;
        if (v12 != v10)
        {
          do
          {
            uint64_t v15 = v12 - 24;
            CFNumberRef v14 = (void *)*((void *)v12 - 3);
            if (v14)
            {
              *((void *)v12 - 2) = v14;
              operator delete(v14);
            }
            CFNumberRef v12 = v15;
          }
          while (v15 != v10);
          CFNumberRef v13 = *v4;
        }
        *(v9 - 2) = v10;
        operator delete(v13);
      }
    }
    while (v4 != v2);
    uint8_t v5 = *v8;
  }
  *uint64_t v3 = v2;
  operator delete(v5);
}

void sub_219509610(uint64_t a1, uint64_t a2)
{
  uint8_t v5 = (void *)sub_2194CC964(a1, a2);
  if (!v7)
  {
    BOOL v8 = v6;
    do
    {
      CFAllocatorRef v10 = *(void **)(v4 - 24);
      v4 -= 24;
      uint64_t v9 = v10;
      if (v10) {
        operator delete(v9);
      }
    }
    while (v4 != v2);
    uint8_t v5 = *v8;
  }
  *uint64_t v3 = v2;
  operator delete(v5);
}

void sub_219509660()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/CollKeyPointAndDescriptorMatcher.cpp", 84, "hamming_distance <= 471", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509698()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/include_private/VIO/Hardware/KeyPointAndDescriptorMatcherUtils.h", 40, "hamv_size <= 16", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195096D0()
{
}

void sub_219509708(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_2194D0F84(a1, a2);
  if (!v7)
  {
    BOOL v8 = v5;
    uint64_t v9 = v6;
    do
    {
      CFTypeRef v11 = *(void **)(v9 - 24);
      v9 -= 24;
      CFAllocatorRef v10 = v11;
      if (v11)
      {
        *(void *)(v6 - 16) = v10;
        operator delete(v10);
      }
      uint64_t v6 = v9;
    }
    while (v9 != v2);
    uint64_t v4 = *v8;
  }
  *uint64_t v3 = v2;

  operator delete(v4);
}

void sub_219509770()
{
}

void sub_2195097A8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/CollKeyPointToDescriptor.cpp", 368, "set_count <= max_num_sets", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195097E0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/CollKeyPointToDescriptor.cpp", 359, "set_count <= max_num_sets", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509818()
{
}

void (***sub_219509850(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    uint8_t v5 = *v4;
    v4 += 18;
    (*v5)();
    v3 += 18;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

void (***sub_2195098B4(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    uint8_t v5 = *v4;
    v4 += 18;
    (*v5)();
    v3 += 18;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

void sub_219509918()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/GaussianPyramidGeneratorUtils.cpp", 39, "v <= 65280 && \"overflow detected resulting in invalid result\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509950()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KPAndDescriptorGeneratorInterface.cpp", 98, "image_processing_height >= 160 && \"illegal input image size\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509988()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KPAndDescriptorGeneratorInterface.cpp", 97, "image_processing_width >= 160 && \"illegal input image size\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_2195099C0()
{
}

void sub_2195099F8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KPValidatorAndRefiner.cpp", 57, "score == res_map_cube[1][1][1] && \"score mismatch\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509A30()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KPValidatorAndRefiner.cpp", 133, "scale == kp_scale && \"scale mismatch\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509A68()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KPValidatorAndRefinerUtils.cpp", 49, "i2 < (1 << 30) && i2 >= -(1 << 30) && \"It is expected that a12*a21 is s31\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509AA0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KPValidatorAndRefinerUtils.cpp", 48, "i1 < (1 << 30) && i1 >= -(1 << 30) && \"It is expected that a11*a22 is s31\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509AD8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGenerator.cpp", 521, "stripes_config.pared_block_size[octave].X >= 2 && stripes_config.pared_block_size[octave].X <= octave_width", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509B10()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGenerator.cpp", 523, "stripes_config.pared_block_size[octave].Y >= 2 && stripes_config.pared_block_size[octave].Y <= kMaxGridY[octave]", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509B48()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGenerator.cpp", 526, "stripes_config.pared_num_blocks[octave].X > 0 && stripes_config.pared_num_blocks[octave].X <= kMaxNumParedGridX[octave]", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509B80()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGenerator.cpp", 531, "stripes_config.pared_block_size[octave].X * stripes_config.pared_num_blocks[octave].X >= octave_width", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509BB8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGenerator.cpp", 537, "stripes_config.pared_block_size[octave].Y * stripes_config.pared_num_blocks[octave].Y >= octave_height", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509BF0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGenerator.cpp", 542, "stripes_config.pared_grid_num_out[octave] >= 0 && stripes_config.pared_grid_num_out[octave] <= 3", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509C28()
{
}

void sub_219509C60()
{
}

void sub_219509C98()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGenerator.cpp", 528, "stripes_config.pared_num_blocks[octave].Y > 0 && stripes_config.pared_num_blocks[octave].Y <= kMaxNumParedGridY", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509CD0()
{
}

void sub_219509D08()
{
}

void sub_219509D40()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGeneratorUtils.cpp", 73, "num_scales_minus2 <= kMaxNumOfScalesMinus2 && \"Number of scales minus 2 should be less than or equal to max expected\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509D78()
{
}

void sub_219509DB0()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGeneratorUtils.cpp", 137, "laplacian_threshold[k] >= min_score", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509DE8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGeneratorUtils.cpp", 132, "num_scales_minus2 <= kMaxNumOfScalesMinus2 && \"Number of scales minus 2 should be less than or equal to max expected\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509E20()
{
}

void sub_219509E58()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGeneratorUtils.cpp", 147, "height >= 160 && height <= 8192 && \"Unsupported height, supported range is [160, 8192]\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509E90()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGeneratorUtils.cpp", 145, "width >= 160 && width <= 4096 && \"Unsupported width, supported range is [160, 4096]\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509EC8()
{
}

void sub_219509F00()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGeneratorUtils.cpp", 159, "input_dimension <= 8192 && \"Max input dimension allowed is 8192\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509F38()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGeneratorUtils.cpp", 181, "num_stripes <= kMaxNumStripes && \"Invalid stripe setting\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509F70()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorGeneratorUtils.cpp", 233, "config.num_stripes == 1 && \"num_stripes shall be 1 for VGA\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_219509FA8(void **a1, void **a2, void *a3, void **a4)
{
  char v7 = *a1;
  if (v7)
  {
    a3[63] = v7;
    operator delete(v7);
  }
  BOOL v8 = *a2;
  if (*a2)
  {
    a3[60] = v8;
    operator delete(v8);
  }
  uint64_t v9 = (void *)a3[56];
  if (v9)
  {
    a3[57] = v9;
    operator delete(v9);
  }
  CFAllocatorRef v10 = (void *)a3[53];
  if (v10)
  {
    a3[54] = v10;
    operator delete(v10);
  }
  CFTypeRef v11 = (void *)a3[50];
  if (v11)
  {
    a3[51] = v11;
    operator delete(v11);
  }
  CFNumberRef v12 = (void *)a3[47];
  if (v12)
  {
    a3[48] = v12;
    operator delete(v12);
  }
  CFNumberRef v13 = (void *)a3[44];
  if (v13)
  {
    a3[45] = v13;
    operator delete(v13);
  }
  CFNumberRef v14 = (void *)a3[41];
  if (v14)
  {
    a3[42] = v14;
    operator delete(v14);
  }
  uint64_t v15 = (void *)a3[38];
  if (v15)
  {
    a3[39] = v15;
    operator delete(v15);
  }
  CFNumberRef v16 = (void *)a3[35];
  if (v16)
  {
    a3[36] = v16;
    operator delete(v16);
  }
  CFNumberRef v17 = (void *)a3[32];
  if (v17)
  {
    a3[33] = v17;
    operator delete(v17);
  }
  CFNumberRef v18 = (void *)a3[29];
  if (v18)
  {
    a3[30] = v18;
    operator delete(v18);
  }
  CFNumberRef v19 = (void *)a3[26];
  if (v19)
  {
    a3[27] = v19;
    operator delete(v19);
  }
  CFNumberRef v20 = (void *)a3[23];
  if (v20)
  {
    a3[24] = v20;
    operator delete(v20);
  }
  CFNumberRef v21 = (void *)a3[20];
  if (v21)
  {
    a3[21] = v21;
    operator delete(v21);
  }
  BOOL v22 = (void *)a3[17];
  if (v22)
  {
    a3[18] = v22;
    operator delete(v22);
  }
  uint64_t v23 = (void *)a3[14];
  if (v23)
  {
    a3[15] = v23;
    operator delete(v23);
  }
  int64x2_t v24 = *a4;
  if (*a4)
  {
    a3[12] = v24;
    operator delete(v24);
  }
}

void sub_21950A114()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorMatcher.cpp", 142, "bin_i == bin && \"bin mismatch\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950A14C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorMatcher.cpp", 416, "MB1.desc_index >= 0 && MB1.desc_index < 4096 && \"DesMatch: Invalid index  \"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950A184()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointAndDescriptorMatcher.cpp", 285, "hamming_distance <= 471", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950A1BC()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/include_private/VIO/Hardware/KeyPointAndDescriptorMatcherUtils.h", 69, "bin_i == bin && \"bin mismatch\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950A1F4()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointDescriptorStore.cpp", 82, "final_num_keypoints <= max_valid_idx", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950A22C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointDescriptorStore.cpp", 87, "id <= max_valid_idx", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950A264()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointToDescriptor.cpp", 259, "features.Size() == (minima_cnt + maxima_cnt)", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950A29C()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/Hardware/src/KeyPointToDescriptor.cpp", 225, "orientation >= 0 && orientation < 256 && \"orientation overflow\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void (***sub_21950A2D4(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    uint8_t v5 = *v4;
    v4 += 18;
    (*v5)();
    v3 += 18;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

void sub_21950A338(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 96);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 80);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_21950A400(std::__shared_weak_count *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
}

void sub_21950A478()
{
}

void sub_21950A4B0()
{
}

void sub_21950A4E8()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/AppleUtil/src/CvPixelBufferUtils.cpp", 187, "pbType == kCVPixelFormatType_32BGRA || pbType == kCVPixelFormatType_444YpCbCr8BiPlanarFullRange", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950A520()
{
}

void sub_21950A558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950A594()
{
  sub_2194FF760("/Library/Caches/com.apple.xbs/Sources/AppleCVHWA/library/VIO/VisionHWAccelerationServicesUtils/src/VisionHWAServicesXPCUtils.cpp", 65, "(conn_info->conn == nullptr) && \"Cannot create new XPC connection -- old connection is non-NULL\"", (void (*)(void *))sub_2194FF9C0);
  abort();
}

void sub_21950A5CC(int a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  os_log_t v1 = off_2643A5A38[a1];
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAClient: Error %s received from daemon", (uint8_t *)&v2, 0xCu);
}

void sub_21950A658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950A694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950A6D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950A70C(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  int v2 = 136315138;
  uint64_t v3 = string;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ReplyChecker XPC error: %s", (uint8_t *)&v2, 0xCu);
}

void sub_21950A79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950A7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950A814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950A850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950A88C()
{
  sub_2194F61C4(*MEMORY[0x263EF8340]);
  v1[0] = 136315650;
  sub_2194F61DC();
  __int16 v2 = 1024;
  int v3 = v0;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s %s, error %d", (uint8_t *)v1, 0x1Cu);
}

void sub_21950A920()
{
  sub_2194F61C4(*MEMORY[0x263EF8340]);
  v0[0] = 136315394;
  sub_2194F61DC();
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s %s: file does not exist.", (uint8_t *)v0, 0x16u);
}

void sub_21950A9A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950A9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950AA20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950AA5C(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_219476000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAClient: Invalid Buffer list size %d", (uint8_t *)v1, 8u);
}

void sub_21950AADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950AB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950AB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950AB90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950ABCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950AC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950AC44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950AC80(void **a1, char *a2, void **a3)
{
  uint8_t v5 = (char *)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      BOOL v8 = (std::__shared_weak_count *)*((void *)v5 - 1);
      if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
      v5 -= 16;
    }
    while (v5 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

void sub_21950AD34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7 = sub_2194FF748(a1);
  if (!v8)
  {
    uint64_t v9 = (std::__shared_weak_count *)v7;
    (*(void (**)(uint64_t))(*(void *)v7 + 16))(v7);
    std::__shared_weak_count::__release_weak(v9);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
}

void sub_21950ADA4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21949D940();
  sub_2195012D4(&dword_219476000, &_os_log_internal, v0, "Unable to unregister the device notification callback. Status returned: %d", v1);
}

void sub_21950AE18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950AE54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21950AE90()
{
  sub_21949D940();
  sub_2195012B8(&dword_219476000, &_os_log_internal, v0, "HxISPDevice unable to create a device (error code 0x%08x)", v1, v2, v3, v4, v5);
}

void sub_21950AF00(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_2195012D4(&dword_219476000, &_os_log_internal, (uint64_t)a3, "HxISPDevice createDevice() timed out -- %d retries remaining.", a1);
}

uint64_t sub_21950AF44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 32))();
}

uint64_t sub_21950AF68(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 40))();
  }
  return result;
}

void sub_21950AF94()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21949D940();
  sub_2195012D4(&dword_219476000, &_os_log_internal, v0, "Error: Failed to successfully invalidate session %d", v1);
}

void sub_21950B008()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21949D940();
  sub_2195012D4(&dword_219476000, &_os_log_internal, v0, "Failed to successfully complete outstanding requests %d", v1);
}

void sub_21950B07C()
{
  sub_21949D940();
  sub_2195012B8(&dword_219476000, &_os_log_internal, v0, "ISP driver reported error %d for processing buffer.", v1, v2, v3, v4, v5);
}

void sub_21950B0EC()
{
  sub_21949D940();
  sub_2195012B8(&dword_219476000, &_os_log_internal, v0, "ISP driver reported error %d for processing buffer. Max number of retries reached.", v1, v2, v3, v4, v5);
}

void sub_21950B15C(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_2195012D4(&dword_219476000, &_os_log_internal, (uint64_t)a3, "ISP temporarily unavailable -- retrying. Driver reported code %d.", a1);
}

void sub_21950B1A0()
{
  sub_21949D940();
  sub_2195012B8(&dword_219476000, &_os_log_internal, v0, "CompleteBuffers failed with error code %d", v1, v2, v3, v4, v5);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x270EE79D0]();
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x270EE7B80]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x270EE7B88]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x270EE7BA0]();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA168](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t FigCaptureDeviceGetFigBaseObject()
{
  return MEMORY[0x270F12C50]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x270EF4C38](aSurface);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98238](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

{
  return MEMORY[0x270F988C8]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983D0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987D8]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98910]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__canonical(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *a2, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x270F98A40](retstr, a2, __ec);
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
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x270F98C30](__t);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
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
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

void std::exception::~exception(std::exception *this)
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

void operator delete(void *__p, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator delete(void *__p, std::align_val_t a2)
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

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

float exp2f(float a1)
{
  MEMORY[0x270ED9868](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x270EDA028](*(void *)&__e, __x);
  return result;
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x270EDEF18](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}