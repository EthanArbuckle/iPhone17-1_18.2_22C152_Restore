@interface LTMProcessor
- (BOOL)_isOptimized:(int)a3;
- (CMIExternalMemoryResource)externalMemoryResource;
- (LTMIBPParams)ltmParams;
- (LTMProcessor)initWithCommandQueue:(id)a3;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (id)_applyGlobalCCM:(__n128)a3 globalCCM:(__n128)a4;
- (id)_compressHighlight:(id)a3;
- (id)_dehaze:(id)a3 hazeValues:;
- (id)createIntermediateRGBAMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (id)createLTMComputer;
- (id)createLTMInTextureFromLuma:(id)a3 chroma:(id)a4;
- (id)createLTMInTextureFromRGBAFloatTex:(id)a3;
- (id)generateLinearRGBATexture;
- (int)createShaders:(id)a3;
- (int)finishProcessing;
- (int)getLTMTuningFromTuningParams:(LTMTuning *)a3 from:(id)a4;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setDehazeTuningParamsFrom:(id)a3;
- (int)setLTMComputeTuningParams:(sRefDriverInputs *)a3 from:(id)a4;
- (int)setLTMTuningParamsFrom:(id)a3;
- (int)setup;
- (sCLRProcHITHStat)getHITHStat;
- (void)_prepareHighlightCompressionCurve;
- (void)_readDefaultsDehaze;
- (void)_readDefaultsLTMparam;
- (void)_readDefaultsMetalAllocator;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setExternalMemoryResource:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation LTMProcessor

- (LTMProcessor)initWithCommandQueue:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  FigKTraceInit();
  v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v32.receiver = self;
  v32.super_class = (Class)LTMProcessor;
  v6 = [(LTMProcessor *)&v32 init];
  if (!v6
    || (FigNote_AllowInternalDefaultLogs(),
        fig_note_initialize_category_with_default_work(),
        fig_note_initialize_category_with_default_work(),
        [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v8 = 0;
    goto LABEL_20;
  }
  v8 = (void *)v7;
  uint64_t v9 = [objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v7 andOptionalCommandQueue:v4];
  metalContext = v6->_metalContext;
  v6->_metalContext = (FigMetalContext *)v9;

  if (!v6->_metalContext) {
    goto LABEL_19;
  }
  id v11 = objc_alloc(MEMORY[0x263F2EE10]);
  v12 = [(FigMetalContext *)v6->_metalContext device];
  v13 = (void *)[v11 initWithDevice:v12 allocatorType:2];
  [(FigMetalContext *)v6->_metalContext setAllocator:v13];

  v14 = [(FigMetalContext *)v6->_metalContext allocator];

  if (!v14) {
    goto LABEL_19;
  }
  p_computeLTM = (void **)&v6->_computeLTM;
  [(LTMProcessor *)v6 _readDefaultsMetalAllocator];
  uint64_t v16 = objc_opt_new();
  ltmParams = v6->_ltmParams;
  v6->_ltmParams = (LTMIBPParams *)v16;

  if (!v6->_ltmParams) {
    goto LABEL_19;
  }
  uint64_t v18 = objc_opt_new();
  metadataExtractor = v6->_metadataExtractor;
  v6->_metadataExtractor = (LTMExtractMetadata *)v18;

  if (!v6->_metadataExtractor) {
    goto LABEL_19;
  }
  bzero(&v6->_driverInputMetadata.exposureTime, 0x6B0uLL);
  *(_OWORD *)&v6->_procHITHStat.globalHistWindow = 0u;
  *(_OWORD *)&v6->_procHITHStat.thumbnailOffset = 0u;
  *(_OWORD *)&v6->_procHITHStat.localHistOffset = 0u;
  *(_OWORD *)&v6->_procHITHStat.globalHistOffset = 0u;
  *(_OWORD *)&v6->_procHITHStat.localHistogramOriginalTilePixelCount = 0u;
  *(_OWORD *)&v6->_procHITHStat.localHistBlockSizeX = 0u;
  *(_OWORD *)&v6->_procHITHStat.thumbnailDownsampleX = 0u;
  *(_OWORD *)&v6->_procHITHStat.thumbnailWindow = 0u;
  v6->_procHITHStat.thumbnailStat = v6->thumbnailStat;
  *(void *)&v6->_procHITHStat.thumbnailOffset = 0x228800000000;
  v6->_procHITHStat.localHistStat = v6->localHistStat;
  *(void *)&v6->_procHITHStat.localHistOffset = 0x198000000000;
  v6->_procHITHStat.globalHistStat = v6->globalHistStat;
  *(void *)&v6->_procHITHStat.globalHistOffset = 0x100000000000;
  if ([(LTMProcessor *)v6 createShaders:v6->_metalContext]) {
    goto LABEL_20;
  }
  uint64_t v20 = objc_opt_new();
  v21 = *p_computeLTM;
  *p_computeLTM = (void *)v20;

  if (!*p_computeLTM
    || (uint64_t v22 = objc_opt_new(),
        driverLTM = v6->_driverLTM,
        v6->_driverLTM = (LTMDriverRef *)v22,
        driverLTM,
        !v6->_driverLTM))
  {
LABEL_19:
    v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_20;
  }
  v24 = [[HazeEstimation alloc] initWithMetalContext:v6->_metalContext];
  hazeEstimator = v6->_hazeEstimator;
  v6->_hazeEstimator = v24;

  if (v6->_hazeEstimator)
  {
    v26 = objc_opt_new();
    [(HazeEstimation *)v6->_hazeEstimator setHazePropertiesForLTM:v26];

    v27 = [(HazeEstimation *)v6->_hazeEstimator hazePropertiesForLTM];

    if (v27)
    {
      v28 = v6;
      goto LABEL_15;
    }
  }
  FigSignalErrorAt();
LABEL_20:
  if (*v5 == 1) {
    kdebug_trace();
  }
  v28 = 0;
LABEL_15:

  return v28;
}

- (void)_readDefaultsMetalAllocator
{
  self->_allocatorForceSize = 0;
  self->_allocatorWireMemory = 1;
}

- (int)createShaders:(id)a3
{
  p_ltmDownsampleYCbCrToRGB = &self->_ltmDownsampleYCbCrToRGB;
  uint64_t v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"SoftLTM::ltmDownsampleYCbCrToRGB" constants:0];
  v6 = *p_ltmDownsampleYCbCrToRGB;
  *p_ltmDownsampleYCbCrToRGB = (MTLComputePipelineState *)v5;

  if (*p_ltmDownsampleYCbCrToRGB)
  {
    uint64_t v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"SoftLTM::ltmDownsampleRGBAFloatToRGB" constants:0];
    v8 = p_ltmDownsampleYCbCrToRGB[1];
    p_ltmDownsampleYCbCrToRGB[1] = (MTLComputePipelineState *)v7;

    if (p_ltmDownsampleYCbCrToRGB[1])
    {
      uint64_t v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"SoftLTM::ltmCompressHighlight" constants:0];
      v10 = p_ltmDownsampleYCbCrToRGB[2];
      p_ltmDownsampleYCbCrToRGB[2] = (MTLComputePipelineState *)v9;

      if (p_ltmDownsampleYCbCrToRGB[2])
      {
        uint64_t v11 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"SoftLTM::ltmDehaze" constants:0];
        v12 = p_ltmDownsampleYCbCrToRGB[3];
        p_ltmDownsampleYCbCrToRGB[3] = (MTLComputePipelineState *)v11;

        if (p_ltmDownsampleYCbCrToRGB[3])
        {
          uint64_t v13 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"SoftLTM::ltmApplyGlobalCCM" constants:0];
          v14 = p_ltmDownsampleYCbCrToRGB[4];
          p_ltmDownsampleYCbCrToRGB[4] = (MTLComputePipelineState *)v13;

          if (p_ltmDownsampleYCbCrToRGB[4]) {
            return 0;
          }
        }
      }
    }
  }
  uint64_t v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  return -1;
}

- (sCLRProcHITHStat)getHITHStat
{
  return &self->_procHITHStat;
}

