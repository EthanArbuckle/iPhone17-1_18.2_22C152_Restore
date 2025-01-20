@interface ProcessingEngine
- (BOOL)hdr10_tm_configChanged:(_HDR10TMParam *)a3 HDRControl:(id *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6;
- (BOOL)hlg_tm_configChanged:(id *)a3 HDRControl:(id *)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7;
- (ProcessingEngine)init;
- (void)createLUTFromDMConfig:(id *)a3 DM:(id)a4 TCControl:(ToneCurve_Control *)a5 HDRControl:(id *)a6 LLDoVi:(BOOL)a7;
- (void)dealloc;
- (void)hdr10_tm_reserveConfig:(_HDR10TMParam *)a3 HDRControl:(id *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6;
- (void)hlg_tm_reserveConfig:(id *)a3 HDRControl:(id *)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7;
- (void)printArray:(__sFILE *)a3 Prefix:(const char *)a4 Array:(void *)a5 Size:(unint64_t)a6 NumberPerLine:(unint64_t)a7 Format:(int)a8;
- (void)setupToneMappingWithDmData:(id *)a3 tcControl:(ToneCurve_Control *)a4 hdrControl:(id *)a5 dmConfig:(id *)a6 DM:(id)a7 hdr10InfoFrame:(id *)a8;
@end

@implementation ProcessingEngine

- (ProcessingEngine)init
{
  v6.receiver = self;
  v6.super_class = (Class)ProcessingEngine;
  v2 = [(ProcessingEngine *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ProcessingEngine;
  [(ProcessingEngine *)&v2 dealloc];
}

- (BOOL)hdr10_tm_configChanged:(_HDR10TMParam *)a3 HDRControl:(id *)a4 EdrAdaptationParam:(_EdrAdaptationParam *)a5 AmbAdaptationParam:(_AmbAdaptationParam *)a6
{
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    v12 = GetConfig((HDRConfig *)Config);
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

- (BOOL)hlg_tm_configChanged:(id *)a3 HDRControl:(id *)a4 TMParam:(_HLGTMParam *)a5 EdrAdaptationParam:(_EdrAdaptationParam *)a6 AmbAdaptationParam:(_AmbAdaptationParam *)a7
{
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    v14 = GetConfig((HDRConfig *)Config);
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

- (void)createLUTFromDMConfig:(id *)a3 DM:(id)a4 TCControl:(ToneCurve_Control *)a5 HDRControl:(id *)a6 LLDoVi:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v12 = a4;
  int processingType = a5->tmData.processingType;
  if (processingType != 5)
  {
    if (processingType != 2)
    {
      if (processingType == 1)
      {
        [(ProcessingEngine *)self hdr10_createLUTFromDMConfig:a3 DM:v12 TCControl:a5 HDRControl:a6 TMParam:&a5->hdr10TmParam EdrAdaptationParam:&a5->edrAdaptationParam AmbAdaptationParam:&a5->ambAdaptationParam];
      }
      else
      {
        if ((processingType | 4) != 4)
        {
          if (enableLogInstance)
          {
            if (logInstanceID) {
              uint64_t v15 = logInstanceID;
            }
            else {
              uint64_t v15 = prevLogInstanceID;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v20 = WORD1(v15);
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"processingType == kHDRProcessingTypeDoVi || processingType == kHDRProcessingTypeDoVi84\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Engine/ProcessingEngine.mm\" at line 227\n", buf, 0xCu);
            }
            prevLogInstanceID = v15;
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"processingType == kHDRProcessingTypeDoVi || processingType == kHDRProcessingTypeDoVi84\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Engine/ProcessingEngine.mm\" at line 227\n", buf, 2u);
          }
        }
        if (processingType == 4 && a6->var17 == 18) {
          BOOL v16 = !self->_enableHwOOTF || !self->_enableHwOotfForDolby84;
        }
        else {
          BOOL v16 = 0;
        }
        BYTE3(v18) = a6->var10 - 3 < 2;
        BYTE2(v18) = processingType == 4;
        BYTE1(v18) = ((debugDM4DisableConf & 0x80) == 0) & (*(unsigned __int16 *)&a3[1].var50 >> 7);
        LOBYTE(v18) = v16;
        -[ProcessingEngine dovi_createLUTFromDMConfig:DM:HDRControl:LLDoVi:TMParam:EdrAdaptationParam:AmbAdaptationParam:HlgOOTFCombined:HlgOOTFOnly:IsDoVi84:IsInternalDisplay:tcCtrl:](self, "dovi_createLUTFromDMConfig:DM:HDRControl:LLDoVi:TMParam:EdrAdaptationParam:AmbAdaptationParam:HlgOOTFCombined:HlgOOTFOnly:IsDoVi84:IsInternalDisplay:tcCtrl:", a3, v12, a6, v7, &a5->doviTmParam, &a5->edrAdaptationParam, &a5->ambAdaptationParam, v18, a5);
      }
      goto LABEL_31;
    }
LABEL_14:
    a5->hlgTmParam.enableHwOOTF = self->_enableHwOOTF;
    a5->hlgTmParam.enableHwOotfForHLG = self->_enableHwOotfForHLG;
    LODWORD(v17) = a5->tmData.hlgTmMode;
    [(ProcessingEngine *)self hlg_createLUTFromDMConfig:a3 DM:v12 HDRControl:a6 TMParam:&a5->hlgTmParam EdrAdaptationParam:&a5->edrAdaptationParam AmbAdaptationParam:&a5->ambAdaptationParam TMMode:v17];
    goto LABEL_31;
  }
  if (a6->var17 != 18) {
    goto LABEL_31;
  }
  if (a5->targetTransferFunction != 18) {
    goto LABEL_14;
  }
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
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = WORD1(v14);
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"hdrCtrl->transferFunction != kIOSurfaceTagColorTransferFunction_ITU_R_2100_HLG\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Engine/ProcessingEngine.mm\" at line 224\n", buf, 0xCu);
    }
    prevLogInstanceID = v14;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"hdrCtrl->transferFunction != kIOSurfaceTagColorTransferFunction_ITU_R_2100_HLG\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Engine/ProcessingEngine.mm\" at line 224\n", buf, 2u);
  }
