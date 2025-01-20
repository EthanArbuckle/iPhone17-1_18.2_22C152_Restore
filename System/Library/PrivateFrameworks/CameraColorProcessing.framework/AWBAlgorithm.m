@interface AWBAlgorithm
+ (int)calculateSTRBKeyFromWideCamera:(id *)a3 moduleConfig:(id)a4;
+ (int)doAWBConfigLoad:(id)a3 to:(id)a4;
+ (int)getColorCalibrationsUsingIdealColorCalbrations:(id)a3 absoluteColorCalibrations:(id)a4 colorCalibrationsOut:(id *)a5 awbConfig:(id)a6;
+ (int)getInternalAWBMetadataForMIWB:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 validRect:(id)a6 secondaryModuleConfig:(id)a7 secondaryCameraInfo:(id)a8;
+ (int)translateAWBGainsToSecondaryPortType:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 validRect:(id)a6 secondaryModuleConfig:(id)a7 secondaryCameraInfo:(id)a8 primaryRGain:(float)a9 primaryBGain:(float)a10 secondaryChannelID:(unsigned int)a11 secondaryRGain:(float *)a12 secondaryBGain:(float *)a13;
- ($938B03310D06493B2963E5A84CB75A7E)awbComboGains;
- ($938B03310D06493B2963E5A84CB75A7E)awbComboGainsNormalized;
- ($938B03310D06493B2963E5A84CB75A7E)awbGains;
- (AWBAlgorithm)initWithAWBObject:(id)a3;
- (AWBAlgorithm)initWithMetalContext:(id)a3;
- (NSData)setFileData;
- (NSDictionary)stats;
- (NSMutableDictionary)outputMetadata;
- (NSNumber)digitalFlash;
- (id).cxx_construct;
- (int)_createShaders;
- (int)_processSkyMask:(void *)a3 skyMaskWidth:(int)a4 skyMaskHeight:(int)a5 cropRectFromSourceDict:(id)a6;
- (int)_updateHRGainDownRatioMetadata;
- (int)awbConfigLoad:(id)a3 to:(CAWBAFE *)a4;
- (int)calculateEIT:(id)a3 result:(unint64_t *)a4;
- (int)calculateInternalAWBMetadataForMIWB:(float)a3 bGain:(float)a4 rSkinGain:(float)a5 bSkinGain:(float)a6 cct:(float)a7 internalMetadata:(id)a8;
- (int)configFaceMetadata:(id)a3 awbParams:(id)a4;
- (int)configFallbackMetadata:(id)a3;
- (int)configFlashRFCMetadata:(id)a3 cameraInfo:(id)a4 moduleConfig:(id)a5;
- (int)configFlickerDetectionMetadata:(id)a3 moduleConfig:(id)a4;
- (int)configPortTypeMetadata:(id)a3;
- (int)configWithModuleConfig:(id)a3 metadata:(id)a4 cameraInfo:(id)a5 awbParams:(id)a6;
- (int)configWithSetFile:(id)a3 metadata:(id)a4 awbParams:(id)a5;
- (int)encodeSetFileIDForModuleConfig:(id)a3 setFileID:(unsigned int *)a4;
- (int)initFWPlatformID;
- (int)initTuningParameters:(id)a3;
- (int)process;
- (int)translateAWBGainsToSecondaryChannelID:(unsigned int)a3[3] secondaryChannelID:(unsigned int)a4 secondaryConfig:(SensorConfigAWBParams *)a5 secondaryAWBParams:(sSlaveCameraAWBParam *)a6;
- (unsigned)numTilesX;
- (unsigned)numTilesY;
- (unsigned)winRegionHeight;
- (unsigned)winRegionWidth;
- (void)dealloc;
- (void)setOutputMetadata:(id)a3;
- (void)setStats:(id)a3;
- (void)setWinRegionHeight:(unsigned int)a3;
- (void)setWinRegionWidth:(unsigned int)a3;
@end

@implementation AWBAlgorithm

- (id).cxx_construct
{
  *((_OWORD *)self + 315) = 0u;
  *((_OWORD *)self + 314) = 0u;
  *((_OWORD *)self + 313) = 0u;
  return self;
}

- (AWBAlgorithm)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v6 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v10.receiver = self;
  v10.super_class = (Class)AWBAlgorithm;
  v7 = [(AWBAlgorithm *)&v10 init];
  v8 = v7;
  if (v7)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v7->_metalContext, a3);
      if (![(AWBAlgorithm *)v8 _createShaders]
        && ![(AWBAlgorithm *)v8 initFWPlatformID])
      {
        operator new();
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

  return 0;
}

- (int)initFWPlatformID
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v2 = (uint64_t (*)(void))getFigCapturePlatformIdentifierSymbolLoc(void)::ptr;
  v17 = getFigCapturePlatformIdentifierSymbolLoc(void)::ptr;
  if (!getFigCapturePlatformIdentifierSymbolLoc(void)::ptr)
  {
    v3 = CMCaptureLibrary();
    v15[3] = (uint64_t)dlsym(v3, "FigCapturePlatformIdentifier");
    getFigCapturePlatformIdentifierSymbolLoc(void)::ptr = (_UNKNOWN *)v15[3];
    v2 = (uint64_t (*)(void))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (v2)
  {
    int v4 = v2();
    id v5 = soft_FigCaptureGetModelSpecificName();
    switch(v4)
    {
      case 8:
        if ([@"D49" isEqualToString:v5])
        {
          {
            int v6 = 13;
            goto LABEL_15;
          }
          CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
          int v6 = 13;
        }
        else
        {
          objc_super v10 = soft_FigCaptureGetModelSpecificName();
          int v11 = [&unk_26F3F2280 containsObject:v10];

          if (v11)
          {
            if ((explicit & 1) != 0
            {
              int v6 = 231;
              goto LABEL_15;
            }
            CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
            int v6 = 231;
          }
          else
          {
            if ((explicit & 1) != 0
            {
              int v6 = 19;
              goto LABEL_15;
            }
            CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
            int v6 = 19;
          }
        }
        goto LABEL_44;
      case 9:
        {
          int v6 = 240;
          goto LABEL_15;
        }
        CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
        int v6 = 240;
        goto LABEL_44;
      case 10:
        goto LABEL_28;
      case 11:
        if ([&unk_26F3F2298 containsObject:v5])
        {
          {
            int v6 = 71;
            goto LABEL_15;
          }
          CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
          int v6 = 71;
        }
        else
        {
          int v8 = [v5 hasPrefix:@"V"];
          if (v8)
          {
            {
              int v6 = 55;
              goto LABEL_15;
            }
            CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
            int v6 = 55;
          }
          else
          {
            {
              int v6 = 100;
              goto LABEL_15;
            }
            CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
            int v6 = 100;
          }
        }
        break;
      default:
        goto LABEL_16;
    }
    goto LABEL_44;
  }
  id v5 = [MEMORY[0x263F08690] currentHandler];
  v13 = [NSString stringWithUTF8String:"FigCapturePlatformID soft_FigCapturePlatformIdentifier()"];
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v13, @"AWBAlgorithm.mm", 51, @"%s", dlerror());

  __break(1u);
LABEL_28:
  {
    CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
    int v6 = 66;
LABEL_44:
    goto LABEL_15;
  }
LABEL_9:
  int v6 = 66;
LABEL_15:
  dword_26AEB8B5C = v6;
LABEL_16:

  return 0;
}

- (int)_createShaders
{
  return 0;
}

- (AWBAlgorithm)initWithAWBObject:(id)a3
{
  id v4 = a3;
  id v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v11.receiver = self;
  v11.super_class = (Class)AWBAlgorithm;
  int v6 = [(AWBAlgorithm *)&v11 init];
  v7 = v6;
  if (v6
    && ![(AWBAlgorithm *)v6 initFWPlatformID]
    && (uint64_t v8 = [v4 pointerValue], (v7->_AWBAlgorithmObj = (CAWBAFE *)v8) != 0))
  {
    unsigned __int8 v9 = v7;
  }
  else
  {
    if (*v5 == 1) {
      kdebug_trace();
    }
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (int)configWithSetFile:(id)a3 metadata:(id)a4 awbParams:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v66 = a5;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (![v9 count]) {
    goto LABEL_28;
  }
  bzero(&self->_sMetaData, 0x1310uLL);
  self->_awbGains.bGain = 0;
  *(_OWORD *)&self->_awbComboGainsNormalized.gGain = 0u;
  *(_OWORD *)&self->_awbComboGains.rGain = 0u;
  objc_super v10 = [v66 setFileDict];
  objc_super v11 = [v10 objectForKeyedSubscript:@"SetFileData"];
  setFileData = self->_setFileData;
  self->_setFileData = v11;

  v13 = self->_setFileData;
  if (!v13 || ![(NSData *)v13 length])
  {
LABEL_28:
    int v54 = FigSignalErrorAt();
    goto LABEL_23;
  }
  uint64_t v14 = [v66 digitalFlash];
  digitalFlash = self->_digitalFlash;
  self->_digitalFlash = v14;

  *(void *)&self->_numTilesX = 0x2000000020;
  v67[0] = 0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F558], v67, COERCE_DOUBLE(COERCE_UNSIGNED_INT(1.0) | 0x2000000000));
  self->_sMetaData.ae.luxLevel = v16;
  v17 = [NSNumber numberWithDouble:v16];
  [v17 doubleValue];
  *(float *)&double v18 = v18;
  self->_sMetaData.ae.luxLevel = *(float *)&v18;

  if (!v67[0]) {
    goto LABEL_30;
  }
  self->_sMetaData.ae.gainDigi.float v16 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2EF40], 1, v67);
  if (!v67[0]) {
    goto LABEL_30;
  }
  self->_sMetaData.ae.gainAnal.float v16 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2EF28], 1, v67);
  if (!v67[0]) {
    goto LABEL_30;
  }
  self->_sMetaData.ae.aeTarget = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F2B8], 1, v67);
  if (!v67[0]
    || (self->_sMetaData.ae.aeAverage = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F2A8], 1, v67), !v67[0])|| (LODWORD(v19) = 1.0, objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2EF30], v67, v19), !v67[0])|| (self->_sMetaData.ae.exposureTime = (float)(v20 * 1000000.0), self->_sMetaData.ae.gainDigiSensor.float v16 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2EF48], 1, v67), !v67[0])|| (LODWORD(v21) = 1.0, objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F410], v67, v21),
        !v67[0]))
  {
LABEL_30:
    int v54 = FigSignalErrorAt();
    goto LABEL_23;
  }
  self->_sMetaData.frameRate = vcvts_n_u32_f32(v22, 8uLL);
  id v23 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F5F0]];
  uint64_t v24 = [v23 bytes];
  if (v24 && (uint64_t v25 = *(unsigned int *)(v24 + 28), v25) && (v26 = *(unsigned int *)(v24 + 20), v26))
  {
    uint64_t v27 = v24 + v25;
    uint64_t v28 = v24 + v26;
    self->_sMetaData.ae.luxLevelLow = *(_DWORD *)(v27 + 1720);
    self->_sMetaData.ae.luxLevelHigh = *(_DWORD *)(v27 + 1724);
    self->_sMetaData.maxLSgainUnadjusted = *(_DWORD *)(v27 + 180);
    self->_sMetaData.ae.sceneBrightnessForLux = *(_DWORD *)(v27 + 1696);
    *(_WORD *)&self->_sMetaData.masterCam = *(_WORD *)(v27 + 174);
    self->_sMetaData.ae.luxCalcParams = *(sLuxCalcParams *)(v27 + 124);
    self->_sMetaData.ae.inverseBinningGainFactor = *(_WORD *)(v28 + 64);
    self->_sMetaData.ae.currentEIT = *(void *)(v27 + 1668);
    self->_sMetaData.flash.flashCaptureCount = *(_WORD *)(v28 + 40);
    *(void *)&self->_sMetaData.flash.flashStatusAE = 0x100000001;
    self->_sMetaData.flash.strobeStatus = 1;
    self->_sMetaData.flash.flashCaptureSequence = *(unsigned char *)(v28 + 72);

    self->_sMetaData.isReplay = 1;
    self->_sMetaData.awb.isDefaultSetting = 1;
    [(AWBAlgorithm *)self configPortTypeMetadata:v9];
    self->_sMetaData.ae.UBMisc.awbReflow.bGenerateReflowAWB = [(NSNumber *)self->_digitalFlash intValue] != 0;
    if ((*((unsigned int (**)(CAWBAFE *, uint64_t))self->_AWBAlgorithmObj->var0 + 2))(self->_AWBAlgorithmObj, 1))
    {
      AWBAlgorithmObj = self->_AWBAlgorithmObj;
      v30 = [(NSData *)self->_setFileData bytes];
      [(NSData *)self->_setFileData length];
      SetFileLoad(AWBAlgorithmObj, v30);
      v57 = self->_AWBAlgorithmObj;
      v65 = [v8 objectForKeyedSubscript:@"AbsoluteColorCalibrationData"];
      v64 = [v65 objectForKeyedSubscript:@"HiCCTrgAbs"];
      [v64 floatValue];
      float v32 = v31;
      v63 = [v8 objectForKeyedSubscript:@"AbsoluteColorCalibrationData"];
      v62 = [v63 objectForKeyedSubscript:@"HiCCTbgAbs"];
      [v62 floatValue];
      float v34 = v33;
      v61 = [v8 objectForKeyedSubscript:@"AbsoluteColorCalibrationData"];
      v60 = [v61 objectForKeyedSubscript:@"LowCCTrgAbs"];
      [v60 floatValue];
      float v36 = v35;
      v59 = [v8 objectForKeyedSubscript:@"AbsoluteColorCalibrationData"];
      v58 = [v59 objectForKeyedSubscript:@"LowCCTbgAbs"];
      [v58 floatValue];
      float v38 = v37;
      v56 = [v8 objectForKeyedSubscript:@"ColorCalIdeal"];
      v39 = [v56 objectForKeyedSubscript:@"hiCCTrgIdeal"];
      [v39 floatValue];
      float v41 = v40;
      v42 = [v8 objectForKeyedSubscript:@"ColorCalIdeal"];
      v43 = [v42 objectForKeyedSubscript:@"hiCCTbgIdeal"];
      [v43 floatValue];
      float v45 = v44;
      v46 = [v8 objectForKeyedSubscript:@"ColorCalIdeal"];
      v47 = [v46 objectForKeyedSubscript:@"lowCCTrgIdeal"];
      [v47 floatValue];
      float v49 = v48;
      v50 = [v8 objectForKeyedSubscript:@"ColorCalIdeal"];
      v51 = [v50 objectForKeyedSubscript:@"lowCCTbgIdeal"];
      [v51 floatValue];
      CAWBAFE::SensorCalSet(v57, v32, v34, v36, v38, v41, v45, v49, v52);

      int v53 = [(AWBAlgorithm *)self initTuningParameters:v9];
      if (!v53)
      {
        int v53 = [(AWBAlgorithm *)self configFallbackMetadata:v9];
        if (!v53)
        {
          int v53 = [(AWBAlgorithm *)self configFaceMetadata:v9 awbParams:v66];
          if (!v53)
          {
            int v53 = [(AWBAlgorithm *)self configFlickerDetectionMetadata:v9 moduleConfig:0];
            if (!v53)
            {
              int v54 = [(AWBAlgorithm *)self configFlashRFCMetadata:v9 cameraInfo:0 moduleConfig:0];
LABEL_23:
              int v53 = v54;
            }
          }
        }
      }
    }
    else
    {
      int v53 = -1;
    }
  }
  else
  {
    int v53 = FigSignalErrorAt();
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v53;
}

