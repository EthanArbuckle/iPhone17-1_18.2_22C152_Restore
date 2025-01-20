@interface FPCAMetalLayerState
+ (id)_commandBufferForAddress:(uint64_t)a1;
+ (id)_globalScheduledCommandBuffers;
+ (id)_layerStateForAddress:(uint64_t)a1;
+ (void)_updateCommandBufferState:(void *)a3 block:;
+ (void)_updateLayerState:(void *)a3 block:;
+ (void)commandBufferCommit:(uint64_t)a3 commitTime:;
+ (void)commandBufferCompleted:(uint64_t)a3 gpuStartTime:(uint64_t)a4 gpuEndTime:;
+ (void)commandBufferCreate:(uint64_t)a3 creationTime:;
+ (void)commandBufferScheduled:(uint64_t)a3 kernelStartTime:(uint64_t)a4 kernelEndTime:;
+ (void)drawableLifetimeEnd:(uint64_t)a3 imageQueueID:(int)a4 drawableID:(uint64_t)a5 drawableFinishedTime:(char)a6 wasPresented:(void *)a7 targetCPUDeadline:(void *)a8 targetPresentationTime:;
+ (void)drawableLifetimeStart:(uint64_t)a3 drawableID:(uint64_t)a4 surfaceID:(uint64_t)a5 acquisitionWaitStart:(int)a6 acquiredTime:;
+ (void)metalLayer:(uint64_t)a3 drawableID:(uint64_t)a4 clientPresentedTime:;
+ (void)metalLayerAlloc:(uint64_t)a1;
+ (void)metalLayerDealloc:(uint64_t)a1;
+ (void)metalLayerSetNameOfLayer:(void *)a3 name:;
+ (void)metalLayerSetPixelFormat:(uint64_t)a3 pixelFormat:;
+ (void)metalLayerSetSize:(uint64_t)a3 height:(uint64_t)a4 width:;
- (double)previousPresentedLifetimeEnd;
- (void)_reportState;
- (void)dealloc;
@end

@implementation FPCAMetalLayerState

+ (void)metalLayerAlloc:(uint64_t)a1
{
  uint64_t v3 = self;
  v4 = _FPLayerStateSyncQueue();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__FPCAMetalLayerState_metalLayerAlloc___block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = v3;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __49__FPCAMetalLayerState__reportBundleInfoIfNeeded___block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  v2 = (void *)v1;
  if (v1) {
    uint64_t v3 = (__CFString *)v1;
  }
  else {
    uint64_t v3 = @"Unknown";
  }
  objc_storeStrong((id *)&qword_26B1F50F0, v3);

  v4 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v5 = [v4 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"Unknown";
  }
  objc_storeStrong((id *)algn_26B1F50F8, v7);

  id v11 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v8 = [v11 objectForInfoDictionaryKey:@"CFBundleVersion"];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = @"Unknown";
  }
  objc_storeStrong((id *)&qword_26B1F5100, v10);
}

+ (void)metalLayer:(uint64_t)a3 drawableID:(uint64_t)a4 clientPresentedTime:
{
  uint64_t v7 = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__FPCAMetalLayerState_metalLayer_drawableID_clientPresentedTime___block_invoke;
  v8[3] = &__block_descriptor_48_e29_v16__0__FPCAMetalLayerState_8l;
  v8[4] = a4;
  *(double *)&v8[5] = a1;
  +[FPCAMetalLayerState _updateLayerState:block:](v7, a3, v8);
}

+ (void)drawableLifetimeStart:(uint64_t)a3 drawableID:(uint64_t)a4 surfaceID:(uint64_t)a5 acquisitionWaitStart:(int)a6 acquiredTime:
{
  uint64_t v11 = self;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __100__FPCAMetalLayerState_drawableLifetimeStart_drawableID_surfaceID_acquisitionWaitStart_acquiredTime___block_invoke;
  v12[3] = &__block_descriptor_60_e29_v16__0__FPCAMetalLayerState_8l;
  v12[4] = a5;
  int v13 = a6;
  *(double *)&v12[5] = a1;
  *(double *)&v12[6] = a2;
  +[FPCAMetalLayerState _updateLayerState:block:](v11, a4, v12);
}

+ (void)drawableLifetimeEnd:(uint64_t)a3 imageQueueID:(int)a4 drawableID:(uint64_t)a5 drawableFinishedTime:(char)a6 wasPresented:(void *)a7 targetCPUDeadline:(void *)a8 targetPresentationTime:
{
  id v14 = a7;
  id v15 = a8;
  uint64_t v16 = self;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __142__FPCAMetalLayerState_drawableLifetimeEnd_imageQueueID_drawableID_drawableFinishedTime_wasPresented_targetCPUDeadline_targetPresentationTime___block_invoke;
  v19[3] = &unk_26532AD78;
  int v24 = a4;
  id v21 = v15;
  uint64_t v22 = a5;
  double v23 = a1;
  char v25 = a6;
  id v20 = v14;
  id v17 = v15;
  id v18 = v14;
  +[FPCAMetalLayerState _updateLayerState:block:](v16, a3, v19);
}

+ (void)commandBufferCompleted:(uint64_t)a3 gpuStartTime:(uint64_t)a4 gpuEndTime:
{
  uint64_t v7 = self;
  if (atomic_load(&gFPLayerCount)) {
    BOOL v9 = gHasRecentActiveDrawables == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__FPCAMetalLayerState_commandBufferCompleted_gpuStartTime_gpuEndTime___block_invoke;
    v10[3] = &__block_descriptor_64_e33_v16__0__FPInFlightCommandBuffer_8l;
    v10[4] = a3;
    v10[5] = a4;
    v10[6] = v7;
    v10[7] = a2;
    +[FPCAMetalLayerState _updateCommandBufferState:block:](v7, a2, v10);
  }
}

+ (void)commandBufferScheduled:(uint64_t)a3 kernelStartTime:(uint64_t)a4 kernelEndTime:
{
  uint64_t v7 = self;
  if (atomic_load(&gFPLayerCount)) {
    BOOL v9 = gHasRecentActiveDrawables == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__FPCAMetalLayerState_commandBufferScheduled_kernelStartTime_kernelEndTime___block_invoke;
    v10[3] = &__block_descriptor_56_e33_v16__0__FPInFlightCommandBuffer_8l;
    v10[4] = a3;
    v10[5] = a4;
    v10[6] = v7;
    +[FPCAMetalLayerState _updateCommandBufferState:block:](v7, a2, v10);
  }
}

+ (void)commandBufferCommit:(uint64_t)a3 commitTime:
{
  uint64_t v5 = self;
  if (atomic_load(&gFPLayerCount)) {
    BOOL v7 = gHasRecentActiveDrawables == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__FPCAMetalLayerState_commandBufferCommit_commitTime___block_invoke;
    v8[3] = &__block_descriptor_40_e33_v16__0__FPInFlightCommandBuffer_8l;
    v8[4] = a3;
    +[FPCAMetalLayerState _updateCommandBufferState:block:](v5, a2, v8);
  }
}

+ (void)commandBufferCreate:(uint64_t)a3 creationTime:
{
  uint64_t v5 = self;
  if (atomic_load(&gFPLayerCount)) {
    BOOL v7 = gHasRecentActiveDrawables == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = v5;
    BOOL v9 = _FPLayerStateSyncQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__FPCAMetalLayerState_commandBufferCreate_creationTime___block_invoke;
    block[3] = &__block_descriptor_56_e5_v8__0l;
    block[4] = v8;
    block[5] = a2;
    block[6] = a3;
    dispatch_async(v9, block);
  }
}

