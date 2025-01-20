@interface MFXTemporalScalingEffectV3
@end

@implementation MFXTemporalScalingEffectV3

BOOL __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  int v3 = *a3;
  if (*a3 == 2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 448);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_2;
    v12[3] = &unk_2651C6B88;
    v12[4] = v5;
    id v13 = *(id *)(a1 + 40);
    long long v22 = *(_OWORD *)(a1 + 112);
    uint64_t v23 = *(void *)(a1 + 128);
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    id v7 = *(id *)(a1 + 72);
    long long v24 = *(_OWORD *)(a1 + 136);
    uint64_t v25 = *(void *)(a1 + 152);
    __int16 v29 = *(_WORD *)(a1 + 184);
    int v27 = *(_DWORD *)(a1 + 176);
    int v28 = *(_DWORD *)(a1 + 180);
    uint64_t v8 = *(void *)(a1 + 96);
    id v17 = v7;
    uint64_t v20 = v8;
    long long v26 = *(_OWORD *)(a1 + 160);
    id v18 = *(id *)(a1 + 80);
    id v9 = *(id *)(a1 + 88);
    uint64_t v10 = *(void *)(a1 + 104);
    id v19 = v9;
    uint64_t v21 = v10;
    dispatch_async(v6, v12);
  }
  return v3 == 2;
}

void __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_2(uint64_t a1)
{
  MetalFxScopedSignpost::MetalFxScopedSignpost((MetalFxScopedSignpost *)v34, 0, *(void *)(a1 + 32), 6, 0, 0);
  if (MTLTraceEnabled())
  {
    [*(id *)(a1 + 40) globalTraceObjectID];
    kdebug_trace();
  }
  v30 = [*(id *)(*(void *)(a1 + 32) + 376) commandBuffer];
  if (MTLTraceEnabled())
  {
    [v30 globalTraceObjectID];
    kdebug_trace();
  }
  [v30 encodeWaitForEvent:*(void *)(*(void *)(a1 + 32) + 384) value:*(void *)(a1 + 112)];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 147))
  {
    uint64_t v3 = *(void *)(v2 + 416);
    if (v3) {
      [v30 encodeSignalEvent:v3 value:*(void *)(a1 + 120)];
    }
  }
  __int16 v29 = [v30 computeCommandEncoder];
  [v29 setLabel:@"MetalFX_TemporalV3_PreProcessing"];
  [*(id *)(a1 + 32) _didCreateComputeCommandEncoder:v29 forEncode:*(void *)(a1 + 128)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(uint32x2_t **)(v4 + 352);
  v6 = *(void **)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  uint64_t v8 = *(void **)(v4 + 200);
  uint64_t v10 = *(void **)(a1 + 64);
  id v9 = *(void **)(a1 + 72);
  v11 = [*(id *)(v4 + 360) mpsndarray];
  v12 = [v11 buffer];
  LODWORD(v13) = HIDWORD(*(void *)(a1 + 152));
  BRNet_v3_Filter::encodePre(v5, v30, v29, v6, v7, v10, v8, v9, *(float32x2_t *)(a1 + 136), *(float32x2_t *)(a1 + 144), COERCE_FLOAT(*(void *)(a1 + 152)), v13, *(float *)(a1 + 176), v12, *(_WORD *)(a1 + 184), HIBYTE(*(_WORD *)(a1 + 184)), *(unsigned char *)(*(void *)(a1 + 32) + 146), *(_DWORD *)(a1 + 180));

  [v29 endEncoding];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(v14 + 424);
  uint64_t v16 = *(void *)(a1 + 120);
  if (*(unsigned char *)(v14 + 147)) {
    [v30 encodeSignalEvent:v15 value:v16 agentMask:8];
  }
  else {
    [v30 encodeSignalEvent:v15 value:v16];
  }
  [v30 encodeSignalEvent:*(void *)(*(void *)(a1 + 32) + 400) value:*(void *)(a1 + 120)];
  if (*(void *)(*(void *)(a1 + 32) + 792))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_3;
    v33[3] = &unk_2651C6B38;
    v33[4] = *(void *)(a1 + 96);
    [v30 addCompletedHandler:v33];
  }
  [v30 commitAndWaitUntilSubmitted];
  if (MTLTraceEnabled()) {
    kdebug_trace();
  }
  uint64_t v17 = *(void *)(a1 + 32);
  MPSGraphMPSGraphExecutableWrapper::run(v17 + 216, *(void **)(v17 + 376), *(void **)(v17 + 360), *(void **)(v17 + 368), 0, *(unsigned __int8 *)(v17 + 147), *(void **)(v17 + 416), *(void **)(v17 + 424), *(void *)(a1 + 120), *(void *)(a1 + 160));
  id v18 = [*(id *)(*(void *)(a1 + 32) + 376) commandBuffer];
  [v18 encodeWaitForEvent:*(void *)(*(void *)(a1 + 32) + 424) value:*(void *)(a1 + 160)];
  [v18 encodeWaitForEvent:*(void *)(*(void *)(a1 + 32) + 408) value:*(void *)(a1 + 168)];
  if (MTLTraceEnabled())
  {
    [v18 globalTraceObjectID];
    kdebug_trace();
  }
  id v19 = [v18 computeCommandEncoder];
  [v19 setLabel:@"MetalFX_TemporalV3_PostProcessing"];
  [*(id *)(a1 + 32) _didCreateComputeCommandEncoder:v19 forEncode:*(void *)(a1 + 128)];
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(int32x2_t **)(v20 + 352);
  long long v22 = [*(id *)(v20 + 368) mpsndarray];
  uint64_t v23 = [v22 buffer];
  LODWORD(v24) = HIDWORD(*(void *)(a1 + 152));
  LOBYTE(v28) = *(unsigned char *)(a1 + 184);
  BRNet_v3_Filter::encodePost(v21, *(float32x2_t *)(a1 + 136), *(float32x2_t *)(a1 + 144), COERCE_FLOAT(*(void *)(a1 + 152)), v24, *(float *)(a1 + 176), (uint64_t)v18, v19, v23, *(void **)(a1 + 80), *(void **)(a1 + 88), *(void **)(*(void *)(a1 + 32) + 208), *(void **)(*(void *)(a1 + 32) + 200), v28, *(_DWORD *)(a1 + 180), HIWORD(*(_DWORD *)(a1 + 180)));

  uint64_t v25 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v25 + 149))
  {
    [v19 endEncoding];
    long long v26 = [v18 blitCommandEncoder];
    [v26 copyFromTexture:*(void *)(a1 + 88) toTexture:*(void *)(*(void *)(a1 + 32) + 208)];
    if (*(void *)(*(void *)(a1 + 32) + 784)) {
      objc_msgSend(v26, "updateFence:");
    }
    [v26 endEncoding];
  }
  else
  {
    if (*(void *)(v25 + 784)) {
      objc_msgSend(v19, "updateFence:");
    }
    [v19 endEncoding];
  }
  [v18 encodeSignalEvent:*(void *)(*(void *)(a1 + 32) + 392) value:*(void *)(a1 + 168)];
  uint64_t v27 = *(void *)(a1 + 32);
  if (*(void *)(v27 + 792))
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_4;
    v31[3] = &unk_2651C6B60;
    v31[4] = v27;
    int8x16_t v32 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
    [v18 addCompletedHandler:v31];
  }
  [v18 commitAndWaitUntilSubmitted];

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)v34);
}