- (int)configWithModuleConfig:(id)a3 metadata:(id)a4 cameraInfo:(id)a5 awbParams:(id)a6
{
  id v9 = a3;
  id v85 = a4;
  id v77 = a5;
  id v78 = a6;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (!objc_msgSend(v85, "count", v9)) {
    goto LABEL_36;
  }
  bzero(&self->_sMetaData, 0x1310uLL);
  self->_awbGains.bGain = 0;
  *(_OWORD *)&self->_awbComboGainsNormalized.gGain = 0u;
  *(_OWORD *)&self->_awbComboGains.rGain = 0u;
  objc_super v10 = [v78 digitalFlash];
  digitalFlash = self->_digitalFlash;
  self->_digitalFlash = v10;

  *(void *)&self->_numTilesX = 0x2000000020;
  v89[0] = 0;
  objc_msgSend(v85, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F558], v89, COERCE_DOUBLE(COERCE_UNSIGNED_INT(1.0) | 0x2000000000));
  self->_sMetaData.ae.luxLevel = v12;
  v13 = [NSNumber numberWithDouble:v12];
  [v13 doubleValue];
  *(float *)&double v14 = v14;
  self->_sMetaData.ae.luxLevel = *(float *)&v14;

  if (!v89[0]) {
    goto LABEL_36;
  }
  self->_sMetaData.ae.gainDigi.float v16 = objc_msgSend(v85, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2EF40], 1, v89);
  if (!v89[0]) {
    goto LABEL_36;
  }
  self->_sMetaData.ae.gainAnal.float v16 = objc_msgSend(v85, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2EF28], 1, v89);
  if (!v89[0]) {
    goto LABEL_36;
  }
  LODWORD(v15) = 1.0;
  objc_msgSend(v85, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2EF30], v89, v15);
  if (!v89[0]) {
    goto LABEL_36;
  }
  self->_sMetaData.ae.exposureTime = (float)(v16 * 1000000.0);
  self->_sMetaData.ae.gainDigiSensor.float v16 = objc_msgSend(v85, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2EF48], 1, v89);
  if (!v89[0]) {
    goto LABEL_36;
  }
  LODWORD(v17) = 1.0;
  objc_msgSend(v85, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F410], v89, v17);
  if (!v89[0]) {
    goto LABEL_36;
  }
  self->_sMetaData.frameRate = vcvts_n_u32_f32(v18, 8uLL);
  self->_sMetaData.flash.flashCaptureCount = objc_msgSend(v85, "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x263F2F4E0], 0, v89);
  if (!v89[0]) {
    goto LABEL_36;
  }
  LODWORD(v19) = 1.0;
  objc_msgSend(v85, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E8], v89, v19);
  self->_sMetaData.ae.inverseBinningGainFactor = vcvts_n_s32_f32(v20, 8uLL);
  int v21 = v89[0];
  float v22 = [v9 objectForKeyedSubscript:@"Exposure"];
  id v23 = [v22 objectForKeyedSubscript:@"LuxModel"];
  uint64_t v24 = [v23 objectForKeyedSubscript:@"Scale"];

  if (!v24) {
    goto LABEL_36;
  }
  uint64_t v25 = [v9 objectForKeyedSubscript:@"Exposure"];
  uint64_t v26 = [v25 objectForKeyedSubscript:@"LuxModel"];
  uint64_t v27 = [v26 objectForKeyedSubscript:@"Scale"];
  self->_sMetaData.ae.luxCalcParams.scale = [v27 intValue];

  uint64_t v28 = [v9 objectForKeyedSubscript:@"Exposure"];
  v29 = [v28 objectForKeyedSubscript:@"LuxModel"];
  v30 = [v29 objectForKeyedSubscript:@"ScaleShift"];

  if (!v30)
  {
LABEL_36:
    int v74 = FigSignalErrorAt();
LABEL_32:
    int v37 = v74;
    goto LABEL_33;
  }
  float v31 = [v9 objectForKeyedSubscript:@"Exposure"];
  float v32 = [v31 objectForKeyedSubscript:@"LuxModel"];
  float v33 = [v32 objectForKeyedSubscript:@"ScaleShift"];
  self->_sMetaData.ae.luxCalcParams.scaleShift = [v33 intValue];

  id v34 = [v85 objectForKeyedSubscript:*MEMORY[0x263F2F5F0]];
  uint64_t v35 = [v34 bytes];
  if (v35 && (uint64_t v36 = *(unsigned int *)(v35 + 20), v36))
  {
    if (!v21) {
      self->_sMetaData.ae.inverseBinningGainFactor = *(_WORD *)(v35 + v36 + 64);
    }

    [(AWBAlgorithm *)self calculateEIT:v85 result:&self->_sMetaData.ae.currentEIT];
    *(void *)&self->_sMetaData.flash.flashStatusAE = 0x100000001;
    self->_sMetaData.flash.strobeStatus = 1;
    self->_sMetaData.flash.flashCaptureSequence = 0;
    *(void *)&self->_sMetaData.ae.aeAverage = 0;
    *(_WORD *)&self->_sMetaData.masterCam = 257;
    self->_sMetaData.awb.isDefaultSetting = 1;
    self->_sMetaData.maxLSgainUnadjusted = 0x2000;
    self->_sMetaData.isReplay = 1;
    [(AWBAlgorithm *)self configPortTypeMetadata:v85];
    self->_sMetaData.ae.UBMisc.awbReflow.bGenerateReflowAWB = [(NSNumber *)self->_digitalFlash intValue] != 0;
    if ((*((unsigned int (**)(CAWBAFE *, uint64_t))self->_AWBAlgorithmObj->var0 + 2))(self->_AWBAlgorithmObj, 1))
    {
      v87 = [v9 objectForKeyedSubscript:@"AutoWhiteBalance"];
      if (v87)
      {
        int v37 = -[AWBAlgorithm awbConfigLoad:to:](self, "awbConfigLoad:to:");
        if (v37)
        {
          v71 = 0;
          v72 = 0;
          v39 = 0;
          float v41 = 0;
          v55 = 0;
          v73 = 0;
          int v70 = 6;
        }
        else
        {
          float v38 = [v77 objectForKeyedSubscript:*MEMORY[0x263F2EE80]];
          v86 = v38;
          if (v38)
          {
            uint64_t v81 = *MEMORY[0x263F2F238];
            v84 = objc_msgSend(v38, "objectForKeyedSubscript:");
            v39 = v84;
            if (v84)
            {
              uint64_t v40 = *MEMORY[0x263F2F240];
              v83 = [v86 objectForKeyedSubscript:*MEMORY[0x263F2F240]];
              float v41 = v83;
              if (v83)
              {
                uint64_t v80 = *MEMORY[0x263F2F230];
                v42 = objc_msgSend(v84, "objectForKeyedSubscript:");
                [v42 floatValue];
                float v44 = v43;

                uint64_t v79 = *MEMORY[0x263F2F228];
                float v45 = objc_msgSend(v84, "objectForKeyedSubscript:");
                [v45 floatValue];
                float v47 = v46;

                float v48 = [v83 objectForKeyedSubscript:v80];
                [v48 floatValue];
                float v50 = v49;

                v51 = [v83 objectForKeyedSubscript:v79];
                [v51 floatValue];
                float v53 = v52;

                int v54 = [v87 objectForKeyedSubscript:@"IdealColorCalibrations"];
                v82 = [v54 objectForKeyedSubscript:v81];
                v55 = v82;
                if (v82)
                {
                  uint64_t v56 = [v54 objectForKeyedSubscript:v40];
                  if (v56)
                  {
                    v57 = (void *)v56;
                    v58 = [v82 objectForKeyedSubscript:v80];
                    [v58 floatValue];
                    float v60 = v59;

                    v61 = [v82 objectForKeyedSubscript:v79];
                    [v61 floatValue];
                    float v63 = v62;

                    v64 = [v57 objectForKeyedSubscript:v80];
                    [v64 floatValue];
                    float v66 = v65;

                    v67 = [v57 objectForKeyedSubscript:v79];
                    [v67 floatValue];
                    float v69 = v68;

                    CAWBAFE::SensorCalSet(self->_AWBAlgorithmObj, v44 * 16384.0, v47 * 16384.0, v50 * 16384.0, v53 * 16384.0, v60, v63, v66, v69);
                    int v37 = 0;
                    int v70 = 0;
                    v71 = v86;
                    v39 = v83;
                    v72 = v84;
                    float v41 = v54;
                    v55 = v82;
                    v73 = v57;
                  }
                  else
                  {
                    v73 = 0;
                    int v37 = FigSignalErrorAt();
                    int v70 = 6;
                    v71 = v86;
                    v39 = v83;
                    v72 = v84;
                    float v41 = v54;
                    v55 = v82;
                  }
                }
                else
                {
                  int v37 = FigSignalErrorAt();
                  int v70 = 6;
                  v71 = v86;
                  v39 = v83;
                  v72 = v84;
                  float v41 = v54;
                  v73 = 0;
                }
              }
              else
              {
                int v37 = FigSignalErrorAt();
                int v70 = 6;
                v71 = v86;
                v72 = v84;
                v39 = 0;
                v55 = 0;
                v73 = 0;
              }
            }
            else
            {
              int v37 = FigSignalErrorAt();
              int v70 = 6;
              v71 = v86;
              v72 = 0;
              float v41 = 0;
              v55 = 0;
              v73 = 0;
            }
          }
          else
          {
            v72 = 0;
            int v37 = FigSignalErrorAt();
            int v70 = 6;
            v71 = 0;
            v39 = 0;
            float v41 = 0;
            v55 = 0;
            v73 = 0;
          }
        }
      }
      else
      {
        v71 = 0;
        int v37 = FigSignalErrorAt();
        int v70 = 6;
        v72 = 0;
        v39 = 0;
        float v41 = 0;
        v55 = 0;
        v73 = 0;
      }

      id v9 = v76;
      if (v70 == 6) {
        goto LABEL_33;
      }
      CAWBAFE::SetDigitalFlashBehaviorMode((uint64_t)self->_AWBAlgorithmObj, [(NSNumber *)self->_digitalFlash intValue]);
      int v37 = [(AWBAlgorithm *)self initTuningParameters:v85];
      if (v37) {
        goto LABEL_33;
      }
      int v37 = [(AWBAlgorithm *)self configFallbackMetadata:v85];
      if (v37) {
        goto LABEL_33;
      }
      int v37 = [(AWBAlgorithm *)self configFaceMetadata:v85 awbParams:v78];
      if (v37) {
        goto LABEL_33;
      }
      int v37 = [(AWBAlgorithm *)self configFlickerDetectionMetadata:v85 moduleConfig:v76];
      if (v37) {
        goto LABEL_33;
      }
      int v74 = [(AWBAlgorithm *)self configFlashRFCMetadata:v85 cameraInfo:v77 moduleConfig:v76];
      goto LABEL_32;
    }
    int v37 = -1;
  }
  else
  {
    int v37 = FigSignalErrorAt();
  }
LABEL_33:
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v37;
}

- (int)calculateEIT:(id)a3 result:(unint64_t *)a4
{
  id v5 = a3;
  int v6 = v5;
  int v7 = 0;
  char v18 = 0;
  if (v5 && a4)
  {
    int v8 = objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], 0, &v18);
    if (!v18) {
      goto LABEL_10;
    }
    int v9 = v8;
    int v10 = objc_msgSend(v6, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], 0, &v18);
    if (!v18) {
      goto LABEL_10;
    }
    int v11 = v10;
    objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F700], &v18, 0.0);
    if (v18
      && (float v13 = v12, objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6F0], &v18, 0.0), v18)
      && (float v15 = v14, objc_msgSend(v6, "cmi_doubleValueForKey:defaultValue:found:", *MEMORY[0x263F2F468], &v18, 0.0), v18))
    {
      int v7 = 0;
      *a4 = (unint64_t)(v16
                             * 1000000.0
                             * (float)((float)((float)((float)((float)v9 * 0.0039062) * (float)((float)v11 * 0.0039062))
                                             * v13)
                                     * v15));
    }
    else
    {
LABEL_10:
      int v7 = FigSignalErrorAt();
    }
  }

  return v7;
}

- (int)calculateInternalAWBMetadataForMIWB:(float)a3 bGain:(float)a4 rSkinGain:(float)a5 bSkinGain:(float)a6 cct:(float)a7 internalMetadata:(id)a8
{
  v40[1] = *MEMORY[0x263EF8340];
  id v16 = a8;
  uint64_t v39 = 0;
  v40[0] = 0;
  float v38 = 0.0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  sCSensorCalGain v35 = 0;
  unsigned __int16 v34 = 4096;
  unsigned __int16 v33 = 4096;
  CAWBAFE::GetSensorCalGain(self->_AWBAlgorithmObj, &v35);
  CAWBAFE::GetNewCSensorCalGains(self->_AWBAlgorithmObj, &v34, &v33, a7, &v35);
  LOWORD(v9) = v34;
  LOWORD(v8) = v33;
  CAWBAFE::ComputeHistWPFromChannelGains(self->_AWBAlgorithmObj, a3, a4, (float *)v40, (float *)v40 + 1, v17, v18);
  LODWORD(v19) = 4.0;
  *(float *)&double v20 = (float)v9;
  float v21 = (float)((float)(float)(a5 * 4096.0) * 4.0) / (float)v9;
  float v22 = (float)((float)(float)(a6 * 4096.0) * 4.0) / (float)v8;
  CAWBAFE::ComputeHistWPFromChannelGains(self->_AWBAlgorithmObj, v21, v22, (float *)&v39, (float *)&v39 + 1, v19, v20);
  CAWBAFE::GetDaylightScore(self->_AWBAlgorithmObj, (float *)&v36);
  CAWBAFE::CalculateSkyWhitePoint(self->_AWBAlgorithmObj, a7, (float *)v40, (float *)&v37);
  CAWBAFE::CalculateSkinWeightForSTF(self->_AWBAlgorithmObj, 0, (float *)v40, (float *)&v39, (float *)&v36 + 1);
  if (v16)
  {
    id v23 = [NSNumber numberWithInt:(int)(float)((float)(v21 * 4096.0) + 0.5)];
    [v16 setObject:v23 forKeyedSubscript:@"MIWBSkinNonComboRGain"];

    uint64_t v24 = [NSNumber numberWithInt:(int)(float)((float)(v22 * 4096.0) + 0.5)];
    [v16 setObject:v24 forKeyedSubscript:@"MIWBSkinNonComboBGain"];

    uint64_t v25 = [NSNumber numberWithInt:(int)(float)((float)(*(float *)&v37 * 4096.0) + 0.5)];
    [v16 setObject:v25 forKeyedSubscript:@"MIWBSkyRGain"];

    uint64_t v26 = [NSNumber numberWithInt:(int)(float)((float)(v38 * 4096.0) + 0.5)];
    [v16 setObject:v26 forKeyedSubscript:@"MIWBSkyBGain"];

    LODWORD(v27) = HIDWORD(v36);
    uint64_t v28 = [NSNumber numberWithFloat:v27];
    [v16 setObject:v28 forKeyedSubscript:@"MIWBSkinWeight"];

    LODWORD(v29) = v36;
    v30 = [NSNumber numberWithFloat:v29];
    [v16 setObject:v30 forKeyedSubscript:@"DaylightScore"];

    int v31 = 0;
  }
  else
  {
    int v31 = FigSignalErrorAt();
  }

  return v31;
}