- (int)purgeResources
{
  p_hazeEstimator = &self->_hazeEstimator;
  id v4 = [(FigMetalContext *)self->_metalContext allocator];
  [v4 reset];

  if (!p_hazeEstimator[5])
  {
    uint64_t v5 = [(FigMetalContext *)self->_metalContext allocator];
    [v5 purgeResources];
  }
  self->_allocatorSetupComplete = 0;
  [(HazeEstimation *)*p_hazeEstimator releaseTextures];
  [(HazeEstimation *)p_hazeEstimator[4] releaseTextures];
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)resetState
{
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  if (self->_allocatorSetupComplete) {
    return 0;
  }
  id v4 = objc_opt_new();
  if (v4)
  {
    uint64_t v5 = v4;
    [v4 setWireMemory:1];
    [v5 setResourceOptions:512];
    [v5 setLabel:@"FigMetalAllocator_SoftLTM"];
    externalMemoryResource = self->_externalMemoryResource;
    if (externalMemoryResource)
    {
      uint64_t v7 = [(CMIExternalMemoryResource *)externalMemoryResource allocatorBackend];
      v8 = v7;
      if (v7)
      {
        [v5 setMemSize:[v7 memSize]];
        uint64_t v9 = [(FigMetalContext *)self->_metalContext allocator];
        int v10 = [v9 setupWithDescriptor:v5 allocatorBackend:v8];

        if (!v10)
        {

LABEL_11:
          self->_allocatorSetupComplete = 1;

          return 0;
        }
      }
      v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      if (self->_allocatorForceSize) {
        unint64_t allocatorForceSize = self->_allocatorForceSize;
      }
      else {
        unint64_t allocatorForceSize = 56180736;
      }
      [v5 setMemSize:allocatorForceSize];
      [v5 setWireMemory:self->_allocatorWireMemory];
      v12 = [(FigMetalContext *)self->_metalContext allocator];
      int v13 = [v12 setupWithDescriptor:v5];

      if (!v13) {
        goto LABEL_11;
      }
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  return -1;
}

- (id)createLTMComputer
{
  p_geometryData = &self->_geometryData;
  v29 = 0;
  id v4 = [[LTMStats alloc] initWithMetalContext:self->_metalContext];
  if (!v4) {
    goto LABEL_23;
  }
  uint64_t v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v6 = [(LTMGeometryData *)p_geometryData[8] inRGBImageUInt16Tex];

  if (v6)
  {
    uint64_t v7 = [(LTMGeometryData *)p_geometryData[8] inRGBImageUInt16Tex];
    FigMetalIncRef();
  }
  else
  {
    uint64_t v7 = [(LTMProcessor *)self generateLinearRGBATexture];
    [(LTMGeometryData *)p_geometryData[8] setInRGBImageUInt16Tex:v7];
  }

  uint64_t v8 = [(LTMGeometryData *)p_geometryData[8] inRGBImageUInt16Tex];
  if (!v8
    || (uint64_t v9 = (void *)v8,
        [(LTMGeometryData *)p_geometryData[8] inRGBImageUInt16Tex],
        int v10 = objc_claimAutoreleasedReturnValue(),
        char IsValid = FigMetalIsValid(),
        v10,
        v9,
        (IsValid & 1) == 0))
  {
    v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_23;
  }
  v12 = [(LTMGeometryData *)p_geometryData[8] inRGBImageUInt16Tex];
  v29 = v12;
  int v13 = -[LTMGeometryData initWithInputTextureWidth:height:]([LTMGeometryData alloc], "initWithInputTextureWidth:height:", [v12 width], objc_msgSend(v12, "height"));
  v14 = *p_geometryData;
  *p_geometryData = v13;

  if (!*p_geometryData) {
    goto LABEL_23;
  }
  p_exposureTime = &self->_driverInputMetadata.exposureTime;
  if (!-[LTMGeometryData extractFrom:toDriverInput:ltmGeometry:](p_geometryData[3], "extractFrom:toDriverInput:ltmGeometry:", p_geometryData[8], &self->_driverInputMetadata.exposureTime))goto LABEL_23; {
  if (!LOBYTE(self->_driverInputMetadata.highlightCompressionGain))
  }
    goto LABEL_14;
  uint64_t v16 = [(LTMProcessor *)self _compressHighlight:v12];
  if (!v16)
  {
LABEL_23:
    v25 = 0;
    goto LABEL_24;
  }
  v17 = (void *)v16;
  FigMetalDecRef();
  uint64_t v18 = v29;
  v29 = v17;

LABEL_14:
  if (*v5 == 1) {
    kdebug_trace();
  }
  BOOL v19 = [(LTMProcessor *)self _isOptimized:[(LTMGeometryData *)p_geometryData[8] optimizationLevel]];
  p_procHITHStat = &self->_procHITHStat;
  if ([(LTMStats *)v4 startCalculateHITHStatistics:v29 ltmGeometry:*p_geometryData inputDriverMetadata:p_exposureTime optimized:v19 enableAntiAliasing:[(LTMGeometryData *)p_geometryData[8] enableAntiAliasing] calcGlobalHistOnROI:[(LTMGeometryData *)p_geometryData[8] calcGlobalHistOnROI] outputProcHITHStat:p_procHITHStat])
  {
    goto LABEL_23;
  }
  if (*v5 == 1) {
    kdebug_trace();
  }
  v21 = [LTMCurvesCompute alloc];
  uint64_t v22 = *p_geometryData;
  uint64_t v23 = [(LTMGeometryData *)p_geometryData[8] digitalFlash];
  char v24 = [(LTMGeometryData *)p_geometryData[8] computeHDRCurves];
  BYTE1(v28) = [(LTMGeometryData *)p_geometryData[8] computeCurvesWoFaceBoost];
  LOBYTE(v28) = v24;
  v25 = -[LTMCurvesCompute initWith:HITH:geometryData:statsObj:optimized:digitalFlash:computeHDRCurves:computeCurvesWoFaceBoost:](v21, "initWith:HITH:geometryData:statsObj:optimized:digitalFlash:computeHDRCurves:computeCurvesWoFaceBoost:", p_exposureTime, p_procHITHStat, v22, v4, v19, v23, v28);
  if (v25 && *v5 == 1) {
    kdebug_trace();
  }
LABEL_24:
  if (v29)
  {
    [(LTMGeometryData *)p_geometryData[8] setInRGBImageUInt16Tex:0];
    FigMetalDecRef();
  }

  return v25;
}

- (int)process
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  p_geometryData = &self->_geometryData;
  id v102 = 0;
  id v4 = [[LTMStats alloc] initWithMetalContext:self->_metalContext];
  uint64_t v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (!v4)
  {
LABEL_74:
    v85 = 0;
    v21 = 0;
LABEL_70:
    int v87 = 0;
    goto LABEL_71;
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v6 = [(LTMGeometryData *)p_geometryData[8] inRGBImageUInt16Tex];

  if (v6)
  {
    uint64_t v7 = [(LTMGeometryData *)p_geometryData[8] inRGBImageUInt16Tex];
    id v102 = v7;
    FigMetalIncRef();
    if (!v7) {
      goto LABEL_75;
    }
  }
  else
  {
    uint64_t v7 = [(LTMProcessor *)self generateLinearRGBATexture];
    id v102 = v7;
    if (!v7)
    {
LABEL_75:
      int v101 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v89 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v85 = 0;
      v21 = 0;
      int v87 = -1;
      goto LABEL_71;
    }
  }
  if ((FigMetalIsValid() & 1) == 0) {
    goto LABEL_75;
  }
  self->_anon_570[344] = 0;
  uint64_t v8 = [(LTMGeometryData *)p_geometryData[8] tuningParameters];

  if (v8)
  {
    uint64_t v9 = [(LTMGeometryData *)p_geometryData[8] tuningParameters];
    [(LTMProcessor *)self setLTMComputeTuningParams:&self->_driverInputMetadata.exposureTime from:v9];

    int v10 = [(LTMGeometryData *)p_geometryData[8] tuningParameters];
    [(LTMProcessor *)self setDehazeTuningParamsFrom:v10];

    uint64_t v11 = [(LTMGeometryData *)p_geometryData[8] tuningParameters];
    [(LTMProcessor *)self setLTMTuningParamsFrom:v11];

    v12 = [(LTMGeometryData *)p_geometryData[8] tuningParameters];
    int v13 = [v12 objectForKeyedSubscript:@"Features"];

    if (v13)
    {
      *((unsigned char *)p_geometryData + 41) = objc_msgSend(v13, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableHazeEstimation", *((unsigned __int8 *)p_geometryData + 41), 0);
      -[LTMGeometryData setIsAdaptiveHighlightCompressionEnabled:](p_geometryData[8], "setIsAdaptiveHighlightCompressionEnabled:", objc_msgSend(v13, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableAdaptiveHighlightCompression", -[LTMGeometryData isAdaptiveHighlightCompressionEnabled](p_geometryData[8], "isAdaptiveHighlightCompressionEnabled"), 0));
      -[LTMGeometryData setIsHighlightCompressionEnabled:](p_geometryData[8], "setIsHighlightCompressionEnabled:", objc_msgSend(v13, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableHighlightCompression", -[LTMGeometryData isHighlightCompressionEnabled](p_geometryData[8], "isHighlightCompressionEnabled"), 0));
    }
  }
  [(LTMProcessor *)self _readDefaultsLTMparam];
  [(LTMProcessor *)self _readDefaultsDehaze];
  if (*((unsigned char *)p_geometryData + 41)) {
    uint64_t v14 = [(LTMGeometryData *)p_geometryData[8] doHazeEstimation];
  }
  else {
    uint64_t v14 = 0;
  }
  [(LTMGeometryData *)p_geometryData[8] setDoHazeEstimation:v14];
  v15 = -[LTMGeometryData initWithInputTextureWidth:height:]([LTMGeometryData alloc], "initWithInputTextureWidth:height:", [v7 width], objc_msgSend(v7, "height"));
  uint64_t v16 = *p_geometryData;
  *p_geometryData = v15;

  if (!*p_geometryData
    || !-[LTMGeometryData extractFrom:toDriverInput:ltmGeometry:](p_geometryData[3], "extractFrom:toDriverInput:ltmGeometry:", p_geometryData[8], &self->_driverInputMetadata.exposureTime))
  {
    goto LABEL_74;
  }
  if ([(LTMGeometryData *)p_geometryData[8] doGlobalCCM])
  {
    v17.i32[0] = (__int16)self->_driverInputMetadata.ccm.coeff[2].v16;
    v17.i32[1] = (__int16)self->_driverInputMetadata.ccm.coeff[3].v16;
    float32x2_t v18 = (float32x2_t)vdup_n_s32(0x39800000u);
    v19.i32[0] = (__int16)self->_driverInputMetadata.ccm.coeff[5].v16;
    v19.i32[1] = (__int16)self->_driverInputMetadata.ccm.coeff[6].v16;
    v20.i32[0] = (__int16)self->_driverInputMetadata.ccm.coeff[8].v16;
    v20.i32[1] = *(__int16 *)&self->_driverInputMetadata.isLEDMainFlashforAWB;
    v21 = -[LTMProcessor _applyGlobalCCM:globalCCM:](self, "_applyGlobalCCM:globalCCM:", v7, COERCE_DOUBLE(vmul_f32(vcvt_f32_s32(v17), v18)), COERCE_DOUBLE(vmul_f32(vcvt_f32_s32(v19), v18)), COERCE_DOUBLE(vmul_f32(vcvt_f32_s32(v20), v18)));
    if (!v21) {
      goto LABEL_77;
    }
    FigMetalDecRef();
    id v22 = v102;
    id v102 = v21;
  }
  uint64_t v23 = [(LTMGeometryData *)p_geometryData[8] hazeEstimation];

  if (v23)
  {
    uint64_t v24 = 0;
    long long v25 = 0uLL;
    do
    {
      long long v95 = v25;
      v26 = [(LTMGeometryData *)p_geometryData[8] hazeEstimation];
      v27 = [v26 objectAtIndexedSubscript:v24];
      [v27 floatValue];
      long long v99 = v95;
      *(_DWORD *)((unint64_t)&v99 & 0xFFFFFFFFFFFFFFF3 | (4 * (v24 & 3))) = v28;
      long long v29 = v99;
      long long v91 = v99;
      HIDWORD(v29) = HIDWORD(v95);
      long long v96 = v29;

      ++v24;
      long long v25 = v96;
    }
    while (v24 != 3);
    self->_anon_570[3] = 1;
    *(_OWORD *)&self->_anon_570[4] = v91;
    if (*((unsigned char *)p_geometryData + 40))
    {
      v21 = -[LTMProcessor _dehaze:hazeValues:](self, "_dehaze:hazeValues:", v102);
      if (v21)
      {
        FigMetalDecRef();
        id v30 = v102;
        id v102 = v21;

        goto LABEL_48;
      }
LABEL_77:
      v85 = 0;
      goto LABEL_70;
    }
  }
  else if ([(LTMGeometryData *)p_geometryData[8] doHazeEstimation])
  {
    if (*v5 == 1) {
      kdebug_trace();
    }
    int v31 = *(_DWORD *)&self->_driverInputMetadata.expBias;
    objc_super v32 = [(LTMGeometryData *)p_geometryData[4] hazeProperties];
    LODWORD(v33) = v31;
    [v32 setIspRes:v33];

    [(LTMGeometryData *)p_geometryData[8] evmExpRatio];
    int v35 = v34;
    v36 = [(LTMGeometryData *)p_geometryData[4] hazeProperties];
    LODWORD(v37) = v35;
    [v36 setEvmExpRatio:v37];

    int v38 = *(_DWORD *)&self->_driverInputMetadata.expBias;
    v39 = [(LTMGeometryData *)p_geometryData[4] hazePropertiesForLTM];
    LODWORD(v40) = v38;
    [v39 setIspRes:v40];

    [(LTMGeometryData *)p_geometryData[8] evmExpRatio];
    int v42 = v41;
    v43 = [(LTMGeometryData *)p_geometryData[4] hazePropertiesForLTM];
    LODWORD(v44) = v42;
    [v43 setEvmExpRatio:v44];

    [(LTMGeometryData *)p_geometryData[4] setInputRGBTexture:v102];
    [(LTMGeometryData *)p_geometryData[4] setHazeValue:0.0];
    int v45 = [(LTMGeometryData *)p_geometryData[8] calcGlobalHistOnROI];
    v46 = *p_geometryData;
    if (v45)
    {
      [(LTMGeometryData *)v46 cropRect];
      double v48 = v47;
      [(LTMGeometryData *)*p_geometryData cropRect];
      double v50 = v49;
      [(LTMGeometryData *)*p_geometryData cropRect];
      double v52 = v51;
      [(LTMGeometryData *)*p_geometryData cropRect];
      double v54 = v52 + v53;
      [(LTMGeometryData *)*p_geometryData cropRect];
      double v56 = v55;
      [(LTMGeometryData *)*p_geometryData cropRect];
    }
    else
    {
      [(LTMGeometryData *)v46 sourceRect];
      double v48 = v58;
      [(LTMGeometryData *)*p_geometryData sourceRect];
      double v50 = v59;
      [(LTMGeometryData *)*p_geometryData sourceRect];
      double v61 = v60;
      [(LTMGeometryData *)*p_geometryData sourceRect];
      double v54 = v61 + v62;
      [(LTMGeometryData *)*p_geometryData sourceRect];
      double v56 = v63;
      [(LTMGeometryData *)*p_geometryData sourceRect];
    }
    -[LTMGeometryData setHazeROI:](p_geometryData[4], "setHazeROI:", v48 | ((unint64_t)v50 << 32), v54 | ((unint64_t)(v56 + v57) << 32));
    int v64 = [(LTMGeometryData *)p_geometryData[4] run];
    if (v64)
    {
      int v87 = v64;
      v85 = 0;
      v21 = 0;
      goto LABEL_71;
    }
    [(LTMGeometryData *)p_geometryData[4] hazeValue];
    float32x4_t v97 = v65;
    [(LTMGeometryData *)p_geometryData[4] hazeValue];
    __int32 v94 = v66;
    [(LTMGeometryData *)p_geometryData[4] hazeValue];
    float32x4_t v67 = v97;
    v67.i32[1] = v94;
    v67.i32[2] = v68;
    float32x4_t v98 = v67;
    v69 = [(LTMGeometryData *)p_geometryData[4] hazePropertiesForLTM];

    double v70 = *(double *)v98.i64;
    if (v69)
    {
      [(LTMGeometryData *)p_geometryData[4] hazeValueForLTM];
      unsigned int v92 = v71;
      [(LTMGeometryData *)p_geometryData[4] hazeValueForLTM];
      unsigned int v90 = v72;
      [(LTMGeometryData *)p_geometryData[4] hazeValueForLTM];
      double v70 = COERCE_DOUBLE(__PAIR64__(v90, v92));
    }
    self->_anon_570[3] = 1;
    if (self->_anon_570[0])
    {
      *(float32x4_t *)&self->_anon_570[4] = v98;
    }
    else
    {
      double v93 = v70;
      [(LTMGeometryData *)p_geometryData[8] evmExpRatio];
      if (v73 == 0.0 || ([(LTMGeometryData *)p_geometryData[8] evmExpRatio], v74 <= 0.00000011921))
      {
        float32x4_t v76 = v98;
      }
      else
      {
        [(LTMGeometryData *)p_geometryData[8] evmExpRatio];
        float32x4_t v76 = vdivq_f32(v98, (float32x4_t)vdupq_lane_s32(v75, 0));
      }
      *(float32x4_t *)&self->_anon_570[4] = v76;
      double v70 = v93;
    }
    if (*((unsigned char *)p_geometryData + 40))
    {
      v21 = [(LTMProcessor *)self _dehaze:v102 hazeValues:v70];
      if (!v21) {
        goto LABEL_77;
      }
      FigMetalDecRef();
      id v77 = v102;
      id v102 = v21;
    }
    if (*v5 == 1) {
      kdebug_trace();
    }
  }
LABEL_48:
  if (!LOBYTE(self->_driverInputMetadata.highlightCompressionGain)) {
    goto LABEL_51;
  }
  v21 = [(LTMProcessor *)self _compressHighlight:v102];
  if (!v21) {
    goto LABEL_77;
  }
  FigMetalDecRef();
  id v78 = v102;
  id v102 = v21;

LABEL_51:
  if (*v5 == 1) {
    kdebug_trace();
  }
  BOOL v79 = [(LTMProcessor *)self _isOptimized:[(LTMGeometryData *)p_geometryData[8] optimizationLevel]];
  int v80 = [(LTMStats *)v4 calculateHITHStatistics:v102 ltmGeometry:*p_geometryData optimized:v79 enableAntiAliasing:[(LTMGeometryData *)p_geometryData[8] enableAntiAliasing] calcGlobalHistOnROI:[(LTMGeometryData *)p_geometryData[8] calcGlobalHistOnROI] toDriverInputMetadata:&self->_driverInputMetadata.exposureTime andProcHITHStat:&self->_procHITHStat];
  if (v80) {
    goto LABEL_76;
  }
  v81 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    if (*v81 == 1) {
      kdebug_trace();
    }
  }
  int v80 = [(LTMGeometryData *)p_geometryData[2] computeLtmComputeInput:&self->_procHITHStat withMetadata:&self->_driverInputMetadata.exposureTime to:&self->_computeInputs computeInputMetadata:&self->_computeInputsMetadata];
  if (v80)
  {
LABEL_76:
    int v87 = v80;
    v85 = 0;
    v21 = 0;
LABEL_81:
    uint64_t v5 = (_DWORD *)MEMORY[0x263F00E10];
    goto LABEL_71;
  }
  int v82 = [(LTMGeometryData *)p_geometryData[1] computeLTM:&self->_computeInputs withMetadata:&self->_computeInputsMetadata to:&self->_computeOutput];
  if (v82)
  {
    int v87 = v82;
    v85 = 0;
    v21 = 0;
    goto LABEL_81;
  }
  v21 = +[LTMMetadataWriter createLTMMetadataFromLTMOutput:&self->_computeOutput statistics:&self->_procHITHStat driverInputMetadata:&self->_driverInputMetadata.exposureTime geometryData:*p_geometryData];
  if (!v21)
  {
    v85 = 0;
    int v87 = 0;
    goto LABEL_81;
  }
  if ([(LTMGeometryData *)p_geometryData[8] computeHDRCurves])
  {
    self->_computeInputsMetadata.gammaCurve = 1;
    int v83 = [(LTMGeometryData *)p_geometryData[1] computeLTM:&self->_computeInputs withMetadata:&self->_computeInputsMetadata to:&self->_computeOutput];
    if (v83)
    {
LABEL_78:
      int v87 = v83;
      v85 = 0;
      goto LABEL_81;
    }
    +[LTMMetadataWriter addLTMMetadataTo:v21 curvesType:1 fromLTMOutput:&self->_computeOutput statistics:&self->_procHITHStat driverInputMetadata:&self->_driverInputMetadata.exposureTime geometryData:*p_geometryData];
  }
  if ([(LTMGeometryData *)p_geometryData[8] computeCurvesWoFaceBoost])
  {
    LOBYTE(self->_driverInputMetadata.gammaCurve) = 1;
    *(_DWORD *)&self->_driverInputMetadata.panoExpRatio = 1065353216;
    *(_DWORD *)&self->_driverInputMetadata.useHighlightCompression = 0;
    int v83 = [(LTMGeometryData *)p_geometryData[2] computeLtmComputeInput:&self->_procHITHStat withMetadata:&self->_driverInputMetadata.exposureTime to:&self->_computeInputs computeInputMetadata:&self->_computeInputsMetadata];
    if (!v83)
    {
      int v83 = [(LTMGeometryData *)p_geometryData[1] computeLTM:&self->_computeInputs withMetadata:&self->_computeInputsMetadata to:&self->_computeOutput];
      if (!v83)
      {
        +[LTMMetadataWriter addLTMMetadataTo:v21 curvesType:2 fromLTMOutput:&self->_computeOutput statistics:&self->_procHITHStat driverInputMetadata:&self->_driverInputMetadata.exposureTime geometryData:*p_geometryData];
        goto LABEL_67;
      }
    }
    goto LABEL_78;
  }
LABEL_67:
  v84 = [(LTMGeometryData *)p_geometryData[8] inMetaData];
  v85 = (void *)[v84 mutableCopy];

  [v85 addEntriesFromDictionary:v21];
  [(LTMGeometryData *)p_geometryData[8] setOutMetaData:v85];
  uint64_t v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v86 = [(LTMGeometryData *)p_geometryData[8] outMetaData];

  if (v86) {
    goto LABEL_70;
  }
  int v87 = -1;
LABEL_71:
  if (*v5 == 1) {
    kdebug_trace();
  }
  FigMetalDecRef();
  [(LTMGeometryData *)p_geometryData[4] releaseTextures];
  [(LTMGeometryData *)p_geometryData[8] releaseTextures];

  return v87;
}

- (int)finishProcessing
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (void)_readDefaultsLTMparam
{
  p_enablePreLTMHazeCorrection = &self->_enablePreLTMHazeCorrection;
  [(LTMIBPParams *)self->_ltmParams setCalcGlobalHistOnROI:[(LTMIBPParams *)self->_ltmParams calcGlobalHistOnROI]];
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setEnableAntiAliasing:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "enableAntiAliasing"));
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setComputeHDRCurves:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "computeHDRCurves"));
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setComputeCurvesWoFaceBoost:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "computeCurvesWoFaceBoost"));
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setIsHighlightCompressionEnabled:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "isHighlightCompressionEnabled"));
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setIsAdaptiveHighlightCompressionEnabled:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "isAdaptiveHighlightCompressionEnabled"));
  BOOL *p_enablePreLTMHazeCorrection = 1;
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setDoGlobalCCM:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "doGlobalCCM"));
  [*((id *)p_enablePreLTMHazeCorrection + 3) ispDGainThreshold];
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setIspDGainThreshold:");
  [*((id *)p_enablePreLTMHazeCorrection + 3) adaptiveHCSlope];
  v3 = (void *)*((void *)p_enablePreLTMHazeCorrection + 3);
  objc_msgSend(v3, "setAdaptiveHCSlope:");
}