- (void)_reportState
{
  uint64_t v246 = *MEMORY[0x263EF8340];
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    uint64_t v2 = qword_26B1F50D8;
    unint64_t v3 = qword_26B1F50D0;
    if (qword_26B1F50E0 > (unint64_t)qword_26B1F50D0) {
      unint64_t v3 = qword_26B1F50E0;
    }
    if (v3 <= *(void *)(a1 + 208)) {
      unint64_t v4 = *(void *)(a1 + 208);
    }
    else {
      unint64_t v4 = v3;
    }
    double v5 = _FPGetCurrentAggregationIntervalSeconds();
    if (FPScaleMachTimestamp_onceToken != -1) {
      dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
    }
    double v6 = *(double *)&gTimebaseRatio * (double)(v2 - v4);
    double v7 = v5 * 10.0;
    if (*(unsigned char *)(a1 + 9)
      || (double v8 = *(double *)&gTimebaseRatio * (double)(unint64_t)(v2 - *(void *)(a1 + 216)),
          v8 >= _FPGetCurrentAggregationIntervalSeconds() * 5.0))
    {
      if (v6 < v7)
      {
        BOOL v9 = _fpStateHandle();
        v10 = v9;
        os_signpost_id_t v11 = *(void *)(a1 + 176);
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          uint64_t v201 = v2;
          v12 = *(void **)(a1 + 144);
          id v195 = *(id *)(a1 + 152);
          id v198 = v12;
          uint64_t v192 = [v195 unsignedLongLongValue];
          id v13 = *(id *)(a1 + 160);
          uint64_t v14 = [v13 unsignedLongLongValue];
          id v15 = *(id *)(a1 + 168);
          unint64_t v16 = v4;
          uint64_t v17 = [v15 unsignedLongLongValue];
          uint64_t v18 = *(void *)(a1 + 216);

          *(_DWORD *)buf = 138544642;
          *(void *)v205 = v12;
          uint64_t v2 = v201;
          *(_WORD *)&v205[8] = 2050;
          *(void *)&v205[10] = v192;
          *(_WORD *)&v205[18] = 2050;
          *(void *)&v205[20] = v14;
          *(_WORD *)&v205[28] = 2050;
          *(void *)&v205[30] = v17;
          unint64_t v4 = v16;
          *(_WORD *)&v205[38] = 2050;
          *(void *)&v205[40] = v18;
          *(_WORD *)&v205[48] = 2050;
          *(void *)&v205[50] = v201;
          _os_signpost_emit_with_name_impl(&dword_24F441000, v10, OS_SIGNPOST_EVENT, v11, "CAMetalLayerMetadata", "Signpost ID is Shared Image Queue ID\nName: '%{public, name=name}@'\nHeight (points): %{public, name=Height, units=pixels}llu\nWidth: (points): %{public, name=Width, units=pixels}llu\nPixel format: %{public, name=PixelFormat}#llx\n%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", buf, 0x3Eu);
        }
      }
      *(void *)(a1 + 216) = v2;
      *(unsigned char *)(a1 + 9) = 0;
    }
    if (v6 < v7)
    {
      if ([*(id *)(a1 + 80) count])
      {
        v19 = _fpStateHandle();
        id v20 = v19;
        os_signpost_id_t v21 = *(void *)(a1 + 176);
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          id v202 = *(id *)(a1 + 80);
          int v178 = [v202 count];
          id v199 = *(id *)(a1 + 80);
          [v199 averageMs];
          uint64_t v174 = v22;
          id v196 = *(id *)(a1 + 80);
          [v196 minMs];
          uint64_t v172 = v23;
          id v193 = *(id *)(a1 + 80);
          [v193 maxMs];
          uint64_t v168 = v24;
          id v190 = *(id *)(a1 + 80);
          [v190 stddevMs];
          uint64_t v164 = v25;
          id v188 = *(id *)(a1 + 88);
          [v188 averageMs];
          uint64_t v162 = v26;
          id v186 = *(id *)(a1 + 88);
          [v186 minMs];
          uint64_t v158 = v27;
          id v184 = *(id *)(a1 + 88);
          [v184 maxMs];
          uint64_t v156 = v28;
          id v182 = *(id *)(a1 + 88);
          [v182 stddevMs];
          uint64_t v152 = v29;
          id v180 = *(id *)(a1 + 96);
          [v180 averageMs];
          uint64_t v148 = v30;
          id v176 = *(id *)(a1 + 96);
          [v176 minMs];
          uint64_t v146 = v31;
          id v170 = *(id *)(a1 + 96);
          [v170 maxMs];
          uint64_t v142 = v32;
          id v166 = *(id *)(a1 + 96);
          [v166 stddevMs];
          uint64_t v140 = v33;
          id v160 = *(id *)(a1 + 104);
          [v160 averageMs];
          uint64_t v35 = v34;
          id v154 = *(id *)(a1 + 104);
          [v154 minMs];
          uint64_t v37 = v36;
          id v150 = *(id *)(a1 + 104);
          [v150 maxMs];
          uint64_t v39 = v38;
          id v144 = *(id *)(a1 + 104);
          [v144 stddevMs];
          uint64_t v41 = v40;
          id v42 = *(id *)(a1 + 112);
          [v42 averageMs];
          uint64_t v44 = v43;
          id v45 = *(id *)(a1 + 112);
          [v45 minMs];
          uint64_t v47 = v46;
          id v48 = *(id *)(a1 + 112);
          [v48 maxMs];
          uint64_t v50 = v49;
          unint64_t v51 = v4;
          id v52 = *(id *)(a1 + 112);
          [v52 stddevMs];
          uint64_t v54 = v53;
          uint64_t v55 = v2;
          int v56 = *(_DWORD *)(a1 + 16);

          unint64_t v4 = v51;
          *(_DWORD *)buf = 67246080;
          *(_DWORD *)v205 = v178;
          *(_WORD *)&v205[4] = 2050;
          *(void *)&v205[6] = v174;
          *(_WORD *)&v205[14] = 2050;
          *(void *)&v205[16] = v172;
          *(_WORD *)&v205[24] = 2050;
          *(void *)&v205[26] = v168;
          *(_WORD *)&v205[34] = 2050;
          *(void *)&v205[36] = v164;
          *(_WORD *)&v205[44] = 2050;
          *(void *)&v205[46] = v162;
          *(_WORD *)&v205[54] = 2050;
          *(void *)&v205[56] = v158;
          __int16 v206 = 2050;
          uint64_t v207 = v156;
          __int16 v208 = 2050;
          uint64_t v209 = v152;
          __int16 v210 = 2050;
          uint64_t v211 = v148;
          __int16 v212 = 2050;
          uint64_t v213 = v146;
          __int16 v214 = 2050;
          uint64_t v215 = v142;
          __int16 v216 = 2050;
          uint64_t v217 = v140;
          __int16 v218 = 2050;
          uint64_t v219 = v35;
          __int16 v220 = 2050;
          uint64_t v221 = v37;
          __int16 v222 = 2050;
          uint64_t v223 = v39;
          __int16 v224 = 2050;
          uint64_t v225 = v41;
          __int16 v226 = 2050;
          uint64_t v227 = v44;
          __int16 v228 = 2050;
          uint64_t v229 = v47;
          __int16 v230 = 2050;
          uint64_t v231 = v50;
          __int16 v232 = 2050;
          uint64_t v233 = v54;
          __int16 v234 = 1026;
          int v235 = v56;
          uint64_t v2 = v55;
          __int16 v236 = 2050;
          *(void *)v237 = v51;
          *(_WORD *)&v237[8] = 2050;
          *(void *)&v237[10] = v55;
          _os_signpost_emit_with_name_impl(&dword_24F441000, v20, OS_SIGNPOST_EVENT, v21, "SkippedFrameStats", "Signpost ID is Shared Image Queue ID\nFrames (count, frames) =%{public, signpost.aggregation:count, group=Frames, unit=frames}u\nFrames_TotalEndToEndWalltime (TotalEndToEndWalltime average, ms) =%{public, signpost.aggregation:measure_average, group=Frames, type=TotalEndToEndWalltime, measure_unit=ms}.3f\nFrames_TotalEndToEndWalltime (TotalEndToEndWalltime min, ms) =%{public, signpost.aggregation:measure_min, group=Frames, type=TotalEndToEndWalltime, measure_unit=ms}.3f\nFrames_TotalEndToEndWalltime (TotalEndToEndWalltime max, ms) =%{public, signpost.aggregation:measure_max, group=Frames, type=TotalEndToEndWalltime, measure_unit=ms}.3f\nFrames_TotalEndToEndWalltime (TotalEndToEndWalltime stddev, ms) =%{public, signpost.aggregation:measure_stddev, group=Frames, type=TotalEndToEndWalltime, measure_unit=ms}.3f\nFrames_CPUEndToEndWalltime (CPUEndToEndWalltime average, ms) =%{public, signpost.aggregation:measure_average, group=Frames, type=CPUEndToEndWalltime, measure_unit=ms}.3f\nFrames_CPUEndToEndWalltime (CPUEndToEndWalltime min, ms) =%{public, signpost.aggregation:measure_min, group=Frames, type=CPUEndToEndWalltime, measure_unit=ms}.3f\n"
            "Frames_CPUEndToEndWalltime (CPUEndToEndWalltime max, ms) =%{public, signpost.aggregation:measure_max, group="
            "Frames, type=CPUEndToEndWalltime, measure_unit=ms}.3f\n"
            "Frames_CPUEndToEndWalltime (CPUEndToEndWalltime stddev, ms) =%{public, signpost.aggregation:measure_stddev, "
            "group=Frames, type=CPUEndToEndWalltime, measure_unit=ms}.3f\n"
            "Frames_GPUEndToEndWalltime (GPUEndToEndWalltime average, ms) =%{public, signpost.aggregation:measure_average"
            ", group=Frames, type=GPUEndToEndWalltime, measure_unit=ms}.3f\n"
            "Frames_GPUEndToEndWalltime (GPUEndToEndWalltime min, ms) =%{public, signpost.aggregation:measure_min, group="
            "Frames, type=GPUEndToEndWalltime, measure_unit=ms}.3f\n"
            "Frames_GPUEndToEndWalltime (GPUEndToEndWalltime max, ms) =%{public, signpost.aggregation:measure_max, group="
            "Frames, type=GPUEndToEndWalltime, measure_unit=ms}.3f\n"
            "Frames_GPUEndToEndWalltime (GPUEndToEndWalltime stddev, ms) =%{public, signpost.aggregation:measure_stddev, "
            "group=Frames, type=GPUEndToEndWalltime, measure_unit=ms}.3f\n"
            "Frames_TotalOnGPUWalltime (TotalOnGPUWalltime average, ms) =%{public, signpost.aggregation:measure_average, "
            "group=Frames, type=TotalOnGPUWalltime, measure_unit=ms}.3f\n"
            "Frames_TotalOnGPUWalltime (TotalOnGPUWalltime min, ms) =%{public, signpost.aggregation:measure_min, group=Fr"
            "ames, type=TotalOnGPUWalltime, measure_unit=ms}.3f\n"
            "Frames_TotalOnGPUWalltime (TotalOnGPUWalltime max, ms) =%{public, signpost.aggregation:measure_max, group=Fr"
            "ames, type=TotalOnGPUWalltime, measure_unit=ms}.3f\n"
            "Frames_TotalOnGPUWalltime (TotalOnGPUWalltime stddev, ms) =%{public, signpost.aggregation:measure_stddev, gr"
            "oup=Frames, type=TotalOnGPUWalltime, measure_unit=ms}.3f\n"
            "Frames_GPUDoneToCompletedWalltime (GPUDoneToCompletedWalltime average, ms) =%{public, signpost.aggregation:m"
            "easure_average, group=Frames, type=GPUDoneToCompletedWalltime, measure_unit=ms}.3f\n"
            "Frames_GPUDoneToCompletedWalltime (GPUDoneToCompletedWalltime min, ms) =%{public, signpost.aggregation:measu"
            "re_min, group=Frames, type=GPUDoneToCompletedWalltime, measure_unit=ms}.3f\n"
            "Frames_GPUDoneToCompletedWalltime (GPUDoneToCompletedWalltime max, ms) =%{public, signpost.aggregation:measu"
            "re_max, group=Frames, type=GPUDoneToCompletedWalltime, measure_unit=ms}.3f\n"
            "Frames_GPUDoneToCompletedWalltime (GPUDoneToCompletedWalltime stddev, ms) =%{public, signpost.aggregation:me"
            "asure_stddev, group=Frames, type=GPUDoneToCompletedWalltime, measure_unit=ms}.3f\n"
            "FrameCommandBuffers (count, command_buffers) =%{public, signpost.aggregation:count, group=FrameCommandBuffer"
            "s, unit=command_buffers}u\n"
            "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu",
            buf,
            0xEAu);
        }
      }
      if ([*(id *)(a1 + 128) count])
      {
        v57 = _fpStateHandle();
        v58 = v57;
        os_signpost_id_t v59 = *(void *)(a1 + 176);
        if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
        {
          id v60 = *(id *)(a1 + 128);
          int v61 = [v60 count];
          id v62 = *(id *)(a1 + 128);
          [v62 averageMs];
          uint64_t v64 = v63;
          id v65 = *(id *)(a1 + 128);
          [v65 minMs];
          uint64_t v67 = v66;
          id v68 = *(id *)(a1 + 128);
          [v68 maxMs];
          uint64_t v70 = v69;
          [*(id *)(a1 + 128) stddevMs];
          *(_DWORD *)buf = 67241728;
          *(_DWORD *)v205 = v61;
          *(_WORD *)&v205[4] = 2050;
          *(void *)&v205[6] = v64;
          *(_WORD *)&v205[14] = 2050;
          *(void *)&v205[16] = v67;
          *(_WORD *)&v205[24] = 2050;
          *(void *)&v205[26] = v70;
          *(_WORD *)&v205[34] = 2050;
          *(void *)&v205[36] = v71;
          *(_WORD *)&v205[44] = 2050;
          *(void *)&v205[46] = v4;
          *(_WORD *)&v205[54] = 2050;
          *(void *)&v205[56] = v2;
          _os_signpost_emit_with_name_impl(&dword_24F441000, v58, OS_SIGNPOST_EVENT, v59, "LateClientDrawablePresentStats", "Signpost ID is Shared Image Queue ID\nLateClientDrawablePresents (count, late_client_presents) =%{public, signpost.aggregation:count, group=LateClientDrawablePresents, unit=late_client_presents}u\nLateClientDrawablePresents_Lateness (Lateness average, ms) =%{public, signpost.aggregation:measure_average, group=LateClientDrawablePresents, type=Lateness, measure_unit=ms}.3f\nLateClientDrawablePresents_Lateness (Lateness min, ms) =%{public, signpost.aggregation:measure_min, group=LateClientDrawablePresents, type=Lateness, measure_unit=ms}.3f\nLateClientDrawablePresents_Lateness (Lateness max, ms) =%{public, signpost.aggregation:measure_max, group=LateClientDrawablePresents, type=Lateness, measure_unit=ms}.3f\nLateClientDrawablePresents_Lateness (Lateness stddev, ms) =%{public, signpost.aggregation:measure_stddev, group=LateClientDrawablePresents, type=Lateness, measure_unit=ms}.3f\n%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", buf, 0x44u);
        }
      }
      if ([*(id *)(a1 + 136) count])
      {
        v72 = _fpStateHandle();
        v73 = v72;
        os_signpost_id_t v74 = *(void *)(a1 + 176);
        if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
        {
          id v75 = *(id *)(a1 + 136);
          int v76 = [v75 count];
          id v77 = *(id *)(a1 + 136);
          [v77 averageMs];
          uint64_t v79 = v78;
          id v80 = *(id *)(a1 + 136);
          [v80 minMs];
          uint64_t v82 = v81;
          id v83 = *(id *)(a1 + 136);
          [v83 maxMs];
          uint64_t v85 = v84;
          [*(id *)(a1 + 136) stddevMs];
          *(_DWORD *)buf = 67241728;
          *(_DWORD *)v205 = v76;
          *(_WORD *)&v205[4] = 2050;
          *(void *)&v205[6] = v79;
          *(_WORD *)&v205[14] = 2050;
          *(void *)&v205[16] = v82;
          *(_WORD *)&v205[24] = 2050;
          *(void *)&v205[26] = v85;
          *(_WORD *)&v205[34] = 2050;
          *(void *)&v205[36] = v86;
          *(_WORD *)&v205[44] = 2050;
          *(void *)&v205[46] = v4;
          *(_WORD *)&v205[54] = 2050;
          *(void *)&v205[56] = v2;
          _os_signpost_emit_with_name_impl(&dword_24F441000, v73, OS_SIGNPOST_EVENT, v74, "LateOnGlassPresentStats", "Signpost ID is Shared Image Queue ID\nLateOnGlassPresents (count, frames_late_on_glass) =%{public, signpost.aggregation:count, group=LateOnGlassPresents, unit=frames_late_on_glass}u\nLateOnGlassPresents_Lateness (Lateness average, ms) =%{public, signpost.aggregation:measure_average, group=LateOnGlassPresents, type=Lateness, measure_unit=ms}.3f\nLateOnGlassPresents_Lateness (Lateness min, ms) =%{public, signpost.aggregation:measure_min, group=LateOnGlassPresents, type=Lateness, measure_unit=ms}.3f\nLateOnGlassPresents_Lateness (Lateness max, ms) =%{public, signpost.aggregation:measure_max, group=LateOnGlassPresents, type=Lateness, measure_unit=ms}.3f\nLateOnGlassPresents_Lateness (Lateness stddev, ms) =%{public, signpost.aggregation:measure_stddev, group=LateOnGlassPresents, type=Lateness, measure_unit=ms}.3f\n%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", buf, 0x44u);
        }
      }
      v87 = _fpStateHandle();
      v88 = v87;
      os_signpost_id_t v89 = *(void *)(a1 + 176);
      if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
      {
        id v203 = *(id *)(a1 + 40);
        int v175 = [v203 count];
        id v200 = *(id *)(a1 + 40);
        [v200 averageMs];
        uint64_t v171 = v90;
        id v197 = *(id *)(a1 + 40);
        [v197 minMs];
        uint64_t v169 = v91;
        id v194 = *(id *)(a1 + 40);
        [v194 maxMs];
        uint64_t v165 = v92;
        id v191 = *(id *)(a1 + 40);
        [v191 stddevMs];
        uint64_t v161 = v93;
        id v189 = *(id *)(a1 + 48);
        [v189 averageMs];
        uint64_t v159 = v94;
        id v187 = *(id *)(a1 + 48);
        [v187 minMs];
        uint64_t v155 = v95;
        id v185 = *(id *)(a1 + 48);
        [v185 maxMs];
        uint64_t v153 = v96;
        id v183 = *(id *)(a1 + 48);
        [v183 stddevMs];
        uint64_t v149 = v97;
        id v181 = *(id *)(a1 + 56);
        [v181 averageMs];
        uint64_t v145 = v98;
        id v179 = *(id *)(a1 + 56);
        [v179 minMs];
        uint64_t v143 = v99;
        id v177 = *(id *)(a1 + 56);
        [v177 maxMs];
        uint64_t v139 = v100;
        id v173 = *(id *)(a1 + 56);
        [v173 stddevMs];
        uint64_t v138 = v101;
        id v167 = *(id *)(a1 + 64);
        [v167 averageMs];
        uint64_t v136 = v102;
        id v163 = *(id *)(a1 + 64);
        [v163 minMs];
        uint64_t v135 = v103;
        id v157 = *(id *)(a1 + 64);
        [v157 maxMs];
        uint64_t v134 = v104;
        id v151 = *(id *)(a1 + 64);
        [v151 stddevMs];
        uint64_t v106 = v105;
        id v147 = *(id *)(a1 + 72);
        [v147 averageMs];
        uint64_t v108 = v107;
        id v141 = *(id *)(a1 + 72);
        [v141 minMs];
        uint64_t v110 = v109;
        id v137 = *(id *)(a1 + 72);
        [v137 maxMs];
        uint64_t v112 = v111;
        unint64_t v133 = v4;
        id v113 = *(id *)(a1 + 72);
        [v113 stddevMs];
        uint64_t v115 = v114;
        int v132 = *(_DWORD *)(a1 + 12);
        id v116 = *(id *)(a1 + 120);
        int v117 = [v116 count];
        id v118 = *(id *)(a1 + 120);
        [v118 averageMs];
        uint64_t v120 = v119;
        id v121 = *(id *)(a1 + 120);
        [v121 minMs];
        uint64_t v123 = v122;
        id v124 = *(id *)(a1 + 120);
        [v124 maxMs];
        uint64_t v126 = v125;
        [*(id *)(a1 + 120) stddevMs];
        *(_DWORD *)buf = 67247360;
        *(_DWORD *)v205 = v175;
        *(_WORD *)&v205[4] = 2050;
        *(void *)&v205[6] = v171;
        *(_WORD *)&v205[14] = 2050;
        *(void *)&v205[16] = v169;
        *(_WORD *)&v205[24] = 2050;
        *(void *)&v205[26] = v165;
        *(_WORD *)&v205[34] = 2050;
        *(void *)&v205[36] = v161;
        *(_WORD *)&v205[44] = 2050;
        *(void *)&v205[46] = v159;
        *(_WORD *)&v205[54] = 2050;
        *(void *)&v205[56] = v155;
        __int16 v206 = 2050;
        uint64_t v207 = v153;
        __int16 v208 = 2050;
        uint64_t v209 = v149;
        __int16 v210 = 2050;
        uint64_t v211 = v145;
        __int16 v212 = 2050;
        uint64_t v213 = v143;
        __int16 v214 = 2050;
        uint64_t v215 = v139;
        __int16 v216 = 2050;
        uint64_t v217 = v138;
        __int16 v218 = 2050;
        uint64_t v219 = v136;
        __int16 v220 = 2050;
        uint64_t v221 = v135;
        __int16 v222 = 2050;
        uint64_t v223 = v134;
        __int16 v224 = 2050;
        uint64_t v225 = v106;
        __int16 v226 = 2050;
        uint64_t v227 = v108;
        __int16 v228 = 2050;
        uint64_t v229 = v110;
        __int16 v230 = 2050;
        uint64_t v231 = v112;
        __int16 v232 = 2050;
        uint64_t v233 = v115;
        __int16 v234 = 1026;
        int v235 = v132;
        __int16 v236 = 1026;
        *(_DWORD *)v237 = v117;
        *(_WORD *)&v237[4] = 2050;
        *(void *)&v237[6] = v120;
        *(_WORD *)&v237[14] = 2050;
        *(void *)&v237[16] = v123;
        __int16 v238 = 2050;
        uint64_t v239 = v126;
        __int16 v240 = 2050;
        uint64_t v241 = v127;
        __int16 v242 = 2050;
        unint64_t v243 = v133;
        __int16 v244 = 2050;
        uint64_t v245 = v2;
        _os_signpost_emit_with_name_impl(&dword_24F441000, v88, OS_SIGNPOST_EVENT, v89, "PresentedFrameStats", aSignpostIdIsSh_3, buf, 0x118u);
      }
    }
    [*(id *)(a1 + 40) reset];
    [*(id *)(a1 + 64) reset];
    [*(id *)(a1 + 48) reset];
    [*(id *)(a1 + 56) reset];
    [*(id *)(a1 + 72) reset];
    *(_DWORD *)(a1 + 12) = 0;
    [*(id *)(a1 + 80) reset];
    [*(id *)(a1 + 104) reset];
    [*(id *)(a1 + 88) reset];
    [*(id *)(a1 + 96) reset];
    [*(id *)(a1 + 112) reset];
    *(_DWORD *)(a1 + 16) = 0;
    [*(id *)(a1 + 120) reset];
    [*(id *)(a1 + 128) reset];
    [*(id *)(a1 + 136) reset];
    *(unsigned char *)(a1 + 10) = 0;
    id v128 = *(id *)(a1 + 192);
    if ([v128 count])
    {
    }
    else
    {
      uint64_t v129 = [*(id *)(a1 + 200) count];

      if (!v129 && *(unsigned char *)(a1 + 8))
      {
        *(unsigned char *)(a1 + 8) = 0;
        self;
        uint64_t v130 = gFPNeedsReportCount;
        if (gFPNeedsReportCount == 1)
        {
          v131 = _aggregationTimerSource();
          dispatch_suspend(v131);

          uint64_t v130 = gFPNeedsReportCount;
        }
        if (v130) {
          gFPNeedsReportCount = v130 - 1;
        }
      }
    }
  }
}

