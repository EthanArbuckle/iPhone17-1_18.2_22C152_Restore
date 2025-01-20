@interface AWBIBPParams
- ($938B03310D06493B2963E5A84CB75A7E)awbComboGains;
- ($938B03310D06493B2963E5A84CB75A7E)awbComboGainsNormalized;
- ($938B03310D06493B2963E5A84CB75A7E)awbGains;
- (MTLTexture)clippedTex;
- (MTLTexture)imageTex;
- (MTLTexture)lscGainsTex;
- (MTLTexture)skinMask;
- (MTLTexture)skyMask;
- (NSDictionary)cameraInfo;
- (NSDictionary)faceAssistedSkinGainsToMatch;
- (NSDictionary)metadata;
- (NSDictionary)moduleConfig;
- (NSDictionary)regionOfInterestRectInBufferCoords;
- (NSDictionary)registers;
- (NSDictionary)secondaryCameraInfo;
- (NSDictionary)secondaryModuleConfig;
- (NSDictionary)setFileDict;
- (NSDictionary)validRectInBufferCoords;
- (NSDictionary)validRectInSensorReadoutCoords;
- (NSMutableDictionary)outputMetadata;
- (NSNumber)cfaLayout;
- (NSNumber)digitalFlash;
- (NSNumber)downsizeFactor;
- (NSNumber)faceAssistedBehaviorMode;
- (NSNumber)firstPixel;
- (NSNumber)lscMaxGain;
- (NSNumber)skipDemosaic;
- (void)reset;
- (void)setAwbComboGains:(id)a3;
- (void)setAwbComboGainsNormalized:(id)a3;
- (void)setAwbGains:(id)a3;
- (void)setCameraInfo:(id)a3;
- (void)setCfaLayout:(id)a3;
- (void)setClippedTex:(id)a3;
- (void)setDigitalFlash:(id)a3;
- (void)setDownsizeFactor:(id)a3;
- (void)setFaceAssistedBehaviorMode:(id)a3;
- (void)setFaceAssistedSkinGainsToMatch:(id)a3;
- (void)setFirstPixel:(id)a3;
- (void)setImageTex:(id)a3;
- (void)setLscGainsTex:(id)a3;
- (void)setLscMaxGain:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setModuleConfig:(id)a3;
- (void)setOutputMetadata:(id)a3;
- (void)setRegionOfInterestRectInBufferCoords:(id)a3;
- (void)setRegisters:(id)a3;
- (void)setSecondaryCameraInfo:(id)a3;
- (void)setSecondaryModuleConfig:(id)a3;
- (void)setSetFileDict:(id)a3;
- (void)setSkinMask:(id)a3;
- (void)setSkipDemosaic:(id)a3;
- (void)setSkyMask:(id)a3;
- (void)setValidRectInBufferCoords:(id)a3;
- (void)setValidRectInSensorReadoutCoords:(id)a3;
@end

@implementation AWBIBPParams

- (void)reset
{
  metadata = self->_metadata;
  self->_metadata = 0;

  registers = self->_registers;
  self->_registers = 0;

  setFileDict = self->_setFileDict;
  self->_setFileDict = 0;

  moduleConfig = self->_moduleConfig;
  self->_moduleConfig = 0;

  secondaryModuleConfig = self->_secondaryModuleConfig;
  self->_secondaryModuleConfig = 0;

  cameraInfo = self->_cameraInfo;
  self->_cameraInfo = 0;

  secondaryCameraInfo = self->_secondaryCameraInfo;
  self->_secondaryCameraInfo = 0;

  imageTex = self->_imageTex;
  self->_imageTex = 0;

  clippedTex = self->_clippedTex;
  self->_clippedTex = 0;

  lscGainsTex = self->_lscGainsTex;
  self->_lscGainsTex = 0;

  firstPixel = self->_firstPixel;
  self->_firstPixel = 0;

  cfaLayout = self->_cfaLayout;
  self->_cfaLayout = 0;

  downsizeFactor = self->_downsizeFactor;
  self->_downsizeFactor = 0;

  digitalFlash = self->_digitalFlash;
  self->_digitalFlash = 0;

  validRectInSensorReadoutCoords = self->_validRectInSensorReadoutCoords;
  self->_validRectInSensorReadoutCoords = 0;

  validRectInBufferCoords = self->_validRectInBufferCoords;
  self->_validRectInBufferCoords = 0;

  regionOfInterestRectInBufferCoords = self->_regionOfInterestRectInBufferCoords;
  self->_regionOfInterestRectInBufferCoords = 0;

  faceAssistedBehaviorMode = self->_faceAssistedBehaviorMode;
  self->_faceAssistedBehaviorMode = 0;

  skipDemosaic = self->_skipDemosaic;
  self->_skipDemosaic = 0;

  lscMaxGain = self->_lscMaxGain;
  self->_lscMaxGain = (NSNumber *)&unk_26F3F2310;

  self->_awbGains.bGain = 0;
  *(_OWORD *)&self->_awbComboGainsNormalized.gGain = 0u;
  *(_OWORD *)&self->_awbComboGains.rGain = 0u;
  outputMetadata = self->_outputMetadata;
  self->_outputMetadata = 0;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)registers
{
  return self->_registers;
}

- (void)setRegisters:(id)a3
{
}

- (NSDictionary)setFileDict
{
  return self->_setFileDict;
}

- (void)setSetFileDict:(id)a3
{
}

- (NSDictionary)moduleConfig
{
  return self->_moduleConfig;
}

- (void)setModuleConfig:(id)a3
{
}

- (NSDictionary)secondaryModuleConfig
{
  return self->_secondaryModuleConfig;
}

