@interface DolbyVisionComposer
- (BOOL)bypassDisplayManagement;
- (BOOL)dovi_tm_configChanged:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7 tcCtrl:(ToneCurve_Control *)a8;
- (BOOL)hasAMVEConfigChanged:(id *)a3 tcCtrl:(ToneCurve_Control *)a4;
- (BOOL)hdr10_tm_configChanged:(_HDR10TMParam *)a3 HDRControl:(id *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6;
- (BOOL)hlg_tm_configChanged:(id *)a3 HDRControl:(id *)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7;
- (BOOL)preSubsampleLumaForMMR;
- (BOOL)yuvCombinedCompose;
- (DolbyVisionComposer)initWithDevice:(id)a3;
- (id)createNullShader;
- (id)createShaderWithName:(id)a3 dolby84:(BOOL)a4 forLLDovi:(BOOL)a5;
- (id)createShaderWithNameAndInputOutput:(id)a3 dolby84:(BOOL)a4 forLLDovi:(BOOL)a5 input:(int)a6 output:(int)a7;
- (id)getComputePipeLineStateForShader:(id)a3;
- (id)getComputePipeLineStateForShader:(id)a3 input:(int)a4 output:(int)a5;
- (int64_t)checkForContent:(unsigned int)a3 contentReturn1:(BOOL *)a4 contentReturn2:(BOOL *)a5 contentReturn3:(BOOL *)a6 forDisplay:(unsigned int)a7 displayReturn1:(BOOL *)a8 displayReturn2:(BOOL *)a9 displayReturn3:(BOOL *)a10 displayReturn4:(BOOL *)a11 displayReturn5:(BOOL *)a12;
- (int64_t)checkInputFormats:(unsigned int)a3 returnInput1:(BOOL *)a4 returnInput2:(BOOL *)a5 returnInput3:(BOOL *)a6 returnInput4:(BOOL *)a7 returnInput5:(BOOL *)a8 outputFormat:(unsigned int)a9 returnOutput1:(BOOL *)a10 returnOutput2:(BOOL *)a11 returnOutput3:(BOOL *)a12 returnOutput4:(BOOL *)a13;
- (int64_t)embeddedSetupEncoderForCommandBuffer:(id)a3 DMData:(id *)a4 dmConfig:(id)a5 isInput422:(BOOL)a6 hasThreeOutputPlane:(BOOL)a7 isSdrOnDolbyOrHDR10:(BOOL)a8 isHDR10OnHDR10TV:(BOOL)a9 isDolbyOnHDR10TV:(BOOL)a10 isHDR10OnDolby:(BOOL)a11 isHDR10OnPad:(BOOL)a12 isHLGOnPad:(BOOL)a13 isDoviOnPad:(BOOL)a14 isDoviOnLLDovi:(BOOL)a15 isHDR10OnLLDovi:(BOOL)a16 isHLGOnHDR10TV:(BOOL)a17 isHLGOnDolbyTV:(BOOL)a18 isHLGOnLLDovi:(BOOL)a19 isPtvMode:(BOOL)a20 orientation:(int)a21 isDolby84:(BOOL)a22 dovi50toHDR10TVMode:(unsigned int)a23 isDM4:(BOOL)a24 isGpuTmRefMode:(BOOL)a25;
- (int64_t)embeddedSetupEncoderForGpuMatchMsrCommandBuffer:(id)a3 DMData:(id *)a4 dmConfig:(id)a5 isInput422:(BOOL)a6 orientation:(int)a7 isDolby84:(BOOL)a8 dovi50toHDR10TVMode:(unsigned int)a9 isDM4:(BOOL)a10 dpcParam:(_DpcParam *)a11 tcControl:(ToneCurve_Control *)a12 hdrControl:(id *)a13 isHDR10Content:(BOOL)a14 isHLGContent:(BOOL)a15 isDOVIContent:(BOOL)a16;
- (int64_t)embeddedSetupToneMappingWithContent:(BOOL)a3 Output:(__IOSurface *)a4 DM:(id)a5 DMData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8 hdr10InfoFrame:(id *)a9 dmConfig:(id *)a10 hdr10OnPad:(BOOL)a11 useYUVScalingTable:(BOOL)a12;
- (int64_t)encodeDualLayerToCommandBuffer:(id)a3 BL:(__IOSurface *)a4 EL:(__IOSurface *)a5 Output:(__IOSurface *)a6 MetaData:(id *)a7 tcControl:(ToneCurve_Control *)a8;
- (int64_t)encodeSingleLayerToCommandBuffer:(id)a3 BL:(__IOSurface *)a4 Output:(__IOSurface *)a5 ComposerData:(id *)a6 DM:(id)a7 DMData:(id *)a8 tcControl:(ToneCurve_Control *)a9 hdrControl:(id *)a10 hdr10InfoFrame:(id *)a11;
- (int64_t)encodeToCommandBuffer:(id)a3 BL:(__IOSurface *)a4 EL:(__IOSurface *)a5 Output:(__IOSurface *)a6 ComposerData:(id *)a7 DM:(id)a8 DMData:(id *)a9 tcControl:(ToneCurve_Control *)a10 hdrControl:(id *)a11 hdr10InfoFrame:(id *)a12 frameNumber:(unint64_t)a13;
- (int64_t)setupInputTexturesWithBL:(__IOSurface *)a3 EL:(__IOSurface *)a4 Output:(__IOSurface *)a5 MetaData:(id *)a6;
- (int64_t)setupOutputTexturesWithBuffer:(__IOSurface *)a3 orientation:(int)a4 ptvMode:(BOOL)a5;
- (void)createHLG2LTable;
- (void)createL2PQTable;
- (void)createLUTFromDMConfig:(id *)a3 DM:(id)a4 TCControl:(ToneCurve_Control *)a5 HDRControl:(id *)a6;
- (void)createPQ2LTable;
- (void)createScalingTable_YUVTM;
- (void)dovi_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 TMParam:(_DoViTMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 HlgOOTFCombined:(BOOL)a9 HlgOOTFOnly:(BOOL)a10 IsDoVi84:(BOOL)a11 tcCtrl:(ToneCurve_Control *)a12;
- (void)dovi_dm4_updateInterleavedLUT;
- (void)dovi_tm_createLUTFromDMConfig:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 TMParam:(_DoViTMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 HlgOOTFCombined:(BOOL)a9 HlgOOTFOnly:(BOOL)a10 IsDoVi84:(BOOL)a11 tcCtrl:(ToneCurve_Control *)a12;
- (void)dovi_tm_reserveConfig:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7 tcCtrl:(ToneCurve_Control *)a8;
- (void)dovi_tm_updateLUT;
- (void)embeddedCreateKernels;
- (void)encodeComposeChromaToCommandBuffer:(id)a3 withMetaData:(id *)a4;
- (void)encodeComposeCombinedToCommandBuffer:(id)a3;
- (void)encodeComposeLumaToCommandBuffer:(id)a3;
- (void)encodeSubsampleLumaHorizontalToCommandBuffer:(id)a3;
- (void)encodeSubsampleLumaVerticalToCommandBuffer:(id)a3;
- (void)fillInScalingTable_YUVTM:(id *)a3 target_White:(float)a4 target_Black:(float)a5 source_White:(float)a6 source_Black:(float)a7 satBoost:(float)a8 scalingFactor:(BOOL)a9;
- (void)getTmLutInput:(unint64_t)a3 lutInput:(float *)a4;
- (void)getTmLutInput_C:(unint64_t)a3 lutInput:(float *)a4;
- (void)hdr10_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 TMParam:(_HDR10TMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8;
- (void)hdr10_tm_createLUTFromDMConfig:(id *)a3 TMParam:(_HDR10TMParam *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6 HDRControl:(id *)a7 DM:(id)a8;
- (void)hdr10_tm_reserveConfig:(_HDR10TMParam *)a3 HDRControl:(id *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6;
- (void)hdr10_tm_updateLUT;
- (void)hlg_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 TMParam:(_HLGTMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 TMMode:(int)a9;
- (void)hlg_tm_createLUTFromDMConfig:(id *)a3 DM:(id)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7 TMMode:(int)a8;
- (void)hlg_tm_reserveConfig:(id *)a3 HDRControl:(id *)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7;
- (void)hlg_tm_updateLUT;
- (void)initBuffers;
- (void)initDMConfigCache;
- (void)setBypassDisplayManagement:(BOOL)a3;
- (void)setPreSubsampleLumaForMMR:(BOOL)a3;
- (void)setYuvCombinedCompose:(BOOL)a3;
- (void)setupComposerKernelConfiguration:(id *)a3 fromMetaData:(id *)a4;
- (void)setupInputBuffersWithMetadata:(id *)a3;
- (void)setupMetal;
- (void)updateAMVEConfig:(id *)a3 tcCtrl:(ToneCurve_Control *)a4;
@end

@implementation DolbyVisionComposer

- (DolbyVisionComposer)initWithDevice:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DolbyVisionComposer;
  v6 = [(DolbyVisionComposer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    p_iosurface_ReadOnlyTextureAlignmentBytes = &v6->_iosurface_ReadOnlyTextureAlignmentBytes;
    objc_storeStrong((id *)&v6->_device, a3);
    *(_WORD *)&v7->_yuvCombinedCompose = 0;
    v7->_bypassDisplayManagement = 0;
    [(DolbyVisionComposer *)v7 setupMetal];
    [(DolbyVisionComposer *)v7 initBuffers];
    [(DolbyVisionComposer *)v7 createPQ2LTable];
    [(DolbyVisionComposer *)v7 createL2PQTable];
    [(DolbyVisionComposer *)v7 createHLG2LTable];
    [(DolbyVisionComposer *)v7 createScalingTable_YUVTM];
    [(DolbyVisionComposer *)v7 initDMConfigCache];
    [(DolbyVisionComposer *)v7 embeddedCreateKernels];
    unint64_t *p_iosurface_ReadOnlyTextureAlignmentBytes = [(MTLDeviceSPI *)v7->_device iosurfaceReadOnlyTextureAlignmentBytes];
  }

  return v7;
}

- (void)initDMConfigCache
{
  self->_prev.tm.var0.dovi.slope = -12346.0;
}

- (void)setupMetal
{
  id v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HDRProcessing"];
  v3 = [v7 pathForResource:@"default.metallib" ofType:0];
  device = self->_device;
  if (v3) {
    id v5 = (MTLLibrary *)[(MTLDeviceSPI *)device newLibraryWithFile:v3 error:0];
  }
  else {
    id v5 = (MTLLibrary *)[(MTLDeviceSPI *)device newDefaultLibrary];
  }
  defaultLibrary = self->_defaultLibrary;
  self->_defaultLibrary = v5;
}

- (id)createShaderWithName:(id)a3 dolby84:(BOOL)a4 forLLDovi:(BOOL)a5
{
  id v5 = +[ComposerShader createShaderWithName:a3 dolby84:a4 forLLDovi:a5];
  return v5;
}

- (id)createShaderWithNameAndInputOutput:(id)a3 dolby84:(BOOL)a4 forLLDovi:(BOOL)a5 input:(int)a6 output:(int)a7
{
  id v7 = +[ComposerShader createShaderWithNameAndInputOutput:a3 dolby84:a4 forLLDovi:a5 input:*(void *)&a6 output:*(void *)&a7];
  return v7;
}

- (id)createNullShader
{
  return +[ComposerShader createShaderWithName:@"NULL" dolby84:0 forLLDovi:0];
}

- (id)getComputePipeLineStateForShader:(id)a3
{
  v3 = [a3 getComputePipeLineStateForDevice:self->_device Library:self->_defaultLibrary];
  return v3;
}

- (id)getComputePipeLineStateForShader:(id)a3 input:(int)a4 output:(int)a5
{
  id v5 = [a3 getComputePipeLineStateForDevice:self->_device Library:self->_defaultLibrary input:*(void *)&a4 output:*(void *)&a5];
  return v5;
}

- (void)embeddedCreateKernels
{
  v3 = [(DolbyVisionComposer *)self createShaderWithName:@"composeLuma" dolby84:0 forLLDovi:0];
  composeLumaKernel = self->_composeLumaKernel;
  self->_composeLumaKernel = v3;

  id v5 = [(DolbyVisionComposer *)self createShaderWithName:@"composeChroma" dolby84:0 forLLDovi:0];
  composeChromaKernel = self->_composeChromaKernel;
  self->_composeChromaKernel = v5;

  id v7 = [(DolbyVisionComposer *)self createShaderWithName:@"composeYUV" dolby84:0 forLLDovi:0];
  composeYUVKernel = self->_composeYUVKernel;
  self->_composeYUVKernel = v7;

  if (self->_dumpPolynomialResult)
  {
    v9 = [(DolbyVisionComposer *)self createShaderWithName:@"compose_and_dm_singlelayer_with_dump" dolby84:0 forLLDovi:0];
    objc_super v10 = self->_singleLayerIntegratedKernel[0];
    self->_singleLayerIntegratedKernel[0] = v9;
  }
  else
  {
    v11 = [(DolbyVisionComposer *)self createShaderWithName:@"compose_and_dm_singlelayer" dolby84:0 forLLDovi:0];
    v12 = self->_singleLayerIntegratedKernel[0];
    self->_singleLayerIntegratedKernel[0] = v11;

    v13 = [(DolbyVisionComposer *)self createShaderWithName:@"compose_and_dm_singlelayer" dolby84:1 forLLDovi:0];
    v14 = self->_singleLayerIntegratedKernel[1];
    self->_singleLayerIntegratedKernel[1] = v13;

    v15 = [(DolbyVisionComposer *)self createShaderWithName:@"compose_and_dm_singlelayer_hdr2sdr" dolby84:0 forLLDovi:1];
    v16 = self->_singleLayerIntegratedKernel[2];
    self->_singleLayerIntegratedKernel[2] = v15;

    v17 = [(DolbyVisionComposer *)self createShaderWithName:@"compose_and_dm_singlelayer_hdr2sdr" dolby84:1 forLLDovi:1];
    objc_super v10 = self->_singleLayerIntegratedKernel[3];
    self->_singleLayerIntegratedKernel[3] = v17;
  }

  v18 = [(DolbyVisionComposer *)self createShaderWithName:@"compose_and_dm_singlelayer_ipt" dolby84:0 forLLDovi:0];
  v19 = self->_singleLayerIntegratedIPTKernel[0];
  self->_singleLayerIntegratedIPTKernel[0] = v18;

  v20 = [(DolbyVisionComposer *)self createShaderWithName:@"compose_and_dm_singlelayer_ipt" dolby84:1 forLLDovi:0];
  v21 = self->_singleLayerIntegratedIPTKernel[1];
  self->_singleLayerIntegratedIPTKernel[1] = v20;

  v22 = [(DolbyVisionComposer *)self createShaderWithName:@"compose_and_dm_singlelayer_ipt2sdr" dolby84:0 forLLDovi:1];
  v23 = self->_singleLayerIntegratedIPTKernel[2];
  self->_singleLayerIntegratedIPTKernel[2] = v22;

  v24 = [(DolbyVisionComposer *)self createNullShader];
  v25 = self->_singleLayerIntegratedIPTKernel[3];
  self->_singleLayerIntegratedIPTKernel[3] = v24;

  v26 = [(DolbyVisionComposer *)self createShaderWithName:@"compose_and_dm_singlelayer_ipt_msr" dolby84:0 forLLDovi:0];
  singleLayerIntegratedIPTKernelMsr = self->_singleLayerIntegratedIPTKernelMsr;
  self->_singleLayerIntegratedIPTKernelMsr = v26;

  v28 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrd2RGBPlane" dolby84:0 forLLDovi:0];
  v29 = self->_singleLayerIntegratedKernelPlanar[0];
  self->_singleLayerIntegratedKernelPlanar[0] = v28;

  v30 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrd2RGBPlane" dolby84:1 forLLDovi:0];
  v31 = self->_singleLayerIntegratedKernelPlanar[1];
  self->_singleLayerIntegratedKernelPlanar[1] = v30;

  v32 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrd2RGBPlane" dolby84:0 forLLDovi:1];
  v33 = self->_singleLayerIntegratedKernelPlanar[2];
  self->_singleLayerIntegratedKernelPlanar[2] = v32;

  v34 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrd2RGBPlane" dolby84:1 forLLDovi:1];
  v35 = self->_singleLayerIntegratedKernelPlanar[3];
  self->_singleLayerIntegratedKernelPlanar[3] = v34;

  v36 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrd2RGBPlane_ipt" dolby84:0 forLLDovi:0];
  v37 = self->_singleLayerIntegratedIPTKernelPlanar[0];
  self->_singleLayerIntegratedIPTKernelPlanar[0] = v36;

  v38 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrd2RGBPlane_ipt" dolby84:1 forLLDovi:0];
  v39 = self->_singleLayerIntegratedIPTKernelPlanar[1];
  self->_singleLayerIntegratedIPTKernelPlanar[1] = v38;

  v40 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrd2RGBPlane_ipt" dolby84:0 forLLDovi:1];
  v41 = self->_singleLayerIntegratedIPTKernelPlanar[2];
  self->_singleLayerIntegratedIPTKernelPlanar[2] = v40;

  v42 = [(DolbyVisionComposer *)self createNullShader];
  v43 = self->_singleLayerIntegratedIPTKernelPlanar[3];
  self->_singleLayerIntegratedIPTKernelPlanar[3] = v42;

  v44 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane" dolby84:0 forLLDovi:0];
  v45 = self->_singleLayerIntegratedKernelPackedPlanar[0];
  self->_singleLayerIntegratedKernelPackedPlanar[0] = v44;

  v46 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane" dolby84:1 forLLDovi:0];
  v47 = self->_singleLayerIntegratedKernelPackedPlanar[1];
  self->_singleLayerIntegratedKernelPackedPlanar[1] = v46;

  v48 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane" dolby84:0 forLLDovi:1];
  v49 = self->_singleLayerIntegratedKernelPackedPlanar[2];
  self->_singleLayerIntegratedKernelPackedPlanar[2] = v48;

  v50 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane" dolby84:1 forLLDovi:1];
  v51 = self->_singleLayerIntegratedKernelPackedPlanar[3];
  self->_singleLayerIntegratedKernelPackedPlanar[3] = v50;

  v52 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_flip" dolby84:0 forLLDovi:0];
  v53 = self->_singleLayerIntegratedKernelPackedPlanar_flip[0];
  self->_singleLayerIntegratedKernelPackedPlanar_flip[0] = v52;

  v54 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_flip" dolby84:1 forLLDovi:0];
  v55 = self->_singleLayerIntegratedKernelPackedPlanar_flip[1];
  self->_singleLayerIntegratedKernelPackedPlanar_flip[1] = v54;

  v56 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_flip" dolby84:0 forLLDovi:1];
  v57 = self->_singleLayerIntegratedKernelPackedPlanar_flip[2];
  self->_singleLayerIntegratedKernelPackedPlanar_flip[2] = v56;

  v58 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_flip" dolby84:1 forLLDovi:1];
  v59 = self->_singleLayerIntegratedKernelPackedPlanar_flip[3];
  self->_singleLayerIntegratedKernelPackedPlanar_flip[3] = v58;

  v60 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_rotate" dolby84:0 forLLDovi:0];
  v61 = self->_singleLayerIntegratedKernelPackedPlanar_rotate[0];
  self->_singleLayerIntegratedKernelPackedPlanar_rotate[0] = v60;

  v62 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_rotate" dolby84:1 forLLDovi:0];
  v63 = self->_singleLayerIntegratedKernelPackedPlanar_rotate[1];
  self->_singleLayerIntegratedKernelPackedPlanar_rotate[1] = v62;

  v64 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_rotate" dolby84:0 forLLDovi:1];
  v65 = self->_singleLayerIntegratedKernelPackedPlanar_rotate[2];
  self->_singleLayerIntegratedKernelPackedPlanar_rotate[2] = v64;

  v66 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_rotate" dolby84:1 forLLDovi:1];
  v67 = self->_singleLayerIntegratedKernelPackedPlanar_rotate[3];
  self->_singleLayerIntegratedKernelPackedPlanar_rotate[3] = v66;

  v68 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_msr" dolby84:0 forLLDovi:0];
  v69 = self->_singleLayerIntegratedKernelPackedPlanar_msr[0];
  self->_singleLayerIntegratedKernelPackedPlanar_msr[0] = v68;

  v70 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_msr" dolby84:1 forLLDovi:0];
  v71 = self->_singleLayerIntegratedKernelPackedPlanar_msr[1];
  self->_singleLayerIntegratedKernelPackedPlanar_msr[1] = v70;

  v72 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_msr" dolby84:0 forLLDovi:1];
  v73 = self->_singleLayerIntegratedKernelPackedPlanar_msr[2];
  self->_singleLayerIntegratedKernelPackedPlanar_msr[2] = v72;

  v74 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_msr" dolby84:1 forLLDovi:1];
  v75 = self->_singleLayerIntegratedKernelPackedPlanar_msr[3];
  self->_singleLayerIntegratedKernelPackedPlanar_msr[3] = v74;

  v76 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane" dolby84:0 forLLDovi:0];
  v77 = self->_singleLayerIntegratedKernelPackedPlanarDM4[0];
  self->_singleLayerIntegratedKernelPackedPlanarDM4[0] = v76;

  v78 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane" dolby84:1 forLLDovi:0];
  v79 = self->_singleLayerIntegratedKernelPackedPlanarDM4[1];
  self->_singleLayerIntegratedKernelPackedPlanarDM4[1] = v78;

  v80 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlaneDM4llDovi" dolby84:0 forLLDovi:1];
  v81 = self->_singleLayerIntegratedKernelPackedPlanarDM4[2];
  self->_singleLayerIntegratedKernelPackedPlanarDM4[2] = v80;

  v82 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlaneDM4llDovi" dolby84:1 forLLDovi:1];
  v83 = self->_singleLayerIntegratedKernelPackedPlanarDM4[3];
  self->_singleLayerIntegratedKernelPackedPlanarDM4[3] = v82;

  v84 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_flip" dolby84:0 forLLDovi:0];
  v85 = self->_singleLayerIntegratedKernelPackedPlanarDM4_flip[0];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_flip[0] = v84;

  v86 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_flip" dolby84:1 forLLDovi:0];
  v87 = self->_singleLayerIntegratedKernelPackedPlanarDM4_flip[1];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_flip[1] = v86;

  v88 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlaneDM4llDovi_flip" dolby84:0 forLLDovi:1];
  v89 = self->_singleLayerIntegratedKernelPackedPlanarDM4_flip[2];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_flip[2] = v88;

  v90 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlaneDM4llDovi_flip" dolby84:1 forLLDovi:1];
  v91 = self->_singleLayerIntegratedKernelPackedPlanarDM4_flip[3];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_flip[3] = v90;

  v92 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_rotate" dolby84:0 forLLDovi:0];
  v93 = self->_singleLayerIntegratedKernelPackedPlanarDM4_rotate[0];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_rotate[0] = v92;

  v94 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_rotate" dolby84:1 forLLDovi:0];
  v95 = self->_singleLayerIntegratedKernelPackedPlanarDM4_rotate[1];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_rotate[1] = v94;

  v96 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlaneDM4llDovi_rotate" dolby84:0 forLLDovi:1];
  v97 = self->_singleLayerIntegratedKernelPackedPlanarDM4_rotate[2];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_rotate[2] = v96;

  v98 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlaneDM4llDovi_rotate" dolby84:1 forLLDovi:1];
  v99 = self->_singleLayerIntegratedKernelPackedPlanarDM4_rotate[3];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_rotate[3] = v98;

  v100 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_msr" dolby84:0 forLLDovi:0];
  v101 = self->_singleLayerIntegratedKernelPackedPlanarDM4_msr[0];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_msr[0] = v100;

  v102 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_msr" dolby84:1 forLLDovi:0];
  v103 = self->_singleLayerIntegratedKernelPackedPlanarDM4_msr[1];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_msr[1] = v102;

  v104 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlaneDM4msr" dolby84:0 forLLDovi:1];
  v105 = self->_singleLayerIntegratedKernelPackedPlanarDM4_msr[2];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_msr[2] = v104;

  v106 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlaneDM4msr" dolby84:1 forLLDovi:1];
  v107 = self->_singleLayerIntegratedKernelPackedPlanarDM4_msr[3];
  self->_singleLayerIntegratedKernelPackedPlanarDM4_msr[3] = v106;

  v108 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_ipt" dolby84:0 forLLDovi:0];
  v109 = self->_singleLayerIntegratedIPTKernelPackedPlanar[0];
  self->_singleLayerIntegratedIPTKernelPackedPlanar[0] = v108;

  v110 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_ipt" dolby84:1 forLLDovi:0];
  v111 = self->_singleLayerIntegratedIPTKernelPackedPlanar[1];
  self->_singleLayerIntegratedIPTKernelPackedPlanar[1] = v110;

  v112 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_ipt" dolby84:0 forLLDovi:1];
  v113 = self->_singleLayerIntegratedIPTKernelPackedPlanar[2];
  self->_singleLayerIntegratedIPTKernelPackedPlanar[2] = v112;

  v114 = [(DolbyVisionComposer *)self createNullShader];
  v115 = self->_singleLayerIntegratedIPTKernelPackedPlanar[3];
  self->_singleLayerIntegratedIPTKernelPackedPlanar[3] = v114;

  v116 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_ipt_msr" dolby84:0 forLLDovi:0];
  singleLayerIntegratedIPTKernelPackedPlanar_msr = self->_singleLayerIntegratedIPTKernelPackedPlanar_msr;
  self->_singleLayerIntegratedIPTKernelPackedPlanar_msr = v116;

  v118 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby" dolby84:0 forLLDovi:0];
  v119 = self->_yuvP422PackedPlanar[0];
  self->_yuvP422PackedPlanar[0] = v118;

  v120 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby" dolby84:1 forLLDovi:0];
  v121 = self->_yuvP422PackedPlanar[1];
  self->_yuvP422PackedPlanar[1] = v120;

  v122 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby" dolby84:0 forLLDovi:1];
  v123 = self->_yuvP422PackedPlanar[2];
  self->_yuvP422PackedPlanar[2] = v122;

  v124 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby" dolby84:1 forLLDovi:1];
  v125 = self->_yuvP422PackedPlanar[3];
  self->_yuvP422PackedPlanar[3] = v124;

  v126 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_flip" dolby84:0 forLLDovi:0];
  v127 = self->_yuvP422PackedPlanar_flip[0];
  self->_yuvP422PackedPlanar_flip[0] = v126;

  v128 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_flip" dolby84:1 forLLDovi:0];
  v129 = self->_yuvP422PackedPlanar_flip[1];
  self->_yuvP422PackedPlanar_flip[1] = v128;

  v130 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_flip" dolby84:0 forLLDovi:1];
  v131 = self->_yuvP422PackedPlanar_flip[2];
  self->_yuvP422PackedPlanar_flip[2] = v130;

  v132 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_flip" dolby84:1 forLLDovi:1];
  v133 = self->_yuvP422PackedPlanar_flip[3];
  self->_yuvP422PackedPlanar_flip[3] = v132;

  v134 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_rotate" dolby84:0 forLLDovi:0];
  v135 = self->_yuvP422PackedPlanar_rotate[0];
  self->_yuvP422PackedPlanar_rotate[0] = v134;

  v136 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_rotate" dolby84:1 forLLDovi:0];
  v137 = self->_yuvP422PackedPlanar_rotate[1];
  self->_yuvP422PackedPlanar_rotate[1] = v136;

  v138 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_rotate" dolby84:0 forLLDovi:1];
  v139 = self->_yuvP422PackedPlanar_rotate[2];
  self->_yuvP422PackedPlanar_rotate[2] = v138;

  v140 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_rotate" dolby84:1 forLLDovi:1];
  v141 = self->_yuvP422PackedPlanar_rotate[3];
  self->_yuvP422PackedPlanar_rotate[3] = v140;

  v142 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_msr" dolby84:0 forLLDovi:0];
  v143 = self->_yuvP422PackedPlanar_msr[0];
  self->_yuvP422PackedPlanar_msr[0] = v142;

  v144 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_msr" dolby84:1 forLLDovi:0];
  v145 = self->_yuvP422PackedPlanar_msr[1];
  self->_yuvP422PackedPlanar_msr[1] = v144;

  v146 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_msr" dolby84:0 forLLDovi:1];
  v147 = self->_yuvP422PackedPlanar_msr[2];
  self->_yuvP422PackedPlanar_msr[2] = v146;

  v148 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_msr" dolby84:1 forLLDovi:1];
  v149 = self->_yuvP422PackedPlanar_msr[3];
  self->_yuvP422PackedPlanar_msr[3] = v148;

  v150 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby" dolby84:0 forLLDovi:0];
  v151 = self->_yuvP422PackedPlanarDM4[0];
  self->_yuvP422PackedPlanarDM4[0] = v150;

  v152 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby" dolby84:1 forLLDovi:0];
  v153 = self->_yuvP422PackedPlanarDM4[1];
  self->_yuvP422PackedPlanarDM4[1] = v152;

  v154 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_dm4_llDovi" dolby84:0 forLLDovi:1];
  v155 = self->_yuvP422PackedPlanarDM4[2];
  self->_yuvP422PackedPlanarDM4[2] = v154;

  v156 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_dm4_llDovi" dolby84:1 forLLDovi:1];
  v157 = self->_yuvP422PackedPlanarDM4[3];
  self->_yuvP422PackedPlanarDM4[3] = v156;

  v158 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_flip" dolby84:0 forLLDovi:0];
  v159 = self->_yuvP422PackedPlanarDM4_flip[0];
  self->_yuvP422PackedPlanarDM4_flip[0] = v158;

  v160 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_flip" dolby84:1 forLLDovi:0];
  v161 = self->_yuvP422PackedPlanarDM4_flip[1];
  self->_yuvP422PackedPlanarDM4_flip[1] = v160;

  v162 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_dm4_llDovi_flip" dolby84:0 forLLDovi:1];
  v163 = self->_yuvP422PackedPlanarDM4_flip[2];
  self->_yuvP422PackedPlanarDM4_flip[2] = v162;

  v164 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_dm4_llDovi_flip" dolby84:1 forLLDovi:1];
  v165 = self->_yuvP422PackedPlanarDM4_flip[3];
  self->_yuvP422PackedPlanarDM4_flip[3] = v164;

  v166 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_rotate" dolby84:0 forLLDovi:0];
  v167 = self->_yuvP422PackedPlanarDM4_rotate[0];
  self->_yuvP422PackedPlanarDM4_rotate[0] = v166;

  v168 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_rotate" dolby84:1 forLLDovi:0];
  v169 = self->_yuvP422PackedPlanarDM4_rotate[1];
  self->_yuvP422PackedPlanarDM4_rotate[1] = v168;

  v170 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_dm4_llDovi_rotate" dolby84:0 forLLDovi:1];
  v171 = self->_yuvP422PackedPlanarDM4_rotate[2];
  self->_yuvP422PackedPlanarDM4_rotate[2] = v170;

  v172 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_dm4_llDovi_rotate" dolby84:1 forLLDovi:1];
  v173 = self->_yuvP422PackedPlanarDM4_rotate[3];
  self->_yuvP422PackedPlanarDM4_rotate[3] = v172;

  v174 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby" dolby84:0 forLLDovi:0];
  v175 = self->_yuvP422PackedPlanarDM4_msr[0];
  self->_yuvP422PackedPlanarDM4_msr[0] = v174;

  v176 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby" dolby84:1 forLLDovi:0];
  v177 = self->_yuvP422PackedPlanarDM4_msr[1];
  self->_yuvP422PackedPlanarDM4_msr[1] = v176;

  v178 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_dm4_msr" dolby84:0 forLLDovi:1];
  v179 = self->_yuvP422PackedPlanarDM4_msr[2];
  self->_yuvP422PackedPlanarDM4_msr[2] = v178;

  v180 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby_dm4_msr" dolby84:1 forLLDovi:1];
  v181 = self->_yuvP422PackedPlanarDM4_msr[3];
  self->_yuvP422PackedPlanarDM4_msr[3] = v180;

  v182 = [(DolbyVisionComposer *)self createShaderWithName:@"packedipt422_rgbplane_dolby" dolby84:0 forLLDovi:0];
  v183 = self->_iptP422PackedPlanar[0];
  self->_iptP422PackedPlanar[0] = v182;

  v184 = [(DolbyVisionComposer *)self createShaderWithName:@"packedipt422_rgbplane_dolby" dolby84:1 forLLDovi:0];
  v185 = self->_iptP422PackedPlanar[1];
  self->_iptP422PackedPlanar[1] = v184;

  v186 = [(DolbyVisionComposer *)self createShaderWithName:@"packedipt422_rgbplane_dolby" dolby84:0 forLLDovi:1];
  v187 = self->_iptP422PackedPlanar[2];
  self->_iptP422PackedPlanar[2] = v186;

  v188 = [(DolbyVisionComposer *)self createNullShader];
  v189 = self->_iptP422PackedPlanar[3];
  self->_iptP422PackedPlanar[3] = v188;

  v190 = [(DolbyVisionComposer *)self createShaderWithName:@"packedipt422_rgbplane_dolby_msr" dolby84:0 forLLDovi:0];
  iptP422PackedPlanar_msr = self->_iptP422PackedPlanar_msr;
  self->_iptP422PackedPlanar_msr = v190;

  v192 = [(DolbyVisionComposer *)self createShaderWithName:@"hdr10_packed420_cif10" dolby84:0 forLLDovi:0];
  v193 = self->_packedHDR10Cif10[0];
  self->_packedHDR10Cif10[0] = v192;

  v194 = [(DolbyVisionComposer *)self createShaderWithName:@"hdr10_packed420_cif10" dolby84:1 forLLDovi:0];
  v195 = self->_packedHDR10Cif10[1];
  self->_packedHDR10Cif10[1] = v194;

  v196 = [(DolbyVisionComposer *)self createShaderWithName:@"hdr10_packed420_cif10_hdr2sdr" dolby84:0 forLLDovi:1];
  v197 = self->_packedHDR10Cif10[2];
  self->_packedHDR10Cif10[2] = v196;

  v198 = [(DolbyVisionComposer *)self createNullShader];
  v199 = self->_packedHDR10Cif10[3];
  self->_packedHDR10Cif10[3] = v198;

  v200 = [(DolbyVisionComposer *)self createShaderWithName:@"hdr10_packed422_cif10" dolby84:0 forLLDovi:0];
  v201 = self->_packed422HDR10Cif10[0];
  self->_packed422HDR10Cif10[0] = v200;

  v202 = [(DolbyVisionComposer *)self createShaderWithName:@"hdr10_packed422_cif10" dolby84:1 forLLDovi:0];
  v203 = self->_packed422HDR10Cif10[1];
  self->_packed422HDR10Cif10[1] = v202;

  v204 = [(DolbyVisionComposer *)self createShaderWithName:@"hdr10_packed422_cif10_hdr2sdr" dolby84:0 forLLDovi:1];
  v205 = self->_packed422HDR10Cif10[2];
  self->_packed422HDR10Cif10[2] = v204;

  v206 = [(DolbyVisionComposer *)self createNullShader];
  v207 = self->_packed422HDR10Cif10[3];
  self->_packed422HDR10Cif10[3] = v206;

  v208 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_cif10_hlg" dolby84:0 forLLDovi:0];
  v209 = self->_packedHLGCif10[0];
  self->_packedHLGCif10[0] = v208;

  v210 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_cif10_hlg" dolby84:1 forLLDovi:0];
  v211 = self->_packedHLGCif10[1];
  self->_packedHLGCif10[1] = v210;

  v212 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_cif10_hlg2sdr" dolby84:0 forLLDovi:1];
  v213 = self->_packedHLGCif10[2];
  self->_packedHLGCif10[2] = v212;

  v214 = [(DolbyVisionComposer *)self createNullShader];
  v215 = self->_packedHLGCif10[3];
  self->_packedHLGCif10[3] = v214;

  v216 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_cif10_hlg" dolby84:0 forLLDovi:0];
  v217 = self->_packed422HLGCif10[0];
  self->_packed422HLGCif10[0] = v216;

  v218 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_cif10_hlg" dolby84:1 forLLDovi:0];
  v219 = self->_packed422HLGCif10[1];
  self->_packed422HLGCif10[1] = v218;

  v220 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_cif10_hlg2sdr" dolby84:0 forLLDovi:1];
  v221 = self->_packed422HLGCif10[2];
  self->_packed422HLGCif10[2] = v220;

  v222 = [(DolbyVisionComposer *)self createNullShader];
  v223 = self->_packed422HLGCif10[3];
  self->_packed422HLGCif10[3] = v222;

  v224 = [(DolbyVisionComposer *)self createShaderWithName:@"y416_hlg" dolby84:0 forLLDovi:0];
  y416HLGw30r = self->_y416HLGw30r;
  self->_y416HLGw30r = v224;

  v226 = [(DolbyVisionComposer *)self createShaderWithName:@"RGhA_hlg" dolby84:0 forLLDovi:0];
  RGhAHLGw30r = self->_RGhAHLGw30r;
  self->_RGhAHLGw30r = v226;

  v228 = [(DolbyVisionComposer *)self createShaderWithName:@"hdr10_y416_w30r" dolby84:0 forLLDovi:0];
  y416HDR10w30r = self->_y416HDR10w30r;
  self->_y416HDR10w30r = v228;

  v230 = [(DolbyVisionComposer *)self createShaderWithName:@"hdr10_x444_w30r" dolby84:0 forLLDovi:0];
  x444HDR10w30r = self->_x444HDR10w30r;
  self->_x444HDR10w30r = v230;

  v232 = [(DolbyVisionComposer *)self createShaderWithName:@"hdr10_RGhA_w30r" dolby84:0 forLLDovi:0];
  RGhAHDR10w30r = self->_RGhAHDR10w30r;
  self->_RGhAHDR10w30r = v232;

  v234 = [(DolbyVisionComposer *)self createShaderWithName:@"horizontal_half_luma" dolby84:0 forLLDovi:0];
  horizontalHalfLumaKernel = self->_horizontalHalfLumaKernel;
  self->_horizontalHalfLumaKernel = v234;

  v236 = [(DolbyVisionComposer *)self createShaderWithName:@"vertical_half_luma" dolby84:0 forLLDovi:0];
  verticalHalfLumaKernel = self->_verticalHalfLumaKernel;
  self->_verticalHalfLumaKernel = v236;

  v238 = [(DolbyVisionComposer *)self createShaderWithName:@"sdr_8or10_cif10" dolby84:0 forLLDovi:0];
  sdr2cif10 = self->_sdr2cif10;
  self->_sdr2cif10 = v238;

  v240 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_hdr10" dolby84:0 forLLDovi:0];
  packedHDR10toRGB = self->_packedHDR10toRGB;
  self->_packedHDR10toRGB = v240;

  v242 = [(DolbyVisionComposer *)self createShaderWithName:@"unpacked_rgbplane_hdr10" dolby84:0 forLLDovi:0];
  unpackedHDR10toRGB = self->_unpackedHDR10toRGB;
  self->_unpackedHDR10toRGB = v242;

  v244 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_hdr10_YUVTM" dolby84:0 forLLDovi:0];
  packedHDR10toRGB_YUVTM = self->_packedHDR10toRGB_YUVTM;
  self->_packedHDR10toRGB_YUVTM = v244;

  v246 = [(DolbyVisionComposer *)self createShaderWithName:@"unpacked_rgbplane_hdr10_YUVTM" dolby84:0 forLLDovi:0];
  unpackedHDR10toRGB_YUVTM = self->_unpackedHDR10toRGB_YUVTM;
  self->_unpackedHDR10toRGB_YUVTM = v246;

  v248 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_hdr10_YUVTM" dolby84:0 forLLDovi:0];
  packed422HDR10toRGB_YUVTM = self->_packed422HDR10toRGB_YUVTM;
  self->_packed422HDR10toRGB_YUVTM = v248;

  v250 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_hlg_YUVTM" dolby84:0 forLLDovi:0];
  packedHLGtoRGB_YUVTM = self->_packedHLGtoRGB_YUVTM;
  self->_packedHLGtoRGB_YUVTM = v250;

  v252 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_hlg_YUVTM_flip" dolby84:0 forLLDovi:0];
  packedHLGtoRGB_YUVTM_flip = self->_packedHLGtoRGB_YUVTM_flip;
  self->_packedHLGtoRGB_YUVTM_flip = v252;

  v254 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_hlg_YUVTM_rotate" dolby84:0 forLLDovi:0];
  packedHLGtoRGB_YUVTM_rotate = self->_packedHLGtoRGB_YUVTM_rotate;
  self->_packedHLGtoRGB_YUVTM_rotate = v254;

  v256 = [(DolbyVisionComposer *)self createShaderWithName:@"unpacked_rgbplane_hlg_8bit_YUVTM" dolby84:0 forLLDovi:0];
  unpackedHLG8toRGB_YUVTM = self->_unpackedHLG8toRGB_YUVTM;
  self->_unpackedHLG8toRGB_YUVTM = v256;

  v258 = [(DolbyVisionComposer *)self createShaderWithName:@"unpacked_rgbplane_hlg_10bit_YUVTM" dolby84:0 forLLDovi:0];
  unpackedHLG10toRGB_YUVTM = self->_unpackedHLG10toRGB_YUVTM;
  self->_unpackedHLG10toRGB_YUVTM = v258;

  v260 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_hlg_YUVTM" dolby84:0 forLLDovi:0];
  packed422HLGtoRGB_YUVTM = self->_packed422HLGtoRGB_YUVTM;
  self->_packed422HLGtoRGB_YUVTM = v260;

  v262 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_hlg_YUVTM_flip" dolby84:0 forLLDovi:0];
  packed422HLGtoRGB_YUVTM_flip = self->_packed422HLGtoRGB_YUVTM_flip;
  self->_packed422HLGtoRGB_YUVTM_flip = v262;

  v264 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_hlg_YUVTM_rotate" dolby84:0 forLLDovi:0];
  packed422HLGtoRGB_YUVTM_rotate = self->_packed422HLGtoRGB_YUVTM_rotate;
  self->_packed422HLGtoRGB_YUVTM_rotate = v264;

  v266 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_dolbyYUV_YUVTM" dolby84:0 forLLDovi:0];
  v267 = self->_packedDolbyYUVtoRGB_YUVTM[0];
  self->_packedDolbyYUVtoRGB_YUVTM[0] = v266;

  v268 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane" dolby84:1 forLLDovi:0];
  v269 = self->_packedDolbyYUVtoRGB_YUVTM[1];
  self->_packedDolbyYUVtoRGB_YUVTM[1] = v268;

  v270 = [(DolbyVisionComposer *)self createNullShader];
  v271 = self->_packedDolbyYUVtoRGB_YUVTM[2];
  self->_packedDolbyYUVtoRGB_YUVTM[2] = v270;

  v272 = [(DolbyVisionComposer *)self createNullShader];
  v273 = self->_packedDolbyYUVtoRGB_YUVTM[3];
  self->_packedDolbyYUVtoRGB_YUVTM[3] = v272;

  v274 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_dolbyYUV_IPTTM_HLGOOTF" dolby84:0 forLLDovi:0];
  packedDolbyYUVtoRGB_IPTTM_HLGOOTF = self->_packedDolbyYUVtoRGB_IPTTM_HLGOOTF;
  self->_packedDolbyYUVtoRGB_IPTTM_HLGOOTF = v274;

  v276 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_dolbyYUV_IPTTM_YScale" dolby84:0 forLLDovi:0];
  packedDolbyYUVtoRGB_IPTTM_YScale = self->_packedDolbyYUVtoRGB_IPTTM_YScale;
  self->_packedDolbyYUVtoRGB_IPTTM_YScale = v276;

  v278 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_dolbyYUV_YUVTM" dolby84:0 forLLDovi:0];
  v279 = self->_packed422DolbyYUVtoRGB_YUVTM[0];
  self->_packed422DolbyYUVtoRGB_YUVTM[0] = v278;

  v280 = [(DolbyVisionComposer *)self createShaderWithName:@"packedyuv422_rgbplane_dolby" dolby84:1 forLLDovi:0];
  v281 = self->_packed422DolbyYUVtoRGB_YUVTM[1];
  self->_packed422DolbyYUVtoRGB_YUVTM[1] = v280;

  v282 = [(DolbyVisionComposer *)self createNullShader];
  v283 = self->_packed422DolbyYUVtoRGB_YUVTM[2];
  self->_packed422DolbyYUVtoRGB_YUVTM[2] = v282;

  v284 = [(DolbyVisionComposer *)self createNullShader];
  v285 = self->_packed422DolbyYUVtoRGB_YUVTM[3];
  self->_packed422DolbyYUVtoRGB_YUVTM[3] = v284;

  v286 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_dolbyYUV_IPTTM_HLGOOTF" dolby84:0 forLLDovi:0];
  packed422DolbyYUVtoRGB_IPTTM_HLGOOTF = self->_packed422DolbyYUVtoRGB_IPTTM_HLGOOTF;
  self->_packed422DolbyYUVtoRGB_IPTTM_HLGOOTF = v286;

  v288 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_dolbyYUV_IPTTM_YScale" dolby84:0 forLLDovi:0];
  packed422DolbyYUVtoRGB_IPTTM_YScale = self->_packed422DolbyYUVtoRGB_IPTTM_YScale;
  self->_packed422DolbyYUVtoRGB_IPTTM_YScale = v288;

  v290 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_dolbyIPT_YUVTM" dolby84:0 forLLDovi:0];
  v291 = self->_packedDolbyIPTtoRGB_YUVTM[0];
  self->_packedDolbyIPTtoRGB_YUVTM[0] = v290;

  v292 = [(DolbyVisionComposer *)self createShaderWithName:@"fwrdPacked2RGBPlane_ipt" dolby84:1 forLLDovi:0];
  v293 = self->_packedDolbyIPTtoRGB_YUVTM[1];
  self->_packedDolbyIPTtoRGB_YUVTM[1] = v292;

  v294 = [(DolbyVisionComposer *)self createNullShader];
  v295 = self->_packedDolbyIPTtoRGB_YUVTM[2];
  self->_packedDolbyIPTtoRGB_YUVTM[2] = v294;

  v296 = [(DolbyVisionComposer *)self createNullShader];
  v297 = self->_packedDolbyIPTtoRGB_YUVTM[3];
  self->_packedDolbyIPTtoRGB_YUVTM[3] = v296;

  v298 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_dolbyIPT_IPTTM_HLGOOTF" dolby84:0 forLLDovi:0];
  packedDolbyIPTtoRGB_IPTTM_HLGOOTF = self->_packedDolbyIPTtoRGB_IPTTM_HLGOOTF;
  self->_packedDolbyIPTtoRGB_IPTTM_HLGOOTF = v298;

  v300 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_dolbyIPT_IPTTM_YScale" dolby84:0 forLLDovi:0];
  packedDolbyIPTtoRGB_IPTTM_YScale = self->_packedDolbyIPTtoRGB_IPTTM_YScale;
  self->_packedDolbyIPTtoRGB_IPTTM_YScale = v300;

  v302 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_dolbyIPT_YUVTM" dolby84:0 forLLDovi:0];
  v303 = self->_packed422DolbyIPTtoRGB_YUVTM[0];
  self->_packed422DolbyIPTtoRGB_YUVTM[0] = v302;

  v304 = [(DolbyVisionComposer *)self createShaderWithName:@"packedipt422_rgbplane_dolby" dolby84:1 forLLDovi:0];
  v305 = self->_packed422DolbyIPTtoRGB_YUVTM[1];
  self->_packed422DolbyIPTtoRGB_YUVTM[1] = v304;

  v306 = [(DolbyVisionComposer *)self createNullShader];
  v307 = self->_packed422DolbyIPTtoRGB_YUVTM[2];
  self->_packed422DolbyIPTtoRGB_YUVTM[2] = v306;

  v308 = [(DolbyVisionComposer *)self createNullShader];
  v309 = self->_packed422DolbyIPTtoRGB_YUVTM[3];
  self->_packed422DolbyIPTtoRGB_YUVTM[3] = v308;

  v310 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_dolbyIPT_IPTTM_HLGOOTF" dolby84:0 forLLDovi:0];
  packed422DolbyIPTtoRGB_IPTTM_HLGOOTF = self->_packed422DolbyIPTtoRGB_IPTTM_HLGOOTF;
  self->_packed422DolbyIPTtoRGB_IPTTM_HLGOOTF = v310;

  v312 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_dolbyIPT_IPTTM_YScale" dolby84:0 forLLDovi:0];
  packed422DolbyIPTtoRGB_IPTTM_YScale = self->_packed422DolbyIPTtoRGB_IPTTM_YScale;
  self->_packed422DolbyIPTtoRGB_IPTTM_YScale = v312;

  v314 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_hdr10" dolby84:0 forLLDovi:0];
  packed422HDR10toRGB = self->_packed422HDR10toRGB;
  self->_packed422HDR10toRGB = v314;

  v316 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_hdr10_ptv" dolby84:0 forLLDovi:0];
  packedHDR10_ptv = self->_packedHDR10_ptv;
  self->_packedHDR10_ptv = v316;

  v318 = [(DolbyVisionComposer *)self createShaderWithName:@"unpacked_rgbplane_hdr10_ptv" dolby84:0 forLLDovi:0];
  unpackedHDR10_ptv = self->_unpackedHDR10_ptv;
  self->_unpackedHDR10_ptv = v318;

  v320 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_hdr10_ptv" dolby84:0 forLLDovi:0];
  packed422HDR10_ptv = self->_packed422HDR10_ptv;
  self->_packed422HDR10_ptv = v320;

  v322 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_hlg_ptv" dolby84:0 forLLDovi:0];
  packedHLG_ptv = self->_packedHLG_ptv;
  self->_packedHLG_ptv = v322;

  v324 = [(DolbyVisionComposer *)self createShaderWithName:@"unpacked_rgbplane_hlg_ptv" dolby84:0 forLLDovi:0];
  unpackedHLG_ptv = self->_unpackedHLG_ptv;
  self->_unpackedHLG_ptv = v324;

  v326 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_hlg_ptv" dolby84:0 forLLDovi:0];
  packed422HLG_ptv = self->_packed422HLG_ptv;
  self->_packed422HLG_ptv = v326;

  v328 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_dolbyIPT_ptv" dolby84:0 forLLDovi:0];
  packedDolbyIPT_ptv = self->_packedDolbyIPT_ptv;
  self->_packedDolbyIPT_ptv = v328;

  v330 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_dolbyIPT_ptv" dolby84:0 forLLDovi:0];
  packed422DolbyIPT_ptv = self->_packed422DolbyIPT_ptv;
  self->_packed422DolbyIPT_ptv = v330;

  v332 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_hdr10_msr" dolby84:0 forLLDovi:0];
  packedHDR10_msr = self->_packedHDR10_msr;
  self->_packedHDR10_msr = v332;

  v334 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_hdr10_msr" dolby84:0 forLLDovi:0];
  packed422HDR10_msr = self->_packed422HDR10_msr;
  self->_packed422HDR10_msr = v334;

  v336 = [(DolbyVisionComposer *)self createShaderWithName:@"packed_rgbplane_hlg_msr" dolby84:0 forLLDovi:0];
  packedHLG_msr = self->_packedHLG_msr;
  self->_packedHLG_msr = v336;

  v338 = [(DolbyVisionComposer *)self createShaderWithName:@"packed422_rgbplane_hlg_msr" dolby84:0 forLLDovi:0];
  packed422HLG_msr = self->_packed422HLG_msr;
  self->_packed422HLG_msr = v338;

  v340 = [(DolbyVisionComposer *)self createShaderWithName:@"display_management_16bit_444" dolby84:0 forLLDovi:0];
  singleLayer16bit444Kernel = self->_singleLayer16bit444Kernel;
  self->_singleLayer16bit444Kernel = v340;

  v342 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"hlg_1input_half_rgb_msr" dolby84:0 forLLDovi:0 input:38 output:6];
  hlg_1input_half_msr = self->_hlg_1input_half_msr;
  self->_hlg_1input_half_msr = v342;

  v344 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"hlg_two_inputs_ushort_rgb_msr" dolby84:0 forLLDovi:0 input:38 output:6];
  hlg_two_inputs_ushort_msr = self->_hlg_two_inputs_ushort_msr;
  self->_hlg_two_inputs_ushort_msr = v344;

  v346 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"hdr10_1input_half_rgb_msr" dolby84:0 forLLDovi:0 input:38 output:6];
  hdr10_1input_half_msr = self->_hdr10_1input_half_msr;
  self->_hdr10_1input_half_msr = v346;

  v348 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"hdr10_two_inputs_ushort_rgb_msr" dolby84:0 forLLDovi:0 input:38 output:6];
  hdr10_two_inputs_ushort_msr = self->_hdr10_two_inputs_ushort_msr;
  self->_hdr10_two_inputs_ushort_msr = v348;

  v350 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"dovi84_1input_half_rgb_msr" dolby84:0 forLLDovi:0 input:38 output:6];
  v351 = self->_dovi84_1input_half_msr[0];
  self->_dovi84_1input_half_msr[0] = v350;

  v352 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"dovi84_two_inputs_ushort_rgb_msr" dolby84:0 forLLDovi:0 input:38 output:6];
  v353 = self->_dovi84_two_inputs_ushort_msr[0];
  self->_dovi84_two_inputs_ushort_msr[0] = v352;

  v354 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"dovi84_1input_half_rgb_msr" dolby84:1 forLLDovi:0 input:38 output:6];
  v355 = self->_dovi84_1input_half_msr[1];
  self->_dovi84_1input_half_msr[1] = v354;

  v356 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"dovi84_two_inputs_ushort_rgb_msr" dolby84:1 forLLDovi:0 input:38 output:6];
  v357 = self->_dovi84_two_inputs_ushort_msr[1];
  self->_dovi84_two_inputs_ushort_msr[1] = v356;

  v358 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"dovi84_DM3_1input_half_rgb_msr" dolby84:1 forLLDovi:0 input:38 output:6];
  dovi84_DM3_1input_half_msr = self->_dovi84_DM3_1input_half_msr;
  self->_dovi84_DM3_1input_half_msr = v358;

  v360 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"dovi84_DM3_two_inputs_ushort_rgb_msr" dolby84:1 forLLDovi:0 input:38 output:6];
  dovi84_DM3_two_inputs_ushort_msr = self->_dovi84_DM3_two_inputs_ushort_msr;
  self->_dovi84_DM3_two_inputs_ushort_msr = v360;

  v362 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"dovi5_yuv_1input_compose_dm_msr" dolby84:0 forLLDovi:0 input:38 output:6];
  dovi5_yuv_1input_compose_dm_msr = self->_dovi5_yuv_1input_compose_dm_msr;
  self->_dovi5_yuv_1input_compose_dm_msr = v362;

  v364 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"dovi5_ipt_1input_compose_dm_msr" dolby84:0 forLLDovi:0 input:38 output:6];
  dovi5_ipt_1input_compose_dm_msr = self->_dovi5_ipt_1input_compose_dm_msr;
  self->_dovi5_ipt_1input_compose_dm_msr = v364;

  v366 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"dovi5_yuv_two_inputs_compose_dm_msr" dolby84:0 forLLDovi:0 input:38 output:6];
  dovi5_yuv_two_inputs_compose_dm_msr = self->_dovi5_yuv_two_inputs_compose_dm_msr;
  self->_dovi5_yuv_two_inputs_compose_dm_msr = v366;

  v368 = [(DolbyVisionComposer *)self createShaderWithNameAndInputOutput:@"dovi5_ipt_two_inputs_compose_dm_msr" dolby84:0 forLLDovi:0 input:38 output:6];
  dovi5_ipt_two_inputs_compose_dm_msr = self->_dovi5_ipt_two_inputs_compose_dm_msr;
  self->_dovi5_ipt_two_inputs_compose_dm_msr = v368;
}

