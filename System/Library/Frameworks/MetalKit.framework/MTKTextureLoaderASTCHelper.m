@interface MTKTextureLoaderASTCHelper
+ (int64_t)isASTCHDRData:(id)a3 is3DBlocks:(BOOL)a4 error:(id *)a5;
@end

@implementation MTKTextureLoaderASTCHelper

+ (int64_t)isASTCHDRData:(id)a3 is3DBlocks:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__MTKTextureLoaderASTCHelper_isASTCHDRData_is3DBlocks_error___block_invoke;
  v11[3] = &unk_264255358;
  v11[4] = &v13;
  BOOL v12 = a4;
  [v7 enumerateByteRangesUsingBlock:v11];
  v8 = v14;
  if (a5 && v14[3] == -1)
  {
    _newMTKTextureErrorWithCodeAndErrorString(-1, @"Could not load ASTC texture, data is malformed");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v14;
  }
  int64_t v9 = v8[3];
  _Block_object_dispose(&v13, 8);

  return v9;
}

unint64_t __61__MTKTextureLoaderASTCHelper_isASTCHDRData_is3DBlocks_error___block_invoke(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unsigned char *a5)
{
  unint64_t v6 = result;
  uint64_t v52 = *MEMORY[0x263EF8340];
  if ((a4 & 0xF) == 0)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -1;
    *a5 = 1;
  }
  if (a4 < 0x10) {
    return result;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 16;
  uint64_t v43 = a2;
  unint64_t v44 = a4;
  while (1)
  {
    long long v9 = *(_OWORD *)(a2 + v7);
    uint64_t v7 = v8;
    long long v51 = v9;
    unsigned int v10 = v9 | ((BYTE1(v9) & 7) << 8);
    int v11 = v9 | ((BYTE1(v9) & 7) << 8) & 0x1FF;
    BOOL v12 = v11 == 508;
    if (v11 == 508)
    {
      if ((BYTE1(v9) & 2) != 0) {
        goto LABEL_63;
      }
      goto LABEL_60;
    }
    unint64_t v13 = ((unint64_t)BYTE1(v9) >> 3) & 3;
    if (v13) {
      break;
    }
    unsigned int v26 = ((BYTE1(v9) | (BYTE2(v51) << 8)) >> 5) & 0xF;
LABEL_15:
    unsigned int v27 = v26 - 2;
    if (v27 < 0xE && ((0x3223u >> v27) & 1) != 0)
    {
LABEL_63:
      uint64_t v36 = 1;
      goto LABEL_64;
    }
LABEL_60:
    if (!*a5)
    {
      uint64_t v8 = v7 + 16;
      if (v7 + 16 <= a4) {
        continue;
      }
    }
    return result;
  }
  unsigned int v14 = BYTE3(v51);
  result = ((BYTE2(v51) | (BYTE3(v51) << 8)) >> 7) & 3;
  if (!result)
  {
    unsigned int v26 = (BYTE3(v51) >> 1) & 0xF;
    goto LABEL_15;
  }
  unsigned int v15 = (BYTE1(v9) & 7) << 8;
  unsigned int v16 = v15 >> 9;
  int v17 = (v15 >> 9) & 1;
  unsigned int v18 = v15 >> 10;
  int v19 = v9 & 3;
  int v20 = (v9 >> 5) & 3;
  char v45 = ((BYTE2(v51) | (BYTE3(v51) << 8)) >> 7) & 3;
  if (*(unsigned char *)(v6 + 40))
  {
    int v21 = (v9 >> 2) & 3;
    if ((v9 & 3) != 0)
    {
      int v22 = (v10 >> 7) & 3;
      int v23 = v20 + 2;
      int v24 = v22 + 2;
      int v25 = v21 + 2;
    }
    else
    {
      if (!v21) {
        goto LABEL_66;
      }
      if (!v12)
      {
        int v17 = 0;
        unsigned int v18 = 0;
      }
      switch((v10 >> 7) & 3)
      {
        case 0u:
          int v24 = v16 + 2;
          int v25 = v20 + 2;
          int v23 = 6;
          goto LABEL_37;
        case 1u:
          int v23 = v20 + 2;
          int v25 = v16 + 2;
          int v24 = 6;
          goto LABEL_37;
        case 2u:
          int v23 = v20 + 2;
          int v24 = v16 + 2;
          int v25 = 6;
LABEL_37:
          int v19 = (v9 >> 2) & 3;
          break;
        case 3u:
          if (v20 == 3) {
            goto LABEL_66;
          }
          int v24 = 2;
          int v23 = 6;
          int v19 = (v9 >> 2) & 3;
          int v25 = 2;
          break;
        default:
          JUMPOUT(0);
      }
    }
    unint64_t v33 = (v23 + v23 * v18) * v24 * v25;
    int v34 = 8;
    goto LABEL_46;
  }
  if ((v9 & 3) != 0)
  {
    int v28 = (v10 >> 7) & 3;
    switch((v9 >> 2) & 3)
    {
      case 1:
        int v29 = v28 | 8;
        goto LABEL_30;
      case 2:
        int v29 = v20 + 2;
        int v30 = v28 | 8;
        break;
      case 3:
        int v31 = (v10 >> 7) & 1;
        int v30 = v20 + 2;
        int v32 = v31 | 6;
        int v29 = v31 | 2;
        if ((BYTE1(v9) & 1) == 0)
        {
          int v29 = v30;
          int v30 = v32;
        }
        break;
      default:
        int v29 = v28 | 4;
LABEL_30:
        int v30 = v20 + 2;
        break;
    }
LABEL_45:
    unint64_t v33 = (v29 + v29 * v18) * v30;
    int v34 = 4;
LABEL_46:
    result = ComputeSequenceLengthInBits(v33, ((v9 >> 4) | 0xFFFFFFFE) + 2 * v19 + 6 * v17);
    uint64_t v36 = -1;
    if ((int)result < v34 || (int)result > 105) {
      goto LABEL_64;
    }
    if (v13 == 3)
    {
      v35.i64[0] = *(void *)&vshl_u16((uint16x4_t)vdup_n_s16(v14), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
      unsigned __int32 v46 = vmovn_s16(v35).u32[0];
      __int16 v47 = (*(unsigned __int16 *)((char *)&v51 + ((120 - (int)result) >> 3)) >> ((120 - result) & 7)) & 3;
      __int16 v48 = (*(unsigned __int16 *)((char *)&v51 + ((122 - (int)result) >> 3)) >> ((122 - result) & 7)) & 3;
      __int16 v49 = (*(unsigned __int16 *)((char *)&v51 + ((124 - (int)result) >> 3)) >> ((124 - result) & 7)) & 3;
      v37 = &v50;
      a2 = v43;
      a4 = v44;
    }
    else
    {
      a2 = v43;
      a4 = v44;
      LOBYTE(v46) = (v14 & 2) != 0;
      BYTE1(v46) = (v14 & 4) != 0;
      if (v13 == 2)
      {
        BYTE2(v46) = (v14 & 8) != 0;
        __int16 v47 = (v14 >> 4) & 1 | (2
                              * ((*(unsigned __int16 *)((char *)&v51 + ((123 - (int)result) >> 3)) >> ((123 - result) & 7)) & 1));
        __int16 v48 = (*(unsigned __int16 *)((char *)&v51 + ((124 - (int)result) >> 3)) >> ((124 - result) & 7)) & 3;
        v37 = &v49;
      }
      else
      {
        __int16 v47 = (v14 >> 3) & 3;
        v37 = &v48;
      }
    }
    uint64_t v38 = 0;
    __int16 *v37 = (*(unsigned __int16 *)((char *)&v51 + ((126 - (int)result) >> 3)) >> ((126 - result) & 7)) & 3;
    do
    {
      unsigned int v39 = (*(&v47 + v38) + 4 * (v45 + 63 + *((unsigned char *)&v46 + v38)));
      BOOL v40 = v39 > 0xF;
      int v41 = (1 << v39) & 0xC88C;
      if (!v40 && v41 != 0)
      {
        *(void *)(*(void *)(*(void *)(v6 + 32) + 8) + 24) = 1;
        *a5 = 1;
      }
      ++v38;
    }
    while (v13 + 1 != v38);
    goto LABEL_60;
  }
  int v19 = (v9 >> 2) & 3;
  if (v19)
  {
    switch((v10 >> 7) & 3)
    {
      case 1u:
        int v29 = v20 + 2;
        int v30 = 12;
        goto LABEL_45;
      case 2u:
        int v17 = 0;
        unsigned int v18 = 0;
        int v29 = v20 + 6;
        int v30 = v16 + 6;
        goto LABEL_45;
      case 3u:
        if ((v9 & 0x40) != 0) {
          goto LABEL_66;
        }
        int v30 = 10;
        int v29 = 6;
        break;
      default:
        int v30 = v20 + 2;
        int v29 = 12;
        goto LABEL_45;
    }
    goto LABEL_45;
  }
LABEL_66:
  uint64_t v36 = -1;
LABEL_64:
  *(void *)(*(void *)(*(void *)(v6 + 32) + 8) + 24) = v36;
  *a5 = 1;
  return result;
}

void __61__MTKTextureLoaderASTCHelper_isASTCHDRData_is3DBlocks_error___block_invoke_cold_1()
{
}

@end