- (int)translateAWBGainsToSecondaryChannelID:(unsigned int)a3[3] secondaryChannelID:(unsigned int)a4 secondaryConfig:(SensorConfigAWBParams *)a5 secondaryAWBParams:(sSlaveCameraAWBParam *)a6
{
  AWBAlgorithmObj = self->_AWBAlgorithmObj;
  if (AWBAlgorithmObj)
  {
    (*((void (**)(CAWBAFE *, unsigned int *__attribute__((__org_arrdim(0,3))), void, SensorConfigAWBParams *, sSlaveCameraAWBParam *, void))AWBAlgorithmObj->var0
     + 5))(AWBAlgorithmObj, a3, a4, a5, a6, 0);
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

- (int)encodeSetFileIDForModuleConfig:(id)a3 setFileID:(unsigned int *)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  int v6 = [v5 objectForKeyedSubscript:@"SetFile"];
  int v7 = [v6 objectForKeyedSubscript:@"Origin"];

  if (v7)
  {
    unsigned int v8 = [MEMORY[0x263F08B08] scannerWithString:v7];
    unsigned int v9 = v8;
    if (v8)
    {
      [v8 setScanLocation:0];
      [v9 scanHexInt:(char *)&v14 + 4];
      objc_msgSend(v9, "setScanLocation:", objc_msgSend(v7, "rangeOfString:", @"_") + 1);
      [v9 scanHexInt:&v14];
      int v10 = BYTE1(v14) << 8;
      LODWORD(v14) = v10;
      if (a4)
      {
        int v11 = 0;
        *a4 = (HIDWORD(v14) >> 8) | (v10 << 8) | (BYTE4(v14) << 8);
      }
      else
      {
        int v11 = FigSignalErrorAt();
      }
      float v12 = v9;
    }
    else
    {
      int v11 = FigSignalErrorAt();
      float v12 = 0;
    }
  }
  else
  {
    float v12 = 0;
    int v11 = FigSignalErrorAt();
  }

  return v11;
}

- (int)initTuningParameters:(id)a3
{
  id v4 = a3;
  id v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if ([v4 count])
  {
    int v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
    if (([v6 isEqual:*MEMORY[0x263F2EF00]] & 1) != 0
      || ([v6 isEqual:*MEMORY[0x263F2EF08]] & 1) != 0
      || ([v6 isEqual:*MEMORY[0x263F2EF10]] & 1) != 0)
    {
      BOOL v7 = 0;
      unsigned int v8 = &lowLightWPBlendingTuningTable_RFCDefault;
      BOOL v9 = 1;
      int v10 = &ccmStrengthTuningTable_RFCDefault;
      unsigned int v11 = 16;
      float v12 = (const sWPStableZoneControlTable *)&wpStableZoneControlTable_RFCDefault;
LABEL_8:
      CAWBAFE::SetFDAWBEnable(self->_AWBAlgorithmObj, 1);
      CAWBAFE::SetSpatialCCMEnable(self->_AWBAlgorithmObj, v7);
      CAWBAFE::SetFlickerAWBEnable(self->_AWBAlgorithmObj, v9);
      CAWBAFE::SetUnlockWPEnable(self->_AWBAlgorithmObj, 1);
      CAWBAFE::SetLowLightWPBlending(self->_AWBAlgorithmObj, *v8, (const unsigned int *)v8 + 1, (const unsigned int *)v8 + 9);
      CAWBAFE::SetCCMStrengthTuningTable(self->_AWBAlgorithmObj, *v10, (const unsigned int *)v10 + 1, (const unsigned int *)v10 + 9);
      CAWBAFE::SetCCMDesatForSkinEnable(self->_AWBAlgorithmObj, v9, v11);
      CAWBAFE::SetFaceMaskDetectionEnable(self->_AWBAlgorithmObj, 1);
      CAWBAFE::SetWPStableZoneControl(self->_AWBAlgorithmObj, v7, v12);
      CAWBAFE::SetFDAWBVersion((int32x2_t *)self->_AWBAlgorithmObj, 1u);
      int v13 = 0;
      goto LABEL_9;
    }
    if (([v6 isEqual:*MEMORY[0x263F2EF18]] & 1) != 0
      || ([v6 isEqual:*MEMORY[0x263F2EF20]] & 1) != 0)
    {
      unsigned int v11 = 0;
      BOOL v9 = 0;
      BOOL v7 = 1;
      unsigned int v8 = &lowLightWPBlendingTuningTable_FFCDefault;
      int v10 = &ccmStrengthTuningTable_FFCDefault;
      float v12 = (const sWPStableZoneControlTable *)&wpStableZoneControlTable_FFCDefault;
      goto LABEL_8;
    }
    int v15 = FigSignalErrorAt();
  }
  else
  {
    int v6 = 0;
    int v15 = FigSignalErrorAt();
  }
  int v13 = v15;
LABEL_9:
  if (*v5 == 1) {
    kdebug_trace();
  }

  return v13;
}

- (int)configFaceMetadata:(id)a3 awbParams:(id)a4
{
  __src[190] = *MEMORY[0x263EF8340];
  id v96 = a3;
  id v8 = a4;
  memset(v101, 0, 44);
  bzero(__src, 0x5F0uLL);
  v92 = v8;
  CFDictionaryRef dict = [v8 validRectInBufferCoords];
  CFDictionaryRef v93 = [v8 regionOfInterestRectInBufferCoords];
  BOOL v9 = [v8 faceAssistedBehaviorMode];
  if (!v9)
  {
    BOOL v9 = [NSNumber numberWithInt:0];
    FigSignalErrorAt();
  }
  v95 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue"));

  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (![v96 count])
  {
    float v49 = 0;
    int v85 = FigSignalErrorAt();
    v98 = 0;
    v99 = 0;
    v97 = 0;
    goto LABEL_73;
  }
  v97 = [v96 objectForKeyedSubscript:*MEMORY[0x263F2F600]];
  v98 = [v96 objectForKeyedSubscript:*MEMORY[0x263F2F5F8]];
  self->_sMetaData.sensorWidth = [v97 intValue];
  self->_sMetaData.sensorHeight = [v98 intValue];
  int v10 = [v96 objectForKeyedSubscript:*MEMORY[0x263F2F440]];
  v99 = v10;
  if (v10
    && ([v10 objectForKeyedSubscript:*MEMORY[0x263F2F288]],
        (unsigned int v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v91 = v11;
    float v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2F290]];
    if ([v12 count])
    {
      int v13 = [v12 sortedArrayUsingComparator:&__block_literal_global];
      uint64_t v14 = v13;
      if (v13 && [v13 count])
      {
        unsigned int v15 = 0;
        uint64_t v90 = *MEMORY[0x263F2F620];
        uint64_t v89 = *MEMORY[0x263F2F368];
        uint64_t v88 = *MEMORY[0x263F2F4A8];
        uint64_t v87 = *MEMORY[0x263F2F478];
        id v16 = (double *)MEMORY[0x263F001A0];
        while (1)
        {
          unint64_t v17 = [v14 count];
          unint64_t v18 = 10;
          if (v17 < 0xA) {
            unint64_t v18 = v17;
          }
          if (v18 <= v15) {
            goto LABEL_39;
          }
          char v100 = 0;
          double v19 = [v14 objectAtIndexedSubscript:v15];
          double v20 = v19;
          if (!v19) {
            break;
          }
          objc_msgSend(v19, "cmi_cgRectForKey:defaultValue:found:", v90, &v100, *v16, v16[1], v16[2], v16[3]);
          if (!v100)
          {
            int v85 = 0;
            goto LABEL_79;
          }
          double v25 = v21;
          double v26 = v22;
          double v27 = v23;
          double v28 = v24;
          LODWORD(v4) = self->_sMetaData.sensorHeight;
          LODWORD(v5) = self->_sMetaData.sensorWidth;
          if (!CGRectMakeWithDictionaryRepresentation(dict, &rect)) {
            goto LABEL_84;
          }
          double x = v25 * (double)v5;
          double width = v27 * (double)v5;
          double v31 = v26 * (double)v4 - rect.origin.y;
          double v32 = -0.0;
          if (v31 < 0.0) {
            double v32 = v26 * (double)v4 - rect.origin.y;
          }
          double height = v28 * (double)v4 + v32;
          if (v31 >= 0.0) {
            double y = v26 * (double)v4 - rect.origin.y;
          }
          else {
            double y = 0.0;
          }
          if (v93)
          {
            if (!CGRectMakeWithDictionaryRepresentation(v93, &v102)) {
              goto LABEL_84;
            }
            if (CGRectContainsRect(rect, v102))
            {
              v105.origin.double x = x;
              v105.origin.double y = y;
              v105.size.double width = width;
              v105.size.double height = height;
              CGRect v106 = CGRectIntersection(v105, v102);
              double x = v106.origin.x;
              double y = v106.origin.y;
              double width = v106.size.width;
              double height = v106.size.height;
            }
            else
            {
              FigSignalErrorAt();
            }
          }
          if ([(NSNumber *)self->_digitalFlash intValue]) {
            int v37 = 5000;
          }
          else {
            int v37 = 50000;
          }
          float v35 = width;
          float v36 = height;
          if (v37 >= (int)(float)(v36 * v35))
          {

LABEL_39:
            DWORD2(v101[1]) = v15;
            goto LABEL_40;
          }
          float v38 = [v20 objectForKeyedSubscript:v89];
          uint64_t v39 = v38;
          if (!v38)
          {
LABEL_84:
            int v85 = FigSignalErrorAt();

LABEL_85:
LABEL_71:

            float v49 = v91;
            goto LABEL_73;
          }
          uint64_t v40 = &__src[19 * v15];
          *uint64_t v40 = (int)x;
          v40[1] = (int)y;
          void v40[2] = width;
          v40[3] = height;
          [v38 floatValue];
          LODWORD(__src[19 * v15 + 11]) = v41;

          v42 = [v20 objectForKeyedSubscript:v88];
          float v43 = [v20 objectForKeyedSubscript:v87];
          if (!v42
            || (__int16 v44 = [v42 unsignedIntValue],
                float v45 = &__src[19 * v15],
                int v47 = *((_DWORD *)v45 + 29),
                float v46 = (unsigned int *)v45 + 29,
                unsigned int *v46 = v47 & 0xFFFFFC00 | v44 & 0x3FF,
                DWORD1(v101[2]) = DWORD1(v101[2]) & 0xFFFFE007 | (8 * (v44 & 0x3FF)),
                !v43))
          {

            int v85 = 0;
            goto LABEL_85;
          }
          __int16 v48 = [v43 unsignedIntValue];
          unsigned int *v46 = *v46 & 0xFFF003FF | ((v48 & 0x3FF) << 10);
          LODWORD(v101[2]) = 0;
          DWORD1(v101[2]) = DWORD1(v101[2]) & 0xFF801FFF | ((v48 & 0x3FF) << 13);

          ++v15;
        }
        int v85 = FigSignalErrorAt();
LABEL_79:

        goto LABEL_85;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
LABEL_40:

    float v49 = v91;
  }
  else
  {
    float v49 = 0;
  }
  LODWORD(v101[1]) = [v97 intValue];
  DWORD1(v101[1]) = [v98 intValue];
  LODWORD(v101[0]) = 0;
  if (CAWBAFE::GetFDAWBEnable(self->_AWBAlgorithmObj))
  {
    if (DWORD2(v101[1])) {
      CAWBAFE::SetFaceData((uint64_t)self->_AWBAlgorithmObj, v101, __src);
    }
    AWBAlgorithmObj = self->_AWBAlgorithmObj;
    BOOL v51 = [(NSNumber *)self->_digitalFlash intValue] != 1
       && CAWBAFE::GetFDAWBVersion(self->_AWBAlgorithmObj) == 1;
    CAWBAFE::SetSemanticAWBEnable(AWBAlgorithmObj, v51);
    if (!DWORD2(v101[1]) && CAWBAFE::GetFDAWBVersion(self->_AWBAlgorithmObj) != 1) {
      CAWBAFE::SetFDAWBEnable(self->_AWBAlgorithmObj, 0);
    }
  }
  if ([v95 intValue] == 3)
  {
    float v52 = [v92 faceAssistedSkinGainsToMatch];
    float v12 = v52;
    if (v52 && [v52 count])
    {
      rect.origin.double x = 0.0;
      v102.origin.double x = 0.0;
      float v53 = [v12 objectForKeyedSubscript:@"wpRgLogRatio"];
      BOOL v54 = v53 == 0;

      if (v54) {
        FigSignalErrorAt();
      }
      v55 = [v12 objectForKeyedSubscript:@"wpRgLogRatio"];
      [v55 floatValue];
      float v57 = v56;
      *(float *)&rect.origin.double x = v56;

      v58 = [v12 objectForKeyedSubscript:@"wpBgLogRatio"];
      LODWORD(v55) = v58 == 0;

      if (v55) {
        FigSignalErrorAt();
      }
      float v59 = [v12 objectForKeyedSubscript:@"wpBgLogRatio"];
      [v59 floatValue];
      float v61 = v60;
      *((float *)&rect.origin.x + 1) = v60;

      float v62 = [v12 objectForKeyedSubscript:@"wpSkinRgLogRatio"];
      LODWORD(v59) = v62 == 0;

      if (v59) {
        FigSignalErrorAt();
      }
      float v63 = [v12 objectForKeyedSubscript:@"wpSkinRgLogRatio"];
      [v63 floatValue];
      float v65 = v64;
      *(float *)&v102.origin.double x = v64;

      float v66 = [v12 objectForKeyedSubscript:@"wpSkinBgLogRatio"];
      LODWORD(v63) = v66 == 0;

      if (v63) {
        FigSignalErrorAt();
      }
      v67 = [v12 objectForKeyedSubscript:@"wpSkinBgLogRatio"];
      [v67 floatValue];
      float v69 = v68;
      *((float *)&v102.origin.x + 1) = v68;

      int v70 = [v12 objectForKeyedSubscript:@"continuousFDTimes"];
      LODWORD(v67) = v70 == 0;

      if (v67) {
        FigSignalErrorAt();
      }
      v71 = [v12 objectForKeyedSubscript:@"continuousFDTimes"];
      uint64_t v72 = [v71 intValue];

      v73 = [v12 objectForKeyedSubscript:@"skinColorSampleNum"];
      LODWORD(v71) = v73 == 0;

      if (v71) {
        FigSignalErrorAt();
      }
      int v74 = [v12 objectForKeyedSubscript:@"skinColorSampleNum"];
      uint64_t v75 = [v74 intValue];

      v76 = [v12 objectForKeyedSubscript:@"skinColorSampleVariance"];
      LODWORD(v74) = v76 == 0;

      if (v74) {
        FigSignalErrorAt();
      }
      id v77 = [v12 objectForKeyedSubscript:@"skinColorSampleVariance"];
      [v77 floatValue];
      float v79 = v78;

      uint64_t v80 = [v12 objectForKeyedSubscript:@"minDistSkinToWhiteMapping"];
      LODWORD(v77) = v80 == 0;

      if (v77) {
        FigSignalErrorAt();
      }
      uint64_t v81 = [v12 objectForKeyedSubscript:@"minDistSkinToWhiteMapping"];
      [v81 floatValue];
      float v83 = v82;

      v84 = [NSString stringWithFormat:@"wbLogRatios=[%.3f, %.3f], wbSkinLogRatios=[%.3f, %.3f], continuousFDTimes=%d, skinColorSampleNum=%d", v57, v61, v65, v69, v72, v75];
      CAWBAFE::SetFaceAssistedAWBResultsForMatchProvidedSkinGains(self->_AWBAlgorithmObj, (float *)&rect, (float *)&v102, v75, v72, v79, v83);

      int v85 = 0;
    }
    else
    {
      int v85 = FigSignalErrorAt();
    }
    v91 = v49;
    goto LABEL_71;
  }
  int v85 = 0;
LABEL_73:
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v85;
}

uint64_t __45__AWBAlgorithm_configFaceMetadata_awbParams___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (int)configFlickerDetectionMetadata:(id)a3 moduleConfig:(id)a4
{
  id v40 = a3;
  id v41 = a4;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  CFDictionaryRef v6 = [v40 objectForKeyedSubscript:*MEMORY[0x263F2F5B8]];
  CFDictionaryRef v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F728]];
  float v8 = v7;
  if (v7) {
    self->_flickerDetectionStatus = [v7 intValue];
  }
  if (v41)
  {
    float v9 = [v41 objectForKeyedSubscript:@"AutoWhiteBalance"];
    if (!v9)
    {
      int v37 = FigSignalErrorAt();
      goto LABEL_27;
    }
    uint64_t v39 = v9;
    uint64_t v10 = [v9 objectForKeyedSubscript:@"DaylightProjectionPoint"];
    unsigned int v11 = malloc_type_malloc(4 * [v10 count], 0x100004052888210uLL);
    if (!v11)
    {
      int v37 = FigSignalErrorAt();

      goto LABEL_27;
    }
    for (unsigned int i = 0; [v10 count] > (unint64_t)i; ++i)
    {
      int v13 = [v10 objectAtIndexedSubscript:i];
      uint64_t v14 = [v13 objectForKeyedSubscript:@"X"];
      v11[2 * i] = [v14 intValue];

      unsigned int v15 = [v10 objectAtIndexedSubscript:i];
      id v16 = [v15 objectForKeyedSubscript:@"Y"];
      v11[2 * i + 1] = [v16 intValue];
    }
    CAWBAFE::SetDaylightProjectionPoint((uint64_t)self->_AWBAlgorithmObj, [v10 count], v11);
    free(v11);
  }
  unint64_t v17 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F720]];

  if (v17)
  {
    unint64_t v18 = NSNumber;
    [v17 doubleValue];
    double v19 = objc_msgSend(v18, "numberWithDouble:");

    [v19 doubleValue];
    self->_flickerDetectionIRRatio = vcvtd_n_s64_f64(v20, 0x10uLL);
    double v21 = v19;
  }
  else
  {
    double v21 = 0;
  }
  uint64_t v22 = *MEMORY[0x263F2F710];
  double v23 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F710]];
  double v24 = [v23 objectAtIndex:0];
  uint64_t v25 = *MEMORY[0x263F2F708];
  double v26 = [v24 objectForKeyedSubscript:*MEMORY[0x263F2F708]];

  if (v26)
  {
    double v27 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(int)objc_msgSend(v26, "intValue"));
    self->_flickerConfidence[0] = [v27 intValue];
  }
  double v28 = [v6 objectForKeyedSubscript:v22];
  double v29 = [v28 objectAtIndex:1];
  v30 = [v29 objectForKeyedSubscript:v25];

  if (v30)
  {
    double v31 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(int)objc_msgSend(v30, "intValue"));
    self->_flickerConfidence[1] = [v31 intValue];
  }
  double v32 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F718]];

  if (v32)
  {
    unsigned __int16 v33 = NSNumber;
    [v32 doubleValue];
    unsigned __int16 v34 = objc_msgSend(v33, "numberWithDouble:");
    [v34 doubleValue];
    *(float *)&double v35 = v35;
    self->_photometerAWBDebug_externalLudouble x = *(float *)&v35;
  }
  if (CAWBAFE::GetFlickerAWBEnable(self->_AWBAlgorithmObj))
  {
    int v36 = 3;
    do
    {
      if (v36 != 3) {
        CAWBAFE::updatePhotometerDetectionOutput(self->_AWBAlgorithmObj, &self->_sMetaData.ae);
      }
      CAWBAFE::SetFlickerDetectionResult((uint64_t)self->_AWBAlgorithmObj, self->_flickerDetectionStatus, 0.0, 0.0, self->_photometerAWBDebug_externalLux, 0, self->_flickerDetectionIRRatio, self->_flickerConfidence[0], 0, self->_flickerConfidence[1], 1);
      --v36;
    }
    while (v36);
  }
  int v37 = 0;
  float v8 = v32;