- (int64_t)encodeToCommandBuffer:(id)a3 BL:(__IOSurface *)a4 EL:(__IOSurface *)a5 Output:(__IOSurface *)a6 ComposerData:(id *)a7 DM:(id)a8 DMData:(id *)a9 tcControl:(ToneCurve_Control *)a10 hdrControl:(id *)a11 hdr10InfoFrame:(id *)a12 frameNumber:(unint64_t)a13
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  p_frameNumber = &self->_frameNumber;
  id v20 = a3;
  id v33 = a8;
  unsigned int *p_frameNumber = a13;
  BOOL v21 = IsGpuOnlySystem();
  if (v21 || (v22 = GetConfig((HDRConfig *)v21)) == 0)
  {
    BOOL v24 = 0;
  }
  else
  {
    Config = GetConfig((HDRConfig *)v22);
    BOOL v24 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)Config, 0x18u, 0) != 0;
  }
  a11->var30 = v24;
  *((unsigned char *)p_frameNumber + 4) = v24;
  if (__PAIR64__((__int16)a9->var21.var2, (__int16)a9->var21.var1) == -1
    || IsVirtualized() && a10->maxEDRValue <= 1.0
    || IOSurfaceGetPlaneCount(a6) == 3)
  {
    *((unsigned char *)p_frameNumber + 4) = 0;
    a11->var30 = 0;
  }
  int64_t v25 = [(DolbyVisionComposer *)self setupInputTexturesWithBL:a4 EL:a5 Output:a6 MetaData:a7];
  if (v25 != -17000)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v27 = logInstanceID;
      }
      else {
        uint64_t v27 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 134218242;
      v35 = (const char *)WORD1(v27);
      __int16 v36 = 2080;
      v37 = "-[DolbyVisionComposer encodeToCommandBuffer:BL:EL:Output:ComposerData:DM:DMData:tcControl:hdrControl:hdr10In"
            "foFrame:frameNumber:]";
      v28 = &_os_log_internal;
      v29 = " [1.419.54] #%04llx %s : Failed with setupInputTexturesWithBL\n";
      goto LABEL_26;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136315138;
    v35 = "-[DolbyVisionComposer encodeToCommandBuffer:BL:EL:Output:ComposerData:DM:DMData:tcControl:hdrControl:hdr10Info"
          "Frame:frameNumber:]";
    v30 = &_os_log_internal;
    v31 = " [1.419.54] %s : Failed with setupInputTexturesWithBL\n";
LABEL_32:
    _os_log_impl(&dword_22224D000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
    goto LABEL_35;
  }
  int64_t v25 = [(DolbyVisionComposer *)self setupOutputTexturesWithBuffer:a6 orientation:a10->orientation ptvMode:*((unsigned char *)a10 + 152) & 1];
  if (v25 != -17000)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v27 = logInstanceID;
      }
      else {
        uint64_t v27 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 134218242;
      v35 = (const char *)WORD1(v27);
      __int16 v36 = 2080;
      v37 = "-[DolbyVisionComposer encodeToCommandBuffer:BL:EL:Output:ComposerData:DM:DMData:tcControl:hdrControl:hdr10In"
            "foFrame:frameNumber:]";
      v28 = &_os_log_internal;
      v29 = " [1.419.54] #%04llx %s : Failed with setupOutputTexturesWithBuffer\n";
LABEL_26:
      _os_log_impl(&dword_22224D000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
LABEL_27:
      prevLogInstanceID = v27;
      goto LABEL_35;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136315138;
    v35 = "-[DolbyVisionComposer encodeToCommandBuffer:BL:EL:Output:ComposerData:DM:DMData:tcControl:hdrControl:hdr10Info"
          "Frame:frameNumber:]";
    v30 = &_os_log_internal;
    v31 = " [1.419.54] %s : Failed with setupOutputTexturesWithBuffer\n";
    goto LABEL_32;
  }
  [(DolbyVisionComposer *)self setupInputBuffersWithMetadata:a7];
  if (a5) {
    int64_t v26 = [(DolbyVisionComposer *)self encodeDualLayerToCommandBuffer:v20 BL:a4 EL:a5 Output:a6 MetaData:a7 tcControl:a10];
  }
  else {
    int64_t v26 = [(DolbyVisionComposer *)self encodeSingleLayerToCommandBuffer:v20 BL:a4 Output:a6 ComposerData:a7 DM:v33 DMData:a9 tcControl:a10 hdrControl:a11 hdr10InfoFrame:a12];
  }
  int64_t v25 = v26;
  ++self->_frameIndex;
LABEL_35:

  return v25;
}