void __47__FPCAMetalLayerState__updateLayerState_block___block_invoke(void *a1)
{
  uint64_t v2 = +[FPCAMetalLayerState _layerStateForAddress:](a1[5], a1[6]);
  if (v2)
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else if (_shouldEmitErrorSignpost())
  {
    unint64_t v3 = _fpErrorHandle();
    unint64_t v4 = _fpErrorHandle();
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, (const void *)a1[6]);

    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3)) {
      _os_signpost_emit_unreliably_with_name_impl();
    }
  }
}

void __100__FPCAMetalLayerState_drawableLifetimeStart_drawableID_surfaceID_acquisitionWaitStart_acquiredTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 56);
    long long v19 = *(_OWORD *)(a1 + 40);
    os_signpost_id_t v5 = NSNumber;
    id v6 = *(id *)(a2 + 192);
    double v7 = [v5 numberWithUnsignedInteger:v3];
    double v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      if (_shouldEmitErrorSignpost())
      {
        BOOL v9 = _fpErrorHandle();
        v10 = v9;
        if ((unint64_t)(*(void *)(a2 + 176) - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          uint64_t v11 = v8[2];
          *(_DWORD *)id v20 = 134218240;
          *(void *)&v20[4] = v3;
          *(_WORD *)&v20[12] = 2048;
          *(void *)&v20[14] = v11;
          _os_signpost_emit_unreliably_with_name_impl();
        }
      }
    }
    else
    {
      v12 = [FPInFlightDrawableLifetime alloc];
      if (v12)
      {
        *(void *)id v20 = v12;
        *(void *)&v20[8] = FPInFlightDrawableLifetime;
        id v13 = (char *)objc_msgSendSuper2((objc_super *)v20, sel_init);
        double v8 = v13;
        if (v13)
        {
          *((void *)v13 + 2) = v3;
          *((_DWORD *)v13 + 2) = v4;
          *(_OWORD *)(v13 + 24) = v19;
          atomic_fetch_add(&gFPInFlightDrawableLifetimeCount, 1uLL);
          qword_26B1F5130 = mach_continuous_time();
          gHasRecentActiveDrawables = 1;
        }
      }
      else
      {
        double v8 = 0;
      }
    }
    uint64_t v14 = NSNumber;
    id v15 = *(id *)(a2 + 192);
    unint64_t v16 = [v14 numberWithUnsignedInteger:v3];
    [v15 setObject:v8 forKeyedSubscript:v16];

    if (!*(unsigned char *)(a2 + 8))
    {
      *(unsigned char *)(a2 + 8) = 1;
      self;
      uint64_t v17 = gFPNeedsReportCount;
      if (!gFPNeedsReportCount)
      {
        uint64_t v18 = _aggregationTimerSource();
        dispatch_resume(v18);

        qword_26B1F50D0 = mach_continuous_time();
        uint64_t v17 = gFPNeedsReportCount;
      }
      gFPNeedsReportCount = v17 + 1;
    }
  }
}

