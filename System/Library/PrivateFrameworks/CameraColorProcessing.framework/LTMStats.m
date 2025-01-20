@interface LTMStats
- (LTMStats)initWithMetalContext:(id)a3;
- (int)allocateResources;
- (int)calculateHITHStatistics:(id)a3 ltmGeometry:(id)a4 optimized:(BOOL)a5 enableAntiAliasing:(BOOL)a6 calcGlobalHistOnROI:(BOOL)a7 toDriverInputMetadata:(sRefDriverInputs *)a8 andProcHITHStat:(sCLRProcHITHStat *)a9;
- (int)finishCalculateHITHStatistics:(sCLRProcHITHStat *)a3 optimized:(BOOL)a4;
- (int)prewarmShaders;
- (int)purgeResources;
- (int)startCalculateHITHStatistics:(id)a3 ltmGeometry:(id)a4 inputDriverMetadata:(sRefDriverInputs *)a5 optimized:(BOOL)a6 enableAntiAliasing:(BOOL)a7 calcGlobalHistOnROI:(BOOL)a8 outputProcHITHStat:(sCLRProcHITHStat *)a9;
- (void)fillProcHITHStat:(sCLRProcHITHStat *)a3 with:(id *)a4;
@end

@implementation LTMStats

- (LTMStats)initWithMetalContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LTMStats;
  v6 = [(LTMStats *)&v13 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_metalContext, a3), v7->_metalContext)
    && (v8 = [[LTMStatsCompute alloc] initWithMetalContext:v5], computeLTMStats = v7->_computeLTMStats, v7->_computeLTMStats = v8, computeLTMStats, v7->_computeLTMStats))
  {
    v10 = v7;
  }
  else
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
  }

  return v10;
}

- (int)calculateHITHStatistics:(id)a3 ltmGeometry:(id)a4 optimized:(BOOL)a5 enableAntiAliasing:(BOOL)a6 calcGlobalHistOnROI:(BOOL)a7 toDriverInputMetadata:(sRefDriverInputs *)a8 andProcHITHStat:(sCLRProcHITHStat *)a9
{
  BOOL v9 = a5;
  int result = [(LTMStats *)self startCalculateHITHStatistics:a3 ltmGeometry:a4 inputDriverMetadata:a8 optimized:a5 enableAntiAliasing:a6 calcGlobalHistOnROI:a7 outputProcHITHStat:a9];
  if (!result)
  {
    return [(LTMStats *)self finishCalculateHITHStatistics:a9 optimized:v9];
  }
  return result;
}

- (int)startCalculateHITHStatistics:(id)a3 ltmGeometry:(id)a4 inputDriverMetadata:(sRefDriverInputs *)a5 optimized:(BOOL)a6 enableAntiAliasing:(BOOL)a7 calcGlobalHistOnROI:(BOOL)a8 outputProcHITHStat:(sCLRProcHITHStat *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  if (!v15
    || (FigMetalIsValid() & 1) == 0
    || ([(FigMetalContext *)self->_metalContext commandQueue],
        v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        !v17))
  {
    v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    goto LABEL_15;
  }
  int v18 = [(LTMStatsCompute *)self->_computeLTMStats computeInputParametersForImageWidth:v16 calcGlobalHistOnROI:v9 enableAntiAliasing:v10 with:a5 to:&self->_params];
  if (!v18)
  {
    memcpy(__dst, &self->_params, sizeof(__dst));
    [(LTMStats *)self fillProcHITHStat:a9 with:__dst];
    v19 = [(FigMetalContext *)self->_metalContext device];
    v20 = (MTLBuffer *)[v19 newBufferWithLength:13056 options:0];
    localHistBuffer = self->_localHistBuffer;
    self->_localHistBuffer = v20;

    if (self->_localHistBuffer)
    {
      v22 = [(FigMetalContext *)self->_metalContext device];
      v23 = (MTLBuffer *)[v22 newBufferWithLength:4096 options:0];
      globalHistBuffer = self->_globalHistBuffer;
      self->_globalHistBuffer = v23;

      if (self->_globalHistBuffer)
      {
        v25 = [(FigMetalContext *)self->_metalContext device];
        v26 = (MTLBuffer *)[v25 newBufferWithLength:17680 options:0];
        thumbnailBuffer = self->_thumbnailBuffer;
        self->_thumbnailBuffer = v26;

        if (self->_thumbnailBuffer)
        {
          v29 = self->_localHistBuffer;
          v28 = self->_globalHistBuffer;
          computeLTMStats = self->_computeLTMStats;
          p_params = &self->_params;
          if (v11) {
            int v18 = -[LTMStatsCompute encodeLTMStatisticsCalculationOptimized:params:globalHistogram:localHistogram:thumbnail:](computeLTMStats, "encodeLTMStatisticsCalculationOptimized:params:globalHistogram:localHistogram:thumbnail:", v15, p_params, v28, v29);
          }
          else {
            int v18 = -[LTMStatsCompute encodeLTMStatisticsCalculationPrecise:paramsGlobalHist:globalHistogram:localHistogram:thumbnail:](computeLTMStats, "encodeLTMStatisticsCalculationPrecise:paramsGlobalHist:globalHistogram:localHistogram:thumbnail:", v15, p_params, v28, v29);
          }
          goto LABEL_11;
        }
      }
    }
    v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
LABEL_15:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v32 = -1;
    goto LABEL_12;
  }
LABEL_11:
  int v32 = v18;
LABEL_12:

  return v32;
}