LABEL_27:
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v37;
}

- (int)configFlashRFCMetadata:(id)a3 cameraInfo:(id)a4 moduleConfig:(id)a5
{
  id v99 = a3;
  id v96 = a4;
  id v97 = a5;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  float v8 = [v99 objectForKeyedSubscript:*MEMORY[0x263F2F4E0]];
  int v9 = [v8 BOOLValue];

  if (!v9)
  {
    id v98 = 0;
    double v20 = 0;
    double v21 = 0;
    goto LABEL_49;
  }
  self->_isNominalStrobe = 1;
  uint64_t v10 = [v99 objectForKeyedSubscript:*MEMORY[0x263F2F6B0]];
  uint64_t v11 = [v99 objectForKeyedSubscript:*MEMORY[0x263F2F6B8]];
  v94 = (void *)v11;
  v95 = v10;
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    [v10 floatValue];
    float v14 = v13;
    [v94 floatValue];
    self->_flashRatio = 1.0 - (float)(v14 / v15);
  }
  if (v96)
  {
    id v16 = [v96 objectForKeyedSubscript:*MEMORY[0x263F2F738]];
    p_pmLEDCalibData = &self->_pmLEDCalibData;
    if (v16)
    {
      id v98 = v16;
      uint64_t v18 = [v98 bytes];
      self->_pmLEDCalibData.isvalid = 1;
      self->_ledType = 10;
      int v19 = *(_DWORD *)v18;
      if (*(_DWORD *)v18)
      {
        if (v19 == 1)
        {
          self->_pmLEDCalibData.programID = 0;
          p_pmLEDCalibData->version = 3;
          self->_pmLEDCalibData.ledWidePtrn_rg = *(float *)(v18 + 4);
          self->_pmLEDCalibData.ledWidePtrn_bg = *(float *)(v18 + 8);
        }
        else
        {
          if (v19 != 2)
          {
            v71 = 0;
            v91 = 0;
            v73 = 0;
            int v90 = -1;
            goto LABEL_66;
          }
          self->_pmLEDCalibData.programID = 1;
          p_pmLEDCalibData->version = 3;
          self->_pmLEDCalibData.ledWidePtrn_rg = *(float *)(v18 + 4);
          self->_pmLEDCalibData.ledWidePtrn_bg = *(float *)(v18 + 8);
          self->_pmLEDCalibData.ledTelePtrn_rg = *(float *)(v18 + 4);
          self->_pmLEDCalibData.ledTelePtrn_bg = *(float *)(v18 + 8);
          self->_pmLEDCalibData.ledSWidePtrn_rg = *(float *)(v18 + 4);
          self->_pmLEDCalibData.ledSWidePtrn_bg = *(float *)(v18 + 8);
        }
      }
      else
      {
        p_pmLEDCalibData->version = 2;
        self->_pmLEDCalibData.cw_rg = *(float *)(v18 + 4);
        self->_pmLEDCalibData.cw_bg = *(float *)(v18 + 8);
        self->_pmLEDCalibData.ww_rg = *(float *)(v18 + 12);
        self->_pmLEDCalibData.ww_bg = *(float *)(v18 + 16);
      }
    }
    else
    {
      id v98 = 0;
      self->_pmLEDCalibData.isvalid = 0;
    }
  }
  else
  {
    id v98 = 0;
  }
  if (!v97)
  {
LABEL_48:
    double v21 = v94;
    double v20 = v95;
LABEL_49:
    int v70 = [v99 objectForKeyedSubscript:*MEMORY[0x263F2F6E8]];
    v71 = v70;
    if (!v70)
    {
      int v90 = FigSignalErrorAt();
      v94 = v21;
      v95 = v20;
      v91 = 0;
      v73 = 0;
      goto LABEL_66;
    }
    self->_sMetaData.ae.gainDigiAE = vcvtms_s32_f32((float)(int)[v70 intValue] / 1.0159);
    uint64_t v72 = [v99 objectForKeyedSubscript:*MEMORY[0x263F2F470]];
    v73 = v72;
    if (v72)
    {
      [v72 floatValue];
      float v75 = v74 * 256.0;
    }
    else
    {
      float v75 = 1.0;
    }
    self->_sMetaData.ae.ev0Ratio = (int)v75;
    if (v97)
    {
      v76 = [v97 objectForKeyedSubscript:@"Exposure"];
      id v77 = [v76 objectForKeyedSubscript:@"LuxModel"];
      float v78 = [v77 objectForKeyedSubscript:@"Scale"];

      if (!v78) {
        goto LABEL_73;
      }
      float v79 = [v97 objectForKeyedSubscript:@"Exposure"];
      uint64_t v80 = [v79 objectForKeyedSubscript:@"LuxModel"];
      uint64_t v81 = [v80 objectForKeyedSubscript:@"Scale"];
      self->_sMetaData.ae.luxCalcParams.scale = [v81 intValue];

      float v82 = [v97 objectForKeyedSubscript:@"Exposure"];
      float v83 = [v82 objectForKeyedSubscript:@"LuxModel"];
      v84 = [v83 objectForKeyedSubscript:@"ScaleShift"];

      if (!v84)
      {
LABEL_73:
        v91 = 0;
        int v90 = FigSignalErrorAt();
LABEL_61:
        v94 = v21;
        v95 = v20;
        goto LABEL_66;
      }
      int v85 = [v97 objectForKeyedSubscript:@"Exposure"];
      v86 = [v85 objectForKeyedSubscript:@"LuxModel"];
      uint64_t v87 = [v86 objectForKeyedSubscript:@"ScaleShift"];
      self->_sMetaData.ae.luxCalcParams.scaleShift = [v87 intValue];
    }
    self->_sMetaData.ae.overflowDGain = 256;
    if (v96)
    {
      uint64_t v88 = [v96 objectForKeyedSubscript:*MEMORY[0x263F2F750]];
      uint64_t v89 = v88;
      if (v88)
      {
        int v90 = 0;
        self->_sensorClockFreqHz = (float)[v88 unsignedIntValue];
        v94 = v21;
        v95 = v20;
        v91 = v89;
        goto LABEL_66;
      }
    }
    v91 = 0;
    int v90 = 0;
    goto LABEL_61;
  }
  uint64_t v22 = [v97 objectForKeyedSubscript:@"AutoWhiteBalance"];
  CFDictionaryRef v93 = v22;
  if (v22)
  {
    double v23 = [v22 objectForKeyedSubscript:@"Flash"];
    double v24 = [v23 objectForKeyedSubscript:@"Projection"];

    uint64_t v25 = 0;
    while (1)
    {
      double v26 = objc_msgSend(v24, "objectForKeyedSubscript:", @"MatrixRGBToXYZ", v93);
      double v27 = [v26 objectAtIndexedSubscript:v25];

      if (!v27) {
        break;
      }
      double v28 = [v24 objectForKeyedSubscript:@"MatrixRGBToXYZ"];
      double v29 = [v28 objectAtIndexedSubscript:v25];
      v100[v25] = [v29 intValue];

      v30 = [v24 objectForKeyedSubscript:@"MatrixXYZToRGB"];
      double v31 = [v30 objectAtIndexedSubscript:v25];

      if (!v31) {
        break;
      }
      double v32 = [v24 objectForKeyedSubscript:@"MatrixXYZToRGB"];
      unsigned __int16 v33 = [v32 objectAtIndexedSubscript:v25];
      v100[v25 + 9] = [v33 intValue];

      if (++v25 == 9)
      {
        uint64_t v34 = 0;
        double v35 = &v101;
LABEL_27:
        uint64_t v36 = 0;
        while (1)
        {
          int v37 = [v24 objectForKeyedSubscript:@"MatrixRGBToXYZ"];
          float v38 = [v37 objectAtIndexedSubscript:v34];

          if (!v38) {
            goto LABEL_62;
          }
          uint64_t v39 = [v24 objectForKeyedSubscript:@"CCMModel"];
          id v40 = [v39 objectAtIndexedSubscript:v34];
          id v41 = [v40 objectAtIndexedSubscript:v36];
          v35[v36] = [v41 intValue];

          if (++v36 == 5)
          {
            ++v34;
            v35 += 5;
            if (v34 != 6) {
              goto LABEL_27;
            }
            uint64_t v42 = 0;
            float v43 = v102;
LABEL_32:
            __int16 v44 = [v24 objectForKeyedSubscript:@"BoundingEllipsesModel"];
            float v45 = [v44 objectAtIndexedSubscript:v42];

            if (v45)
            {
              uint64_t v46 = 0;
              while (1)
              {
                int v47 = [v24 objectForKeyedSubscript:@"BoundingEllipsesModel"];
                __int16 v48 = [v47 objectAtIndexedSubscript:v42];
                float v49 = [v48 objectAtIndexedSubscript:v46];

                if (!v49) {
                  break;
                }
                float v50 = [v24 objectForKeyedSubscript:@"BoundingEllipsesModel"];
                BOOL v51 = [v50 objectAtIndexedSubscript:v42];
                float v52 = [v51 objectAtIndexedSubscript:v46];
                *(_DWORD *)&v43[4 * v46] = [v52 intValue];

                if (++v46 == 6)
                {
                  ++v42;
                  v43 += 24;
                  if (v42 != 6) {
                    goto LABEL_32;
                  }
                  uint64_t v53 = 0;
                  BOOL v54 = v100;
                  do
                  {
                    v55 = [&unk_26F3F22B0 objectAtIndexedSubscript:v53];
                    float v56 = [v24 objectForKeyedSubscript:v55];

                    if (!v56)
                    {
LABEL_63:
                      int v90 = FigSignalErrorAt();

                      goto LABEL_64;
                    }
                    unint64_t v57 = 0;
                    *(_WORD *)&v102[26 * v53 + 144] = [v56 count];
                    while ([v56 count] > v57)
                    {
                      v58 = [v56 objectAtIndexedSubscript:v57];
                      float v59 = [v58 objectForKeyedSubscript:@"Index"];

                      if (!v59) {
                        goto LABEL_63;
                      }
                      float v60 = [v56 objectAtIndexedSubscript:v57];
                      float v61 = [v60 objectForKeyedSubscript:@"Index"];
                      *((_WORD *)v54 + v57 + 169) = [v61 intValue];

                      float v62 = [v56 objectAtIndexedSubscript:v57];
                      float v63 = [v62 objectForKeyedSubscript:@"Weight"];

                      if (!v63) {
                        goto LABEL_63;
                      }
                      float v64 = [v56 objectAtIndexedSubscript:v57];
                      float v65 = [v64 objectForKeyedSubscript:@"Weight"];
                      *((_WORD *)v54 + v57 + 175) = [v65 intValue];

                      ++v57;
                    }

                    ++v53;
                    BOOL v54 = (_DWORD *)((char *)v54 + 26);
                  }
                  while (v53 != 4);
                  float v66 = [v24 objectForKeyedSubscript:@"UseQuantileLuxLevels"];

                  if (v66)
                  {
                    v67 = [v24 objectForKeyedSubscript:@"UseQuantileLuxLevels"];
                    v102[248] = [v67 intValue];

                    float v68 = [v24 objectForKeyedSubscript:@"UseFlashCCMMixing"];

                    if (v68)
                    {
                      float v69 = [v24 objectForKeyedSubscript:@"UseFlashCCMMixing"];
                      v102[249] = [v69 intValue];

                      CAWBAFE::SetFlashProjectionConfig((uint64_t)self->_AWBAlgorithmObj, (unsigned __int8 *)v100);
                      goto LABEL_48;
                    }
                  }
                  goto LABEL_62;
                }
              }
            }
            goto LABEL_62;
          }
        }
      }
    }
LABEL_62:
    int v90 = FigSignalErrorAt();
LABEL_64:
  }
  else
  {
    int v90 = FigSignalErrorAt();
  }
  v71 = 0;
  v91 = 0;
  v73 = 0;