- (void)_readDefaultsDehaze
{
  p_hazeEstimator = &self->_hazeEstimator;
  v3 = [(HazeEstimation *)self->_hazeEstimator hazeProperties];
  [v3 reluC1];
  int v5 = v4;
  v6 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v7) = v5;
  [v6 setReluC1:v7];

  uint64_t v8 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  [v8 reluC2];
  int v10 = v9;
  uint64_t v11 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v12) = v10;
  [v11 setReluC2:v12];

  int v13 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  [v13 reluC3];
  int v15 = v14;
  uint64_t v16 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v17) = v15;
  [v16 setReluC3:v17];

  float32x2_t v18 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  [v18 reluC4];
  int v20 = v19;
  v21 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v22) = v20;
  [v21 setReluC4:v22];

  uint64_t v23 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  [v23 reluC5];
  int v25 = v24;
  v26 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v27) = v25;
  [v26 setReluC5:v27];

  int v28 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  objc_msgSend(v28, "sr_min");
  int v30 = v29;
  int v31 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v32) = v30;
  objc_msgSend(v31, "setSr_min:", v32);

  double v33 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  objc_msgSend(v33, "sr_var");
  int v35 = v34;
  v36 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v37) = v35;
  objc_msgSend(v36, "setSr_var:", v37);

  int v38 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  objc_msgSend(v38, "sr_pow");
  int v40 = v39;
  int v41 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v42) = v40;
  objc_msgSend(v41, "setSr_pow:", v42);

  v43 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  objc_msgSend(v43, "sr_sat");
  int v45 = v44;
  v46 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v47) = v45;
  objc_msgSend(v46, "setSr_sat:", v47);

  double v48 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  objc_msgSend(v48, "min_display_black");
  int v50 = v49;
  double v51 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v52) = v50;
  objc_msgSend(v51, "setMin_display_black:", v52);

  double v53 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];

  if (v53)
  {
    double v54 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    [v54 reluC1];
    int v56 = v55;
    double v57 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v58) = v56;
    [v57 setReluC1:v58];

    double v59 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    [v59 reluC2];
    int v61 = v60;
    double v62 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v63) = v61;
    [v62 setReluC2:v63];

    int v64 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    [v64 reluC3];
    int v66 = v65;
    float32x4_t v67 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v68) = v66;
    [v67 setReluC3:v68];

    v69 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    [v69 reluC4];
    int v71 = v70;
    unsigned int v72 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v73) = v71;
    [v72 setReluC4:v73];

    float v74 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    [v74 reluC5];
    int v76 = v75;
    id v77 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v78) = v76;
    [v77 setReluC5:v78];

    BOOL v79 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    objc_msgSend(v79, "sr_min");
    int v81 = v80;
    int v82 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v83) = v81;
    objc_msgSend(v82, "setSr_min:", v83);

    v84 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    objc_msgSend(v84, "sr_var");
    int v86 = v85;
    int v87 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v88) = v86;
    objc_msgSend(v87, "setSr_var:", v88);

    v89 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    objc_msgSend(v89, "sr_pow");
    int v91 = v90;
    unsigned int v92 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v93) = v91;
    objc_msgSend(v92, "setSr_pow:", v93);

    __int32 v94 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    objc_msgSend(v94, "sr_sat");
    int v96 = v95;
    float32x4_t v97 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v98) = v96;
    objc_msgSend(v97, "setSr_sat:", v98);

    id v103 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    objc_msgSend(v103, "min_display_black");
    int v100 = v99;
    int v101 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v102) = v100;
    objc_msgSend(v101, "setMin_display_black:", v102);
  }
}

