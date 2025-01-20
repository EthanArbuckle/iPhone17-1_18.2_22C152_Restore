@interface AWBStatistics
- (AWBStatistics)initWithMetalContext:(id)a3;
- (NSNumber)digitalFlash;
- (NSNumber)downsizeFactor;
- (NSNumber)faceAssistedBehaviorMode;
- (NSNumber)lscMaxGain;
- (NSNumber)skipDemosaic;
- (int)_adjustConfigToValidRectInBufferCoords:(id)a3 validRectInSensorReadoutCoords:(id)a4 regionOfInterestRectInBufferCoords:(id)a5;
- (int)_createShaders;
- (int)_loadANSTNetwork;
- (int)_purgeANSTNetwork;
- (int)configWindowsV2:(id *)a3 metadata:(id)a4 tilesConfig:(id)a5 validRect:(id)a6 regionOfInterestRect:(id)a7;
- (int)configWithModuleConfig:(id)a3 metadata:(id)a4 cameraInfo:(id)a5 awbParams:(id)a6;
- (int)configWithRegs:(id)a3;
- (int)configWithRegs:(id)a3 metadata:(id)a4 cameraInfo:(id)a5;
- (int)configWithSetFile:(id)a3 metadata:(id)a4 cameraInfo:(id)a5;
- (int)process:(id)a3 clipped:(id)a4 lscGainsTex:(id)a5 validRectInBufferCoords:(id)a6 validRectInSensorReadoutCoords:(id)a7 awbStatsBuffer:(id)a8 awbTileStatsConfig:(id *)a9 anstSkinMask:(id)a10 anstSkinMaskData:(id *)a11 skyMaskTex:(id)a12 skyMaskData:(id *)a13 regionOfInterestRectInBufferCoords:(id)a14 downsizeFactor:(unsigned int *)a15;
- (void)setDigitalFlash:(id)a3;
- (void)setDownsizeFactor:(id)a3;
- (void)setFaceAssistedBehaviorMode:(id)a3;
- (void)setLscMaxGain:(id)a3;
- (void)setSkipDemosaic:(id)a3;
@end

@implementation AWBStatistics

- (AWBStatistics)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v6 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v11.receiver = self;
  v11.super_class = (Class)AWBStatistics;
  v7 = [(AWBStatistics *)&v11 init];
  v8 = v7;
  if (v7)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v7->_metalContext, a3);
      if (![(AWBStatistics *)v8 _createShaders])
      {
        v9 = v8;
        goto LABEL_7;
      }
    }
    else
    {
      FigSignalErrorAt();
    }
  }
  if (*v6 == 1) {
    kdebug_trace();
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (int)_createShaders
{
  v3 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v4 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"resetMtlBuffer" constants:0];
  resetMtlBufferPipelineState = self->_resetMtlBufferPipelineState;
  self->_resetMtlBufferPipelineState = v4;

  if (!self->_resetMtlBufferPipelineState) {
    goto LABEL_15;
  }
  v6 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"awbStatsBayer" constants:0];
  computeAWBStatsBayerPipelineState = self->_computeAWBStatsBayerPipelineState;
  self->_computeAWBStatsBayerPipelineState = v6;

  if (!self->_computeAWBStatsBayerPipelineState) {
    goto LABEL_15;
  }
  v8 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"awbStatsBayerFast" constants:0];
  computeAWBStatsBayerFastPipelineState = self->_computeAWBStatsBayerFastPipelineState;
  self->_computeAWBStatsBayerFastPipelineState = v8;

  if (!self->_computeAWBStatsBayerFastPipelineState) {
    goto LABEL_15;
  }
  v10 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"awbStatsQuadraFast" constants:0];
  computeAWBStatsQuadraFastPipelineState = self->_computeAWBStatsQuadraFastPipelineState;
  self->_computeAWBStatsQuadraFastPipelineState = v10;

  if (!self->_computeAWBStatsQuadraFastPipelineState) {
    goto LABEL_15;
  }
  v12 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"normTileStats" constants:0];
  normTileStatsPipelineState = self->_normTileStatsPipelineState;
  self->_normTileStatsPipelineState = v12;

  if (!self->_normTileStatsPipelineState) {
    goto LABEL_15;
  }
  v14 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"normWindowStats" constants:0];
  normWindowStatsPipelineState = self->_normWindowStatsPipelineState;
  self->_normWindowStatsPipelineState = v14;

  if (!self->_normWindowStatsPipelineState) {
    goto LABEL_15;
  }
  v16 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"resizeANST" constants:0];
  resizeANST = self->_resizeANST;
  self->_resizeANST = v16;

  if (!self->_resizeANST) {
    goto LABEL_15;
  }
  v18 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"fitWbTmRGBToANSTInput" constants:0];
  fitWbTmRGBToANSTInput = self->_fitWbTmRGBToANSTInput;
  self->_fitWbTmRGBToANSTInput = v18;

  if (self->_fitWbTmRGBToANSTInput) {
    int v20 = 0;
  }
  else {
LABEL_15:
  }
    int v20 = FigSignalErrorAt();
  if (*v3 == 1) {
    kdebug_trace();
  }
  return v20;
}

- (int)_loadANSTNetwork
{
  if (self->_espressoContext)
  {
    v3 = 0;
    id v5 = 0;
    v7 = 0;
    id v11 = 0;
  }
  else
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F20A40]) initWithVersion:0x10000];
    if (!v3)
    {
      int v12 = FigSignalErrorAt();
      id v5 = 0;
      v7 = 0;
      id v11 = 0;
      goto LABEL_11;
    }
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 URLForResource:@"anst" withExtension:@"mlmodelc" subdirectory:@"Models"];

    if (!v5)
    {
      int v12 = FigSignalErrorAt();
      v7 = 0;
      id v11 = 0;
      goto LABEL_11;
    }
    v6 = [v5 URLByAppendingPathComponent:@"model.espresso.net"];
    v7 = v6;
    if (!v6)
    {
      int v12 = FigSignalErrorAt();
      id v11 = 0;
      goto LABEL_11;
    }
    v8 = [v6 path];
    if (!v8)
    {
      id v11 = 0;
      int v12 = FigSignalErrorAt();
      goto LABEL_11;
    }
    context = (void *)espresso_create_context();
    self->_espressoContext = context;
    if (!context
      || (plan = (void *)espresso_create_plan(), (self->_espressoPlan = plan) == 0)
      || (id v11 = v8, [v11 UTF8String], espresso_plan_add_network())
      || espresso_plan_build())
    {
      int v12 = FigSignalErrorAt();
      id v11 = v8;
      goto LABEL_11;
    }
  }
  int v12 = 0;
LABEL_11:

  return v12;
}

- (int)_purgeANSTNetwork
{
  p_espressoContext = &self->_espressoContext;
  if (self->_espressoContext)
  {
    if (!self->_espressoPlan || (espresso_plan_destroy(), *p_espressoContext)) {
      espresso_context_destroy();
    }
    *p_espressoContext = 0;
    p_espressoContext[1] = 0;
  }
  return 0;
}