void __56__FPCAMetalLayerState_commandBufferCreate_creationTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  unint64_t v2 = *(void *)(a1 + 48);
  if (FPScaleMachTimestamp_onceToken != -1) {
    dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
  }
  double v3 = *(double *)&gTimebaseRatio;
  uint64_t v4 = self;
  if (v1)
  {
    if (!qword_26B1F5130) {
      goto LABEL_23;
    }
    uint64_t v5 = v4;
    uint64_t v6 = mach_continuous_time();
    unint64_t v7 = v6 - qword_26B1F5130;
    if (v6 <= qword_26B1F5130) {
      goto LABEL_9;
    }
    if (FPScaleMachTimestamp_onceToken != -1) {
      dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
    }
    if (*(double *)&gTimebaseRatio * (double)v7 < 5.0)
    {
LABEL_9:
      double v8 = v3 * (double)v2;
      BOOL v9 = +[FPCAMetalLayerState _commandBufferForAddress:](v5, (uint64_t)v1);
      if (v9 && _shouldEmitErrorSignpost())
      {
        v10 = _fpErrorHandle();
        uint64_t v11 = _fpErrorHandle();
        os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v1);

        if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10)) {
          _os_signpost_emit_unreliably_with_name_impl();
        }
      }
      id v13 = [[FPInFlightCommandBuffer alloc] initWithAddress:v1 creationTime:v8];
      self;
      uint64_t v14 = _FPGlobalInFlightCommandBufferDictionary();
      if (v13) {
        address = v13->_address;
      }
      else {
        address = 0;
      }
      unint64_t v16 = [NSNumber numberWithUnsignedLongLong:address];
      [v14 setObject:v13 forKeyedSubscript:v16];
    }
    else
    {
LABEL_23:
      gHasRecentActiveDrawables = 0;
      +[FPCAMetalLayerState _globalScheduledCommandBuffers]();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      [v19 removeAllObjects];
      uint64_t v18 = _FPGlobalInFlightCommandBufferDictionary();
      [v18 removeAllObjects];
    }
  }
  else if (_shouldEmitErrorSignpost())
  {
    uint64_t v17 = _fpErrorHandle();
    if (os_signpost_enabled(v17)) {
      _os_signpost_emit_unreliably_with_name_impl();
    }
  }
}