- (id)generateLinearRGBATexture
{
  p_ltmParams = &self->_ltmParams;
  uint64_t v4 = [(LTMIBPParams *)self->_ltmParams inLumaTex];
  if (v4
    && (int v5 = (void *)v4,
        [(LTMIBPParams *)*p_ltmParams inChromaTex],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    double v7 = [(LTMIBPParams *)*p_ltmParams inRGBAFloatTex];

    if (!v7)
    {
      uint64_t v8 = [(LTMIBPParams *)*p_ltmParams inLumaTex];
      int v9 = [(LTMIBPParams *)*p_ltmParams inChromaTex];
      int v10 = [(LTMProcessor *)self createLTMInTextureFromLuma:v8 chroma:v9];

LABEL_11:
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v11 = [(LTMIBPParams *)*p_ltmParams inRGBAFloatTex];

    if (v11)
    {
      double v12 = [(LTMIBPParams *)*p_ltmParams inLumaTex];
      if (v12)
      {
      }
      else
      {
        int v13 = [(LTMIBPParams *)*p_ltmParams inChromaTex];

        if (!v13)
        {
          uint64_t v8 = [(LTMIBPParams *)*p_ltmParams inRGBAFloatTex];
          int v10 = [(LTMProcessor *)self createLTMInTextureFromRGBAFloatTex:v8];
          goto LABEL_11;
        }
      }
    }
  }
  int v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  int v10 = 0;
LABEL_13:
  return v10;
}

- (id)createIntermediateRGBAMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  uint64_t v8 = [(FigMetalContext *)self->_metalContext allocator];
  int v9 = (void *)[v8 newTextureDescriptor];

  if (!v9) {
    goto LABEL_6;
  }
  int v10 = [v9 desc];
  [v10 setTextureType:2];

  uint64_t v11 = [v9 desc];
  [v11 setWidth:a4];

  double v12 = [v9 desc];
  [v12 setHeight:a5];

  int v13 = [v9 desc];
  [v13 setUsage:3];

  int v14 = [v9 desc];
  [v14 setPixelFormat:113];

  [v9 setLabel:0];
  int v15 = [(FigMetalContext *)self->_metalContext allocator];
  uint64_t v16 = (void *)[v15 newTextureWithDescriptor:v9];

  if (!v16)
  {
LABEL_6:
    float32x2_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v16 = 0;
  }

  return v16;
}

- (id)createLTMInTextureFromLuma:(id)a3 chroma:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6 || !v7)
  {
    float v33 = 0.0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_23:

    goto LABEL_24;
  }
  float v9 = (double)([v7 width] / 0x420uLL) * 0.5;
  if (v9 >= 1.0) {
    float v10 = v9;
  }
  else {
    float v10 = 1.0;
  }
  float v33 = v10;
  uint64_t v11 = -[LTMProcessor createIntermediateRGBAMetalTexture:width:height:](self, "createIntermediateRGBAMetalTexture:width:height:", @"ltmLinearRGB", (unint64_t)(float)((float)(unint64_t)[v8 width] / v10), (unint64_t)(float)((float)(unint64_t)objc_msgSend(v8, "height") / v10));
  if (!v11) {
    goto LABEL_16;
  }
  double v12 = [(FigMetalContext *)self->_metalContext commandQueue];
  int v13 = [v12 commandBuffer];

  if (!v13)
  {
    *(_DWORD *)os_log_type_t type = 0;
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    double v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_23;
  }
  int v14 = [v13 computeCommandEncoder];
  if (v14)
  {
    int v15 = v14;
    p_ltmDownsampleYCbCrToRGB = &self->_ltmDownsampleYCbCrToRGB;
    [v14 setComputePipelineState:self->_ltmDownsampleYCbCrToRGB];
    [v15 setTexture:v6 atIndex:0];
    [v15 setTexture:v8 atIndex:1];
    [v15 setTexture:v11 atIndex:2];
    [v15 setBytes:&v33 length:4 atIndex:0];
    unint64_t v17 = [(MTLComputePipelineState *)self->_ltmDownsampleYCbCrToRGB threadExecutionWidth];
    uint64_t v18 = [v11 width];
    if (v17 >= [v11 height] * v18)
    {
      uint64_t v20 = [v11 width];
      unint64_t v19 = [v11 height] * v20;
    }
    else
    {
      unint64_t v19 = [(MTLComputePipelineState *)*p_ltmDownsampleYCbCrToRGB threadExecutionWidth];
    }
    unint64_t v21 = [(MTLComputePipelineState *)*p_ltmDownsampleYCbCrToRGB maxTotalThreadsPerThreadgroup]/ v19;
    uint64_t v22 = [v11 width];
    if (v21 >= [v11 height] * v22 / v19)
    {
      uint64_t v24 = [v11 width];
      unint64_t v23 = [v11 height] * v24;
    }
    else
    {
      unint64_t v23 = [(MTLComputePipelineState *)*p_ltmDownsampleYCbCrToRGB maxTotalThreadsPerThreadgroup];
    }
    unint64_t v25 = v23 / v19;
    v30[0] = [v11 width];
    v30[1] = [v11 height];
    v30[2] = 1;
    v29[0] = v19;
    v29[1] = v25;
    v29[2] = 1;
    [v15 dispatchThreads:v30 threadsPerThreadgroup:v29];
    [v15 endEncoding];
    [v13 commit];

    goto LABEL_16;
  }
  *(_DWORD *)os_log_type_t type = 0;
  os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
  int v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_24:
  uint64_t v11 = 0;
