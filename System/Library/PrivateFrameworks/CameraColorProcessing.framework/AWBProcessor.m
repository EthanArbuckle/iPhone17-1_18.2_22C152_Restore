@interface AWBProcessor
+ (int)calculateSTRBKeyFromWideCamera:(id *)a3 moduleConfig:(id)a4;
+ (int)getColorCalibrationsUsingIdealColorCalbrations:(id)a3 absoluteColorCalibrations:(id)a4 colorCalibrationsOut:(id *)a5 awbConfig:(id)a6;
+ (int)getInternalAWBMetadataForMIWB:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 validRect:(id)a6 secondaryModuleConfig:(id)a7 secondaryCameraInfo:(id)a8;
- (AWBIBPParams)awbParams;
- (CMIExternalMemoryResource)externalMemoryResource;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (void)dealloc;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setExternalMemoryResource:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation AWBProcessor

- (void)setMetalCommandQueue:(id)a3
{
}

- (int)setup
{
  FigKTraceInit();
  v3 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  if (!v4) {
    goto LABEL_10;
  }
  v5 = (FigMetalContext *)[objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v4 andOptionalCommandQueue:self->_metalCommandQueue];
  metalContext = self->_metalContext;
  self->_metalContext = v5;

  if (self->_metalContext)
  {
    id v7 = objc_alloc(MEMORY[0x263F2EE10]);
    v8 = [(FigMetalContext *)self->_metalContext device];
    v9 = (void *)[v7 initWithDevice:v8 allocatorType:2];
    [(FigMetalContext *)self->_metalContext setAllocator:v9];

    if (self->_metalContext)
    {
      v10 = [MEMORY[0x263EFF9A0] dictionary];
      stats = self->_stats;
      self->_stats = v10;

      if (self->_stats)
      {
        v12 = [[AWBStatistics alloc] initWithMetalContext:self->_metalContext];
        awbStats = self->_awbStats;
        self->_awbStats = v12;

        if (self->_awbStats)
        {
          v14 = [[AWBAlgorithm alloc] initWithMetalContext:self->_metalContext];
          awbAlgo = self->_awbAlgo;
          self->_awbAlgo = v14;

          if (self->_awbAlgo)
          {
            v16 = (AWBIBPParams *)objc_opt_new();
            awbParams = self->_awbParams;
            self->_awbParams = v16;

LABEL_10:
            int v18 = 0;
            goto LABEL_11;
          }
        }
      }
    }
  }
  int v18 = FigSignalErrorAt();
LABEL_11:
  if (*v3 == 1) {
    kdebug_trace();
  }

  return v18;
}