void __65__FPCAMetalLayerState_metalLayer_drawableID_clientPresentedTime___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = NSNumber;
    id v6 = *(id *)(a2 + 200);
    unint64_t v7 = [v5 numberWithUnsignedInteger:v3];
    double v8 = [v6 objectForKeyedSubscript:v7];

    BOOL v9 = NSNumber;
    id v10 = *(id *)(a2 + 192);
    uint64_t v11 = [v9 numberWithUnsignedInteger:v3];
    os_signpost_id_t v12 = [v10 objectForKeyedSubscript:v11];

    if (v12)
    {
      if (!v8)
      {
        v12[5] = v4;
        id v15 = NSNumber;
        id v16 = *(id *)(a2 + 200);
        uint64_t v17 = [v15 numberWithUnsignedInteger:v3];
        [v16 setObject:v12 forKeyedSubscript:v17];

        uint64_t v18 = *(void **)(a2 + 192);
        id v19 = NSNumber;
        id v20 = v18;
        uint64_t v21 = [v19 numberWithUnsignedInteger:v3];
        [v20 removeObjectForKey:v21];

        uint64_t v22 = +[FPCAMetalLayerState _globalScheduledCommandBuffers]();
        uint64_t v23 = [v22 copy];
        uint64_t v24 = (void *)v12[6];
        v12[6] = v23;

        [v22 removeAllObjects];
        goto LABEL_13;
      }
      if (_shouldEmitErrorSignpost())
      {
        id v13 = _fpErrorHandle();
        if (!os_signpost_enabled(v13))
        {
LABEL_11:

          goto LABEL_13;
        }
LABEL_10:
        _os_signpost_emit_unreliably_with_name_impl();
        goto LABEL_11;
      }
    }
    else if (_shouldEmitErrorSignpost())
    {
      uint64_t v14 = _fpErrorHandle();
      id v13 = v14;
      if ((unint64_t)(v3 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14)) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
LABEL_13:
  }
}

void __60__FPCAMetalLayerState_metalLayerSetPixelFormat_pixelFormat___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = NSNumber;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = a2;
  uint64_t v5 = [v2 numberWithUnsignedInteger:v3];
  id v6 = v5;
  if (v4)
  {
    objc_storeStrong(v4 + 21, v5);
    *((unsigned char *)v4 + 9) = 1;
  }
}

void __54__FPCAMetalLayerState_metalLayerSetSize_height_width___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
    uint64_t v5 = *(void **)(a2 + 152);
    *(void *)(a2 + 152) = v4;

    uint64_t v6 = [NSNumber numberWithUnsignedInteger:v3];
    unint64_t v7 = *(void **)(a2 + 160);
    *(void *)(a2 + 160) = v6;

    *(unsigned char *)(a2 + 9) = 1;
  }
}

void __55__FPCAMetalLayerState__updateCommandBufferState_block___block_invoke(void *a1)
{
  unint64_t v2 = +[FPCAMetalLayerState _commandBufferForAddress:](a1[5], a1[6]);
  if (v2)
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else if (_shouldEmitErrorSignpost())
  {
    uint64_t v3 = _fpErrorHandle();
    uint64_t v4 = _fpErrorHandle();
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, (const void *)a1[6]);

    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3)) {
      _os_signpost_emit_unreliably_with_name_impl();
    }
  }
}

void __54__FPCAMetalLayerState_commandBufferCommit_commitTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  unint64_t v4 = *(void *)(a1 + 32);
  if (FPScaleMachTimestamp_onceToken == -1)
  {
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  os_signpost_id_t v5 = v3;
  dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
  uint64_t v3 = v5;
  if (v5) {
LABEL_3:
  }
    v3[4] = *(double *)&gTimebaseRatio * (double)v4;
LABEL_4:
}

void __76__FPCAMetalLayerState_commandBufferScheduled_kernelStartTime_kernelEndTime___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = a2;
  os_signpost_id_t v5 = v4;
  if (FPScaleMachTimestamp_onceToken == -1)
  {
    if (v4)
    {
LABEL_3:
      v5[5] = *(double *)&gTimebaseRatio * (double)v3;
      void v5[6] = *(double *)&gTimebaseRatio * (double)*(unint64_t *)(a1 + 40);
    }
  }
  else
  {
    dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
    if (v5) {
      goto LABEL_3;
    }
  }
  BOOL v9 = v5;
  self;
  uint64_t v6 = _FPGlobalLayerStateDictionary();
  unint64_t v7 = [v6 count];
  if (v5) {
    *((unsigned char *)v9 + 8) = v7 > 1;
  }
  double v8 = +[FPCAMetalLayerState _globalScheduledCommandBuffers]();
  [v8 addObject:v9];
}

+ (id)_globalScheduledCommandBuffers
{
  self;
  if (qword_26B1F50C8 != -1) {
    dispatch_once(&qword_26B1F50C8, &__block_literal_global_65);
  }
  v0 = (void *)qword_26B1F50C0;

  return v0;
}

void __70__FPCAMetalLayerState_commandBufferCompleted_gpuStartTime_gpuEndTime___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = a1[4];
  id v11 = v3;
  if (v4 || a1[5])
  {
    if (FPScaleMachTimestamp_onceToken == -1)
    {
      if (v3)
      {
LABEL_5:
        *((double *)v3 + 7) = *(double *)&gTimebaseRatio * (double)v4;
        *((double *)v3 + 8) = *(double *)&gTimebaseRatio * (double)(unint64_t)a1[5];
      }
    }
    else
    {
      dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
      id v3 = v11;
      if (v11) {
        goto LABEL_5;
      }
    }
  }
  uint64_t v5 = a1[7];
  self;
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:v5];
  unint64_t v7 = _FPGlobalInFlightCommandBufferDictionary();
  double v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    BOOL v9 = _FPGlobalInFlightCommandBufferDictionary();
    id v10 = [NSNumber numberWithUnsignedLongLong:v5];
    [v9 removeObjectForKey:v10];
  }
}