LABEL_16:

  return v11;
}

- (id)createLTMInTextureFromRGBAFloatTex:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  int v29 = 1065353216;
  if (!v4)
  {
    int v28 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_21;
  }
  float v6 = 1.0;
  if ((unint64_t)[v4 width] >= 0x841)
  {
    int v29 = 0x40000000;
    float v6 = 2.0;
    if ((unint64_t)[v5 width] >> 1 >= 0x841)
    {
      int v29 = 1082130432;
      float v6 = 4.0;
    }
  }
  id v7 = -[LTMProcessor createIntermediateRGBAMetalTexture:width:height:](self, "createIntermediateRGBAMetalTexture:width:height:", @"ltmLinearRGB", (unint64_t)(float)((float)(unint64_t)[v5 width] / v6), (unint64_t)(float)((float)(unint64_t)objc_msgSend(v5, "height") / v6));
  if (v7)
  {
    uint64_t v8 = [(FigMetalContext *)self->_metalContext commandQueue];
    float v9 = [v8 commandBuffer];

    if (v9)
    {
      float v10 = [v9 computeCommandEncoder];
      if (v10)
      {
        uint64_t v11 = v10;
        p_ltmDownsampleRGBAFloatToRGB = &self->_ltmDownsampleRGBAFloatToRGB;
        [v10 setComputePipelineState:self->_ltmDownsampleRGBAFloatToRGB];
        [v11 setTexture:v5 atIndex:0];
        [v11 setTexture:v7 atIndex:1];
        [v11 setBytes:&v29 length:4 atIndex:0];
        unint64_t v13 = [(MTLComputePipelineState *)self->_ltmDownsampleRGBAFloatToRGB threadExecutionWidth];
        uint64_t v14 = [v7 width];
        if (v13 >= [v7 height] * v14)
        {
          uint64_t v16 = [v7 width];
          unint64_t v15 = [v7 height] * v16;
        }
        else
        {
          unint64_t v15 = [(MTLComputePipelineState *)*p_ltmDownsampleRGBAFloatToRGB threadExecutionWidth];
        }
        unint64_t v17 = [(MTLComputePipelineState *)*p_ltmDownsampleRGBAFloatToRGB maxTotalThreadsPerThreadgroup]/ v15;
        uint64_t v18 = [v7 width];
        if (v17 >= [v7 height] * v18 / v15)
        {
          uint64_t v20 = [v7 width];
          unint64_t v19 = [v7 height] * v20;
        }
        else
        {
          unint64_t v19 = [(MTLComputePipelineState *)*p_ltmDownsampleRGBAFloatToRGB maxTotalThreadsPerThreadgroup];
        }
        unint64_t v21 = v19 / v15;
        v26[0] = [v7 width];
        v26[1] = [v7 height];
        v26[2] = 1;
        v25[0] = v15;
        v25[1] = v21;
        v25[2] = 1;
        [v11 dispatchThreads:v26 threadsPerThreadgroup:v25];
        [v11 endEncoding];
        [v9 commit];

        goto LABEL_15;
      }
      int v28 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_22;
    }
    int v28 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unint64_t v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_21:
LABEL_22:
    id v7 = 0;
  }
