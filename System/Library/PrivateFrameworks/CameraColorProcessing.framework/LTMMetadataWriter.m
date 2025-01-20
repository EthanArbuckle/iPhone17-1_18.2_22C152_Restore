@interface LTMMetadataWriter
+ (id)createLTMMetadataFromLTMOutput:(sLtmComputeOutput *)a3 statistics:(sCLRProcHITHStat *)a4 driverInputMetadata:(sRefDriverInputs *)a5 geometryData:(id)a6;
+ (void)_addAverageLTMToMetadata:(id)a3 curvesType:(int)a4 fromOutput:(sLtmComputeOutput *)a5;
+ (void)_addGlobalLTMLookUpTableAlignedToFinalCropRect:(id)a3;
+ (void)_addHazeCorrection:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4;
+ (void)_addHighlightCompression:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4;
+ (void)_addLTMCurveTypeToMetadata:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4;
+ (void)_addLTMCurvesToMetadata:(id)a3 curvesType:(int)a4 fromOutput:(sLtmComputeOutput *)a5 statistics:(sCLRProcHITHStat *)a6 geometryData:(id)a7 isSIFR:(BOOL)a8;
+ (void)_addLTMEnabledToMetadata:(id)a3;
+ (void)_addLocalClippingDataToMetadata:(id)a3 statistics:(sCLRProcHITHStat *)a4 geometryData:(id)a5;
+ (void)_addLocalHistToMetadata:(id)a3 statistics:(sCLRProcHITHStat *)a4 geometryData:(id)a5;
+ (void)_addSoftDGainToMetadata:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4;
+ (void)_addSpatialCCMDataToMetadata:(id)a3 fromOutput:(sLtmComputeOutput *)a4 driverInputMetadata:(sRefDriverInputs *)a5;
+ (void)addLTMMetadataTo:(id)a3 curvesType:(int)a4 fromLTMOutput:(sLtmComputeOutput *)a5 statistics:(sCLRProcHITHStat *)a6 driverInputMetadata:(sRefDriverInputs *)a7 geometryData:(id)a8;
@end

@implementation LTMMetadataWriter

+ (id)createLTMMetadataFromLTMOutput:(sLtmComputeOutput *)a3 statistics:(sCLRProcHITHStat *)a4 driverInputMetadata:(sRefDriverInputs *)a5 geometryData:(id)a6
{
  id v10 = a6;
  v11 = objc_opt_new();
  if (v11)
  {
    [a1 _addLTMCurvesToMetadata:v11 curvesType:0 fromOutput:a3 statistics:a4 geometryData:v10 isSIFR:a5->isSIFRFrame];
    [a1 _addSoftDGainToMetadata:v11 driverInputMetadata:a5];
    [a1 _addLTMCurveTypeToMetadata:v11 driverInputMetadata:a5];
    [a1 _addLTMEnabledToMetadata:v11];
    [a1 _addLocalHistToMetadata:v11 statistics:a4 geometryData:v10];
    [a1 _addLocalClippingDataToMetadata:v11 statistics:a4 geometryData:v10];
    [a1 _addAverageLTMToMetadata:v11 curvesType:0 fromOutput:a3];
    [a1 _addSpatialCCMDataToMetadata:v11 fromOutput:a3 driverInputMetadata:a5];
    [a1 _addGlobalLTMLookUpTableAlignedToFinalCropRect:v11];
    [a1 _addHighlightCompression:v11 driverInputMetadata:a5];
    [a1 _addHazeCorrection:v11 driverInputMetadata:a5];
    id v12 = v11;
  }
  else
  {
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v11;
}

+ (void)addLTMMetadataTo:(id)a3 curvesType:(int)a4 fromLTMOutput:(sLtmComputeOutput *)a5 statistics:(sCLRProcHITHStat *)a6 driverInputMetadata:(sRefDriverInputs *)a7 geometryData:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  BOOL isSIFRFrame = a7->isSIFRFrame;
  id v14 = a3;
  [a1 _addLTMCurvesToMetadata:v14 curvesType:v11 fromOutput:a5 statistics:a6 geometryData:a8 isSIFR:isSIFRFrame];
  [a1 _addAverageLTMToMetadata:v14 curvesType:v11 fromOutput:a5];
}