+ (id)_layerStateForAddress:(uint64_t)a1
{
  self;
  id v3 = _FPGlobalLayerStateDictionary();
  unint64_t v4 = [NSNumber numberWithUnsignedLongLong:a2];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

+ (id)_commandBufferForAddress:(uint64_t)a1
{
  self;
  id v3 = _FPGlobalInFlightCommandBufferDictionary();
  unint64_t v4 = [NSNumber numberWithUnsignedLongLong:a2];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

+ (void)_updateLayerState:(void *)a3 block:
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = _FPLayerStateSyncQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__FPCAMetalLayerState__updateLayerState_block___block_invoke;
  block[3] = &unk_26532ACC8;
  uint64_t v10 = v5;
  uint64_t v11 = a2;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

+ (void)_updateCommandBufferState:(void *)a3 block:
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = _FPLayerStateSyncQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__FPCAMetalLayerState__updateCommandBufferState_block___block_invoke;
  block[3] = &unk_26532ACC8;
  uint64_t v10 = v5;
  uint64_t v11 = a2;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

void __142__FPCAMetalLayerState_drawableLifetimeEnd_imageQueueID_drawableID_drawableFinishedTime_wasPresented_targetCPUDeadline_targetPresentationTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v176 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  int v136 = *(unsigned __int8 *)(a1 + 68);
  id v139 = *(id *)(a1 + 32);
  id v7 = v5;
  if (a2)
  {
    double v8 = NSNumber;
    id v9 = *(id *)(a2 + 200);
    uint64_t v10 = [v8 numberWithUnsignedInteger:v4];
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      unint64_t v133 = v7;
      os_signpost_id_t v12 = NSNumber;
      id v13 = *(id *)(a2 + 200);
      uint64_t v14 = [v12 numberWithUnsignedInteger:v4];
      [v13 removeObjectForKey:v14];

      id v15 = *(void **)(a2 + 32);
      BOOL v16 = v15 == 0;
      if (v15 && [v15 unsignedLongLongValue] == v3)
      {
        BOOL v16 = 1;
      }
      else
      {
        uint64_t v17 = [NSNumber numberWithUnsignedInt:v3];
        objc_storeStrong((id *)(a2 + 32), v17);
      }
      id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v144 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      uint64_t v138 = v11;
      id v19 = v11[6];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v144 objects:v157 count:16];
      double v21 = 0.0;
      double v22 = 0.0;
      if (v20)
      {
        uint64_t v23 = v20;
        uint64_t v24 = *(void *)v145;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v145 != v24) {
              objc_enumerationMutation(v19);
            }
            uint64_t v26 = *(void *)(*((void *)&v144 + 1) + 8 * i);
            if (v26)
            {
              if (*(double *)(v26 + 56) != 0.0 && *(double *)(v26 + 64) != 0.0)
              {
                [v18 addObject:*(void *)(*((void *)&v144 + 1) + 8 * i)];
                if (v22 < *(double *)(v26 + 64)) {
                  double v22 = *(double *)(v26 + 64);
                }
              }
            }
          }
          uint64_t v23 = [v19 countByEnumeratingWithState:&v144 objects:v157 count:16];
        }
        while (v23);
      }

      id v27 = v18;
      double v28 = 0.0;
      double v29 = 0.0;
      if ([v27 count])
      {
        if ([v27 count] == 1)
        {
          uint64_t v30 = [v27 firstObject];
          if (v30)
          {
            double v21 = v30[7];
            double v28 = v30[8];
            double v29 = v28 - v21;
          }
          else
          {
            double v21 = 0.0;
          }

          goto LABEL_64;
        }
        [v27 sortUsingComparator:&__block_literal_global_146];
        long long v160 = 0u;
        long long v161 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        id v36 = v27;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v158 objects:buf count:16];
        double v21 = 0.0;
        if (!v37)
        {
          double v40 = 1.79769313e308;
          double v41 = 0.0;
          double v42 = 0.0;
          goto LABEL_59;
        }
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v159;
        double v40 = 1.79769313e308;
        double v41 = 0.0;
        double v42 = 0.0;
        while (1)
        {
          uint64_t v43 = 0;
          do
          {
            if (*(void *)v159 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v44 = *(void *)(*((void *)&v158 + 1) + 8 * v43);
            if (v44)
            {
              double v46 = *(double *)(v44 + 56);
              double v45 = *(double *)(v44 + 64);
              if (v40 >= v46) {
                double v40 = *(double *)(v44 + 56);
              }
              if (v28 < v45) {
                double v28 = *(double *)(v44 + 64);
              }
              if (v41 == 0.0 && v42 == 0.0) {
                goto LABEL_46;
              }
              if (v46 >= v42)
              {
                double v29 = v29 + v42 - v41;
LABEL_46:
                double v41 = *(double *)(v44 + 56);
                double v42 = *(double *)(v44 + 64);
                goto LABEL_47;
              }
            }
            else
            {
              double v45 = 0.0;
              double v40 = fmin(v40, 0.0);
              if (v28 < 0.0) {
                double v28 = 0.0;
              }
              if (v41 == 0.0 && v42 == 0.0)
              {
                double v41 = 0.0;
                double v42 = 0.0;
                goto LABEL_47;
              }
              if (v42 <= 0.0)
              {
                double v29 = v29 + v42 - v41;
                double v41 = 0.0;
                double v42 = 0.0;
                goto LABEL_47;
              }
            }
            if (v42 < v45) {
              double v42 = v45;
            }
LABEL_47:
            ++v43;
          }
          while (v38 != v43);
          uint64_t v47 = [v36 countByEnumeratingWithState:&v158 objects:buf count:16];
          uint64_t v38 = v47;
          if (!v47)
          {
LABEL_59:

            double v29 = v29 + v42 - v41;
            BOOL v48 = v40 == 1.79769313e308;
            if (v28 == 0.0) {
              BOOL v48 = 1;
            }
            if (v48) {
              double v28 = 0.0;
            }
            else {
              double v21 = v40;
            }
            break;
          }
        }
      }