void __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 GPUStartTime];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_4(void *a1, void *a2)
{
  id v22 = a2;
  [v22 GPUEndTime];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(CHistoryRecord **)(v4 + 800);
  unsigned int v6 = *(_DWORD *)(v4 + 808);
  float v7 = (*(double *)(*(void *)(a1[5] + 8) + 24) - *(double *)(*(void *)(a1[6] + 8) + 24)) * 1000.0;
  if (v7 > 999.99 || v7 < 0.0) {
    float v7 = 0.0;
  }
  unsigned int v9 = v6 % 0x78;
  v5->var1 = v9;
  v5->var2 = v9;
  uint64_t v10 = &v5->var0 + v9;
  float v11 = v5->var3 + (float)(v7 - v10[5]);
  v10[5] = v7;
  v5->var3 = v11;
  v5->var4 = v11 / 120.0;
  CHistoryRecord::UpdateMinMax(v5);
  uint64_t v12 = a1[4];
  if (*(unsigned char *)(v12 + 344) && *(unsigned char *)(v12 + 147)) {
    double v13 = "ANE";
  }
  else {
    double v13 = "GPU";
  }
  uint64_t v14 = *(void **)(v12 + 792);
  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"MetalFX TAAU Enabled %s", v13);
  [v14 updateLabel:@"com.apple.hud-label.metalfx" value:v15];

  uint64_t v16 = (void *)a1[4];
  uint64_t v17 = (void *)v16[99];
  id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%lux%lu->%lux%lu", v16[5], v16[6], v16[7], v16[8]);
  [v17 updateLabel:@"com.apple.hud-label.metalfx.resolution" value:v18];

  uint64_t v19 = a1[4];
  uint64_t v20 = *(void **)(v19 + 792);
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%2.2f [%2.2f %2.2f]", *(float *)(*(void *)(v19 + 800) + 16), *(float *)(*(void *)(v19 + 800) + 500), *(float *)(*(void *)(v19 + 800) + 504));
  [v20 updateLabel:@"com.apple.hud-label.metalfx.timing" value:v21];

  ++*(_DWORD *)(a1[4] + 808);
}

@end