LABEL_31:
}

- (void)setupToneMappingWithDmData:(id *)a3 tcControl:(ToneCurve_Control *)a4 hdrControl:(id *)a5 dmConfig:(id *)a6 DM:(id)a7 hdr10InfoFrame:(id *)a8
{
  uint64_t v14 = (HDRConfig *)a7;
  v24 = v14;
  unsigned int var10 = a5->var10;
  BOOL v16 = var10 > 7;
  int v17 = (1 << var10) & 0xB8;
  if (v16 || v17 == 0)
  {
    BYTE1(a6[1].var52) = 0;
  }
  else
  {
    BYTE1(a6[1].var52) = 1;
    a4->targetMaxLinear = a4->Tmax_nits;
  }
  Config = GetConfig(v14);
  if (Config)
  {
    uint64_t v20 = GetConfig((HDRConfig *)Config);
    BOOL v21 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v20, 0x25u, 0) != 0;
  }
  else
  {
    BOOL v21 = 0;
  }
  a4->atmEnable = v21;
  a4->tmData.contentPercentiles.n = 3;
  a4->tmData.contentPercentiles.percents[0] = 0.25;
  *(void *)&a4->tmData.contentPercentiles.percents[1] = 0x3F4000003F000000;
  a4->tmData.contentPercentiles.percentiles[0] = 0.25;
  *(void *)&a4->tmData.contentPercentiles.percentiles[1] = 0x3F4000003F000000;
  if (a5->var0 == 1) {
    [(HDRConfig *)v24 setDisplayManagementConfigFromMetaData:a3 config:a6 hdrCtrl:a5 tcCtrl:a4];
  }
  else {
    [(HDRConfig *)v24 setDisplayManagementConfigFromDictionary:a6 hdrCtrl:a5 tcCtrl:a4 infoFrame:a8];
  }
  if (a4->atmEnable)
  {
    v22 = [(HDRConfig *)v24 getAdaptiveTM];
    HIDWORD(v23) = self->_frameNumber;
    LOBYTE(v23) = 1;
    objc_msgSend(v22, "adaptiveToneMappingManagement:DMConfig:DM:TCControl:HDRControl:hdr10InfoFrame:LLDoVi:frameNumber:", a3, a6, v24, a4, a5, a8, v23);
  }
  [(ProcessingEngine *)self setDisplayManagementParametricConfig:a4 HDRControl:a5];
  [(ProcessingEngine *)self createLUTFromDMConfig:a6 DM:v24 TCControl:a4 HDRControl:a5 LLDoVi:1];
}

- (void)printArray:(__sFILE *)a3 Prefix:(const char *)a4 Array:(void *)a5 Size:(unint64_t)a6 NumberPerLine:(unint64_t)a7 Format:(int)a8
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  bzero(v22, 0x2000uLL);
  if (a3)
  {
    if (a6)
    {
      unint64_t v12 = 0;
      unsigned int v13 = 1;
      do
      {
        if (v13 != 1 && !(v12 % a7)) {
          fputc(10, a3);
        }
        switch(a8)
        {
          case 0:
            fprintf(a3, "%s%.10f%s");
            break;
          case 1:
          case 3:
            fprintf(a3, "%s%u%s");
            break;
          default:
            fprintf(a3, "%s%d%s");
            break;
        }
        unint64_t v12 = v13++;
      }
      while (v12 < a6);
    }
  }
  else
  {
    if (a6)
    {
      unint64_t v14 = 0;
      int v15 = 0;
      unsigned int v16 = 1;
      while (2)
      {
        if (v16 != 1 && !(v14 % a7)) {
          v15 += snprintf(&v22[v15], 0x2000 - v15, "\n");
        }
        switch(a8)
        {
          case 0:
            int v17 = snprintf(&v22[v15], 0x2000 - v15, "%s%.10f%s");
            goto LABEL_27;
          case 1:
            uint64_t v20 = &v22[v15];
            size_t v21 = 0x2000 - v15;
            goto LABEL_26;
          case 2:
            uint64_t v18 = &v22[v15];
            size_t v19 = 0x2000 - v15;
            goto LABEL_23;
          case 3:
            uint64_t v20 = &v22[v15];
            size_t v21 = 0x2000 - v15;
LABEL_26:
            int v17 = snprintf(v20, v21, "%s%u%s");
            goto LABEL_27;
          case 4:
            uint64_t v18 = &v22[v15];
            size_t v19 = 0x2000 - v15;
            goto LABEL_23;
          default:
            uint64_t v18 = &v22[v15];
            size_t v19 = 0x2000 - v15;
LABEL_23:
            int v17 = snprintf(v18, v19, "%s%d%s");
LABEL_27:
            v15 += v17;
            unint64_t v14 = v16++;
            if (v14 >= a6) {
              break;
            }
            continue;
        }
        break;
      }
    }
    printf("%s", v22);
  }
}

@end