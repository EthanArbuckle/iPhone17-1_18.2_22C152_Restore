@interface ASEProcessingT1
- (ASEProcessingT1)initWithConfig:(id *)a3 aseProcessing:(id)a4 productType:(unsigned int)a5;
- (id)populateOutputHcus:(hwConfigurationUnitsV3_t *)a3;
- (int64_t)processFrameWithInput:(id *)a3 callback:(id)a4;
- (int64_t)processFrameWithInput:(id *)a3 outputData:(id *)a4;
- (void)DumpArray:(const char *)a3 array:(unsigned int *)a4 count:(unsigned int)a5;
- (void)DumpOutputHcus:(id)a3;
- (void)DumpPiecewiseLinearCurveV3:(const char *)a3 curve:(id *)a4;
- (void)configControlHeader_V3:(hwConfigurationUnitsV3_t *)a3;
- (void)dealloc;
- (void)processPixelWithInput:(id *)a3 controlUnitV3:(hwConfigurationUnitsV3_t *)a4;
- (void)processPixelWithInput_V3:(id *)a3 Output:(hwConfigurationUnitsV3_t *)a4;
- (void)processPixelWithMeasurement_V3:(id *)a3 Output:(hwConfigurationUnitsV3_t *)a4;
- (void)processPixelWithPixelControl_V3:(hwConfigurationUnitsV3_t *)a3;
@end

@implementation ASEProcessingT1

- (ASEProcessingT1)initWithConfig:(id *)a3 aseProcessing:(id)a4 productType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASEProcessingT1;
  v9 = [(ASEProcessingT0 *)&v13 initWithConfig:a3 aseProcessing:v8 productType:v5];
  v10 = v9;
  if (v9)
  {
    if (!isT1OrNewer(v9->super._productType))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"isT1OrNewer(_productType)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 88\n", buf, 2u);
      }
      if (!isT1OrNewer(v10->super._productType)) {
        -[ASEProcessingT1 initWithConfig:aseProcessing:productType:]();
      }
    }
    v10->_aseControlUnitV3 = (hwConfigurationUnitsV3_t *)malloc_type_malloc(0x4EF0uLL, 0x10000406724B787uLL);
    if (disableHcuCache)
    {
      if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[ASEProcessingT1 initWithConfig:aseProcessing:productType:]";
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s: HCU Cache disabled!\n", buf, 0xCu);
      }
      v10->_aseControlUnitV3Cache = 0;
    }
    else
    {
      if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[ASEProcessingT1 initWithConfig:aseProcessing:productType:]";
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s: HCU Cache enabled!\n", buf, 0xCu);
      }
      v11 = ($C4EB042D48733C4754B40AB9ACD610BF *)malloc_type_malloc(0x90uLL, 0x1020040206F8E95uLL);
      v10->_aseControlUnitV3Cache = v11;
      initCache(v11);
    }
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  aseControlUnitV3 = self->_aseControlUnitV3;
  if (aseControlUnitV3)
  {
    free(aseControlUnitV3);
    self->_aseControlUnitV3 = 0;
  }
  aseControlUnitV3Cache = self->_aseControlUnitV3Cache;
  if (aseControlUnitV3Cache)
  {
    deleteCache(aseControlUnitV3Cache);
    self->_aseControlUnitV3Cache = 0;
  }
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ASEProcessingT1 dealloc]";
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)ASEProcessingT1;
  [(ASEProcessingT0 *)&v5 dealloc];
}

- (void)DumpArray:(const char *)a3 array:(unsigned int *)a4 count:(unsigned int)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a5)
  {
    unint64_t v5 = 0;
    unint64_t v6 = a5 - 1;
    uint64_t v7 = a5;
    uint64_t v8 = __str;
    unsigned int v9 = 256;
    do
    {
      if (v5)
      {
        if (v5 >= v6) {
          unsigned int v10 = snprintf(v8, v9, ", %d }");
        }
        else {
          unsigned int v10 = snprintf(v8, v9, ", %d");
        }
      }
      else
      {
        unsigned int v10 = snprintf(v8, v9, "%s { %d");
      }
      v8 += v10;
      v9 -= v10;
      ++v5;
    }
    while (v7 != v5);
  }
  if (logLevel > 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = __str;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s\n", buf, 0xCu);
  }
}

- (void)DumpPiecewiseLinearCurveV3:(const char *)a3 curve:(id *)a4
{
  uint64_t v5 = 0;
  uint64_t v22 = *MEMORY[0x263EF8340];
  unsigned int v6 = logLevel;
  p_var2 = &a4->var0[0].var2;
  uint64_t v8 = &_os_log_internal;
  do
  {
    if (v6 >= 3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = *(p_var2 - 2);
        double v10 = *(p_var2 - 1);
        double v11 = *p_var2;
        *(_DWORD *)buf = 136316162;
        objc_super v13 = a3;
        __int16 v14 = 1024;
        int v15 = v5;
        __int16 v16 = 2048;
        double v17 = v9;
        __int16 v18 = 2048;
        double v19 = v10;
        __int16 v20 = 2048;
        double v21 = v11;
        _os_log_impl(&dword_2107A5000, v8, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s #%d: { %f, %f, %f }\n", buf, 0x30u);
      }
      unsigned int v6 = logLevel;
    }
    ++v5;
    p_var2 += 3;
  }
  while (v5 != 32);
}

- (void)DumpOutputHcus:(id)a3
{
  uint64_t v388 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  if (!dumpOutputHcu) {
    goto LABEL_133;
  }
  unsigned int v6 = (int *)v5;
  if (logLevel >= 3)
  {
    uint64_t v7 = &_os_log_internal;
    id v8 = &_os_log_internal;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = *v6;
      unsigned int v10 = v6[1];
      *(_DWORD *)buf = 136315650;
      v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v374 = 1024;
      unsigned int v375 = v9;
      __int16 v376 = 1024;
      unsigned int v377 = v10;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: hcuHeader: hcuCount = %d, hcuSize = %d\n", buf, 0x18u);
    }
  }
  if (*v6)
  {
    unsigned int v11 = 0;
    v363 = 0;
    v364 = 0;
    v366 = 0;
    v365 = 0;
    v12 = 0;
    v362 = 0;
    objc_super v13 = (unsigned int *)(v6 + 2);
    __int16 v14 = &_os_log_internal;
    do
    {
      if (logLevel >= 3)
      {
        int v15 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v17 = *v13;
          unsigned int v16 = v13[1];
          *(_DWORD *)buf = 136316930;
          v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
          __int16 v374 = 1024;
          unsigned int v375 = v11;
          __int16 v376 = 1024;
          unsigned int v377 = v16;
          __int16 v378 = 1024;
          unsigned int v379 = v17;
          __int16 v380 = 1024;
          unsigned int v381 = HIBYTE(v17);
          __int16 v382 = 1024;
          int v383 = BYTE2(v17);
          __int16 v384 = 1024;
          int v385 = BYTE1(v17);
          __int16 v386 = 1024;
          int v387 = v17;
          _os_log_impl(&dword_2107A5000, v14, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: entryHeader[%d]: hcuSize = %d, hcuType = 0x%x ('%c%c%c%c')\n", buf, 0x36u);
        }
      }
      __int16 v18 = v13 + 2;
      switch(*v13)
      {
        case 0x6173656Bu:
          v366 = (float *)(v13 + 2);
          __int16 v18 = v13 + 323;
          break;
        case 0x6173656Cu:
          v365 = (float *)(v13 + 2);
          __int16 v18 = v13 + 529;
          break;
        case 0x6173656Du:
          v364 = (float *)(v13 + 2);
          __int16 v18 = v13 + 390;
          break;
        case 0x6173656Eu:
          v362 = (int *)(v13 + 2);
          __int16 v18 = v13 + 7;
          break;
        case 0x6173656Fu:
          v12 = (int *)(v13 + 2);
          __int16 v18 = v13 + 4;
          break;
        case 0x61736570u:
          v363 = (int *)(v13 + 2);
          __int16 v18 = v13 + 8;
          break;
        default:
          if (logLevel >= 3)
          {
            double v19 = v14;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v20 = *v13;
              *(_DWORD *)buf = 136316418;
              v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
              __int16 v374 = 1024;
              unsigned int v375 = v20;
              __int16 v376 = 1024;
              unsigned int v377 = HIBYTE(v20);
              __int16 v378 = 1024;
              unsigned int v379 = BYTE2(v20);
              __int16 v380 = 1024;
              unsigned int v381 = BYTE1(v20);
              __int16 v382 = 1024;
              int v383 = v20;
              _os_log_impl(&dword_2107A5000, v14, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ERROR: Unsupported HCU!  hcuType = 0x%x ('%c%c%c%c')\n", buf, 0x2Au);
            }
          }
          break;
      }
      ++v11;
      objc_super v13 = v18;
    }
    while (v11 < *v6);
  }
  else
  {
    v362 = 0;
    v363 = 0;
    v12 = 0;
    v364 = 0;
    v365 = 0;
    v366 = 0;
  }
  double v21 = v364;
  if ((dumpOutputHcu & 2) != 0)
  {
    unsigned int v22 = logLevel;
    if (v363)
    {
      v23 = self;
      if (logLevel >= 3)
      {
        v24 = &_os_log_internal;
        id v25 = &_os_log_internal;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", buf, 0xCu);
        }

        if (logLevel < 3) {
          goto LABEL_44;
        }
        v26 = v24;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v27 = *v363;
          unsigned int v28 = v363[1];
          unsigned int v29 = v363[2];
          unsigned int v30 = v363[3];
          int v31 = v363[4];
          int v32 = v363[5];
          *(_DWORD *)buf = 136316674;
          v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
          __int16 v374 = 1024;
          unsigned int v375 = v27;
          __int16 v376 = 1024;
          unsigned int v377 = v28;
          __int16 v378 = 1024;
          unsigned int v379 = v29;
          __int16 v380 = 1024;
          unsigned int v381 = v30;
          __int16 v382 = 1024;
          int v383 = v31;
          __int16 v384 = 1024;
          int v385 = v32;
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: scalingConfigV3Hcu: DDAInitX = %u, DDAInitY = %u, DDAStepX = 0x%x, DDAStepY = 0x%x, DDAInvStepX = 0x%x, DDAInvStepY = 0x%x\n", buf, 0x30u);
        }

        unsigned int v22 = logLevel;
      }
    }
    else
    {
      v23 = self;
    }
    if (v12 && v22 >= 3)
    {
      v33 = &_os_log_internal;
      id v34 = &_os_log_internal;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", buf, 0xCu);
      }

      if (logLevel >= 3)
      {
        v35 = v33;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v36 = *v12;
          unsigned int v37 = v12[1];
          *(_DWORD *)buf = 136315650;
          v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
          __int16 v374 = 1024;
          unsigned int v375 = v36;
          __int16 v376 = 1024;
          unsigned int v377 = v37;
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: angleDetectV3Hcu: signChangeThreshold = %u, hfeqThresh2 = %u\n", buf, 0x18u);
        }
      }
    }
