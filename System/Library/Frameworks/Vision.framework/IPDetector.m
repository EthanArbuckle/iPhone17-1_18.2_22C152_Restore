@interface IPDetector
@end

@implementation IPDetector

uint64_t __IPDetector_response_block_invoke(uint64_t result, int a2, int a3)
{
  if (a3 >= 1)
  {
    int v3 = 0;
    uint64_t v4 = *(void *)(result + 48) * a2;
    uint64_t v5 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) + 2 * v4;
    v6 = (unsigned __int8 *)(*(void *)(result + 40) + v4);
    int v7 = *(_DWORD *)(result + 64);
    do
    {
      uint64_t v9 = *(int *)(result + 56);
      uint64_t v8 = *(int *)(result + 60);
      if (v7 < 1)
      {
        v22 = v6 - 3;
        v23 = v6 + 3;
        v24 = &v6[-v9];
        v25 = &v6[v9];
        v26 = &v6[v8 - 2];
        v27 = &v6[v8 + 2];
        v30 = &v6[-v8];
        v29 = &v6[-v8 + 2];
        v28 = v30 - 2;
        v12 = (int16x8_t *)v5;
        v11 = v6;
      }
      else
      {
        int v10 = 0;
        v11 = v6;
        v12 = (int16x8_t *)v5;
        do
        {
          int8x16_t v13 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v11);
          int16x4_t v14 = (int16x4_t)vextq_s8(v13, v13, 8uLL).u64[0];
          *(int16x4_t *)v13.i8 = vadd_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v13.i8);
          int8x16_t v15 = (int8x16_t)vaddl_u8(*(uint8x8_t *)(v11 + 3), *(uint8x8_t *)(v11 - 3));
          int16x4_t v16 = vsub_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v15.i8);
          int8x16_t v17 = (int8x16_t)vaddl_u8(*(uint8x8_t *)&v11[v9], *(uint8x8_t *)&v11[-v9]);
          *(int16x4_t *)v13.i8 = vsub_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v17.i8);
          int32x4_t v18 = vmull_s16(v16, *(int16x4_t *)v13.i8);
          *(int16x4_t *)v13.i8 = vshr_n_s16(vadd_s16(*(int16x4_t *)v13.i8, v16), 4uLL);
          int16x8_t v19 = vsubq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)&v11[-v8 + 2], *(uint8x8_t *)&v11[v8 - 2]), (int16x8_t)vaddl_u8(*(uint8x8_t *)&v11[v8 + 2], *(uint8x8_t *)&v11[-v8 - 2]));
          int32x4_t v20 = vmlsl_s16(vmlsl_s16(v18, *(int16x4_t *)v13.i8, *(int16x4_t *)v13.i8), *(int16x4_t *)v19.i8, *(int16x4_t *)v19.i8);
          *(int16x4_t *)v13.i8 = vadd_s16(v14, v14);
          *(int16x4_t *)v15.i8 = vsub_s16(*(int16x4_t *)v13.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
          *(int16x4_t *)v13.i8 = vsub_s16(*(int16x4_t *)v13.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL));
          *(int16x4_t *)v17.i8 = vshrn_n_s32(v20, 9uLL);
          int32x4_t v21 = vmull_s16(*(int16x4_t *)v15.i8, *(int16x4_t *)v13.i8);
          *(int16x4_t *)v13.i8 = vshr_n_s16(vadd_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v15.i8), 4uLL);
          v11 += 8;
          *v12++ = vshrn_high_n_s32(*(int16x4_t *)v17.i8, vmlsl_high_s16(vmlsl_s16(v21, *(int16x4_t *)v13.i8, *(int16x4_t *)v13.i8), v19, v19), 9uLL);
          ++v10;
          int v7 = *(_DWORD *)(result + 64);
        }
        while (v10 < v7);
        v22 = v11 - 3;
        v23 = v11 + 3;
        v24 = &v11[-v9];
        v25 = &v11[v9];
        v26 = &v11[v8 - 2];
        v27 = &v11[v8 + 2];
        v28 = &v11[-v8 - 2];
        v29 = &v11[-v8 + 2];
      }
      int v31 = *(_DWORD *)(result + 68);
      if (v31 >= 1)
      {
        do
        {
          int v32 = *v11++;
          int v33 = 2 * v32;
          int v35 = *v22++;
          int v34 = v35;
          int v36 = *v23++;
          int v37 = v33 - (v34 + v36);
          int v39 = *v24++;
          int v38 = v39;
          int v40 = *v25++;
          int v41 = v33 - (v38 + v40);
          int v42 = v41 * v37;
          int v43 = (v41 + v37) >> 4;
          int v45 = *v26++;
          int v44 = v45;
          int v46 = *v27++;
          int v47 = v44 - v46;
          int v49 = *v29++;
          int v48 = v49;
          int v50 = *v28++;
          v12->i16[0] = (v42 - (v47 - v50 + v48) * (v47 - v50 + v48) - v43 * v43) >> 9;
          v12 = (int16x8_t *)((char *)v12 + 2);
          --v31;
        }
        while (v31);
      }
      uint64_t v51 = *(void *)(result + 48);
      v6 += v51;
      v5 += 2 * v51;
      ++v3;
    }
    while (v3 != a3);
  }
  return result;
}