- (int)finishCalculateHITHStatistics:(sCLRProcHITHStat *)a3 optimized:(BOOL)a4
{
  [(LTMStatsCompute *)self->_computeLTMStats waitUntilCompleted];
  if (a4)
  {
    for (uint64_t i = 0; i != 4420; ++i)
      *((_WORD *)a3->thumbnailStat + i) = *(_DWORD *)([(MTLBuffer *)self->_thumbnailBuffer contents] + 4 * i);
  }
  else
  {
    for (uint64_t j = 0; j != 4420; ++j)
      *((_WORD *)a3->thumbnailStat + j) = (self->_params.thumbnail.ThumbAvgRecipNumPix
                                         * (unint64_t)*(unsigned int *)([(MTLBuffer *)self->_thumbnailBuffer contents]+ 4 * j)) >> 32;
  }
  for (uint64_t k = 0; k != 3264; ++k)
    *((_WORD *)a3->localHistStat + k) = *(_DWORD *)([(MTLBuffer *)self->_localHistBuffer contents] + 4 * k);
  for (uint64_t m = 0; m != 4096; m += 4)
    *(_DWORD *)((char *)a3->globalHistStat + m) = *(_DWORD *)([(MTLBuffer *)self->_globalHistBuffer contents]
                                                            + m);
  globalHistBuffer = self->_globalHistBuffer;
  self->_globalHistBuffer = 0;

  localHistBuffer = self->_localHistBuffer;
  self->_localHistBuffer = 0;

  thumbnailBuffer = self->_thumbnailBuffer;
  self->_thumbnailBuffer = 0;

  return 0;
}

- (void)fillProcHITHStat:(sCLRProcHITHStat *)a3 with:(id *)a4
{
  a3->thumbnailWindow = a4->var3.var3 - a4->var3.var1 + ((a4->var3.var2 - a4->var3.var0) << 16);
  a3->thumbnailDownsampleX = a4->var3.var4;
  a3->thumbnailDownsampleY = a4->var3.var5;
  unsigned int var3 = a4->var2.var3;
  unsigned int var4 = a4->var2.var4;
  unsigned int v6 = a4->var2.var6 - var4 + ((a4->var2.var5 - var3) << 16);
  a3->thumbnailTotal = 5;
  a3->localHistWindow = v6;
  *(_DWORD *)&a3->localHistEnable = 4456449;
  unsigned int var10 = a4->var2.var10;
  int var9 = (unsigned __int16)a4->var2.var9;
  a3->localHistBlockSizeX = a4->var2.var9;
  int v9 = (unsigned __int16)var10;
  a3->localHistBlockSizeY = var10;
  unsigned int var8 = a4->var2.var8;
  a3->localHistStrideX = a4->var2.var7;
  a3->localHistStrideY = var8;
  *(_DWORD *)&a3->localHistNumHorBlocks = 393224;
  a3->globalHistEnable = 1;
  unsigned int var5 = a4->var1.var5;
  unsigned int v12 = a4->var1.var3;
  unsigned int v13 = a4->var1.var4 - a4->var1.var2;
  unsigned int var2 = a4->var2.var2;
  a3->localHistCountBitShift = var2;
  a3->globalHistWindow = var5 - v12 + (v13 << 16);
  a3->gridOriginX = var3;
  a3->gridOriginY = var4;
  a3->localHistogramOriginalTilePixelCount = (v9 * var9) >> var2 >> 1;
  *(void *)&a3->localHistLowThreshold = *(void *)&a4->var2.var13;
}

- (int)allocateResources
{
  return 0;
}

- (int)purgeResources
{
  return 0;
}

- (int)prewarmShaders
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailBuffer, 0);
  objc_storeStrong((id *)&self->_globalHistBuffer, 0);
  objc_storeStrong((id *)&self->_localHistBuffer, 0);
  objc_storeStrong((id *)&self->_computeLTMStats, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end