LABEL_66:
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v90;
}

- (int)configFallbackMetadata:(id)a3
{
  id v4 = a3;
  id v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  p_fallbackGains = &self->_fallbackGains;
  self->_fallbackGains.validAWBData = 1;
  CFDictionaryRef v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F308]];
  awbRGain = self->_fallbackGains.awbRGain;
  self->_fallbackGains.awbRGain = v7;

  if (!self->_fallbackGains.awbRGain) {
    p_fallbackGains->validAWBData = 0;
  }
  int v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F300]];
  awbGGain = self->_fallbackGains.awbGGain;
  self->_fallbackGains.awbGGain = v9;

  if (!self->_fallbackGains.awbGGain) {
    p_fallbackGains->validAWBData = 0;
  }
  uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F2C8]];
  awbBGain = self->_fallbackGains.awbBGain;
  self->_fallbackGains.awbBGain = v11;

  if (!self->_fallbackGains.awbBGain) {
    p_fallbackGains->validAWBData = 0;
  }
  float v13 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F2E0]];
  awbComboRGain = self->_fallbackGains.awbComboRGain;
  self->_fallbackGains.awbComboRGain = v13;

  if (!self->_fallbackGains.awbComboRGain) {
    p_fallbackGains->validAWBData = 0;
  }
  float v15 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F2D8]];
  awbComboGGain = self->_fallbackGains.awbComboGGain;
  self->_fallbackGains.awbComboGGain = v15;

  if (!self->_fallbackGains.awbComboGGain) {
    p_fallbackGains->validAWBData = 0;
  }
  unint64_t v17 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F2D0]];
  awbComboBGain = self->_fallbackGains.awbComboBGain;
  self->_fallbackGains.awbComboBGain = v17;

  if (!self->_fallbackGains.awbComboBGain) {
    p_fallbackGains->validAWBData = 0;
  }
  if (*v5 == 1) {
    kdebug_trace();
  }

  return 0;
}

- (int)configPortTypeMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  if (([v5 isEqual:*MEMORY[0x263F2EF18]] & 1) != 0
    || [v5 isEqual:*MEMORY[0x263F2EF20]])
  {
    unsigned __int8 v6 = 2;
  }
  else if ([v5 isEqual:*MEMORY[0x263F2EF08]])
  {
    unsigned __int8 v6 = 4;
  }
  else
  {
    if (![v5 isEqual:*MEMORY[0x263F2EF10]])
    {
      self->_sMetaData.channel = 0;
      goto LABEL_5;
    }
    unsigned __int8 v6 = 1;
  }
  self->_sMetaData.channel = v6;
LABEL_5:

  return 0;
}

+ (int)doAWBConfigLoad:(id)a3 to:(id)a4
{
  uint64_t v177 = *MEMORY[0x263EF8340];
  id v154 = a3;
  id v143 = a4;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v144 = (char *)[v143 pointerValue];
  int v5 = 0;
  v142 = 0;
  if (!v154)
  {
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
    v152 = 0;
    v153 = 0;
    v145 = 0;
    v146 = 0;
    v151 = 0;
    v156 = 0;
    v157 = 0;
    v158 = 0;
    v159 = 0;
    v155 = 0;
    v160 = 0;
    goto LABEL_73;
  }
  v147 = 0;
  v148 = 0;
  v149 = 0;
  v150 = 0;
  v152 = 0;
  v153 = 0;
  v145 = 0;
  v146 = 0;
  v151 = 0;
  v156 = 0;
  v157 = 0;
  v158 = 0;
  v159 = 0;
  v155 = 0;
  v160 = 0;
  if (!v144) {
    goto LABEL_73;
  }
  unsigned __int8 v6 = [v154 objectForKeyedSubscript:@"Histogram"];
  CFDictionaryRef v7 = [v6 objectForKeyedSubscript:@"WeightMasks"];

  v160 = v7;
  float v8 = malloc_type_malloc(1026 * [v7 count], 0x100004040BEE09CuLL);
  for (unsigned int i = 0; ; unsigned int i = v10 + 1)
  {
    uint64_t v10 = i;
    if ([v7 count] <= (unint64_t)i) {
      break;
    }
    uint64_t v11 = [v7 objectAtIndexedSubscript:i];
    BOOL v12 = [v11 objectForKeyedSubscript:@"Lux"];
    uint64_t v13 = (uint64_t)&v8[513 * i + 1];
    v8[513 * v10] = [v12 intValue];

    for (uint64_t j = 0; j != 1024; ++j)
    {
      float v15 = [v7 objectAtIndexedSubscript:v10];
      id v16 = [v15 objectForKeyedSubscript:@"WeightMask"];
      unint64_t v17 = [v16 objectAtIndexedSubscript:j];
      *(unsigned char *)(v13 + j) = [v17 intValue];
    }
  }
  CAWBAFE::SetHistogramWeight(v144, [v7 count], (uint64_t)v8);
  free(v8);
  v158 = [v154 objectForKeyedSubscript:@"CSC"];
  if (!v158)
  {
    int v5 = FigSignalErrorAt();
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
    v152 = 0;
    v153 = 0;
    v145 = 0;
    v146 = 0;
    v151 = 0;
    v156 = 0;
    v157 = 0;
    v158 = 0;
    v159 = 0;
    v155 = 0;
    v142 = 0;
    goto LABEL_73;
  }
  for (uint64_t k = 0; k != 9; ++k)
  {
    int v19 = [v158 objectForKeyedSubscript:@"CCMCoef"];
    double v20 = [v19 objectAtIndexedSubscript:k];
    v174.var0[k] = [v20 intValue];

    double v21 = [v158 objectForKeyedSubscript:@"CSCCoef"];
    uint64_t v22 = [v21 objectAtIndexedSubscript:k];
    v174.var1[k] = [v22 intValue];
  }
  uint64_t v23 = 0;
  var2 = v174.var2;
  do
  {
    uint64_t v25 = [v158 objectForKeyedSubscript:@"CSCMax"];
    double v26 = [v25 objectAtIndexedSubscript:v23];
    var2[6] = [v26 intValue];

    double v27 = [v158 objectForKeyedSubscript:@"CSCMin"];
    double v28 = [v27 objectAtIndexedSubscript:v23];
    var2[3] = [v28 intValue];

    double v29 = [v158 objectForKeyedSubscript:@"CSCOffset"];
    v30 = [v29 objectAtIndexedSubscript:v23];
    *var2++ = [v30 intValue];

    ++v23;
  }
  while (v23 != 3);
  v174.var6 = 1;
  double v31 = [v158 objectForKeyedSubscript:@"CSCChromaScale0"];
  v174.var5[0] = [v31 intValue];

  double v32 = [v158 objectForKeyedSubscript:@"CSCChromaScale1"];
  v174.var5[1] = [v32 intValue];

  unsigned __int16 v33 = objc_msgSend(v154, "objectForKeyedSubscript:", @"Histogram", CAWBAFE::UpdateCSCConfig((CAWBAFE *)v144, &v174).n128_f64[0]);
  v153 = [v33 objectForKeyedSubscript:@"Config"];

  if (!v153)
  {
    int v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v153 = 0;
LABEL_81:
    v145 = 0;
    v146 = 0;
    v150 = 0;
    v151 = 0;
    v156 = 0;
    v157 = 0;
    v159 = 0;
    v155 = 0;
    v152 = 0;
    goto LABEL_73;
  }
  for (uint64_t m = 0; m != 15; ++m)
  {
    double v35 = [v153 objectForKeyedSubscript:@"YThd"];
    uint64_t v36 = [v35 objectAtIndexedSubscript:m];
    v176.var0[m] = [v36 intValue];
  }
  for (uint64_t n = 0; n != 16; ++n)
  {
    float v38 = [v153 objectForKeyedSubscript:@"Count"];
    uint64_t v39 = [v38 objectAtIndexedSubscript:n];
    v176.var1[n] = [v39 intValue];
  }
  id v40 = [v153 objectForKeyedSubscript:@"C1Offset"];
  v176.var2 = [v40 intValue];

  id v41 = [v153 objectForKeyedSubscript:@"C1Scale"];
  v176.var3 = [v41 intValue];

  uint64_t v42 = [v153 objectForKeyedSubscript:@"C2Offset"];
  v176.var4 = [v42 intValue];

  float v43 = [v153 objectForKeyedSubscript:@"C2Scale"];
  v176.var5 = [v43 intValue];

  __int16 v44 = objc_msgSend(v154, "objectForKeyedSubscript:", @"ProjectionPoint", CAWBAFE::UpdateColorHistConfig((CAWBAFE *)v144, &v176).n128_f64[0]);
  if (!v44)
  {
    int v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    goto LABEL_81;
  }
  v155 = v44;
  float v45 = malloc_type_malloc(4 * [v44 count], 0x100004052888210uLL);
  for (iunsigned int i = 0; [v155 count] > (unint64_t)ii; ++ii)
  {
    int v47 = [v155 objectAtIndexedSubscript:ii];
    __int16 v48 = [v47 objectForKeyedSubscript:@"X"];
    v45[2 * ii] = [v48 intValue];

    float v49 = [v155 objectAtIndexedSubscript:ii];
    float v50 = [v49 objectForKeyedSubscript:@"Y"];
    v45[2 * ii + 1] = [v50 intValue];
  }
  CAWBAFE::SetProjectionPoint((uint64_t)v144, [v155 count], v45);
  free(v45);
  BOOL v51 = [v154 objectForKeyedSubscript:@"Histogram"];
  v156 = [v51 objectForKeyedSubscript:@"XToCCT"];

  if (!v156)
  {
    int v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
    v145 = 0;
    v146 = 0;
    v151 = 0;
    v152 = 0;
    v156 = 0;
    v157 = 0;
LABEL_95:
    v159 = 0;
    goto LABEL_73;
  }
  float v52 = malloc_type_malloc(6 * [v156 count], 0x1000040274DC3F3uLL);
  for (juint64_t j = 0; [v156 count] > (unint64_t)jj; ++jj)
  {
    BOOL v54 = [v156 objectAtIndexedSubscript:jj];
    v55 = [v54 objectForKeyedSubscript:@"X"];
    v52[3 * jj] = [v55 intValue];

    float v56 = [v156 objectAtIndexedSubscript:jj];
    unint64_t v57 = [v56 objectForKeyedSubscript:@"Y"];
    v52[3 * jj + 1] = [v57 intValue];

    v58 = [v156 objectAtIndexedSubscript:jj];
    float v59 = [v58 objectForKeyedSubscript:@"CCT"];
    v52[3 * jj + 2] = [v59 intValue];
  }
  CAWBAFE::SetHistogramXToCCTLut((uint64_t)v144, [v156 count], v52);
  free(v52);
  v152 = [v154 objectForKeyedSubscript:@"AWBSkinToWhiteLut"];
  if (v152 && (unint64_t)[v152 count] <= 0x96)
  {
    float v60 = malloc_type_malloc(8 * [v152 count], 0x100004000313F17uLL);
    if (!v60)
    {
LABEL_94:
      int v5 = FigSignalErrorAt();
      v142 = 0;
      v147 = 0;
      v148 = 0;
      v149 = 0;
      v150 = 0;
      v145 = 0;
      v146 = 0;
      v151 = 0;
      v157 = 0;
      goto LABEL_95;
    }
    for (kuint64_t k = 0; ; kuint64_t k = v62 + 1)
    {
      uint64_t v62 = kk;
      if ([v152 count] <= (unint64_t)kk) {
        break;
      }
      float v63 = [v152 objectAtIndexedSubscript:kk];
      float v64 = [v63 objectForKeyedSubscript:@"Xs"];
      float v65 = &v60[4 * kk];
      v65[2] = [v64 unsignedIntValue];

      float v66 = [v152 objectAtIndexedSubscript:v62];
      v67 = [v66 objectForKeyedSubscript:@"Xw"];
      _WORD *v65 = [v67 unsignedIntValue];

      float v68 = [v152 objectAtIndexedSubscript:v62];
      float v69 = [v68 objectForKeyedSubscript:@"Ys"];
      v60[4 * v62 + 3] = [v69 unsignedIntValue];

      int v70 = [v152 objectAtIndexedSubscript:v62];
      v71 = [v70 objectForKeyedSubscript:@"Yw"];
      v60[4 * v62 + 1] = [v71 unsignedIntValue];
    }
    CAWBAFE::SetSkinToWhiteLut((uint64_t)v144, [v152 count], v60);
    free(v60);
  }
  v159 = [v154 objectForKeyedSubscript:@"CCM"];
  if (!v159) {
    goto LABEL_94;
  }
  uint64_t v72 = 0;
  v73 = v171;
  do
  {
    float v74 = [v159 objectForKeyedSubscript:@"Offset"];
    float v75 = [v74 objectAtIndexedSubscript:v72];
    *(v73 - 27) = [v75 intValue];

    v76 = [v159 objectForKeyedSubscript:@"X1stOrder"];
    id v77 = [v76 objectAtIndexedSubscript:v72];
    *(v73 - 18) = [v77 intValue];

    float v78 = [v159 objectForKeyedSubscript:@"Y1stOrder"];
    float v79 = [v78 objectAtIndexedSubscript:v72];
    *(v73 - 9) = [v79 intValue];

    uint64_t v80 = [v159 objectForKeyedSubscript:@"X2ndOrder"];
    uint64_t v81 = [v80 objectAtIndexedSubscript:v72];
    __int16 *v73 = [v81 intValue];

    float v82 = [v159 objectForKeyedSubscript:@"Y2ndOrder"];
    float v83 = [v82 objectAtIndexedSubscript:v72];
    v73[9] = [v83 intValue];

    v84 = [v159 objectForKeyedSubscript:@"LuxFactor"];
    int v85 = [v84 objectAtIndexedSubscript:v72];
    v73[18] = [v85 intValue];

    ++v72;
    ++v73;
  }
  while (v72 != 9);
  v86 = objc_msgSend(v159, "objectForKeyedSubscript:", @"CCMLuxClipLevel", CAWBAFE::SetCCM2DCoefficient((CAWBAFE *)v144, v168, v169, v170, v171, v172, &v173).n128_f64[0]);
  CAWBAFE::SetCCMLuxClip((CAWBAFE *)v144, [v86 intValue]);

  uint64_t v87 = [v154 objectForKeyedSubscript:@"PostTint"];
  if (!v87)
  {
    int v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
    v145 = 0;
    v146 = 0;
    v151 = 0;
    v157 = 0;
    goto LABEL_73;
  }
  v157 = v87;
  uint64_t v88 = malloc_type_malloc(8 * [v87 count], 0x100004000313F17uLL);
  for (muint64_t m = 0; [v157 count] > (unint64_t)mm; ++mm)
  {
    int v90 = [v157 objectAtIndexedSubscript:mm];
    v91 = [v90 objectForKeyedSubscript:@"Offset"];
    v88[4 * mm] = [v91 intValue];

    v92 = [v157 objectAtIndexedSubscript:mm];
    CFDictionaryRef v93 = [v92 objectForKeyedSubscript:@"KEst"];
    v88[4 * mm + 1] = [v93 intValue];

    v94 = [v157 objectAtIndexedSubscript:mm];
    v95 = [v94 objectForKeyedSubscript:@"KHist"];
    v88[4 * mm + 2] = [v95 intValue];

    id v96 = [v157 objectAtIndexedSubscript:mm];
    id v97 = [v96 objectForKeyedSubscript:@"HClip"];
    v88[4 * mm + 3] = [v97 intValue];
  }
  CAWBAFE::SetPostTintParam((uint64_t)v144, [v157 count], v88);
  free(v88);
  id v98 = [v154 objectForKeyedSubscript:@"MixLighting"];
  v151 = [v98 objectForKeyedSubscript:@"XCoordinate"];

  if (!v151)
  {
    int v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
    v145 = 0;
    v146 = 0;
    v151 = 0;
    goto LABEL_73;
  }
  for (nuint64_t n = 0; nn != 3; ++nn)
  {
    char v100 = [v151 objectAtIndexedSubscript:nn];
    v167[nn] = [v100 intValue];
  }
  CAWBAFE::SetMixLightingXLoc((CAWBAFE *)v144, v167);
  int v101 = [v154 objectForKeyedSubscript:@"MixLighting"];
  v150 = [v101 objectForKeyedSubscript:@"CCM"];

  if (!v150)
  {
    int v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
LABEL_88:
    v145 = 0;
    v146 = 0;
    goto LABEL_73;
  }
  for (uint64_t i1 = 0; i1 != 9; ++i1)
  {
    v103 = [v150 objectAtIndexedSubscript:i1];
    v166.n128_u16[i1] = [v103 intValue];
  }
  v146 = objc_msgSend(v154, "objectForKeyedSubscript:", @"YThreshold", CAWBAFE::SetMixLightingCCM((CAWBAFE *)v144, &v166).n128_f64[0]);
  if (!v146)
  {
    int v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    goto LABEL_88;
  }
  uint64_t v104 = 0;
  char v105 = 1;
  do
  {
    char v106 = v105;
    v107 = [v146 objectAtIndexedSubscript:v104];
    v164[v104 + 8] = [v107 intValue];

    char v105 = 0;
    uint64_t v104 = 1;
  }
  while ((v106 & 1) != 0);
  CAWBAFE::SetTileStatsYThreshold((CAWBAFE *)v144, v165);
  v145 = [v154 objectForKeyedSubscript:@"RatioSpace2ndGainThreshold"];
  if (v145)
  {
    uint64_t v108 = 0;
    char v109 = 1;
    do
    {
      char v110 = v109;
      v111 = [v145 objectAtIndexedSubscript:v108];
      v163[v108 + 20] = [v111 intValue];

      char v109 = 0;
      uint64_t v108 = 1;
    }
    while ((v110 & 1) != 0);
    CAWBAFE::SetRatioSpace2ndGainThreshold((CAWBAFE *)v144, v164);
    v112 = [v154 objectForKeyedSubscript:@"Histogram"];
    v149 = [v112 objectForKeyedSubscript:@"TrimFilterV"];

    if (v149)
    {
      for (uint64_t i2 = 0; i2 != 13; ++i2)
      {
        v114 = [v149 objectAtIndexedSubscript:i2];
        v163[i2] = [v114 intValue];
      }
      v115 = objc_msgSend(v154, "objectForKeyedSubscript:", @"Histogram", CAWBAFE::SetHistogramTrimFilterV((CAWBAFE *)v144, v163).n128_f64[0]);
      v148 = [v115 objectForKeyedSubscript:@"TrimFilterH"];

      if (v148)
      {
        for (uint64_t i3 = 0; i3 != 3; ++i3)
        {
          v117 = [v148 objectAtIndexedSubscript:i3];
          v162[i3] = [v117 intValue];
        }
        CAWBAFE::SetHistogramTrimFilterH((CAWBAFE *)v144, v162);
        v118 = [v154 objectForKeyedSubscript:@"Histogram"];
        v147 = [v118 objectForKeyedSubscript:@"TrimScaleProfile"];

        if (v147)
        {
          for (uint64_t i4 = 0; i4 != 32; ++i4)
          {
            v120 = [v147 objectAtIndexedSubscript:i4];
            v161[i4] = [v120 intValue];
          }
          v121 = objc_msgSend(v154, "objectForKeyedSubscript:", @"Scheme", CAWBAFE::SetHistogramTrimScaleProfile((CAWBAFE *)v144, v161).n128_f64[0]);
          v122 = v121;
          if (v121)
          {
            CAWBAFE::SetScheme((uint64_t)v144, [v121 isEqualToString:@"2DHistogram"]);
            v142 = v122;
            v123 = [v154 objectForKeyedSubscript:@"ColorMatchingModel"];
            [v123 count];

            for (unsigned int i5 = 0; ; unsigned int i5 = v126 + 1)
            {
              v125 = [v154 objectForKeyedSubscript:@"ColorMatchingModel"];
              unsigned int v126 = i5;
              BOOL v127 = [v125 count] > (unint64_t)i5;

              if (!v127)
              {
                v140 = [v154 objectForKeyedSubscript:@"ColorMatchingModel"];
                (*(void (**)(char *, uint64_t, unsigned char *))(*(void *)v144 + 144))(v144, [v140 count], v175);

                int v5 = 0;
                goto LABEL_73;
              }
              v128 = [v154 objectForKeyedSubscript:@"ColorMatchingModel"];
              v129 = [v128 objectAtIndexedSubscript:i5];

              if (!v129) {
                break;
              }
              uint64_t v130 = 0;
              uint64_t v131 = 28 * i5;
              v132 = &v175[v131 + 4];
              v133 = &v175[v131 + 16];
              do
              {
                v134 = [v129 objectForKeyedSubscript:@"BGGainMatchingModel"];
                v135 = [v134 objectAtIndexedSubscript:v130];
                *(_DWORD *)&v133[4 * v130] = [v135 intValue];

                ++v130;
              }
              while (v130 != 3);
              for (uint64_t i6 = 0; i6 != 3; ++i6)
              {
                v137 = [v129 objectForKeyedSubscript:@"RGGainMatchingModel"];
                v138 = [v137 objectAtIndexedSubscript:i6];
                *(_DWORD *)&v132[4 * i6] = [v138 intValue];
              }
              v139 = [v129 objectForKeyedSubscript:@"SlaveCameraID"];
              *(_DWORD *)&v175[28 * v126] = [v139 intValue];
            }
            int v5 = FigSignalErrorAt();
          }
          else
          {
            int v5 = FigSignalErrorAt();
            v142 = 0;
          }
        }
        else
        {
          int v5 = FigSignalErrorAt();
          v142 = 0;
          v147 = 0;
        }
      }
      else
      {
        int v5 = FigSignalErrorAt();
        v142 = 0;
        v147 = 0;
        v148 = 0;
      }
    }
    else
    {
      int v5 = FigSignalErrorAt();
      v142 = 0;
      v147 = 0;
      v148 = 0;
      v149 = 0;
    }
  }
  else
  {
    int v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v145 = 0;
  }
LABEL_73:
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v5;
}