- (int)configWithRegs:(id)a3
{
  id v4 = a3;
  id v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (![v4 count])
  {
    int v8 = FigSignalErrorAt();
LABEL_23:
    int v6 = v8;
    goto LABEL_17;
  }
  bzero(&self->_awbStatCfg, 0xA30uLL);
  self->_awbStatCfg.downsizeRatio = 4;
  char v10 = 0;
  self->_awbStatCfg.firstPix = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", @"FirstPix", 0, &v10);
  if (!v10)
  {
    int v8 = FigSignalErrorAt();
    goto LABEL_23;
  }
  self->_awbStatCfg.layout = 1;
  char v9 = 0;
  self->_awbStatCfg.greenAverage = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", @"GreenAverage", 0, &v9);
  if (!v9)
  {
    int v8 = FigSignalErrorAt();
    goto LABEL_23;
  }
  int v6 = configCCM((float32x2_t *)&self->_anon_7c[4], v4);
  if (!v6)
  {
    int v6 = configGAM((uint64_t)&self->_anon_7c[116], v4);
    if (!v6)
    {
      int v6 = configCSC((float32x2_t *)&self->_anon_7c[772], v4);
      if (!v6)
      {
        int v6 = configCSC2((float32x2_t *)&self->_anon_7c[900], v4);
        if (!v6)
        {
          int v6 = configColorHist((float32x4_t *)&self->_anon_7c[1028], v4);
          if (!v6)
          {
            int v6 = configPixFilt((uint64_t)&self->_anon_7c[1188], v4, 0);
            if (!v6)
            {
              int v6 = configAWBStatsDB((float32x4_t *)&self->_anon_7c[1284], v4, 0);
              if (!v6)
              {
                int v6 = configPixFilt((uint64_t)&self->_anon_7c[1232], v4, 1);
                if (!v6)
                {
                  int v6 = configAWBStatsDB((float32x4_t *)&self->_anon_7c[1316], v4, 1);
                  if (!v6)
                  {
                    int v6 = configTiles((uint64_t)&self->_anon_7c[1444], v4);
                    if (!v6)
                    {
                      int v6 = 0;
                      *(_DWORD *)&self->_anon_7c[2592] = [(NSNumber *)self->_digitalFlash intValue];
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_17:
  if (*v5 == 1) {
    kdebug_trace();
  }

  return v6;
}

- (int)configWithRegs:(id)a3 metadata:(id)a4 cameraInfo:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v23 = a5;
  v22 = v8;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (![v26 count])
  {
    int v20 = FigSignalErrorAt();
    goto LABEL_55;
  }
  bzero(&self->_awbStatCfg, 0xA30uLL);
  self->_awbStatCfg.downsizeRatio = 4;
  char v28 = 0;
  self->_awbStatCfg.firstPix = objc_msgSend(v26, "cmi_intValueForKey:defaultValue:found:", @"FirstPix", 0, &v28);
  if (!v28)
  {
    int v20 = FigSignalErrorAt();
    goto LABEL_55;
  }
  char v27 = 0;
  self->_awbStatCfg.greenAverage = objc_msgSend(v26, "cmi_intValueForKey:defaultValue:found:", @"GreenAverage", 0, &v27);
  if (!v27)
  {
    int v20 = FigSignalErrorAt();
    goto LABEL_55;
  }
  int v9 = configCCM((float32x2_t *)&self->_anon_7c[4], v26);
  if (!v9)
  {
    int v9 = configGAM((uint64_t)&self->_anon_7c[116], v26);
    if (!v9)
    {
      int v9 = configCSC((float32x2_t *)&self->_anon_7c[772], v26);
      if (!v9)
      {
        int v9 = configCSC2((float32x2_t *)&self->_anon_7c[900], v26);
        if (!v9)
        {
          int v9 = configColorHist((float32x4_t *)&self->_anon_7c[1028], v26);
          if (!v9)
          {
            int v9 = configPixFilt((uint64_t)&self->_anon_7c[1188], v26, 0);
            if (!v9)
            {
              int v9 = configAWBStatsDB((float32x4_t *)&self->_anon_7c[1284], v26, 0);
              if (!v9)
              {
                int v9 = configPixFilt((uint64_t)&self->_anon_7c[1232], v26, 1);
                if (!v9)
                {
                  int v9 = configAWBStatsDB((float32x4_t *)&self->_anon_7c[1316], v26, 1);
                  if (!v9)
                  {
                    id v25 = v26;
                    if (*MEMORY[0x263F00E10] == 1) {
                      kdebug_trace();
                    }
                    char v10 = [v25 objectForKeyedSubscript:@"Config"];
                    if ([v10 count])
                    {
                      id v11 = [v25 objectForKeyedSubscript:@"AWBAEConfig"];
                      if ([v11 count])
                      {
                        int v12 = [v25 objectForKeyedSubscript:@"AWBAEWindowStartXY"];
                        if ([v12 count])
                        {
                          v13 = [v25 objectForKeyedSubscript:@"AWBAEWindowEndXY"];
                          if (![v13 count]) {
                            goto LABEL_83;
                          }
                          char v36 = 0;
                          self->_anon_7c[1389] = objc_msgSend(v10, "cmi_intValueForKey:defaultValue:found:", @"AWBAEStatsWindowBitDepth", 0, &v36) != 0;
                          if (!v36) {
                            goto LABEL_83;
                          }
                          char v35 = 0;
                          self->_anon_7c[1388] = objc_msgSend(v11, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"Enable", 0, 0, &v35) != 0;
                          if (!v35) {
                            goto LABEL_83;
                          }
                          char v34 = 0;
                          *(_DWORD *)&self->_anon_7c[1392] = objc_msgSend(v11, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"PF0Sel", 0, 0, &v34);
                          if (!v34) {
                            goto LABEL_83;
                          }
                          char v33 = 0;
                          *(_DWORD *)&self->_anon_7c[1396] = objc_msgSend(v11, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"PF1Sel", 0, 0, &v33);
                          if (!v33) {
                            goto LABEL_83;
                          }
                          char v32 = 0;
                          *(_DWORD *)&self->_anon_7c[1400] = objc_msgSend(v12, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"StartX", 0, 0, &v32);
                          if (!v32) {
                            goto LABEL_83;
                          }
                          char v31 = 0;
                          *(_DWORD *)&self->_anon_7c[1404] = objc_msgSend(v12, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"StartY", 0, 0, &v31);
                          if (v31
                            && (char v30 = 0,
                                *(_DWORD *)&self->_anon_7c[1408] = objc_msgSend(v13, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"EndX", 0, 0, &v30), v30)&& (char v29 = 0, *(_DWORD *)&self->_anon_7c[1412] = objc_msgSend(v13, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"EndY", 0, 0, &v29), v29))
                          {
                            int v9 = 0;
                          }
                          else
                          {
LABEL_83:
                            int v9 = FigSignalErrorAt();
                          }
                        }
                        else
                        {
                          int v9 = FigSignalErrorAt();
                          v13 = 0;
                        }
                      }
                      else
                      {
                        int v9 = FigSignalErrorAt();
                        int v12 = 0;
                        v13 = 0;
                      }
                    }
                    else
                    {
                      int v9 = FigSignalErrorAt();
                      id v11 = 0;
                      int v12 = 0;
                      v13 = 0;
                    }
                    if (*MEMORY[0x263F00E10] == 1) {
                      kdebug_trace();
                    }

                    id v8 = v22;
                    if (!v9)
                    {
                      id v24 = v25;
                      if (*MEMORY[0x263F00E10] == 1) {
                        kdebug_trace();
                      }
                      v14 = [v24 objectForKeyedSubscript:@"Config"];
                      if ([v14 count])
                      {
                        v15 = [v24 objectForKeyedSubscript:@"AWBAEConfig"];
                        if ([v15 count])
                        {
                          v16 = [v24 objectForKeyedSubscript:@"AWBAEWindowStartXY"];
                          if ([v16 count])
                          {
                            v17 = [v24 objectForKeyedSubscript:@"AWBAEWindowEndXY"];
                            if (![v17 count]) {
                              goto LABEL_84;
                            }
                            char v36 = 0;
                            self->_anon_7c[1417] = objc_msgSend(v14, "cmi_intValueForKey:defaultValue:found:", @"AWBAEStatsWindowBitDepth", 0, &v36) != 0;
                            if (!v36) {
                              goto LABEL_84;
                            }
                            char v35 = 0;
                            self->_anon_7c[1416] = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"Enable", 1, 0, &v35) != 0;
                            if (!v35) {
                              goto LABEL_84;
                            }
                            char v34 = 0;
                            *(_DWORD *)&self->_anon_7c[1420] = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"PF0Sel", 1, 0, &v34);
                            if (!v34) {
                              goto LABEL_84;
                            }
                            char v33 = 0;
                            *(_DWORD *)&self->_anon_7c[1424] = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"PF1Sel", 1, 0, &v33);
                            if (!v33) {
                              goto LABEL_84;
                            }
                            char v32 = 0;
                            *(_DWORD *)&self->_anon_7c[1428] = objc_msgSend(v16, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"StartX", 1, 0, &v32);
                            if (!v32) {
                              goto LABEL_84;
                            }
                            char v31 = 0;
                            *(_DWORD *)&self->_anon_7c[1432] = objc_msgSend(v16, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"StartY", 1, 0, &v31);
                            if (v31
                              && (char v30 = 0,
                                  *(_DWORD *)&self->_anon_7c[1436] = objc_msgSend(v17, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"EndX", 1, 0, &v30), v30)&& (char v29 = 0, *(_DWORD *)&self->_anon_7c[1440] = objc_msgSend(v17, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"EndY", 1, 0, &v29), v29))
                            {
                              int v9 = 0;
                            }
                            else
                            {
LABEL_84:
                              int v9 = FigSignalErrorAt();
                            }
                          }
                          else
                          {
                            int v9 = FigSignalErrorAt();
                            v17 = 0;
                          }
                        }
                        else
                        {
                          int v9 = FigSignalErrorAt();
                          v16 = 0;
                          v17 = 0;
                        }
                      }
                      else
                      {
                        int v9 = FigSignalErrorAt();
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                      }
                      if (*MEMORY[0x263F00E10] == 1) {
                        kdebug_trace();
                      }

                      id v8 = v22;
                      if (!v9)
                      {
                        int v9 = configTiles((uint64_t)&self->_anon_7c[1444], v24);
                        if (!v9 && (!v23 || (int v9 = configLSC((uint64_t)&self->_anon_7c[1348], v22, v23, 1)) == 0))
                        {
                          v18 = [v22 objectForKeyedSubscript:*MEMORY[0x263F2EF40]];
                          [v18 floatValue];
                          self->_awbStatCfg.ispDGain = v19 * 0.0039062;

                          *(_DWORD *)&self->_anon_7c[2592] = [(NSNumber *)self->_digitalFlash intValue];
                          int v20 = configLinearRGBToANSTInput((uint64_t)&self->_anon_7c[1476], v22);
LABEL_55:
                          int v9 = v20;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v9;
}

- (int)configWithSetFile:(id)a3 metadata:(id)a4 cameraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  id v31 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F5F0]];
  uint64_t v11 = [v31 bytes];
  uint64_t v12 = v11;
  if (!v11) {
    goto LABEL_18;
  }
  uint64_t v13 = *(unsigned int *)(v11 + 28);
  if (!v13) {
    goto LABEL_18;
  }
  v14 = [v8 objectForKeyedSubscript:@"CSCConfig"];

  if (!v14) {
    goto LABEL_18;
  }
  v15 = [v8 objectForKeyedSubscript:@"ColorCalIdeal"];

  if (!v15) {
    goto LABEL_18;
  }
  v16 = [v8 objectForKeyedSubscript:@"AbsoluteColorCalibrationData"];

  if (!v16) {
    goto LABEL_18;
  }
  uint64_t v17 = *MEMORY[0x263F2F3D8];
  v18 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F3D8]];

  if (!v18) {
    goto LABEL_18;
  }
  float v19 = [v8 objectForKeyedSubscript:@"CSCConfig"];
  int v20 = [v8 objectForKeyedSubscript:@"ColorCalIdeal"];
  v21 = [v8 objectForKeyedSubscript:@"AbsoluteColorCalibrationData"];
  unsigned int v22 = *(_DWORD *)(v12 + v13 + 1700);
  id v23 = [v9 objectForKeyedSubscript:v17];
  int v24 = configCCM((uint64_t)&self->_anon_7c[4], v19, v20, v21, [v23 intValue], v9, (float)v22);

  if (v24) {
    goto LABEL_15;
  }
  uint64_t v25 = *MEMORY[0x263F2EF40];
  id v26 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2EF40]];

  if (!v26)
  {
LABEL_18:
    int v29 = FigSignalErrorAt();
    goto LABEL_14;
  }
  if (!v10 || (int v24 = configLSC((uint64_t)&self->_anon_7c[1348], v9, v10, 1)) == 0)
  {
    char v27 = [v9 objectForKeyedSubscript:v25];
    [v27 floatValue];
    self->_awbStatCfg.ispDGain = v28 * 0.0039062;

    *(_DWORD *)&self->_anon_7c[2592] = [(NSNumber *)self->_digitalFlash intValue];
    int v29 = configLinearRGBToANSTInput((uint64_t)&self->_anon_7c[1476], v9);
LABEL_14:
    int v24 = v29;
  }
LABEL_15:
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v24;
}

- (int)configWithModuleConfig:(id)a3 metadata:(id)a4 cameraInfo:(id)a5 awbParams:(id)a6
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v121 = a4;
  id v118 = a5;
  id v119 = a6;
  v117 = v10;
  if (v10 && v121 && v118 && v119)
  {
    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
    uint64_t v11 = [v10 objectForKeyedSubscript:@"AutoWhiteBalance"];
    uint64_t v12 = [v119 firstPixel];
    unsigned __int8 v13 = [v12 intValue];

    v14 = [v119 cfaLayout];
    int v116 = [v14 intValue];

    v15 = [v119 digitalFlash];
    digitalFlash = self->_digitalFlash;
    self->_digitalFlash = v15;

    uint64_t v17 = [v119 skipDemosaic];
    skipDemosaic = self->_skipDemosaic;
    self->_skipDemosaic = v17;

    float v19 = [v119 lscMaxGain];
    lscMaxGain = self->_lscMaxGain;
    self->_lscMaxGain = v19;

    v21 = [v119 faceAssistedBehaviorMode];
    faceAssistedBehaviorMode = self->_faceAssistedBehaviorMode;
    self->_faceAssistedBehaviorMode = v21;

    id v23 = [v119 downsizeFactor];
    downsizeFactor = self->_downsizeFactor;
    self->_downsizeFactor = v23;

    uint64_t v25 = NSNumber;
    id v26 = [v121 objectForKeyedSubscript:*MEMORY[0x263F2F470]];
    [v26 doubleValue];
    char v27 = objc_msgSend(v25, "numberWithDouble:");

    v120 = v27;
    if (v27)
    {
      [v27 floatValue];
      float v29 = v28 * 256.0;
    }
    else
    {
      float v29 = 1.0;
    }
    bzero(&self->_awbStatCfg, 0xA30uLL);
    char v30 = [v11 objectForKeyedSubscript:@"CSC"];

    if (v30
      && ([v11 objectForKeyedSubscript:@"IdealColorCalibrations"],
          (v122 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v31 = [v118 objectForKeyedSubscript:*MEMORY[0x263F2EE80]];
      if (!v31) {
        goto LABEL_216;
      }
      uint64_t v32 = *MEMORY[0x263F2F3D8];
      char v33 = [v121 objectForKeyedSubscript:*MEMORY[0x263F2F3D8]];

      if (!v33) {
        goto LABEL_216;
      }
      char v34 = [v11 objectForKeyedSubscript:@"CSC"];
      char v35 = [v121 objectForKeyedSubscript:v32];
      int v36 = configCCM((uint64_t)&self->_anon_7c[4], v34, v122, v31, [v35 intValue], v121, v29);

      if (v36) {
        goto LABEL_188;
      }
      uint64_t v37 = *MEMORY[0x263F2EF40];
      v38 = [v121 objectForKeyedSubscript:*MEMORY[0x263F2EF40]];

      if (!v38)
      {
LABEL_216:
        int v111 = FigSignalErrorAt();
        goto LABEL_187;
      }
      v39 = [v121 objectForKeyedSubscript:v37];
      [v39 floatValue];
      self->_awbStatCfg.ispDGain = v40 * 0.0039062;

      self->_awbStatCfg.firstPix = v13;
      self->_awbStatCfg.layout = v116;
      v125.i8[0] = 0;
      v41 = [v11 objectForKeyedSubscript:@"Stats"];
      self->_awbStatCfg.greenAverage = objc_msgSend(v41, "cmi_intValueForKey:defaultValue:found:", @"GreenAverage", 0, &v125);

      if (!v125.i8[0])
      {
        int v111 = FigSignalErrorAt();
        goto LABEL_187;
      }
      id v42 = [v11 objectForKeyedSubscript:@"Gamma"];
      if (*MEMORY[0x263F00E10] == 1) {
        kdebug_trace();
      }
      uint64_t v43 = 0;
      v44 = &self->_anon_7c[644];
      v125.i8[0] = 0;
      while (1)
      {
        *(_WORD *)&self->_anon_7c[2 * v43 + 116] = objc_msgSend(v42, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"LUT", v43, 0, &v125);
        if (!v125.i8[0]) {
          break;
        }
        if (++v43 == 257)
        {
          uint64_t v45 = 0;
          v125.i8[0] = 0;
          while (1)
          {
            *(_DWORD *)&v44[4 * v45] = objc_msgSend(v42, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"OffsetIn", v45, 0, &v125);
            if (!v125.i8[0]) {
              goto LABEL_203;
            }
            if (++v45 == 3)
            {
              uint64_t v46 = 0;
              v125.i8[0] = 0;
              while (1)
              {
                *(_DWORD *)&v44[4 * v46 + 16] = objc_msgSend(v42, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"OffsetOut", v46, 0, &v125);
                if (!v125.i8[0]) {
                  goto LABEL_203;
                }
                if (++v46 == 3)
                {
                  *(_WORD *)&self->_anon_7c[688] = 0;
                  self->_anon_7c[690] = 0;
                  *(void *)&self->_anon_7c[676] = 0;
                  self->_anon_7c[684] = 0;
                  *(void *)&self->_anon_7c[692] = 0x100000000FFFFLL;
                  *(_DWORD *)&self->_anon_7c[700] = 983297;
                  *(_WORD *)&self->_anon_7c[704] = 0;
                  *(_OWORD *)&self->_anon_7c[706] = numIntervalArrayFixedCfgLinear;
                  *(_OWORD *)&self->_anon_7c[722] = *(_OWORD *)algn_23FF51344;
                  memset_pattern16(&self->_anon_7c[738], asc_23FF51310, 0x20uLL);
                  int v36 = 0;
                  goto LABEL_29;
                }
              }
            }
          }
        }
      }
LABEL_203:
      int v36 = FigSignalErrorAt();
LABEL_29:
      if (*MEMORY[0x263F00E10] == 1) {
        kdebug_trace();
      }

      if (!v36)
      {
        id v47 = [v11 objectForKeyedSubscript:@"CSC"];
        if (*MEMORY[0x263F00E10] == 1) {
          kdebug_trace();
        }
        uint64_t v48 = 0;
        char v124 = 0;
        while (1)
        {
          v125.f32[v48] = (float)(int)objc_msgSend(v47, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"CSCCoef", v48, 0, &v124);
          if (!v124) {
            break;
          }
          if (++v48 == 9)
          {
            uint64_t v49 = 0;
            float32x2_t v50 = (float32x2_t)vdup_n_s32(0x39800000u);
            float32x2_t v51 = vmul_f32(v125, v50);
            float32x2_t v52 = vmul_f32(v127, v50);
            float v53 = v128 * 0.00024414;
            float32x2_t v54 = vmul_f32(v129, v50);
            float v55 = v130 * 0.00024414;
            *(float *)&self->_anon_7c[780] = v126 * 0.00024414;
            *(float32x2_t *)&self->_anon_7c[772] = v51;
            *(float *)&self->_anon_7c[796] = v53;
            *(float32x2_t *)&self->_anon_7c[788] = v52;
            *(float *)&self->_anon_7c[812] = v55;
            *(float32x2_t *)&self->_anon_7c[804] = v54;
            v125.i8[0] = 0;
            while (1)
            {
              *(float *)&v44[4 * v49 + 208] = (float)(int)objc_msgSend(v47, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"CSCOffsetIn", v49, 0, &v125);
              if (!v125.i8[0]) {
                goto LABEL_192;
              }
              if (++v49 == 3)
              {
                uint64_t v56 = 0;
                v125.i8[0] = 0;
                while (1)
                {
                  int v57 = objc_msgSend(v47, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"CSCOffset", v56, 0, &v125);
                  long long v123 = *(_OWORD *)&self->_anon_7c[868];
                  *(float *)((unint64_t)&v123 & 0xFFFFFFFFFFFFFFF3 | (4 * (v56 & 3))) = (float)v57;
                  long long v58 = v123;
                  *(_DWORD *)&self->_anon_7c[876] = DWORD2(v123);
                  *(void *)&self->_anon_7c[868] = v58;
                  if (!v125.i8[0]) {
                    break;
                  }
                  if (++v56 == 3)
                  {
                    uint64_t v59 = 0;
                    *(float *)&self->_anon_7c[876] = *((float *)&v58 + 2) + 7483.0;
                    *(float32x2_t *)&self->_anon_7c[868] = vadd_f32(*(float32x2_t *)&v58, (float32x2_t)vdup_n_s32(0x45E9D800u));
                    v125.i8[0] = 0;
                    while (1)
                    {
                      *(float *)&v44[4 * v59 + 176] = (float)(int)objc_msgSend(v47, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"CSCMin", v59, 0, &v125);
                      if (!v125.i8[0]) {
                        goto LABEL_210;
                      }
                      if (++v59 == 3)
                      {
                        uint64_t v60 = 0;
                        v125.i8[0] = 0;
                        while (1)
                        {
                          *(float *)&v44[4 * v60 + 192] = (float)(int)objc_msgSend(v47, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"CSCMax", v60, 0, &v125);
                          if (!v125.i8[0]) {
                            goto LABEL_210;
                          }
                          if (++v60 == 3)
                          {
                            v125.i8[0] = 0;
                            *(float *)&self->_anon_7c[884] = (float)(int)objc_msgSend(v47, "cmi_intValueForKey:defaultValue:found:", @"CSCChromaScale0", 0, &v125);
                            if (v125.i8[0])
                            {
                              v125.i8[0] = 0;
                              *(float *)&self->_anon_7c[888] = (float)(int)objc_msgSend(v47, "cmi_intValueForKey:defaultValue:found:", @"CSCChromaScale1", 0, &v125);
                              if (v125.i8[0])
                              {
                                int v36 = 0;
                                *(float32x2_t *)&self->_anon_7c[884] = vmul_f32(*(float32x2_t *)&self->_anon_7c[884], (float32x2_t)0x3900000039000000);
                                goto LABEL_52;
                              }
                            }
                            goto LABEL_210;
                          }
                        }
                      }
                    }
                  }
                }
LABEL_210:
                int v113 = FigSignalErrorAt();
                goto LABEL_211;
              }
            }
          }
        }
LABEL_192:
        int v113 = FigSignalErrorAt();
LABEL_211:
        int v36 = v113;
LABEL_52:
        if (*MEMORY[0x263F00E10] == 1) {
          kdebug_trace();
        }

        if (!v36)
        {
          id v61 = [v11 objectForKeyedSubscript:@"CSC2"];
          if (*MEMORY[0x263F00E10] == 1) {
            kdebug_trace();
          }
          uint64_t v62 = 0;
          char v124 = 0;
          while (1)
          {
            v125.f32[v62] = (float)(int)objc_msgSend(v61, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"CSCCoeff", v62, 0, &v124);
            if (!v124) {
              break;
            }
            if (++v62 == 9)
            {
              uint64_t v63 = 0;
              float32x2_t v64 = (float32x2_t)vdup_n_s32(0x39800000u);
              float32x2_t v65 = vmul_f32(v125, v64);
              float32x2_t v66 = vmul_f32(v127, v64);
              float v67 = v128 * 0.00024414;
              float32x2_t v68 = vmul_f32(v129, v64);
              float v69 = v130 * 0.00024414;
              *(float *)&self->_anon_7c[908] = v126 * 0.00024414;
              *(float32x2_t *)&self->_anon_7c[900] = v65;
              *(float *)&self->_anon_7c[924] = v67;
              *(float32x2_t *)&self->_anon_7c[916] = v66;
              *(float *)&self->_anon_7c[940] = v69;
              *(float32x2_t *)&self->_anon_7c[932] = v68;
              v125.i8[0] = 0;
              while (1)
              {
                *(float *)&self->_anon_7c[4 * v63 + 980] = (float)(int)objc_msgSend(v61, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"CSCOffsetIn", v63, 0, &v125);
                if (!v125.i8[0]) {
                  goto LABEL_212;
                }
                if (++v63 == 3)
                {
                  uint64_t v70 = 0;
                  v125.i8[0] = 0;
                  while (1)
                  {
                    *(float *)&self->_anon_7c[4 * v70 + 996] = (float)(int)objc_msgSend(v61, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"CSCOffsetOut", v70, 0, &v125);
                    if (!v125.i8[0]) {
                      goto LABEL_212;
                    }
                    if (++v70 == 3)
                    {
                      uint64_t v71 = 0;
                      v125.i8[0] = 0;
                      while (1)
                      {
                        *(float *)&self->_anon_7c[4 * v71 + 948] = (float)(int)objc_msgSend(v61, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"CSCMin", v71, 0, &v125);
                        if (!v125.i8[0]) {
                          goto LABEL_212;
                        }
                        if (++v71 == 3)
                        {
                          uint64_t v72 = 0;
                          v125.i8[0] = 0;
                          while (1)
                          {
                            *(float *)&self->_anon_7c[4 * v72 + 964] = (float)(int)objc_msgSend(v61, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"CSCMax", v72, 0, &v125);
                            if (!v125.i8[0]) {
                              goto LABEL_212;
                            }
                            if (++v72 == 3)
                            {
                              v125.i8[0] = 0;
                              *(float *)&self->_anon_7c[1012] = (float)(int)objc_msgSend(v61, "cmi_intValueForKey:defaultValue:found:", @"CSCChromaScale0", 0, &v125);
                              if (v125.i8[0])
                              {
                                v125.i8[0] = 0;
                                *(float *)&self->_anon_7c[1016] = (float)(int)objc_msgSend(v61, "cmi_intValueForKey:defaultValue:found:", @"CSCChromaScale1", 0, &v125);
                                if (v125.i8[0])
                                {
                                  int v36 = 0;
                                  *(float32x2_t *)&self->_anon_7c[1012] = vmul_f32(*(float32x2_t *)&self->_anon_7c[1012], (float32x2_t)0x3900000039000000);
                                  goto LABEL_75;
                                }
                              }
                              goto LABEL_212;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_212:
          int v36 = FigSignalErrorAt();
LABEL_75:
          if (*MEMORY[0x263F00E10] == 1) {
            kdebug_trace();
          }

          if (!v36)
          {
            v73 = [v11 objectForKeyedSubscript:@"Histogram"];
            id v74 = [v73 objectForKeyedSubscript:@"Config"];
            if (*MEMORY[0x263F00E10] == 1) {
              kdebug_trace();
            }
            v125.i8[0] = 0;
            self->_anon_7c[1028] = objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", @"Enable", 0, &v125) != 0;
            if (v125.i8[0])
            {
              v125.i8[0] = 0;
              self->_anon_7c[1029] = objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", @"CountClipEnable", 0, &v125) != 0;
              if (v125.i8[0])
              {
                uint64_t v75 = 0;
                v125.i8[0] = 0;
                while (1)
                {
                  *(float *)&self->_anon_7c[4 * v75 + 1172] = (float)(int)objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"DBOffset", v75, 0, &v125);
                  if (!v125.i8[0]) {
                    break;
                  }
                  if (++v75 == 3)
                  {
                    uint64_t v76 = 0;
                    v125.i8[0] = 0;
                    while (1)
                    {
                      *(float *)&self->_anon_7c[4 * v76 + 1156] = (float)(int)objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"DBMin", v76, 0, &v125);
                      if (!v125.i8[0]) {
                        goto LABEL_213;
                      }
                      if (++v76 == 3)
                      {
                        uint64_t v77 = 0;
                        v125.i8[0] = 0;
                        while (1)
                        {
                          *(float *)&self->_anon_7c[4 * v77 + 1140] = (float)(int)objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"DBMax", v77, 0, &v125);
                          if (!v125.i8[0]) {
                            goto LABEL_213;
                          }
                          if (++v77 == 3)
                          {
                            uint64_t v78 = 0;
                            v125.i8[0] = 0;
                            v79 = (float32x4_t *)&self->_anon_7c[1124];
                            while (1)
                            {
                              v79->f32[v78] = (float)(int)objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"DBGain", v78, 0, &v125);
                              if (!v125.i8[0]) {
                                goto LABEL_213;
                              }
                              if (++v78 == 3)
                              {
                                float32x4_t *v79 = vmulq_f32(*v79, (float32x4_t)vdupq_n_s32(0x38800000u));
                                v125.i8[0] = 0;
                                v80 = [v74 objectForKeyedSubscript:@"Region"];
                                *(_WORD *)&self->_anon_7c[1030] = objc_msgSend(v80, "cmi_intValueForKey:defaultValue:found:", @"StartX", 0, &v125);

                                if (v125.i8[0])
                                {
                                  v125.i8[0] = 0;
                                  v81 = [v74 objectForKeyedSubscript:@"Region"];
                                  *(_WORD *)&self->_anon_7c[1032] = objc_msgSend(v81, "cmi_intValueForKey:defaultValue:found:", @"StartY", 0, &v125);

                                  if (v125.i8[0])
                                  {
                                    *(_WORD *)&self->_anon_7c[1030] >>= 2;
                                    *(_WORD *)&self->_anon_7c[1032] >>= 2;
                                    v125.i8[0] = 0;
                                    v82 = [v74 objectForKeyedSubscript:@"Region"];
                                    *(_WORD *)&self->_anon_7c[1034] = objc_msgSend(v82, "cmi_intValueForKey:defaultValue:found:", @"EndX", 0, &v125);

                                    if (v125.i8[0])
                                    {
                                      v125.i8[0] = 0;
                                      v83 = [v74 objectForKeyedSubscript:@"Region"];
                                      *(_WORD *)&self->_anon_7c[1036] = objc_msgSend(v83, "cmi_intValueForKey:defaultValue:found:", @"EndY", 0, &v125);

                                      if (v125.i8[0])
                                      {
                                        *(_WORD *)&self->_anon_7c[1034] >>= 2;
                                        *(_WORD *)&self->_anon_7c[1036] >>= 2;
                                        v125.i8[0] = 0;
                                        *(float *)&self->_anon_7c[1040] = (float)(int)objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", @"C1Offset", 0, &v125);
                                        if (v125.i8[0])
                                        {
                                          v125.i8[0] = 0;
                                          *(float *)&self->_anon_7c[1044] = (float)(int)objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", @"C2Offset", 0, &v125);
                                          if (v125.i8[0])
                                          {
                                            v125.i8[0] = 0;
                                            *(float *)&self->_anon_7c[1048] = (float)(int)objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", @"C1Scale", 0, &v125);
                                            if (v125.i8[0])
                                            {
                                              v125.i8[0] = 0;
                                              float v84 = (float)(int)objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", @"C2Scale", 0, &v125);
                                              *(float *)&self->_anon_7c[1052] = v84;
                                              if (v125.i8[0])
                                              {
                                                uint64_t v85 = 0;
                                                *(float *)&self->_anon_7c[1048] = *(float *)&self->_anon_7c[1048]
                                                                                * 0.000015259;
                                                *(float *)&self->_anon_7c[1052] = v84 * 0.000015259;
                                                v125.i8[0] = 0;
                                                while (1)
                                                {
                                                  *(_WORD *)&self->_anon_7c[2 * v85 + 1056] = objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"Count", v85, 0, &v125);
                                                  if (!v125.i8[0]) {
                                                    break;
                                                  }
                                                  if (++v85 == 16)
                                                  {
                                                    uint64_t v86 = 0;
                                                    v125.i8[0] = 0;
                                                    while (1)
                                                    {
                                                      *(_WORD *)&self->_anon_7c[2 * v86 + 1088] = objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"YThd", v86, 0, &v125);
                                                      if (!v125.i8[0]) {
                                                        goto LABEL_213;
                                                      }
                                                      if (++v86 == 15)
                                                      {
                                                        int v36 = 0;
                                                        *(_WORD *)&self->_anon_7c[1118] = -1;
                                                        goto LABEL_109;
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                                goto LABEL_213;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
LABEL_213:
            int v36 = FigSignalErrorAt();
LABEL_109:
            if (*MEMORY[0x263F00E10] == 1) {
              kdebug_trace();
            }

            if (!v36)
            {
              id v87 = [v11 objectForKeyedSubscript:@"PixelFilter"];
              if (*MEMORY[0x263F00E10] == 1) {
                kdebug_trace();
              }
              v88 = [v87 objectAtIndexedSubscript:0];
              v125.i8[0] = 0;
              self->_anon_7c[1188] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"CondSel", 0, &v125);
              if (!v125.i8[0]) {
                goto LABEL_248;
              }
              v125.i8[0] = 0;
              self->_anon_7c[1189] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"StatSel", 0, &v125);
              if (!v125.i8[0]) {
                goto LABEL_248;
              }
              v125.i8[0] = 0;
              self->_anon_7c[1190] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"CountClipEnable", 0, &v125) != 0;
              if (!v125.i8[0]) {
                goto LABEL_248;
              }
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1192] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"LumaMin", 0, &v125);
              if (!v125.i8[0]) {
                goto LABEL_248;
              }
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1196] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"LumaMax", 0, &v125);
              if (!v125.i8[0]) {
                goto LABEL_248;
              }
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1200] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"C1Min", 0, &v125);
              if (!v125.i8[0]) {
                goto LABEL_248;
              }
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1204] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"C1Max", 0, &v125);
              if (!v125.i8[0]) {
                goto LABEL_248;
              }
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1208] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"C2Min", 0, &v125);
              if (!v125.i8[0]) {
                goto LABEL_248;
              }
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1212] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"C2Max", 0, &v125);
              if (!v125.i8[0]) {
                goto LABEL_248;
              }
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1216] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"LineMax", 0, &v125);
              if (!v125.i8[0]) {
                goto LABEL_248;
              }
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1220] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"LineOffset", 0, &v125);
              if (v125.i8[0]
                && (v125.i8[0] = 0,
                    *(_DWORD *)&self->_anon_7c[1224] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"LineDeltaC1", 0, &v125), v125.i8[0])&& (v125.i8[0] = 0, *(_DWORD *)&self->_anon_7c[1228] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", @"LineDeltaC2", 0, &v125), v125.i8[0]))
              {
                int v36 = 0;
              }
              else
              {
LABEL_248:
                int v36 = FigSignalErrorAt();
              }
              if (*MEMORY[0x263F00E10] == 1) {
                kdebug_trace();
              }

              if (!v36)
              {
                v89 = [v11 objectForKeyedSubscript:@"PixelFilter"];
                id v90 = [v89 objectAtIndexedSubscript:0];
                uint64_t v91 = 0;
                v125.i8[0] = 0;
                v92 = (float32x4_t *)&self->_anon_7c[1300];
                while (1)
                {
                  v92->f32[v91] = (float)(int)objc_msgSend(v90, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"DBGain", v91, 0, &v125);
                  if (!v125.i8[0]) {
                    break;
                  }
                  if (++v91 == 3)
                  {
                    uint64_t v93 = 0;
                    float32x4_t *v92 = vmulq_f32(*v92, (float32x4_t)vdupq_n_s32(0x38800000u));
                    v125.i8[0] = 0;
                    while (1)
                    {
                      *(_DWORD *)&self->_anon_7c[4 * v93 + 1284] = objc_msgSend(v90, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"DBOffset", v93, 0, &v125);
                      if (!v125.i8[0]) {
                        goto LABEL_201;
                      }
                      if (++v93 == 3)
                      {
                        int v36 = 0;
                        goto LABEL_138;
                      }
                    }
                  }
                }
LABEL_201:
                int v36 = FigSignalErrorAt();
LABEL_138:

                if (!v36)
                {
                  id v94 = [v11 objectForKeyedSubscript:@"PixelFilter"];
                  if (*MEMORY[0x263F00E10] == 1) {
                    kdebug_trace();
                  }
                  v95 = [v94 objectAtIndexedSubscript:1];
                  v125.i8[0] = 0;
                  self->_anon_7c[1232] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"CondSel", 0, &v125);
                  if (!v125.i8[0]) {
                    goto LABEL_249;
                  }
                  v125.i8[0] = 0;
                  self->_anon_7c[1233] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"StatSel", 0, &v125);
                  if (!v125.i8[0]) {
                    goto LABEL_249;
                  }
                  v125.i8[0] = 0;
                  self->_anon_7c[1234] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"CountClipEnable", 0, &v125) != 0;
                  if (!v125.i8[0]) {
                    goto LABEL_249;
                  }
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1236] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"LumaMin", 0, &v125);
                  if (!v125.i8[0]) {
                    goto LABEL_249;
                  }
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1240] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"LumaMax", 0, &v125);
                  if (!v125.i8[0]) {
                    goto LABEL_249;
                  }
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1244] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"C1Min", 0, &v125);
                  if (!v125.i8[0]) {
                    goto LABEL_249;
                  }
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1248] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"C1Max", 0, &v125);
                  if (!v125.i8[0]) {
                    goto LABEL_249;
                  }
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1252] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"C2Min", 0, &v125);
                  if (!v125.i8[0]) {
                    goto LABEL_249;
                  }
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1256] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"C2Max", 0, &v125);
                  if (!v125.i8[0]) {
                    goto LABEL_249;
                  }
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1260] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"LineMax", 0, &v125);
                  if (!v125.i8[0]) {
                    goto LABEL_249;
                  }
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1264] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"LineOffset", 0, &v125);
                  if (v125.i8[0]
                    && (v125.i8[0] = 0,
                        *(_DWORD *)&self->_anon_7c[1268] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"LineDeltaC1", 0, &v125), v125.i8[0])&& (v125.i8[0] = 0, *(_DWORD *)&self->_anon_7c[1272] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", @"LineDeltaC2", 0, &v125), v125.i8[0]))
                  {
                    int v36 = 0;
                  }
                  else
                  {
LABEL_249:
                    int v36 = FigSignalErrorAt();
                  }
                  if (*MEMORY[0x263F00E10] == 1) {
                    kdebug_trace();
                  }

                  if (!v36)
                  {
                    v96 = [v11 objectForKeyedSubscript:@"PixelFilter"];
                    id v97 = [v96 objectAtIndexedSubscript:1];
                    uint64_t v98 = 0;
                    v125.i8[0] = 0;
                    v99 = (float32x4_t *)&self->_anon_7c[1332];
                    while (1)
                    {
                      v99->f32[v98] = (float)(int)objc_msgSend(v97, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"DBGain", v98, 0, &v125);
                      if (!v125.i8[0]) {
                        break;
                      }
                      if (++v98 == 3)
                      {
                        uint64_t v100 = 0;
                        float32x4_t *v99 = vmulq_f32(*v99, (float32x4_t)vdupq_n_s32(0x38800000u));
                        v125.i8[0] = 0;
                        while (1)
                        {
                          *(_DWORD *)&self->_anon_7c[4 * v100 + 1316] = objc_msgSend(v97, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"DBOffset", v100, 0, &v125);
                          if (!v125.i8[0]) {
                            goto LABEL_202;
                          }
                          if (++v100 == 3)
                          {
                            int v36 = 0;
                            goto LABEL_165;
                          }
                        }
                      }
                    }
LABEL_202:
                    int v36 = FigSignalErrorAt();
LABEL_165:

                    if (!v36)
                    {
                      v101 = [v11 objectForKeyedSubscript:@"Tile"];
                      v102 = [v119 validRectInBufferCoords];
                      v103 = [v119 regionOfInterestRectInBufferCoords];
                      int v36 = [(AWBStatistics *)self configWindowsV2:&self->_anon_7c[1388] metadata:v121 tilesConfig:v101 validRect:v102 regionOfInterestRect:v103];

                      if (!v36)
                      {
                        id v104 = [v11 objectForKeyedSubscript:@"Tile"];
                        if (*MEMORY[0x263F00E10] == 1) {
                          kdebug_trace();
                        }
                        v125.i8[0] = 0;
                        self->_anon_7c[1444] = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", @"Bitdepth", 0, &v125) != 0;
                        if (!v125.i8[0]) {
                          goto LABEL_247;
                        }
                        v125.i8[0] = 0;
                        *(_DWORD *)&self->_anon_7c[1448] = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", @"StartX", 0, &v125);
                        if (!v125.i8[0]) {
                          goto LABEL_247;
                        }
                        v125.i8[0] = 0;
                        int v105 = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", @"StartY", 0, &v125);
                        *(_DWORD *)&self->_anon_7c[1452] = v105;
                        if (!v125.i8[0]) {
                          goto LABEL_247;
                        }
                        *(int *)&self->_anon_7c[1448] /= 4;
                        *(_DWORD *)&self->_anon_7c[1452] = v105 / 4;
                        v125.i8[0] = 0;
                        *(_DWORD *)&self->_anon_7c[1456] = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", @"EndX", 0, &v125);
                        if (!v125.i8[0]) {
                          goto LABEL_247;
                        }
                        v125.i8[0] = 0;
                        int v106 = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", @"EndY", 0, &v125);
                        *(_DWORD *)&self->_anon_7c[1460] = v106;
                        if (!v125.i8[0]) {
                          goto LABEL_247;
                        }
                        *(int *)&self->_anon_7c[1456] /= 4;
                        *(_DWORD *)&self->_anon_7c[1460] = v106 / 4;
                        v125.i8[0] = 0;
                        *(_WORD *)&self->_anon_7c[1464] = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", @"IntervalX", 0, &v125);
                        if (v125.i8[0]
                          && (v125.i8[0] = 0,
                              unsigned __int16 v107 = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", @"IntervalY", 0, &v125), *(_WORD *)&self->_anon_7c[1466] = v107, v125.i8[0]))
                        {
                          int v36 = 0;
                          *(_WORD *)&self->_anon_7c[1464] >>= 2;
                          *(_WORD *)&self->_anon_7c[1466] = v107 >> 2;
                        }
                        else
                        {
LABEL_247:
                          int v36 = FigSignalErrorAt();
                        }
                        if (*MEMORY[0x263F00E10] == 1) {
                          kdebug_trace();
                        }

                        if (!v36)
                        {
                          int v36 = configLSC((uint64_t)&self->_anon_7c[1348], v121, v118, v116);
                          if (!v36)
                          {
                            *(_DWORD *)&self->_anon_7c[2592] = [(NSNumber *)self->_digitalFlash intValue];
                            v108 = self->_faceAssistedBehaviorMode;
                            if (!v108)
                            {
                              v114 = [NSNumber numberWithInt:0];
                              v115 = self->_faceAssistedBehaviorMode;
                              self->_faceAssistedBehaviorMode = v114;

                              FigSignalErrorAt();
                              v108 = self->_faceAssistedBehaviorMode;
                            }
                            if ((objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](v108, "intValue")), v109 = (NSNumber *)objc_claimAutoreleasedReturnValue(), v110 = self->_faceAssistedBehaviorMode, self->_faceAssistedBehaviorMode = v109, v110, -[NSNumber intValue](self->_faceAssistedBehaviorMode, "intValue") != 2)&& -[NSNumber intValue](self->_faceAssistedBehaviorMode, "intValue") != 3|| (int v36 = -[AWBStatistics _loadANSTNetwork](self, "_loadANSTNetwork")) == 0)
                            {
                              int v111 = configLinearRGBToANSTInput((uint64_t)&self->_anon_7c[1476], v121);
LABEL_187:
                              int v36 = v111;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      v122 = 0;
      int v36 = FigSignalErrorAt();
      id v31 = 0;
    }
  }
  else
  {
    v122 = 0;
    int v36 = FigSignalErrorAt();
    id v31 = 0;
    uint64_t v11 = 0;
    v120 = 0;
  }
LABEL_188:
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v36;
}

- (int)_adjustConfigToValidRectInBufferCoords:(id)a3 validRectInSensorReadoutCoords:(id)a4 regionOfInterestRectInBufferCoords:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [(NSNumber *)self->_downsizeFactor unsignedIntValue];
  id v12 = v8;
  memset(&rect, 0, sizeof(rect));
  if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v12, &rect))
  {
    unsigned __int8 v13 = [v12 objectForKeyedSubscript:@"FullWidth"];
    int v14 = [v13 intValue];

    v15 = [v12 objectForKeyedSubscript:@"FullHeight"];
    int v16 = [v15 intValue];

    if (v14)
    {
      if (v16)
      {
        double width = rect.size.width;
        double height = rect.size.height;
        if (rect.size.width <= (double)v14 && rect.size.height <= (double)v16)
        {
          self->_awbStatCfg.downsizeRatio = v11;
          HIDWORD(v20) = v11;
          LODWORD(v20) = v11;
          if (((v20 >> 2) & 0xC000003F) <= 4)
          {
            if ((_BYTE)v11)
            {
LABEL_13:

              goto LABEL_15;
            }
            int layout = self->_awbStatCfg.layout;
            if ((layout - 1) < 2)
            {
              unsigned __int8 v22 = 8;
LABEL_12:
              self->_awbStatCfg.downsizeRatio = v22;
              goto LABEL_13;
            }
            if (layout == 3)
            {
              self->_awbStatCfg.downsizeRatio = 8;
              float v31 = width;
              float v32 = height * v31 / 199584.0;
              float v33 = sqrtf(v32);
              if (v33 <= 8.0 || v33 > 12.0)
              {
                if (v33 <= 12.0) {
                  goto LABEL_13;
                }
                unsigned __int8 v22 = 16;
              }
              else
              {
                unsigned __int8 v22 = 12;
              }
              goto LABEL_12;
            }
            self->_awbStatCfg.downsizeRatio = 0;
          }
        }
      }
    }
  }
  int v23 = FigSignalErrorAt();

  if (v23) {
    goto LABEL_71;
  }
LABEL_15:
  CFDictionaryRef v24 = (const __CFDictionary *)v12;
  id v25 = v9;
  memset(&rect, 0, sizeof(rect));
  memset(&v85, 0, sizeof(v85));
  if (!CGRectMakeWithDictionaryRepresentation(v24, &rect)) {
    goto LABEL_34;
  }
  id v26 = [(__CFDictionary *)v24 objectForKeyedSubscript:@"FullWidth"];
  int v27 = [v26 intValue];

  float v28 = [(__CFDictionary *)v24 objectForKeyedSubscript:@"FullHeight"];
  int v29 = [v28 intValue];

  if (!v27) {
    goto LABEL_34;
  }
  if (v29 && rect.size.width <= (double)v27 && rect.size.height <= (double)v29)
  {
    if (!v25) {
      goto LABEL_40;
    }
    if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v25, &v85))
    {
      if (rect.size.width <= v85.size.width && rect.size.height <= v85.size.height)
      {
        double y = v85.origin.y;
        *(_WORD *)&self->_anon_7c[1380] = (int)v85.origin.x;
LABEL_44:
        *(_WORD *)&self->_anon_7c[1382] = (int)y;

        goto LABEL_45;
      }
      FigSignalErrorAt();
LABEL_40:
      char v36 = self->_awbStatCfg.layout == 3 && sqrtf((float)(v29 * v27 / 199584)) <= 8.0;
      double v37 = rect.size.height;
      *(_WORD *)&self->_anon_7c[1380] = (int)(((double)(v27 << v36) - rect.size.width) * 0.5);
      double y = ((double)(v29 << v36) - v37) * 0.5;
      goto LABEL_44;
    }
    int v35 = FigSignalErrorAt();
  }
  else
  {
LABEL_34:
    int v35 = FigSignalErrorAt();
  }
  int v23 = v35;

  if (v23) {
    goto LABEL_71;
  }
LABEL_45:
  CFDictionaryRef v38 = v24;
  CFDictionaryRef v39 = (const __CFDictionary *)v10;
  memset(&rect, 0, sizeof(rect));
  memset(&v85, 0, sizeof(v85));
  if (!CGRectMakeWithDictionaryRepresentation(v38, &rect)) {
    goto LABEL_72;
  }
  if (v39)
  {
    if (CGRectMakeWithDictionaryRepresentation(v39, &v85))
    {
      if (CGRectContainsRect(rect, v85))
      {
        LOBYTE(v41) = self->_awbStatCfg.downsizeRatio;
        *(double *)&uint64_t v42 = (double)v41;
        v85.origin = (CGPoint)vdivq_f64((float64x2_t)v85.origin, (float64x2_t)vdupq_lane_s64(v42, 0));
        CGFloat v43 = v85.size.width / *(double *)&v42;
        double v40 = v85.size.height / *(double *)&v42;
        v85.size.double width = v43;
        v85.size.double height = v40;
        if (floor(v43 * 0.975 * 0.03125 * 0.25) * 4.0 <= 0.0)
        {
          unsigned int v44 = 0;
        }
        else
        {
          double v40 = floor(v40 * 0.975 * 0.03125 * 0.25) * 4.0;
          unsigned int v44 = v40 > 0.0;
        }
        int v45 = 1;
      }
      else
      {
        FigSignalErrorAt();
        unsigned int v44 = 0;
        int v45 = 0;
      }
      goto LABEL_54;
    }
LABEL_72:
    int v23 = FigSignalErrorAt();

    if (v23) {
      goto LABEL_71;
    }
    float64x2_t v83 = 0u;
    float64x2_t v84 = 0u;
    goto LABEL_58;
  }
  unsigned int v44 = 0;
  int v45 = 0;
LABEL_54:
  LOBYTE(v40) = self->_awbStatCfg.downsizeRatio;
  double v46 = (double)*(unint64_t *)&v40;
  *(double *)v47.i64 = rect.origin.x / (double)*(unint64_t *)&v40;
  double v48 = rect.origin.y / v46;
  *(void *)&rect.origin.int x = v47.i64[0];
  rect.origin.double y = rect.origin.y / v46;
  double v49 = rect.size.width / v46;
  double v50 = rect.size.height / v46;
  rect.size.double width = v49;
  rect.size.double height = v50;
  if (v45)
  {
    v51.i64[0] = *(void *)&v85.origin.x;
    double v48 = v85.origin.y;
    int x = (int)v85.origin.x;
    double v50 = v85.size.height;
    int v53 = (int)v85.size.width + (int)v85.origin.x;
  }
  else
  {
    int x = (int)*(double *)v47.i64;
    int v53 = (int)v49 + (int)*(double *)v47.i64;
    v51.i64[0] = *(void *)&v85.origin.x;
  }
  *(_WORD *)&self->_anon_7c[2580] = x;
  *(_WORD *)&self->_anon_7c[2582] = (int)v48;
  *(_WORD *)&self->_anon_7c[2584] = v53;
  *(_WORD *)&self->_anon_7c[2586] = (int)v48 + (int)v50;
  int32x2_t v54 = vdup_n_s32(v44);
  v55.i64[0] = v54.u32[0];
  v55.i64[1] = v54.u32[1];
  int8x16_t v56 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v55, 0x3FuLL));
  v51.i64[1] = *(void *)&v85.origin.y;
  v47.i64[1] = *(void *)&rect.origin.y;
  float64x2_t v84 = (float64x2_t)vbslq_s8(v56, v51, v47);
  float64x2_t v83 = (float64x2_t)vbslq_s8(v56, (int8x16_t)v85.size, (int8x16_t)rect.size);

LABEL_58:
  int v57 = (int *)MEMORY[0x263F00E10];
  int v58 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v58 = *v57;
  }
  float64x2_t v59 = vaddq_f64(v83, v84);
  float64x2_t v60 = vmulq_f64(vmulq_f64(v83, (float64x2_t)vdupq_n_s64(0x3FEF333333333333uLL)), (float64x2_t)vdupq_n_s64(0x3FA0000000000000uLL));
  __asm
  {
    FMOV            V2.2D, #4.0
    FMOV            V3.2D, #0.25
    FMOV            V4.2D, #1.0
  }
  int8x8_t v82 = (int8x8_t)vmovn_s64((int64x2_t)vcvtq_n_u64_f64(vrndmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, v60), _Q4, (int8x16_t)vmulq_f64(v60, _Q3))), 2uLL));
  *(int32x2_t *)&v60.f64[0] = vshl_n_s32((int32x2_t)vand_s8(v82, (int8x8_t)0xFFFF0000FFFFLL), 5uLL);
  v68.i64[0] = SLODWORD(v60.f64[0]);
  v68.i64[1] = SHIDWORD(v60.f64[0]);
  float64x2_t v69 = vrndmq_f64(vmulq_f64(vsubq_f64(v83, vcvtq_f64_s64(v68)), _Q3));
  __asm { FMOV            V3.2D, #2.0 }
  float64x2_t v71 = vmlaq_f64(v84, _Q3, v69);
  int32x2_t v72 = vmovn_s64(vcvtq_s64_f64((float64x2_t)vbicq_s8((int8x16_t)v71, (int8x16_t)vcltzq_f64(v71))));
  *(int32x2_t *)&v60.f64[0] = vadd_s32(*(int32x2_t *)&v60.f64[0], v72);
  v68.i64[0] = SLODWORD(v60.f64[0]);
  v68.i64[1] = SHIDWORD(v60.f64[0]);
  float64x2_t v73 = vcvtq_f64_s64(v68);
  *(int32x2_t *)&_Q3.f64[0] = vmovn_s64(vcgtq_f64(v59, v73));
  char v74 = BYTE4(_Q3.f64[0]);
  if (LOBYTE(_Q3.f64[0])) {
    double v75 = v73.f64[0];
  }
  else {
    double v75 = v59.f64[0];
  }
  int v76 = (int)v75;
  double v77 = v73.f64[1];
  if ((v74 & 1) == 0) {
    double v77 = v59.f64[1];
  }
  int v78 = (int)v77;
  __int32 v79 = v72.i32[1];
  __int32 v80 = v72.i32[0];
  *(_WORD *)&self->_anon_7c[1030] = v72.i16[0];
  *(_WORD *)&self->_anon_7c[1032] = v72.i16[2];
  *(_WORD *)&self->_anon_7c[1034] = v76;
  *(_WORD *)&self->_anon_7c[1036] = (int)v77;
  if (v58 == 1)
  {
    kdebug_trace();
    int v58 = *v57;
    if (*v57 == 1)
    {
      kdebug_trace();
      int v58 = *v57;
    }
  }
  *(_DWORD *)&self->_anon_7c[1448] = v80;
  *(_DWORD *)&self->_anon_7c[1452] = v79;
  *(_DWORD *)&self->_anon_7c[1456] = v76;
  *(_DWORD *)&self->_anon_7c[1460] = v78;
  *(_WORD *)&self->_anon_7c[1464] = v82.i16[0];
  *(_WORD *)&self->_anon_7c[1466] = v82.i16[2];
  if (v58 == 1) {
    kdebug_trace();
  }
  int v23 = 0;
LABEL_71:

  return v23;
}

- (int)process:(id)a3 clipped:(id)a4 lscGainsTex:(id)a5 validRectInBufferCoords:(id)a6 validRectInSensorReadoutCoords:(id)a7 awbStatsBuffer:(id)a8 awbTileStatsConfig:(id *)a9 anstSkinMask:(id)a10 anstSkinMaskData:(id *)a11 skyMaskTex:(id)a12 skyMaskData:(id *)a13 regionOfInterestRectInBufferCoords:(id)a14 downsizeFactor:(unsigned int *)a15
{
  v209[2] = *MEMORY[0x263EF8340];
  id v167 = a3;
  id v159 = a4;
  id v158 = a5;
  id v160 = a6;
  id v161 = a7;
  id v163 = a8;
  id v166 = a10;
  id v164 = a12;
  id v20 = a14;
  id v206 = 0;
  id v207 = 0;
  uint64_t v21 = *MEMORY[0x263F04078];
  v208[0] = *MEMORY[0x263F04130];
  v208[1] = v21;
  v209[0] = MEMORY[0x263EFFA78];
  v209[1] = &unk_26F3F22F8;
  v157 = v20;
  CFDictionaryRef pixelBufferAttributes = [NSDictionary dictionaryWithObjects:v209 forKeys:v208 count:2];
  CVPixelBufferRef v204 = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferRef v203 = 0;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  uint64_t v202 = 0;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v199 = 0u;
  [v167 pixelFormat];
  MTLPixelFormatGetInfo();
  int v22 = [(AWBStatistics *)self _adjustConfigToValidRectInBufferCoords:v160 validRectInSensorReadoutCoords:v161 regionOfInterestRectInBufferCoords:v20];
  if (v22)
  {
    BOOL v28 = 0;
    BOOL v165 = 0;
    v171 = 0;
    v172 = 0;
    v115 = 0;
    v168 = 0;
    v169 = 0;
    [0 endEncoding];
    goto LABEL_89;
  }
  unsigned int downsizeRatio = self->_awbStatCfg.downsizeRatio;
  unsigned __int16 v24 = *(_WORD *)&self->_anon_7c[1464] * downsizeRatio;
  unsigned __int16 v25 = *(_WORD *)&self->_anon_7c[1466] * downsizeRatio;
  a9->var0 = self->_anon_7c[1444];
  *(int32x4_t *)&a9->var1 = vmulq_s32(*(int32x4_t *)&self->_anon_7c[1448], vdupq_n_s32(downsizeRatio));
  a9->var5 = v24;
  a9->var6 = v25;
  if ((*(_DWORD *)&self->_anon_7c[1456] - *(_DWORD *)&self->_anon_7c[1448])
     / *(unsigned __int16 *)&self->_anon_7c[1464] >= 32)
    int v26 = 32;
  else {
    int v26 = (*(_DWORD *)&self->_anon_7c[1456] - *(_DWORD *)&self->_anon_7c[1448])
  }
        / *(unsigned __int16 *)&self->_anon_7c[1464];
  if ((*(_DWORD *)&self->_anon_7c[1460] - *(_DWORD *)&self->_anon_7c[1452])
     / *(unsigned __int16 *)&self->_anon_7c[1466] >= 32)
    int v27 = 32;
  else {
    int v27 = (*(_DWORD *)&self->_anon_7c[1460] - *(_DWORD *)&self->_anon_7c[1452])
  }
        / *(unsigned __int16 *)&self->_anon_7c[1466];
  *a15 = downsizeRatio;
  if (v166) {
    BOOL v165 = [(NSNumber *)self->_faceAssistedBehaviorMode intValue] == 1;
  }
  else {
    BOOL v165 = 0;
  }
  if (self->_espressoPlan) {
    BOOL v28 = [(NSNumber *)self->_faceAssistedBehaviorMode intValue] == 2
  }
       || [(NSNumber *)self->_faceAssistedBehaviorMode intValue] == 3;
  else {
    BOOL v28 = 0;
  }
  if (v165
    && ((unint64_t)[v166 width] <= 0xFF && (unint64_t)objc_msgSend(v166, "height") < 0xC0
     || [v166 pixelFormat] != 25
     && [v166 pixelFormat] != 55
     && [v166 pixelFormat] != 10
     && [v166 pixelFormat] != 20))
  {
    int v22 = FigSignalErrorAt();
    BOOL v165 = 1;
    goto LABEL_143;
  }
  if (!v28)
  {
    unsigned int v44 = 0;
    v168 = 0;
    goto LABEL_30;
  }
  int v29 = objc_opt_new();
  char v30 = v29;
  if (!v29)
  {
    int v22 = FigSignalErrorAt();
    BOOL v28 = 1;
LABEL_143:
    v172 = 0;
    v115 = 0;
    v168 = 0;
    goto LABEL_144;
  }
  float v31 = [v29 desc];
  [v31 setTextureType:2];

  float v32 = [v30 desc];
  [v32 setPixelFormat:113];

  unint64_t v33 = [v167 width];
  unint64_t v34 = self->_awbStatCfg.downsizeRatio;
  int v35 = [v30 desc];
  [v35 setWidth:v33 / v34];

  unint64_t v36 = [v167 height];
  unint64_t v37 = self->_awbStatCfg.downsizeRatio;
  CFDictionaryRef v38 = [v30 desc];
  [v38 setHeight:v36 / v37];

  CFDictionaryRef v39 = [v30 desc];
  [v39 setDepth:1];

  double v40 = [v30 desc];
  [v40 setArrayLength:1];

  unint64_t v41 = [v30 desc];
  [v41 setStorageMode:0];

  uint64_t v42 = [v30 desc];
  [v42 setUsage:7];

  [v30 setLabel:0];
  CGFloat v43 = [(FigMetalContext *)self->_metalContext allocator];
  unsigned int v44 = (void *)[v43 newTextureWithDescriptor:v30];
  id v207 = v44;

  if (!v44)
  {
    int v22 = FigSignalErrorAt();
    BOOL v28 = 1;
    v172 = 0;
    v115 = 0;
    v168 = v30;
    goto LABEL_144;
  }
  v168 = v30;
LABEL_30:
  int v45 = [(FigMetalContext *)self->_metalContext commandQueue];
  v169 = [v45 commandBuffer];

  if (!v169)
  {
    int v22 = FigSignalErrorAt();
    v172 = 0;
    v115 = 0;
LABEL_144:
    v171 = 0;
    v169 = 0;
    [0 endEncoding];
    goto LABEL_89;
  }
  if (*MEMORY[0x263F00E10])
  {
    double v46 = [v169 commandQueue];
    int8x16_t v47 = [v46 commandBuffer];

    [v47 setLabel:@"KTRACE_MTLCMDBUF"];
    [v47 addCompletedHandler:&__block_literal_global_0];
    [v47 commit];
    [v169 addCompletedHandler:&__block_literal_global_89];
  }
  double v48 = [v169 computeCommandEncoder];
  if (!v48)
  {
    int v22 = FigSignalErrorAt();
    v171 = 0;
    v172 = 0;
LABEL_150:
    v115 = 0;
    goto LABEL_88;
  }
  int v49 = DWORD2(v199);
  v171 = v48;
  [v48 setComputePipelineState:self->_resetMtlBufferPipelineState];
  [v171 setBuffer:v163 offset:0 atIndex:1];
  unint64_t v197 = (unint64_t)[v163 length] >> 2;
  int64x2_t v198 = vdupq_n_s64(1uLL);
  uint64_t v195 = [(MTLComputePipelineState *)self->_resetMtlBufferPipelineState threadExecutionWidth];
  int64x2_t v196 = v198;
  [v171 dispatchThreads:&v197 threadsPerThreadgroup:&v195];
  [v171 setTexture:v167 atIndex:0];
  [v171 setTexture:v159 atIndex:1];
  if ((v49 & 0x10000) != 0) {
    [v171 setTexture:v158 atIndex:2];
  }
  self->_anon_7c[2588] = [(NSNumber *)self->_skipDemosaic BOOLValue];
  *(_DWORD *)&self->_anon_7c[2592] = [(NSNumber *)self->_digitalFlash intValue];
  [(NSNumber *)self->_lscMaxGain floatValue];
  *(_DWORD *)&self->_anon_7c[1356] = v50;
  [v171 setBytes:&self->_awbStatCfg length:2608 atIndex:0];
  if (v28) {
    [v171 setTexture:v44 atIndex:5];
  }
  if ((v49 & 0x10000) != 0)
  {
    if (self->_awbStatCfg.layout == 3)
    {
      if ([v158 textureType] != 3)
      {
        int v22 = FigSignalErrorAt();
        goto LABEL_149;
      }
      [v171 setComputePipelineState:self->_computeAWBStatsQuadraFastPipelineState];
      unint64_t v67 = [(MTLComputePipelineState *)self->_computeAWBStatsQuadraFastPipelineState threadExecutionWidth];
      unint64_t v68 = [v167 width];
      unint64_t v69 = self->_awbStatCfg.downsizeRatio;
      uint64_t v70 = [v167 height];
      unint64_t v71 = self->_awbStatCfg.downsizeRatio;
      if (v67 >= v68 / v69 * v70 / v71) {
        unint64_t v72 = v68 / v69 * v70 / v71;
      }
      else {
        unint64_t v72 = v67;
      }
      unint64_t v73 = [(MTLComputePipelineState *)self->_computeAWBStatsQuadraFastPipelineState maxTotalThreadsPerThreadgroup];
      int v58 = self;
      unint64_t v74 = [v167 width];
      unint64_t v75 = self->_awbStatCfg.downsizeRatio;
      uint64_t v76 = [v167 height];
      unint64_t v77 = self->_awbStatCfg.downsizeRatio;
      if (v73 / v72 >= v74 / v75 * v76 / v77 / v72) {
        unint64_t v78 = v74 / v75 * v76 / v77 / v72;
      }
      else {
        unint64_t v78 = v73 / v72;
      }
      unint64_t v79 = [v167 width];
      unint64_t v80 = self->_awbStatCfg.downsizeRatio;
      unint64_t v81 = [v167 height] / v80;
      v194[0] = v79 / v80;
      v194[1] = v81;
      v194[2] = 1;
      v193[0] = v72;
      v193[1] = v78;
      v193[2] = 1;
      [v171 dispatchThreads:v194 threadsPerThreadgroup:v193];
    }
    else
    {
      [v171 setComputePipelineState:self->_computeAWBStatsBayerFastPipelineState];
      unint64_t v82 = [(MTLComputePipelineState *)self->_computeAWBStatsBayerFastPipelineState threadExecutionWidth];
      unint64_t v83 = [v167 width];
      unint64_t v84 = self->_awbStatCfg.downsizeRatio;
      uint64_t v85 = [v167 height];
      unint64_t v86 = self->_awbStatCfg.downsizeRatio;
      if (v82 >= v83 / v84 * v85 / v86) {
        unint64_t v87 = v83 / v84 * v85 / v86;
      }
      else {
        unint64_t v87 = v82;
      }
      unint64_t v88 = [(MTLComputePipelineState *)self->_computeAWBStatsBayerFastPipelineState maxTotalThreadsPerThreadgroup];
      int v58 = self;
      unint64_t v89 = [v167 width];
      unint64_t v90 = self->_awbStatCfg.downsizeRatio;
      uint64_t v91 = [v167 height];
      unint64_t v92 = self->_awbStatCfg.downsizeRatio;
      if (v88 / v87 >= v89 / v90 * v91 / v92 / v87) {
        unint64_t v93 = v89 / v90 * v91 / v92 / v87;
      }
      else {
        unint64_t v93 = v88 / v87;
      }
      unint64_t v94 = [v167 width];
      unint64_t v95 = self->_awbStatCfg.downsizeRatio;
      unint64_t v96 = [v167 height] / v95;
      v192[0] = v94 / v95;
      v192[1] = v96;
      v192[2] = 1;
      v191[0] = v87;
      v191[1] = v93;
      v191[2] = 1;
      [v171 dispatchThreads:v192 threadsPerThreadgroup:v191];
    }
  }
  else
  {
    [v171 setComputePipelineState:self->_computeAWBStatsBayerPipelineState];
    unint64_t v51 = [(MTLComputePipelineState *)self->_computeAWBStatsBayerPipelineState threadExecutionWidth];
    unint64_t v52 = [v167 width];
    unint64_t v53 = self->_awbStatCfg.downsizeRatio;
    uint64_t v54 = [v167 height];
    unint64_t v55 = self->_awbStatCfg.downsizeRatio;
    if (v51 >= v52 / v53 * v54 / v55) {
      unint64_t v56 = v52 / v53 * v54 / v55;
    }
    else {
      unint64_t v56 = v51;
    }
    unint64_t v57 = [(MTLComputePipelineState *)self->_computeAWBStatsBayerPipelineState maxTotalThreadsPerThreadgroup];
    int v58 = self;
    unint64_t v59 = [v167 width];
    unint64_t v60 = self->_awbStatCfg.downsizeRatio;
    uint64_t v61 = [v167 height];
    unint64_t v62 = self->_awbStatCfg.downsizeRatio;
    if (v57 / v56 >= v59 / v60 * v61 / v62 / v56) {
      unint64_t v63 = v59 / v60 * v61 / v62 / v56;
    }
    else {
      unint64_t v63 = v57 / v56;
    }
    unint64_t v64 = [v167 width];
    unint64_t v65 = self->_awbStatCfg.downsizeRatio;
    unint64_t v66 = [v167 height] / v65;
    v190[0] = v64 / v65;
    v190[1] = v66;
    v190[2] = 1;
    v189[0] = v56;
    v189[1] = v63;
    v189[2] = 1;
    [v171 dispatchThreads:v190 threadsPerThreadgroup:v189];
  }
  [v171 setComputePipelineState:v58->_normTileStatsPipelineState];
  unint64_t v97 = [(MTLComputePipelineState *)self->_normTileStatsPipelineState threadExecutionWidth];
  unint64_t v98 = [(MTLComputePipelineState *)self->_normTileStatsPipelineState maxTotalThreadsPerThreadgroup];
  LODWORD(v99) = v27 * v26;
  if (v97 >= v27 * v26) {
    unint64_t v99 = (int)v99;
  }
  else {
    unint64_t v99 = v97;
  }
  v188[0] = v26;
  v188[1] = v27;
  unint64_t v100 = v27 * v26 / v99;
  v188[2] = 1;
  if (v98 / v99 < v100) {
    unint64_t v100 = v98 / v99;
  }
  v187[0] = v99;
  v187[1] = v100;
  v187[2] = 1;
  [v171 dispatchThreads:v188 threadsPerThreadgroup:v187];
  [v171 setComputePipelineState:self->_normWindowStatsPipelineState];
  unint64_t v101 = [(MTLComputePipelineState *)self->_normWindowStatsPipelineState threadExecutionWidth];
  unint64_t v102 = [(MTLComputePipelineState *)self->_normWindowStatsPipelineState maxTotalThreadsPerThreadgroup];
  if (v101 >= 2) {
    unint64_t v103 = 2;
  }
  else {
    unint64_t v103 = v101;
  }
  unint64_t v104 = 2 / v103;
  long long v185 = xmmword_23FF512E0;
  if (v102 / v103 < v104) {
    unint64_t v104 = v102 / v103;
  }
  uint64_t v186 = 1;
  v184[0] = v103;
  v184[1] = v104;
  v184[2] = 1;
  objc_msgSend(v171, "dispatchThreads:threadsPerThreadgroup:", &v185, v184, COERCE_DOUBLE(2));
  if (!v165)
  {
    if (!v28)
    {
      BOOL v165 = 0;
      v172 = 0;
      v115 = 0;
      goto LABEL_87;
    }
    if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x200uLL, 0x180uLL, 0x42475241u, pixelBufferAttributes, &pixelBufferOut))
    {
      if (!pixelBufferOut)
      {
        v138 = 0;
        int v22 = FigSignalErrorAt();
        v172 = 0;
        v115 = 0;
        goto LABEL_129;
      }
      uint64_t v119 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:pixelBufferOut pixelFormat:73 usage:7 plane:0];
      if (v119)
      {
        [v171 setComputePipelineState:self->_fitWbTmRGBToANSTInput];
        [v171 setTexture:v44 atIndex:5];
        [v171 setTexture:v119 atIndex:6];
        unint64_t v120 = [(MTLComputePipelineState *)self->_fitWbTmRGBToANSTInput threadExecutionWidth];
        unint64_t v121 = [(MTLComputePipelineState *)self->_fitWbTmRGBToANSTInput maxTotalThreadsPerThreadgroup];
        if (v120 >= 0x30000) {
          unint64_t v122 = 196608;
        }
        else {
          unint64_t v122 = v120;
        }
        unint64_t v123 = 0x30000 / v122;
        long long v180 = xmmword_23FF512F0;
        if (v121 / v122 < v123) {
          unint64_t v123 = v121 / v122;
        }
        BOOL v28 = 1;
        uint64_t v181 = 1;
        v179[0] = v122;
        v179[1] = v123;
        v179[2] = 1;
        objc_msgSend(v171, "dispatchThreads:threadsPerThreadgroup:", &v180, v179, COERCE_DOUBLE(512));
        BOOL v165 = 0;
        v115 = 0;
        int v22 = 0;
        v172 = (void *)v119;
        goto LABEL_88;
      }
    }
    int v22 = FigSignalErrorAt();
    BOOL v165 = 0;
    BOOL v28 = 1;
    goto LABEL_149;
  }
  int v105 = objc_opt_new();

  if (!v105)
  {
    int v22 = FigSignalErrorAt();
    BOOL v165 = 1;
    v172 = 0;
    v115 = 0;
    v168 = 0;
    goto LABEL_88;
  }
  v168 = v105;
  int v106 = [v105 desc];
  [v106 setTextureType:2];

  unsigned __int16 v107 = [v168 desc];
  [v107 setPixelFormat:10];

  v108 = [v168 desc];
  [v108 setWidth:256];

  v109 = [v168 desc];
  [v109 setHeight:192];

  v110 = [v168 desc];
  [v110 setDepth:1];

  int v111 = [v168 desc];
  [v111 setArrayLength:1];

  v112 = [v168 desc];
  [v112 setUsage:7];

  int v113 = [v168 desc];
  [v113 setStorageMode:0];

  [v168 setLabel:0];
  v114 = [(FigMetalContext *)self->_metalContext allocator];
  v115 = (void *)[v114 newTextureWithDescriptor:v168];

  if (!v115)
  {
    int v22 = FigSignalErrorAt();
    BOOL v165 = 1;
LABEL_149:
    v172 = 0;
    goto LABEL_150;
  }
  [v171 setComputePipelineState:self->_resizeANST];
  uint64_t v116 = [(MTLComputePipelineState *)self->_resizeANST threadExecutionWidth];
  unint64_t v117 = [(MTLComputePipelineState *)self->_resizeANST maxTotalThreadsPerThreadgroup];
  unint64_t v118 = v117 / [(MTLComputePipelineState *)self->_resizeANST threadExecutionWidth];
  [v171 setImageblockWidth:v116 height:v118];
  [v171 setTexture:v166 atIndex:3];
  [v171 setTexture:v115 atIndex:4];
  v183[0] = [v115 width];
  v183[1] = [v115 height];
  v183[2] = 1;
  v182[0] = v116;
  v182[1] = v118;
  BOOL v165 = 1;
  v182[2] = 1;
  [v171 dispatchThreads:v183 threadsPerThreadgroup:v182];
  v172 = 0;
LABEL_87:
  int v22 = 0;
LABEL_88:
  [v171 endEncoding];
LABEL_89:
  [v169 commit];
  [v169 waitUntilCompleted];
  if (v28)
  {
    [@"input_image" UTF8String];
    if (espresso_network_bind_cvpixelbuffer()) {
      goto LABEL_133;
    }
    CFAllocatorRef v124 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x100uLL, 0xC0uLL, 0x4C303066u, pixelBufferAttributes, &v204))
    {
      goto LABEL_133;
    }
    if (!v204) {
      goto LABEL_133;
    }
    [@"skin@output" UTF8String];
    if (espresso_network_bind_cvpixelbuffer()) {
      goto LABEL_133;
    }
    if (espresso_plan_execute_sync()) {
      goto LABEL_133;
    }
    if (CVPixelBufferCreate(v124, 0x100uLL, 0xC0uLL, 0x4C303038u, pixelBufferAttributes, &v203)) {
      goto LABEL_133;
    }
    float32x2_t v125 = v203;
    if (!v203) {
      goto LABEL_133;
    }
    float v126 = v204;
    if (!v204) {
      goto LABEL_153;
    }
    if (CVPixelBufferLockBaseAddress(v204, 1uLL)) {
      goto LABEL_153;
    }
    if (CVPixelBufferLockBaseAddress(v125, 0)) {
      goto LABEL_153;
    }
    BaseAddress = (float *)CVPixelBufferGetBaseAddress(v126);
    if (!BaseAddress) {
      goto LABEL_153;
    }
    float v128 = CVPixelBufferGetBaseAddress(v125);
    if (!v128) {
      goto LABEL_153;
    }
    size_t Width = CVPixelBufferGetWidth(v126);
    size_t Height = CVPixelBufferGetHeight(v126);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v126);
    size_t v132 = CVPixelBufferGetWidth(v125);
    size_t v133 = CVPixelBufferGetHeight(v125);
    size_t v134 = CVPixelBufferGetBytesPerRow(v125);
    if (Width != v132 || Height != v133) {
      goto LABEL_153;
    }
    if (Height)
    {
      for (uint64_t i = 0; i != Height; ++i)
      {
        if (Width)
        {
          for (uint64_t j = 0; j != Width; ++j)
          {
            float v137 = BaseAddress[j];
            if (v137 < 0.0) {
              float v137 = 0.0;
            }
            v128[j] = (int)fminf(v137, 255.0);
          }
        }
        v128 += v134;
        BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
      }
    }
    if (CVPixelBufferUnlockBaseAddress(v126, 1uLL) || CVPixelBufferUnlockBaseAddress(v125, 0))
    {
LABEL_153:
      if (FigSignalErrorAt())
      {
LABEL_133:
        int v22 = FigSignalErrorAt();
        v138 = 0;
        goto LABEL_129;
      }
    }
    [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:v203 pixelFormat:10 usage:1 plane:0];
    v138 = int v22 = 0;
    if (!v138) {
      goto LABEL_129;
    }
    id v139 = v206;
  }
  else
  {
    id v139 = 0;
    v138 = 0;
  }
  if (v165) {
    v140 = v115;
  }
  else {
    v140 = v138;
  }
  id v141 = v140;
  id v206 = v141;

  if (v141)
  {
    [v141 pixelFormat];
    uint64_t v178 = 0;
    long long v176 = 0u;
    long long v177 = 0u;
    long long v175 = 0u;
    v142 = [v141 device];
    MTLPixelFormatGetInfoForDevice();

    [v141 width];
    v143 = (void *)MEMORY[0x263EFF990];
    [v141 height];
    v144 = [v143 dataWithLength:0];
    v145 = v144;
    if (!v144
      || (id v146 = v144,
          uint64_t v147 = [v146 mutableBytes],
          memset(v174, 0, 24),
          v174[3] = [v141 width],
          v174[4] = [v141 height],
          v174[5] = 1,
          [v141 getBytes:v147 bytesPerRow:0 fromRegion:v174 mipmapLevel:0],
          !a11))
    {

      goto LABEL_129;
    }
    id v148 = v146;
    *a11 = v148;
  }
  if (v164)
  {
    [v164 pixelFormat];
    uint64_t v178 = 0;
    long long v176 = 0u;
    long long v177 = 0u;
    long long v175 = 0u;
    v149 = [v164 device];
    MTLPixelFormatGetInfoForDevice();

    uint64_t v150 = *((void *)&v176 + 1);
    uint64_t v151 = [v164 width] * v150;
    v152 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(v164, "height") * v151);
    v153 = v152;
    if (v152)
    {
      id v154 = v152;
      uint64_t v155 = [v154 mutableBytes];
      memset(v173, 0, 24);
      v173[3] = [v164 width];
      v173[4] = [v164 height];
      v173[5] = 1;
      [v164 getBytes:v155 bytesPerRow:v151 fromRegion:v173 mipmapLevel:0];
      if (a13) {
        *a13 = v154;
      }
    }
  }