LABEL_15:

  return v7;
}

- (id)_compressHighlight:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(LTMProcessor *)self _prepareHighlightCompressionCurve];
  int v5 = -[LTMProcessor createIntermediateRGBAMetalTexture:width:height:](self, "createIntermediateRGBAMetalTexture:width:height:", @"ltmCompressedTexture", [v4 width], objc_msgSend(v4, "height"));
  if (!v5)
  {
    uint64_t v20 = 0;
    uint64_t v18 = 0;
    uint64_t v16 = 0;
    id v7 = 0;
    int v31 = 1;
    goto LABEL_13;
  }
  float v6 = [(FigMetalContext *)self->_metalContext allocator];
  id v7 = (void *)[v6 newTextureDescriptor];

  if (!v7)
  {
    int v43 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v20 = 0;
    uint64_t v18 = 0;
    uint64_t v16 = 0;
    id v7 = 0;
LABEL_24:
    int v31 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [v7 desc];
  [v8 setTextureType:0];

  float v9 = [v7 desc];
  [v9 setWidth:257];

  float v10 = [v7 desc];
  [v10 setHeight:1];

  uint64_t v11 = [v7 desc];
  [v11 setDepth:1];

  double v12 = [v7 desc];
  [v12 setPixelFormat:20];

  unint64_t v13 = [v7 desc];
  [v13 setUsage:1];

  [v7 setLabel:0];
  uint64_t v14 = [(FigMetalContext *)self->_metalContext device];
  unint64_t v15 = [v7 desc];
  uint64_t v16 = (void *)[v14 newTextureWithDescriptor:v15];

  if (!v16)
  {
    int v43 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v20 = 0;
    uint64_t v18 = 0;
    uint64_t v16 = 0;
    goto LABEL_24;
  }
  memset(v44, 0, sizeof(v44));
  long long v45 = xmmword_23FF527B0;
  uint64_t v46 = 1;
  [v16 replaceRegion:v44 mipmapLevel:0 slice:0 withBytes:highlightCompressionDataScaled bytesPerRow:0 bytesPerImage:0];
  unint64_t v17 = [(FigMetalContext *)self->_metalContext commandQueue];
  uint64_t v18 = [v17 commandBuffer];

  if (!v18)
  {
    int v43 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v20 = 0;
    uint64_t v18 = 0;
    goto LABEL_24;
  }
  unint64_t v19 = [v18 computeCommandEncoder];
  if (!v19)
  {
    int v43 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    double v37 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v20 = 0;
    goto LABEL_24;
  }
  uint64_t v20 = v19;
  p_ltmCompressHighlight = &self->_ltmCompressHighlight;
  [v19 setComputePipelineState:self->_ltmCompressHighlight];
  [v20 setTexture:v4 atIndex:0];
  [v20 setTexture:v5 atIndex:1];
  [v20 setTexture:v16 atIndex:2];
  unint64_t v22 = [(MTLComputePipelineState *)self->_ltmCompressHighlight threadExecutionWidth];
  uint64_t v23 = [v5 width];
  if (v22 >= [v5 height] * v23)
  {
    uint64_t v25 = [v5 width];
    unint64_t v24 = [v5 height] * v25;
  }
  else
  {
    unint64_t v24 = [(MTLComputePipelineState *)*p_ltmCompressHighlight threadExecutionWidth];
  }
  unint64_t v26 = [(MTLComputePipelineState *)*p_ltmCompressHighlight maxTotalThreadsPerThreadgroup]/ v24;
  uint64_t v27 = [v5 width];
  if (v26 >= [v5 height] * v27 / v24)
  {
    uint64_t v29 = [v5 width];
    unint64_t v28 = [v5 height] * v29;
  }
  else
  {
    unint64_t v28 = [(MTLComputePipelineState *)*p_ltmCompressHighlight maxTotalThreadsPerThreadgroup];
  }
  unint64_t v30 = v28 / v24;
  v41[0] = [v5 width];
  v41[1] = [v5 height];
  int v31 = 1;
  v41[2] = 1;
  v40[0] = v24;
  v40[1] = v30;
  v40[2] = 1;
  [v20 dispatchThreads:v41 threadsPerThreadgroup:v40];
LABEL_13:
  objc_msgSend(v20, "endEncoding", v38, v39);
  [v18 commit];
  if (v31) {
    id v32 = v5;
  }
  else {
    id v32 = 0;
  }

  return v32;
}