+ (void)_addLTMCurvesToMetadata:(id)a3 curvesType:(int)a4 fromOutput:(sLtmComputeOutput *)a5 statistics:(sCLRProcHITHStat *)a6 geometryData:(id)a7 isSIFR:(BOOL)a8
{
  id v12 = a3;
  id v13 = a7;
  id v14 = (char *)malloc_type_malloc(0x1878uLL, 0x59BA2FA5uLL);
  if (v14 && (v15 = malloc_type_malloc(0x204uLL, 0xBCD4122FuLL)) != 0)
  {
    v16 = v15;
    v17 = malloc_type_malloc(0x204uLL, 0xA3C33102uLL);
    if (v17)
    {
      v18 = v17;
      _WORD *v16 = 257;
      _WORD *v17 = 257;
      globalLUT = a5->globalLUT;
      for (uint64_t i = 1; i != 258; ++i)
      {
        v16[i] = vcvtms_s32_f32(*globalLUT * 65535.0);
        v17[i] = vcvtms_s32_f32(globalLUT[257] * 65535.0);
        ++globalLUT;
      }
      HIWORD(v21) = 8;
      *(void *)id v14 = 0x410000600080004;
      *((_WORD *)v14 + 4) = 130;
      *(void *)(v14 + 10) = 0;
      LOWORD(v21) = a6->localHistStrideX;
      float v22 = (float)v21;
      [v13 inputTextureDownsampleRatio];
      *(float *)&unsigned int v24 = v23 * v22;
      *((_WORD *)v14 + 9) = (int)*(float *)&v24;
      LOWORD(v24) = a6->localHistStrideY;
      float v25 = (float)v24;
      [v13 inputTextureDownsampleRatio];
      *((_WORD *)v14 + 10) = (int)(float)(v26 * v25);
      *((_WORD *)v14 + 11) = 65;
      uint64_t v27 = -6240;
      float32x4_t v28 = (float32x4_t)vdupq_n_s32(0x477FFF00u);
      do
      {
        float32x4_t v29 = *(float32x4_t *)a5->LTC;
        a5 = (sLtmComputeOutput *)((char *)a5 + 16);
        *(int16x4_t *)&v14[v27 + 6264] = vmovn_s32((int32x4_t)vcvtq_u32_f32(vrndmq_f32(vmulq_f32(v29, v28))));
        v27 += 8;
      }
      while (v27);
      v30 = [MEMORY[0x263EFF990] dataWithBytes:v14 length:6264];
      v31 = [MEMORY[0x263EFF990] dataWithBytes:v16 length:516];
      v32 = [MEMORY[0x263EFF990] dataWithBytes:v18 length:516];
      if (a4 == 2)
      {
        [v12 setObject:v30 forKeyedSubscript:*MEMORY[0x263F2F0E0]];
        [v12 setObject:v31 forKeyedSubscript:*MEMORY[0x263F2F090]];
        v33 = (void *)MEMORY[0x263F2F0A0];
      }
      else if (a4 == 1)
      {
        [v12 setObject:v30 forKeyedSubscript:*MEMORY[0x263F2F0E8]];
        [v12 setObject:v31 forKeyedSubscript:*MEMORY[0x263F2F098]];
        v33 = (void *)MEMORY[0x263F2F0A8];
      }
      else
      {
        [v12 setObject:v30 forKeyedSubscript:*MEMORY[0x263F2F530]];
        [v12 setObject:v31 forKeyedSubscript:*MEMORY[0x263F2F4D8]];
        v33 = (void *)MEMORY[0x263F2F4E8];
      }
      [v12 setObject:v32 forKeyedSubscript:*v33];
    }
    else
    {
      v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v32 = 0;
      v31 = 0;
      v30 = 0;
      v18 = 0;
    }
  }
  else
  {
    v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v32 = 0;
    v31 = 0;
    v30 = 0;
    v18 = 0;
    v16 = 0;
  }
  free(v16);
  free(v18);
  free(v14);
}