- (int64_t)checkInputFormats:(unsigned int)a3 returnInput1:(BOOL *)a4 returnInput2:(BOOL *)a5 returnInput3:(BOOL *)a6 returnInput4:(BOOL *)a7 returnInput5:(BOOL *)a8 outputFormat:(unsigned int)a9 returnOutput1:(BOOL *)a10 returnOutput2:(BOOL *)a11 returnOutput3:(BOOL *)a12 returnOutput4:(BOOL *)a13
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v16 = 1;
  if (a3 != 875704422 && a3 != 875704438 && a3 != 2016686640) {
    BOOL v16 = a3 == 1882468912 && self->_enableGpuTmMatchMSR || a3 == 2019963440;
  }
  BOOL v19 = a9 == 1380411457 || a9 == 1919365992 && self->_enableGpuTmMatchMSR;
  *a8 = (a3 & 0xFFEFFFFF) == 1952855092;
  BOOL v22 = a3 == 2019963442 || a3 == 2016686642;
  *a7 = v22;
  if ((a3 == 1885745714 || a3 == 1882468914) && __PAIR128__((unint64_t)a13, (unint64_t)a12) == 0)
  {
    v31 = a6;
    if (enableLogInstance)
    {
      uint64_t v23 = logInstanceID;
      if (!logInstanceID) {
        uint64_t v23 = prevLogInstanceID;
      }
      uint64_t v30 = v23;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v33 = WORD1(v30);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"hasThreeOutputPlane || has10BitOutput\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1145\n", buf, 0xCu);
      }
      a6 = v31;
      prevLogInstanceID = v30;
    }
    else
    {
      BOOL v24 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      a6 = v31;
      if (v24)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"hasThreeOutputPlane || has10BitOutput\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1145\n", buf, 2u);
        a6 = v31;
      }
    }
  }
  BOOL v26 = a3 == 1882468914 || a3 == 1885745714;
  BOOL v28 = a9 == 1999843442 || a9 == 2021078128;
  *a4 = v16;
  *a5 = v26;
  *a10 = v19;
  *a11 = a9 == 1815162994;
  *a12 = a9 == 1919365992;
  *a13 = v28;
  *a6 = a3 == 1815162994;
  return -17000;
}

- (int64_t)checkForContent:(unsigned int)a3 contentReturn1:(BOOL *)a4 contentReturn2:(BOOL *)a5 contentReturn3:(BOOL *)a6 forDisplay:(unsigned int)a7 displayReturn1:(BOOL *)a8 displayReturn2:(BOOL *)a9 displayReturn3:(BOOL *)a10 displayReturn4:(BOOL *)a11 displayReturn5:(BOOL *)a12
{
  unsigned int v12 = a3 - 1;
  BOOL v14 = a3 == 1 || a3 == 4;
  BOOL v16 = a7 == 7 || a7 - 3 < 2;
  *a4 = a3 == 2;
  *a6 = a3 == 3;
  *a5 = v14;
  *a8 = a7 == 0;
  *a9 = a7 == 2;
  *a10 = v16;
  *a11 = (a7 & 0xFFFFFFFD) == 5;
  *a12 = 0;
  if (a7 == 6 || a7 == 1)
  {
    if (v12 <= 3)
    {
      char v17 = 8 * v12;
      *a9 = 0x10100u >> v17;
      *a8 = 0x1000001u >> v17;
    }
    *a12 = 1;
  }
  return -17000;
}

- (int64_t)encodeSingleLayerToCommandBuffer:(id)a3 BL:(__IOSurface *)a4 Output:(__IOSurface *)a5 ComposerData:(id *)a6 DM:(id)a7 DMData:(id *)a8 tcControl:(ToneCurve_Control *)a9 hdrControl:(id *)a10 hdr10InfoFrame:(id *)a11
{
  p_inputPixelFormat = &self->_inputPixelFormat;
  id v17 = a3;
  id v18 = a7;
  int v63 = 0;
  int v64 = 0;
  unsigned __int8 v62 = 0;
  LODWORD(v38) = a9->outputPixelFormat;
  int64_t v19 = [(DolbyVisionComposer *)self checkInputFormats:*p_inputPixelFormat returnInput1:(char *)&v64 + 3 returnInput2:(char *)&v64 + 2 returnInput3:(char *)&v64 + 1 returnInput4:&v64 returnInput5:(char *)&v63 + 3 outputFormat:v38 returnOutput1:(char *)&v63 + 2 returnOutput2:(char *)&v63 + 1 returnOutput3:&v63 returnOutput4:&v62];
  if (v19 == -17000)
  {
    int v61 = 0;
    int v60 = 0;
    int64_t v19 = [(DolbyVisionComposer *)self checkForContent:a10->var0 contentReturn1:(char *)&v61 + 3 contentReturn2:(char *)&v61 + 2 contentReturn3:(char *)&v61 + 1 forDisplay:a10->var10 displayReturn1:&v61 displayReturn2:(char *)&v60 + 3 displayReturn3:(char *)&v60 + 2 displayReturn4:(char *)&v60 + 1 displayReturn5:&v60];
    if (v19 == -17000)
    {
      id v58 = v17;
      IOSurfaceGetWidthOfPlane(a4, 0);
      IOSurfaceGetHeightOfPlane(a4, 0);
      IOSurfaceGetWidthOfPlane(a5, 0);
      IOSurfaceGetHeightOfPlane(a5, 0);
      int var2 = a8->var21.var2;
      BOOL v49 = var2 == 65534 && (__int16)a8->var21.var1 == -2;
      BOOL v21 = HIBYTE(v61) != 0;
      if (HIBYTE(v61)) {
        BOOL v22 = HIBYTE(v60) != 0;
      }
      else {
        BOOL v22 = 0;
      }
      if (!(_BYTE)v60) {
        BOOL v21 = 0;
      }
      char v57 = v21;
      if (BYTE2(v61)) {
        BOOL v23 = HIBYTE(v60) != 0;
      }
      else {
        BOOL v23 = 0;
      }
      if (HIBYTE(v61)) {
        BOOL v59 = (v62 | BYTE2(v63)) != 0;
      }
      else {
        BOOL v59 = 0;
      }
      BOOL v55 = v22;
      if (BYTE2(v61)) {
        BOOL v48 = (v62 | BYTE2(v63)) != 0;
      }
      else {
        BOOL v48 = 0;
      }
      BOOL v24 = BYTE2(v61) != 0;
      BOOL v25 = BYTE1(v61) != 0;
      if (!(_BYTE)v60)
      {
        BOOL v25 = 0;
        BOOL v24 = 0;
      }
      BOOL v47 = var2 == 0xFFFF && (__int16)a8->var21.var1 == -1;
      if (BYTE1(v61)) {
        BOOL v26 = HIBYTE(v60) != 0;
      }
      else {
        BOOL v26 = 0;
      }
      if (v62) {
        BOOL v27 = BYTE1(v61) != 0;
      }
      else {
        BOOL v27 = 0;
      }
      if ((_BYTE)v61) {
        BOOL v28 = BYTE1(v61) != 0;
      }
      else {
        BOOL v28 = 0;
      }
      if (BYTE2(v61)) {
        BOOL v56 = a10->var17 == 18;
      }
      else {
        BOOL v56 = 0;
      }
      BOOL v53 = v24;
      BOOL v54 = v23;
      BOOL v51 = v26;
      BOOL v52 = v25;
      BOOL v50 = v28;
      if (*((unsigned char *)p_inputPixelFormat + 3088))
      {
        BOOL v29 = HIBYTE(v61) != 0;
        unsigned int var10 = a10->var10;
        BOOL v27 = var10 == 7 && BYTE1(v61) != 0;
        if (var10 != 7) {
          BOOL v29 = 0;
        }
        BOOL v59 = v29;
      }
      BOOL v46 = v27;
      id v31 = (id) [(MTLDeviceSPI *)self->_device newBufferWithLength:512 options:0];
      uint64_t v32 = [v31 contents];
      uint64_t v33 = v32;
      *(_OWORD *)(v32 + 480) = 0u;
      *(_OWORD *)(v32 + 496) = 0u;
      *(_OWORD *)(v32 + 448) = 0u;
      *(_OWORD *)(v32 + 464) = 0u;
      *(_OWORD *)(v32 + 416) = 0u;
      *(_OWORD *)(v32 + 432) = 0u;
      *(_OWORD *)(v32 + 384) = 0u;
      *(_OWORD *)(v32 + 400) = 0u;
      *(_OWORD *)(v32 + 352) = 0u;
      *(_OWORD *)(v32 + 368) = 0u;
      *(_OWORD *)(v32 + 320) = 0u;
      *(_OWORD *)(v32 + 336) = 0u;
      *(_OWORD *)(v32 + 288) = 0u;
      *(_OWORD *)(v32 + 304) = 0u;
      *(_OWORD *)(v32 + 256) = 0u;
      *(_OWORD *)(v32 + 272) = 0u;
      *(_OWORD *)(v32 + 224) = 0u;
      *(_OWORD *)(v32 + 240) = 0u;
      *(_OWORD *)(v32 + 192) = 0u;
      *(_OWORD *)(v32 + 208) = 0u;
      *(_OWORD *)(v32 + 160) = 0u;
      *(_OWORD *)(v32 + 176) = 0u;
      *(_OWORD *)(v32 + 128) = 0u;
      *(_OWORD *)(v32 + 144) = 0u;
      *(_OWORD *)(v32 + 96) = 0u;
      *(_OWORD *)(v32 + 112) = 0u;
      *(_OWORD *)(v32 + 64) = 0u;
      *(_OWORD *)(v32 + 80) = 0u;
      *(_OWORD *)(v32 + 32) = 0u;
      *(_OWORD *)(v32 + 48) = 0u;
      *(_OWORD *)uint64_t v32 = 0u;
      *(_OWORD *)(v32 + 16) = 0u;
      *(_DWORD *)(v32 + 252) = -971227136;
      char v34 = v57;
      if (HIBYTE(v60)) {
        char v34 = 1;
      }
      BYTE1(v42) = v34;
      LOBYTE(v42) = v59;
      int64_t v19 = -[DolbyVisionComposer embeddedSetupToneMappingWithContent:Output:DM:DMData:tcControl:hdrControl:hdr10InfoFrame:dmConfig:hdr10OnPad:useYUVScalingTable:](self, "embeddedSetupToneMappingWithContent:Output:DM:DMData:tcControl:hdrControl:hdr10InfoFrame:dmConfig:hdr10OnPad:useYUVScalingTable:", BYTE2(v61), a5, v18, a8, a9, a10, a11, v32, v42);
      if (v19 == -17000)
      {
        BOOL v35 = BYTE2(v64) != 0;
        if (*((unsigned char *)p_inputPixelFormat + 3088))
        {
          *(_WORD *)((char *)&v45 + 1) = *(_WORD *)((char *)&v61 + 1);
          LOBYTE(v45) = HIBYTE(v61);
          BYTE4(v39) = *(_DWORD *)(v33 + 468) == 4;
          LODWORD(v39) = a9->dovi50toHDR10TVMode;
          int64_t v36 = -[DolbyVisionComposer embeddedSetupEncoderForGpuMatchMsrCommandBuffer:DMData:dmConfig:isInput422:orientation:isDolby84:dovi50toHDR10TVMode:isDM4:dpcParam:tcControl:hdrControl:isHDR10Content:isHLGContent:isDOVIContent:](self, "embeddedSetupEncoderForGpuMatchMsrCommandBuffer:DMData:dmConfig:isInput422:orientation:isDolby84:dovi50toHDR10TVMode:isDM4:dpcParam:tcControl:hdrControl:isHDR10Content:isHLGContent:isDOVIContent:", v58, a8, v31, v35, a9->orientation, v56, v39, v33 + 448, a9, a10, v45);
        }
        else
        {
          BYTE1(v44) = a10->var29;
          LOBYTE(v44) = *(_DWORD *)(v33 + 468) == 4;
          HIDWORD(v43) = a9->dovi50toHDR10TVMode;
          LOBYTE(v43) = v56;
          HIDWORD(v41) = a9->orientation;
          BYTE3(v41) = *((unsigned char *)a9 + 152) & 1;
          BYTE2(v41) = v52;
          BYTE1(v41) = v50;
          LOBYTE(v41) = v51;
          HIBYTE(v40) = v57;
          BYTE6(v40) = v53;
          BYTE5(v40) = v48;
          BYTE4(v40) = v46;
          BYTE3(v40) = v59;
          BYTE2(v40) = v49;
          BYTE1(v40) = v54;
          LOBYTE(v40) = v55;
          int64_t v36 = -[DolbyVisionComposer embeddedSetupEncoderForCommandBuffer:DMData:dmConfig:isInput422:hasThreeOutputPlane:isSdrOnDolbyOrHDR10:isHDR10OnHDR10TV:isDolbyOnHDR10TV:isHDR10OnDolby:isHDR10OnPad:isHLGOnPad:isDoviOnPad:isDoviOnLLDovi:isHDR10OnLLDovi:isHLGOnHDR10TV:isHLGOnDolbyTV:isHLGOnLLDovi:isPtvMode:orientation:isDolby84:dovi50toHDR10TVMode:isDM4:isGpuTmRefMode:](self, "embeddedSetupEncoderForCommandBuffer:DMData:dmConfig:isInput422:hasThreeOutputPlane:isSdrOnDolbyOrHDR10:isHDR10OnHDR10TV:isDolbyOnHDR10TV:isHDR10OnDolby:isHDR10OnPad:isHLGOnPad:isDoviOnPad:isDoviOnLLDovi:isHDR10OnLLDovi:isHLGOnHDR10TV:isHLGOnDolbyTV:isHLGOnLLDovi:isPtvMode:orientation:isDolby84:dovi50toHDR10TVMode:isDM4:isGpuTmRefMode:", v58, a8, v31, v35, v63, v47, v40, v41, v43, v44);
        }
        int64_t v19 = v36;
      }

      id v17 = v58;
    }
  }

  return v19;
}