- (int)awbConfigLoad:(id)a3 to:(CAWBAFE *)a4
{
  id v5 = a3;
  if (v5 && a4)
  {
    unsigned __int8 v6 = [MEMORY[0x263F08D40] valueWithPointer:a4];
    int v7 = +[AWBAlgorithm doAWBConfigLoad:v5 to:v6];
  }
  else
  {
    int v7 = FigSignalErrorAt();
  }

  return v7;
}

- (int)process
{
  uint64_t v2 = MEMORY[0x270FA5388](self);
  uint64_t v177 = *MEMORY[0x263EF8340];
  memset(v157, 0, 6);
  *(void *)(v2 + 5104) = 0;
  *(void *)(v2 + 5120) = 0;
  *(void *)(v2 + 5112) = 0;
  *(void *)&v156.double x = 0;
  *(void *)&v156.double width = 0;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  bzero(v162, 0x4D10uLL);
  __int16 v170 = *(_DWORD *)(v2 + 5056);
  __int16 v171 = *(_DWORD *)(v2 + 5060);
  char v167 = 1;
  int v3 = *(_DWORD *)(v2 + 5064);
  __int16 v174 = v3;
  int v4 = *(_DWORD *)(v2 + 5068);
  __int16 v175 = v4;
  int v163 = v4 + (v3 << 16);
  char v165 = 1;
  if (CAWBAFE::GetLargestFaceRect(*(CAWBAFE **)(v2 + 16), &v156))
  {
    __int16 v166 = 257;
    float32x2_t v5 = vcvt_f32_s32(*(int32x2_t *)&v156.width);
    uint32x2_t v6 = (uint32x2_t)vcvt_s32_f32(vmul_f32(v5, (float32x2_t)0x3ECCCCCD3F19999ALL));
    int32x2_t v7 = vsra_n_s32((int32x2_t)0x300000003, (int32x2_t)vsra_n_u32(v6, v6, 0x1FuLL), 1uLL);
    uint32x2_t v8 = (uint32x2_t)vcvt_s32_f32(vmul_f32(v5, (float32x2_t)0x3F19999A3ECCCCCDLL));
    int32x2_t v9 = vsra_n_s32((int32x2_t)0x300000003, (int32x2_t)vsra_n_u32(v8, v8, 0x1FuLL), 1uLL);
    int32x2_t v164 = vadd_s32((int32x2_t)vshl_u32((uint32x2_t)vshr_n_s32((int32x2_t)vsra_n_u32((uint32x2_t)v9, (uint32x2_t)vcltz_s32(v9), 0x1EuLL), 2uLL), (uint32x2_t)0x200000012), vrev64_s32((int32x2_t)vshl_u32((uint32x2_t)vshr_n_s32((int32x2_t)vsra_n_u32((uint32x2_t)v7, (uint32x2_t)vcltz_s32(v7), 0x1EuLL), 2uLL), (uint32x2_t)0x200000012)));
  }
  uint64_t v176 = 0x800000008000;
  id v10 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"tileStatsConfig"];
  uint64_t v11 = (_DWORD *)[v10 bytes];

  int v12 = v11[1];
  if (v12 >= 0) {
    int v13 = v11[1];
  }
  else {
    int v13 = v12 + 1;
  }
  int v14 = v13 >> 1;
  __int16 v172 = v14;
  int v15 = v11[2];
  if (v15 >= 0) {
    int v16 = v11[2];
  }
  else {
    int v16 = v15 + 1;
  }
  int v17 = v16 >> 1;
  __int16 v173 = v17;
  unsigned __int16 v168 = (v11[3] - v12) >> 1;
  unsigned __int16 v169 = (v11[4] - v15) >> 1;
  int v18 = v168;
  int v19 = v169;
  uint64_t v20 = *(void *)(v2 + 16);
  *(_DWORD *)(v2 + 3876) = (unsigned __int16)v14;
  *(_DWORD *)(v2 + 3880) = (unsigned __int16)v17;
  *(_DWORD *)(v2 + 3884) = v18;
  *(_DWORD *)(v2 + 3888) = v19;
  CAWBAFE::SetScheme(v20, 1);
  double v21 = *(CAWBAFE **)(v2 + 16);
  id v22 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"tileStats"];
  uint64_t v23 = (_TILE_Stat_Elem *)[v22 bytes];
  id v24 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"windowStats"];
  uint64_t v25 = (_AEAWB_Stat_Elem *)[v24 bytes];
  id v26 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"histStats"];
  CAWBAFE::SetStats(v21, (_FE_3A_Stats_H15 *)v162, v23, v25, (unsigned int *)[v26 bytes], 0);

  CAWBAFE::SetFrameRateForHistAWB(*(CAWBAFE **)(v2 + 16), *(_WORD *)(v2 + 88));
  CAWBAFE::SetSensorClockFreq(*(CAWBAFE **)(v2 + 16), *(float *)(v2 + 4988));
  CAWBAFE::EstimateCurrentSceneLuxLevels(*(CAWBAFE **)(v2 + 16), (sMetaData *)(v2 + 24));
  CAWBAFE::GetCurrentSceneLuxLevels(*(CAWBAFE **)(v2 + 16), v157);
  *(_DWORD *)(v2 + 320) = *(_DWORD *)&v157[1];
  *(_DWORD *)(v2 + 312) = CAWBAFE::GetSceneBrightnessForLux(*(CAWBAFE **)(v2 + 16));
  CAWBAFE::SetRgbColorspace(*(void *)(v2 + 16), 1);
  unsigned __int16 v27 = v157[0];
  if (!*(_DWORD *)(v2 + 4924))
  {
    *(_WORD *)(v2 + 4992) = v157[0];
    *(_DWORD *)(v2 + 4994) = *(_DWORD *)&v157[1];
  }
  *(_WORD *)(v2 + 4998) = v27;
  int v153 = 0;
  uint64_t v154 = 0;
  uint64_t v155 = 0;
  if (CAWBAFE::GetFDAWBEnable(*(CAWBAFE **)(v2 + 16))
    && CAWBAFE::GetFDAWBVersion(*(CAWBAFE **)(v2 + 16)) == 1)
  {
    double v28 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"anstSkinMask"];
    BOOL v29 = v28 == 0;

    if (v29
      || ([*(id *)(v2 + 5072) objectForKeyedSubscript:@"anstSkinMask"],
          v30 = objc_claimAutoreleasedReturnValue(),
          BOOL v31 = [v30 length] == 49152,
          v30,
          !v31)
      && FigSignalErrorAt())
    {
      CAWBAFE::SetSemanticAWBEnable(*(CAWBAFE **)(v2 + 16), 0);
    }
    else
    {
      id v32 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"anstSkinMask"];
      uint64_t v155 = [v32 bytes];

      CAWBAFE::SetSemanticConfidenceMap(*(void *)(v2 + 16), (uint64_t)&v153);
      *(_OWORD *)(v2 + 4868) = 0u;
      *(_OWORD *)(v2 + 4884) = 0u;
      unsigned __int16 v33 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"FESOutputSize"];
      *(_DWORD *)(v2 + 4860) = *(double *)([v33 pointerValue] + 16);

      uint64_t v34 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"FESOutputSize"];
      *(_DWORD *)(v2 + 4864) = *(double *)([v34 pointerValue] + 24);
    }
  }
  double v35 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"skyMaskData"];
  BOOL v36 = v35 == 0;

  if (!v36)
  {
    int v37 = [*(id *)(v2 + 5096) objectForKeyedSubscript:*MEMORY[0x263F2EFB8]];
    id v38 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"skyMaskData"];
    uint64_t v39 = [v38 bytes];

    id v40 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"skyMaskSize"];
    double v41 = *(double *)([v40 pointerValue] + 16);

    uint64_t v42 = [*(id *)(v2 + 5072) objectForKeyedSubscript:@"skyMaskSize"];
    double v43 = *(double *)([v42 pointerValue] + 24);

    [(id)v2 _processSkyMask:v39 skyMaskWidth:(int)v41 skyMaskHeight:(int)v43 cropRectFromSourceDict:v37];
  }
  char v44 = 1;
  do
  {
    char v45 = v44;
    if (*(int *)(v2 + 4924) >= 1)
    {
      CAWBAFE::SetSensorClockFreq(*(CAWBAFE **)(v2 + 16), *(float *)(v2 + 4988));
      CAWBAFE::SetFlashStateForHistAWB(*(CAWBAFE **)(v2 + 16), 0, 0, 0, 0);
      CAWBAFE::SetFlashStateForHistAWB(*(CAWBAFE **)(v2 + 16), 1, *(_WORD *)(v2 + 4992), *(_WORD *)(v2 + 4994), *(_WORD *)(v2 + 4996));
    }
    (*(void (**)(void, uint64_t))(**(void **)(v2 + 16) + 32))(*(void *)(v2 + 16), v2 + 24);
    int v46 = *(_DWORD *)(v2 + 4924);
    if (v46 >= 1 && *(unsigned char *)(v2 + 4937))
    {
      uint64_t v47 = *(void *)(v2 + 16);
      float v48 = *(float *)(v2 + 4928);
      uint64_t v49 = *(unsigned int *)(v2 + 4932);
      long long v50 = *(_OWORD *)(v2 + 4952);
      v151[0] = *(_OWORD *)(v2 + 4936);
      v151[1] = v50;
      v151[2] = *(_OWORD *)(v2 + 4968);
      int v152 = *(_DWORD *)(v2 + 4984);
      (*(void (**)(uint64_t, uint64_t, _OWORD *, float, float))(*(void *)v47 + 128))(v47, v49, v151, (float)v46, v48);
    }
    (*(void (**)(void, void *, void))(**(void **)(v2 + 16) + 64))(*(void *)(v2 + 16), &-[AWBAlgorithm process]::pstAWBMetaData, 0);
    char v44 = 0;
  }
  while ((v45 & 1) != 0);
  if (byte_26AEB8E8C && *(unsigned char *)(v2 + 5000))
  {
    *(_DWORD *)(v2 + 5104) = [*(id *)(v2 + 5032) unsignedIntValue];
    *(_DWORD *)(v2 + 5108) = [*(id *)(v2 + 5040) unsignedIntValue];
    unsigned int v51 = [*(id *)(v2 + 5048) unsignedIntValue];
    *(_DWORD *)(v2 + 5112) = v51;
    unsigned int v52 = *(_DWORD *)(v2 + 5108);
    if (v52 <= v51) {
      unsigned int v52 = v51;
    }
    if (*(_DWORD *)(v2 + 5104) <= v52) {
      unsigned __int16 v53 = v52;
    }
    else {
      unsigned __int16 v53 = *(_DWORD *)(v2 + 5104);
    }
    *(_DWORD *)(v2 + 5116) = ([*(id *)(v2 + 5032) unsignedIntValue] << 12) / v53;
    *(_DWORD *)(v2 + 5120) = ([*(id *)(v2 + 5040) unsignedIntValue] << 12) / v53;
    *(_DWORD *)(v2 + 5124) = ([*(id *)(v2 + 5048) unsignedIntValue] << 12) / v53;
    *(_DWORD *)(v2 + 5128) = [*(id *)(v2 + 5008) unsignedIntValue];
    *(_DWORD *)(v2 + 5132) = [*(id *)(v2 + 5016) unsignedIntValue];
    int v54 = [*(id *)(v2 + 5024) unsignedIntValue];
  }
  else
  {
    if ([*(id *)(v2 + 5088) BOOLValue]) {
      v55 = (unsigned __int16 *)&word_26AEB8F18;
    }
    else {
      v55 = (unsigned __int16 *)&word_26AEB8B66;
    }
    *(_DWORD *)(v2 + 5104) = v55[4];
    *(_DWORD *)(v2 + 5108) = v55[5];
    *(_DWORD *)(v2 + 5112) = v55[7];
    *(_DWORD *)(v2 + 5116) = v55[8];
    *(_DWORD *)(v2 + 5120) = v55[9];
    *(_DWORD *)(v2 + 5124) = v55[11];
    *(_DWORD *)(v2 + 5128) = *v55;
    *(_DWORD *)(v2 + 5132) = v55[1];
    int v54 = v55[3];
  }
  *(_DWORD *)(v2 + 5136) = v54;
  uint64_t v56 = *(void *)(v2 + 5096);
  if (!v56 || byte_26AEB8E8C)
  {
    int v74 = 0;
    if (v56 && byte_26AEB8E8C)
    {
      v148 = [MEMORY[0x263EFF9A0] dictionary];
      if (v148)
      {
        v125 = [NSNumber numberWithBool:byte_26AEB8E8C];
        [v148 setObject:v125 forKeyedSubscript:@"UsePrevFrameWP"];

        unsigned int v126 = [*(id *)(v2 + 5096) objectForKeyedSubscript:*MEMORY[0x263F2F3F0]];
        [v148 setObject:v126 forKeyedSubscript:@"StrobeWhitePointCCM"];

        BOOL v127 = [*(id *)(v2 + 5096) objectForKeyedSubscript:@"AwbOutputMetadata"];
        LODWORD(v126) = v127 == 0;

        if (v126) {
          [*(id *)(v2 + 5096) setObject:v148 forKeyedSubscript:@"AwbOutputMetadata"];
        }
        v128 = [MEMORY[0x263EFF9A0] dictionary];
        if (v128)
        {
          v146 = [*(id *)(v2 + 5096) objectForKeyedSubscript:*MEMORY[0x263F2F308]];
          int v129 = [v146 intValue];
          uint64_t v130 = [*(id *)(v2 + 5096) objectForKeyedSubscript:*MEMORY[0x263F2F2C8]];
          int v131 = [v130 intValue];
          v132 = [*(id *)(v2 + 5096) objectForKeyedSubscript:*MEMORY[0x263F2F320]];
          int v133 = [v132 intValue];
          v134 = [*(id *)(v2 + 5096) objectForKeyedSubscript:*MEMORY[0x263F2F310]];
          int v135 = [v134 intValue];
          v136 = [*(id *)(v2 + 5096) objectForKeyedSubscript:*MEMORY[0x263F2F3D8]];
          int v137 = [v136 intValue];
          *(float *)&double v138 = (float)v129 * 0.00024414;
          *(float *)&double v139 = (float)v131 * 0.00024414;
          *(float *)&double v140 = (float)v133 * 0.00024414;
          *(float *)&double v141 = (float)v135 * 0.00024414;
          *(float *)&double v142 = (float)v137;
          int v143 = [(id)v2 calculateInternalAWBMetadataForMIWB:v128 bGain:v138 rSkinGain:v139 bSkinGain:v140 cct:v141 internalMetadata:v142];

          if (v143) {
            int v74 = FigSignalErrorAt();
          }
          else {
            int v74 = 0;
          }
          [*(id *)(v2 + 5096) setObject:v128 forKeyedSubscript:@"MIWBOutputMetadata"];
        }
        else
        {
          int v74 = FigSignalErrorAt();
        }
      }
      else
      {
        int v74 = FigSignalErrorAt();
      }
    }
  }
  else
  {
    uint64_t v57 = 0;
    v58 = (char *)&unk_26AEB8F3C;
    do
    {
      int v59 = [*(id *)(v2 + 5088) BOOLValue];
      float v60 = v58 - 227;
      if (v59) {
        float v60 = v58;
      }
      *(float *)&v161[v57] = (float)*(__int16 *)v60 * 0.00024414;
      *(float *)&v160[v57] = (float)*(__int16 *)(v58 - 209) * 0.00024414;
      v58 += 2;
      v57 += 4;
    }
    while (v57 != 36);
    v147 = [MEMORY[0x263EFF8F8] dataWithBytes:v161 length:36];
    v145 = [MEMORY[0x263EFF8F8] dataWithBytes:v160 length:36];
    [*(id *)(v2 + 5096) setObject:v147 forKeyedSubscript:*MEMORY[0x263F2F3F0]];
    float v61 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E8A];
    [*(id *)(v2 + 5096) setObject:v61 forKeyedSubscript:*MEMORY[0x263F2F330]];

    uint64_t v62 = [NSNumber numberWithUnsignedInt:dword_26AEB8E80];
    [*(id *)(v2 + 5096) setObject:v62 forKeyedSubscript:*MEMORY[0x263F2F3D8]];

    float v63 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v2 + 5128)];
    [*(id *)(v2 + 5096) setObject:v63 forKeyedSubscript:*MEMORY[0x263F2F2F8]];

    float v64 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v2 + 5132)];
    [*(id *)(v2 + 5096) setObject:v64 forKeyedSubscript:*MEMORY[0x263F2F2F0]];

    float v65 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v2 + 5136)];
    [*(id *)(v2 + 5096) setObject:v65 forKeyedSubscript:*MEMORY[0x263F2F2E8]];

    float v66 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v2 + 5128)];
    [*(id *)(v2 + 5096) setObject:v66 forKeyedSubscript:*MEMORY[0x263F2F308]];

    v67 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v2 + 5132)];
    [*(id *)(v2 + 5096) setObject:v67 forKeyedSubscript:*MEMORY[0x263F2F300]];

    float v68 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v2 + 5136)];
    [*(id *)(v2 + 5096) setObject:v68 forKeyedSubscript:*MEMORY[0x263F2F2C8]];

    float v69 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v2 + 5104)];
    [*(id *)(v2 + 5096) setObject:v69 forKeyedSubscript:*MEMORY[0x263F2F2E0]];

    int v70 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v2 + 5108)];
    [*(id *)(v2 + 5096) setObject:v70 forKeyedSubscript:*MEMORY[0x263F2F2D8]];

    v71 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v2 + 5112)];
    [*(id *)(v2 + 5096) setObject:v71 forKeyedSubscript:*MEMORY[0x263F2F2D0]];

    uint64_t v72 = [*(id *)(v2 + 5096) objectForKeyedSubscript:*MEMORY[0x263F2F4F0]];
    int v73 = [v72 BOOLValue];

    if (v73 && (int v74 = [(id)v2 _updateHRGainDownRatioMetadata]) != 0)
    {
    }
    else
    {
      float v75 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E41];
      [*(id *)(v2 + 5096) setObject:v75 forKeyedSubscript:*MEMORY[0x263F2F320]];

      v76 = [NSNumber numberWithUnsignedShort:((unsigned __int16)word_26AEB8E45 + (unsigned __int16)word_26AEB8E43) >> 1];
      [*(id *)(v2 + 5096) setObject:v76 forKeyedSubscript:*MEMORY[0x263F2F318]];

      id v77 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E47];
      [*(id *)(v2 + 5096) setObject:v77 forKeyedSubscript:*MEMORY[0x263F2F310]];

      float v78 = [NSNumber numberWithUnsignedInt:dword_26AEB8EC8];
      [*(id *)(v2 + 5096) setObject:v78 forKeyedSubscript:*MEMORY[0x263F2F328]];

      float v79 = [MEMORY[0x263EFF9A0] dictionary];
      if (v79)
      {
        LODWORD(v80) = dword_26AEB8E4C;
        uint64_t v81 = [NSNumber numberWithFloat:v80];
        [v79 setObject:v81 forKeyedSubscript:@"FlashProjMixWeighting"];

        float v82 = (void *)MEMORY[0x263EFF8C0];
        float v83 = [NSNumber numberWithInt:dword_26AEB8F5C];
        v84 = [NSNumber numberWithInt:dword_26AEB8F60];
        int v85 = [NSNumber numberWithUnsignedInt:dword_26AEB8F64];
        v86 = [NSNumber numberWithUnsignedInt:dword_26AEB8F68];
        uint64_t v87 = objc_msgSend(v82, "arrayWithObjects:", v83, v84, v85, v86, 0);
        [v79 setObject:v87 forKeyedSubscript:@"TileStatsRegionInRaw"];

        uint64_t v88 = [NSNumber numberWithUnsignedInt:dword_26AEB8EC8];
        [v79 setObject:v88 forKeyedSubscript:@"FdAWBChistMixFactor"];

        uint64_t v89 = (void *)MEMORY[0x263EFF8C0];
        int v90 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E41];
        v91 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E43];
        v92 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E45];
        CFDictionaryRef v93 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E47];
        v94 = objc_msgSend(v89, "arrayWithObjects:", v90, v91, v92, v93, 0);
        [v79 setObject:v94 forKeyedSubscript:@"AwbGainsSkinOnly"];

        v95 = (void *)MEMORY[0x263EFF8C0];
        id v96 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E50];
        id v97 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E52];
        id v98 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E54];
        id v99 = [NSNumber numberWithUnsignedShort:(unsigned __int16)word_26AEB8E56];
        char v100 = objc_msgSend(v95, "arrayWithObjects:", v96, v97, v98, v99, 0);
        [v79 setObject:v100 forKeyedSubscript:@"AwbGainsFlashProj"];

        int v101 = [NSNumber numberWithUnsignedInt:dword_26AEB8E3C];
        [v79 setObject:v101 forKeyedSubscript:@"AwbColorspace"];

        CGRect v102 = [NSNumber numberWithBool:byte_26AEB8E4A];
        [v79 setObject:v102 forKeyedSubscript:@"IsLEDMainFlashforAWB"];

        v103 = [MEMORY[0x263EFF9A0] dictionary];
        if (v103)
        {
          uint64_t v104 = [NSNumber numberWithBool:byte_26AEB8E8C];
          [v103 setObject:v104 forKeyedSubscript:@"UsePrevFrameWP"];

          [v103 setObject:v145 forKeyedSubscript:@"StrobeWhitePointCCM"];
          uint64_t v158 = 0;
          uint64_t v159 = 0;
          uint64_t v149 = 0;
          *(void *)v150 = 0;
          CAWBAFE::GetFaceAssistedAWBResultsForMatchProvidedSkinGains(*(CAWBAFE **)(v2 + 16), (float *)&v159, (float *)&v158, v150, &v150[1], (float *)&v149 + 1, (float *)&v149);
          LODWORD(v105) = v159;
          char v106 = [NSNumber numberWithFloat:v105];
          [v103 setObject:v106 forKeyedSubscript:@"wpRgLogRatio"];

          LODWORD(v107) = HIDWORD(v159);
          uint64_t v108 = [NSNumber numberWithFloat:v107];
          [v103 setObject:v108 forKeyedSubscript:@"wpBgLogRatio"];

          LODWORD(v109) = v158;
          char v110 = [NSNumber numberWithFloat:v109];
          [v103 setObject:v110 forKeyedSubscript:@"wpSkinRgLogRatio"];

          LODWORD(v111) = HIDWORD(v158);
          v112 = [NSNumber numberWithFloat:v111];
          [v103 setObject:v112 forKeyedSubscript:@"wpSkinBgLogRatio"];

          v113 = [NSNumber numberWithInt:v150[1]];
          [v103 setObject:v113 forKeyedSubscript:@"continuousFDTimes"];

          v114 = [NSNumber numberWithInt:v150[0]];
          [v103 setObject:v114 forKeyedSubscript:@"skinColorSampleNum"];

          LODWORD(v115) = HIDWORD(v149);
          v116 = [NSNumber numberWithFloat:v115];
          [v103 setObject:v116 forKeyedSubscript:@"skinColorSampleVariance"];

          LODWORD(v117) = v149;
          v118 = [NSNumber numberWithFloat:v117];
          [v103 setObject:v118 forKeyedSubscript:@"minDistSkinToWhiteMapping"];

          v119 = [MEMORY[0x263EFF9A0] dictionary];
          if (v119)
          {
            *(float *)&double v120 = (float)*(unsigned int *)(v2 + 5128) * 0.00024414;
            *(float *)&double v121 = (float)*(unsigned int *)(v2 + 5136) * 0.00024414;
            LOWORD(v122) = word_26AEB8E41;
            *(float *)&double v122 = (float)LODWORD(v122) * 0.00024414;
            LOWORD(v124) = word_26AEB8E47;
            *(float *)&double v123 = (float)LODWORD(v124) * 0.00024414;
            *(float *)&double v124 = (float)dword_26AEB8E80;
            if ([(id)v2 calculateInternalAWBMetadataForMIWB:v119 bGain:v120 rSkinGain:v121 bSkinGain:v122 cct:v123 internalMetadata:v124])int v74 = FigSignalErrorAt(); {
            else
            }
              int v74 = 0;
            [*(id *)(v2 + 5096) setObject:v79 forKeyedSubscript:@"SpatialCCMOutputMetadata"];
            [*(id *)(v2 + 5096) setObject:v103 forKeyedSubscript:@"AwbOutputMetadata"];
            [*(id *)(v2 + 5096) setObject:v119 forKeyedSubscript:@"MIWBOutputMetadata"];
          }
          else
          {
            int v74 = FigSignalErrorAt();
          }
        }
        else
        {
          int v74 = FigSignalErrorAt();
        }
      }
      else
      {
        int v74 = FigSignalErrorAt();
      }
    }
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  return v74;
}