- (id)_dehaze:(id)a3 hazeValues:
{
  float32x4_t v29 = v3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int16x4_t v6 = (int16x4_t)vcvt_s32_f32(vmul_f32(*(float32x2_t *)v29.f32, (float32x2_t)vdup_n_s32(0x477FFF00u)));
  v34[1] = (unsigned __int16)(int)vmuls_lane_f32(65535.0, v29, 2);
  v34[0] = vuzp1_s16(v6, v6).u32[0];
  id v7 = -[LTMProcessor createIntermediateRGBAMetalTexture:width:height:](self, "createIntermediateRGBAMetalTexture:width:height:", @"ltmDehazedRGBATexture", [v5 width], objc_msgSend(v5, "height"));
  if (!v7
    || ([(FigMetalContext *)self->_metalContext commandQueue],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 commandBuffer],
        float v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v11 = 0;
    float v9 = 0;
LABEL_20:
    int v22 = 0;
    goto LABEL_11;
  }
  float v10 = [v9 computeCommandEncoder];
  if (!v10)
  {
    int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unint64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v11 = 0;
    goto LABEL_20;
  }
  uint64_t v11 = v10;
  p_ltmDehaze = &self->_ltmDehaze;
  [v10 setComputePipelineState:self->_ltmDehaze];
  [v11 setTexture:v5 atIndex:0];
  [v11 setTexture:v7 atIndex:1];
  [v11 setBytes:v34 length:8 atIndex:0];
  unint64_t v13 = [(MTLComputePipelineState *)self->_ltmDehaze threadExecutionWidth];
  uint64_t v14 = [v7 width];
  if (v13 >= [v7 height] * v14)
  {
    uint64_t v16 = [v7 width];
    unint64_t v15 = [v7 height] * v16;
  }
  else
  {
    unint64_t v15 = [(MTLComputePipelineState *)*p_ltmDehaze threadExecutionWidth];
  }
  unint64_t v17 = [(MTLComputePipelineState *)*p_ltmDehaze maxTotalThreadsPerThreadgroup] / v15;
  uint64_t v18 = [v7 width];
  if (v17 >= [v7 height] * v18 / v15)
  {
    uint64_t v20 = [v7 width];
    unint64_t v19 = [v7 height] * v20;
  }
  else
  {
    unint64_t v19 = [(MTLComputePipelineState *)*p_ltmDehaze maxTotalThreadsPerThreadgroup];
  }
  unint64_t v21 = v19 / v15;
  v31[0] = [v7 width];
  v31[1] = [v7 height];
  int v22 = 1;
  v31[2] = 1;
  v30[0] = v15;
  v30[1] = v21;
  v30[2] = 1;
  [v11 dispatchThreads:v31 threadsPerThreadgroup:v30];
LABEL_11:
  objc_msgSend(v11, "endEncoding", v27, v28);
  [v9 commit];
  if (v22) {
    id v23 = v7;
  }
  else {
    id v23 = 0;
  }

  return v23;
}

- (id)_applyGlobalCCM:(__n128)a3 globalCCM:(__n128)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v34[0] = a2;
  v34[1] = a3;
  _DWORD v34[2] = a4;
  id v7 = a6;
  uint64_t v8 = objc_msgSend(a1, "createIntermediateRGBAMetalTexture:width:height:", @"ltmCCMRGBATexture", objc_msgSend(v7, "width"), objc_msgSend(v7, "height"));
  if (!v8
    || ([a1[1] commandQueue],
        float v9 = objc_claimAutoreleasedReturnValue(),
        [v9 commandBuffer],
        float v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unint64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    double v12 = 0;
    float v10 = 0;
LABEL_20:
    int v23 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = [v10 computeCommandEncoder];
  if (!v11)
  {
    int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    double v12 = 0;
    goto LABEL_20;
  }
  double v12 = v11;
  unint64_t v13 = a1 + 9684;
  [v11 setComputePipelineState:a1[9684]];
  [v12 setTexture:v7 atIndex:0];
  [v12 setTexture:v8 atIndex:1];
  [v12 setBytes:v34 length:48 atIndex:0];
  unint64_t v14 = [a1[9684] threadExecutionWidth];
  uint64_t v15 = [v8 width];
  if (v14 >= [v8 height] * v15)
  {
    uint64_t v17 = [v8 width];
    unint64_t v16 = [v8 height] * v17;
  }
  else
  {
    unint64_t v16 = [*v13 threadExecutionWidth];
  }
  unint64_t v18 = [*v13 maxTotalThreadsPerThreadgroup] / v16;
  uint64_t v19 = [v8 width];
  if (v18 >= [v8 height] * v19 / v16)
  {
    uint64_t v21 = [v8 width];
    unint64_t v20 = [v8 height] * v21;
  }
  else
  {
    unint64_t v20 = [*v13 maxTotalThreadsPerThreadgroup];
  }
  unint64_t v22 = v20 / v16;
  v31[0] = [v8 width];
  v31[1] = [v8 height];
  int v23 = 1;
  v31[2] = 1;
  v30[0] = v16;
  v30[1] = v22;
  v30[2] = 1;
  [v12 dispatchThreads:v31 threadsPerThreadgroup:v30];
LABEL_11:
  objc_msgSend(v12, "endEncoding", v28, v29);
  [v10 commit];
  if (v23) {
    id v24 = v8;
  }
  else {
    id v24 = 0;
  }

  return v24;
}

- (BOOL)_isOptimized:(int)a3
{
  return a3 != 0;
}

- (void)_prepareHighlightCompressionCurve
{
  if (BYTE1(self->_driverInputMetadata.highlightCompressionGain))
  {
    uint64_t v3 = 0;
    float v4 = (float)(*(float *)&self->_driverInputMetadata.isSIFRFrame + -1.0) / 3.0;
    do
    {
      LOWORD(v2) = highlightCompressionData_4x[v3];
      float v2 = fmaxf(fminf((float)((float)((float)(int)v3 * 0.0039062) * 65534.0)+ (float)((float)((float)LODWORD(v2) - (float)((float)((float)(int)v3 * 0.0039062) * 65534.0)) * v4), 65534.0), 0.0);
      highlightCompressionDataScaled[v3++] = llroundf(v2);
    }
    while (v3 != 257);
  }
  else
  {
    *(_DWORD *)&self->_driverInputMetadata.isSIFRFrame = 0x40000000;
    memcpy(highlightCompressionDataScaled, &highlightCompressionData, 0x202uLL);
  }
}

- (int)setLTMTuningParamsFrom:(id)a3
{
  char v6 = 0;
  float v4 = [a3 objectForKeyedSubscript:@"Exposure"];
  if (v4)
  {
    [(LTMIBPParams *)self->_ltmParams adaptiveHCSlope];
    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"adaptiveHCSlope", &v6);
    -[LTMIBPParams setAdaptiveHCSlope:](self->_ltmParams, "setAdaptiveHCSlope:");
    [(LTMIBPParams *)self->_ltmParams ispDGainThreshold];
    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"ispDGainThreshold", &v6);
    -[LTMIBPParams setIspDGainThreshold:](self->_ltmParams, "setIspDGainThreshold:");
  }

  return 0;
}