- (int64_t)embeddedSetupToneMappingWithContent:(BOOL)a3 Output:(__IOSurface *)a4 DM:(id)a5 DMData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8 hdr10InfoFrame:(id *)a9 dmConfig:(id *)a10 hdr10OnPad:(BOOL)a11 useYUVScalingTable:(BOOL)a12
{
  BOOL v15 = a3;
  p_l2PQMidPoint = &self->_l2PQMidPoint;
  id v18 = (HDRConfig *)a5;
  int64_t v19 = v18;
  uint64_t v45 = a4;
  if (*((unsigned char *)p_l2PQMidPoint + 3108))
  {
    Config = GetConfig(v18);
    if (Config)
    {
      BOOL v21 = GetConfig((HDRConfig *)Config);
      BOOL v22 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v21, 0x25u, 0) != 0;
    }
    else
    {
      BOOL v22 = 0;
    }
    a12 = 0;
    a7->atmEnable = v22;
  }
  a7->tmData.contentPercentiles.n = 3;
  a7->tmData.contentPercentiles.percents[0] = 0.25;
  *(void *)&a7->tmData.contentPercentiles.percents[1] = 0x3F4000003F000000;
  a7->tmData.contentPercentiles.percentiles[0] = 0.25;
  *(void *)&a7->tmData.contentPercentiles.percentiles[1] = 0x3F4000003F000000;
  unsigned int var10 = a8->var10;
  if (var10 <= 7 && ((1 << var10) & 0xB8) != 0)
  {
    BYTE1(a10[1].var52) = 1;
    a7->double targetMaxLinear = a7->Tmax_nits;
  }
  else
  {
    BYTE1(a10[1].var52) = 0;
  }
  if (a8->var29 || a8->var30 && !a8->var2) {
    chromVectorWeight = 1081291571;
  }
  if (v15) {
    [(HDRConfig *)v19 setDisplayManagementConfigFromMetaData:a6 config:a10 hdrCtrl:a8 tcCtrl:a7];
  }
  else {
    [(HDRConfig *)v19 setDisplayManagementConfigFromDictionary:a10 hdrCtrl:a8 tcCtrl:a7 infoFrame:a9];
  }
  if (*((unsigned char *)p_l2PQMidPoint + 3108) && a7->atmEnable)
  {
    BOOL v29 = [(HDRConfig *)v19 getAdaptiveTM];
    *((float *)&v43 + 1) = p_l2PQMidPoint[776];
    LOBYTE(v43) = 1;
    objc_msgSend(v29, "adaptiveToneMappingManagement:DMConfig:DM:TCControl:HDRControl:hdr10InfoFrame:LLDoVi:frameNumber:", a6, a10, v19, a7, a8, a9, v43);
  }
  LODWORD(a10[1].var14) = a7->orientation;
  *(float *)&a10->var45 = *p_l2PQMidPoint;
  a10->var46 = p_l2PQMidPoint[1];
  a10->var47 = 0.5 / *p_l2PQMidPoint;
  *(float *)&a10->var48 = 0.5 / (float)(p_l2PQMidPoint[1] - *p_l2PQMidPoint);
  a10[1].var9 = a7->sdrMaxBrightnessInNits;
  if (a11) {
    float v30 = 0.05;
  }
  else {
    float v30 = 0.005;
  }
  if (a7->dovi50toHDR10TVMode) {
    goto LABEL_26;
  }
  BOOL v31 = !a12;
  if (a8->var29) {
    BOOL v31 = 1;
  }
  if (v31)
  {
LABEL_26:
    [(DolbyVisionComposer *)self createLUTFromDMConfig:a10 DM:v19 TCControl:a7 HDRControl:a8];
    if (a7->dovi50toHDR10TVMode == 1)
    {
      double maxForwardTargetInNits = a7->maxForwardTargetInNits;
      *(float *)&double maxForwardTargetInNits = maxForwardTargetInNits;
      double targetMaxLinear = a7->targetMaxLinear;
      v35.f32[0] = a7->targetMaxLinear;
      LODWORD(v37) = 1.0;
      *(float *)&double targetMaxLinear = v30;
      *(float *)&double v36 = v30;
      [(DolbyVisionComposer *)self fillInScalingTable_YUVTM:a10 target_White:0 target_Black:maxForwardTargetInNits source_White:targetMaxLinear source_Black:*(double *)v35.i64 satBoost:v36 scalingFactor:v37];
    }
    if (v15 && LODWORD(a10[1].var49) == 4)
    {
      unsigned int v40 = a8->var10;
      if (v40 == 6 || v40 == 1)
      {
        uint64_t v41 = [(HDRConfig *)v19 getDolbyVisionDM4];
        [v41 createTmLuts:self->_dm4_tLutIBuffer tLutS:self->_dm4_tLutSBuffer sLutI:self->_dm4_sLutIBuffer sLutS:self->_dm4_sLutSBuffer tLutISize:512 tLutSSize:512 sLutISize:512 sLutSSize:512];
        [(DolbyVisionComposer *)self dovi_dm4_updateInterleavedLUT];
      }
      else if (a8->var29 || a8->var30 && !a8->var2)
      {
        BYTE1(v44) = 1;
        LOBYTE(v44) = a8->var17 == 18;
        -[HDRConfig dovi_computeDM4Tables:config:edrAdaptationParam:ambAdaptationParam:tLutI:tLutS:sLutI:sLutS:tLutISize:tLutSSize:sLutISize:sLutSSize:IsDoVi84:HlgOOTFCombined:](v19, "dovi_computeDM4Tables:config:edrAdaptationParam:ambAdaptationParam:tLutI:tLutS:sLutI:sLutS:tLutISize:tLutSSize:sLutISize:sLutSSize:IsDoVi84:HlgOOTFCombined:", &a7->doviTmParam, a10, &a7->edrAdaptationParam, &a7->ambAdaptationParam, self->_dm4_tLutIBuffer, self->_dm4_tLutSBuffer, self->_dm4_sLutIBuffer, self->_dm4_sLutSBuffer, 512, 512, 512, 512, v44);
        [(DolbyVisionComposer *)self dovi_dm4_updateInterleavedLUT];
      }
    }
  }
  else
  {
    double v32 = a7->targetMaxLinear;
    *(float *)&double v32 = a7->targetMaxLinear;
    *(float *)&double v27 = a8->var22;
    *(float *)&double v26 = (float)a8->var21;
    LODWORD(v28) = 1.0;
    *(float *)&double v25 = v30;
    [(DolbyVisionComposer *)self fillInScalingTable_YUVTM:a10 target_White:0 target_Black:v32 source_White:v25 source_Black:v26 satBoost:v27 scalingFactor:v28];
  }
  attachBackwardDisplayManagementMetaDataToBuffer((uint64_t)a6, (uint64_t)a10, (uint64_t)a7, (int *)a8, (long long *)a9, v45, v33, v34, v35);

  return -17000;
}

- (int64_t)embeddedSetupEncoderForCommandBuffer:(id)a3 DMData:(id *)a4 dmConfig:(id)a5 isInput422:(BOOL)a6 hasThreeOutputPlane:(BOOL)a7 isSdrOnDolbyOrHDR10:(BOOL)a8 isHDR10OnHDR10TV:(BOOL)a9 isDolbyOnHDR10TV:(BOOL)a10 isHDR10OnDolby:(BOOL)a11 isHDR10OnPad:(BOOL)a12 isHLGOnPad:(BOOL)a13 isDoviOnPad:(BOOL)a14 isDoviOnLLDovi:(BOOL)a15 isHDR10OnLLDovi:(BOOL)a16 isHLGOnHDR10TV:(BOOL)a17 isHLGOnDolbyTV:(BOOL)a18 isHLGOnLLDovi:(BOOL)a19 isPtvMode:(BOOL)a20 orientation:(int)a21 isDolby84:(BOOL)a22 dovi50toHDR10TVMode:(unsigned int)a23 isDM4:(BOOL)a24 isGpuTmRefMode:(BOOL)a25
{
  BOOL v112 = a8;
  BOOL v25 = a7;
  BOOL v107 = a6;
  uint64_t v120 = *MEMORY[0x263EF8340];
  p_inputPixelFormat = &self->_inputPixelFormat;
  id v29 = a3;
  id v111 = a5;
  id v30 = v29;
  BOOL v31 = p_inputPixelFormat;
  double v32 = v30;
  v109 = v30;
  if (*(void *)(p_inputPixelFormat + 3)) {
    objc_msgSend(v30, "setProtectionOptions:");
  }
  double v33 = [v32 computeCommandEncoder];
  if (a15 || a16 || a19) {
    LODWORD(v34) = 2;
  }
  else {
    LODWORD(v34) = a22;
  }
  BOOL v101 = a15 && a22;
  if (a15 && a22) {
    uint64_t v34 = 3;
  }
  else {
    uint64_t v34 = v34;
  }
  if (a22) {
    uint64_t v35 = 3;
  }
  else {
    uint64_t v35 = 2;
  }
  BOOL v103 = a10 && a25;
  uint64_t v102 = v34;
  if (v103) {
    uint64_t v36 = v35;
  }
  else {
    uint64_t v36 = v34;
  }
  if (v112)
  {
    p_sdr2cif10 = &self->_sdr2cif10;
LABEL_17:
    uint64_t v38 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:*p_sdr2cif10];
    int v105 = 0;
    goto LABEL_43;
  }
  if (a12 || a16)
  {
    if (v107)
    {
LABEL_25:
      p_y416HDR10w30r = &self->_packed422HDR10Cif10[v36];
LABEL_26:
      uint64_t v38 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:*p_y416HDR10w30r];
      BOOL v40 = a16;
      goto LABEL_42;
    }
    int v42 = *v31;
    if ((int)*v31 > 2019963441)
    {
      if (v42 == 2019963442) {
        goto LABEL_25;
      }
      if (v42 != 2019963956)
      {
        if (v42 == 2033463606)
        {
          p_y416HDR10w30r = &self->_y416HDR10w30r;
          goto LABEL_26;
        }
        goto LABEL_165;
      }
    }
    else
    {
      if (v42 == 1380411457)
      {
        p_y416HDR10w30r = &self->_RGhAHDR10w30r;
        goto LABEL_26;
      }
      if (v42 == 2016686642) {
        goto LABEL_25;
      }
      if (v42 != 2016687156)
      {
LABEL_165:
        p_y416HDR10w30r = &self->_packedHDR10Cif10[v36];
        goto LABEL_26;
      }
    }
    p_y416HDR10w30r = &self->_x444HDR10w30r;
    goto LABEL_26;
  }
  if (!a13 && !a19)
  {
    if (*v31 == 2033463606)
    {
      p_sdr2cif10 = &self->_singleLayer16bit444Kernel;
    }
    else if (a4->var12 == 2)
    {
      p_sdr2cif10 = &self->_singleLayerIntegratedIPTKernel[v36];
    }
    else
    {
      p_sdr2cif10 = &self->_singleLayerIntegratedKernel[v36];
    }
    goto LABEL_17;
  }
  if (v107)
  {
    p_y416HLGw30r = &self->_packed422HLGCif10[v36];
  }
  else
  {
    p_RGhAHLGw30r = &self->_packedHLGCif10[v36];
    if (*v31 == 1380411457) {
      p_RGhAHLGw30r = &self->_RGhAHLGw30r;
    }
    if (*v31 == 2033463606) {
      p_y416HLGw30r = &self->_y416HLGw30r;
    }
    else {
      p_y416HLGw30r = p_RGhAHLGw30r;
    }
  }
  uint64_t v38 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:*p_y416HLGw30r];
  BOOL v40 = a19;
LABEL_42:
  int v105 = !v40;
LABEL_43:
  unint64_t v108 = [(MTLTexture *)self->_blTexture width];
  v113 = v38;
  uint64_t v106 = [(MTLTexture *)self->_blTexture height];
  [v33 setTexture:self->_blTexture atIndex:0];
  if (self->_blTextureUV)
  {
    if (v112)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v44 = logInstanceID;
        }
        else {
          uint64_t v44 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v119 = WORD1(v44);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"sdrOnDolbyOrHDR10 == __objc_no\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1738\n", buf, 0xCu);
        }
        prevLogInstanceID = v44;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"sdrOnDolbyOrHDR10 == __objc_no\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1738\n", buf, 2u);
      }
    }
    [v33 setTexture:self->_blTextureUV atIndex:1];
    unsigned int v45 = 2;
  }
  else
  {
    unsigned int v45 = 1;
  }
  [v33 setTexture:self->_outputTexture[0] atIndex:v45];
  BOOL v46 = a20;
  BOOL v104 = a17 && a25;
  unsigned int v47 = v45 + 1;
  if (v25)
  {
    if (v112)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v48 = logInstanceID;
        }
        else {
          uint64_t v48 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v119 = WORD1(v48);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"sdrOnDolbyOrHDR10 == __objc_no\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1745\n", buf, 0xCu);
        }
        prevLogInstanceID = v48;
        BOOL v46 = a20;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"sdrOnDolbyOrHDR10 == __objc_no\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1745\n", buf, 2u);
      }
    }
    uint64_t v49 = 568;
    if (a4->var12 == 2) {
      uint64_t v49 = 600;
    }
    BOOL v50 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:*(Class *)((char *)&self->super.isa + 8 * v36 + v49)];

    if (v46)
    {
      v113 = v50;
      if (*((unsigned char *)v31 + 28))
      {
        if (a10)
        {
          if (a4->var12 == 2)
          {
            if (v107) {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422DolbyIPT_ptv];
            }
            else {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedDolbyIPT_ptv];
            }
            uint64_t v60 = LABEL_256:;

            goto LABEL_315;
          }
        }
        else if (!a9)
        {
          if (!a17)
          {
            if (enableLogInstance)
            {
              BOOL v61 = v25;
              if (logInstanceID) {
                uint64_t v62 = logInstanceID;
              }
              else {
                uint64_t v62 = prevLogInstanceID;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v119 = WORD1(v62);
                _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"HLGOnHDR10TV\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1767\n", buf, 0xCu);
              }
              prevLogInstanceID = v62;
              BOOL v25 = v61;
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"HLGOnHDR10TV\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1767\n", buf, 2u);
            }
          }
          if (v107) {
            [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422HLG_ptv];
          }
          else {
            [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedHLG_ptv];
          }
          goto LABEL_256;
        }
        if (v107) {
          [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422HDR10_ptv];
        }
        else {
          [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedHDR10_ptv];
        }
        goto LABEL_256;
      }
      if (a17)
      {
        if (v107)
        {
          if (enableLogInstance)
          {
            BOOL v52 = v25;
            if (logInstanceID) {
              uint64_t v53 = logInstanceID;
            }
            else {
              uint64_t v53 = prevLogInstanceID;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v119 = WORD1(v53);
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"!inputP422\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1777\n", buf, 0xCu);
            }
            prevLogInstanceID = v53;
            BOOL v25 = v52;
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"!inputP422\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1777\n", buf, 2u);
          }
        }
        uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_unpackedHLG_ptv];

        goto LABEL_315;
      }
      if (!a9)
      {
        if (enableLogInstance)
        {
          BOOL v54 = v46;
          BOOL v55 = v25;
          if (logInstanceID) {
            uint64_t v56 = logInstanceID;
          }
          else {
            uint64_t v56 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_157;
          }
          *(_DWORD *)buf = 134217984;
          uint64_t v119 = WORD1(v56);
          char v57 = &_os_log_internal;
          id v58 = " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Met"
                "al/Composer/DolbyVisionComposer.mm\" at line 1790\n";
          goto LABEL_156;
        }
        BOOL v54 = v46;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_317;
        }
        *(_WORD *)buf = 0;
        v68 = &_os_log_internal;
        v69 = " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Compose"
              "r/DolbyVisionComposer.mm\" at line 1790\n";
        goto LABEL_291;
      }
      if (a4->var12 == 2)
      {
        if (enableLogInstance)
        {
          BOOL v54 = v46;
          BOOL v55 = v25;
          if (logInstanceID) {
            uint64_t v56 = logInstanceID;
          }
          else {
            uint64_t v56 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_157;
          }
          *(_DWORD *)buf = 134217984;
          uint64_t v119 = WORD1(v56);
          char v57 = &_os_log_internal;
          id v58 = " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Met"
                "al/Composer/DolbyVisionComposer.mm\" at line 1781\n";
LABEL_156:
          _os_log_impl(&dword_22224D000, v57, OS_LOG_TYPE_DEFAULT, v58, buf, 0xCu);
LABEL_157:
          prevLogInstanceID = v56;
          BOOL v25 = v55;
LABEL_317:
          uint64_t v65 = v45 + 1;
          goto LABEL_318;
        }
        BOOL v54 = v46;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_317;
        }
        *(_WORD *)buf = 0;
        v68 = &_os_log_internal;
        v69 = " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Compose"
              "r/DolbyVisionComposer.mm\" at line 1781\n";
        goto LABEL_291;
      }
      if (v107)
      {
        if (enableLogInstance)
        {
          BOOL v54 = v46;
          BOOL v55 = v25;
          if (logInstanceID) {
            uint64_t v56 = logInstanceID;
          }
          else {
            uint64_t v56 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_157;
          }
          *(_DWORD *)buf = 134217984;
          uint64_t v119 = WORD1(v56);
          char v57 = &_os_log_internal;
          id v58 = " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Met"
                "al/Composer/DolbyVisionComposer.mm\" at line 1784\n";
          goto LABEL_156;
        }
        BOOL v54 = v46;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_317;
        }
        *(_WORD *)buf = 0;
        v68 = &_os_log_internal;
        v69 = " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Compose"
              "r/DolbyVisionComposer.mm\" at line 1784\n";
        goto LABEL_291;
      }
      uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_unpackedHDR10_ptv];

LABEL_315:
      BOOL v54 = v46;
      goto LABEL_316;
    }
    if (a25)
    {
      if (v103)
      {
        v114 = v50;
        if (a4->var12 == 2)
        {
          if (v107) {
            p_iptP422PackedPlanar_msr = &self->_iptP422PackedPlanar_msr;
          }
          else {
            p_iptP422PackedPlanar_msr = &self->_singleLayerIntegratedIPTKernelPackedPlanar_msr;
          }
        }
        else if (v107)
        {
          int v63 = &self->super.isa + v35;
          int v64 = (ComposerShader **)(v63 + 120);
          p_iptP422PackedPlanar_msr = (ComposerShader **)(v63 + 144);
          if (!a24) {
            p_iptP422PackedPlanar_msr = v64;
          }
        }
        else if (a24)
        {
          p_iptP422PackedPlanar_msr = &self->_singleLayerIntegratedKernelPackedPlanarDM4_msr[v35];
        }
        else
        {
          p_iptP422PackedPlanar_msr = &self->_singleLayerIntegratedKernelPackedPlanar_msr[v35];
        }
        BOOL v50 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:*p_iptP422PackedPlanar_msr];
      }
      v113 = v50;
      if (a9 && a25)
      {
        if (v107)
        {
          uint64_t v70 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422HDR10_msr];

          BOOL v54 = v46;
          v113 = (void *)v70;
          uint64_t v65 = v45 + 1;
          if (!v104) {
            goto LABEL_318;
          }
          goto LABEL_206;
        }
        uint64_t v71 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedHDR10_msr];

        BOOL v54 = v46;
        v113 = (void *)v71;
        uint64_t v65 = v45 + 1;
        if (v104) {
          goto LABEL_208;
        }
      }
      else
      {
        BOOL v54 = v46;
        uint64_t v65 = v45 + 1;
        if (v104)
        {
          if (v107)
          {
LABEL_206:
            uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422HLG_msr];

LABEL_316:
            v113 = (void *)v60;
            goto LABEL_317;
          }
LABEL_208:
          uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedHLG_msr];

          goto LABEL_316;
        }
      }
LABEL_318:
      [v33 setTexture:self->_outputTexture[1] atIndex:v65];
      BOOL v46 = v54;
      [v33 setTexture:self->_outputTexture[2] atIndex:v45 + 2];
      unsigned int v47 = v45 + 3;
      goto LABEL_319;
    }
    v113 = v50;
    if (*((unsigned char *)v31 + 28))
    {
      if (a11)
      {
        if (v107) {
          [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422HDR10toRGB];
        }
        else {
          [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedHDR10toRGB];
        }
        goto LABEL_256;
      }
      if (a17 || a18 || a19)
      {
        if (v107)
        {
          if ((a21 & 4) == 0)
          {
            if (a21) {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422HLGtoRGB_YUVTM_flip];
            }
            else {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422HLGtoRGB_YUVTM];
            }
            goto LABEL_256;
          }
          uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422HLGtoRGB_YUVTM_rotate];
        }
        else
        {
          if ((a21 & 4) == 0)
          {
            if (a21) {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedHLGtoRGB_YUVTM_flip];
            }
            else {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedHLGtoRGB_YUVTM];
            }
            goto LABEL_256;
          }
          uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedHLGtoRGB_YUVTM_rotate];
        }
      }
      else
      {
        unsigned int var12 = a4->var12;
        if (a9 || a10)
        {
          if (var12 == 2)
          {
            if (v107)
            {
              if (a23 == 2)
              {
                uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422DolbyIPTtoRGB_IPTTM_HLGOOTF];

                goto LABEL_315;
              }
              if (a23 == 1) {
                [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422DolbyIPTtoRGB_IPTTM_YScale];
              }
              else {
                [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422DolbyIPTtoRGB_YUVTM[v102]];
              }
            }
            else
            {
              if (a23 == 2)
              {
                uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedDolbyIPTtoRGB_IPTTM_HLGOOTF];

                goto LABEL_315;
              }
              if (a23 == 1) {
                [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedDolbyIPTtoRGB_IPTTM_YScale];
              }
              else {
                [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedDolbyIPTtoRGB_YUVTM[v102]];
              }
            }
          }
          else if (v107)
          {
            if (!a10)
            {
              uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422HDR10toRGB_YUVTM];

              goto LABEL_315;
            }
            if (a23 == 2)
            {
              uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422DolbyYUVtoRGB_IPTTM_HLGOOTF];

              goto LABEL_315;
            }
            if (a23 == 1) {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422DolbyYUVtoRGB_IPTTM_YScale];
            }
            else {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packed422DolbyYUVtoRGB_YUVTM[v102]];
            }
          }
          else
          {
            if (!a10)
            {
              uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedHDR10toRGB_YUVTM];

              goto LABEL_315;
            }
            if (a23 == 2)
            {
              uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedDolbyYUVtoRGB_IPTTM_HLGOOTF];

              goto LABEL_315;
            }
            if (a23 == 1) {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedDolbyYUVtoRGB_IPTTM_YScale];
            }
            else {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_packedDolbyYUVtoRGB_YUVTM[v102]];
            }
          }
          goto LABEL_256;
        }
        if (v107)
        {
          if (var12 != 2)
          {
            if (!v101 || !a24)
            {
              if ((a21 & 4) != 0 && a22)
              {
                uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_yuvP422PackedPlanar_rotate[v102]];
              }
              else if (a21 && a22)
              {
                uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_yuvP422PackedPlanar_flip[v102]];
              }
              else
              {
                uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_yuvP422PackedPlanar[v102]];
              }
              goto LABEL_315;
            }
            if ((a21 & 4) != 0)
            {
              uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_yuvP422PackedPlanarDM4_rotate[v102]];

              goto LABEL_315;
            }
            if (a21) {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_yuvP422PackedPlanarDM4_flip[v102]];
            }
            else {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_yuvP422PackedPlanarDM4[v102]];
            }
            goto LABEL_256;
          }
          uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_iptP422PackedPlanar[v102]];
        }
        else
        {
          if (var12 != 2)
          {
            if (!v101 || !a24)
            {
              if ((a21 & 4) != 0 && a22)
              {
                uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_singleLayerIntegratedKernelPackedPlanar_rotate[v102]];
              }
              else if (a21 && a22)
              {
                uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_singleLayerIntegratedKernelPackedPlanar_flip[v102]];
              }
              else
              {
                uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_singleLayerIntegratedKernelPackedPlanar[v102]];
              }
              goto LABEL_315;
            }
            if ((a21 & 4) != 0)
            {
              uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_singleLayerIntegratedKernelPackedPlanarDM4_rotate[v102]];

              goto LABEL_315;
            }
            if (a21) {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_singleLayerIntegratedKernelPackedPlanarDM4_flip[v102]];
            }
            else {
              [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_singleLayerIntegratedKernelPackedPlanarDM4[v102]];
            }
            goto LABEL_256;
          }
          uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_singleLayerIntegratedIPTKernelPackedPlanar[v102]];
        }
      }
      goto LABEL_315;
    }
    if (a11)
    {
      if (v107)
      {
        if (enableLogInstance)
        {
          BOOL v54 = v46;
          BOOL v55 = v25;
          if (logInstanceID) {
            uint64_t v56 = logInstanceID;
          }
          else {
            uint64_t v56 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_157;
          }
          *(_DWORD *)buf = 134217984;
          uint64_t v119 = WORD1(v56);
          char v57 = &_os_log_internal;
          id v58 = " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Met"
                "al/Composer/DolbyVisionComposer.mm\" at line 1946\n";
          goto LABEL_156;
        }
        BOOL v54 = v46;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_317;
        }
        *(_WORD *)buf = 0;
        v68 = &_os_log_internal;
        v69 = " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Compose"
              "r/DolbyVisionComposer.mm\" at line 1946\n";
        goto LABEL_291;
      }
      uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_unpackedHDR10toRGB];

      goto LABEL_315;
    }
    if (a17 || a18 || a19)
    {
      if (v107)
      {
        if (enableLogInstance)
        {
          BOOL v66 = v25;
          if (logInstanceID) {
            uint64_t v67 = logInstanceID;
          }
          else {
            uint64_t v67 = prevLogInstanceID;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v119 = WORD1(v67);
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"!inputP422\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1951\n", buf, 0xCu);
          }
          prevLogInstanceID = v67;
          BOOL v25 = v66;
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"!inputP422\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1951\n", buf, 2u);
        }
      }
      int v72 = *v31;
      if ((int)*v31 > 2016686639)
      {
        if (v72 == 2016686640 || v72 == 2019963440)
        {
          uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_unpackedHLG10toRGB_YUVTM];

          goto LABEL_315;
        }
      }
      else if (v72 == 875704422 || v72 == 875704438)
      {
        uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_unpackedHLG8toRGB_YUVTM];

        goto LABEL_315;
      }
      if (enableLogInstance)
      {
        BOOL v54 = v46;
        BOOL v55 = v25;
        if (logInstanceID) {
          uint64_t v56 = logInstanceID;
        }
        else {
          uint64_t v56 = prevLogInstanceID;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_157;
        }
        *(_DWORD *)buf = 134217984;
        uint64_t v119 = WORD1(v56);
        char v57 = &_os_log_internal;
        id v58 = " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal"
              "/Composer/DolbyVisionComposer.mm\" at line 1961\n";
        goto LABEL_156;
      }
      BOOL v54 = v46;
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_317;
      }
      *(_WORD *)buf = 0;
      v68 = &_os_log_internal;
      v69 = " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/"
            "DolbyVisionComposer.mm\" at line 1961\n";
