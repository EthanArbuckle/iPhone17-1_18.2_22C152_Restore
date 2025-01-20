@interface C3DBezierCurveEnumerateCGPathCurveSegmentsOfType
@end

@implementation C3DBezierCurveEnumerateCGPathCurveSegmentsOfType

uint64_t ___C3DBezierCurveEnumerateCGPathCurveSegmentsOfType_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v6 = (void *)result;
  switch(*(_DWORD *)a2)
  {
    case 0:
      float32x2_t v7 = vcvt_f32_f64(*(float64x2_t *)*(void *)(a2 + 8));
      *(float32x2_t *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v7;
      ++*(_WORD *)(*(void *)(*(void *)(result + 48) + 8) + 24);
      *(float32x2_t *)(*(void *)(*(void *)(result + 56) + 8) + 24) = v7;
      *(_WORD *)(*(void *)(*(void *)(result + 64) + 8) + 24) = *(_WORD *)(*(void *)(*(void *)(result + 48)
                                                                                            + 8)
                                                                                + 24);
      return result;
    case 1:
      float32x2_t v8 = vcvt_f32_f64(*(float64x2_t *)*(void *)(a2 + 8));
      if (*(_DWORD *)(result + 72) == 1)
      {
        __int16 v28 = *(_WORD *)(*(void *)(*(void *)(result + 48) + 8) + 24);
        __int16 v29 = v28 + 1;
        uint64_t v9 = *(void *)(result + 32);
        uint64_t v24 = *(void *)(*(void *)(v6[5] + 8) + 24);
        float32x2_t v25 = v8;
        result = (*(uint64_t (**)(uint64_t, __int16 *))(v9 + 16))(v9, &v28);
      }
      *(float32x2_t *)(*(void *)(v6[5] + 8) + 24) = v8;
      goto LABEL_15;
    case 2:
      v10 = *(float64x2_t **)(a2 + 8);
      float32x2_t v11 = vcvt_f32_f64(v10[1]);
      if (*(_DWORD *)(result + 72) == 2)
      {
        float32x2_t v12 = vcvt_f32_f64(*v10);
        __int16 v28 = *(_WORD *)(*(void *)(*(void *)(result + 48) + 8) + 24);
        __int16 v29 = v28 + 1;
        __int16 v30 = v28 + 2;
        uint64_t v13 = *(void *)(result + 32);
        uint64_t v24 = *(void *)(*(void *)(v6[5] + 8) + 24);
        float32x2_t v25 = v12;
        float32x2_t v26 = v11;
        result = (*(uint64_t (**)(uint64_t, __int16 *, uint64_t *))(v13 + 16))(v13, &v28, &v24);
      }
      *(float32x2_t *)(*(void *)(v6[5] + 8) + 24) = v11;
      uint64_t v14 = *(void *)(v6[6] + 8);
      __int16 v15 = *(_WORD *)(v14 + 24) + 2;
      goto LABEL_16;
    case 3:
      v16 = *(float64x2_t **)(a2 + 8);
      float32x2_t v17 = vcvt_f32_f64(v16[2]);
      if (*(_DWORD *)(result + 72) == 3)
      {
        float32x2_t v18 = vcvt_f32_f64(v16[1]);
        float32x2_t v19 = vcvt_f32_f64(*v16);
        __int16 v28 = *(_WORD *)(*(void *)(*(void *)(result + 48) + 8) + 24);
        __int16 v29 = v28 + 1;
        __int16 v30 = v28 + 2;
        __int16 v31 = v28 + 3;
        uint64_t v20 = *(void *)(result + 32);
        uint64_t v24 = *(void *)(*(void *)(v6[5] + 8) + 24);
        float32x2_t v25 = v19;
        float32x2_t v26 = v18;
        float32x2_t v27 = v17;
        result = (*(uint64_t (**)(uint64_t, __int16 *, uint64_t *, uint64_t, uint64_t, uint64_t))(v20 + 16))(v20, &v28, &v24, a4, a5, a6);
      }
      *(float32x2_t *)(*(void *)(v6[5] + 8) + 24) = v17;
      uint64_t v14 = *(void *)(v6[6] + 8);
      __int16 v15 = *(_WORD *)(v14 + 24) + 3;
      goto LABEL_16;
    case 4:
      if (*(_DWORD *)(result + 72) == 1)
      {
        uint64_t v21 = *(void *)(result + 56);
        __int16 v28 = *(_WORD *)(*(void *)(*(void *)(result + 48) + 8) + 24);
        __int16 v29 = *(_WORD *)(*(void *)(*(void *)(result + 64) + 8) + 24);
        uint64_t v22 = *(void *)(result + 32);
        float32x2_t v23 = *(float32x2_t *)(*(void *)(v21 + 8) + 24);
        uint64_t v24 = *(void *)(*(void *)(v6[5] + 8) + 24);
        float32x2_t v25 = v23;
        result = (*(uint64_t (**)(uint64_t, __int16 *))(v22 + 16))(v22, &v28);
      }
      *(void *)(*(void *)(v6[5] + 8) + 24) = *(void *)(*(void *)(v6[7] + 8) + 24);
LABEL_15:
      uint64_t v14 = *(void *)(v6[6] + 8);
      __int16 v15 = *(_WORD *)(v14 + 24) + 1;
LABEL_16:
      *(_WORD *)(v14 + 24) = v15;
      break;
    default:
      return result;
  }
  return result;
}

@end