- (int)setDehazeTuningParamsFrom:(id)a3
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  char v108 = 0;
  float v4 = [a3 objectForKeyedSubscript:@"Dehaze"];
  if (!v4)
  {
    int v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
LABEL_27:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    LODWORD(v56) = -1;
    goto LABEL_24;
  }
  p_hazeEstimator = &self->_hazeEstimator;
  char v6 = [(HazeEstimation *)self->_hazeEstimator hazeProperties];
  [v6 reluC1];
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"reluC1", &v108);
  int v8 = v7;
  float v9 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v10) = v8;
  [v9 setReluC1:v10];

  if (!v108) {
    goto LABEL_26;
  }
  uint64_t v11 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  [v11 reluC2];
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"reluC2", &v108);
  int v13 = v12;
  unint64_t v14 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v15) = v13;
  [v14 setReluC2:v15];

  if (!v108) {
    goto LABEL_26;
  }
  unint64_t v16 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  [v16 reluC3];
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"reluC3", &v108);
  int v18 = v17;
  uint64_t v19 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v20) = v18;
  [v19 setReluC3:v20];

  if (!v108) {
    goto LABEL_26;
  }
  uint64_t v21 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  [v21 reluC4];
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"reluC4", &v108);
  int v23 = v22;
  id v24 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v25) = v23;
  [v24 setReluC4:v25];

  if (!v108) {
    goto LABEL_26;
  }
  unint64_t v26 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  [v26 reluC5];
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"reluC5", &v108);
  int v28 = v27;
  uint64_t v29 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v30) = v28;
  [v29 setReluC5:v30];

  if (!v108) {
    goto LABEL_26;
  }
  int v31 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  objc_msgSend(v31, "sr_min");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"sr_min", &v108);
  int v33 = v32;
  uint64_t v34 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v35) = v33;
  objc_msgSend(v34, "setSr_min:", v35);

  if (!v108) {
    goto LABEL_26;
  }
  v36 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  objc_msgSend(v36, "sr_var");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"sr_var", &v108);
  int v38 = v37;
  uint64_t v39 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v40) = v38;
  objc_msgSend(v39, "setSr_var:", v40);

  if (!v108) {
    goto LABEL_26;
  }
  int v41 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  objc_msgSend(v41, "sr_pow");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"sr_pow", &v108);
  int v43 = v42;
  int v44 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v45) = v43;
  objc_msgSend(v44, "setSr_pow:", v45);

  if (!v108) {
    goto LABEL_26;
  }
  uint64_t v46 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  objc_msgSend(v46, "sr_sat");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"sr_sat", &v108);
  int v48 = v47;
  int v49 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v50) = v48;
  objc_msgSend(v49, "setSr_sat:", v50);

  if (!v108) {
    goto LABEL_26;
  }
  double v51 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  objc_msgSend(v51, "min_display_black");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"min_display_black", &v108);
  int v53 = v52;
  double v54 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
  LODWORD(v55) = v53;
  objc_msgSend(v54, "setMin_display_black:", v55);

  if (!v108)
  {
LABEL_26:
    int v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
    goto LABEL_27;
  }
  int v56 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];

  if (v56)
  {
    double v57 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
    [v57 reluC1];
    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"reluC1_forLTM", &v108);
    int v59 = v58;
    int v60 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v61) = v59;
    [v60 setReluC1:v61];

    if (!v108) {
      goto LABEL_23;
    }
    double v62 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
    [v62 reluC2];
    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"reluC2_forLTM", &v108);
    int v64 = v63;
    int v65 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
    LODWORD(v66) = v64;
    [v65 setReluC2:v66];

    if (v108)
    {
      float32x4_t v67 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
      [v67 reluC3];
      objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"reluC3_forLTM", &v108);
      int v69 = v68;
      int v70 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
      LODWORD(v71) = v69;
      [v70 setReluC3:v71];

      if (v108)
      {
        unsigned int v72 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
        [v72 reluC4];
        objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"reluC4_forLTM", &v108);
        int v74 = v73;
        int v75 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
        LODWORD(v76) = v74;
        [v75 setReluC4:v76];

        if (v108)
        {
          id v77 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
          [v77 reluC5];
          objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"reluC5_forLTM", &v108);
          int v79 = v78;
          int v80 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
          LODWORD(v81) = v79;
          [v80 setReluC5:v81];

          if (v108)
          {
            int v82 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
            objc_msgSend(v82, "sr_min");
            objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"sr_min_forLTM", &v108);
            int v84 = v83;
            int v85 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
            LODWORD(v86) = v84;
            objc_msgSend(v85, "setSr_min:", v86);

            if (v108)
            {
              int v87 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
              objc_msgSend(v87, "sr_var");
              objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"sr_var_forLTM", &v108);
              int v89 = v88;
              int v90 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
              LODWORD(v91) = v89;
              objc_msgSend(v90, "setSr_var:", v91);

              if (v108)
              {
                unsigned int v92 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
                objc_msgSend(v92, "sr_pow");
                objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"sr_pow_forLTM", &v108);
                int v94 = v93;
                int v95 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
                LODWORD(v96) = v94;
                objc_msgSend(v95, "setSr_pow:", v96);

                if (v108)
                {
                  float32x4_t v97 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
                  objc_msgSend(v97, "sr_sat");
                  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"sr_sat_forLTM", &v108);
                  int v99 = v98;
                  int v100 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
                  LODWORD(v101) = v99;
                  objc_msgSend(v100, "setSr_sat:", v101);

                  if (v108)
                  {
                    double v102 = [(HazeEstimation *)*p_hazeEstimator hazeProperties];
                    objc_msgSend(v102, "min_display_black");
                    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"min_display_black_forLTM", &v108);
                    int v104 = v103;
                    v105 = [(HazeEstimation *)*p_hazeEstimator hazePropertiesForLTM];
                    LODWORD(v106) = v104;
                    objc_msgSend(v105, "setMin_display_black:", v106);

                    if (v108)
                    {
LABEL_23:
                      LODWORD(v56) = 0;
                      goto LABEL_24;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_26;
  }
LABEL_24:

  return (int)v56;
}

- (int)setLTMComputeTuningParams:(sRefDriverInputs *)a3 from:(id)a4
{
  id v6 = a4;
  int v7 = [v6 objectForKeyedSubscript:@"SDR"];
  int v8 = [v6 objectForKeyedSubscript:@"HLG"];
  float v9 = [v6 objectForKeyedSubscript:@"DigitalFlash"];

  if (v7 && v8 && v9)
  {
    int v10 = [(LTMProcessor *)self getLTMTuningFromTuningParams:&a3[1].hardIspDGain from:v7];
    if (v10
      || (int v10 = [(LTMProcessor *)self getLTMTuningFromTuningParams:&a3[1].flashMixPercentage[22] from:v8]) != 0)
    {
      int v11 = v10;
    }
    else
    {
      int v11 = [(LTMProcessor *)self getLTMTuningFromTuningParams:&a3[1].flashMixPercentage[76] from:v9];
      if (!v11) {
        LOBYTE(a3[1].flashMixPercentage[130]) = 1;
      }
    }
  }
  else
  {
    int v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v11 = -1;
  }

  return v11;
}

- (int)getLTMTuningFromTuningParams:(LTMTuning *)a3 from:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a4;
  char v36 = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"histDampingExponentHighlight", &v36, 0.0);
  a3->histDampingExponentHighlight = v6;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"histDampingExponentMax", &v36, 0.0);
  a3->histDampingExponentMax = v7;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"hmaxHeadroom", &v36, 0.0);
  a3->hmaxHeadroom = v8;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"maxPaddingRange", &v36, 0.0);
  a3->maxPaddingRange = v9;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"dispRangeActiveRatio", &v36, 0.0);
  a3->dispRangeActiveRatio = v10;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"sceneBlackRatio", &v36, 0.0);
  a3->sceneBlackRatio = v11;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"sceneBlackRatioDark", &v36, 0.0);
  a3->sceneBlackRatioDark = v12;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"sceneBgOffset", &v36, 0.0);
  a3->sceneBgOffset = v13;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"desatStrength", &v36, 0.0);
  a3->desatStrength = v14;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"minFlareDark", &v36, 0.0);
  a3->minFlareDark = v15;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"shadowSuppressBase", &v36, 0.0);
  a3->shadowSuppressBase = v16;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"shadowSuppressMax", &v36, 0.0);
  a3->shadowSuppressMax = v17;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"minSceneLux", &v36, 0.0);
  a3->minSceneLux = v18;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"histSmoothingMax", &v36, 0.0);
  a3->histSmoothingMax = v19;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"smoothingStrength", &v36, 0.0);
  a3->smoothingStrength = v20;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"dispRangeDarkRatio", &v36, 0.0);
  a3->dispRangeDarkRatio = v21;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"sceneModelSmoothing", &v36, 0.0);
  a3->sceneModelSmoothing = v22;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"nonFaceRatioFloor", &v36, 0.0);
  a3->nonFaceRatioFloor = v23;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"fstart", &v36, 0.0);
  a3->fstart = v24;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"shadowDesat", &v36, 0.0);
  a3->shadowDesat = v25;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"darkSceneLux", &v36, 0.0);
  a3->darkSceneLux = v26;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"ambientViewingLux", &v36, 0.0);
  a3->ambientViewingLux = v27;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"ambientViewingChromaticityX", &v36, 0.0);
  a3->ambientViewingChromaticityX = v28;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"ambientViewingChromaticityY", &v36, 0.0);
  a3->ambientViewingChromaticityY = v29;
  if (!v36) {
    goto LABEL_30;
  }
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"sceneBlackMax", &v36, 0.0);
  a3->sceneBlackMax = v30;
  if (v36
    && (objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"dispLum", &v36, 0.0), a3->dispLum = v31,
                                                                                                   v36)
    && (objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"dispBlack", &v36, 0.0),
        a3->dispBlack = v32,
        v36))
  {
    int v33 = 0;
  }
  else
  {
LABEL_30:
    double v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v33 = -1;
  }

  return v33;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (LTMIBPParams)ltmParams
{
  return self->_ltmParams;
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);
  objc_storeStrong((id *)&self->_ltmParams, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_hazeEstimator, 0);
  objc_storeStrong((id *)&self->_metadataExtractor, 0);
  objc_storeStrong((id *)&self->_driverLTM, 0);
  objc_storeStrong((id *)&self->_computeLTM, 0);
  objc_storeStrong((id *)&self->_geometryData, 0);
  objc_storeStrong((id *)&self->_ltmApplyGlobalCCM, 0);
  objc_storeStrong((id *)&self->_ltmDehaze, 0);
  objc_storeStrong((id *)&self->_ltmCompressHighlight, 0);
  objc_storeStrong((id *)&self->_ltmDownsampleRGBAFloatToRGB, 0);
  objc_storeStrong((id *)&self->_ltmDownsampleYCbCrToRGB, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end