- (int)_processSkyMask:(void *)a3 skyMaskWidth:(int)a4 skyMaskHeight:(int)a5 cropRectFromSourceDict:(id)a6
{
  CFDictionaryRef v10 = (const __CFDictionary *)a6;
  CFDictionaryRef v11 = v10;
  if (a3)
  {
    if (v10 && CGRectMakeWithDictionaryRepresentation(v10, &rect))
    {
      int v12 = (int)(rect.size.width * (double)a4);
      int v13 = (int)(rect.size.height * (double)a5);
      int v14 = (int)(rect.origin.y * (double)a5);
      int v15 = v13 * v12;
      if (v14 < v13)
      {
        unsigned int v16 = 0;
        int v17 = (int)(rect.origin.x * (double)a4);
        uint64_t v18 = v14;
        int v19 = (char *)a3 + v17 + v14 * (uint64_t)a4;
        do
        {
          uint64_t v20 = v12 - (uint64_t)v17;
          double v21 = (unsigned __int8 *)v19;
          if (v17 < v12)
          {
            do
            {
              unsigned int v22 = *v21++;
              if (v22 > 0x32) {
                ++v16;
              }
              --v20;
            }
            while (v20);
          }
          ++v18;
          v19 += a4;
        }
        while (v18 != v13);
        goto LABEL_20;
      }
    }
    else
    {
      int v15 = a5 * a4;
      if (a5 * a4 >= 1)
      {
        unsigned int v16 = 0;
        uint64_t v23 = (a5 * a4);
        do
        {
          unsigned int v24 = *(unsigned __int8 *)a3;
          a3 = (char *)a3 + 1;
          if (v24 > 0x32) {
            ++v16;
          }
          --v23;
        }
        while (v23);
        goto LABEL_20;
      }
    }
    unsigned int v16 = 0;
LABEL_20:
    int v25 = (float)((float)v16 / (float)v15) >= 0.005;
    goto LABEL_21;
  }
  int v25 = 2;
LABEL_21:
  int v28 = v25;
  CAWBAFE::setUnagiSkyDetected((uint64_t)self->_AWBAlgorithmObj, &v28);

  return 0;
}