- (int)prepareToProcess:(unsigned int)a3
{
  v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (!self->_allocatorSetupComplete)
  {
    uint64_t v6 = objc_opt_new();
    if (!v6)
    {
      int v13 = FigSignalErrorAt();
      v8 = 0;
      goto LABEL_34;
    }
    id v7 = (void *)v6;
    v8 = objc_opt_new();

    [v8 setWireMemory:1];
    [v8 setResourceOptions:512];
    [v8 setLabel:@"FigMetalAllocator_AWB"];
    externalMemoryResource = self->_externalMemoryResource;
    if (externalMemoryResource)
    {
      v10 = [(CMIExternalMemoryResource *)externalMemoryResource allocatorBackend];
      v11 = v10;
      if (v10 && (unint64_t)[v10 memSize] >> 21)
      {
        objc_msgSend(v8, "setMemSize:", objc_msgSend(v11, "memSize"));
        v12 = [(FigMetalContext *)self->_metalContext allocator];
        int v13 = [v12 setupWithDescriptor:v8 allocatorBackend:v11];

        if (!v13)
        {

LABEL_11:
          if ([v8 memSize])
          {
            self->_allocatorSetupComplete = 1;

            goto LABEL_13;
          }
          int v13 = FigSignalErrorAt();
LABEL_34:

          goto LABEL_26;
        }
        FigSignalErrorAt();
      }
      else
      {
        int v13 = FigSignalErrorAt();
      }

      goto LABEL_34;
    }
    [v8 setMemSize:0x200000];
    v14 = [(FigMetalContext *)self->_metalContext allocator];
    int v13 = [v14 setupWithDescriptor:v8];

    if (v13) {
      goto LABEL_34;
    }
    goto LABEL_11;
  }
LABEL_13:
  if (a3 == 2)
  {
    awbAlgo = self->_awbAlgo;
    v25 = [(AWBIBPParams *)self->_awbParams setFileDict];
    v26 = [(AWBIBPParams *)self->_awbParams metadata];
    int v13 = [(AWBAlgorithm *)awbAlgo configWithSetFile:v25 metadata:v26 awbParams:self->_awbParams];

    if (v13) {
      goto LABEL_26;
    }
    awbStats = self->_awbStats;
    v28 = [(AWBIBPParams *)self->_awbParams registers];
    int v13 = [(AWBStatistics *)awbStats configWithRegs:v28];

    if (v13) {
      goto LABEL_26;
    }
    v29 = self->_awbStats;
    v20 = [(AWBIBPParams *)self->_awbParams setFileDict];
    v21 = [(AWBIBPParams *)self->_awbParams metadata];
    v22 = [(AWBIBPParams *)self->_awbParams cameraInfo];
    int v23 = [(AWBStatistics *)v29 configWithSetFile:v20 metadata:v21 cameraInfo:v22];
  }
  else if (a3 == 1)
  {
    v30 = self->_awbAlgo;
    v31 = [(AWBIBPParams *)self->_awbParams moduleConfig];
    v32 = [(AWBIBPParams *)self->_awbParams metadata];
    v33 = [(AWBIBPParams *)self->_awbParams cameraInfo];
    int v13 = [(AWBAlgorithm *)v30 configWithModuleConfig:v31 metadata:v32 cameraInfo:v33 awbParams:self->_awbParams];

    if (v13) {
      goto LABEL_26;
    }
    v34 = self->_awbStats;
    v20 = [(AWBIBPParams *)self->_awbParams moduleConfig];
    v21 = [(AWBIBPParams *)self->_awbParams metadata];
    v22 = [(AWBIBPParams *)self->_awbParams cameraInfo];
    int v23 = [(AWBStatistics *)v34 configWithModuleConfig:v20 metadata:v21 cameraInfo:v22 awbParams:self->_awbParams];
  }
  else
  {
    if (a3)
    {
      int v13 = 0;
      goto LABEL_26;
    }
    v15 = self->_awbAlgo;
    v16 = [(AWBIBPParams *)self->_awbParams moduleConfig];
    v17 = [(AWBIBPParams *)self->_awbParams metadata];
    int v18 = [(AWBIBPParams *)self->_awbParams cameraInfo];
    int v13 = [(AWBAlgorithm *)v15 configWithModuleConfig:v16 metadata:v17 cameraInfo:v18 awbParams:self->_awbParams];

    if (v13) {
      goto LABEL_26;
    }
    v19 = self->_awbStats;
    v20 = [(AWBIBPParams *)self->_awbParams registers];
    v21 = [(AWBIBPParams *)self->_awbParams metadata];
    v22 = [(AWBIBPParams *)self->_awbParams cameraInfo];
    int v23 = [(AWBStatistics *)v19 configWithRegs:v20 metadata:v21 cameraInfo:v22];
  }
  int v13 = v23;

  if (!v13) {
    self->_configured = 1;
  }
LABEL_26:
  if (*v5 == 1) {
    kdebug_trace();
  }
  return v13;
}