LABEL_44:
    if (v364)
    {
      snprintf((char *)buf, 0x100uLL, "    %s: blendConfigV3Hcu:", "-[ASEProcessingT1 DumpOutputHcus:]");
      if (logLevel >= 3)
      {
        v38 = &_os_log_internal;
        id v39 = &_os_log_internal;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
        }

        if (logLevel >= 3)
        {
          v40 = v38;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v367 = 136315138;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: blendConfigV3Hcu: blendCurve[kASEBlendCurveEbeFactor]:\n", v367, 0xCu);
          }
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v364];
      if (logLevel >= 3)
      {
        v41 = &_os_log_internal;
        id v42 = &_os_log_internal;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: blendConfigV3Hcu: blendCurve[kASEBlendCurveW_EBE]:\n", v367, 0xCu);
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v364 + 96];
      if (logLevel >= 3)
      {
        v43 = &_os_log_internal;
        id v44 = &_os_log_internal;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: blendConfigV3Hcu: blendCurve[kASEBlendCurveW_Peaking]:\n", v367, 0xCu);
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v364 + 192];
      if (logLevel >= 3)
      {
        v45 = &_os_log_internal;
        id v46 = &_os_log_internal;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: blendConfigV3Hcu: blendCurve[kASEBlendCurveLuma]:\n", v367, 0xCu);
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v364 + 288];
      if (logLevel >= 3)
      {
        v47 = &_os_log_internal;
        id v48 = &_os_log_internal;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          int v49 = *((_DWORD *)v364 + 384);
          int v50 = *((_DWORD *)v364 + 385);
          int v51 = *((_DWORD *)v364 + 386);
          int v52 = *((_DWORD *)v364 + 387);
          *(_DWORD *)v367 = 136316162;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          __int16 v369 = 1024;
          *(_DWORD *)v370 = v49;
          *(_WORD *)&v370[4] = 1024;
          *(_DWORD *)&v370[6] = v50;
          *(_WORD *)v371 = 1024;
          *(_DWORD *)&v371[2] = v51;
          *(_WORD *)&v371[6] = 1024;
          *(_DWORD *)&v371[8] = v52;
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: blendConfigV3Hcu: BlendLogicSkinToneProtection: toneThresh = %u, toneEdgeThresh = %u, toneMaxThresh = %d, toneFactor = %d\n", v367, 0x24u);
        }
      }
    }
    if (v365)
    {
      snprintf((char *)buf, 0x100uLL, "    %s: ebeConfigV3Hcu:", "-[ASEProcessingT1 DumpOutputHcus:]");
      if (logLevel >= 3)
      {
        v53 = &_os_log_internal;
        id v54 = &_os_log_internal;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
        }

        if (logLevel >= 3)
        {
          v55 = v53;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v367 = 136315138;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: EBECurve[kASEEBECurveEbeV3]:\n", v367, 0xCu);
          }
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v365];
      if (logLevel >= 3)
      {
        v56 = &_os_log_internal;
        id v57 = &_os_log_internal;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: EBECurve[kASEEBECurveHf1PosV3]:\n", v367, 0xCu);
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v365 + 96];
      if (logLevel >= 3)
      {
        v58 = &_os_log_internal;
        id v59 = &_os_log_internal;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: EBECurve[kASEEBECurveHf1NegV3]:\n", v367, 0xCu);
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v365 + 192];
      if (logLevel >= 3)
      {
        v60 = &_os_log_internal;
        id v61 = &_os_log_internal;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: EBECurve[kASEEBECurveHf2V3]:\n", v367, 0xCu);
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v365 + 288];
      if (logLevel >= 3)
      {
        v62 = &_os_log_internal;
        id v63 = &_os_log_internal;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: EBECurve[kASEEBECurveHf3V3]:\n", v367, 0xCu);
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v365 + 384];
      if (logLevel >= 3)
      {
        v64 = &_os_log_internal;
        id v65 = &_os_log_internal;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          int v66 = *((_DWORD *)v365 + 480);
          int v67 = *((_DWORD *)v365 + 481);
          int v68 = *((_DWORD *)v365 + 482);
          *(_DWORD *)v367 = 136315906;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          __int16 v369 = 1024;
          *(_DWORD *)v370 = v66;
          *(_WORD *)&v370[4] = 1024;
          *(_DWORD *)&v370[6] = v67;
          *(_WORD *)v371 = 1024;
          *(_DWORD *)&v371[2] = v68;
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: ebeParams: { sdaPenalty1 = %d, sdaPenalty2 = %d, dFfactor = %d }\n", v367, 0x1Eu);
        }
      }
      snprintf((char *)buf, 0x100uLL, "    %s: ebeConfigV3Hcu: lowPass :", "-[ASEProcessingT1 DumpOutputHcus:]");
      [(ASEProcessingT1 *)v23 DumpArray:buf array:v365 + 483 count:26];
      snprintf((char *)buf, 0x100uLL, "    %s: ebeConfigV3Hcu: weightLut :", "-[ASEProcessingT1 DumpOutputHcus:]");
      [(ASEProcessingT1 *)v23 DumpArray:buf array:v365 + 509 count:18];
    }
    if (v366)
    {
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu:", "-[ASEProcessingT1 DumpOutputHcus:]");
      if (logLevel >= 3)
      {
        v69 = &_os_log_internal;
        id v70 = &_os_log_internal;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
        }

        if (logLevel >= 3)
        {
          v71 = v69;
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            float v72 = *v366;
            *(_DWORD *)v367 = 136315394;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            __int16 v369 = 1024;
            *(float *)v370 = v72;
            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: peakingConfigV3Hcu: gainForce = %d\n", v367, 0x12u);
          }

          if (logLevel >= 3)
          {
            v73 = v69;
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v367 = 136315138;
              v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
              _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: peakingConfigV3Hcu: coreGainCurve:\n", v367, 0xCu);
            }
          }
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v366 + 1];
      if (logLevel >= 3)
      {
        v74 = &_os_log_internal;
        id v75 = &_os_log_internal;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: peakingConfigV3Hcu: lowAdaptGainCurve:\n", v367, 0xCu);
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v366 + 97];
      if (logLevel >= 3)
      {
        v76 = &_os_log_internal;
        id v77 = &_os_log_internal;
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: peakingConfigV3Hcu: mediumAdaptGainCurve:\n", v367, 0xCu);
        }
      }
      [(ASEProcessingT1 *)v23 DumpPiecewiseLinearCurveV3:buf curve:v366 + 193];
      if (logLevel >= 3)
      {
        v78 = &_os_log_internal;
        id v79 = &_os_log_internal;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          int v80 = *((_DWORD *)v366 + 289);
          int v81 = *((_DWORD *)v366 + 290);
          int v82 = *((_DWORD *)v366 + 291);
          int v83 = *((_DWORD *)v366 + 292);
          int v84 = *((_DWORD *)v366 + 293);
          *(_DWORD *)v367 = 136316418;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          __int16 v369 = 1024;
          *(_DWORD *)v370 = v80;
          *(_WORD *)&v370[4] = 1024;
          *(_DWORD *)&v370[6] = v81;
          *(_WORD *)v371 = 1024;
          *(_DWORD *)&v371[2] = v82;
          *(_WORD *)&v371[6] = 1024;
          *(_DWORD *)&v371[8] = v83;
          *(_WORD *)&v371[12] = 1024;
          *(_DWORD *)&v371[14] = v84;
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: peakingConfigV3Hcu: peakingGain: adaptive = %u, gain5_3 = %u, gain7_5 = %u, gain11_9 = %u, gain13_11 = %u,\n", v367, 0x2Au);
        }
      }
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt3 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      [(ASEProcessingT1 *)v23 DumpArray:buf array:v366 + 294 count:2];
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt5 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      [(ASEProcessingT1 *)v23 DumpArray:buf array:v366 + 296 count:3];
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt7 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      [(ASEProcessingT1 *)v23 DumpArray:buf array:v366 + 299 count:4];
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt9 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      [(ASEProcessingT1 *)v23 DumpArray:buf array:v366 + 303 count:5];
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt11 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      [(ASEProcessingT1 *)v23 DumpArray:buf array:v366 + 308 count:6];
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt13 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      [(ASEProcessingT1 *)v23 DumpArray:buf array:v366 + 314 count:7];
    }
    if (v362 && logLevel >= 3)
    {
      v85 = &_os_log_internal;
      id v86 = &_os_log_internal;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v367 = 136315138;
        v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
      }

      if (logLevel >= 3)
      {
        v87 = v85;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          int v88 = *v362;
          int v89 = v362[1];
          *(_DWORD *)v367 = 136315650;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          __int16 v369 = 1024;
          *(_DWORD *)v370 = v88;
          *(_WORD *)&v370[4] = 1024;
          *(_DWORD *)&v370[6] = v89;
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: noiseMeterV3Hcu: NoiseMeter: NoiseMeterConfig: sizeX = %u, sizeY = %u\n", v367, 0x18u);
        }

        if (logLevel >= 3)
        {
          v90 = v85;
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            int v91 = v362[2];
            int v92 = v362[3];
            int v93 = v362[4];
            *(_DWORD *)v367 = 136315906;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            __int16 v369 = 1024;
            *(_DWORD *)v370 = v91;
            *(_WORD *)&v370[4] = 1024;
            *(_DWORD *)&v370[6] = v92;
            *(_WORD *)v371 = 1024;
            *(_DWORD *)&v371[2] = v93;
            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: noiseMeterV3Hcu: NoiseMeter: NoiseMeterGainControl: lut0Gain = %u, lut1Gain = %u, lut2Gain = %u\n", v367, 0x1Eu);
          }
        }
      }
    }
  }
  if ((dumpOutputHcu & 1) == 0) {
    goto LABEL_133;
  }
  unsigned int v94 = logLevel;
  if (v12 && logLevel >= 3)
  {
    v95 = &_os_log_internal;
    id v96 = &_os_log_internal;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v367 = 136315138;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v97 = v95;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      int v98 = v12[1];
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = 0x305009B90;
      *(_WORD *)&v370[8] = 2080;
      *(void *)v371 = "XXXXXXXX";
      *(_WORD *)&v371[8] = 2080;
      *(void *)&v371[10] = "XXXXXXXX";
      *(_WORD *)&v371[18] = 2080;
      *(void *)&v371[20] = "XXXXXXXX";
      *(_WORD *)&v371[28] = 1024;
      *(_DWORD *)&v371[30] = v98;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %s %s %08x\n", v367, 0x3Au);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v99 = v95;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      int v100 = *v12 & 7;
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = 0x305009BB0;
      *(_WORD *)&v370[8] = 2080;
      *(void *)v371 = "XXXXXXXX";
      *(_WORD *)&v371[8] = 1024;
      *(_DWORD *)&v371[10] = v100;
      *(_WORD *)&v371[14] = 2080;
      *(void *)&v371[16] = "XXXXXXXX";
      *(_WORD *)&v371[24] = 2080;
      *(void *)&v371[26] = "XXXXXXXX";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %08x %s %s\n", v367, 0x3Au);
    }

    unsigned int v94 = logLevel;
  }
  if (v363 && v94 >= 3)
  {
    v101 = &_os_log_internal;
    id v102 = &_os_log_internal;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v367 = 136315138;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v103 = v101;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      int v104 = v363[3];
      unsigned int v106 = *v363;
      int v105 = v363[1];
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = 0x305009E00;
      *(_WORD *)&v370[8] = 2080;
      *(void *)v371 = "XXXXXXXX";
      *(_WORD *)&v371[8] = 1024;
      *(_DWORD *)&v371[10] = v105;
      *(_WORD *)&v371[14] = 1024;
      *(_DWORD *)&v371[16] = v104;
      *(_WORD *)&v371[20] = 1024;
      *(_DWORD *)&v371[22] = v106;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %08x %08x %08x\n", v367, 0x32u);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v107 = v101;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      int v108 = v363[2];
      int v110 = v363[4];
      int v109 = v363[5];
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = 0x305009E10;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v108;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v109;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v110;
      *(_WORD *)&v371[16] = 2080;
      *(void *)&v371[18] = "XXXXXXXX";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %s\n", v367, 0x32u);
    }

    unsigned int v94 = logLevel;
  }
  if (v364 && v94 >= 3)
  {
    v111 = &_os_log_internal;
    id v112 = &_os_log_internal;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v367 = 136315138;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    uint64_t v113 = 0x30500A040;
    v114 = v111;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v115 = *v364 & 0x7FF | ((v364[3] & 0x7FF) << 16);
      unsigned int v116 = v364[6] & 0x7FF | ((v364[9] & 0x7FF) << 16);
      unsigned int v117 = v364[12] & 0x7FF | ((v364[15] & 0x7FF) << 16);
      unsigned int v118 = v364[18] & 0x7FF | ((v364[21] & 0x7FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = 0x30500A030;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v115;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v116;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v117;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v118;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v119 = v111;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      float v120 = v364[8];
      float v121 = v364[11];
      int v122 = (int)v364[2];
      int v123 = (int)v364[5];
      unsigned int v124 = v364[1] | (unsigned __int16)(v364[4] << 8) | (v364[7] << 16) | (v364[10] << 24);
      unsigned int v125 = v364[13] | (unsigned __int16)(v364[16] << 8) | (v364[19] << 16) | (v364[22] << 24);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = 0x30500A040;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v124;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v125;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v122 & 0x1FF | ((v123 & 0x1FF) << 16);
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = (int)v120 & 0x1FF | (((int)v121 & 0x1FF) << 16);
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
      uint64_t v113 = 0x30500A050;
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v126 = v111;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      int v127 = (int)v364[14] & 0x1FF | (((int)v364[17] & 0x1FF) << 16);
      int v128 = (int)v364[20] & 0x1FF | (((int)v364[23] & 0x1FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v113;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v127;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v128;
      *(_WORD *)&v371[10] = 2080;
      *(void *)&v371[12] = "XXXXXXXX";
      *(_WORD *)&v371[20] = 2080;
      *(void *)&v371[22] = "XXXXXXXX";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %s %s\n", v367, 0x36u);
    }

    unsigned int v94 = logLevel;
  }
  if (v365 && v94 >= 3)
  {
    v129 = &_os_log_internal;
    id v130 = &_os_log_internal;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v367 = 136315138;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v131 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v132 = v365[384] & 0xFFF | ((v365[387] & 0xFFF) << 16);
      unsigned int v133 = v365[390] & 0xFFF | ((v365[393] & 0xFFF) << 16);
      unsigned int v134 = v365[396] & 0xFFF | ((v365[399] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = 0x30500A100;
      *(_WORD *)&v370[8] = 2080;
      *(void *)v371 = "XXXXXXXX";
      *(_WORD *)&v371[8] = 1024;
      *(_DWORD *)&v371[10] = v132;
      *(_WORD *)&v371[14] = 1024;
      *(_DWORD *)&v371[16] = v133;
      *(_WORD *)&v371[20] = 1024;
      *(_DWORD *)&v371[22] = v134;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %08x %08x %08x\n", v367, 0x32u);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v135 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v136 = v365[402] & 0xFFF | ((v365[405] & 0xFFF) << 16);
      int v137 = (unsigned __int16)*v365 | ((unsigned __int16)v365[3] << 16);
      int v138 = (unsigned __int16)v365[6] | ((unsigned __int16)v365[9] << 16);
      int v139 = (unsigned __int16)v365[12] | ((unsigned __int16)v365[15] << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      uint64_t v140 = 0x30500A110;
      *(void *)v370 = 0x30500A110;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v136;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v137;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v138;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v139;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }
    else
    {
      uint64_t v140 = 0x30500A100;
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v141 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      int v142 = (unsigned __int16)v365[18] | ((unsigned __int16)v365[21] << 16);
      int v143 = (unsigned __int16)v365[24] | ((unsigned __int16)v365[27] << 16);
      int v144 = (unsigned __int16)v365[30] | ((unsigned __int16)v365[33] << 16);
      int v145 = (unsigned __int16)v365[36] | ((unsigned __int16)v365[39] << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v142;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v143;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v144;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v145;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v146 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      int v147 = (unsigned __int16)v365[42] | ((unsigned __int16)v365[45] << 16);
      unsigned int v148 = v365[2] & 0x3FF | ((v365[5] & 0x3FF) << 16);
      unsigned int v149 = v365[8] & 0x3FF | ((v365[11] & 0x3FF) << 16);
      unsigned int v150 = v365[14] & 0x3FF | ((v365[17] & 0x3FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v147;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v148;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v149;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v150;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v151 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v152 = v365[20] & 0x3FF | ((v365[23] & 0x3FF) << 16);
      unsigned int v153 = v365[26] & 0x3FF | ((v365[29] & 0x3FF) << 16);
      unsigned int v154 = v365[32] & 0x3FF | ((v365[35] & 0x3FF) << 16);
      unsigned int v155 = v365[38] & 0x3FF | ((v365[41] & 0x3FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v152;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v153;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v154;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v155;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v156 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v157 = v365[44] & 0x3FF | ((v365[47] & 0x3FF) << 16);
      unsigned int v158 = v365[1] & 0x3FF | ((v365[4] & 0x3FF) << 16);
      unsigned int v159 = v365[7] & 0x3FF | ((v365[10] & 0x3FF) << 16);
      unsigned int v160 = v365[13] & 0x3FF | ((v365[16] & 0x3FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v157;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v158;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v159;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v160;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v161 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v162 = v365[19] & 0x3FF | ((v365[22] & 0x3FF) << 16);
      unsigned int v163 = v365[25] & 0x3FF | ((v365[28] & 0x3FF) << 16);
      unsigned int v164 = v365[31] & 0x3FF | ((v365[34] & 0x3FF) << 16);
      unsigned int v165 = v365[37] & 0x3FF | ((v365[40] & 0x3FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v162;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v163;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v164;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v165;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v166 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v167 = v365[43] & 0x3FF | ((v365[46] & 0x3FF) << 16);
      unsigned int v168 = v365[509] & 0x1FF | ((v365[510] & 0x1FF) << 9) & 0xF803FFFF | ((v365[511] & 0x1FF) << 18);
      unsigned int v169 = v365[512] & 0x1FF | ((v365[513] & 0x1FF) << 9) & 0xF803FFFF | ((v365[514] & 0x1FF) << 18);
      unsigned int v170 = v365[515] & 0x1FF | ((v365[516] & 0x1FF) << 9) & 0xF803FFFF | ((v365[517] & 0x1FF) << 18);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v167;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v168;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v169;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v170;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v171 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v172 = v365[518] & 0x1FF | ((v365[519] & 0x1FF) << 9) & 0xF803FFFF | ((v365[520] & 0x1FF) << 18);
      unsigned int v173 = v365[521] & 0x1FF | ((v365[522] & 0x1FF) << 9) & 0xF803FFFF | ((v365[523] & 0x1FF) << 18);
      unsigned int v174 = v365[524] & 0x1FF | ((v365[525] & 0x1FF) << 9) & 0xF803FFFF | ((v365[526] & 0x1FF) << 18);
      unsigned int v175 = v365[288] & 0xFFF | ((v365[291] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v172;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v173;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v174;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v175;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v176 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v177 = v365[294] & 0xFFF | ((v365[297] & 0xFFF) << 16);
      unsigned int v178 = v365[300] & 0xFFF | ((v365[303] & 0xFFF) << 16);
      unsigned int v179 = v365[306] & 0xFFF | ((v365[309] & 0xFFF) << 16);
      int v180 = (int)v365[290] & 0x7FF | (((int)v365[293] & 0x7FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v177;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v178;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v179;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v180;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v181 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      int v182 = (int)v365[296] & 0x7FF | (((int)v365[299] & 0x7FF) << 16);
      int v183 = (int)v365[302] & 0x7FF | (((int)v365[305] & 0x7FF) << 16);
      int v184 = (int)v365[308] & 0x7FF | (((int)v365[311] & 0x7FF) << 16);
      unsigned int v185 = v365[289] & 0xFFF | ((v365[292] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v182;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v183;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v184;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v185;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v186 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v187 = v365[295] & 0xFFF | ((v365[298] & 0xFFF) << 16);
      unsigned int v188 = v365[301] & 0xFFF | ((v365[304] & 0xFFF) << 16);
      unsigned int v189 = v365[307] & 0xFFF | ((v365[310] & 0xFFF) << 16);
      unsigned int v190 = v365[96] & 0xFFF | ((v365[99] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v187;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v188;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v189;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v190;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v191 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v192 = v365[102] & 0xFFF | ((v365[105] & 0xFFF) << 16);
      unsigned int v193 = v365[108] & 0xFFF | ((v365[111] & 0xFFF) << 16);
      unsigned int v194 = v365[114] & 0xFFF | ((v365[117] & 0xFFF) << 16);
      int v195 = (int)v365[98] & 0x7FF | (((int)v365[101] & 0x7FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v192;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v193;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v194;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v195;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v196 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      int v197 = (int)v365[104] & 0x7FF | (((int)v365[107] & 0x7FF) << 16);
      int v198 = (int)v365[110] & 0x7FF | (((int)v365[113] & 0x7FF) << 16);
      int v199 = (int)v365[116] & 0x7FF | (((int)v365[119] & 0x7FF) << 16);
      unsigned int v200 = v365[97] & 0xFFF | ((v365[100] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v197;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v198;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v199;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v200;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v201 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v202 = v365[103] & 0xFFF | ((v365[106] & 0xFFF) << 16);
      unsigned int v203 = v365[109] & 0xFFF | ((v365[112] & 0xFFF) << 16);
      unsigned int v204 = v365[115] & 0xFFF | ((v365[118] & 0xFFF) << 16);
      unsigned int v205 = v365[192] & 0xFFF | ((v365[195] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v202;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v203;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v204;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v205;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v206 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v207 = v365[198] & 0xFFF | ((v365[201] & 0xFFF) << 16);
      unsigned int v208 = v365[204] & 0xFFF | ((v365[207] & 0xFFF) << 16);
      unsigned int v209 = v365[210] & 0xFFF | ((v365[213] & 0xFFF) << 16);
      int v210 = (int)v365[194] & 0x7FF | (((int)v365[197] & 0x7FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v207;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v208;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v209;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v210;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v211 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      int v212 = (int)v365[200] & 0x7FF | (((int)v365[203] & 0x7FF) << 16);
      int v213 = (int)v365[206] & 0x7FF | (((int)v365[209] & 0x7FF) << 16);
      int v214 = (int)v365[212] & 0x7FF | (((int)v365[215] & 0x7FF) << 16);
      unsigned int v215 = v365[193] & 0xFFF | ((v365[196] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v212;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v213;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v214;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v215;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v216 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      unsigned int v217 = v365[199] & 0xFFF | ((v365[202] & 0xFFF) << 16);
      unsigned int v218 = v365[205] & 0xFFF | ((v365[208] & 0xFFF) << 16);
      unsigned int v219 = v365[211] & 0xFFF | ((v365[214] & 0xFFF) << 16);
      int v220 = v365[480] & 0x3F | (((_WORD)v365[481] & 0x3F) << 6) & 0xFFF | ((v365[482] & 0x3F) << 12);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v217;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v218;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v219;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v220;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v221 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      int v222 = v365[483] & 0xFFF | ((v365[484] & 0xFFF) << 16);
      int v223 = v365[485] & 0xFFF | ((v365[486] & 0xFFF) << 16);
      int v224 = v365[487] & 0xFFF | ((v365[488] & 0xFFF) << 16);
      int v225 = v365[489] & 0xFFF | ((v365[490] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v222;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v223;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v224;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v225;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v226 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      int v227 = v365[491] & 0xFFF | ((v365[492] & 0xFFF) << 16);
      int v228 = v365[493] & 0xFFF | ((v365[494] & 0xFFF) << 16);
      int v229 = v365[495] & 0xFFF | ((v365[496] & 0xFFF) << 16);
      int v230 = v365[497] & 0xFFF | ((v365[498] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v227;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v228;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v229;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v230;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v231 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      int v232 = v365[499] & 0xFFF | ((v365[500] & 0xFFF) << 16);
      int v233 = v365[501] & 0xFFF | ((v365[502] & 0xFFF) << 16);
      int v234 = v365[503] & 0xFFF | ((v365[504] & 0xFFF) << 16);
      int v235 = v365[505] & 0xFFF | ((v365[506] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v232;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v233;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v234;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v235;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v236 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      int v237 = v365[507] & 0xFFF | ((v365[508] & 0xFFF) << 16);
      int v238 = (int)v365[386] & 0x7FF | (((int)v365[389] & 0x7FF) << 16);
      int v239 = (int)v365[392] & 0x7FF | (((int)v365[395] & 0x7FF) << 16);
      int v240 = (int)v365[398] & 0x7FF | (((int)v365[401] & 0x7FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v237;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v238;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v239;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v240;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v241 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      int v242 = (int)v365[404] & 0x7FF | (((int)v365[407] & 0x7FF) << 16);
      unsigned int v243 = v365[385] & 0xFFF | ((v365[388] & 0xFFF) << 16);
      unsigned int v244 = v365[391] & 0xFFF | ((v365[394] & 0xFFF) << 16);
      unsigned int v245 = v365[397] & 0xFFF | ((v365[400] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v242;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v243;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v244;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v245;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3) {
      goto LABEL_133;
    }
    v246 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v247 = v365[403] & 0xFFF | ((v365[406] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = v140 + 16;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v247;
      *(_WORD *)&v371[4] = 2080;
      *(void *)&v371[6] = "XXXXXXXX";
      *(_WORD *)&v371[14] = 2080;
      *(void *)&v371[16] = "XXXXXXXX";
      *(_WORD *)&v371[24] = 2080;
      *(void *)&v371[26] = "XXXXXXXX";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %s %s %s\n", v367, 0x3Au);
    }

    unsigned int v94 = logLevel;
    double v21 = v364;
  }
  if (!v366 || v94 < 3)
  {
LABEL_293:
    if (v21 && v94 >= 3)
    {
      v312 = &_os_log_internal;
      id v313 = &_os_log_internal;
      if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v367 = 136315138;
        v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
      }

      if (logLevel >= 3)
      {
        v314 = v312;
        if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v315 = v21[96] & 0x7FF | ((v21[99] & 0x7FF) << 16);
          unsigned int v316 = v21[102] & 0x7FF | ((v21[105] & 0x7FF) << 16);
          unsigned int v317 = v21[108] & 0x7FF | ((v21[111] & 0x7FF) << 16);
          unsigned int v318 = v21[114] & 0x7FF | ((v21[117] & 0x7FF) << 16);
          *(_DWORD *)v367 = 136316418;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          __int16 v369 = 2048;
          *(void *)v370 = 0x30500A4B0;
          *(_WORD *)&v370[8] = 1024;
          *(_DWORD *)v371 = v315;
          *(_WORD *)&v371[4] = 1024;
          *(_DWORD *)&v371[6] = v316;
          *(_WORD *)&v371[10] = 1024;
          *(_DWORD *)&v371[12] = v317;
          *(_WORD *)&v371[16] = 1024;
          *(_DWORD *)&v371[18] = v318;
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
        }

        if (logLevel >= 3)
        {
          v319 = v312;
          if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v320 = v21[97] & 0x7FF | ((v21[100] & 0x7FF) << 16);
            unsigned int v321 = v21[103] & 0x7FF | ((v21[106] & 0x7FF) << 16);
            unsigned int v322 = v21[109] & 0x7FF | ((v21[112] & 0x7FF) << 16);
            unsigned int v323 = v21[115] & 0x7FF | ((v21[118] & 0x7FF) << 16);
            *(_DWORD *)v367 = 136316418;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            __int16 v369 = 2048;
            uint64_t v324 = 0x30500A4C0;
            *(void *)v370 = 0x30500A4C0;
            *(_WORD *)&v370[8] = 1024;
            *(_DWORD *)v371 = v320;
            *(_WORD *)&v371[4] = 1024;
            *(_DWORD *)&v371[6] = v321;
            *(_WORD *)&v371[10] = 1024;
            *(_DWORD *)&v371[12] = v322;
            *(_WORD *)&v371[16] = 1024;
            *(_DWORD *)&v371[18] = v323;
            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
          }
          else
          {
            uint64_t v324 = 0x30500A4B0;
          }

          if (logLevel >= 3)
          {
            v325 = v312;
            if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
            {
              v324 += 16;
              int v326 = (int)v21[98] & 0x7FFF | (((int)v21[101] & 0x7FFF) << 16);
              int v327 = (int)v21[104] & 0x7FFF | (((int)v21[107] & 0x7FFF) << 16);
              int v328 = (int)v21[110] & 0x7FFF | (((int)v21[113] & 0x7FFF) << 16);
              int v329 = (int)v21[116] & 0x7FFF | (((int)v21[119] & 0x7FFF) << 16);
              *(_DWORD *)v367 = 136316418;
              v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
              __int16 v369 = 2048;
              *(void *)v370 = v324;
              *(_WORD *)&v370[8] = 1024;
              *(_DWORD *)v371 = v326;
              *(_WORD *)&v371[4] = 1024;
              *(_DWORD *)&v371[6] = v327;
              *(_WORD *)&v371[10] = 1024;
              *(_DWORD *)&v371[12] = v328;
              *(_WORD *)&v371[16] = 1024;
              *(_DWORD *)&v371[18] = v329;
              _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
            }

            if (logLevel >= 3)
            {
              v330 = v312;
              if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
              {
                v324 += 16;
                unsigned int v331 = v21[192] & 0x7FF | ((v21[195] & 0x7FF) << 16);
                unsigned int v332 = v21[198] & 0x7FF | ((v21[201] & 0x7FF) << 16);
                unsigned int v333 = v21[204] & 0x7FF | ((v21[207] & 0x7FF) << 16);
                unsigned int v334 = v21[210] & 0x7FF | ((v21[213] & 0x7FF) << 16);
                *(_DWORD *)v367 = 136316418;
                v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                __int16 v369 = 2048;
                *(void *)v370 = v324;
                *(_WORD *)&v370[8] = 1024;
                *(_DWORD *)v371 = v331;
                *(_WORD *)&v371[4] = 1024;
                *(_DWORD *)&v371[6] = v332;
                *(_WORD *)&v371[10] = 1024;
                *(_DWORD *)&v371[12] = v333;
                *(_WORD *)&v371[16] = 1024;
                *(_DWORD *)&v371[18] = v334;
                _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
              }

              if (logLevel >= 3)
              {
                v335 = v312;
                if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                {
                  v324 += 16;
                  unsigned int v336 = v21[193] & 0x7FF | ((v21[196] & 0x7FF) << 16);
                  unsigned int v337 = v21[199] & 0x7FF | ((v21[202] & 0x7FF) << 16);
                  unsigned int v338 = v21[205] & 0x7FF | ((v21[208] & 0x7FF) << 16);
                  unsigned int v339 = v21[211] & 0x7FF | ((v21[214] & 0x7FF) << 16);
                  *(_DWORD *)v367 = 136316418;
                  v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                  __int16 v369 = 2048;
                  *(void *)v370 = v324;
                  *(_WORD *)&v370[8] = 1024;
                  *(_DWORD *)v371 = v336;
                  *(_WORD *)&v371[4] = 1024;
                  *(_DWORD *)&v371[6] = v337;
                  *(_WORD *)&v371[10] = 1024;
                  *(_DWORD *)&v371[12] = v338;
                  *(_WORD *)&v371[16] = 1024;
                  *(_DWORD *)&v371[18] = v339;
                  _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                }

                if (logLevel >= 3)
                {
                  v340 = v312;
                  if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                  {
                    v324 += 16;
                    int v341 = (int)v21[194] & 0x7FFF | (((int)v21[197] & 0x7FFF) << 16);
                    int v342 = (int)v21[200] & 0x7FFF | (((int)v21[203] & 0x7FFF) << 16);
                    int v343 = (int)v21[206] & 0x7FFF | (((int)v21[209] & 0x7FFF) << 16);
                    int v344 = (int)v21[212] & 0x7FFF | (((int)v21[215] & 0x7FFF) << 16);
                    *(_DWORD *)v367 = 136316418;
                    v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                    __int16 v369 = 2048;
                    *(void *)v370 = v324;
                    *(_WORD *)&v370[8] = 1024;
                    *(_DWORD *)v371 = v341;
                    *(_WORD *)&v371[4] = 1024;
                    *(_DWORD *)&v371[6] = v342;
                    *(_WORD *)&v371[10] = 1024;
                    *(_DWORD *)&v371[12] = v343;
                    *(_WORD *)&v371[16] = 1024;
                    *(_DWORD *)&v371[18] = v344;
                    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                  }

                  if (logLevel >= 3)
                  {
                    v345 = v312;
                    if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                    {
                      v324 += 16;
                      unsigned int v346 = v364[289] & 0x7FF | ((v364[292] & 0x7FF) << 16);
                      unsigned int v347 = v364[295] & 0x7FF | ((v364[298] & 0x7FF) << 16);
                      unsigned int v348 = v364[301] & 0x7FF | ((v364[304] & 0x7FF) << 16);
                      unsigned int v349 = v364[307] & 0x7FF | ((v364[310] & 0x7FF) << 16);
                      *(_DWORD *)v367 = 136316418;
                      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                      __int16 v369 = 2048;
                      *(void *)v370 = v324;
                      *(_WORD *)&v370[8] = 1024;
                      *(_DWORD *)v371 = v346;
                      *(_WORD *)&v371[4] = 1024;
                      *(_DWORD *)&v371[6] = v347;
                      *(_WORD *)&v371[10] = 1024;
                      *(_DWORD *)&v371[12] = v348;
                      *(_WORD *)&v371[16] = 1024;
                      *(_DWORD *)&v371[18] = v349;
                      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                    }

                    if (logLevel >= 3)
                    {
                      v350 = v312;
                      if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                      {
                        v324 += 16;
                        unsigned int v351 = v364[288] & 0xFFF | ((v364[291] & 0xFFF) << 16);
                        unsigned int v352 = v364[294] & 0xFFF | ((v364[297] & 0xFFF) << 16);
                        unsigned int v353 = v364[300] & 0xFFF | ((v364[303] & 0xFFF) << 16);
                        unsigned int v354 = v364[306] & 0xFFF | ((v364[309] & 0xFFF) << 16);
                        *(_DWORD *)v367 = 136316418;
                        v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                        __int16 v369 = 2048;
                        *(void *)v370 = v324;
                        *(_WORD *)&v370[8] = 1024;
                        *(_DWORD *)v371 = v351;
                        *(_WORD *)&v371[4] = 1024;
                        *(_DWORD *)&v371[6] = v352;
                        *(_WORD *)&v371[10] = 1024;
                        *(_DWORD *)&v371[12] = v353;
                        *(_WORD *)&v371[16] = 1024;
                        *(_DWORD *)&v371[18] = v354;
                        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                      }

                      if (logLevel >= 3)
                      {
                        v355 = v312;
                        if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                        {
                          v324 += 16;
                          int v356 = (int)v364[290] & 0x7FF | (((int)v364[293] & 0x7FF) << 16);
                          int v357 = (int)v364[296] & 0x7FF | (((int)v364[299] & 0x7FF) << 16);
                          int v358 = (int)v364[302] & 0x7FF | (((int)v364[305] & 0x7FF) << 16);
                          int v359 = (int)v364[308] & 0x7FF | (((int)v364[311] & 0x7FF) << 16);
                          *(_DWORD *)v367 = 136316418;
                          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                          __int16 v369 = 2048;
                          *(void *)v370 = v324;
                          *(_WORD *)&v370[8] = 1024;
                          *(_DWORD *)v371 = v356;
                          *(_WORD *)&v371[4] = 1024;
                          *(_DWORD *)&v371[6] = v357;
                          *(_WORD *)&v371[10] = 1024;
                          *(_DWORD *)&v371[12] = v358;
                          *(_WORD *)&v371[16] = 1024;
                          *(_DWORD *)&v371[18] = v359;
                          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                        }

                        if (logLevel >= 3)
                        {
                          v360 = v312;
                          if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                          {
                            unsigned int v361 = v364[384] & 0x3F | ((v364[385] & 0x7FF) << 6) & 0x8001FFFF | ((v364[386] & 0x3F) << 17) & 0x807FFFFF | (*((_DWORD *)v364 + 387) << 23);
                            *(_DWORD *)v367 = 136316418;
                            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                            __int16 v369 = 2048;
                            *(void *)v370 = v324 + 16;
                            *(_WORD *)&v370[8] = 2080;
                            *(void *)v371 = "XXXXXXXX";
                            *(_WORD *)&v371[8] = 1024;
                            *(_DWORD *)&v371[10] = v361;
                            *(_WORD *)&v371[14] = 2080;
                            *(void *)&v371[16] = "XXXXXXXX";
                            *(_WORD *)&v371[24] = 2080;
                            *(void *)&v371[26] = "XXXXXXXX";
                            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %08x %s %s\n", v367, 0x3Au);
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
    goto LABEL_133;
  }
  v248 = &_os_log_internal;
  id v249 = &_os_log_internal;
  if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v367 = 136315138;
    v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
  }

  if (logLevel >= 3)
  {
    v250 = v248;
    if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v251 = v366[1] & 0xFFF | ((v366[4] & 0xFFF) << 16);
      unsigned int v252 = v366[7] & 0xFFF | ((v366[10] & 0xFFF) << 16);
      unsigned int v253 = v366[13] & 0xFFF | ((v366[16] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      __int16 v369 = 2048;
      *(void *)v370 = 0x30500A280;
      *(_WORD *)&v370[8] = 2080;
      *(void *)v371 = "XXXXXXXX";
      *(_WORD *)&v371[8] = 1024;
      *(_DWORD *)&v371[10] = v251;
      *(_WORD *)&v371[14] = 1024;
      *(_DWORD *)&v371[16] = v252;
      *(_WORD *)&v371[20] = 1024;
      *(_DWORD *)&v371[22] = v253;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %08x %08x %08x\n", v367, 0x32u);
    }

    if (logLevel >= 3)
    {
      v254 = v248;
      if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v255 = v366[19] & 0xFFF | ((v366[22] & 0xFFF) << 16);
        unsigned int v256 = v366[2] & 0xFFF | ((v366[5] & 0xFFF) << 16);
        unsigned int v257 = v366[8] & 0xFFF | ((v366[11] & 0xFFF) << 16);
        unsigned int v258 = v366[14] & 0xFFF | ((v366[17] & 0xFFF) << 16);
        *(_DWORD *)v367 = 136316418;
        v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
        __int16 v369 = 2048;
        uint64_t v259 = 0x30500A290;
        *(void *)v370 = 0x30500A290;
        *(_WORD *)&v370[8] = 1024;
        *(_DWORD *)v371 = v255;
        *(_WORD *)&v371[4] = 1024;
        *(_DWORD *)&v371[6] = v256;
        *(_WORD *)&v371[10] = 1024;
        *(_DWORD *)&v371[12] = v257;
        *(_WORD *)&v371[16] = 1024;
        *(_DWORD *)&v371[18] = v258;
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
      }
      else
      {
        uint64_t v259 = 0x30500A280;
      }

      if (logLevel >= 3)
      {
        v260 = v248;
        if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
        {
          v259 += 16;
          unsigned int v261 = v366[20] & 0xFFF | ((v366[23] & 0xFFF) << 16);
          unsigned int v262 = v366[3] & 0x3FF | ((v366[6] & 0x3FF) << 16);
          unsigned int v263 = v366[9] & 0x3FF | ((v366[12] & 0x3FF) << 16);
          unsigned int v264 = v366[15] & 0x3FF | ((v366[18] & 0x3FF) << 16);
          *(_DWORD *)v367 = 136316418;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          __int16 v369 = 2048;
          *(void *)v370 = v259;
          *(_WORD *)&v370[8] = 1024;
          *(_DWORD *)v371 = v261;
          *(_WORD *)&v371[4] = 1024;
          *(_DWORD *)&v371[6] = v262;
          *(_WORD *)&v371[10] = 1024;
          *(_DWORD *)&v371[12] = v263;
          *(_WORD *)&v371[16] = 1024;
          *(_DWORD *)&v371[18] = v264;
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
        }

        if (logLevel >= 3)
        {
          v265 = v248;
          if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
          {
            v259 += 16;
            unsigned int v266 = v366[21] & 0x3FF | ((v366[24] & 0x3FF) << 16);
            unsigned int v267 = v366[97] & 0x7FF | ((v366[100] & 0x7FF) << 16);
            unsigned int v268 = v366[103] & 0x7FF | ((v366[106] & 0x7FF) << 16);
            unsigned int v269 = v366[109] & 0x7FF | ((v366[112] & 0x7FF) << 16);
            *(_DWORD *)v367 = 136316418;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            __int16 v369 = 2048;
            *(void *)v370 = v259;
            *(_WORD *)&v370[8] = 1024;
            *(_DWORD *)v371 = v266;
            *(_WORD *)&v371[4] = 1024;
            *(_DWORD *)&v371[6] = v267;
            *(_WORD *)&v371[10] = 1024;
            *(_DWORD *)&v371[12] = v268;
            *(_WORD *)&v371[16] = 1024;
            *(_DWORD *)&v371[18] = v269;
            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
          }

          if (logLevel >= 3)
          {
            v270 = v248;
            if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
            {
              v259 += 16;
              unsigned int v271 = v366[115] & 0x7FF | ((v366[118] & 0x7FF) << 16);
              unsigned int v272 = v366[98] & 0x3F | ((v366[101] & 0x3F) << 8) & 0xC0C0FFFF | ((v366[104] & 0x3F) << 16) & 0xC0FFFFFF | ((v366[107] & 0x3F) << 24);
              unsigned int v273 = v366[110] & 0x3F | ((v366[113] & 0x3F) << 8) & 0xC0C0FFFF | ((v366[116] & 0x3F) << 16) & 0xC0FFFFFF | ((v366[119] & 0x3F) << 24);
              int v274 = (int)v366[99] & 0x1FFF | (((int)v366[102] & 0x1FFF) << 16);
              *(_DWORD *)v367 = 136316418;
              v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
              __int16 v369 = 2048;
              *(void *)v370 = v259;
              *(_WORD *)&v370[8] = 1024;
              *(_DWORD *)v371 = v271;
              *(_WORD *)&v371[4] = 1024;
              *(_DWORD *)&v371[6] = v272;
              *(_WORD *)&v371[10] = 1024;
              *(_DWORD *)&v371[12] = v273;
              *(_WORD *)&v371[16] = 1024;
              *(_DWORD *)&v371[18] = v274;
              _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
            }

            if (logLevel >= 3)
            {
              v275 = v248;
              if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
              {
                v259 += 16;
                int v276 = (int)v366[105] & 0x1FFF | (((int)v366[108] & 0x1FFF) << 16);
                int v277 = (int)v366[111] & 0x1FFF | (((int)v366[114] & 0x1FFF) << 16);
                int v278 = (int)v366[117] & 0x1FFF | (((int)v366[120] & 0x1FFF) << 16);
                unsigned int v279 = v366[193] & 0x7FF | ((v366[196] & 0x7FF) << 16);
                *(_DWORD *)v367 = 136316418;
                v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                __int16 v369 = 2048;
                *(void *)v370 = v259;
                *(_WORD *)&v370[8] = 1024;
                *(_DWORD *)v371 = v276;
                *(_WORD *)&v371[4] = 1024;
                *(_DWORD *)&v371[6] = v277;
                *(_WORD *)&v371[10] = 1024;
                *(_DWORD *)&v371[12] = v278;
                *(_WORD *)&v371[16] = 1024;
                *(_DWORD *)&v371[18] = v279;
                _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
              }

              if (logLevel >= 3)
              {
                v280 = v248;
                if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v281 = v366[199] & 0x7FF | ((v366[202] & 0x7FF) << 16);
                  unsigned int v282 = v366[205] & 0x7FF | ((v366[208] & 0x7FF) << 16);
                  unsigned int v283 = v366[211] & 0x7FF | ((v366[214] & 0x7FF) << 16);
                  v259 += 16;
                  unsigned int v284 = v366[194] & 0x3F | ((v366[197] & 0x3F) << 8) & 0xC0C0FFFF | ((v366[200] & 0x3F) << 16) & 0xC0FFFFFF | ((v366[203] & 0x3F) << 24);
                  *(_DWORD *)v367 = 136316418;
                  v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                  __int16 v369 = 2048;
                  *(void *)v370 = v259;
                  *(_WORD *)&v370[8] = 1024;
                  *(_DWORD *)v371 = v281;
                  *(_WORD *)&v371[4] = 1024;
                  *(_DWORD *)&v371[6] = v282;
                  *(_WORD *)&v371[10] = 1024;
                  *(_DWORD *)&v371[12] = v283;
                  *(_WORD *)&v371[16] = 1024;
                  *(_DWORD *)&v371[18] = v284;
                  _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                }

                if (logLevel >= 3)
                {
                  v285 = v248;
                  if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                  {
                    v259 += 16;
                    unsigned int v286 = v366[206] & 0x3F | ((v366[209] & 0x3F) << 8) & 0xC0C0FFFF | ((v366[212] & 0x3F) << 16) & 0xC0FFFFFF | ((v366[215] & 0x3F) << 24);
                    int v287 = (int)v366[195] & 0x1FFF | (((int)v366[198] & 0x1FFF) << 16);
                    int v288 = (int)v366[201] & 0x1FFF | (((int)v366[204] & 0x1FFF) << 16);
                    int v289 = (int)v366[207] & 0x1FFF | (((int)v366[210] & 0x1FFF) << 16);
                    *(_DWORD *)v367 = 136316418;
                    v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                    __int16 v369 = 2048;
                    *(void *)v370 = v259;
                    *(_WORD *)&v370[8] = 1024;
                    *(_DWORD *)v371 = v286;
                    *(_WORD *)&v371[4] = 1024;
                    *(_DWORD *)&v371[6] = v287;
                    *(_WORD *)&v371[10] = 1024;
                    *(_DWORD *)&v371[12] = v288;
                    *(_WORD *)&v371[16] = 1024;
                    *(_DWORD *)&v371[18] = v289;
                    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                  }

                  if (logLevel >= 3)
                  {
                    v290 = v248;
                    if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                    {
                      v259 += 16;
                      int v291 = (int)v366[213] & 0x1FFF | (((int)v366[216] & 0x1FFF) << 16);
                      int v292 = v366[294] & 0x1FFF | ((v366[295] & 0x1FFF) << 16);
                      int v293 = v366[296] & 0x1FFF | ((v366[297] & 0x1FFF) << 16);
                      int v294 = v366[298] & 0x1FFF;
                      *(_DWORD *)v367 = 136316418;
                      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                      __int16 v369 = 2048;
                      *(void *)v370 = v259;
                      *(_WORD *)&v370[8] = 1024;
                      *(_DWORD *)v371 = v291;
                      *(_WORD *)&v371[4] = 1024;
                      *(_DWORD *)&v371[6] = v292;
                      *(_WORD *)&v371[10] = 1024;
                      *(_DWORD *)&v371[12] = v293;
                      *(_WORD *)&v371[16] = 1024;
                      *(_DWORD *)&v371[18] = v294;
                      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                    }

                    if (logLevel >= 3)
                    {
                      v295 = v248;
                      if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                      {
                        v259 += 16;
                        int v296 = v366[299] & 0x1FFF | ((v366[300] & 0x1FFF) << 16);
                        int v297 = v366[301] & 0x1FFF | ((v366[302] & 0x1FFF) << 16);
                        int v298 = v366[303] & 0x1FFF | ((v366[304] & 0x1FFF) << 16);
                        int v299 = v366[305] & 0x1FFF | ((v366[306] & 0x1FFF) << 16);
                        *(_DWORD *)v367 = 136316418;
                        v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                        __int16 v369 = 2048;
                        *(void *)v370 = v259;
                        *(_WORD *)&v370[8] = 1024;
                        *(_DWORD *)v371 = v296;
                        *(_WORD *)&v371[4] = 1024;
                        *(_DWORD *)&v371[6] = v297;
                        *(_WORD *)&v371[10] = 1024;
                        *(_DWORD *)&v371[12] = v298;
                        *(_WORD *)&v371[16] = 1024;
                        *(_DWORD *)&v371[18] = v299;
                        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                      }

                      if (logLevel >= 3)
                      {
                        v300 = v248;
                        if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                        {
                          v259 += 16;
                          int v301 = v366[307] & 0x1FFF;
                          int v302 = v366[308] & 0x1FFF | ((v366[309] & 0x1FFF) << 16);
                          int v303 = v366[310] & 0x1FFF | ((v366[311] & 0x1FFF) << 16);
                          int v304 = v366[312] & 0x1FFF | ((v366[313] & 0x1FFF) << 16);
                          *(_DWORD *)v367 = 136316418;
                          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                          __int16 v369 = 2048;
                          *(void *)v370 = v259;
                          *(_WORD *)&v370[8] = 1024;
                          *(_DWORD *)v371 = v301;
                          *(_WORD *)&v371[4] = 1024;
                          *(_DWORD *)&v371[6] = v302;
                          *(_WORD *)&v371[10] = 1024;
                          *(_DWORD *)&v371[12] = v303;
                          *(_WORD *)&v371[16] = 1024;
                          *(_DWORD *)&v371[18] = v304;
                          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                        }

                        if (logLevel >= 3)
                        {
                          v305 = v248;
                          if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                          {
                            v259 += 16;
                            int v306 = v366[314] & 0x1FFF | ((v366[315] & 0x1FFF) << 16);
                            int v307 = v366[316] & 0x1FFF | ((v366[317] & 0x1FFF) << 16);
                            int v308 = v366[318] & 0x1FFF | ((v366[319] & 0x1FFF) << 16);
                            int v309 = v366[320] & 0x1FFF;
                            *(_DWORD *)v367 = 136316418;
                            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                            __int16 v369 = 2048;
                            *(void *)v370 = v259;
                            *(_WORD *)&v370[8] = 1024;
                            *(_DWORD *)v371 = v306;
                            *(_WORD *)&v371[4] = 1024;
                            *(_DWORD *)&v371[6] = v307;
                            *(_WORD *)&v371[10] = 1024;
                            *(_DWORD *)&v371[12] = v308;
                            *(_WORD *)&v371[16] = 1024;
                            *(_DWORD *)&v371[18] = v309;
                            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                          }

                          if (logLevel >= 3)
                          {
                            v310 = v248;
                            if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                            {
                              unsigned int v311 = v366[290] & 0x3F | (((_WORD)v366[291] & 0x3F) << 6) & 0xFFF | ((v366[292] & 0x3F) << 12) & 0xFC03FFFF | ((v366[293] & 0x3F) << 18) & 0xFCFFFFFF | ((v366[289] & 3) << 24) | (*(_DWORD *)v366 << 26);
                              *(_DWORD *)v367 = 136316418;
                              v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                              __int16 v369 = 2048;
                              *(void *)v370 = v259 + 16;
                              *(_WORD *)&v370[8] = 1024;
                              *(_DWORD *)v371 = v311;
                              *(_WORD *)&v371[4] = 2080;
                              *(void *)&v371[6] = "XXXXXXXX";
                              *(_WORD *)&v371[14] = 2080;
                              *(void *)&v371[16] = "XXXXXXXX";
                              *(_WORD *)&v371[24] = 2080;
                              *(void *)&v371[26] = "XXXXXXXX";
                              _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %s %s %s\n", v367, 0x3Au);
                            }

                            unsigned int v94 = logLevel;
                            double v21 = v364;
                            goto LABEL_293;
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
LABEL_133:
}

- (void)configControlHeader_V3:(hwConfigurationUnitsV3_t *)a3
{
  a3->var1 = (MSRHcuEntryHeader_t)0x1861736570;
  a3->var3 = (MSRHcuEntryHeader_t)0x5046173656BLL;
  a3->var5 = (MSRHcuEntryHeader_t)0x83C6173656CLL;
  a3->var7 = (MSRHcuEntryHeader_t)0x6106173656DLL;
  a3->var9 = (MSRHcuEntryHeader_t)0x86173656FLL;
  a3->var11 = (MSRHcuEntryHeader_t)0x146173656ELL;
}

- (void)processPixelWithInput:(id *)a3 controlUnitV3:(hwConfigurationUnitsV3_t *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    __int16 v14 = "-[ASEProcessingT1 processPixelWithInput:controlUnitV3:]";
    __int16 v15 = 2048;
    *(void *)unsigned int v16 = a3;
    *(_WORD *)&v16[8] = 2048;
    unsigned int v17 = a4;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseControlUnit=%p\n", (uint8_t *)&v13, 0x20u);
  }
  if (!isT1OrNewer(self->super._productType))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    unsigned int productType = self->super._productType;
    int v13 = 136315394;
    __int16 v14 = "-[ASEProcessingT1 processPixelWithInput:controlUnitV3:]";
    __int16 v15 = 1024;
    *(_DWORD *)unsigned int v16 = productType;
    unsigned int v9 = &_os_log_internal;
    unsigned int v10 = " [1.37.0]     %s : ERROR: Not supported, _productType = %d\n";
    uint32_t v11 = 18;
    goto LABEL_10;
  }
  [(ASEProcessingT1 *)self processPixelWithInput_V3:a3 Output:a4];
  if (logLevel < 3) {
    return;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int var0 = a4->var0.var0;
    unsigned int var1 = a4->var0.var1;
    int v13 = 136315650;
    __int16 v14 = "-[ASEProcessingT1 processPixelWithInput:controlUnitV3:]";
    __int16 v15 = 1024;
    *(_DWORD *)unsigned int v16 = var0;
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = var1;
    unsigned int v9 = &_os_log_internal;
    unsigned int v10 = " [1.37.0]     %s : aseControlUnit->hcuCount %d, aseControlUnit->hcuSize %d, \n";
    uint32_t v11 = 24;
LABEL_10:
    _os_log_impl(&dword_2107A5000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v11);
  }
LABEL_11:
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    __int16 v14 = "-[ASEProcessingT1 processPixelWithInput:controlUnitV3:]";
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", (uint8_t *)&v13, 0xCu);
  }
}

- (void)processPixelWithInput_V3:(id *)a3 Output:(hwConfigurationUnitsV3_t *)a4
{
  unsigned int aseProcessingType = self->super._aseProcessingType;
  if (aseProcessingType > 7) {
    goto LABEL_17;
  }
  int v6 = 1 << aseProcessingType;
  if ((v6 & 0xE6) != 0)
  {
    [(ASEProcessingT1 *)self processPixelWithPixelControl_V3:a4];
    unsigned int enabledHcus = self->_enabledHcus;
    if ((enabledHcus & 0x40) != 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"!(!!((_enabledHcus) & (1U << (ASEConfigurationUnitsV3_NoiseConfig))))\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1395\n", buf, 2u);
      }
      unsigned int enabledHcus = self->_enabledHcus;
      if ((enabledHcus & 0x40) != 0) {
        -[ASEProcessingT1 processPixelWithInput_V3:Output:]();
      }
    }
    unsigned int v8 = enabledHcus & 0xFFFFFFBF;
    goto LABEL_14;
  }
  if ((v6 & 0x18) == 0) {
LABEL_17:
  }
    -[ASEProcessingT1 processPixelWithInput_V3:Output:]();
  [(ASEProcessingT1 *)self processPixelWithMeasurement_V3:a3 Output:a4];
  unsigned int v9 = self->_enabledHcus;
  if ((v9 & 0x40) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"(!!((_enabledHcus) & (1U << (ASEConfigurationUnitsV3_NoiseConfig))))\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1403\n", v10, 2u);
    }
    unsigned int v9 = self->_enabledHcus;
    if ((v9 & 0x40) == 0) {
      -[ASEProcessingT1 processPixelWithInput_V3:Output:]();
    }
  }
  unsigned int v8 = v9 | 0x40;
LABEL_14:
  self->_unsigned int enabledHcus = v8;
}

- (id)populateOutputHcus:(hwConfigurationUnitsV3_t *)a3
{
  unsigned int v5 = 0;
  unsigned int v6 = 0;
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v7 = &dword_2107B98EC;
  unsigned int v8 = -1;
  do
  {
    unsigned int v9 = v8 + 1;
    int v10 = 1 << (v8 + 1);
    unsigned int v11 = self->_enabledHcus & v10;
    int v12 = hideHcu & v10;
    if (v11) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      if (v8 > 5) {
        int v14 = 0;
      }
      else {
        int v14 = *v7;
      }
      ++v5;
      v6 += v14;
    }
    ++v7;
    unsigned int v8 = v9;
  }
  while (v9 != 6);
  a3->var0.unsigned int var0 = v5;
  a3->var0.unsigned int var1 = v6;
  __int16 v15 = [MEMORY[0x263EFF990] dataWithCapacity:v6 + 8 * v5 + 8];
  unsigned int v16 = v15;
  if (v15)
  {
    [v15 appendBytes:a3 length:8];
    int v17 = 0;
    p_var11 = &a3->var11;
    p_var9 = &a3->var9;
    p_var7 = &a3->var7;
    p_var5 = &a3->var5;
    p_var3 = &a3->var3;
    p_unsigned int var1 = &a3->var1;
    do
    {
      if ((self->_enabledHcus & (1 << v17)) != 0 && (hideHcu & (1 << v17)) == 0)
      {
        switch(v17)
        {
          case 1:
            unsigned int v22 = v16;
            v23 = p_var1;
            uint64_t v24 = 32;
            goto LABEL_22;
          case 2:
            unsigned int v22 = v16;
            v23 = p_var3;
            uint64_t v24 = 1292;
            goto LABEL_22;
          case 3:
            unsigned int v22 = v16;
            v23 = p_var5;
            uint64_t v24 = 2116;
            goto LABEL_22;
          case 4:
            unsigned int v22 = v16;
            v23 = p_var7;
            uint64_t v24 = 1560;
            goto LABEL_22;
          case 5:
            unsigned int v22 = v16;
            v23 = p_var9;
            uint64_t v24 = 16;
LABEL_22:
            objc_msgSend(v22, "appendBytes:length:", v23, v24, p_var11);
            break;
          case 6:
            [v16 appendBytes:p_var11 length:28];
            goto LABEL_24;
          default:
            -[ASEProcessingT1 populateOutputHcus:]();
        }
      }
      ++v17;
    }
    while (v17 != 7);
LABEL_24:
    if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int enabledHcus = self->_enabledHcus;
      *(_DWORD *)buf = 136315906;
      unsigned int v30 = "-[ASEProcessingT1 populateOutputHcus:]";
      __int16 v31 = 1024;
      unsigned int v32 = enabledHcus;
      __int16 v33 = 1024;
      int v34 = hideHcu;
      __int16 v35 = 1024;
      int v36 = hideHcu;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: _unsigned int enabledHcus = 0x%x, hideHcu = 0x%x (%d)\n", buf, 0x1Eu);
    }
    -[ASEProcessingT1 DumpOutputHcus:](self, "DumpOutputHcus:", v16, p_var11);
  }
  return v16;
}

- (void)processPixelWithPixelControl_V3:(hwConfigurationUnitsV3_t *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v9 = "-[ASEProcessingT1 processPixelWithPixelControl_V3:]";
    __int16 v10 = 2048;
    unsigned int v11 = a3;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseControlUnit=%p\n", buf, 0x16u);
  }
  [(ASEProcessingT1 *)self configControlHeader_V3:a3];
  calculate_graphics_control_setting_V3((int8x8_t *)a3, self->super._inputWidth, self->super._inputHeight, v5, v6, v7, LODWORD(self->super._numberOfProcessedFrames), self->super._productType, self->super._destinationWidth, self->super._destinationHeight, (uint64_t)self->_aseControlUnitV3Cache, &self->_enabledHcus);
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v9 = "-[ASEProcessingT1 processPixelWithPixelControl_V3:]";
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", buf, 0xCu);
  }
}

- (void)processPixelWithMeasurement_V3:(id *)a3 Output:(hwConfigurationUnitsV3_t *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v10 = "-[ASEProcessingT1 processPixelWithMeasurement_V3:Output:]";
    __int16 v11 = 2048;
    *(void *)uint64_t v12 = a3;
    *(_WORD *)&v12[8] = 2048;
    BOOL v13 = a4;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseControlUnit=%p\n", buf, 0x20u);
  }
  [(ASEProcessingT0 *)self printAseMeasurementOutput:a3];
  [(ASEProcessingT1 *)self configControlHeader_V3:a4];
  calculate_control_setting_V3((uint64_t)a3, (uint64_t)a4, self->super._inputWidth, self->super._inputHeight, LODWORD(self->super._numberOfProcessedFrames), (uint64_t)&self->super._noiseMeterStepSize, (uint64_t)&self->super._FD_state, (uint64_t)&self->super._FG_count, &self->super._NFG_count, &self->super._prev_H1_7, &self->super._prev_V1_7, &self->super._prev_ratio_2D_1D, self->super._productType, self->super._destinationWidth, self->super._destinationHeight, (uint64_t)self->_aseControlUnitV3Cache, &self->_enabledHcus);
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int destinationWidth = self->super._destinationWidth;
    unsigned int destinationHeight = self->super._destinationHeight;
    *(_DWORD *)buf = 136315650;
    __int16 v10 = "-[ASEProcessingT1 processPixelWithMeasurement_V3:Output:]";
    __int16 v11 = 1024;
    *(_DWORD *)uint64_t v12 = destinationWidth;
    *(_WORD *)&v12[4] = 1024;
    *(_DWORD *)&v12[6] = destinationHeight;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s : _destinationWidth =%d, _destinationHeight=%d\n", buf, 0x18u);
  }
}

- (int64_t)processFrameWithInput:(id *)a3 outputData:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v7 = logLevel;
  if (logLevel >= 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ASEProcessingT1 processFrameWithInput:outputData:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = a4;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseFrameProcessingControl=%p\n", buf, 0x20u);
    }
    unsigned int v7 = logLevel;
  }
  if (v7 >= 2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int aseProcessingType = self->super._aseProcessingType;
      unsigned int v9 = getASEProcessingType(aseProcessingType);
      unsigned int inputWidth = self->super._inputWidth;
      unsigned int inputHeight = self->super._inputHeight;
      unsigned int destinationWidth = self->super._destinationWidth;
      unsigned int destinationHeight = self->super._destinationHeight;
      double enhancementStrength = self->super._enhancementStrength;
      *(_DWORD *)buf = 136316930;
      *(void *)&uint8_t buf[4] = "-[ASEProcessingT1 processFrameWithInput:outputData:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = aseProcessingType;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v9;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = inputWidth;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = inputHeight;
      *(_WORD *)&buf[40] = 2048;
      *(double *)&buf[42] = enhancementStrength;
      *(_WORD *)&buf[50] = 1024;
      *(_DWORD *)&buf[52] = destinationWidth;
      *(_WORD *)&buf[56] = 1024;
      *(_DWORD *)&buf[58] = destinationHeight;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s : aseProcessingType=%d [%s], width=%d, height=%d, strength=%f, destinationWidth=%d, destinationHeight=%d\n", buf, 0x3Eu);
    }
    if (logLevel >= 2) {
      +[ASEProcessing shouldEnhanceWidth:self->super._inputWidth height:self->super._inputHeight destinationWidth:self->super._destinationWidth destinationHeight:self->super._destinationHeight];
    }
  }
  if (self->super._aseProcessingType - 9 <= 0xFFFFFFF7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"_aseProcessingType < kASEProcessingTypeLivePhoto || _aseProcessingType > kASEProcessingTypeEnhanceOnly\" failed in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1569 goto EXIT\n", buf, 2u);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    unsigned int v15 = self->super._aseProcessingType;
    double v16 = self->super._enhancementStrength;
    unsigned int v17 = self->super._inputWidth;
    unsigned int v18 = self->super._inputHeight;
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[ASEProcessingT1 processFrameWithInput:outputData:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v15;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v16;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v17;
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = v18;
    double v19 = &_os_log_internal;
    unsigned int v20 = " [1.37.0] %s : unknownProcessingType=%d, strength=%f, wxh=%dx%d\n";
    uint32_t v21 = 40;
    goto LABEL_15;
  }
  if (a4)
  {
    memset(&buf[4], 0, 376);
    *(_DWORD *)buf = 1;
    if (a3) {
      memcpy(buf, a3, 0x17CuLL);
    }
    if (!isT1OrNewer(self->super._productType))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"isT1OrNewer(_productType)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1584\n", v26, 2u);
      }
      if (!isT1OrNewer(self->super._productType)) {
        -[ASEProcessingT1 processFrameWithInput:outputData:]();
      }
    }
    v23 = &self->_aseControlUnitV3[self->super._numberOfRequestedFrames & 3];
    bzero(v23, 0x13BCuLL);
    ++self->super._numberOfRequestedFrames;
    [(ASEProcessingT1 *)self processPixelWithInput:buf controlUnitV3:v23];
    *a4 = [(ASEProcessingT1 *)self populateOutputHcus:v23];
    ++self->super._numberOfProcessedFrames;
    int64_t v22 = -18000;
    goto LABEL_25;
  }
  if (logLevel < 3) {
    return -18002;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ASEProcessingT1 processFrameWithInput:outputData:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = 0;
    double v19 = &_os_log_internal;
    unsigned int v20 = " [1.37.0] %s : aseMeasurementOutput=%p, aseFrameProcessingControl=%p\n";
    uint32_t v21 = 32;
LABEL_15:
    _os_log_impl(&dword_2107A5000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
  }
LABEL_16:
  int64_t v22 = -18002;
LABEL_25:
  if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numberOfProcessedFrames = self->super._numberOfProcessedFrames;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ASEProcessingT1 processFrameWithInput:outputData:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = numberOfProcessedFrames;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v22;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s : frame=%ld, retVal=%ld\n", buf, 0x20u);
  }
  return v22;
}

- (int64_t)processFrameWithInput:(id *)a3 callback:(id)a4
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    double v6 = "-[ASEProcessingT1 processFrameWithInput:callback:]";
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : ERROR: Async API Not supported!\n", (uint8_t *)&v5, 0xCu);
  }
  return -18001;
}

- (void)initWithConfig:aseProcessing:productType:.cold.1()
{
}

- (void)processPixelWithInput_V3:Output:.cold.1()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1408\n", v0, 2u);
  }
  __assert_rtn("-[ASEProcessingT1 processPixelWithInput_V3:Output:]", "ASEProcessingT1.m", 1408, "0");
}

- (void)processPixelWithInput_V3:Output:.cold.2()
{
}

- (void)processPixelWithInput_V3:Output:.cold.3()
{
}

- (void)populateOutputHcus:.cold.1()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1463\n", v0, 2u);
  }
  __assert_rtn("-[ASEProcessingT1 populateOutputHcus:]", "ASEProcessingT1.m", 1463, "0");
}

- (void)processFrameWithInput:outputData:.cold.1()
{
}

@end