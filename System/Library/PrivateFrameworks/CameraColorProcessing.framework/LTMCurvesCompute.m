@interface LTMCurvesCompute
- (LTMCurvesCompute)initWith:(sRefDriverInputs *)a3 HITH:(sCLRProcHITHStat *)a4 geometryData:(id)a5 statsObj:(id)a6 optimized:(BOOL)a7 digitalFlash:(BOOL)a8 computeHDRCurves:(BOOL)a9 computeCurvesWoFaceBoost:(BOOL)a10;
- (id)compute;
@end

@implementation LTMCurvesCompute

- (LTMCurvesCompute)initWith:(sRefDriverInputs *)a3 HITH:(sCLRProcHITHStat *)a4 geometryData:(id)a5 statsObj:(id)a6 optimized:(BOOL)a7 digitalFlash:(BOOL)a8 computeHDRCurves:(BOOL)a9 computeCurvesWoFaceBoost:(BOOL)a10
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v16 = a5;
  id v17 = a6;
  v34.receiver = self;
  v34.super_class = (Class)LTMCurvesCompute;
  v18 = [(LTMCurvesCompute *)&v34 init];
  if (!v18) {
    goto LABEL_6;
  }
  uint64_t v19 = objc_opt_new();
  computeLTM = v18->_computeLTM;
  v18->_computeLTM = (LTMComputeRef *)v19;

  if (!v18->_computeLTM) {
    goto LABEL_6;
  }
  uint64_t v21 = objc_opt_new();
  driverLTM = v18->_driverLTM;
  v18->_driverLTM = (LTMDriverRef *)v21;

  if (v18->_driverLTM)
  {
    memcpy(&v18->_driverInputMetadata, a3, 0x6B0uLL);
    v18->_isDigitalFlash = a8;
    v18->_computeHDRCurves = a9;
    v18->_computeCurvesWoFaceBoost = a10;
    uint64_t v23 = [v16 copy];
    geometryData = v18->_geometryData;
    v18->_geometryData = (LTMGeometryData *)v23;

    long long v25 = *(_OWORD *)&a4->thumbnailWindow;
    long long v26 = *(_OWORD *)&a4->thumbnailDownsampleX;
    long long v27 = *(_OWORD *)&a4->localHistBlockSizeX;
    *(_OWORD *)&v18->_procHITHStat.globalHistWindow = *(_OWORD *)&a4->globalHistWindow;
    long long v28 = *(_OWORD *)&a4->globalHistOffset;
    long long v29 = *(_OWORD *)&a4->localHistogramOriginalTilePixelCount;
    long long v30 = *(_OWORD *)&a4->localHistOffset;
    *(_OWORD *)&v18->_procHITHStat.thumbnailOffset = *(_OWORD *)&a4->thumbnailOffset;
    *(_OWORD *)&v18->_procHITHStat.localHistOffset = v30;
    *(_OWORD *)&v18->_procHITHStat.localHistBlockSizeX = v27;
    *(_OWORD *)&v18->_procHITHStat.thumbnailDownsampleX = v26;
    *(_OWORD *)&v18->_procHITHStat.thumbnailWindow = v25;
    *(_OWORD *)&v18->_procHITHStat.localHistogramOriginalTilePixelCount = v29;
    *(_OWORD *)&v18->_procHITHStat.globalHistOffset = v28;
    v18->_procHITHStat.thumbnailStat = v18->_thumbnailStat;
    v18->_procHITHStat.localHistStat = v18->_localHistStat;
    v18->_procHITHStat.globalHistStat = v18->_globalHistStat;
    objc_storeStrong((id *)&v18->_ltmStats, a6);
    v18->_optimized = a7;
    v31 = v18;
  }
  else
  {
LABEL_6:
    v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v31 = 0;
  }

  return v31;
}

- (id)compute
{
  p_optimized = (unsigned __int8 *)&self->_optimized;
  if (self->_LTMIsReady)
  {
    v3 = 0;
LABEL_18:
    id v6 = v3;
    v3 = v6;
    goto LABEL_19;
  }
  [(LTMStats *)self->_ltmStats finishCalculateHITHStatistics:&self->_procHITHStat optimized:*p_optimized];
  v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (![(LTMDriverRef *)self->_driverLTM computeLtmComputeInput:&self->_procHITHStat withMetadata:&self->_driverInputMetadata to:&self->_computeInputs computeInputMetadata:&self->_computeInputsMetadata]&& ![(LTMComputeRef *)self->_computeLTM computeLTM:&self->_computeInputs withMetadata:&self->_computeInputsMetadata to:&self->_computeOutput])
  {
    v3 = +[LTMMetadataWriter createLTMMetadataFromLTMOutput:&self->_computeOutput statistics:&self->_procHITHStat driverInputMetadata:&self->_driverInputMetadata geometryData:self->_geometryData];
    if (v3)
    {
      if (!self->_computeHDRCurves)
      {
LABEL_11:
        if (!self->_computeCurvesWoFaceBoost)
        {
LABEL_15:
          if (*v5 == 1) {
            kdebug_trace();
          }
          p_optimized[1] = 1;
          goto LABEL_18;
        }
        self->_driverInputMetadata.forceDisableFaceBoost = 1;
        self->_driverInputMetadata.faceExpRatioFiltered = 1.0;
        self->_driverInputMetadata.gammaCurve = 0;
        if (![(LTMDriverRef *)self->_driverLTM computeLtmComputeInput:&self->_procHITHStat withMetadata:&self->_driverInputMetadata to:&self->_computeInputs computeInputMetadata:&self->_computeInputsMetadata]&& ![(LTMComputeRef *)self->_computeLTM computeLTM:&self->_computeInputs withMetadata:&self->_computeInputsMetadata to:&self->_computeOutput])
        {
          +[LTMMetadataWriter addLTMMetadataTo:v3 curvesType:2 fromLTMOutput:&self->_computeOutput statistics:&self->_procHITHStat driverInputMetadata:&self->_driverInputMetadata geometryData:self->_geometryData];
          goto LABEL_15;
        }
        goto LABEL_22;
      }
      self->_computeInputsMetadata.gammaCurve = 1;
      if (![(LTMComputeRef *)self->_computeLTM computeLTM:&self->_computeInputs withMetadata:&self->_computeInputsMetadata to:&self->_computeOutput])
      {
        +[LTMMetadataWriter addLTMMetadataTo:v3 curvesType:1 fromLTMOutput:&self->_computeOutput statistics:&self->_procHITHStat driverInputMetadata:&self->_driverInputMetadata geometryData:self->_geometryData];
        goto LABEL_11;
      }
    }
LABEL_22:
    id v6 = 0;
    goto LABEL_19;
  }
  id v6 = 0;
  v3 = 0;
LABEL_19:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometryData, 0);
  objc_storeStrong((id *)&self->_ltmStats, 0);
  objc_storeStrong((id *)&self->_driverLTM, 0);
  objc_storeStrong((id *)&self->_computeLTM, 0);
}

@end