LABEL_64:

      if (v139)
      {
        *(unsigned char *)(a2 + 10) = 1;
        [v139 doubleValue];
        double v50 = *((double *)v138 + 5);
        if (v50 > v49 + 0.001) {
          [*(id *)(a2 + 128) addDurationSec:v50 - v49];
        }
      }
      double v51 = *((double *)v138 + 4);
      long long v140 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      id v35 = v27;
      uint64_t v52 = [v35 countByEnumeratingWithState:&v140 objects:v156 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v141;
        do
        {
          uint64_t v55 = 0;
          do
          {
            if (*(void *)v141 != v54) {
              objc_enumerationMutation(v35);
            }
            uint64_t v56 = *(void *)(*((void *)&v140 + 1) + 8 * v55);
            if (v56) {
              double v57 = *(double *)(v56 + 24);
            }
            else {
              double v57 = 0.0;
            }
            if (v51 >= v57) {
              double v51 = v57;
            }
            ++v55;
          }
          while (v53 != v55);
          uint64_t v58 = [v35 countByEnumeratingWithState:&v140 objects:v156 count:16];
          uint64_t v53 = v58;
        }
        while (v58);
      }

      if (v136)
      {
        id v59 = *(id *)(a2 + 40);
        id v60 = *(id *)(a2 + 64);
        id v61 = *(id *)(a2 + 48);
        id v62 = *(id *)(a2 + 56);
        id v132 = *(id *)(a2 + 72);
        uint64_t v63 = -[FPCAMetalLayerState previousPresentedLifetimeEnd](*(double **)(a2 + 184));

        char v64 = !v16;
        if (!v63) {
          char v64 = 1;
        }
        if ((v64 & 1) == 0)
        {
          id v65 = -[FPCAMetalLayerState previousPresentedLifetimeEnd](*(double **)(a2 + 184));
          [v65 doubleValue];
          double v67 = v66 + 0.5;

          if (v51 <= v67)
          {
            id v68 = *(id *)(a2 + 120);
            uint64_t v69 = -[FPCAMetalLayerState previousPresentedLifetimeEnd](*(double **)(a2 + 184));
            [v69 doubleValue];
            [v68 addDurationSec:v6 - v70];
          }
        }
        *(void *)&long long v71 = v62;
        *((void *)&v71 + 1) = v60;
        long long v135 = v71;
        *(void *)&long long v71 = v59;
        *((void *)&v71 + 1) = v61;
        long long v134 = v71;
        v72 = v138;
        if (v133)
        {
          [v133 doubleValue];
          if (v73 + 0.001 < v6) {
            objc_msgSend(*(id *)(a2 + 136), "addDurationSec:", v6 - v73, v73 + 0.001);
          }
        }
      }
      else
      {
        id v74 = *(id *)(a2 + 80);
        id v75 = *(id *)(a2 + 104);
        id v76 = *(id *)(a2 + 88);
        id v77 = *(id *)(a2 + 96);
        id v132 = *(id *)(a2 + 112);
        *(void *)&long long v78 = v74;
        *((void *)&v78 + 1) = v76;
        long long v134 = v78;
        *(void *)&long long v78 = v77;
        *((void *)&v78 + 1) = v75;
        long long v135 = v78;
        v72 = v138;
      }
      [0 addDurationSec:*((double *)v72 + 5) - *((double *)v72 + 4)];
      [*((id *)&v135 + 1) addDurationSec:v29];
      if (v22 != 0.0) {
        [v132 addDurationSec:v6 - v22];
      }
      int v79 = [v35 count];
      uint64_t v80 = 12;
      if (!v136) {
        uint64_t v80 = 16;
      }
      *(_DWORD *)(a2 + v80) += v79;
      [(id)v134 addDurationSec:v6 - v51];
      [*((id *)&v134 + 1) addDurationSec:*((double *)v72 + 5) - v51];
      [(id)v135 addDurationSec:v28 - v21];
      if (!v136) {
        goto LABEL_107;
      }
      uint64_t v82 = (void **)(a2 + 184);
      uint64_t v81 = *(void **)(a2 + 184);
      if (v81)
      {
        if (!gFPPerFrameSignpostingIsEnabled)
        {
LABEL_104:
          uint64_t v100 = v81;
          int v101 = [v35 count];
          if (v100)
          {
            v100[2] = v101;
            *((double *)v100 + 2) = v51;
            *((void *)v100 + 3) = v72[3];
            *((void *)v100 + 4) = v72[4];
            *((void *)v100 + 5) = v72[5];
            *((double *)v100 + 6) = v21;
            *((double *)v100 + 7) = v28;
            *((double *)v100 + 8) = v6;
            *((double *)v100 + 9) = v29;
          }

LABEL_107:
          double v103 = *((double *)v72 + 4);
          double v102 = *((double *)v72 + 5);
          uint64_t v104 = objc_msgSend(*(id *)(a2 + 192), "allValues", v130);
          long long v152 = 0u;
          long long v153 = 0u;
          long long v154 = 0u;
          long long v155 = 0u;
          id v105 = v104;
          uint64_t v106 = [v105 countByEnumeratingWithState:&v152 objects:buf count:16];
          if (!v106) {
            goto LABEL_121;
          }
          uint64_t v107 = v106;
          uint64_t v108 = *(void *)v153;
          while (1)
          {
            uint64_t v109 = 0;
            do
            {
              if (*(void *)v153 != v108) {
                objc_enumerationMutation(v105);
              }
              uint64_t v110 = *(void *)(*((void *)&v152 + 1) + 8 * v109);
              if (v110)
              {
                if (*(double *)(v110 + 32) > v103) {
                  goto LABEL_116;
                }
                uint64_t v111 = *(void **)(a2 + 192);
                uint64_t v112 = *(void *)(v110 + 16);
                goto LABEL_115;
              }
              if (v103 >= 0.0)
              {
                uint64_t v112 = 0;
                uint64_t v111 = *(void **)(a2 + 192);
LABEL_115:
                id v113 = NSNumber;
                id v114 = v111;
                uint64_t v115 = [v113 numberWithUnsignedInteger:v112];
                [v114 removeObjectForKey:v115];
              }
LABEL_116:
              ++v109;
            }
            while (v107 != v109);
            uint64_t v116 = [v105 countByEnumeratingWithState:&v152 objects:buf count:16];
            uint64_t v107 = v116;
            if (!v116)
            {
LABEL_121:

              int v117 = [*(id *)(a2 + 200) allValues];
              long long v148 = 0u;
              long long v149 = 0u;
              long long v150 = 0u;
              long long v151 = 0u;
              id v118 = v117;
              uint64_t v119 = [v118 countByEnumeratingWithState:&v148 objects:&v158 count:16];
              if (!v119) {
                goto LABEL_135;
              }
              uint64_t v120 = v119;
              uint64_t v121 = *(void *)v149;
              while (1)
              {
                uint64_t v122 = 0;
                do
                {
                  if (*(void *)v149 != v121) {
                    objc_enumerationMutation(v118);
                  }
                  uint64_t v123 = *(void *)(*((void *)&v148 + 1) + 8 * v122);
                  if (v123)
                  {
                    if (*(double *)(v123 + 40) > v102) {
                      goto LABEL_130;
                    }
                    id v124 = *(void **)(a2 + 200);
                    uint64_t v125 = *(void *)(v123 + 16);
                    goto LABEL_129;
                  }
                  if (v102 >= 0.0)
                  {
                    uint64_t v125 = 0;
                    id v124 = *(void **)(a2 + 200);
LABEL_129:
                    uint64_t v126 = NSNumber;
                    id v127 = v124;
                    id v128 = [v126 numberWithUnsignedInteger:v125];
                    [v127 removeObjectForKey:v128];
                  }
LABEL_130:
                  ++v122;
                }
                while (v120 != v122);
                uint64_t v129 = [v118 countByEnumeratingWithState:&v148 objects:&v158 count:16];
                uint64_t v120 = v129;
                if (!v129)
                {
LABEL_135:

                  id v7 = v133;
                  uint64_t v11 = v138;
                  goto LABEL_136;
                }
              }
            }
          }
        }
        id v83 = _fpStateHandle();
        uint64_t v84 = (FPOnGlassCAMetalLayerDrawableInterval *)v83;
        os_signpost_id_t v85 = *(void *)(a2 + 176);
        if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
        {
          v87 = (char *)*v82;
          if (*v82)
          {
            int v88 = *((_DWORD *)v87 + 2);
            os_signpost_id_t v89 = (const double *)(v87 + 16);
            float64x2_t v90 = *((float64x2_t *)v87 + 3);
            *(void *)&long long v86 = *((void *)v87 + 8);
            double v91 = *((double *)v87 + 9) * 1000.0;
            float64x2_t v92 = (float64x2_t)vextq_s8((int8x16_t)v90, (int8x16_t)v90, 8uLL);
            *(void *)&v90.f64[0] = v86;
            long long v130 = v86;
            *(void *)&v93.f64[0] = v86;
            v93.f64[1] = *((float64_t *)v87 + 5);
            float64x2_t v94 = vld1q_dup_f64(v89);
            float64x2_t v95 = vsubq_f64(v90, v92);
            float64x2_t v96 = vsubq_f64(v93, v94);
            float64x2_t v97 = (float64x2_t)vdupq_n_s64(0x408F400000000000uLL);
            float64x2_t v131 = vmulq_f64(v96, v97);
            float64x2_t v137 = vmulq_f64(v95, v97);
          }
          else
          {
            int v88 = 0;
            float64x2_t v137 = 0u;
            double v91 = 0.0;
            long long v130 = 0u;
            float64x2_t v131 = 0u;
          }
          uint64_t v98 = v87;
          *(void *)&long long v130 = FPTimeIntervalToMachContinuousRescaled(*(double *)&v130);
          unint64_t v99 = FPTimeIntervalToMachContinuousRescaled(v6);
          *(_DWORD *)buf = 67241984;
          *(_DWORD *)id v163 = v88;
          *(_WORD *)&v163[4] = 2050;
          *(float64_t *)&v163[6] = v131.f64[0];
          __int16 v164 = 2050;
          float64_t v165 = v131.f64[1];
          __int16 v166 = 2050;
          float64_t v167 = v137.f64[1];
          __int16 v168 = 2050;
          double v169 = v91;
          __int16 v170 = 2050;
          float64_t v171 = v137.f64[0];
          __int16 v172 = 2050;
          uint64_t v173 = v130;
          __int16 v174 = 2050;
          unint64_t v175 = v99;
          _os_signpost_emit_with_name_impl(&dword_24F441000, &v84->super, OS_SIGNPOST_EVENT, v85, "OnGlassDrawableInterval", "Signpost ID is CAMetalLayer ID\nCommand Buffer Count = %{public, name=command_buffer_count}u\nIn-Flight Total End-to-end = %{public, name=inflight_end_to_end_total_ms}.3fms\nIn-Flight CPU End-to-end = %{public, name=inflight_end_to_end_cpu_ms}.3fms\nIn-Flight GPU End-to-end = %{public, name=inflight_end_to_end_gpu_ms}.3fms\nTotal On-GPU Time = %{public, name=inflight_on_gpu_ms}.3fms\nWait to land on glass = %{public, name=inflight_wait_for_glass_ms}.3fms\n%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", buf, 0x4Eu);
        }
      }
      else
      {
        uint64_t v84 = objc_alloc_init(FPOnGlassCAMetalLayerDrawableInterval);
        objc_storeStrong((id *)(a2 + 184), v84);
      }

      uint64_t v81 = *v82;
      goto LABEL_104;
    }
    if (_shouldEmitErrorSignpost())
    {
      uint64_t v31 = _fpErrorHandle();
      if (os_signpost_enabled(v31))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)id v163 = v4;
        _os_signpost_emit_unreliably_with_name_impl();
      }
    }
    uint64_t v32 = NSNumber;
    id v33 = *(id *)(a2 + 192);
    uint64_t v34 = [v32 numberWithUnsignedInteger:v4];
    [v33 removeObjectForKey:v34];

    +[FPCAMetalLayerState _globalScheduledCommandBuffers]();
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    [v35 removeAllObjects];
LABEL_136:
  }
}