- (int)process
{
  id v70 = 0;
  v3 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  memset(v69, 0, sizeof(v69));
  unsigned int v68 = 0;
  memset(&rect, 0, sizeof(rect));
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  if (!self->_configured) {
    goto LABEL_16;
  }
  createBufferFromMetal(self->_metalContext, @"awb-stats-bfr", 82112);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v70 = v4;
  if (!v4)
  {
    int v13 = FigSignalErrorAt();
    v35 = 0;
    v39 = 0;
    goto LABEL_18;
  }
  uint64_t v5 = [MEMORY[0x263EFF990] dataWithLength:768];
  if (!v5)
  {
LABEL_16:
    int v13 = FigSignalErrorAt();
    v35 = 0;
    v39 = 0;
    id v4 = 0;
LABEL_18:
    id v20 = 0;
    goto LABEL_13;
  }
  v59 = (void *)v5;
  [(NSMutableDictionary *)self->_stats removeAllObjects];
  awbStats = self->_awbStats;
  v56 = [(AWBIBPParams *)self->_awbParams imageTex];
  uint64_t v6 = [(AWBIBPParams *)self->_awbParams clippedTex];
  id v7 = [(AWBIBPParams *)self->_awbParams lscGainsTex];
  v8 = [(AWBIBPParams *)self->_awbParams validRectInBufferCoords];
  v9 = [(AWBIBPParams *)self->_awbParams validRectInSensorReadoutCoords];
  v10 = [(AWBIBPParams *)self->_awbParams skinMask];
  id v62 = 0;
  v11 = [(AWBIBPParams *)self->_awbParams skyMask];
  id v61 = 0;
  v12 = [(AWBIBPParams *)self->_awbParams regionOfInterestRectInBufferCoords];
  int v13 = [(AWBStatistics *)awbStats process:v56 clipped:v6 lscGainsTex:v7 validRectInBufferCoords:v8 validRectInSensorReadoutCoords:v9 awbStatsBuffer:v4 awbTileStatsConfig:v69 anstSkinMask:v10 anstSkinMaskData:&v62 skyMaskTex:v11 skyMaskData:&v61 regionOfInterestRectInBufferCoords:v12 downsizeFactor:&v68];
  id v55 = v62;
  id v58 = v61;

  if (v13)
  {
    id v4 = 0;
    v3 = (_DWORD *)MEMORY[0x263F00E10];
    id v20 = v59;
LABEL_21:
    v39 = v55;
    v35 = v58;
    goto LABEL_13;
  }
  v14 = (void *)MEMORY[0x263EFF8F8];
  id v15 = v4;
  v16 = objc_msgSend(v14, "dataWithBytes:length:", objc_msgSend(v15, "contents"), 0x10000);
  [(NSMutableDictionary *)self->_stats setObject:v16 forKeyedSubscript:@"tileStats"];

  v17 = (void *)MEMORY[0x263EFF8F8];
  id v18 = v15;
  uint64_t v19 = objc_msgSend(v17, "dataWithBytes:length:", objc_msgSend(v18, "contents") + 0x10000, 192);
  id v20 = v59;
  if (!v19)
  {
    int v13 = FigSignalErrorAt();
    id v4 = 0;
    v3 = (_DWORD *)MEMORY[0x263F00E10];
    goto LABEL_21;
  }
  v21 = (void *)v19;
  id v20 = v59;
  v22 = (_OWORD *)[v20 bytes];
  id v4 = v21;
  int v23 = (long long *)[v4 bytes];
  long long v24 = v23[3];
  long long v26 = *v23;
  long long v25 = v23[1];
  v22[14] = v23[2];
  v22[15] = v24;
  v22[12] = v26;
  v22[13] = v25;
  long long v27 = v23[7];
  long long v29 = v23[4];
  long long v28 = v23[5];
  v22[18] = v23[6];
  v22[19] = v27;
  v22[16] = v29;
  v22[17] = v28;
  long long v30 = v23[11];
  long long v32 = v23[8];
  long long v31 = v23[9];
  v22[22] = v23[10];
  v22[23] = v30;
  v22[20] = v32;
  v22[21] = v31;
  [(NSMutableDictionary *)self->_stats setObject:v20 forKeyedSubscript:@"windowStats"];
  v33 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", objc_msgSend(v18, "contents") + 65728, 0x4000);
  [(NSMutableDictionary *)self->_stats setObject:v33 forKeyedSubscript:@"histStats"];

  v34 = [MEMORY[0x263EFF8F8] dataWithBytes:v69 length:24];
  [(NSMutableDictionary *)self->_stats setObject:v34 forKeyedSubscript:@"tileStatsConfig"];

  v35 = v58;
  if ([(NSMutableDictionary *)self->_stats count] == 4)
  {
    long long v65 = *MEMORY[0x263F00148];
    *(_OWORD *)v60 = v65;
    v36 = [(AWBIBPParams *)self->_awbParams imageTex];
    *(double *)&long long v66 = (double)(unint64_t)[v36 width];

    v37 = [(AWBIBPParams *)self->_awbParams imageTex];
    *((double *)&v66 + 1) = (double)(unint64_t)[v37 height];

    v38 = [MEMORY[0x263F08D40] valueWithPointer:&v65];
    [(NSMutableDictionary *)self->_stats setObject:v38 forKeyedSubscript:@"FESOutputSize"];

    v39 = v55;
    [(NSMutableDictionary *)self->_stats setObject:v55 forKeyedSubscript:@"anstSkinMask"];
    long long v63 = *(_OWORD *)v60;
    v40 = [(AWBIBPParams *)self->_awbParams skyMask];
    *(double *)&long long v64 = (double)(unint64_t)[v40 width];

    v41 = [(AWBIBPParams *)self->_awbParams skyMask];
    *((double *)&v64 + 1) = (double)(unint64_t)[v41 height];

    [(NSMutableDictionary *)self->_stats setObject:v58 forKeyedSubscript:@"skyMaskData"];
    v42 = [MEMORY[0x263F08D40] valueWithPointer:&v63];
    [(NSMutableDictionary *)self->_stats setObject:v42 forKeyedSubscript:@"skyMaskSize"];

    [(AWBAlgorithm *)self->_awbAlgo setStats:self->_stats];
    v43 = [(AWBIBPParams *)self->_awbParams outputMetadata];
    [(AWBAlgorithm *)self->_awbAlgo setOutputMetadata:v43];

    CFDictionaryRef v44 = [(AWBIBPParams *)self->_awbParams validRectInBufferCoords];
    BOOL v45 = CGRectMakeWithDictionaryRepresentation(v44, &rect);

    if (v45)
    {
      [(AWBAlgorithm *)self->_awbAlgo setWinRegionWidth:4 * (rect.size.width / v68)];
      [(AWBAlgorithm *)self->_awbAlgo setWinRegionHeight:4 * (rect.size.height / v68)];
      int v13 = [(AWBAlgorithm *)self->_awbAlgo process];
      if (!v13)
      {
        uint64_t v46 = [(AWBAlgorithm *)self->_awbAlgo awbComboGains];
        -[AWBIBPParams setAwbComboGains:](self->_awbParams, "setAwbComboGains:", v46, v47);
        uint64_t v48 = [(AWBAlgorithm *)self->_awbAlgo awbComboGainsNormalized];
        -[AWBIBPParams setAwbComboGainsNormalized:](self->_awbParams, "setAwbComboGainsNormalized:", v48, v49);
        uint64_t v50 = [(AWBAlgorithm *)self->_awbAlgo awbGains];
        -[AWBIBPParams setAwbGains:](self->_awbParams, "setAwbGains:", v50, v51);
        v52 = [(AWBAlgorithm *)self->_awbAlgo outputMetadata];
        [(AWBIBPParams *)self->_awbParams setOutputMetadata:v52];

        [(AWBAlgorithm *)self->_awbAlgo setOutputMetadata:0];
      }
    }
    else
    {
      int v13 = FigSignalErrorAt();
    }
    v3 = (_DWORD *)MEMORY[0x263F00E10];
  }
  else
  {
    int v13 = FigSignalErrorAt();
    v3 = (_DWORD *)MEMORY[0x263F00E10];
    v39 = v55;
  }
LABEL_13:
  FigMetalDecRef();
  if (*v3 == 1) {
    kdebug_trace();
  }
  v53 = [(FigMetalContext *)self->_metalContext allocator];
  [v53 usedSizeAll];

  return v13;
}