+ (void)_addSoftDGainToMetadata:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4
{
  v5 = NSNumber;
  LODWORD(v4) = vcvts_n_u32_f32(a4->softIspDGain, 8uLL);
  id v6 = a3;
  id v7 = [v5 numberWithUnsignedInt:v4];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F2F6F8]];
}

+ (void)_addLTMCurveTypeToMetadata:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4
{
  uint64_t v4 = NSNumber;
  uint64_t ltmProcMode = a4->ltmProcMode;
  id v6 = a3;
  id v7 = [v4 numberWithInt:ltmProcMode];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F2F518]];
}

+ (void)_addAverageLTMToMetadata:(id)a3 curvesType:(int)a4 fromOutput:(sLtmComputeOutput *)a5
{
  id v16 = a3;
  id v7 = [MEMORY[0x263EFF980] arrayWithCapacity:65];
  for (uint64_t i = 0; i != 65; ++i)
  {
    uint64_t v9 = 0;
    unsigned int v10 = 0;
    uint64_t v11 = a5;
    do
    {
      for (uint64_t j = 0; j != 520; j += 65)
        unsigned int v10 = (float)(floorf(v11->LTC[j] * 65535.0) + (float)v10);
      ++v9;
      uint64_t v11 = (sLtmComputeOutput *)((char *)v11 + 2080);
    }
    while (v9 != 6);
    id v13 = [NSNumber numberWithUnsignedShort:(unsigned __int16)(v10 / 0x30)];
    [v7 setObject:v13 atIndexedSubscript:i];

    a5 = (sLtmComputeOutput *)((char *)a5 + 4);
  }
  id v14 = (void *)MEMORY[0x263F2EFA0];
  v15 = (void *)MEMORY[0x263F2EF98];
  if (a4 != 2) {
    v15 = (void *)MEMORY[0x263F2F380];
  }
  if (a4 != 1) {
    id v14 = v15;
  }
  [v16 setObject:v7 forKeyedSubscript:*v14];
}

+ (void)_addHighlightCompression:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4
{
  id v5 = a3;
  if (a4->useHighlightCompression)
  {
    id v9 = v5;
    id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:257];
    for (uint64_t i = 0; i != 257; ++i)
    {
      v8 = [NSNumber numberWithUnsignedShort:highlightCompressionDataScaled[i]];
      [v6 setObject:v8 atIndexedSubscript:i];
    }
    [v9 setObject:v6 forKeyedSubscript:*MEMORY[0x263F2F080]];

    id v5 = v9;
  }
}

+ (void)_addHazeCorrection:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4
{
  id v5 = a3;
  if (a4->useHazeCorrection)
  {
    id v10 = v5;
    id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    for (uint64_t i = 0; i != 3; ++i)
    {
      LODWORD(v7) = *((_DWORD *)&a4[1].HROn + (i & 3));
      id v9 = [NSNumber numberWithFloat:v7];
      [v6 setObject:v9 atIndexedSubscript:i];
    }
    [v10 setObject:v6 forKeyedSubscript:*MEMORY[0x263F2F0C0]];

    id v5 = v10;
  }
}

+ (void)_addLTMEnabledToMetadata:(id)a3
{
  v3 = NSNumber;
  id v4 = a3;
  id v5 = [v3 numberWithBool:1];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F2F520]];
}