LABEL_291:
      _os_log_impl(&dword_22224D000, v68, OS_LOG_TYPE_DEFAULT, v69, buf, 2u);
      goto LABEL_317;
    }
    BOOL v54 = v46;
    uint64_t v65 = v45 + 1;
    if (a9)
    {
      if (a4->var12 == 2)
      {
        if (enableLogInstance)
        {
          BOOL v55 = v25;
          if (logInstanceID) {
            uint64_t v56 = logInstanceID;
          }
          else {
            uint64_t v56 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_157;
          }
          *(_DWORD *)buf = 134217984;
          uint64_t v119 = WORD1(v56);
          char v57 = &_os_log_internal;
          id v58 = " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Met"
                "al/Composer/DolbyVisionComposer.mm\" at line 1965\n";
          goto LABEL_156;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_318;
        }
        *(_WORD *)buf = 0;
        v73 = &_os_log_internal;
        v74 = " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Compose"
              "r/DolbyVisionComposer.mm\" at line 1965\n";
      }
      else
      {
        if (!v107)
        {
          uint64_t v60 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_unpackedHDR10toRGB_YUVTM];

          goto LABEL_316;
        }
        if (enableLogInstance)
        {
          BOOL v55 = v25;
          if (logInstanceID) {
            uint64_t v56 = logInstanceID;
          }
          else {
            uint64_t v56 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_157;
          }
          *(_DWORD *)buf = 134217984;
          uint64_t v119 = WORD1(v56);
          char v57 = &_os_log_internal;
          id v58 = " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Met"
                "al/Composer/DolbyVisionComposer.mm\" at line 1968\n";
          goto LABEL_156;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_318;
        }
        *(_WORD *)buf = 0;
        v73 = &_os_log_internal;
        v74 = " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Compose"
              "r/DolbyVisionComposer.mm\" at line 1968\n";
      }
    }
    else
    {
      if (enableLogInstance)
      {
        BOOL v55 = v25;
        if (logInstanceID) {
          uint64_t v56 = logInstanceID;
        }
        else {
          uint64_t v56 = prevLogInstanceID;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_157;
        }
        *(_DWORD *)buf = 134217984;
        uint64_t v119 = WORD1(v56);
        char v57 = &_os_log_internal;
        id v58 = " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal"
              "/Composer/DolbyVisionComposer.mm\" at line 1974\n";
        goto LABEL_156;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_318;
      }
      *(_WORD *)buf = 0;
      v73 = &_os_log_internal;
      v74 = " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/"
            "DolbyVisionComposer.mm\" at line 1974\n";
    }
    _os_log_impl(&dword_22224D000, v73, OS_LOG_TYPE_DEFAULT, v74, buf, 2u);
    goto LABEL_318;
  }
LABEL_319:
  unsigned int v75 = v47;
  if (v113)
  {
    objc_msgSend(v33, "setComputePipelineState:");
  }
  else if (enableLogInstance)
  {
    BOOL v76 = v25;
    if (logInstanceID) {
      uint64_t v77 = logInstanceID;
    }
    else {
      uint64_t v77 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v119 = WORD1(v77);
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1983\n", buf, 0xCu);
    }
    prevLogInstanceID = v77;
    BOOL v25 = v76;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1983\n", buf, 2u);
  }
  if (!v46)
  {
    if (!v105)
    {
      if (v112) {
        goto LABEL_377;
      }
      currentPolynomialTable = self->_currentPolynomialTable;
      if (currentPolynomialTable)
      {
        [v33 setTexture:currentPolynomialTable atIndex:v75];
        [v33 setBuffer:self->_config offset:0 atIndex:0];
        ++v75;
        uint64_t v82 = 1;
      }
      else
      {
        uint64_t v82 = 0;
      }
      uint64_t v86 = 9664;
      if (a17 && a25) {
        uint64_t v86 = 9680;
      }
      [v33 setTexture:*(Class *)((char *)&self->super.isa + v86) atIndex:v75];
      BOOL v87 = a10;
      if (a23) {
        BOOL v87 = 0;
      }
      int v88 = v87 | a9 & ~a25 | a16;
      uint64_t v89 = 17896;
      if ((v103 || a15) && a24) {
        uint64_t v89 = 28176;
      }
      BOOL v90 = v88 == 0;
      uint64_t v91 = 9696;
      if (v90) {
        uint64_t v91 = v89;
      }
      [v33 setTexture:*(Class *)((char *)&self->super.isa + v91) atIndex:v75 + 1];
      uint64_t v92 = 28160;
      if (a9 && a25 || v104) {
        uint64_t v92 = 26104;
      }
      if ((v103 || a15) && a24) {
        uint64_t v92 = 28184;
      }
      uint64_t v93 = 9696;
      if (a23 - 1 >= 2 || !a10) {
        uint64_t v93 = v92;
      }
      [v33 setTexture:*(Class *)((char *)&self->super.isa + v93) atIndex:v75 + 2];
      goto LABEL_376;
    }
    uint64_t v81 = 9664;
    if (a13 || a19) {
      uint64_t v81 = 9680;
    }
    [v33 setTexture:*(Class *)((char *)&self->super.isa + v81) atIndex:v75];
    [v33 setTexture:self->_scalingFactorTable atIndex:v75 + 1];
    [v33 setTexture:self->_lumaMixFactorTable atIndex:v75 + 2];
LABEL_346:
    uint64_t v82 = 0;
LABEL_376:
    [v33 setBuffer:v111 offset:0 atIndex:v82];
    goto LABEL_377;
  }
  if (a10 && a4->var12 == 2)
  {
    unsigned int v78 = v75;
    if (!self->_currentPolynomialTable)
    {
      if (enableLogInstance)
      {
        BOOL v79 = v25;
        if (logInstanceID) {
          uint64_t v80 = logInstanceID;
        }
        else {
          uint64_t v80 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v119 = WORD1(v80);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"_currentPolynomialTable\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1990\n", buf, 0xCu);
        }
        prevLogInstanceID = v80;
        BOOL v25 = v79;
        unsigned int v78 = v75;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"_currentPolynomialTable\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1990\n", buf, 2u);
      }
    }
    [v33 setTexture:self->_currentPolynomialTable atIndex:v78];
    goto LABEL_377;
  }
  if (a17) {
    goto LABEL_346;
  }
  if (!a9 && !a10)
  {
    if (enableLogInstance)
    {
      BOOL v84 = v25;
      if (logInstanceID) {
        uint64_t v85 = logInstanceID;
      }
      else {
        uint64_t v85 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v119 = WORD1(v85);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"HDR10OnHDR10TV || DolbyOnHDR10TV\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1995\n", buf, 0xCu);
      }
      prevLogInstanceID = v85;
      BOOL v25 = v84;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"HDR10OnHDR10TV || DolbyOnHDR10TV\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 1995\n", buf, 2u);
    }
  }
LABEL_377:
  if ((a21 & 4) != 0)
  {
    unint64_t v99 = 8;
    unint64_t v98 = v108;
  }
  else
  {
    int v94 = *((unsigned __int8 *)v31 + 28);
    uint64_t v95 = 2;
    if (!a21) {
      uint64_t v95 = 8;
    }
    BOOL v90 = v94 == 0;
    BOOL v96 = v94 != 0;
    if (v90) {
      uint64_t v95 = 4;
    }
    if (v25 && v96) {
      unint64_t v97 = v108 >> 2;
    }
    else {
      unint64_t v97 = v108;
    }
    if (!v25) {
      uint64_t v95 = 16;
    }
    unint64_t v98 = v97 >> (a12 | a13);
    if (a12 || a13) {
      unint64_t v99 = 8;
    }
    else {
      unint64_t v99 = v95;
    }
  }
  if (v113)
  {
    v117[0] = (v98 + v99 - 1) / v99;
    v117[1] = (unint64_t)(v106 + 15) >> 4;
    v117[2] = 1;
    unint64_t v115 = v99;
    long long v116 = xmmword_2222D1840;
    [v33 dispatchThreadgroups:v117 threadsPerThreadgroup:&v115];
  }
  [v33 endEncoding];

  return -17000;
}

- (int64_t)embeddedSetupEncoderForGpuMatchMsrCommandBuffer:(id)a3 DMData:(id *)a4 dmConfig:(id)a5 isInput422:(BOOL)a6 orientation:(int)a7 isDolby84:(BOOL)a8 dovi50toHDR10TVMode:(unsigned int)a9 isDM4:(BOOL)a10 dpcParam:(_DpcParam *)a11 tcControl:(ToneCurve_Control *)a12 hdrControl:(id *)a13 isHDR10Content:(BOOL)a14 isHLGContent:(BOOL)a15 isDOVIContent:(BOOL)a16
{
  BOOL v16 = a8;
  char v17 = a7;
  p_inputPixelFormat = &self->_inputPixelFormat;
  id v23 = a3;
  id v73 = a5;
  id v24 = v23;
  BOOL v25 = v24;
  if (*(void *)(p_inputPixelFormat + 3)) {
    objc_msgSend(v24, "setProtectionOptions:");
  }
  double v26 = [v25 computeCommandEncoder];
  int targetTransferFunction = a12->targetTransferFunction;
  if (targetTransferFunction == 8)
  {
    char v71 = v17;
    if (a11->on) {
      int v28 = 3;
    }
    else {
      int v28 = 1;
    }
  }
  else
  {
    if (targetTransferFunction != 13)
    {
      id v34 = 0;
      uint64_t v35 = 0;
      int64_t v36 = -17013;
      goto LABEL_105;
    }
    char v71 = v17;
    int v28 = 2 * a11->on;
  }
  if (a14)
  {
    unsigned int v72 = v28;
    BOOL v69 = a15;
    BOOL v70 = a16;
    BOOL v67 = a10;
    BOOL v68 = a14;
    int v29 = *p_inputPixelFormat;
    if ((isFormatYUV(v29) & 1) == 0)
    {
      if (a13->var17 == 8) {
        uint64_t v30 = 23;
      }
      else {
        uint64_t v30 = 22;
      }
      unsigned int v31 = 2;
      goto LABEL_28;
    }
    uint64_t v30 = 27;
    unsigned int v31 = 1;
    uint64_t v32 = 1448;
    if (v29 > 1952854575)
    {
      if (v29 > 1953903151)
      {
        if (v29 == 1953903152) {
          goto LABEL_80;
        }
        if (v29 == 1953903668)
        {
LABEL_63:
          uint64_t v30 = 29;
          goto LABEL_64;
        }
        if (v29 != 1953903154)
        {
LABEL_123:
          uint64_t v30 = 20;
          unsigned int v31 = 2;
          uint64_t v32 = 1408;
          if (v29 == 2016686642 || a6) {
            goto LABEL_80;
          }
          if (v29 > 2019963955)
          {
            if (v29 != 2019963956)
            {
              if (v29 != 2033463606)
              {
LABEL_171:
                uint64_t v30 = 19;
                goto LABEL_28;
              }
              uint64_t v30 = 1;
LABEL_28:
              uint64_t v32 = 1408;
              goto LABEL_80;
            }
          }
          else
          {
            if (v29 == 1983000886)
            {
              uint64_t v30 = 11;
              unsigned int v31 = 1;
              goto LABEL_28;
            }
            if (v29 != 2016687156) {
              goto LABEL_171;
            }
          }
          uint64_t v30 = 21;
          goto LABEL_28;
        }
        goto LABEL_62;
      }
      if (v29 == 1952854576) {
        goto LABEL_80;
      }
      if (v29 == 1952854578) {
        goto LABEL_62;
      }
      int v33 = 1952855092;
    }
    else
    {
      if (v29 <= 1937125935)
      {
        if (v29 != 1936077360)
        {
          if (v29 != 1936077362)
          {
            int v33 = 1936077876;
            goto LABEL_53;
          }
LABEL_62:
          uint64_t v30 = 28;
LABEL_64:
          uint64_t v32 = 1448;
        }
LABEL_80:
        BOOL v46 = (id *)((char *)&self->super.isa + v32);
        goto LABEL_81;
      }
      if (v29 == 1937125936) {
        goto LABEL_80;
      }
      if (v29 == 1937125938) {
        goto LABEL_62;
      }
      int v33 = 1937126452;
    }
LABEL_53:
    if (v29 != v33) {
      goto LABEL_123;
    }
    goto LABEL_63;
  }
  if (a15)
  {
    unsigned int v72 = v28;
    BOOL v69 = a15;
    BOOL v70 = a16;
    BOOL v67 = a10;
    BOOL v68 = a14;
    int v37 = *p_inputPixelFormat;
    if (!isFormatYUV(v37))
    {
      uint64_t v30 = 18;
      unsigned int v31 = 2;
      goto LABEL_43;
    }
    uint64_t v30 = 24;
    unsigned int v31 = 1;
    uint64_t v32 = 1440;
    if (v37 > 1952854575)
    {
      if (v37 > 1953903151)
      {
        if (v37 == 1953903152) {
          goto LABEL_80;
        }
        if (v37 == 1953903668)
        {
LABEL_78:
          uint64_t v30 = 26;
          goto LABEL_79;
        }
        if (v37 != 1953903154) {
          goto LABEL_130;
        }
        goto LABEL_77;
      }
      if (v37 == 1952854576) {
        goto LABEL_80;
      }
      if (v37 == 1952854578) {
        goto LABEL_77;
      }
      int v38 = 1952855092;
    }
    else
    {
      if (v37 <= 1937125935)
      {
        if (v37 == 1936077360) {
          goto LABEL_80;
        }
        if (v37 != 1936077362)
        {
          int v38 = 1936077876;
          goto LABEL_72;
        }
LABEL_77:
        uint64_t v30 = 25;
LABEL_79:
        uint64_t v32 = 1440;
        goto LABEL_80;
      }
      if (v37 == 1937125936) {
        goto LABEL_80;
      }
      if (v37 == 1937125938) {
        goto LABEL_77;
      }
      int v38 = 1937126452;
    }
LABEL_72:
    if (v37 != v38)
    {
LABEL_130:
      uint64_t v30 = 16;
      unsigned int v31 = 2;
      uint64_t v32 = 1400;
      if (v37 == 2016686642 || a6) {
        goto LABEL_80;
      }
      if (v37 > 2019963955)
      {
        if (v37 != 2019963956)
        {
          if (v37 == 2033463606)
          {
            uint64_t v32 = 1400;
            uint64_t v30 = 2;
            goto LABEL_80;
          }
          goto LABEL_184;
        }
      }
      else
      {
        if (v37 == 1983000886)
        {
          uint64_t v30 = 12;
          unsigned int v31 = 1;
          goto LABEL_43;
        }
        if (v37 != 2016687156)
        {
LABEL_184:
          uint64_t v30 = 15;
          goto LABEL_43;
        }
      }
      uint64_t v30 = 17;
LABEL_43:
      uint64_t v32 = 1400;
      goto LABEL_80;
    }
    goto LABEL_78;
  }
  if (!a16)
  {
    id v34 = 0;
    uint64_t v35 = 0;
    int64_t v36 = -17014;
    goto LABEL_105;
  }
  BOOL v67 = a10;
  BOOL v68 = a14;
  BOOL v69 = 0;
  BOOL v70 = a16;
  unsigned int v72 = v28;
  if (a13->var17 == 18 && a13->var0 == 1)
  {
    int v39 = *p_inputPixelFormat;
    if (!isFormatYUV(v39))
    {
      uint64_t v30 = 18;
      int v40 = 1;
      unsigned int v31 = 2;
      BOOL v41 = a10;
      goto LABEL_159;
    }
    int v40 = 0;
    uint64_t v30 = 24;
    unsigned int v31 = 1;
    if (v39 > 1952854575)
    {
      BOOL v41 = a10;
      if (v39 > 1953903151)
      {
        if (v39 == 1953903152) {
          goto LABEL_159;
        }
        if (v39 == 1953903668) {
          goto LABEL_158;
        }
        if (v39 != 1953903154) {
          goto LABEL_177;
        }
        goto LABEL_157;
      }
      if (v39 == 1952854576) {
        goto LABEL_159;
      }
      if (v39 == 1952854578) {
        goto LABEL_157;
      }
      int v42 = 1952855092;
    }
    else
    {
      BOOL v41 = a10;
      if (v39 <= 1937125935)
      {
        if (v39 == 1936077360) {
          goto LABEL_159;
        }
        if (v39 != 1936077362)
        {
          int v42 = 1936077876;
          goto LABEL_152;
        }
LABEL_157:
        int v40 = 0;
        uint64_t v30 = 25;
        goto LABEL_159;
      }
      if (v39 == 1937125936) {
        goto LABEL_159;
      }
      if (v39 == 1937125938) {
        goto LABEL_157;
      }
      int v42 = 1937126452;
    }
LABEL_152:
    if (v39 != v42)
    {
LABEL_177:
      uint64_t v30 = 16;
      int v40 = 1;
      unsigned int v31 = 2;
      if (v39 == 2016686642 || a6) {
        goto LABEL_159;
      }
      if (v39 <= 2019963955)
      {
        if (v39 == 1983000886)
        {
          uint64_t v30 = 12;
          unsigned int v31 = 1;
          goto LABEL_194;
        }
        if (v39 != 2016687156) {
          goto LABEL_193;
        }
LABEL_191:
        uint64_t v30 = 17;
LABEL_194:
        int v40 = 1;
        goto LABEL_159;
      }
      if (v39 == 2019963956) {
        goto LABEL_191;
      }
      if (v39 != 2033463606)
      {
LABEL_193:
        uint64_t v30 = 15;
        goto LABEL_194;
      }
      int v40 = 1;
      uint64_t v30 = 2;
LABEL_159:
      uint64_t v64 = 1472;
      if (v40) {
        uint64_t v64 = 1432;
      }
      uint64_t v65 = (id *)((char *)&self->super.isa + v64);
      BOOL v62 = v40 == 0;
      uint64_t v66 = 1456;
      if (!v62) {
        uint64_t v66 = 1416;
      }
      BOOL v46 = (id *)((char *)&self->super.isa + 8 * v16 + v66);
      if (!v41) {
        BOOL v46 = v65;
      }
      goto LABEL_81;
    }
LABEL_158:
    int v40 = 0;
    uint64_t v30 = 26;
    goto LABEL_159;
  }
  int v43 = 0;
  int v44 = *p_inputPixelFormat;
  uint64_t v30 = 35;
  unsigned int v31 = 1;
  if ((int)*p_inputPixelFormat > 1952854575)
  {
    if (v44 > 1953903151)
    {
      if (v44 == 1953903152) {
        goto LABEL_116;
      }
      if (v44 == 1953903668)
      {
LABEL_115:
        int v43 = 0;
        uint64_t v30 = 37;
        goto LABEL_116;
      }
      if (v44 != 1953903154)
      {
LABEL_140:
        uint64_t v30 = 31;
        int v43 = 1;
        unsigned int v31 = 2;
        if (v44 == 2016686642 || a6) {
          goto LABEL_116;
        }
        if (v44 > 2019963955)
        {
          if (v44 != 2019963956)
          {
            if (v44 != 2033463606)
            {
LABEL_186:
              uint64_t v30 = 30;
              goto LABEL_187;
            }
            uint64_t v30 = 34;
LABEL_187:
            int v43 = 1;
            goto LABEL_116;
          }
        }
        else
        {
          if (v44 == 1983000886)
          {
            uint64_t v30 = 33;
            unsigned int v31 = 1;
            goto LABEL_187;
          }
          if (v44 != 2016687156) {
            goto LABEL_186;
          }
        }
        uint64_t v30 = 32;
        goto LABEL_187;
      }
    }
    else
    {
      if (v44 == 1952854576) {
        goto LABEL_116;
      }
      if (v44 != 1952854578)
      {
        int v45 = 1952855092;
        goto LABEL_109;
      }
    }
LABEL_114:
    int v43 = 0;
    uint64_t v30 = 36;
    goto LABEL_116;
  }
  if (v44 > 1937125935)
  {
    if (v44 == 1937125936) {
      goto LABEL_116;
    }
    if (v44 != 1937125938)
    {
      int v45 = 1937126452;
LABEL_109:
      if (v44 != v45) {
        goto LABEL_140;
      }
      goto LABEL_115;
    }
    goto LABEL_114;
  }
  if (v44 != 1936077360)
  {
    if (v44 != 1936077362)
    {
      int v45 = 1936077876;
      goto LABEL_109;
    }
    goto LABEL_114;
  }
LABEL_116:
  uint64_t v60 = 1496;
  if (v43) {
    uint64_t v60 = 1480;
  }
  BOOL v61 = (id *)((char *)&self->super.isa + v60);
  BOOL v62 = v43 == 0;
  uint64_t v63 = 1504;
  if (!v62) {
    uint64_t v63 = 1488;
  }
  BOOL v46 = (id *)((char *)&self->super.isa + v63);
  if (a4->var12 != 2) {
    BOOL v46 = v61;
  }
LABEL_81:
  id v34 = *v46;
  unint64_t v47 = [(MTLTexture *)self->_blTexture width];
  uint64_t v48 = [(MTLTexture *)self->_blTexture height];
  [v26 setTexture:self->_blTexture atIndex:0];
  blTextureUV = self->_blTextureUV;
  if (blTextureUV)
  {
    [v26 setTexture:blTextureUV atIndex:1];
    unsigned int v50 = 2;
  }
  else
  {
    unsigned int v50 = 1;
  }
  [v26 setTexture:self->_outputTexture[0] atIndex:v50];
  if (!v34)
  {
    uint64_t v35 = 0;
    goto LABEL_92;
  }
  uint64_t v35 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:v34 input:v30 output:v72];
  if (!v35)
  {
LABEL_92:
    int64_t v36 = -17005;
    goto LABEL_105;
  }
  [v26 setComputePipelineState:v35];
  uint64_t v51 = v50 + 1;
  if (v70)
  {
    currentPolynomialTable = self->_currentPolynomialTable;
    if (currentPolynomialTable)
    {
      [v26 setTexture:currentPolynomialTable atIndex:v51];
      LODWORD(v51) = v50 + 2;
    }
  }
  int v53 = v51;
  if (v69)
  {
    [v26 setTexture:self->_hlg2LTable atIndex:v51];
    LODWORD(v54) = v53 + 1;
  }
  else
  {
    [v26 setTexture:self->_pq2LTable atIndex:v51];
    uint64_t v54 = (v53 + 1);
    if (!v68)
    {
      if (v67)
      {
        [v26 setTexture:self->_dm4_tLutI atIndex:v54];
        uint64_t v56 = 28184;
      }
      else
      {
        [v26 setTexture:self->_scalingFactorTable atIndex:v54];
        uint64_t v56 = 28160;
      }
      [v26 setTexture:*(Class *)((char *)&self->super.isa + v56) atIndex:(v53 + 2)];
      unint64_t v55 = 16;
      goto LABEL_99;
    }
  }
  [v26 setTexture:self->_scalingFactorTable atIndex:v54];
  [v26 setTexture:self->_lumaMixFactorTable atIndex:(v53 + 2)];
  unint64_t v55 = 8;
