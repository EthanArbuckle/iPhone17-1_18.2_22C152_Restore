@interface Projections
@end

@implementation Projections

void __Projections_projectionRows_planar8UtoF_block_invoke()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  STACK[0xFF38] = *MEMORY[0x1E4F143B8];
  v1 = *(uint64_t **)(v0 + 32);
  uint64_t v2 = *((int *)v1 + 6);
  uint64_t v3 = v1[2];
  _X20 = *v1;
  __asm
  {
    PRFM            #0, [X20]
    PRFM            #0x10, [SP,#0x50+var_30]
  }
  vDSP_Length v11 = *((int *)v1 + 2);
  __memcpy_chk();
  int64_t v12 = v11 - 16;
  if ((int)v11 < 17)
  {
    LODWORD(v13) = 0;
  }
  else
  {
    unint64_t v13 = 0;
    v14 = (uint32x4_t *)&STACK[0x3320];
    do
    {
      uint8x16_t v15 = *(uint8x16_t *)((char *)&v41 + v13);
      uint16x8_t v16 = vmovl_u8(*(uint8x8_t *)v15.i8);
      uint16x8_t v17 = vmovl_high_u8(v15);
      uint32x4_t *v14 = vmovl_u16(*(uint16x4_t *)v16.i8);
      v14[1] = vmovl_high_u16(v16);
      v14[2] = vmovl_u16(*(uint16x4_t *)v17.i8);
      v14[3] = vmovl_high_u16(v17);
      v13 += 16;
      v14 += 4;
    }
    while (v13 < v12);
  }
  if ((int)v13 < (int)v11)
  {
    unint64_t v18 = v11 - (unint64_t)v13;
    v19 = (_DWORD *)&STACK[0x3320] + v13;
    v20 = (unsigned __int8 *)&v41 + v13;
    do
    {
      int v21 = *v20++;
      *v19++ = v21;
      --v18;
    }
    while (v18);
  }
  int v22 = *((_DWORD *)v1 + 3);
  if ((int)v2 < v22)
  {
    uint64_t v23 = v3 * v2;
    int v24 = v2;
    do
    {
      _X20 += v23;
      __asm
      {
        PRFM            #0, [X20]
        PRFM            #0x10, [SP,#0x50+var_30]
      }
      __memcpy_chk();
      if ((int)v11 < 17)
      {
        uint64_t v36 = 0;
      }
      else
      {
        int64_t v27 = 0;
        v28 = (uint32x4_t *)&STACK[0x3320];
        do
        {
          uint8x16_t v29 = *(uint8x16_t *)((char *)&v41 + v27);
          uint16x8_t v30 = vmovl_u8(*(uint8x8_t *)v29.i8);
          uint32x4_t v31 = vaddw_u16(*v28, *(uint16x4_t *)v30.i8);
          uint32x4_t v32 = vaddw_high_u16(v28[1], v30);
          uint16x8_t v33 = vmovl_high_u8(v29);
          uint32x4_t *v28 = v31;
          v28[1] = v32;
          uint32x4_t v34 = vaddw_u16(v28[2], *(uint16x4_t *)v33.i8);
          uint32x4_t v35 = vaddw_high_u16(v28[3], v33);
          v28[2] = v34;
          v28[3] = v35;
          v27 += 16;
          v28 += 4;
        }
        while (v27 < v12);
        uint64_t v36 = v27;
      }
      if ((int)v36 < (int)v11)
      {
        uint64_t v37 = v11 - v36;
        v38 = (_DWORD *)&STACK[0x3320] + v36;
        v39 = (unsigned __int8 *)&v41 + v36;
        do
        {
          int v40 = *v39++;
          *v38++ += v40;
          --v37;
        }
        while (v37);
      }
      v24 += v2;
    }
    while (v24 < v22);
  }
  vDSP_vflt32((const int *)&STACK[0x3320], 1, (float *)v1[4], 1, v11);
  *((_DWORD *)v1 + 10) = 0;
}

uint64_t __Projections_projectionCols_planar8UtoF_block_invoke()
{
  uint64_t result = MEMORY[0x1F4188790]();
  STACK[0x3308] = *MEMORY[0x1E4F143B8];
  v1 = *(uint64_t **)(result + 32);
  uint64_t v2 = *((unsigned int *)v1 + 3);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = 0;
    _X19 = *v1;
    uint64_t v5 = *((int *)v1 + 2);
    uint64_t v6 = v5 - 16;
    do
    {
      __asm
      {
        PRFM            #0, [X19]
        PRFM            #0x10, [SP,#0x60+var_60]
      }
      uint64_t result = __memcpy_chk();
      int v13 = *((_DWORD *)v1 + 6);
      switch(v13)
      {
        case 1:
          if ((int)v5 < 17)
          {
            LODWORD(v16) = 0;
            int32x4_t v18 = 0uLL;
          }
          else
          {
            uint64_t v17 = 0;
            int32x4_t v18 = 0uLL;
            do
            {
              int32x4_t v18 = vpadalq_s16(v18, (int16x8_t)vpaddlq_u8(*(uint8x16_t *)((char *)&v23 + v17)));
              v17 += 16;
            }
            while (v17 < v6);
            LODWORD(v16) = ((v5 - 17) & 0xFFFFFFF0) + 16;
          }
          int32x2_t v15 = (int32x2_t)vpaddq_s32(v18, v18).u64[0];
          break;
        case 2:
          if ((int)v5 < 17)
          {
            LODWORD(v16) = 0;
            int32x2_t v15 = 0;
          }
          else
          {
            uint64_t v19 = 0;
            int32x2_t v15 = 0;
            do
            {
              v20 = (char *)&v23 + v19;
              uint8x8_t v21 = (uint8x8_t)*(_OWORD *)vld2_s8(v20).val;
              int32x2_t v15 = vpadal_s16(v15, (int16x4_t)vpaddl_u8(v21));
              v19 += 16;
            }
            while (v19 < v6);
            LODWORD(v16) = ((v5 - 17) & 0xFFFFFFF0) + 16;
          }
          break;
        case 4:
          if ((int)v5 < 17)
          {
            LODWORD(v16) = 0;
            v15.i32[0] = 0;
          }
          else
          {
            uint64_t v14 = 0;
            int32x2_t v15 = 0;
            do
            {
              int32x2_t v15 = vpadal_s16(v15, (int16x4_t)vpaddl_u8((uint8x8_t)vqtbl1_s8(*(int8x16_t *)((char *)&v23 + v14), (int8x8_t)0xC0804000C080400)));
              v14 += 16;
            }
            while (v14 < v6);
            LODWORD(v16) = ((v5 - 17) & 0xFFFFFFF0) + 16;
          }
          goto LABEL_23;
        default:
          goto LABEL_27;
      }
      v15.i32[0] = vpadd_s32(v15, v15).u32[0];
LABEL_23:
      int v22 = v15.i32[0];
      if ((int)v16 < (int)v5)
      {
        uint64_t v16 = (int)v16;
        do
        {
          v22 += *((unsigned __int8 *)&v23 + v16);
          v16 += v13;
        }
        while (v16 < v5);
      }
      *(float *)(v1[4] + 4 * v3) = (float)v22;
      _X19 += v1[2];
      ++v3;
    }
    while (v3 != v2);
  }
LABEL_27:
  *((_DWORD *)v1 + 10) = 0;
  return result;
}

@end