+ (void)_addLocalHistToMetadata:(id)a3 statistics:(sCLRProcHITHStat *)a4 geometryData:(id)a5
{
  id v30 = a3;
  id v7 = a5;
  size_t v8 = a4->localHistStatSize + 32;
  id v9 = malloc_type_malloc(v8, 0xF959B967uLL);
  uint64_t v11 = v9;
  if (v9)
  {
    *id v9 = 1;
    v9[1] = v8;
    LODWORD(v10) = a4->gridOriginX;
    double v12 = (double)v10;
    [v7 deepZoomOrigin];
    double v14 = v13 + v12;
    [v7 inputTextureDownsampleRatio];
    *(double *)&unint64_t v16 = v14 * v15;
    *((_WORD *)v11 + 4) = (int)*(double *)&v16;
    LODWORD(v16) = a4->gridOriginY;
    double v17 = (double)v16;
    [v7 deepZoomOrigin];
    double v19 = v18 + v17;
    [v7 inputTextureDownsampleRatio];
    double v21 = v19 * v20;
    *((_WORD *)v11 + 5) = (int)v21;
    LOWORD(v21) = a4->localHistBlockSizeX;
    *(float *)&double v19 = (float)LODWORD(v21);
    [v7 inputTextureDownsampleRatio];
    *(float *)&unsigned int v23 = v22 * *(float *)&v19;
    *((_WORD *)v11 + 6) = (int)*(float *)&v23;
    LOWORD(v23) = a4->localHistBlockSizeY;
    *(float *)&double v19 = (float)v23;
    [v7 inputTextureDownsampleRatio];
    *(float *)&unsigned int v25 = v24 * *(float *)&v19;
    *((_WORD *)v11 + 7) = (int)*(float *)&v25;
    LOWORD(v25) = a4->localHistStrideX;
    *(float *)&double v19 = (float)v25;
    [v7 inputTextureDownsampleRatio];
    *(float *)&unsigned int v27 = v26 * *(float *)&v19;
    *((_WORD *)v11 + 8) = (int)*(float *)&v27;
    LOWORD(v27) = a4->localHistStrideY;
    *(float *)&double v19 = (float)v27;
    [v7 inputTextureDownsampleRatio];
    *((_WORD *)v11 + 9) = (int)(float)(v28 * *(float *)&v19);
    v11[5] = *(_DWORD *)&a4->localHistNumHorBlocks;
    *((_WORD *)v11 + 12) = a4->localHistBinSize;
    *((_WORD *)v11 + 13) = a4->localHistCountBitShift;
    v11[7] = a4->localHistogramOriginalTilePixelCount;
    memcpy(v11 + 8, a4->localHistStat, a4->localHistStatSize);
    float32x4_t v29 = [MEMORY[0x263EFF8F8] dataWithBytes:v11 length:v8];
    [v30 setObject:v29 forKeyedSubscript:*MEMORY[0x263F2F550]];
  }
  else
  {
    FigSignalErrorAt();
  }
  free(v11);
}

+ (void)_addLocalClippingDataToMetadata:(id)a3 statistics:(sCLRProcHITHStat *)a4 geometryData:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = malloc_type_malloc(0x1ACuLL, 0x8DB544A5uLL);
  unint64_t v10 = v9;
  if (v9)
  {
    HIDWORD(v11) = 428;
    *id v9 = 0x1AC00000001;
    LODWORD(v11) = a4->gridOriginX;
    double v12 = (double)v11;
    [v8 deepZoomOrigin];
    double v14 = v13 + v12;
    [v8 inputTextureDownsampleRatio];
    *(double *)&unint64_t v16 = v14 * v15;
    *((_WORD *)v10 + 4) = (int)*(double *)&v16;
    LODWORD(v16) = a4->gridOriginY;
    double v17 = (double)v16;
    [v8 deepZoomOrigin];
    double v19 = v18 + v17;
    [v8 inputTextureDownsampleRatio];
    double v21 = v19 * v20;
    *((_WORD *)v10 + 5) = (int)v21;
    LOWORD(v21) = a4->localHistBlockSizeX;
    *(float *)&double v19 = (float)LODWORD(v21);
    [v8 inputTextureDownsampleRatio];
    *(float *)&unsigned int v23 = v22 * *(float *)&v19;
    *((_WORD *)v10 + 6) = (int)*(float *)&v23;
    LOWORD(v23) = a4->localHistBlockSizeY;
    *(float *)&double v19 = (float)v23;
    [v8 inputTextureDownsampleRatio];
    *(float *)&unsigned int v25 = v24 * *(float *)&v19;
    *((_WORD *)v10 + 7) = (int)*(float *)&v25;
    LOWORD(v25) = a4->localHistStrideX;
    *(float *)&double v19 = (float)v25;
    [v8 inputTextureDownsampleRatio];
    *(float *)&unsigned int v27 = v26 * *(float *)&v19;
    *((_WORD *)v10 + 8) = (int)*(float *)&v27;
    LOWORD(v27) = a4->localHistStrideY;
    *(float *)&double v19 = (float)v27;
    [v8 inputTextureDownsampleRatio];
    uint64_t v28 = 0;
    *((_WORD *)v10 + 9) = (int)(float)(v29 * *(float *)&v19);
    *((_DWORD *)v10 + 5) = *(_DWORD *)&a4->localHistNumHorBlocks;
    *((_WORD *)v10 + 12) = a4->localHistCountBitShift;
    *((_DWORD *)v10 + 7) = a4->localHistogramOriginalTilePixelCount;
    *((_WORD *)v10 + 16) = a4->localHistLowThreshold;
    *((_WORD *)v10 + 17) = 0;
    *((_WORD *)v10 + 18) = a4->localHistHighThreshold;
    *(_DWORD *)((char *)v10 + 38) = 65539;
    *((_WORD *)v10 + 21) = 2;
    id v30 = (char *)a4->localHistStat + 134;
    uint64_t v31 = 44;
    do
    {
      uint64_t v32 = 0;
      v33 = (char *)v10 + v31;
      v34 = (__int16 *)v30;
      do
      {
        *(_WORD *)&v33[v32] = *(v34 - 67);
        v35 = &v33[v32];
        *((_WORD *)v35 + 1) = *(v34 - 66);
        *((_WORD *)v35 + 2) = *(v34 - 1);
        __int16 v36 = *v34;
        v34 += 68;
        *((_WORD *)v35 + 3) = v36;
        v32 += 8;
      }
      while (v32 != 64);
      ++v28;
      v30 += 1088;
      v31 += 64;
    }
    while (v28 != 6);
    v37 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:428];
    [v7 setObject:v37 forKeyedSubscript:*MEMORY[0x263F2F548]];
  }
  else
  {
    v37 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  free(v10);
}