LABEL_99:
  [v26 setBuffer:v73 offset:0 atIndex:0];
  if ((v71 & 4) != 0) {
    unint64_t v55 = 8;
  }
  v79[0] = (v55 + v47 / v31 - 1) / v55;
  v79[1] = (unint64_t)(v48 + 15) >> 4;
  v79[2] = 1;
  unint64_t v77 = v55;
  long long v78 = xmmword_2222D1840;
  [v26 dispatchThreadgroups:v79 threadsPerThreadgroup:&v77];
  Config = GetConfig((HDRConfig *)[v26 endEncoding]);
  if (Config)
  {
    id v58 = GetConfig((HDRConfig *)Config);
    if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v58, 0x39u, 0))
    {
      v76[0] = 0;
      v76[1] = v76;
      v76[2] = 0x2020000000;
      v76[3] = self->_frameIndex;
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = __218__DolbyVisionComposer_embeddedSetupEncoderForGpuMatchMsrCommandBuffer_DMData_dmConfig_isInput422_orientation_isDolby84_dovi50toHDR10TVMode_isDM4_dpcParam_tcControl_hdrControl_isHDR10Content_isHLGContent_isDOVIContent___block_invoke;
      v74[3] = &unk_264605C18;
      v74[4] = self;
      v74[5] = v76;
      v74[6] = v55;
      long long v75 = xmmword_2222D1840;
      [v25 addCompletedHandler:v74];
      _Block_object_dispose(v76, 8);
    }
  }
  int64_t v36 = -17000;
LABEL_105:

  return v36;
}

void __218__DolbyVisionComposer_embeddedSetupEncoderForGpuMatchMsrCommandBuffer_DMData_dmConfig_isInput422_orientation_isDolby84_dovi50toHDR10TVMode_isDM4_dpcParam_tcControl_hdrControl_isHDR10Content_isHLGContent_isDOVIContent___block_invoke(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 GPUEndTime];
  double v5 = v4;
  [v3 GPUStartTime];
  *(float *)&double v6 = (v5 - v6) * 1000.0;
  *(_DWORD *)(a1[4] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24) % 0x12CuLL) + 40532) = LODWORD(v6);
  double v7 = *(double *)(*(void *)(a1[5] + 8) + 24);
  if (v7 != 0.0 && *(void *)&v7 % 0x12CuLL == 0)
  {
    uint64_t v9 = 0;
    float v11 = 0.0;
    float v12 = 0.0;
    do
    {
      uint64_t v10 = a1[4] + 40532;
      float v13 = *(float *)(v10 + v9);
      float v11 = v11 + v13;
      if (v12 <= v13) {
        float v12 = *(float *)(v10 + v9);
      }
      v9 += 4;
    }
    while (v9 != 1200);
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v14 = logInstanceID;
      }
      else {
        uint64_t v14 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134219264;
        uint64_t v15 = a1[6];
        uint64_t v16 = a1[7];
        *(void *)&double v20 = WORD1(v14);
        __int16 v21 = 2048;
        double v22 = v7;
        __int16 v23 = 2048;
        double v24 = (float)(v11 / 300.0);
        __int16 v25 = 2048;
        *(double *)double v26 = v12;
        *(_WORD *)&v26[8] = 1024;
        int v27 = v15;
        __int16 v28 = 1024;
        int v29 = v16;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx [frame_%llu] scheduled2completed: avg: %5.1f, max: %5.1f [in ms], [ %d : %d ]\n", (uint8_t *)&v19, 0x36u);
      }
      prevLogInstanceID = v14;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134219008;
      uint64_t v17 = a1[6];
      uint64_t v18 = a1[7];
      double v20 = v7;
      __int16 v21 = 2048;
      double v22 = (float)(v11 / 300.0);
      __int16 v23 = 2048;
      double v24 = v12;
      __int16 v25 = 1024;
      *(_DWORD *)double v26 = v17;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = v18;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] [frame_%llu] scheduled2completed: avg: %5.1f, max: %5.1f [in ms], [ %d : %d ]\n", (uint8_t *)&v19, 0x2Cu);
    }
  }
}

- (int64_t)encodeDualLayerToCommandBuffer:(id)a3 BL:(__IOSurface *)a4 EL:(__IOSurface *)a5 Output:(__IOSurface *)a6 MetaData:(id *)a7 tcControl:(ToneCurve_Control *)a8
{
  p_yuvCombinedCompose = &self->_yuvCombinedCompose;
  id v11 = a3;
  if (p_yuvCombinedCompose[1])
  {
    [(DolbyVisionComposer *)self encodeSubsampleLumaHorizontalToCommandBuffer:v11];
    [(DolbyVisionComposer *)self encodeSubsampleLumaVerticalToCommandBuffer:v11];
  }
  if (*p_yuvCombinedCompose)
  {
    [(DolbyVisionComposer *)self encodeComposeCombinedToCommandBuffer:v11];
  }
  else
  {
    [(DolbyVisionComposer *)self encodeComposeLumaToCommandBuffer:v11];
    [(DolbyVisionComposer *)self encodeComposeChromaToCommandBuffer:v11 withMetaData:a7];
  }

  return -17000;
}

- (void)initBuffers
{
  id v23 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v23 setTextureType:0];
  [v23 setHeight:1];
  [v23 setWidth:3072];
  [v23 setDepth:1];
  [v23 setPixelFormat:23];
  [v23 setArrayLength:1];
  [v23 setMipmapLevelCount:1];
  uint64_t v3 = 0;
  polynomialTables = self->_polynomialTables;
  do
  {
    uint64_t v5 = [(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v23];
    double v6 = polynomialTables[v3];
    polynomialTables[v3] = (MTLTexture *)v5;

    ++v3;
  }
  while (v3 != 3);
  uint64_t v7 = 0;
  configBuffers = self->_configBuffers;
  do
  {
    uint64_t v9 = [(MTLDeviceSPI *)self->_device newBufferWithLength:272 options:0];
    uint64_t v10 = configBuffers[v7];
    configBuffers[v7] = (MTLBuffer *)v9;

    ++v7;
  }
  while (v7 != 3);
  id v11 = &self->_ambientHeadroomAdaptationLut[1000];
  int32x4_t v12 = (int32x4_t)xmmword_2222D1810;
  float32x4_t v13 = (float32x4_t)vdupq_n_s32(0x3A828C14u);
  uint64_t v14 = 1000;
  float64x2_t v15 = (float64x2_t)vdupq_n_s64(0x3F747AE147AE147BuLL);
  __asm { FMOV            V3.4S, #1.0 }
  v21.i64[0] = 0x400000004;
  v21.i64[1] = 0x400000004;
  do
  {
    float32x4_t v22 = vmulq_f32(vcvtq_f32_s32(v12), v13);
    *((float32x4_t *)v11 - 250) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v22.f32), v15)), vaddq_f64(vcvt_hight_f64_f32(v22), v15));
    *(_OWORD *)id v11 = _Q3;
    v11 += 4;
    int32x4_t v12 = vaddq_s32(v12, v21);
    v14 -= 4;
  }
  while (v14);
}

- (void)setupInputBuffersWithMetadata:(id *)a3
{
  objc_storeStrong((id *)&self->_config, self->_configBuffers[self->_frameIndex % 3]);
  objc_storeStrong((id *)&self->_currentPolynomialTable, self->_polynomialTables[self->_frameIndex % 3]);
  char v5 = a3->var0 + 8;
  [(DolbyVisionComposer *)self setupComposerKernelConfiguration:[(MTLBuffer *)self->_config contents] fromMetaData:a3];
  double v6 = malloc_type_malloc(6 << v5, 0x42BCCEAAuLL);
  int v7 = 0;
  unsigned int v8 = a3->var0 + 8;
  do
  {
    createPolynomialTableForComponent((int *)a3, v7, (uint64_t)v6 + 2 * (v7 << v8));
    ++v7;
  }
  while (v7 != 3);
  currentPolynomialTable = self->_currentPolynomialTable;
  memset(v15, 0, 24);
  v15[3] = (3 << v5);
  int64x2_t v16 = vdupq_n_s64(1uLL);
  [(MTLTexture *)currentPolynomialTable replaceRegion:v15 mipmapLevel:0 slice:0 withBytes:v6 bytesPerRow:6 << v5 bytesPerImage:0];
  free(v6);
  if (!a3->var32)
  {
    uint64_t v10 = (MTLBuffer *)[(MTLDeviceSPI *)self->_device newBufferWithLength:4 * (3 << v5) options:0];
    dequantizelTable = self->_dequantizelTable;
    self->_dequantizelTable = v10;

    uint64_t v12 = [(MTLBuffer *)self->_dequantizelTable contents];
    unsigned int v13 = 0;
    unsigned int v14 = a3->var1 + 8;
    do
    {
      createNlqTableForComponent((uint64_t)a3, v13, v12 + 4 * (v13 << v14));
      ++v13;
    }
    while (v13 != 3);
  }
}

- (int64_t)setupInputTexturesWithBL:(__IOSurface *)a3 EL:(__IOSurface *)a4 Output:(__IOSurface *)a5 MetaData:(id *)a6
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  p_srcFormat = &self->_srcFormat;
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a3);
  unsigned int *p_srcFormat = PixelFormat;
  p_srcFormat[2] = PixelFormat;
  if (*((unsigned char *)p_srcFormat + 3096)) {
    p_srcFormat[2] = getFourCCforType(PixelFormat);
  }
  *(void *)(p_srcFormat + 5) = IOSurfaceGetProtectionOptions();
  *(void *)(p_srcFormat + 7) = IOSurfaceGetProtectionOptions();
  size_t PlaneCount = IOSurfaceGetPlaneCount(a5);
  size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(a3, 0);
  size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(a3, 0);
  int v14 = p_srcFormat[2];
  if (!a6->var0)
  {
    if (v14 > 2016686639)
    {
      unsigned int v15 = 1;
      unsigned int v16 = 2;
      uint64_t v62 = 0;
      uint64_t v63 = 525;
      if (v14 == 2016686640 || v14 == 2019963440) {
        goto LABEL_104;
      }
    }
    else if (v14 == 1882468912 || v14 == 1885745712)
    {
      uint64_t v62 = 0;
      unsigned int v15 = 1;
      unsigned int v16 = 2;
      uint64_t v17 = 528;
LABEL_27:
      uint64_t v63 = v17;
      objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v17, WidthOfPlane, HeightOfPlane, 0, a4);
      goto LABEL_105;
    }
    uint64_t v62 = 0;
    unsigned int v15 = 1;
    unsigned int v16 = 2;
    uint64_t v17 = 520;
    goto LABEL_27;
  }
  if (v14 > 1937126451)
  {
    if (v14 > 1999843441)
    {
      if (v14 > 2016687155)
      {
        if (v14 > 2019963441)
        {
          if (v14 != 2019963442)
          {
            if (v14 != 2019963956)
            {
              if (v14 == 2033463606)
              {
                uint64_t v62 = 0;
LABEL_77:
                unsigned int v15 = 1;
                unsigned int v16 = 2;
                uint64_t v63 = 110;
                goto LABEL_103;
              }
              goto LABEL_147;
            }
            goto LABEL_84;
          }
          goto LABEL_66;
        }
        if (v14 == 2016687156)
        {
LABEL_84:
          *((unsigned char *)p_srcFormat + 36) = 0;
          if (PlaneCount == 3)
          {
            if (!enableLogInstance)
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                return -17007;
              }
              goto LABEL_137;
            }
            if (logInstanceID) {
              uint64_t v24 = logInstanceID;
            }
            else {
              uint64_t v24 = prevLogInstanceID;
            }
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_135;
            }
            goto LABEL_134;
          }
          unsigned int v15 = 1;
          unsigned int v16 = 2;
          uint64_t v21 = 545;
          goto LABEL_102;
        }
        if (v14 != 2019963440) {
          goto LABEL_147;
        }
LABEL_93:
        if (PlaneCount != 3 || *((unsigned char *)p_srcFormat + 3096))
        {
          uint64_t v18 = 543;
          goto LABEL_96;
        }
        WidthOfPlane >>= 2;
        uint64_t v63 = 113;
        uint64_t v59 = 63;
        goto LABEL_161;
      }
      if (v14 > 2016686639)
      {
        if (v14 != 2016686640)
        {
          if (v14 == 2016686642)
          {
LABEL_66:
            if (PlaneCount == 3 && !*((unsigned char *)p_srcFormat + 3096))
            {
              WidthOfPlane >>= 2;
              uint64_t v63 = 113;
              uint64_t v62 = 63;
            }
            else
            {
              uint64_t v62 = 0;
              uint64_t v63 = 544;
            }
            *((unsigned char *)p_srcFormat + 36) = 0;
            unsigned int v16 = 1;
            goto LABEL_92;
          }
LABEL_147:
          if (!enableLogInstance)
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              return -17007;
            }
            goto LABEL_137;
          }
          if (logInstanceID) {
            uint64_t v24 = logInstanceID;
          }
          else {
            uint64_t v24 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_135;
          }
LABEL_134:
          unsigned int v51 = *p_srcFormat;
          *(_DWORD *)buf = 134220546;
          uint64_t v66 = (const char *)WORD1(v24);
          __int16 v67 = 2080;
          *(void *)BOOL v68 = "-[DolbyVisionComposer setupInputTexturesWithBL:EL:Output:MetaData:]";
          *(_WORD *)&v68[8] = 1024;
          *(_DWORD *)BOOL v69 = v51;
          *(_WORD *)&v69[4] = 1024;
          *(_DWORD *)BOOL v70 = HIBYTE(v51);
          *(_WORD *)&v70[4] = 1024;
          *(_DWORD *)char v71 = BYTE2(v51);
          *(_WORD *)&v71[4] = 1024;
          *(_DWORD *)unsigned int v72 = BYTE1(v51);
          *(_WORD *)&v72[4] = 1024;
          *(_DWORD *)id v73 = v51;
          *(_WORD *)&v73[4] = 1024;
          *(_DWORD *)v74 = HIBYTE(v14);
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)long long v75 = BYTE2(v14);
          *(_WORD *)&v75[4] = 1024;
          int v76 = BYTE1(v14);
          __int16 v77 = 1024;
          int v78 = v14;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : format (%d) %c%c%c%c [%c%c%c%c]is not supported yet\n", buf, 0x4Cu);
LABEL_135:
          prevLogInstanceID = v24;
          return -17007;
        }
        goto LABEL_93;
      }
      if (v14 != 1999843442)
      {
        if (v14 != 1999908961) {
          goto LABEL_147;
        }
        unsigned int v15 = 1;
        unsigned int v16 = 2;
        uint64_t v21 = 552;
        goto LABEL_102;
      }
LABEL_43:
      unsigned int v15 = 1;
      unsigned int v16 = 2;
      uint64_t v21 = 554;
      goto LABEL_102;
    }
    if (v14 <= 1953903151)
    {
      if (v14 <= 1952854577)
      {
        if (v14 != 1937126452)
        {
          int v19 = 1952854576;
          goto LABEL_62;
        }
        goto LABEL_78;
      }
      if (v14 != 1952854578)
      {
        int v23 = 1952855092;
LABEL_58:
        if (v14 != v23) {
          goto LABEL_147;
        }
        goto LABEL_78;
      }
      goto LABEL_82;
    }
    if (v14 > 1953903667)
    {
      if (v14 != 1953903668)
      {
        if (v14 == 1983000886)
        {
          uint64_t v62 = 0;
          WidthOfPlane >>= 1;
          goto LABEL_77;
        }
        goto LABEL_147;
      }
LABEL_78:
      unsigned int v16 = 1;
      uint64_t v63 = 23;
      uint64_t v62 = 63;
LABEL_92:
      unsigned int v15 = 1;
      goto LABEL_103;
    }
    if (v14 == 1953903152) {
      goto LABEL_83;
    }
    int v22 = 1953903154;
    goto LABEL_81;
  }
  if (v14 > 1882468913)
  {
    if (v14 > 1936077361)
    {
      if (v14 <= 1937125935)
      {
        if (v14 != 1936077362)
        {
          int v23 = 1936077876;
          goto LABEL_58;
        }
LABEL_82:
        unsigned int v15 = 2;
        unsigned int v16 = 1;
        uint64_t v63 = 23;
        uint64_t v62 = 63;
        goto LABEL_103;
      }
      if (v14 == 1937125936) {
        goto LABEL_83;
      }
      int v22 = 1937125938;
LABEL_81:
      if (v14 != v22) {
        goto LABEL_147;
      }
      goto LABEL_82;
    }
    if (v14 > 1885745713)
    {
      if (v14 != 1885745714)
      {
        int v19 = 1936077360;
LABEL_62:
        if (v14 != v19) {
          goto LABEL_147;
        }
LABEL_83:
        unsigned int v16 = 2;
        uint64_t v63 = 23;
        uint64_t v62 = 63;
        unsigned int v15 = 2;
        goto LABEL_103;
      }
    }
    else if (v14 != 1882468914)
    {
      int v20 = 1885745712;
      goto LABEL_72;
    }
    unsigned int v16 = 1;
    *((unsigned char *)p_srcFormat + 36) = 1;
    uint64_t v62 = 0;
    uint64_t v63 = 547;
    goto LABEL_92;
  }
  if (v14 > 1380411456)
  {
    if (v14 <= 1815162993)
    {
      if (v14 == 1380411457)
      {
        unsigned int v15 = 1;
        unsigned int v16 = 2;
        uint64_t v21 = 115;
        goto LABEL_102;
      }
      if (v14 != 1647534392) {
        goto LABEL_147;
      }
      goto LABEL_43;
    }
    if (v14 == 1815162994)
    {
      unsigned int v15 = 1;
      unsigned int v16 = 2;
      uint64_t v21 = 94;
      goto LABEL_102;
    }
    int v20 = 1882468912;
LABEL_72:
    if (v14 != v20) {
      goto LABEL_147;
    }
    unsigned int v15 = 1;
    *((unsigned char *)p_srcFormat + 36) = 1;
    unsigned int v16 = 2;
    uint64_t v21 = 546;
    goto LABEL_102;
  }
  if (v14 <= 1111970368)
  {
    if (v14 != 875704422 && v14 != 875704438) {
      goto LABEL_147;
    }
    if (PlaneCount != 3 || *((unsigned char *)p_srcFormat + 3096))
    {
      uint64_t v18 = 540;
LABEL_96:
      uint64_t v62 = 0;
      uint64_t v63 = v18;
LABEL_97:
      *((unsigned char *)p_srcFormat + 36) = 0;
      unsigned int v15 = 1;
      unsigned int v16 = 2;
      goto LABEL_103;
    }
    WidthOfPlane >>= 2;
    uint64_t v63 = 70;
    uint64_t v59 = 30;
LABEL_161:
    uint64_t v62 = v59;
    goto LABEL_97;
  }
  if (v14 == 1111970369)
  {
    unsigned int v15 = 1;
    unsigned int v16 = 2;
    uint64_t v21 = 80;
  }
  else
  {
    if (v14 != 1378955371) {
      goto LABEL_147;
    }
    unsigned int v15 = 1;
    unsigned int v16 = 2;
    uint64_t v21 = 90;
  }
LABEL_102:
  uint64_t v62 = 0;
  uint64_t v63 = v21;
LABEL_103:
  if (!*((unsigned char *)p_srcFormat + 3096))
  {
    if (v14 <= 1815162993)
    {
      if (v14 == 1111970369 || v14 == 1378955371) {
        goto LABEL_129;
      }
      int v50 = 1647534392;
    }
    else
    {
      if (v14 <= 1999843441)
      {
        if (v14 != 1815162994)
        {
          int v50 = 1937125936;
          goto LABEL_128;
        }
LABEL_129:
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v24 = logInstanceID;
          }
          else {
            uint64_t v24 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_135;
          }
          goto LABEL_134;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          return -17007;
        }
LABEL_137:
        unsigned int v52 = *p_srcFormat;
        unsigned int v53 = HIBYTE(*p_srcFormat);
        int v54 = BYTE2(*p_srcFormat);
        *(_DWORD *)buf = 136317442;
        uint64_t v66 = "-[DolbyVisionComposer setupInputTexturesWithBL:EL:Output:MetaData:]";
        __int16 v67 = 1024;
        *(_DWORD *)BOOL v68 = v52;
        *(_WORD *)&v68[4] = 1024;
        *(_DWORD *)&v68[6] = v53;
        *(_WORD *)BOOL v69 = 1024;
        *(_DWORD *)&v69[2] = v54;
        *(_WORD *)BOOL v70 = 1024;
        *(_DWORD *)&v70[2] = BYTE1(v52);
        *(_WORD *)char v71 = 1024;
        *(_DWORD *)&v71[2] = v52;
        *(_WORD *)unsigned int v72 = 1024;
        *(_DWORD *)&v72[2] = HIBYTE(v14);
        *(_WORD *)id v73 = 1024;
        *(_DWORD *)&v73[2] = BYTE2(v14);
        *(_WORD *)v74 = 1024;
        *(_DWORD *)&v74[2] = BYTE1(v14);
        *(_WORD *)long long v75 = 1024;
        *(_DWORD *)&v75[2] = v14;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : format (%d) %c%c%c%c [%c%c%c%c]is not supported yet\n", buf, 0x42u);
        return -17007;
      }
      if (v14 == 1999908961) {
        goto LABEL_129;
      }
      int v50 = 1999843442;
    }
LABEL_128:
    if (v14 != v50) {
      goto LABEL_104;
    }
    goto LABEL_129;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v63, WidthOfPlane, HeightOfPlane, 0, a4);
  __int16 v25 = LABEL_105:;
  double v26 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v25 iosurface:a3 plane:0];
  blTexture = self->_blTexture;
  self->_blTexture = v26;

  if (PlaneCount != 3 || *((unsigned char *)p_srcFormat + 36) || *((unsigned char *)p_srcFormat + 3096))
  {
    blTextureUV = self->_blTextureUV;
    self->_blTextureUV = 0;

    uint64_t v29 = v62;
    if (v62 && *((unsigned char *)p_srcFormat + 3096))
    {
      uint64_t v30 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v62 width:WidthOfPlane / v15 height:HeightOfPlane / v16 mipmapped:0];
      unsigned int v31 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v30 iosurface:a3 plane:1];
      uint64_t v32 = self->_blTextureUV;
      self->_blTextureUV = v31;
    }
  }
  else
  {
    if (!v62)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v55 = logInstanceID;
        }
        else {
          uint64_t v55 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v66 = (const char *)WORD1(v55);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"chromaPixelFormat != MTLPixelFormatInvalid\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 3737\n", buf, 0xCu);
        }
        prevLogInstanceID = v55;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"chromaPixelFormat != MTLPixelFormatInvalid\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/DolbyVisionComposer.mm\" at line 3737\n", buf, 2u);
      }
    }
    uint64_t v56 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v62 width:2 * WidthOfPlane height:HeightOfPlane / v16 mipmapped:0];
    char v57 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v56 iosurface:a3 plane:1];
    id v58 = self->_blTextureUV;
    self->_blTextureUV = v57;

    uint64_t v29 = v62;
  }
  if (*((unsigned char *)p_srcFormat + 3098) && a6->var14[0][0][1][0])
  {
    size_t v33 = WidthOfPlane >> 1;
    id v34 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v63 width:WidthOfPlane >> 1 height:WidthOfPlane mipmapped:0];
    [v34 setUsage:3];
    uint64_t v35 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v29 width:v33 height:HeightOfPlane >> 1 mipmapped:0];
    [v35 setUsage:3];
    int64_t v36 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v34];
    blSubsampledTempTexture = self->_blSubsampledTempTexture;
    self->_blSubsampledTempTexture = v36;

    int v38 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v35];
    blSubsampledTexture = self->_blSubsampledTexture;
    self->_blSubsampledTexture = v38;
  }
  else
  {
    int v40 = self->_blSubsampledTempTexture;
    self->_blSubsampledTempTexture = 0;

    id v34 = self->_blSubsampledTexture;
    self->_blSubsampledTexture = 0;
  }

  if (buffera)
  {
    if (!a6->var32)
    {
      size_t v41 = IOSurfaceGetWidthOfPlane(buffera, 0);
      size_t v42 = IOSurfaceGetHeightOfPlane(buffera, 0);
      int v43 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v63 width:v41 height:v42 mipmapped:0];
      int v44 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v62 width:v41 >> 1 height:v42 >> 1 mipmapped:0];
      int v45 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v43 iosurface:buffera plane:0];
      elTexture = self->_elTexture;
      self->_elTexture = v45;

      unint64_t v47 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v44 iosurface:buffera plane:1];
      elTextureUV = self->_elTextureUV;
      self->_elTextureUV = v47;
    }
  }

  return -17000;
}