LABEL_129:
  FigMetalDecRef();
  FigMetalDecRef();
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v204);
  CVPixelBufferRelease(v203);
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v22;
}

uint64_t __237__AWBStatistics_process_clipped_lscGainsTex_validRectInBufferCoords_validRectInSensorReadoutCoords_awbStatsBuffer_awbTileStatsConfig_anstSkinMask_anstSkinMaskData_skyMaskTex_skyMaskData_regionOfInterestRectInBufferCoords_downsizeFactor___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __237__AWBStatistics_process_clipped_lscGainsTex_validRectInBufferCoords_validRectInSensorReadoutCoords_awbStatsBuffer_awbTileStatsConfig_anstSkinMask_anstSkinMaskData_skyMaskTex_skyMaskData_regionOfInterestRectInBufferCoords_downsizeFactor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)configWindowsV2:(id *)a3 metadata:(id)a4 tilesConfig:(id)a5 validRect:(id)a6 regionOfInterestRect:(id)a7
{
  id v11 = a4;
  id v61 = a5;
  CFDictionaryRef dict = (const __CFDictionary *)a6;
  CFDictionaryRef v12 = (const __CFDictionary *)a7;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  unsigned __int8 v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2F440]];
  if (!v13)
  {
    CFDictionaryRef v14 = 0;
    goto LABEL_43;
  }
  CFDictionaryRef v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2F680]];
  if (!v14)
  {
LABEL_43:
    CFDictionaryRef v55 = 0;
LABEL_44:
    int v48 = 0;
    goto LABEL_49;
  }
  CFDictionaryRef v15 = v14;
  BOOL v16 = CGRectMakeWithDictionaryRepresentation(v14, &rect);
  CFDictionaryRef v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F2F288]];
  CFDictionaryRef v55 = v15;
  if (v14) {
    BOOL v17 = v16;
  }
  else {
    BOOL v17 = 0;
  }
  if (!v17) {
    goto LABEL_44;
  }
  CFDictionaryRef v54 = v14;
  v18 = [(__CFDictionary *)v14 objectForKeyedSubscript:*MEMORY[0x263F2F290]];
  if (![v18 count])
  {
    int v48 = 0;
    goto LABEL_48;
  }
  unint64_t v52 = v13;
  id v53 = v11;
  unint64_t v51 = v18;
  float v19 = [v18 sortedArrayUsingComparator:&__block_literal_global_99];
  unint64_t v20 = 0;
  uint64_t v21 = *MEMORY[0x263F2F620];
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t v62 = _Q0;
  for (uint64_t i = a3; ; ++i)
  {
    unint64_t v28 = 2 * [v19 count];
    if (v28 >= 2) {
      unint64_t v28 = 2;
    }
    if (v28 <= v20)
    {
      int v48 = 0;
      unsigned __int8 v13 = v52;
      id v11 = v53;
      v18 = v51;
      goto LABEL_46;
    }
    int v29 = [v19 objectAtIndexedSubscript:v20 >> 1];
    char v30 = v29;
    if (!v29)
    {
      i->var0 = 0;
      goto LABEL_40;
    }
    CFDictionaryRef v31 = [v29 objectForKeyedSubscript:v21];
    if (!CGRectMakeWithDictionaryRepresentation(v31, &v66))
    {
      int v48 = 0;
      goto LABEL_54;
    }
    v66.CGPoint origin = (CGPoint)vmulq_f64((float64x2_t)v66.origin, (float64x2_t)rect.size);
    v66.CGSize size = (CGSize)vmulq_f64((float64x2_t)rect.size, (float64x2_t)v66.size);
    if (!CGRectMakeWithDictionaryRepresentation(dict, &v65)) {
      break;
    }
    double v32 = v66.origin.y - v65.origin.y;
    v66.origin.double y = v32;
    if (v32 < 0.0)
    {
      v66.size.double height = v32 + v66.size.height;
      v66.origin.double y = 0.0;
    }
    if (v12)
    {
      if (!CGRectMakeWithDictionaryRepresentation(v12, &v64)) {
        break;
      }
      if (CGRectContainsRect(v65, v64)) {
        CGRect v66 = CGRectIntersection(v66, v64);
      }
      else {
        FigSignalErrorAt();
      }
    }
    double width = v66.size.width;
    double height = v66.size.height;
    i->var0 = 0;
    if ([(NSNumber *)self->_digitalFlash intValue]) {
      int v37 = 5000;
    }
    else {
      int v37 = 50000;
    }
    float v35 = width;
    float v36 = height;
    if (v37 < (int)(float)(v35 * v36))
    {
      CGSize size = v66.size;
      float32x2_t v38 = vcvt_f32_f64(vmulq_n_f64((float64x2_t)v66.size, *((float *)&qword_23FF4E640 + (v20 & 1))));
      CGPoint origin = v66.origin;
      float32x2_t v59 = v38;
      int v39 = (int)v38.f32[1];
      if ((int)v38.f32[0] >= 0) {
        int v40 = (int)v38.f32[0];
      }
      else {
        int v40 = (int)v38.f32[0] + 1;
      }
      if (v39 >= 0) {
        int v41 = (int)v38.f32[1];
      }
      else {
        int v41 = v39 + 1;
      }
      int v42 = v41 >> 1;
      int32x2_t v43 = vmovn_s64(vcvtq_s64_f64(vmulq_f64((float64x2_t)rect.size, v62)));
      int32x2_t v57 = v43;
      if (v42 >= 9 * v43.i32[1] / 10) {
        int v44 = 9 * v43.i32[1] / 10;
      }
      else {
        int v44 = v42;
      }
      LOBYTE(v64.origin.x) = 0;
      a3->var1 = objc_msgSend(v61, "cmi_intValueForKey:defaultValue:found:", @"Bitdepth", 0, &v64) != 0;
      if (!LOBYTE(v64.origin.x)) {
        break;
      }
      uint32x2_t v45 = (uint32x2_t)vcvt_s32_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(vmulq_f64((float64x2_t)size, v62), (float64x2_t)origin), vcvtq_f64_f32(vmul_f32(v59, (float32x2_t)0xBF000000BF000000)))));
      unint64_t v46 = *(void *)&vshr_n_s32((int32x2_t)vsra_n_u32(v45, v45, 0x1FuLL), 1uLL) & 0xFFFFFFFCFFFFFFFCLL;
      v47.i32[0] = v40 >> 1;
      v47.i32[1] = v44;
      i->var0 = 1;
      *(void *)&i->var3 = v46;
      *(int32x2_t *)&i->var5 = vadd_s32(vmin_s32(vsub_s32(v57, (int32x2_t)v46), (int32x2_t)(*(void *)&vadd_s32(v47, (int32x2_t)0x300000003) & 0xFFFFFFFCFFFFFFFCLL)), (int32x2_t)v46);
    }
    memset_pattern16(i->var2, &unk_23FF51300, 8uLL);