- (int)_updateHRGainDownRatioMetadata
{
  uint64_t v3 = *MEMORY[0x263F2F2E0];
  int v4 = [(NSMutableDictionary *)self->_outputMetadata objectForKeyedSubscript:*MEMORY[0x263F2F2E0]];

  if (v4)
  {
    float32x2_t v5 = [(NSMutableDictionary *)self->_outputMetadata objectForKeyedSubscript:v3];
    unsigned int v6 = [v5 unsignedIntValue];

    uint64_t v7 = *MEMORY[0x263F2F2D8];
    uint32x2_t v8 = [(NSMutableDictionary *)self->_outputMetadata objectForKeyedSubscript:*MEMORY[0x263F2F2D8]];

    if (v8)
    {
      int32x2_t v9 = [(NSMutableDictionary *)self->_outputMetadata objectForKeyedSubscript:v7];
      unsigned __int32 v10 = [v9 unsignedIntValue];

      uint64_t v11 = *MEMORY[0x263F2F2D0];
      int v12 = [(NSMutableDictionary *)self->_outputMetadata objectForKeyedSubscript:*MEMORY[0x263F2F2D0]];

      if (v12)
      {
        int v13 = [(NSMutableDictionary *)self->_outputMetadata objectForKeyedSubscript:v11];
        unsigned int v14 = [v13 unsignedIntValue];

        if (v14 <= v6) {
          unsigned int v17 = v6;
        }
        else {
          unsigned int v17 = v14;
        }
        if (v10 > v17) {
          unsigned int v17 = v10;
        }
        if (v17 >= 0x1000)
        {
          v16.i32[0] = v6;
          int32x4_t v18 = v16;
          v18.i32[1] = v10;
          v18.i32[2] = v14;
          uint32x4_t v19 = (uint32x4_t)vaddq_s32(vdupq_n_s32(v17 >> 1), vshlq_n_s32(v18, 0xCuLL));
          v19.i32[0] /= v17;
          v19.i32[1] /= v17;
          v19.i32[2] /= v17;
          float32x4_t v20 = vcvtq_f32_u32(v19);
          float v21 = fmaxf(fmaxf(v20.f32[0], v20.f32[2]), v20.f32[1]) / fminf(fminf(v20.f32[0], v20.f32[2]), v20.f32[1]);
          if (v21 >= 1.0)
          {
            LODWORD(v15) = llroundf(v21 * 4096.0);
            unsigned int v22 = [NSNumber numberWithInt:v15];
            uint64_t v23 = *MEMORY[0x263F2F4F8];
            [(NSMutableDictionary *)self->_outputMetadata setObject:v22 forKeyedSubscript:*MEMORY[0x263F2F4F8]];

            unsigned int v24 = [(NSMutableDictionary *)self->_outputMetadata objectForKeyedSubscript:v23];

            if (v24) {
              return 0;
            }
          }
        }
      }
    }
  }
  return FigSignalErrorAt();
}

+ (int)getColorCalibrationsUsingIdealColorCalbrations:(id)a3 absoluteColorCalibrations:(id)a4 colorCalibrationsOut:(id *)a5 awbConfig:(id)a6
{
}

+ (int)calculateSTRBKeyFromWideCamera:(id *)a3 moduleConfig:(id)a4
{
}

+ (int)translateAWBGainsToSecondaryPortType:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 validRect:(id)a6 secondaryModuleConfig:(id)a7 secondaryCameraInfo:(id)a8 primaryRGain:(float)a9 primaryBGain:(float)a10 secondaryChannelID:(unsigned int)a11 secondaryRGain:(float *)a12 secondaryBGain:(float *)a13
{
}

+ (int)getInternalAWBMetadataForMIWB:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 validRect:(id)a6 secondaryModuleConfig:(id)a7 secondaryCameraInfo:(id)a8
{
  id v31 = a3;
  id v30 = a4;
  id v13 = a5;
  id v14 = a6;
  id v28 = a7;
  id v29 = a8;
  uint64_t v35 = 0;
  char v34 = 0;
  objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F308], 4096, &v34);
  if (v34)
  {
    objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C8], 4096, &v34);
    if (v34)
    {
      uint64_t v15 = *MEMORY[0x263F2F1D8];
      int32x4_t v16 = [v13 objectForKeyedSubscript:*MEMORY[0x263F2F1D8]];

      if (v16)
      {
        int32x4_t v18 = [v13 objectForKeyedSubscript:v15];
        uint32x4_t v19 = v18;
        if (v18)
        {
          float32x4_t v20 = [v18 objectForKeyedSubscript:*MEMORY[0x263F2F220]];
          float v21 = v20;
          if (v20)
          {
            char v33 = 0;
            int v22 = objc_msgSend(v20, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F320], 4096, &v33);
            char v32 = 0;
            int v23 = objc_msgSend(v21, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F310], 4096, &v32);
            if (v33)
            {
              if (v29 && v28 && v32)
              {
                *(float *)&double v24 = (float)v22;
                *(float *)&double v25 = (float)v23;
                LODWORD(v27) = 4;
                +[AWBAlgorithm translateAWBGainsToSecondaryPortType:v28 cameraInfo:v29 metadata:v13 validRect:v14 secondaryModuleConfig:v31 secondaryCameraInfo:v30 primaryRGain:v24 primaryBGain:v25 secondaryChannelID:v27 secondaryRGain:(char *)&v35 + 4 secondaryBGain:&v35];
              }
            }
          }
        }
      }
      LODWORD(v17) = HIDWORD(v35);
      if (*((float *)&v35 + 1) != 0.0
        || (*((float *)&v35 + 1) = (float)(int)objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F320], 4096, &v34, v17), v34))
      {
        LODWORD(v17) = v35;
        if (*(float *)&v35 != 0.0
          || (*(float *)&uint64_t v35 = (float)(int)objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F310], 4096, &v34, v17), v34))
        {
          objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F3D8], 6500, &v34);
          if (v34)
          {
            *(float *)&uint64_t v35 = *(float *)&v35 * 0.00024414;
            *((float *)&v35 + 1) = *((float *)&v35 + 1) * 0.00024414;
            operator new();
          }
        }
      }
    }
  }

  return 0;
}

- (void)dealloc
{
  AWBAlgorithmObuint64_t j = self->_AWBAlgorithmObj;
  if (AWBAlgorithmObj) {
    (*((void (**)(CAWBAFE *, SEL))AWBAlgorithmObj->var0 + 1))(AWBAlgorithmObj, a2);
  }
  self->_AWBAlgorithmObuint64_t j = 0;
  v4.receiver = self;
  v4.super_class = (Class)AWBAlgorithm;
  [(AWBAlgorithm *)&v4 dealloc];
}

- (NSDictionary)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
}

- (unsigned)numTilesX
{
  return self->_numTilesX;
}

- (unsigned)numTilesY
{
  return self->_numTilesY;
}

- (unsigned)winRegionWidth
{
  return self->_winRegionWidth;
}

- (void)setWinRegionWidth:(unsigned int)a3
{
  self->_winRegionWidth = a3;
}

- (unsigned)winRegionHeight
{
  return self->_winRegionHeight;
}

- (void)setWinRegionHeight:(unsigned int)a3
{
  self->_winRegionHeight = a3;
}

- (NSData)setFileData
{
  return self->_setFileData;
}

- (NSNumber)digitalFlash
{
  return self->_digitalFlash;
}

- ($938B03310D06493B2963E5A84CB75A7E)awbComboGains
{
  bGaiuint64_t n = self->_awbComboGains.bGain;
  uint64_t v3 = *(void *)&self->_awbComboGains.rGain;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = bGain;
  return result;
}

- ($938B03310D06493B2963E5A84CB75A7E)awbComboGainsNormalized
{
  bGaiuint64_t n = self->_awbComboGainsNormalized.bGain;
  uint64_t v3 = *(void *)&self->_awbComboGainsNormalized.rGain;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = bGain;
  return result;
}

- ($938B03310D06493B2963E5A84CB75A7E)awbGains
{
  bGaiuint64_t n = self->_awbGains.bGain;
  uint64_t v3 = *(void *)&self->_awbGains.rGain;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = bGain;
  return result;
}

- (NSMutableDictionary)outputMetadata
{
  return self->_outputMetadata;
}

- (void)setOutputMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputMetadata, 0);
  objc_storeStrong((id *)&self->_digitalFlash, 0);
  objc_storeStrong((id *)&self->_setFileData, 0);
  objc_storeStrong((id *)&self->_stats, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end