- (int64_t)setupOutputTexturesWithBuffer:(__IOSurface *)a3 orientation:(int)a4 ptvMode:(BOOL)a5
{
  BOOL v5 = a5;
  char v6 = a4;
  size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(a3, 0);
  size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(a3, 0);
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a3);
  self->_dstFormat = PixelFormat;
  self->_outputuint64_t PixelFormat = PixelFormat;
  if (self->_enableGpuTmMatchMSR)
  {
    LODWORD(PixelFormat) = getFourCCforType(PixelFormat);
    self->_outputuint64_t PixelFormat = PixelFormat;
  }
  if ((int)PixelFormat <= 1919365991)
  {
    if (PixelFormat == 1380411457)
    {
      uint64_t v12 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:115 width:WidthOfPlane height:HeightOfPlane mipmapped:0];
      setTextureDescriptorOptions(v12, self->_outputProtectionOptions);
      unsigned int v13 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v12 iosurface:a3 plane:0];
      goto LABEL_23;
    }
    if (PixelFormat == 1815162994)
    {
      uint64_t v12 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:90 width:WidthOfPlane height:HeightOfPlane mipmapped:0];
      unsigned int v13 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v12 iosurface:a3 plane:0];
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v12 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:113 width:WidthOfPlane >> 2 height:HeightOfPlane mipmapped:0];
    double v26 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:63 width:WidthOfPlane >> 1 height:HeightOfPlane >> 1 mipmapped:0];
    setTextureDescriptorOptions(v12, self->_outputProtectionOptions);
    setTextureDescriptorOptions(v26, self->_outputProtectionOptions);
    __int16 v28 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v12 iosurface:a3 plane:0];
    uint64_t v29 = self->_outputTexture[0];
    self->_outputTexture[0] = v28;

    uint64_t v30 = self->_outputTexture[1];
    self->_outputTexture[1] = 0;

    unsigned int v31 = self->_outputTexture[2];
    self->_outputTexture[2] = 0;

    uint64_t v32 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v26 iosurface:a3 plane:1];
    outputTextureUV = self->_outputTextureUV;
    self->_outputTextureUV = v32;

    goto LABEL_25;
  }
  if (PixelFormat == 1919365992)
  {
    uint64_t v14 = 25;
    if ((v6 & 4) != 0)
    {
      size_t v15 = WidthOfPlane;
    }
    else
    {
      uint64_t v14 = 115;
      size_t v15 = WidthOfPlane >> 2;
    }
    if (v5) {
      uint64_t v16 = 113;
    }
    else {
      uint64_t v16 = v14;
    }
    if (v5) {
      size_t v17 = WidthOfPlane >> 2;
    }
    else {
      size_t v17 = v15;
    }
    uint64_t v12 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v16 width:v17 height:HeightOfPlane mipmapped:0];
    setTextureDescriptorOptions(v12, self->_outputProtectionOptions);
    uint64_t v18 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v12 iosurface:a3 plane:0];
    int v19 = self->_outputTexture[0];
    self->_outputTexture[0] = v18;

    int v20 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v12 iosurface:a3 plane:1];
    uint64_t v21 = self->_outputTexture[1];
    self->_outputTexture[1] = v20;

    int v22 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v12 iosurface:a3 plane:2];
    int v23 = self->_outputTexture[2];
    self->_outputTexture[2] = v22;
    goto LABEL_24;
  }
  if (PixelFormat == 1999843442)
  {
    uint64_t v12 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:555 width:WidthOfPlane height:HeightOfPlane mipmapped:0];
    setTextureDescriptorOptions(v12, self->_outputProtectionOptions);
    unsigned int v13 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v12 iosurface:a3 plane:0];
    goto LABEL_23;
  }
  if (PixelFormat != 2021078128) {
    goto LABEL_26;
  }
  uint64_t v12 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:524 width:WidthOfPlane height:HeightOfPlane mipmapped:0];
  setTextureDescriptorOptions(v12, self->_outputProtectionOptions);
  unsigned int v13 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v12 iosurface:a3 plane:0];
LABEL_23:
  uint64_t v24 = self->_outputTexture[0];
  self->_outputTexture[0] = v13;

  __int16 v25 = self->_outputTexture[1];
  self->_outputTexture[1] = 0;

  int v23 = self->_outputTexture[2];
  self->_outputTexture[2] = 0;
LABEL_24:

  double v26 = self->_outputTextureUV;
  self->_outputTextureUV = 0;
LABEL_25:

  return -17000;
}

- (void)encodeSubsampleLumaHorizontalToCommandBuffer:(id)a3
{
  double v4 = [a3 computeCommandEncoder];
  uint64_t v5 = [(MTLTexture *)self->_blSubsampledTempTexture width];
  uint64_t v6 = [(MTLTexture *)self->_blSubsampledTempTexture height];
  int v7 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_horizontalHalfLumaKernel];
  [v4 setComputePipelineState:v7];

  [v4 setTexture:self->_blTexture atIndex:0];
  [v4 setTexture:self->_blSubsampledTempTexture atIndex:1];
  v10[0] = (unint64_t)(v5 + 15) >> 4;
  v10[1] = (unint64_t)(v6 + 15) >> 4;
  v10[2] = 1;
  int64x2_t v8 = vdupq_n_s64(0x10uLL);
  uint64_t v9 = 1;
  [v4 dispatchThreadgroups:v10 threadsPerThreadgroup:&v8];
  [v4 endEncoding];
}

- (void)encodeSubsampleLumaVerticalToCommandBuffer:(id)a3
{
  double v4 = [a3 computeCommandEncoder];
  uint64_t v5 = [(MTLTexture *)self->_blSubsampledTexture width];
  uint64_t v6 = [(MTLTexture *)self->_blSubsampledTexture height];
  int v7 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_verticalHalfLumaKernel];
  [v4 setComputePipelineState:v7];

  [v4 setTexture:self->_blSubsampledTempTexture atIndex:0];
  [v4 setTexture:self->_blSubsampledTexture atIndex:1];
  v10[0] = (unint64_t)(v5 + 15) >> 4;
  v10[1] = (unint64_t)(v6 + 15) >> 4;
  v10[2] = 1;
  int64x2_t v8 = vdupq_n_s64(0x10uLL);
  uint64_t v9 = 1;
  [v4 dispatchThreadgroups:v10 threadsPerThreadgroup:&v8];
  [v4 endEncoding];
}

- (void)encodeComposeLumaToCommandBuffer:(id)a3
{
  double v4 = [a3 computeCommandEncoder];
  unint64_t v5 = [(MTLTexture *)self->_blTexture width];
  uint64_t v6 = [(MTLTexture *)self->_blTexture height];
  int v7 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_composeLumaKernel];
  [v4 setComputePipelineState:v7];

  [v4 setTexture:self->_blTexture atIndex:0];
  [v4 setTexture:self->_elTexture atIndex:1];
  [v4 setTexture:self->_outputTexture[0] atIndex:2];
  [v4 setBuffer:self->_currentPolynomialTable offset:0 atIndex:0];
  [v4 setBuffer:self->_dequantizelTable offset:0 atIndex:1];
  [v4 setBuffer:self->_config offset:0 atIndex:2];
  v10[0] = ((v5 >> 2) + 15) >> 4;
  v10[1] = (unint64_t)(v6 + 15) >> 4;
  v10[2] = 1;
  int64x2_t v8 = vdupq_n_s64(0x10uLL);
  uint64_t v9 = 1;
  [v4 dispatchThreadgroups:v10 threadsPerThreadgroup:&v8];
  [v4 endEncoding];
}

- (void)encodeComposeChromaToCommandBuffer:(id)a3 withMetaData:(id *)a4
{
  uint64_t v6 = [a3 computeCommandEncoder];
  uint64_t v7 = [(MTLTexture *)self->_blTextureUV width];
  uint64_t v8 = [(MTLTexture *)self->_blTextureUV height];
  unsigned int var0 = a4->var0;
  uint64_t v10 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_composeChromaKernel];
  [v6 setComputePipelineState:v10];

  [v6 setTexture:self->_blTextureUV atIndex:0];
  uint64_t v11 = 9608;
  if (!self->_preSubsampleLumaForMMR) {
    uint64_t v11 = 9584;
  }
  [v6 setTexture:*(Class *)((char *)&self->super.isa + v11) atIndex:1];
  [v6 setTexture:self->_elTextureUV atIndex:2];
  [v6 setTexture:self->_outputTextureUV atIndex:3];
  [v6 setBuffer:self->_currentPolynomialTable offset:2 * (1 << (var0 + 8)) atIndex:0];
  [v6 setBuffer:self->_dequantizelTable offset:4 * (1 << (var0 + 8)) atIndex:1];
  [v6 setBuffer:self->_config offset:0 atIndex:2];
  v14[0] = (unint64_t)(v7 + 15) >> 4;
  v14[1] = (unint64_t)(v8 + 15) >> 4;
  v14[2] = 1;
  int64x2_t v12 = vdupq_n_s64(0x10uLL);
  uint64_t v13 = 1;
  [v6 dispatchThreadgroups:v14 threadsPerThreadgroup:&v12];
  [v6 endEncoding];
}

- (void)encodeComposeCombinedToCommandBuffer:(id)a3
{
  double v4 = [a3 computeCommandEncoder];
  uint64_t v5 = [(MTLTexture *)self->_blTexture width];
  uint64_t v6 = [(MTLTexture *)self->_blTexture height];
  uint64_t v7 = [(DolbyVisionComposer *)self getComputePipeLineStateForShader:self->_composeYUVKernel];
  [v4 setComputePipelineState:v7];

  [v4 setTexture:self->_blTexture atIndex:0];
  [v4 setTexture:self->_blTextureUV atIndex:1];
  [v4 setTexture:self->_elTexture atIndex:2];
  [v4 setTexture:self->_elTextureUV atIndex:3];
  [v4 setTexture:self->_outputTexture[0] atIndex:4];
  [v4 setBuffer:self->_currentPolynomialTable offset:0 atIndex:0];
  [v4 setBuffer:self->_dequantizelTable offset:0 atIndex:1];
  [v4 setBuffer:self->_config offset:0 atIndex:2];
  v10[0] = (unint64_t)(v5 + 15) >> 4;
  v10[1] = (unint64_t)(v6 + 15) >> 4;
  v10[2] = 1;
  int64x2_t v8 = vdupq_n_s64(0x10uLL);
  uint64_t v9 = 1;
  [v4 dispatchThreadgroups:v10 threadsPerThreadgroup:&v8];
  [v4 endEncoding];
}

- (void)setupComposerKernelConfiguration:(id *)a3 fromMetaData:(id *)a4
{
  p_preSubsampleLumaForMMR = &self->_preSubsampleLumaForMMR;
  unsigned int var2 = a4->var2;
  a3->unsigned int var0 = var2;
  p_var32 = &a4->var32;
  a3->var1 = a4->var32 != 0;
  unsigned int var11 = a4->var11;
  a3->unsigned int var2 = a4->var14[0][0][1][0];
  a3->var3 = var11;
  a3->var4 = ~(-1 << var2);
  a3->var5 = 1 << (15 - var2);
  a3->var6 = 16 - var2;
  unsigned int v10 = a4->var23[0][0][1][0];
  if (v10 <= a4->var23[0][0][2][0]) {
    unsigned int v10 = a4->var23[0][0][2][0];
  }
  a3->var9 = v10;
  a3->unsigned int var10 = 1.0 / (float)(1 << (var11 + 4));
  a3->var7 = !*p_preSubsampleLumaForMMR;
  if (v10) {
    createMMRCoefficients((uint64_t)a4, (uint64_t)a3);
  }
  if (!*p_var32) {
    setupNlqParameters(a4, (uint64_t)a3);
  }
  a3->var8 = p_preSubsampleLumaForMMR[1];
}

- (void)createHLG2LTable
{
  self->_uint64_t hlg2LTableSize = 4096;
  uint64_t v3 = malloc_type_malloc(0x4000uLL, 0x100004052888210uLL);
  setHLG2LBuffer((uint64_t)v3, self->_hlg2LTableSize);
  id v4 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v4 setTextureType:0];
  [v4 setHeight:1];
  [v4 setWidth:self->_hlg2LTableSize];
  [v4 setDepth:1];
  [v4 setPixelFormat:55];
  [v4 setArrayLength:1];
  [v4 setMipmapLevelCount:1];
  uint64_t v5 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v4];
  hlg2LTable = self->_hlg2LTable;
  self->_hlg2LTable = v5;

  uint64_t v7 = self->_hlg2LTable;
  uint64_t hlg2LTableSize = self->_hlg2LTableSize;
  memset(v9, 0, 24);
  v9[3] = hlg2LTableSize;
  int64x2_t v10 = vdupq_n_s64(1uLL);
  [(MTLTexture *)v7 replaceRegion:v9 mipmapLevel:0 slice:0 withBytes:v3 bytesPerRow:0x4000 bytesPerImage:0];
  free(v3);
}

- (void)createPQ2LTable
{
  self->_uint64_t pq2LTableSize = 4096;
  uint64_t v3 = malloc_type_malloc(0x2000uLL, 0x1000040BDFB0063uLL);
  setPQ2LBufferFP16((uint64_t)v3, self->_pq2LTableSize);
  id v4 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v4 setTextureType:0];
  [v4 setHeight:1];
  [v4 setWidth:self->_pq2LTableSize];
  [v4 setDepth:1];
  [v4 setPixelFormat:25];
  [v4 setArrayLength:1];
  [v4 setMipmapLevelCount:1];
  uint64_t v5 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v4];
  pq2LTable = self->_pq2LTable;
  self->_pq2LTable = v5;

  uint64_t v7 = self->_pq2LTable;
  uint64_t pq2LTableSize = self->_pq2LTableSize;
  memset(v9, 0, 24);
  v9[3] = pq2LTableSize;
  int64x2_t v10 = vdupq_n_s64(1uLL);
  [(MTLTexture *)v7 replaceRegion:v9 mipmapLevel:0 slice:0 withBytes:v3 bytesPerRow:0x2000 bytesPerImage:0];
  free(v3);
}

- (void)createL2PQTable
{
  p_l2PQTableSize = &self->_l2PQTableSize;
  self->_l2PQTableSize = 1024;
  id v4 = malloc_type_malloc(0x1000uLL, 0xB97F66C9uLL);
  updateL2PQTable((uint64_t)v4, *p_l2PQTableSize);
  id v5 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v5 setTextureType:0];
  [v5 setHeight:1];
  [v5 setWidth:*p_l2PQTableSize];
  [v5 setDepth:1];
  [v5 setPixelFormat:55];
  [v5 setArrayLength:1];
  [v5 setMipmapLevelCount:1];
  uint64_t v6 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v5];
  xferToLinear = self->_xferToLinear;
  self->_xferToLinear = v6;

  int64x2_t v8 = self->_xferToLinear;
  uint64_t v9 = *p_l2PQTableSize;
  memset(v10, 0, 24);
  void v10[3] = v9;
  int64x2_t v11 = vdupq_n_s64(1uLL);
  [(MTLTexture *)v8 replaceRegion:v10 mipmapLevel:0 slice:0 withBytes:v4 bytesPerRow:4096 bytesPerImage:0];
  free(v4);
}

- (void)createScalingTable_YUVTM
{
  id v5 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v5 setTextureType:0];
  [v5 setHeight:1];
  [v5 setWidth:1024];
  [v5 setDepth:1];
  [v5 setPixelFormat:105];
  [v5 setArrayLength:1];
  [v5 setMipmapLevelCount:1];
  uint64_t v3 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v5];
  yuvScalingFactorTable = self->_yuvScalingFactorTable;
  self->_yuvScalingFactorTable = v3;
}

- (void)fillInScalingTable_YUVTM:(id *)a3 target_White:(float)a4 target_Black:(float)a5 source_White:(float)a6 source_Black:(float)a7 satBoost:(float)a8 scalingFactor:(BOOL)a9
{
  p_cached_target_white = &self->_cached_target_white;
  if (vabds_f32(self->_cached_target_white, a4) > 0.0000001
    || vabds_f32(self->_cached_target_black, a5) > 0.0000001
    || vabds_f32(self->_cached_source_white, a6) > 0.0000001
    || vabds_f32(self->_cached_source_black, a7) > 0.0000001)
  {
    GetToneMap_YUV_TM(self->_yuvScalingFactorTableBuffer, 0x400uLL, a9, 0, a4, a5, a6, a7, a8);
    float *p_cached_target_white = a4;
    p_cached_target_white[1] = a5;
    p_cached_target_white[2] = a6;
    p_cached_target_white[3] = a7;
  }
  yuvScalingFactorTable = self->_yuvScalingFactorTable;
  memset(v16, 0, sizeof(v16));
  long long v17 = xmmword_2222D11F0;
  uint64_t v18 = 1;
  [(MTLTexture *)yuvScalingFactorTable replaceRegion:v16 mipmapLevel:0 slice:0 withBytes:self->_yuvScalingFactorTableBuffer bytesPerRow:0x2000 bytesPerImage:0];
}

- (BOOL)hasAMVEConfigChanged:(id *)a3 tcCtrl:(ToneCurve_Control *)a4
{
  return a4->enableAmveStrength != a3->var0 || a4->amveStrengthValue != a3->var1;
}

- (void)updateAMVEConfig:(id *)a3 tcCtrl:(ToneCurve_Control *)a4
{
  a3->unsigned int var0 = a4->enableAmveStrength;
  a3->var1 = a4->amveStrengthValue;
}

- (void)hdr10_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 TMParam:(_HDR10TMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8
{
  id v14 = a4;
  if ([(DolbyVisionComposer *)self hdr10_tm_configChanged:a6 HDRControl:a5 EdrAdaptationParam:a7 AmbAdaptationParam:a8])
  {
    [(DolbyVisionComposer *)self hdr10_tm_createLUTFromDMConfig:a3 TMParam:a6 EdrAdaptationParam:a7 AmbAdaptationParam:a8 HDRControl:a5 DM:v14];
    [(DolbyVisionComposer *)self hdr10_tm_updateLUT];
    [(DolbyVisionComposer *)self hdr10_tm_reserveConfig:a6 HDRControl:a5 EdrAdaptationParam:a7 AmbAdaptationParam:a8];
  }
}

- (BOOL)hdr10_tm_configChanged:(_HDR10TMParam *)a3 HDRControl:(id *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6
{
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    int64x2_t v12 = GetConfig((HDRConfig *)Config);
    if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v12, 0x31u, 0)) {
      return 1;
    }
  }
  if (a4->var0 != self->_prev.contentType) {
    return 1;
  }
  return hasHdr10TonemapConfigChanged((uint64_t)&self->_prev.tm, (uint64_t)a3, (uint64_t)a5, (uint64_t)a6);
}

- (void)hdr10_tm_reserveConfig:(_HDR10TMParam *)a3 HDRControl:(id *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6
{
  self->_prev.contentType = a4->var0;
  updateHdr10TonemapConfig((uint64_t)&self->_prev.tm, a3, (long long *)&a5->on, (uint64_t)a6);
}

- (void)hdr10_tm_createLUTFromDMConfig:(id *)a3 TMParam:(_HDR10TMParam *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6 HDRControl:(id *)a7 DM:(id)a8
{
  id v14 = [a8 getDolbyVisionDM4];
  hdr10_setScalingFactorTableS_C((uint64_t)self->_scalingFactorTableBuffer, 0x400uLL, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a3, (uint64_t)a7, v14);
  hdr10_setLumaMixFactorTableS_L((uint64_t)self->_lumaMixFactorTableBuffer, 0x200uLL, (uint64_t)a4);
}

- (void)hdr10_tm_updateLUT
{
  id v3 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v3 setTextureType:0];
  [v3 setHeight:1];
  [v3 setWidth:1024];
  [v3 setDepth:1];
  [v3 setPixelFormat:55];
  [v3 setArrayLength:1];
  [v3 setMipmapLevelCount:1];
  id v4 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v3];
  scalingFactorTable = self->_scalingFactorTable;
  self->_scalingFactorTable = v4;

  uint64_t v6 = self->_scalingFactorTable;
  memset(v14, 0, sizeof(v14));
  long long v15 = xmmword_2222D11F0;
  uint64_t v16 = 1;
  [(MTLTexture *)v6 replaceRegion:v14 mipmapLevel:0 slice:0 withBytes:self->_scalingFactorTableBuffer bytesPerRow:4096 bytesPerImage:0];
  id v7 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v7 setTextureType:0];
  [v7 setHeight:1];
  [v7 setWidth:512];
  [v7 setDepth:1];
  [v7 setPixelFormat:55];
  [v7 setArrayLength:1];
  [v7 setMipmapLevelCount:1];
  int64x2_t v8 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v7];
  lumaMixFactorTable = self->_lumaMixFactorTable;
  self->_lumaMixFactorTable = v8;

  int64x2_t v10 = self->_lumaMixFactorTable;
  memset(v11, 0, sizeof(v11));
  long long v12 = xmmword_2222D1850;
  uint64_t v13 = 1;
  [(MTLTexture *)v10 replaceRegion:v11 mipmapLevel:0 slice:0 withBytes:self->_lumaMixFactorTableBuffer bytesPerRow:2048 bytesPerImage:0];
}

- (void)hlg_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 TMParam:(_HLGTMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 TMMode:(int)a9
{
  id v15 = a4;
  if ([(DolbyVisionComposer *)self hlg_tm_configChanged:a3 HDRControl:a5 TMParam:a6 EdrAdaptationParam:a7 AmbAdaptationParam:a8])
  {
    [(DolbyVisionComposer *)self hlg_tm_createLUTFromDMConfig:a3 DM:v15 TMParam:a6 EdrAdaptationParam:a7 AmbAdaptationParam:a8 TMMode:a9];
    [(DolbyVisionComposer *)self hlg_tm_updateLUT];
    [(DolbyVisionComposer *)self hlg_tm_reserveConfig:a3 HDRControl:a5 TMParam:a6 EdrAdaptationParam:a7 AmbAdaptationParam:a8];
  }
}

- (BOOL)hlg_tm_configChanged:(id *)a3 HDRControl:(id *)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7
{
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    id v14 = GetConfig((HDRConfig *)Config);
    if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v14, 0x31u, 0)) {
      return 1;
    }
  }
  if (a4->var0 != self->_prev.contentType) {
    return 1;
  }
  return hasHlgTonemapConfigChanged((uint64_t)&self->_prev.tm, &a3->var0, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7);
}

- (void)hlg_tm_reserveConfig:(id *)a3 HDRControl:(id *)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7
{
  self->_prev.contentType = a4->var0;
  updateHlgTonemapConfig((uint64_t)&self->_prev.tm, a3, (uint64_t)a5, (long long *)&a6->on, (uint64_t)a7);
}

- (void)getTmLutInput:(unint64_t)a3 lutInput:(float *)a4
{
  if (a3)
  {
    uint64_t v4 = 0;
    do
    {
      float v5 = (float)v4;
      if (!v4) {
        float v5 = 0.15;
      }
      a4[v4++] = v5 / (float)(a3 - 1);
    }
    while (a3 > v4);
  }
}

- (void)getTmLutInput_C:(unint64_t)a3 lutInput:(float *)a4
{
  if (a3)
  {
    uint64_t v4 = 0;
    do
    {
      a4[v4] = (float)v4 / (float)(a3 - 1);
      ++v4;
    }
    while (a3 > v4);
  }
}

- (void)hlg_tm_createLUTFromDMConfig:(id *)a3 DM:(id)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7 TMMode:(int)a8
{
  id v15 = [a4 getDolbyVisionDM4];
  id v14 = (float *)malloc_type_calloc(0x400uLL, 4uLL, 0x100004052888210uLL);
  if (v14)
  {
    if (a8 == -1)
    {
      [(DolbyVisionComposer *)self getTmLutInput:1024 lutInput:v14];
      hlg_setScalingFactorTable((uint64_t)self->_scalingFactorTableBuffer, (uint64_t)v14, 0x400uLL, (uint64_t)a3, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, -1, v15);
    }
    else
    {
      [(DolbyVisionComposer *)self getTmLutInput_C:1024 lutInput:v14];
      hlg_setScalingFactorTable_C((uint64_t)self->_scalingFactorTableBuffer, v14, 0x400uLL, (uint64_t)a3, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, v15);
    }
    free(v14);
  }
}