LABEL_40:
    ++v20;
  }
  int v48 = FigSignalErrorAt();
LABEL_54:
  unsigned __int8 v13 = v52;
  id v11 = v53;
  v18 = v51;

LABEL_46:
LABEL_48:

  CFDictionaryRef v14 = v54;
LABEL_49:
  if (*MEMORY[0x263F00E10] == 1)
  {
    CFDictionaryRef v49 = v14;
    kdebug_trace();
    CFDictionaryRef v14 = v49;
  }

  return v48;
}

uint64_t __85__AWBStatistics_configWindowsV2_metadata_tilesConfig_validRect_regionOfInterestRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  CFDictionaryRef v6 = [v4 valueForKey:@"Rect"];
  if (!v6)
  {
    CFDictionaryRef v7 = 0;
LABEL_10:
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  CFDictionaryRef v7 = [v5 valueForKey:@"Rect"];
  if (!v7 || !CGRectMakeWithDictionaryRepresentation(v6, &rect) || !CGRectMakeWithDictionaryRepresentation(v7, &v12)) {
    goto LABEL_10;
  }
  float v8 = rect.size.width * rect.size.height;
  float v9 = v12.size.width * v12.size.height;
  if (v8 <= v9) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -1;
  }
LABEL_8:

  return v10;
}