- (double)previousPresentedLifetimeEnd
{
  if (a1)
  {
    a1 = [NSNumber numberWithDouble:a1[8]];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __39__FPCAMetalLayerState_metalLayerAlloc___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  uint64_t v2 = self;
  if (v1)
  {
    uint64_t v3 = +[FPCAMetalLayerState _layerStateForAddress:](v2, (uint64_t)v1);
    if (v3 && _shouldEmitErrorSignpost())
    {
      uint64_t v4 = _fpErrorHandle();
      uint64_t v5 = _fpErrorHandle();
      os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v1);

      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
      {
        LOWORD(v45.receiver) = 0;
        _os_signpost_emit_unreliably_with_name_impl();
      }
    }
    id v7 = [FPCAMetalLayerState alloc];
    if (v7)
    {
      v45.receiver = v7;
      v45.super_class = (Class)FPCAMetalLayerState;
      double v8 = objc_msgSendSuper2(&v45, sel_init);
      id v9 = v8;
      if (v8)
      {
        v8[3] = v1;
        id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v11 = (void *)v9[24];
        v9[24] = v10;

        id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v13 = (void *)v9[25];
        v9[25] = v12;

        uint64_t v14 = _fpErrorHandle();
        v9[22] = os_signpost_id_make_with_pointer(v14, v1);

        id v15 = objc_alloc_init(FPDurationStatistics);
        BOOL v16 = (void *)v9[5];
        v9[5] = v15;

        uint64_t v17 = objc_alloc_init(FPDurationStatistics);
        id v18 = (void *)v9[8];
        v9[8] = v17;

        id v19 = objc_alloc_init(FPDurationStatistics);
        uint64_t v20 = (void *)v9[6];
        v9[6] = v19;

        double v21 = objc_alloc_init(FPDurationStatistics);
        double v22 = (void *)v9[7];
        v9[7] = v21;

        uint64_t v23 = objc_alloc_init(FPDurationStatistics);
        uint64_t v24 = (void *)v9[9];
        v9[9] = v23;

        uint64_t v25 = objc_alloc_init(FPDurationStatistics);
        uint64_t v26 = (void *)v9[10];
        v9[10] = v25;

        id v27 = objc_alloc_init(FPDurationStatistics);
        double v28 = (void *)v9[13];
        v9[13] = v27;

        double v29 = objc_alloc_init(FPDurationStatistics);
        uint64_t v30 = (void *)v9[11];
        v9[11] = v29;

        uint64_t v31 = objc_alloc_init(FPDurationStatistics);
        uint64_t v32 = (void *)v9[12];
        v9[12] = v31;

        id v33 = objc_alloc_init(FPDurationStatistics);
        uint64_t v34 = (void *)v9[14];
        v9[14] = v33;

        id v35 = objc_alloc_init(FPDurationStatistics);
        id v36 = (void *)v9[15];
        v9[15] = v35;

        uint64_t v37 = objc_alloc_init(FPDurationStatistics);
        uint64_t v38 = (void *)v9[16];
        v9[16] = v37;

        uint64_t v39 = objc_alloc_init(FPDurationStatistics);
        double v40 = (void *)v9[17];
        v9[17] = v39;

        uint64_t v41 = mach_continuous_time();
        v9[26] = v41;
        v9[27] = v41;
        *((unsigned char *)v9 + 9) = 1;
        atomic_fetch_add((atomic_ullong *volatile)&gFPLayerCount, 1uLL);
        _MergedGlobals_0 = 1;
      }
    }
    else
    {
      id v9 = 0;
    }
    double v42 = v9;
    self;
    uint64_t v43 = _FPGlobalLayerStateDictionary();
    uint64_t v44 = [NSNumber numberWithUnsignedLongLong:v1];
    [v43 setObject:v42 forKeyedSubscript:v44];

LABEL_12:
    goto LABEL_13;
  }
  if (_shouldEmitErrorSignpost())
  {
    uint64_t v3 = _fpErrorHandle();
    if (os_signpost_enabled(v3))
    {
      LOWORD(v45.receiver) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }
    goto LABEL_12;
  }
LABEL_13:
  if (qword_26B1F5138 != -1)
  {
    dispatch_once(&qword_26B1F5138, &__block_literal_global_148);
  }
}

+ (void)metalLayerSetPixelFormat:(uint64_t)a3 pixelFormat:
{
  uint64_t v5 = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__FPCAMetalLayerState_metalLayerSetPixelFormat_pixelFormat___block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__FPCAMetalLayerState_8l;
  v6[4] = a3;
  +[FPCAMetalLayerState _updateLayerState:block:](v5, a2, v6);
}

uint64_t __62__FPCAMetalLayerState__reportProcessPerformanceStatsIfNeeded___block_invoke()
{
  uint64_t result = getpid();
  dword_26B1F506C = result;
  return result;
}

+ (void)metalLayerSetSize:(uint64_t)a3 height:(uint64_t)a4 width:
{
  uint64_t v7 = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__FPCAMetalLayerState_metalLayerSetSize_height_width___block_invoke;
  v8[3] = &__block_descriptor_48_e29_v16__0__FPCAMetalLayerState_8l;
  v8[4] = a3;
  void v8[5] = a4;
  +[FPCAMetalLayerState _updateLayerState:block:](v7, a2, v8);
}

uint64_t __53__FPCAMetalLayerState__globalScheduledCommandBuffers__block_invoke()
{
  qword_26B1F50C0 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF980]);

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  acquiredInFlightDrawables = self->_acquiredInFlightDrawables;
  self->_acquiredInFlightDrawables = 0;

  clientPresentedInFlightDrawables = self->_clientPresentedInFlightDrawables;
  self->_clientPresentedInFlightDrawables = 0;

  -[FPCAMetalLayerState _reportState]((uint64_t)self);
  atomic_fetch_add((atomic_ullong *volatile)&gFPLayerCount, 0xFFFFFFFFFFFFFFFFLL);
  v5.receiver = self;
  v5.super_class = (Class)FPCAMetalLayerState;
  [(FPCAMetalLayerState *)&v5 dealloc];
}

+ (void)metalLayerDealloc:(uint64_t)a1
{
  uint64_t v3 = self;
  uint64_t v4 = _FPLayerStateSyncQueue();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__FPCAMetalLayerState_metalLayerDealloc___block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = v3;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __41__FPCAMetalLayerState_metalLayerDealloc___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  self;
  _FPGlobalLayerStateDictionary();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [NSNumber numberWithUnsignedLongLong:v1];
  [v3 removeObjectForKey:v2];
}

+ (void)metalLayerSetNameOfLayer:(void *)a3 name:
{
  id v4 = a3;
  uint64_t v5 = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__FPCAMetalLayerState_metalLayerSetNameOfLayer_name___block_invoke;
  v7[3] = &unk_26532AD30;
  id v8 = v4;
  id v6 = v4;
  +[FPCAMetalLayerState _updateLayerState:block:](v5, a2, v7);
}

void __53__FPCAMetalLayerState_metalLayerSetNameOfLayer_name___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = v3;
  if (a2)
  {
    objc_storeStrong((id *)(a2 + 144), v3);
    *(unsigned char *)(a2 + 9) = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientPresentedInFlightDrawables, 0);
  objc_storeStrong((id *)&self->_acquiredInFlightDrawables, 0);
  objc_storeStrong((id *)&self->_previousDrawableOnGlassDrawable, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_onGlassPresentationLatenessStats, 0);
  objc_storeStrong((id *)&self->_clientPresentationLatenessStats, 0);
  objc_storeStrong((id *)&self->_onScreenStats, 0);
  objc_storeStrong((id *)&self->_skippedGPUFinishToPresentLatency, 0);
  objc_storeStrong((id *)&self->_skippedOnGPUTimeStats, 0);
  objc_storeStrong((id *)&self->_skippedGPUWalltimeStats, 0);
  objc_storeStrong((id *)&self->_skippedCPUWalltimeStats, 0);
  objc_storeStrong((id *)&self->_skippedEndToEndDrawableLifetimeStats, 0);
  objc_storeStrong((id *)&self->_presentedGPUFinishToPresentLatency, 0);
  objc_storeStrong((id *)&self->_presentedOnGPUTimeStats, 0);
  objc_storeStrong((id *)&self->_presentedGPUWalltimeStats, 0);
  objc_storeStrong((id *)&self->_presentedCPUWalltimeStats, 0);
  objc_storeStrong((id *)&self->_presentedEndToEndDrawableLifetimeStats, 0);

  objc_storeStrong((id *)&self->_imageQueueID, 0);
}

@end