- (void)hlg_tm_updateLUT
{
  id v3 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v3 setTextureType:0];
  [v3 setHeight:1];
  [v3 setWidth:1024];
  [v3 setDepth:1];
  [v3 setPixelFormat:55];
  [v3 setArrayLength:1];
  [v3 setMipmapLevelCount:1];
  uint64_t v4 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v3];
  scalingFactorTable = self->_scalingFactorTable;
  self->_scalingFactorTable = v4;

  uint64_t v6 = self->_scalingFactorTable;
  memset(v7, 0, sizeof(v7));
  long long v8 = xmmword_2222D11F0;
  uint64_t v9 = 1;
  [(MTLTexture *)v6 replaceRegion:v7 mipmapLevel:0 slice:0 withBytes:self->_scalingFactorTableBuffer bytesPerRow:4096 bytesPerImage:0];
}

- (void)dovi_createLUTFromDMConfig:(id *)a3 DM:(id)a4 HDRControl:(id *)a5 TMParam:(_DoViTMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 HlgOOTFCombined:(BOOL)a9 HlgOOTFOnly:(BOOL)a10 IsDoVi84:(BOOL)a11 tcCtrl:(ToneCurve_Control *)a12
{
  id v19 = a4;
  if (-[DolbyVisionComposer dovi_tm_configChanged:HDRControl:DM:EdrAdaptationParam:AmbAdaptationParam:tcCtrl:](self, "dovi_tm_configChanged:HDRControl:DM:EdrAdaptationParam:AmbAdaptationParam:tcCtrl:", a3, a5))
  {
    BYTE2(v18) = a11;
    LOWORD(v18) = __PAIR16__(a10, a9);
    -[DolbyVisionComposer dovi_tm_createLUTFromDMConfig:HDRControl:DM:TMParam:EdrAdaptationParam:AmbAdaptationParam:HlgOOTFCombined:HlgOOTFOnly:IsDoVi84:tcCtrl:](self, "dovi_tm_createLUTFromDMConfig:HDRControl:DM:TMParam:EdrAdaptationParam:AmbAdaptationParam:HlgOOTFCombined:HlgOOTFOnly:IsDoVi84:tcCtrl:", a3, a5, v19, a6, a7, a8, v18, a12);
    [(DolbyVisionComposer *)self dovi_tm_updateLUT];
    [(DolbyVisionComposer *)self dovi_tm_reserveConfig:a3 HDRControl:a5 DM:v19 EdrAdaptationParam:a7 AmbAdaptationParam:a8 tcCtrl:a12];
  }
}

- (BOOL)dovi_tm_configChanged:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7 tcCtrl:(ToneCurve_Control *)a8
{
  id v14 = (HDRConfig *)a5;
  Config = GetConfig(v14);
  if (Config
    && (uint64_t v16 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v16, 0x31u, 0))
    || a4->var0 != self->_prev.contentType
    || [(DolbyVisionComposer *)self hasAMVEConfigChanged:&self->_prev.amve tcCtrl:a8])
  {
    char v17 = 1;
  }
  else if (LODWORD(a3[1].var49) == 4)
  {
    id v19 = [(HDRConfig *)v14 getDolbyVisionDM4];
    char v17 = [v19 hasDM4TonemapConfigChanged:a3 TonemapConfig:&self->_prev.tm EdrAdaptationParam:a6 AmbAdaptationParam:a7];
  }
  else
  {
    char v17 = hasDoviTonemapConfigChanged((uint64_t)&self->_prev.tm, (uint64_t)a3, 1, (uint64_t)a6, (uint64_t)a7);
  }

  return v17;
}

- (void)dovi_tm_reserveConfig:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7 tcCtrl:(ToneCurve_Control *)a8
{
  id v15 = a5;
  self->_prev.contentType = a4->var0;
  [(DolbyVisionComposer *)self updateAMVEConfig:&self->_prev.amve tcCtrl:a8];
  if (LODWORD(a3[1].var49) == 4)
  {
    id v14 = [v15 getDolbyVisionDM4];
    [v14 updateDM4TonemapConfig:&self->_prev.tm DMConfig:a3 EdrAdaptationParam:a6 AmbAdaptationParam:a7];
  }
  else
  {
    updateDoViTonemapConfig((uint64_t)&self->_prev.tm, a3, 1, (long long *)&a6->on, (uint64_t)a7);
  }
}

- (void)dovi_tm_createLUTFromDMConfig:(id *)a3 HDRControl:(id *)a4 DM:(id)a5 TMParam:(_DoViTMParam *)a6 EdrAdaptationParam:(_EdrAdaptationParam *)a7 AmbAdaptationParam:(_AmbAdaptationParam *)a8 HlgOOTFCombined:(BOOL)a9 HlgOOTFOnly:(BOOL)a10 IsDoVi84:(BOOL)a11 tcCtrl:(ToneCurve_Control *)a12
{
  id v20 = a5;
  char v17 = malloc_type_calloc(0x400uLL, 4uLL, 0x100004052888210uLL);
  if (v17)
  {
    [(DolbyVisionComposer *)self getTmLutInput_C:1024 lutInput:v17];
    BYTE2(v18) = a11;
    LOWORD(v18) = __PAIR16__(a10, a9);
    objc_msgSend(v20, "dovi_setScalingFactorTable:lutInput:tableSize:config:hdrCtrl:tmParam:edrAdaptationParam:ambAdaptationParam:hlgOOTFCombined:hlgOOTFOnly:isDoVi84:tcCtrl:", self->_scalingFactorTableBuffer, v17, 1024, a3, a4, a6, a7, a8, v18, a12);
    objc_msgSend(v20, "dovi_setSat2FactorTable:tableSize:config:llDovi:applyDoVi84SatAdjustment:", self->_sat2FactorTableBuffer, 512, a3, 0, 0);
    free(v17);
  }
}

- (void)dovi_tm_updateLUT
{
  id v3 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v3 setTextureType:0];
  [v3 setHeight:1];
  [v3 setWidth:1024];
  [v3 setDepth:1];
  [v3 setPixelFormat:55];
  [v3 setArrayLength:1];
  [v3 setMipmapLevelCount:1];
  uint64_t v4 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v3];
  scalingFactorTable = self->_scalingFactorTable;
  self->_scalingFactorTable = v4;

  uint64_t v6 = self->_scalingFactorTable;
  memset(v14, 0, sizeof(v14));
  long long v15 = xmmword_2222D11F0;
  uint64_t v16 = 1;
  [(MTLTexture *)v6 replaceRegion:v14 mipmapLevel:0 slice:0 withBytes:self->_scalingFactorTableBuffer bytesPerRow:4096 bytesPerImage:0];
  id v7 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v7 setTextureType:0];
  [v7 setHeight:1];
  [v7 setWidth:512];
  [v7 setDepth:1];
  [v7 setPixelFormat:105];
  [v7 setArrayLength:1];
  [v7 setMipmapLevelCount:1];
  long long v8 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v7];
  sat2FactorTable = self->_sat2FactorTable;
  self->_sat2FactorTable = v8;

  int64x2_t v10 = self->_sat2FactorTable;
  memset(v11, 0, sizeof(v11));
  long long v12 = xmmword_2222D1850;
  uint64_t v13 = 1;
  [(MTLTexture *)v10 replaceRegion:v11 mipmapLevel:0 slice:0 withBytes:self->_sat2FactorTableBuffer bytesPerRow:4096 bytesPerImage:0];
}

- (void)dovi_dm4_updateInterleavedLUT
{
  uint64_t v3 = 0;
  dm4_tLutIBuffer = self->_dm4_tLutIBuffer;
  dm4_tLutSBuffer = self->_dm4_tLutSBuffer;
  uint64_t v6 = &self->_dm4_tLutIBuffer[1022];
  id v7 = &self->_dm4_tLutIBuffer[511];
  do
  {
    v6[1] = v7[v3 + 2048];
    float *v6 = v7[v3];
    v6[1025] = v7[v3 + 2560];
    v6[1024] = v7[v3 + 1024];
    --v3;
    v6 -= 2;
  }
  while (v3 != -512);
  id v8 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v8 setTextureType:0];
  [v8 setHeight:1];
  [v8 setDepth:1];
  [v8 setWidth:512];
  [v8 setPixelFormat:105];
  [v8 setArrayLength:1];
  [v8 setMipmapLevelCount:1];
  uint64_t v9 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v8];
  dm4_tLutI = self->_dm4_tLutI;
  self->_dm4_tLutI = v9;

  int64x2_t v11 = self->_dm4_tLutI;
  memset(v15, 0, 24);
  v15[3] = [v8 width];
  int64x2_t v16 = vdupq_n_s64(1uLL);
  -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](v11, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v15, 0, 0, dm4_tLutIBuffer, 8 * [v8 width], 0);
  long long v12 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v8];
  dm4_tLutS = self->_dm4_tLutS;
  self->_dm4_tLutS = v12;

  -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](self->_dm4_tLutS, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &v14, 0, 0, dm4_tLutSBuffer, 8 * objc_msgSend(v8, "width", 0, 0, 0, objc_msgSend(v8, "width"), vdupq_n_s64(1uLL)), 0);
}

- (void)createLUTFromDMConfig:(id *)a3 DM:(id)a4 TCControl:(ToneCurve_Control *)a5 HDRControl:(id *)a6
{
  id v10 = a4;
  int processingType = a5->tmData.processingType;
  p_edrAdaptationParam = &a5->edrAdaptationParam;
  p_ambAdaptationParam = &a5->ambAdaptationParam;
  id v20 = v10;
  if (processingType == 2)
  {
    LODWORD(v19) = a5->tmData.hlgTmMode;
    [(DolbyVisionComposer *)self hlg_createLUTFromDMConfig:a3 DM:v10 HDRControl:a6 TMParam:&a5->hlgTmParam EdrAdaptationParam:p_edrAdaptationParam AmbAdaptationParam:p_ambAdaptationParam TMMode:v19];
  }
  else if (processingType == 1)
  {
    [(DolbyVisionComposer *)self hdr10_createLUTFromDMConfig:a3 DM:v10 HDRControl:a6 TMParam:&a5->hdr10TmParam EdrAdaptationParam:p_edrAdaptationParam AmbAdaptationParam:p_ambAdaptationParam];
  }
  else
  {
    if (processingType == 4 && LOBYTE(a3[1].var53) != 0 && TMOOTFSeparate == 0)
    {
      unsigned int var10 = a6->var10;
      BOOL v18 = var10 > 7;
      unsigned int v16 = (0xB0u >> var10) & 1;
      if (v18) {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
    BYTE2(v19) = processingType == 4;
    LOWORD(v19) = v16;
    -[DolbyVisionComposer dovi_createLUTFromDMConfig:DM:HDRControl:TMParam:EdrAdaptationParam:AmbAdaptationParam:HlgOOTFCombined:HlgOOTFOnly:IsDoVi84:tcCtrl:](self, "dovi_createLUTFromDMConfig:DM:HDRControl:TMParam:EdrAdaptationParam:AmbAdaptationParam:HlgOOTFCombined:HlgOOTFOnly:IsDoVi84:tcCtrl:", a3, v10, a6, &a5->doviTmParam, p_edrAdaptationParam, p_ambAdaptationParam, v19, a5);
  }
}

- (BOOL)yuvCombinedCompose
{
  return self->_yuvCombinedCompose;
}

- (void)setYuvCombinedCompose:(BOOL)a3
{
  self->_yuvCombinedCompose = a3;
}

- (BOOL)preSubsampleLumaForMMR
{
  return self->_preSubsampleLumaForMMR;
}

- (void)setPreSubsampleLumaForMMR:(BOOL)a3
{
  self->_preSubsampleLumaForMMR = a3;
}

- (BOOL)bypassDisplayManagement
{
  return self->_bypassDisplayManagement;
}

- (void)setBypassDisplayManagement:(BOOL)a3
{
  self->_bypassDisplayManagement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dm4_tLutS, 0);
  objc_storeStrong((id *)&self->_dm4_tLutI, 0);
  objc_storeStrong((id *)&self->_xferToLinear, 0);
  objc_storeStrong((id *)&self->_lumaMixFactorTable, 0);
  objc_storeStrong((id *)&self->_sat2FactorTable, 0);
  objc_storeStrong((id *)&self->_scalingFactorTable, 0);
  objc_storeStrong((id *)&self->_yuvScalingFactorTable, 0);
  objc_storeStrong((id *)&self->_hlg2LTable, 0);
  objc_storeStrong((id *)&self->_pq2LTable, 0);
  objc_storeStrong((id *)&self->_outputTextureUV, 0);
  for (uint64_t i = 0; i != -3; --i)
    objc_storeStrong((id *)&self->_outputTexture[i + 2], 0);
  objc_storeStrong((id *)&self->_elTextureUV, 0);
  objc_storeStrong((id *)&self->_elTexture, 0);
  objc_storeStrong((id *)&self->_blSubsampledTexture, 0);
  objc_storeStrong((id *)&self->_blSubsampledTempTexture, 0);
  objc_storeStrong((id *)&self->_blTextureUV, 0);
  objc_storeStrong((id *)&self->_blTexture, 0);
  objc_storeStrong((id *)&self->_config, 0);
  for (uint64_t j = 0; j != -3; --j)
    objc_storeStrong((id *)&self->_configBuffers[j + 2], 0);
  objc_storeStrong((id *)&self->_dequantizelTable, 0);
  objc_storeStrong((id *)&self->_currentPolynomialTable, 0);
  for (uint64_t k = 0; k != -3; --k)
    objc_storeStrong((id *)&self->_polynomialTables[k + 2], 0);
  objc_storeStrong((id *)&self->_dovi5_ipt_two_inputs_compose_dm_msr, 0);
  objc_storeStrong((id *)&self->_dovi5_yuv_two_inputs_compose_dm_msr, 0);
  objc_storeStrong((id *)&self->_dovi5_ipt_1input_compose_dm_msr, 0);
  objc_storeStrong((id *)&self->_dovi5_yuv_1input_compose_dm_msr, 0);
  objc_storeStrong((id *)&self->_dovi84_DM3_two_inputs_ushort_msr, 0);
  for (uint64_t m = 0; m != -2; --m)
    objc_storeStrong((id *)&self->_dovi84_two_inputs_ushort_msr[m + 1], 0);
  objc_storeStrong((id *)&self->_hdr10_two_inputs_ushort_msr, 0);
  objc_storeStrong((id *)&self->_hlg_two_inputs_ushort_msr, 0);
  objc_storeStrong((id *)&self->_dovi84_DM3_1input_half_msr, 0);
  for (uint64_t n = 0; n != -2; --n)
    objc_storeStrong((id *)&self->_dovi84_1input_half_msr[n + 1], 0);
  objc_storeStrong((id *)&self->_hdr10_1input_half_msr, 0);
  objc_storeStrong((id *)&self->_hlg_1input_half_msr, 0);
  objc_storeStrong((id *)&self->_singleLayer16bit444Kernel, 0);
  objc_storeStrong((id *)&self->_RGhAHDR10w30r, 0);
  objc_storeStrong((id *)&self->_x444HDR10w30r, 0);
  objc_storeStrong((id *)&self->_y416HDR10w30r, 0);
  objc_storeStrong((id *)&self->_RGhAHLGw30r, 0);
  objc_storeStrong((id *)&self->_y416HLGw30r, 0);
  for (iuint64_t i = 0; ii != -4; --ii)
    objc_storeStrong((id *)&self->_packed422HLGCif10[ii + 3], 0);
  for (juint64_t j = 0; jj != -4; --jj)
    objc_storeStrong((id *)&self->_packedHLGCif10[jj + 3], 0);
  for (kuint64_t k = 0; kk != -4; --kk)
    objc_storeStrong((id *)&self->_packed422HDR10Cif10[kk + 3], 0);
  for (muint64_t m = 0; mm != -4; --mm)
    objc_storeStrong((id *)&self->_packedHDR10Cif10[mm + 3], 0);
  objc_storeStrong((id *)&self->_iptP422PackedPlanar_msr, 0);
  for (nuint64_t n = 0; nn != -4; --nn)
    objc_storeStrong((id *)&self->_iptP422PackedPlanar[nn + 3], 0);
  for (uint64_t i1 = 0; i1 != -4; --i1)
    objc_storeStrong((id *)&self->_yuvP422PackedPlanarDM4_msr[i1 + 3], 0);
  for (uint64_t i2 = 0; i2 != -4; --i2)
    objc_storeStrong((id *)&self->_yuvP422PackedPlanarDM4_rotate[i2 + 3], 0);
  for (uint64_t i3 = 0; i3 != -4; --i3)
    objc_storeStrong((id *)&self->_yuvP422PackedPlanarDM4_flip[i3 + 3], 0);
  for (uint64_t i4 = 0; i4 != -4; --i4)
    objc_storeStrong((id *)&self->_yuvP422PackedPlanarDM4[i4 + 3], 0);
  for (uint64_t i5 = 0; i5 != -4; --i5)
    objc_storeStrong((id *)&self->_yuvP422PackedPlanar_rotate[i5 + 3], 0);
  for (uint64_t i6 = 0; i6 != -4; --i6)
    objc_storeStrong((id *)&self->_yuvP422PackedPlanar_flip[i6 + 3], 0);
  for (uint64_t i7 = 0; i7 != -4; --i7)
    objc_storeStrong((id *)&self->_yuvP422PackedPlanar_msr[i7 + 3], 0);
  for (uint64_t i8 = 0; i8 != -4; --i8)
    objc_storeStrong((id *)&self->_yuvP422PackedPlanar[i8 + 3], 0);
  objc_storeStrong((id *)&self->_singleLayerIntegratedIPTKernelPackedPlanar_msr, 0);
  for (uint64_t i9 = 0; i9 != -4; --i9)
    objc_storeStrong((id *)&self->_singleLayerIntegratedIPTKernelPackedPlanar[i9 + 3], 0);
  for (uint64_t i10 = 0; i10 != -4; --i10)
    objc_storeStrong((id *)&self->_singleLayerIntegratedKernelPackedPlanarDM4_msr[i10 + 3], 0);
  for (uint64_t i11 = 0; i11 != -4; --i11)
    objc_storeStrong((id *)&self->_singleLayerIntegratedKernelPackedPlanarDM4_rotate[i11 + 3], 0);
  for (uint64_t i12 = 0; i12 != -4; --i12)
    objc_storeStrong((id *)&self->_singleLayerIntegratedKernelPackedPlanarDM4_flip[i12 + 3], 0);
  for (uint64_t i13 = 0; i13 != -4; --i13)
    objc_storeStrong((id *)&self->_singleLayerIntegratedKernelPackedPlanarDM4[i13 + 3], 0);
  for (uint64_t i14 = 0; i14 != -4; --i14)
    objc_storeStrong((id *)&self->_singleLayerIntegratedKernelPackedPlanar_msr[i14 + 3], 0);
  for (uint64_t i15 = 0; i15 != -4; --i15)
    objc_storeStrong((id *)&self->_singleLayerIntegratedKernelPackedPlanar_rotate[i15 + 3], 0);
  for (uint64_t i16 = 0; i16 != -4; --i16)
    objc_storeStrong((id *)&self->_singleLayerIntegratedKernelPackedPlanar_flip[i16 + 3], 0);
  for (uint64_t i17 = 0; i17 != -4; --i17)
    objc_storeStrong((id *)&self->_singleLayerIntegratedKernelPackedPlanar[i17 + 3], 0);
  for (uint64_t i18 = 0; i18 != -4; --i18)
    objc_storeStrong((id *)&self->_singleLayerIntegratedIPTKernelPlanar[i18 + 3], 0);
  for (uint64_t i19 = 0; i19 != -4; --i19)
    objc_storeStrong((id *)&self->_singleLayerIntegratedKernelPlanar[i19 + 3], 0);
  objc_storeStrong((id *)&self->_singleLayerIntegratedIPTKernelMsr, 0);
  for (uint64_t i20 = 0; i20 != -4; --i20)
    objc_storeStrong((id *)&self->_singleLayerIntegratedIPTKernel[i20 + 3], 0);
  for (uint64_t i21 = 0; i21 != -4; --i21)
    objc_storeStrong((id *)&self->_singleLayerIntegratedKernel[i21 + 3], 0);
  objc_storeStrong((id *)&self->_packed422DolbyIPTtoRGB_IPTTM_YScale, 0);
  objc_storeStrong((id *)&self->_packed422DolbyIPTtoRGB_IPTTM_HLGOOTF, 0);
  for (uint64_t i22 = 0; i22 != -4; --i22)
    objc_storeStrong((id *)&self->_packed422DolbyIPTtoRGB_YUVTM[i22 + 3], 0);
  objc_storeStrong((id *)&self->_packedDolbyIPTtoRGB_IPTTM_YScale, 0);
  objc_storeStrong((id *)&self->_packedDolbyIPTtoRGB_IPTTM_HLGOOTF, 0);
  for (uint64_t i23 = 0; i23 != -4; --i23)
    objc_storeStrong((id *)&self->_packedDolbyIPTtoRGB_YUVTM[i23 + 3], 0);
  objc_storeStrong((id *)&self->_packed422DolbyYUVtoRGB_IPTTM_YScale, 0);
  objc_storeStrong((id *)&self->_packed422DolbyYUVtoRGB_IPTTM_HLGOOTF, 0);
  for (uint64_t i24 = 0; i24 != -4; --i24)
    objc_storeStrong((id *)&self->_packed422DolbyYUVtoRGB_YUVTM[i24 + 3], 0);
  objc_storeStrong((id *)&self->_packedDolbyYUVtoRGB_IPTTM_YScale, 0);
  objc_storeStrong((id *)&self->_packedDolbyYUVtoRGB_IPTTM_HLGOOTF, 0);
  for (uint64_t i25 = 0; i25 != -4; --i25)
    objc_storeStrong((id *)&self->_packedDolbyYUVtoRGB_YUVTM[i25 + 3], 0);
  objc_storeStrong((id *)&self->_packed422HLG_msr, 0);
  objc_storeStrong((id *)&self->_packedHLG_msr, 0);
  objc_storeStrong((id *)&self->_unpackedHLG10toRGB_YUVTM, 0);
  objc_storeStrong((id *)&self->_unpackedHLG8toRGB_YUVTM, 0);
  objc_storeStrong((id *)&self->_packed422HLGtoRGB_YUVTM_rotate, 0);
  objc_storeStrong((id *)&self->_packed422HLGtoRGB_YUVTM_flip, 0);
  objc_storeStrong((id *)&self->_packed422HLGtoRGB_YUVTM, 0);
  objc_storeStrong((id *)&self->_packedHLGtoRGB_YUVTM_rotate, 0);
  objc_storeStrong((id *)&self->_packedHLGtoRGB_YUVTM_flip, 0);
  objc_storeStrong((id *)&self->_packedHLGtoRGB_YUVTM, 0);
  objc_storeStrong((id *)&self->_packed422HDR10_msr, 0);
  objc_storeStrong((id *)&self->_packedHDR10_msr, 0);
  objc_storeStrong((id *)&self->_unpackedHDR10toRGB_YUVTM, 0);
  objc_storeStrong((id *)&self->_packed422HDR10toRGB_YUVTM, 0);
  objc_storeStrong((id *)&self->_packedHDR10toRGB_YUVTM, 0);
  objc_storeStrong((id *)&self->_unpackedHDR10toRGB, 0);
  objc_storeStrong((id *)&self->_packed422HDR10toRGB, 0);
  objc_storeStrong((id *)&self->_packedHDR10toRGB, 0);
  objc_storeStrong((id *)&self->_packed422HLG_ptv, 0);
  objc_storeStrong((id *)&self->_packedHLG_ptv, 0);
  objc_storeStrong((id *)&self->_unpackedHLG_ptv, 0);
  objc_storeStrong((id *)&self->_packed422HDR10_ptv, 0);
  objc_storeStrong((id *)&self->_packedHDR10_ptv, 0);
  objc_storeStrong((id *)&self->_unpackedHDR10_ptv, 0);
  objc_storeStrong((id *)&self->_packed422DolbyIPT_ptv, 0);
  objc_storeStrong((id *)&self->_packedDolbyIPT_ptv, 0);
  objc_storeStrong((id *)&self->_sdr2cif10, 0);
  objc_storeStrong((id *)&self->_composeYUVKernel, 0);
  objc_storeStrong((id *)&self->_composeChromaKernel, 0);
  objc_storeStrong((id *)&self->_composeLumaKernel, 0);
  objc_storeStrong((id *)&self->_horizontalResampleKernel, 0);
  objc_storeStrong((id *)&self->_verticalResampleKernel, 0);
  objc_storeStrong((id *)&self->_verticalHalfLumaKernel, 0);
  objc_storeStrong((id *)&self->_horizontalHalfLumaKernel, 0);
  objc_storeStrong((id *)&self->_defaultLibrary, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end