- (NSNumber)digitalFlash
{
  return self->_digitalFlash;
}

- (void)setDigitalFlash:(id)a3
{
}

- (NSNumber)skipDemosaic
{
  return self->_skipDemosaic;
}

- (void)setSkipDemosaic:(id)a3
{
}

- (NSNumber)lscMaxGain
{
  return self->_lscMaxGain;
}

- (void)setLscMaxGain:(id)a3
{
}

- (NSNumber)faceAssistedBehaviorMode
{
  return self->_faceAssistedBehaviorMode;
}

- (void)setFaceAssistedBehaviorMode:(id)a3
{
}

- (NSNumber)downsizeFactor
{
  return self->_downsizeFactor;
}

- (void)setDownsizeFactor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downsizeFactor, 0);
  objc_storeStrong((id *)&self->_faceAssistedBehaviorMode, 0);
  objc_storeStrong((id *)&self->_lscMaxGain, 0);
  objc_storeStrong((id *)&self->_skipDemosaic, 0);
  objc_storeStrong((id *)&self->_digitalFlash, 0);
  objc_storeStrong((id *)&self->_fitWbTmRGBToANSTInput, 0);
  objc_storeStrong((id *)&self->_resizeANST, 0);
  objc_storeStrong((id *)&self->_normWindowStatsPipelineState, 0);
  objc_storeStrong((id *)&self->_normTileStatsPipelineState, 0);
  objc_storeStrong((id *)&self->_resetMtlBufferPipelineState, 0);
  objc_storeStrong((id *)&self->_computeAWBStatsQuadraFastPipelineState, 0);
  objc_storeStrong((id *)&self->_computeAWBStatsBayerFastPipelineState, 0);
  objc_storeStrong((id *)&self->_computeAWBStatsBayerPipelineState, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end