- (int)finishProcessing
{
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)purgeResources
{
  v3 = [(FigMetalContext *)self->_metalContext allocator];
  [v3 reset];

  if (!self->_externalMemoryResource)
  {
    id v4 = [(FigMetalContext *)self->_metalContext allocator];
    [v4 purgeResources];
  }
  self->_allocatorSetupComplete = 0;
  [(AWBStatistics *)self->_awbStats _purgeANSTNetwork];
  return 0;
}

- (int)resetState
{
  self->_configured = 0;
  return 0;
}

- (void)dealloc
{
  [(AWBProcessor *)self resetState];
  [(AWBProcessor *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)AWBProcessor;
  [(AWBProcessor *)&v3 dealloc];
}

+ (int)getColorCalibrationsUsingIdealColorCalbrations:(id)a3 absoluteColorCalibrations:(id)a4 colorCalibrationsOut:(id *)a5 awbConfig:(id)a6
{
  return +[AWBAlgorithm getColorCalibrationsUsingIdealColorCalbrations:a3 absoluteColorCalibrations:a4 colorCalibrationsOut:a5 awbConfig:a6];
}

+ (int)calculateSTRBKeyFromWideCamera:(id *)a3 moduleConfig:(id)a4
{
  return +[AWBAlgorithm calculateSTRBKeyFromWideCamera:a3 moduleConfig:a4];
}

+ (int)getInternalAWBMetadataForMIWB:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 validRect:(id)a6 secondaryModuleConfig:(id)a7 secondaryCameraInfo:(id)a8
{
  return +[AWBAlgorithm getInternalAWBMetadataForMIWB:a3 cameraInfo:a4 metadata:a5 validRect:a6 secondaryModuleConfig:a7 secondaryCameraInfo:a8];
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (AWBIBPParams)awbParams
{
  return self->_awbParams;
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);
  objc_storeStrong((id *)&self->_awbParams, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_awbAlgo, 0);
  objc_storeStrong((id *)&self->_awbStats, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end