- (void)setSecondaryModuleConfig:(id)a3
{
}

- (NSDictionary)cameraInfo
{
  return self->_cameraInfo;
}

- (void)setCameraInfo:(id)a3
{
}

- (NSDictionary)secondaryCameraInfo
{
  return self->_secondaryCameraInfo;
}

- (void)setSecondaryCameraInfo:(id)a3
{
}

- (MTLTexture)imageTex
{
  return self->_imageTex;
}

- (void)setImageTex:(id)a3
{
}

- (MTLTexture)clippedTex
{
  return self->_clippedTex;
}

- (void)setClippedTex:(id)a3
{
}

- (MTLTexture)lscGainsTex
{
  return self->_lscGainsTex;
}

- (void)setLscGainsTex:(id)a3
{
}

- (MTLTexture)skinMask
{
  return self->_skinMask;
}

- (void)setSkinMask:(id)a3
{
}

- (NSNumber)firstPixel
{
  return self->_firstPixel;
}

- (void)setFirstPixel:(id)a3
{
}

- (NSNumber)cfaLayout
{
  return self->_cfaLayout;
}

- (void)setCfaLayout:(id)a3
{
}

- (NSNumber)downsizeFactor
{
  return self->_downsizeFactor;
}

- (void)setDownsizeFactor:(id)a3
{
}

- (NSNumber)digitalFlash
{
  return self->_digitalFlash;
}

- (void)setDigitalFlash:(id)a3
{
}

- (NSDictionary)validRectInSensorReadoutCoords
{
  return self->_validRectInSensorReadoutCoords;
}

- (void)setValidRectInSensorReadoutCoords:(id)a3
{
}

- (NSDictionary)validRectInBufferCoords
{
  return self->_validRectInBufferCoords;
}

- (void)setValidRectInBufferCoords:(id)a3
{
}

- (NSDictionary)regionOfInterestRectInBufferCoords
{
  return self->_regionOfInterestRectInBufferCoords;
}

- (void)setRegionOfInterestRectInBufferCoords:(id)a3
{
}

- (NSNumber)faceAssistedBehaviorMode
{
  return self->_faceAssistedBehaviorMode;
}

- (void)setFaceAssistedBehaviorMode:(id)a3
{
}

- (NSDictionary)faceAssistedSkinGainsToMatch
{
  return self->_faceAssistedSkinGainsToMatch;
}

- (void)setFaceAssistedSkinGainsToMatch:(id)a3
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

- ($938B03310D06493B2963E5A84CB75A7E)awbComboGains
{
  unsigned int bGain = self->_awbComboGains.bGain;
  uint64_t v3 = *(void *)&self->_awbComboGains.rGain;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = bGain;
  return result;
}

- (void)setAwbComboGains:(id)a3
{
  self->_awbComboGains = ($BFF84FA8B35404205C764F9DEA58D0AB)a3;
}

- ($938B03310D06493B2963E5A84CB75A7E)awbComboGainsNormalized
{
  unsigned int bGain = self->_awbComboGainsNormalized.bGain;
  uint64_t v3 = *(void *)&self->_awbComboGainsNormalized.rGain;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = bGain;
  return result;
}

- (void)setAwbComboGainsNormalized:(id)a3
{
  self->_awbComboGainsNormalized = ($BFF84FA8B35404205C764F9DEA58D0AB)a3;
}

- ($938B03310D06493B2963E5A84CB75A7E)awbGains
{
  unsigned int bGain = self->_awbGains.bGain;
  uint64_t v3 = *(void *)&self->_awbGains.rGain;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = bGain;
  return result;
}

- (void)setAwbGains:(id)a3
{
  self->_awbGains = ($BFF84FA8B35404205C764F9DEA58D0AB)a3;
}

- (NSMutableDictionary)outputMetadata
{
  return self->_outputMetadata;
}

- (void)setOutputMetadata:(id)a3
{
}

- (MTLTexture)skyMask
{
  return self->_skyMask;
}

- (void)setSkyMask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skyMask, 0);
  objc_storeStrong((id *)&self->_outputMetadata, 0);
  objc_storeStrong((id *)&self->_lscMaxGain, 0);
  objc_storeStrong((id *)&self->_skipDemosaic, 0);
  objc_storeStrong((id *)&self->_faceAssistedSkinGainsToMatch, 0);
  objc_storeStrong((id *)&self->_faceAssistedBehaviorMode, 0);
  objc_storeStrong((id *)&self->_regionOfInterestRectInBufferCoords, 0);
  objc_storeStrong((id *)&self->_validRectInBufferCoords, 0);
  objc_storeStrong((id *)&self->_validRectInSensorReadoutCoords, 0);
  objc_storeStrong((id *)&self->_digitalFlash, 0);
  objc_storeStrong((id *)&self->_downsizeFactor, 0);
  objc_storeStrong((id *)&self->_cfaLayout, 0);
  objc_storeStrong((id *)&self->_firstPixel, 0);
  objc_storeStrong((id *)&self->_skinMask, 0);
  objc_storeStrong((id *)&self->_lscGainsTex, 0);
  objc_storeStrong((id *)&self->_clippedTex, 0);
  objc_storeStrong((id *)&self->_imageTex, 0);
  objc_storeStrong((id *)&self->_secondaryCameraInfo, 0);
  objc_storeStrong((id *)&self->_cameraInfo, 0);
  objc_storeStrong((id *)&self->_secondaryModuleConfig, 0);
  objc_storeStrong((id *)&self->_moduleConfig, 0);
  objc_storeStrong((id *)&self->_setFileDict, 0);
  objc_storeStrong((id *)&self->_registers, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end