+ (void)_addSpatialCCMDataToMetadata:(id)a3 fromOutput:(sLtmComputeOutput *)a4 driverInputMetadata:(sRefDriverInputs *)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = v7;
  if (!a5->useSpatialCCM)
  {
    [v7 removeObjectForKey:*MEMORY[0x263F2F540]];
    goto LABEL_21;
  }
  id v9 = (char *)malloc_type_malloc(0x2898uLL, 0x75574A44uLL);
  unint64_t v10 = v9;
  if (!v9)
  {
    v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
LABEL_24:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_19;
  }
  v54 = v8;
  *(void *)id v9 = 0x360000C001003E9;
  *((_WORD *)v9 + 4) = 54;
  *(void *)(v9 + 10) = 0;
  *((_WORD *)v9 + 9) = a5->tileStatsRegionInRaw.width >> 4;
  *((_WORD *)v9 + 10) = a5->tileStatsRegionInRaw.height / 0xC;
  *((_WORD *)v9 + 11) = 4096;
  v65.columns[0].i32[3] = 0;
  v65.columns[0].f32[0] = (float)(__int16)a5->ccm.coeff[0].v16 * 0.00024414;
  v65.columns[0].f32[1] = (float)(__int16)a5->ccm.coeff[3].v16 * 0.00024414;
  v65.columns[0].f32[2] = (float)(__int16)a5->ccm.coeff[6].v16 * 0.00024414;
  v65.columns[1].i32[3] = 0;
  v65.columns[1].f32[0] = (float)(__int16)a5->ccm.coeff[1].v16 * 0.00024414;
  v65.columns[1].f32[1] = (float)(__int16)a5->ccm.coeff[4].v16 * 0.00024414;
  v65.columns[1].f32[2] = (float)(__int16)a5->ccm.coeff[7].v16 * 0.00024414;
  v65.columns[2].i32[3] = 0;
  v65.columns[2].f32[0] = (float)(__int16)a5->ccm.coeff[2].v16 * 0.00024414;
  v65.columns[2].f32[1] = (float)(__int16)a5->ccm.coeff[5].v16 * 0.00024414;
  v65.columns[2].f32[2] = (float)(__int16)a5->ccm.coeff[8].v16 * 0.00024414;
  simd_float3 v56 = v65.columns[1];
  simd_float3 v57 = v65.columns[0];
  simd_float3 v55 = v65.columns[2];
  simd_float3x3 v66 = __invert_f3(v65);
  for (uint64_t i = 0; i != 192; ++i)
  {
    uint64_t v12 = 0;
    double v13 = (char *)a4 + 108 * i;
    v14.i64[0] = *(void *)(v13 + 14796);
    v15.i64[0] = *((void *)v13 + 1851);
    v16.i64[0] = *(void *)(v13 + 14820);
    v14.i64[1] = *((unsigned int *)v13 + 3701);
    v15.i64[1] = *((unsigned int *)v13 + 3704);
    v16.i64[1] = *((unsigned int *)v13 + 3707);
    simd_float3 v61 = v14;
    simd_float3 v62 = v15;
    simd_float3 v63 = v16;
    float32x4_t v58 = 0uLL;
    float32x4_t v59 = 0uLL;
    float32x4_t v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v12 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v66.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v12 * 4))), (float32x4_t)v66.columns[1], *(float32x2_t *)&v61.f32[v12], 1), (float32x4_t)v66.columns[2], *(float32x4_t *)((char *)&v61 + v12 * 4), 2);
      v12 += 4;
    }
    while (v12 != 12);
    uint64_t v17 = 0;
    float32x4_t v18 = v58;
    float32x4_t v19 = v59;
    float32x4_t v20 = v60;
    simd_float3 v61 = v57;
    simd_float3 v62 = v56;
    simd_float3 v63 = v55;
    float32x4_t v58 = 0uLL;
    float32x4_t v59 = 0uLL;
    float32x4_t v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v17 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v17 * 4))), v19, *(float32x2_t *)&v61.f32[v17], 1), v20, *(float32x4_t *)((char *)&v61 + v17 * 4), 2);
      v17 += 4;
    }
    while (v17 != 12);
    uint64_t v21 = 0;
    float32x4_t v22 = v58;
    float32x4_t v23 = v59;
    float32x4_t v24 = v60;
    unsigned int v25 = &v10[27 * i];
    v25[14] = vcvtms_s32_f32(4096.0 * v58.f32[0]);
    v25[17] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v22.f32, 1));
    v25[20] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v22, 2));
    v25[23] = vcvtms_s32_f32(4096.0 * v23.f32[0]);
    v25[26] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v23.f32, 1));
    v25[29] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v23, 2));
    float v26 = v25 + 12;
    v25[32] = vcvtms_s32_f32(4096.0 * v24.f32[0]);
    v25[35] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v24.f32, 1));
    v25[38] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v24, 2));
    unsigned int v27 = (char *)a4 + 108 * i;
    v22.i64[0] = *((void *)v27 + 1854);
    v23.i64[0] = *(void *)(v27 + 14844);
    v22.i32[2] = *((_DWORD *)v27 + 3710);
    v24.i64[0] = *((void *)v27 + 1857);
    v23.i32[2] = *((_DWORD *)v27 + 3713);
    v24.i32[2] = *((_DWORD *)v27 + 3716);
    simd_float3 v61 = (simd_float3)v22;
    simd_float3 v62 = (simd_float3)v23;
    simd_float3 v63 = (simd_float3)v24;
    float32x4_t v58 = 0uLL;
    float32x4_t v59 = 0uLL;
    float32x4_t v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v21 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v66.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v21 * 4))), (float32x4_t)v66.columns[1], *(float32x2_t *)&v61.f32[v21], 1), (float32x4_t)v66.columns[2], *(float32x4_t *)((char *)&v61 + v21 * 4), 2);
      v21 += 4;
    }
    while (v21 != 12);
    uint64_t v28 = 0;
    float v29 = &v10[27 * i];
    id v30 = v29 + 15;
    uint64_t v31 = v29 + 21;
    uint64_t v32 = v29 + 27;
    float32x4_t v33 = v58;
    float32x4_t v34 = v59;
    float32x4_t v35 = v60;
    __int16 v36 = v29 + 33;
    simd_float3 v61 = v57;
    simd_float3 v62 = v56;
    simd_float3 v63 = v55;
    float32x4_t v58 = 0uLL;
    float32x4_t v59 = 0uLL;
    float32x4_t v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v28 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v33, COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v28 * 4))), v34, *(float32x2_t *)&v61.f32[v28], 1), v35, *(float32x4_t *)((char *)&v61 + v28 * 4), 2);
      v28 += 4;
    }
    while (v28 != 12);
    uint64_t v37 = 0;
    v38 = &v10[27 * i];
    v39 = v38 + 24;
    float32x4_t v40 = v58;
    float32x4_t v41 = v59;
    float32x4_t v42 = v60;
    v26[1] = vcvtms_s32_f32(4096.0 * v58.f32[0]);
    v38[16] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v40.f32, 1));
    v38[19] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v40, 2));
    v38[22] = vcvtms_s32_f32(4096.0 * v41.f32[0]);
    v38[25] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v41.f32, 1));
    v38[28] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v41, 2));
    v43 = v38 + 36;
    v38[31] = vcvtms_s32_f32(4096.0 * v42.f32[0]);
    v38[34] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v42.f32, 1));
    v38[37] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v42, 2));
    v44 = (char *)a4 + 108 * i;
    v40.i64[0] = *(void *)(v44 + 14868);
    v41.i64[0] = *((void *)v44 + 1860);
    v42.i64[0] = *(void *)(v44 + 14892);
    v40.i32[2] = *((_DWORD *)v44 + 3719);
    v41.i32[2] = *((_DWORD *)v44 + 3722);
    v42.i32[2] = *((_DWORD *)v44 + 3725);
    simd_float3 v61 = (simd_float3)v40;
    simd_float3 v62 = (simd_float3)v41;
    simd_float3 v63 = (simd_float3)v42;
    float32x4_t v58 = 0uLL;
    float32x4_t v59 = 0uLL;
    float32x4_t v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v37 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v66.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v37 * 4))), (float32x4_t)v66.columns[1], *(float32x2_t *)&v61.f32[v37], 1), (float32x4_t)v66.columns[2], *(float32x4_t *)((char *)&v61 + v37 * 4), 2);
      v37 += 4;
    }
    while (v37 != 12);
    uint64_t v45 = 0;
    float32x4_t v46 = v58;
    float32x4_t v47 = v59;
    float32x4_t v48 = v60;
    simd_float3 v61 = v57;
    simd_float3 v62 = v56;
    simd_float3 v63 = v55;
    float32x4_t v58 = 0uLL;
    float32x4_t v59 = 0uLL;
    float32x4_t v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v45 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v45 * 4))), v47, *(float32x2_t *)&v61.f32[v45], 1), v48, *(float32x4_t *)((char *)&v61 + v45 * 4), 2);
      v45 += 4;
    }
    while (v45 != 12);
    float32x4_t v49 = v58;
    float32x4_t v50 = v59;
    float32x4_t v51 = v60;
    *float v26 = vcvtms_s32_f32(4096.0 * v58.f32[0]);
    _WORD *v30 = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v49.f32, 1));
    v10[27 * i + 18] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v49, 2));
    _WORD *v31 = vcvtms_s32_f32(4096.0 * v50.f32[0]);
    _WORD *v39 = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v50.f32, 1));
    _WORD *v32 = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v50, 2));
    v10[27 * i + 30] = vcvtms_s32_f32(4096.0 * v51.f32[0]);
    *__int16 v36 = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v51.f32, 1));
    _WORD *v43 = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v51, 2));
  }
  uint64_t v52 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v10, 10392, 14888, 14900);
  if (!v52)
  {
    v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    id v8 = v54;
    goto LABEL_24;
  }
  v53 = v52;
  id v8 = v54;
  [v54 setObject:v52 forKeyedSubscript:*MEMORY[0x263F2F540]];
LABEL_19:

  free(v10);
LABEL_21:
}

+ (void)_addGlobalLTMLookUpTableAlignedToFinalCropRect:(id)a3
{
  v3 = NSNumber;
  id v4 = a3;
  id v5 = [v3 numberWithBool:1];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F2F088]];
}

@end