uint64_t __IPDetector_response_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

uint64_t __IPDetector_response_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), (*(_DWORD *)(a1 + 40) - *(_DWORD *)(a1 + 48)));
}

uint64_t __IPDetector_cornerDetect_block_invoke(uint64_t result, int a2, int a3)
{
  int v3 = a2 + a3 - 1;
  if (a2 + 1 < v3)
  {
    uint64_t v5 = *(void *)(result + 40);
    uint64_t v4 = *(void *)(result + 48);
    v6 = *(void **)(result + 32);
    uint64_t v7 = v6[4];
    uint64_t v8 = a2;
    uint64_t v9 = v5 + a2;
    uint64_t v10 = v6[8];
    int v11 = *(_DWORD *)(result + 56);
    uint64_t v12 = v8 + 1;
    uint64_t v13 = v4 * (2 * v9 + 4) + 2 * v5 + v7 + 2;
    uint64_t v14 = 2 * v4;
    uint64_t v15 = v4 * (2 * v9 + 2) + 2 * v5 + v7 + 4;
    result = 2 * v4 * v9 + 2 * v5 + v7 + 4;
    do
    {
      if (v11 >= 3)
      {
        int v16 = 20 * *(unsigned __int16 *)(v10 + 2 * v12);
        uint64_t v17 = 2;
        uint64_t v18 = 1;
        do
        {
          uint64_t v19 = v15 + v17;
          int v20 = *(__int16 *)(v15 + v17 - 4);
          if (v20 >= 1 && v20 >= *(__int16 *)(v19 - 6) && v20 >= *(__int16 *)(v19 - 2))
          {
            uint64_t v21 = result + v17;
            if (v20 >= *(__int16 *)(result + v17 - 4))
            {
              v22 = (__int16 *)(v13 + v17);
              if (v20 >= *(__int16 *)(v13 + v17 - 2)
                && v20 >= *(__int16 *)(v21 - 6)
                && v20 >= *(__int16 *)(v21 - 2)
                && v20 >= *(v22 - 2)
                && v20 >= *v22)
              {
                uint64_t v23 = v6[6];
                unsigned int v24 = v16 + *(unsigned __int16 *)(v6[7] + v17);
                uint64_t v25 = v23 + 6 * v24;
                unsigned int v27 = *(unsigned __int16 *)(v25 + 4);
                v26 = (_WORD *)(v25 + 4);
                if (v27 < (unsigned __int16)v20)
                {
                  _WORD *v26 = v20;
                  v28 = (_WORD *)(v23 + 6 * v24);
                  _WORD *v28 = v18 + v5;
                  v28[1] = v12 + v5;
                }
              }
            }
          }
          ++v18;
          v17 += 2;
        }
        while (v11 - 1 != v18);
      }
      ++v12;
      v13 += v14;
      v15 += v14;
      result += v14;
    }
    while (v3 != v12);
  }
  return result;
}

uint64_t __IPDetector_cornerDetect_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

uint64_t __IPDetector_cornerDetect_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), (*(_DWORD *)(a1 + 40) - *(_DWORD *)(a1 + 48)));
}

@end