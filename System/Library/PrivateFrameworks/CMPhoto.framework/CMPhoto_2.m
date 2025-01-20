uint64_t CMPhotoSupportsAVCEncode()
{
  return 0;
}

uint64_t CMPhotoGetAVCProfileForPixelFormat(uint64_t a1)
{
  uint64_t UncompressedPixelFormatFromCompressedPixelFormat = CMPhotoGetUncompressedPixelFormatFromCompressedPixelFormat(a1);
  CMPhotoGetBitDepthForPixelFormat(UncompressedPixelFormatFromCompressedPixelFormat);
  int ChromaSubsamplingFromPixelFormat = CMPhotoGetChromaSubsamplingFromPixelFormat(UncompressedPixelFormatFromCompressedPixelFormat);
  uint64_t v3 = MEMORY[0x1E4F451F8];
  uint64_t v4 = MEMORY[0x1E4F45200];
  if (ChromaSubsamplingFromPixelFormat != 1) {
    uint64_t v4 = MEMORY[0x1E4F45250];
  }
  if (ChromaSubsamplingFromPixelFormat != 3) {
    uint64_t v3 = v4;
  }
  return *(void *)v3;
}

uint64_t CMPhotoSupportsMLEncode()
{
  return 0;
}

uint64_t CMPhotoSupportsProResEncode(int a1)
{
  uint64_t result = 0;
  if (a1 <= 1634755437)
  {
    if (a1 <= 1634743399)
    {
      if (a1 == 1634742376)
      {
        if (CMPhotoSupportsProResEncode_onceTokenAppleProRes400 != -1) {
          dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProRes400, &__block_literal_global_12);
        }
        uint64_t v3 = &sDeviceSupportsProResEncoding_0;
      }
      else
      {
        if (a1 != 1634742888) {
          return result;
        }
        if (CMPhotoSupportsProResEncode_onceTokenAppleProRes420 != -1) {
          dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProRes420, &__block_literal_global_15_0);
        }
        uint64_t v3 = &sDeviceSupportsProResEncoding_1;
      }
    }
    else
    {
      switch(a1)
      {
        case 1634743400:
          if (CMPhotoSupportsProResEncode_onceTokenAppleProRes4444 != -1) {
            dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProRes4444, &__block_literal_global_18_2);
          }
          uint64_t v3 = &sDeviceSupportsProResEncoding_2;
          break;
        case 1634743416:
          if (CMPhotoSupportsProResEncode_onceTokenAppleProRes4444XQ != -1) {
            dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProRes4444XQ, &__block_literal_global_21_0);
          }
          uint64_t v3 = &sDeviceSupportsProResEncoding_3;
          break;
        case 1634755432:
          if (CMPhotoSupportsProResEncode_onceTokenAppleProRes422HQ != -1) {
            dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProRes422HQ, &__block_literal_global_24_0);
          }
          uint64_t v3 = &sDeviceSupportsProResEncoding_4;
          break;
        default:
          return result;
      }
    }
  }
  else if (a1 > 1634759271)
  {
    switch(a1)
    {
      case 1634759272:
        if (CMPhotoSupportsProResEncode_onceTokenAppleProResRAWHQ != -1) {
          dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProResRAWHQ, &__block_literal_global_39);
        }
        uint64_t v3 = &sDeviceSupportsProResEncoding_9;
        break;
      case 1634759278:
        if (CMPhotoSupportsProResEncode_onceTokenAppleProResRAW != -1) {
          dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProResRAW, &__block_literal_global_36);
        }
        uint64_t v3 = &sDeviceSupportsProResEncoding_8;
        break;
      case 1634759276:
        if (CMPhotoSupportsProResEncode_onceTokenAppleProRes400 != -1) {
          dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProRes400, &__block_literal_global_9_0);
        }
        uint64_t v3 = &sDeviceSupportsProResEncoding_10;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(a1)
    {
      case 1634755438:
        if (CMPhotoSupportsProResEncode_onceTokenAppleProRes422 != -1) {
          dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProRes422, &__block_literal_global_27);
        }
        uint64_t v3 = &sDeviceSupportsProResEncoding_5;
        break;
      case 1634755439:
        if (CMPhotoSupportsProResEncode_onceTokenAppleProRes422Proxy != -1) {
          dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProRes422Proxy, &__block_literal_global_33);
        }
        uint64_t v3 = &sDeviceSupportsProResEncoding_7;
        break;
      case 1634755443:
        if (CMPhotoSupportsProResEncode_onceTokenAppleProRes422LT != -1) {
          dispatch_once(&CMPhotoSupportsProResEncode_onceTokenAppleProRes422LT, &__block_literal_global_30);
        }
        uint64_t v3 = &sDeviceSupportsProResEncoding_6;
        break;
      default:
        return result;
    }
  }
  return *v3;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke()
{
  BOOL result = _isProResEncoderAvailable(1634759276);
  sDeviceSupportsProResEncoding_10 = result;
  return result;
}

BOOL _isProResEncoderAvailable(int a1)
{
  if (a1 == 1634759276)
  {
    if (sDeviceType < 0xD) {
      return 0;
    }
  }
  else if (sDeviceType < 0xB)
  {
    return 0;
  }
  pthread_once(&_getDeviceType_onceToken, (void (*)(void))_once_getDeviceType);
  return sDeviceType != 14;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke_2()
{
  BOOL result = _isProResEncoderAvailable(1634742376);
  sDeviceSupportsProResEncoding_0 = result;
  return result;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke_3()
{
  BOOL result = _isProResEncoderAvailable(1634742888);
  sDeviceSupportsProResEncoding_1 = result;
  return result;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke_4()
{
  BOOL result = _isProResEncoderAvailable(1634743400);
  sDeviceSupportsProResEncoding_2 = result;
  return result;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke_5()
{
  BOOL result = _isProResEncoderAvailable(1634743416);
  sDeviceSupportsProResEncoding_3 = result;
  return result;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke_6()
{
  BOOL result = _isProResEncoderAvailable(1634755432);
  sDeviceSupportsProResEncoding_4 = result;
  return result;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke_7()
{
  BOOL result = _isProResEncoderAvailable(1634755438);
  sDeviceSupportsProResEncoding_5 = result;
  return result;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke_8()
{
  BOOL result = _isProResEncoderAvailable(1634755443);
  sDeviceSupportsProResEncoding_6 = result;
  return result;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke_9()
{
  BOOL result = _isProResEncoderAvailable(1634755439);
  sDeviceSupportsProResEncoding_7 = result;
  return result;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke_10()
{
  BOOL result = _isProResEncoderAvailable(1634759278);
  sDeviceSupportsProResEncoding_8 = result;
  return result;
}

BOOL __CMPhotoSupportsProResEncode_block_invoke_11()
{
  BOOL result = _isProResEncoderAvailable(1634759272);
  sDeviceSupportsProResEncoding_9 = result;
  return result;
}

BOOL CMPhotoSupportsAGXCompressedFormat()
{
  return sDeviceType > 9;
}

BOOL CMPhotoSupportsLossyCompressedFormat()
{
  return sDeviceType > 0xA;
}

BOOL CMPhotoSupportsIncreasedRoundingPointForJPEG()
{
  return sDeviceType > 7;
}

BOOL CMPhotoSupportsSourcePadding()
{
  return sDeviceType > 0xA;
}

uint64_t CMPhotoPerceptualCurveVersion()
{
  if (sDeviceType <= 0xB) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t CMPhotoDNGDefaultBitDepth()
{
  if (sDeviceType <= 0xB) {
    return 16;
  }
  else {
    return 10;
  }
}

BOOL CMPhotoSupportsHEIFQualityV2()
{
  return sDeviceType > 0xB;
}

BOOL CMPhotoAVESupportsHEIFQualityV2()
{
  return sDeviceType > 0xA;
}

float CMPhotoGetHEIFQualityDefault(uint64_t a1, uint64_t a2)
{
  float result = 0.75;
  if ((unint64_t)(a2 * a1) <= 0xF423FF)
  {
    if ((unint64_t)(a2 * a1) < 0xB71B00)
    {
      return 0.85;
    }
    else
    {
      pthread_once(&_getDeviceType_onceToken, (void (*)(void))_once_getDeviceType);
      float result = 0.85;
      if (sDeviceType >= 0xC) {
        return 0.75;
      }
    }
  }
  return result;
}

uint64_t CMPhotoValidateMobileGestaltQuery()
{
  if (_isMobileGestaltVirtualDevice()) {
    return 1;
  }
  v1 = (const void *)MGCopyAnswer();
  int v2 = FigCFEqual();
  uint64_t v3 = (const void *)MGCopyAnswer();
  int v4 = FigCFEqual();
  if (v2
    || (pthread_once(&_getDeviceType_onceToken, (void (*)(void))_once_getDeviceType), sDeviceType <= 5))
  {
    if (v4)
    {
      BOOL v0 = 1;
      if (!v1) {
        goto LABEL_10;
      }
    }
    else
    {
      pthread_once(&_getDeviceType_onceToken, (void (*)(void))_once_getDeviceType);
      BOOL v0 = sDeviceType < 5;
      if (!v1) {
        goto LABEL_10;
      }
    }
LABEL_9:
    CFRelease(v1);
    goto LABEL_10;
  }
  BOOL v0 = 0;
  if (v1) {
    goto LABEL_9;
  }
LABEL_10:
  if (v3) {
    CFRelease(v3);
  }
  return v0;
}

uint64_t _isMobileGestaltVirtualDevice()
{
  BOOL v0 = (const void *)MGCopyAnswer();
  uint64_t v1 = FigCFEqual();
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

BOOL CMPhotoIs422EncodeAvailable(int a1, int a2)
{
  if (a1 == 1936484717 || a1 == 1785750887) {
    return 1;
  }
  if (a1 != 1752589105 || a2) {
    return 0;
  }
  pthread_once(&_getDeviceType_onceToken, (void (*)(void))_once_getDeviceType);
  return sDeviceType > 6;
}

BOOL CMPhotoIs444EncodeAvailable(int a1, int a2)
{
  if (a1 == 1936484717 || a1 == 1785750887) {
    return 1;
  }
  if (a1 != 1752589105 || a2) {
    return 0;
  }
  pthread_once(&_getDeviceType_onceToken, (void (*)(void))_once_getDeviceType);
  return sDeviceType > 5;
}

BOOL CMPhotoIsRGBEncodeAvailable(int a1)
{
  return a1 == 1936484717;
}

BOOL CMPhotoIs400EncodeAvailable(int a1)
{
  if (a1 > 1785750886)
  {
    return a1 == 1785750887 || a1 == 1936484717;
  }
  else if (a1 == 1635148593)
  {
    pthread_once(&_getDeviceType_onceToken, (void (*)(void))_once_getDeviceType);
    return sDeviceType > 7;
  }
  else
  {
    return a1 == 1752589105;
  }
}

uint64_t CMPhotoIsPixelFormatSupportedBySLIM(int a1)
{
  uint64_t v1 = 0;
  while (slimPixelFormatList_0[v1] != a1)
  {
    if (++v1 == 62) {
      return 0;
    }
  }
  return 1;
}

BOOL CMPhotoIsPixelFormatSupportedByAVC(int a1)
{
  switch(a1)
  {
    case 875704422:
      return 1;
    case 1278226488:
      pthread_once(&_getDeviceType_onceToken, (void (*)(void))_once_getDeviceType);
      return sDeviceType > 7;
    case 875704438:
      return 1;
    default:
      return 0;
  }
}

BOOL CMPhotoIsPixelFormatSupportedByHEVC(uint64_t a1, int a2)
{
  int v2 = a1;
  if (a2)
  {
    BOOL result = 0;
    if (v2 > 1278226735)
    {
      if (v2 != 1278226736 && v2 != 2019963440)
      {
        int v4 = 2016686640;
LABEL_14:
        if (v2 != v4) {
          return result;
        }
      }
    }
    else if (v2 != 875704422 && v2 != 875704438)
    {
      int v4 = 1278226488;
      goto LABEL_14;
    }
    return 1;
  }
  int UncompressedPixelFormatFromCompressedPixelFormat = CMPhotoGetUncompressedPixelFormatFromCompressedPixelFormat(a1);
  BOOL result = 0;
  if (UncompressedPixelFormatFromCompressedPixelFormat > 1882468911)
  {
    if (UncompressedPixelFormatFromCompressedPixelFormat > 2016687155)
    {
      if (UncompressedPixelFormatFromCompressedPixelFormat > 2019963441)
      {
        if (UncompressedPixelFormatFromCompressedPixelFormat == 2019963442) {
          goto LABEL_40;
        }
        unsigned __int16 v7 = 13364;
      }
      else
      {
        if (UncompressedPixelFormatFromCompressedPixelFormat == 2016687156) {
          return 1;
        }
        unsigned __int16 v7 = 12848;
      }
      int v6 = v7 | 0x78660000;
    }
    else
    {
      if (UncompressedPixelFormatFromCompressedPixelFormat > 2016686639)
      {
        if (UncompressedPixelFormatFromCompressedPixelFormat == 2016686640) {
          return 1;
        }
        int v8 = 2016686642;
        goto LABEL_31;
      }
      if (UncompressedPixelFormatFromCompressedPixelFormat == 1882468912) {
        return 1;
      }
      int v6 = 1885745712;
    }
LABEL_38:
    if (UncompressedPixelFormatFromCompressedPixelFormat != v6) {
      return result;
    }
    return 1;
  }
  if (UncompressedPixelFormatFromCompressedPixelFormat > 875836517)
  {
    if (UncompressedPixelFormatFromCompressedPixelFormat > 1278226487)
    {
      if (UncompressedPixelFormatFromCompressedPixelFormat == 1278226488) {
        return 1;
      }
      int v6 = 1278226736;
    }
    else
    {
      if (UncompressedPixelFormatFromCompressedPixelFormat == 875836518) {
        return 1;
      }
      int v6 = 875836534;
    }
    goto LABEL_38;
  }
  if (UncompressedPixelFormatFromCompressedPixelFormat <= 875704933)
  {
    if (UncompressedPixelFormatFromCompressedPixelFormat != 875704422)
    {
      int v6 = 875704438;
      goto LABEL_38;
    }
    return 1;
  }
  if (UncompressedPixelFormatFromCompressedPixelFormat == 875704934)
  {
LABEL_40:
    pthread_once(&_getDeviceType_onceToken, (void (*)(void))_once_getDeviceType);
    return sDeviceType > 6;
  }
  int v8 = 875704950;
LABEL_31:
  if (UncompressedPixelFormatFromCompressedPixelFormat == v8) {
    goto LABEL_40;
  }
  return result;
}

uint64_t CMPhotoIsTileEncoderAvailable(int a1)
{
  if (a1 == 1752589105)
  {
    if (CMPhotoIsTileEncoderAvailable_onceTokenHEVC != -1) {
      dispatch_once(&CMPhotoIsTileEncoderAvailable_onceTokenHEVC, &__block_literal_global_51);
    }
    return sTileEncodersAvailable_1;
  }
  else
  {
    if (a1 == 1635148593)
    {
      if (CMPhotoIsTileEncoderAvailable_onceTokenAVC == -1) {
        return 0;
      }
      dispatch_once(&CMPhotoIsTileEncoderAvailable_onceTokenAVC, &__block_literal_global_48);
    }
    return 0;
  }
}

uint64_t __CMPhotoIsTileEncoderAvailable_block_invoke_2()
{
  BOOL v0 = (int *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    uint64_t result = kdebug_trace();
    int v2 = *v0;
    sTileEncodersAvailable_1 = 1;
    if (v2 == 1)
    {
      return kdebug_trace();
    }
  }
  else
  {
    sTileEncodersAvailable_1 = 1;
  }
  return result;
}

void __CMPhotoIsTileDecoderAvailable_block_invoke(uint64_t a1)
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  CMVideoCodecType v1 = *(_DWORD *)(a1 + 32);
  CFTypeRef cf = 0;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  keys[0] = *(void **)MEMORY[0x1E4F455C8];
  values = (void *)*MEMORY[0x1E4F1CFD0];
  CFDictionaryRef v3 = CFDictionaryCreate(v2, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v3)
  {
    BOOL v5 = 0;
    goto LABEL_9;
  }
  CFDictionaryRef v4 = v3;
  if (v1 == 1635135537 || v1 == 1752589105 || v1 == 1635148593)
  {
    if (!FigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom())
    {
LABEL_6:
      BOOL v5 = VTTileDecompressionSessionCreate() == 0;
      goto LABEL_7;
    }
  }
  else if (!CMVideoFormatDescriptionCreate(v2, v1, 1024, 1024, 0, (CMVideoFormatDescriptionRef *)&cf))
  {
    goto LABEL_6;
  }
  BOOL v5 = 0;
LABEL_7:
  CFRelease(v4);
  if (cf) {
    CFRelease(cf);
  }
LABEL_9:
  sTileDecodersAvailable_0 = v5;
}

void __CMPhotoIsTileDecoderAvailable_block_invoke_3()
{
  sTileDecodersAvailable_2 = 1;
}

BOOL CMPhotoEncoderSupportsPixelFormat(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = a1;
  if (a2 == 1635148593)
  {
    BOOL IsPixelFormatSupportedByAVC = CMPhotoIsPixelFormatSupportedByAVC(a1);
    if (!IsPixelFormatSupportedByAVC) {
      LODWORD(v5) = 875704422;
    }
    if (!a4) {
      return IsPixelFormatSupportedByAVC;
    }
LABEL_15:
    *a4 = v5;
    return IsPixelFormatSupportedByAVC;
  }
  if (a2 == 1752589105)
  {
    if (CMPhotoIsPixelFormatSupportedByHEVC(a1, a3))
    {
LABEL_14:
      BOOL IsPixelFormatSupportedByAVC = 1;
      if (!a4) {
        return IsPixelFormatSupportedByAVC;
      }
      goto LABEL_15;
    }
    unint64_t BitDepthForPixelFormat = CMPhotoGetBitDepthForPixelFormat(v5);
    if ((int)v5 > 1651926375)
    {
      if ((int)v5 <= 1735549491)
      {
        if ((int)v5 <= 1717856626)
        {
          if (v5 == 1651926376 || v5 == 1652056888) {
            goto LABEL_63;
          }
          int v12 = 1717855600;
        }
        else
        {
          if ((int)v5 > 1734504495)
          {
            if (v5 == 1734504496) {
              goto LABEL_63;
            }
            unsigned __int16 v13 = 29236;
          }
          else
          {
            if (v5 == 1717856627) {
              goto LABEL_63;
            }
            unsigned __int16 v13 = 25400;
          }
          int v12 = v13 | 0x67620000;
        }
      }
      else if ((int)v5 > 1751411058)
      {
        if ((int)v5 > 1919379251)
        {
          if (v5 == 1919381552) {
            goto LABEL_63;
          }
          unsigned __int16 v14 = 26420;
        }
        else
        {
          if (v5 == 1751411059) {
            goto LABEL_63;
          }
          unsigned __int16 v14 = 25400;
        }
        int v12 = v14 | 0x72670000;
      }
      else if ((int)v5 > 1735553071)
      {
        if (v5 == 1735553072) {
          goto LABEL_63;
        }
        int v12 = 1751410032;
      }
      else
      {
        if (v5 == 1735549492) {
          goto LABEL_63;
        }
        int v12 = 1735549752;
      }
    }
    else if ((int)v5 <= 1647719527)
    {
      if ((v5 - 1278226488) <= 0x30 && ((1 << (v5 - 56)) & 0x1400000000001) != 0
        || (v5 - 1278226736) <= 6 && ((1 << (v5 - 48)) & 0x45) != 0)
      {
        goto LABEL_63;
      }
      int v12 = 1647392369;
    }
    else if ((int)v5 > 1650946097)
    {
      if ((int)v5 > 1651847471)
      {
        if (v5 == 1651847472) {
          goto LABEL_63;
        }
        int v12 = 1651925816;
      }
      else
      {
        if (v5 == 1650946098) {
          goto LABEL_63;
        }
        int v12 = 1651519798;
      }
    }
    else
    {
      if ((int)v5 > 1650943795)
      {
        if (v5 == 1650943796) {
          goto LABEL_63;
        }
        unsigned __int16 v11 = 28720;
      }
      else
      {
        if (v5 == 1647719528) {
          goto LABEL_63;
        }
        unsigned __int16 v11 = 25400;
      }
      int v12 = v11 | 0x62670000;
    }
    if (v5 != v12)
    {
      BOOL IsPixelFormatSupportedByAVC = 0;
      BOOL v17 = BitDepthForPixelFormat > 8;
      int v15 = 875704422;
      int v16 = 2019963440;
LABEL_64:
      if (v17) {
        LODWORD(v5) = v16;
      }
      else {
        LODWORD(v5) = v15;
      }
      if (!a4) {
        return IsPixelFormatSupportedByAVC;
      }
      goto LABEL_15;
    }
LABEL_63:
    BOOL IsPixelFormatSupportedByAVC = 0;
    int v15 = 1278226488;
    int v16 = 1278226736;
    BOOL v17 = BitDepthForPixelFormat > 8;
    goto LABEL_64;
  }
  if (a2 != 1936484717) {
    goto LABEL_14;
  }
  uint64_t v6 = 0;
  while (1)
  {
    int v7 = slimPixelFormatList_0[v6];
    if (v7 == a1) {
      break;
    }
    if (++v6 == 62)
    {
      LODWORD(a1) = 0;
      break;
    }
  }
  BOOL IsPixelFormatSupportedByAVC = v7 == v5;
  LODWORD(v5) = a1;
  if (a4) {
    goto LABEL_15;
  }
  return IsPixelFormatSupportedByAVC;
}

uint64_t CMPhotoReuseCompressionSessionForDifferentQuantizationMatrixPresetDisabled()
{
  if (CMPhotoReuseCompressionSessionForDifferentQuantizationMatrixPresetDisabled_onceToken != -1) {
    dispatch_once(&CMPhotoReuseCompressionSessionForDifferentQuantizationMatrixPresetDisabled_onceToken, &__block_literal_global_64);
  }
  return 0;
}

uint64_t CMPhotoSetDecodeHardwareCutoff(uint64_t result, uint64_t a2)
{
  CFAllocatorRef v2 = &g_cutOffJPEG;
  if (!result) {
    CFAllocatorRef v2 = &g_cutOffHEIF;
  }
  *CFAllocatorRef v2 = a2;
  return result;
}

uint64_t CMPhotoAllowExperimentalCodecsOverride(char a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __CMPhotoAllowExperimentalCodecsOverride_block_invoke;
  block[3] = &__block_descriptor_tmp_65;
  char v3 = a1;
  if (CMPhotoAllowExperimentalCodecsOverride_onceToken != -1) {
    dispatch_once(&CMPhotoAllowExperimentalCodecsOverride_onceToken, block);
  }
  return CMPhotoAllowExperimentalCodecsOverride_sAllowSlimCodec;
}

uint64_t __CMPhotoAllowExperimentalCodecsOverride_block_invoke(uint64_t result)
{
  CMPhotoAllowExperimentalCodecsOverride_sAllowSlimCodec = *(unsigned char *)(result + 32);
  return result;
}

uint64_t CMPhotoDNGCompressorGetTypeID()
{
  return sCMPhotoDNGCompressorTypeID;
}

uint64_t RegisterCMPhotoDNGCompressor()
{
  FigKTraceInit();
  sCMPhotoDNGCompressorClass = 0;
  *(void *)algn_1E98CFDD8 = "CMPhotoDNGCompressor";
  qword_1E98CFDE0 = (uint64_t)CMPhotoDNGCompressorClass_Init;
  unk_1E98CFDE8 = 0;
  qword_1E98CFDF8 = 0;
  unk_1E98CFE00 = 0;
  qword_1E98CFDF0 = (uint64_t)CMPhotoDNGCompressorClass_Finalize;
  qword_1E98CFE08 = (uint64_t)CMPhotoDNGCompressorClass_CopyFormattingDesc;
  qword_1E98CFE10 = (uint64_t)CMPhotoDNGCompressorClass_CopyDebugDesc;
  uint64_t result = _CFRuntimeRegisterClass();
  sCMPhotoDNGCompressorTypeID = result;
  return result;
}

uint64_t CMPhotoDNGVersionFromPropertiesAndOptions(const __CFDictionary *a1, uint64_t a2, int a3, int a4, __CFString **a5)
{
  CFDictionaryRef DictCFDict = (const __CFDictionary *)_readDictCFDict(a1, (const void *)*MEMORY[0x1E4F2F630]);
  if (!DictCFDict) {
    return 4294950741;
  }
  CFDictionaryRef v10 = DictCFDict;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(DictCFDict, (const void *)*MEMORY[0x1E4F2F618]);
  if (Value)
  {
    CFNumberRef v12 = Value;
    CFTypeID v13 = CFGetTypeID(Value);
    unsigned __int16 v14 = @"1.3.0.0";
    if (v13 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
      if (valuePtr == 1) {
        unsigned __int16 v14 = @"1.4.0.0";
      }
    }
  }
  else
  {
    unsigned __int16 v14 = @"1.3.0.0";
  }
  if (a3) {
    int v15 = @"1.5.0.0";
  }
  else {
    int v15 = v14;
  }
  int v16 = _readDictCFDict(v10, @"ProfileGainTableMap");
  DictCFArray = _readDictCFArray(v10, @"WarpRectilinear2", 0);
  if (v16) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = a4 == 0;
  }
  if (v18 && DictCFArray == 0) {
    v20 = v15;
  }
  else {
    v20 = @"1.6.0.0";
  }
  if (a2) {
    FigCFDictionaryGetIntIfPresent();
  }
  uint64_t result = 0;
  *a5 = v20;
  return result;
}

const void *_readDictCFDict(const __CFDictionary *a1, const void *a2)
{
  CFDictionaryGetTypeID();
  CFNumberRef Value = CFDictionaryGetValue(a1, a2);
  uint64_t v5 = Value;
  if (Value) {
    CFGetTypeID(Value);
  }
  return v5;
}

const void *_readDictCFArray(const __CFDictionary *a1, const void *a2, _DWORD *a3)
{
  CFArrayGetTypeID();
  CFNumberRef Value = CFDictionaryGetValue(a1, a2);
  int v7 = Value;
  if (Value)
  {
    CFGetTypeID(Value);
  }
  else if (a3)
  {
    *a3 = 1;
  }
  return v7;
}

uint64_t CMPhotoDNGVersionFromProperties(const __CFDictionary *a1, int a2, int a3, __CFString **a4)
{
  return CMPhotoDNGVersionFromPropertiesAndOptions(a1, 0, a2, a3, a4);
}

uint64_t CMPhotoDNGCreateDNGFromCompressedData(const __CFDictionary *a1, const __CFData *a2, const __CFData *a3, const __CFDictionary *a4, CFTypeRef *a5)
{
  return _createDNGInternal(a1, a3, a4, a2, 0, 0, 0, 0, a5);
}

uint64_t _createDNGInternal(const __CFDictionary *a1, const __CFData *a2, const __CFDictionary *a3, const __CFData *a4, __CVBuffer *a5, const __CFArray *a6, int a7, void *a8, CFTypeRef *a9)
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  bzero(__src, 0x828uLL);
  uint64_t v121 = 0;
  *(_OWORD *)v119 = 0u;
  *(_OWORD *)theData = 0u;
  long long v118 = 0u;
  int v116 = 0xFFFF;
  unsigned int v117 = 0xFFFF;
  FigKTraceInit();
  unsigned __int16 v14 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v15 = 4294950746;
  if (!a1 || !a9) {
    goto LABEL_157;
  }
  int v16 = a4 == 0;
  if (!a5) {
    ++v16;
  }
  if (v16 != 1)
  {
    uint64_t v15 = 4294950739;
    goto LABEL_157;
  }
  if (a7)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a5);
    if (PixelFormatType != 1751527984 && PixelFormatType != 1815491698)
    {
      uint64_t v20 = FigSignalErrorAt();
      goto LABEL_78;
    }
  }
  *a9 = 0;
  if (*v14 == 1) {
    kdebug_trace();
  }
  uint64_t v15 = _dngInfoInit((uint64_t)__src, a4, a5, a1, a6, a7, a3, (uint64_t)a2);
  if (*v14 == 1) {
    kdebug_trace();
  }
  if (v15) {
    goto LABEL_157;
  }
  v109 = a5;
  CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  theData[1] = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (!theData[1]
    || (LOBYTE(v121) = 1,
        LODWORD(v119[0]) = 0,
        LODWORD(theData[0]) = 20,
        (v119[1] = malloc_type_malloc(0x50uLL, 0x100004052888210uLL)) == 0))
  {
    uint64_t v15 = 4294950745;
    goto LABEL_157;
  }
  v110 = a8;
  long long v118 = 0uLL;
  unsigned int v19 = v158;
  CFDataAppendBytes(theData[1], _cmphotoDNGWriterWriteTIFFHeader_sTiffHeaderBE, 8);
  CFDataAppendBytes(theData[1], _cmphotoDNGWriterWriteTIFFHeader_sAppleDNGID, 8);
  uint64_t v20 = _cmphotoDNGWriterIFDBegin((uint64_t)&v118, 4);
  if (v20)
  {
LABEL_78:
    uint64_t v15 = v20;
    goto LABEL_157;
  }
  CFDataRef v21 = a2;
  if (a2) {
    size_t v22 = v19 + 1;
  }
  else {
    size_t v22 = v19;
  }
  if (v132) {
    _ifdAddTagS((char **)&v118, 270, v132);
  }
  _ifdAddTagS((char **)&v118, 271, v123);
  _ifdAddTagS((char **)&v118, 272, v124);
  LODWORD(keys[0]) = v130;
  _ifdAddTag4((char **)&v118, 274, 3u, 1uLL, (__int16 *)keys);
  _ifdAddTagS((char **)&v118, 305, v125);
  _ifdAddTagS((char **)&v118, 306, (uint64_t)cf);
  if (v126) {
    _ifdAddTagS((char **)&v118, 315, v126);
  }
  if ((int)v22 < 1) {
    unsigned int v114 = 0xFFFF;
  }
  else {
    unsigned int v114 = _ifdAddTag4((char **)&v118, 330, 4u, v22, 0);
  }
  if (v127) {
    _ifdAddTagS((char **)&v118, 33432, v127);
  }
  if (v154)
  {
    LODWORD(keys[0]) = 0;
    unsigned int v23 = _ifdAddTag4((char **)&v118, 34665, 4u, 1uLL, (__int16 *)keys);
  }
  else
  {
    unsigned int v23 = 0xFFFF;
  }
  if (v153)
  {
    LODWORD(keys[0]) = 0;
    unsigned int v24 = _ifdAddTag4((char **)&v118, 34853, 4u, 1uLL, (__int16 *)keys);
  }
  else
  {
    unsigned int v24 = 0xFFFF;
  }
  _ifdAddTag4((char **)&v118, 50706, 1u, 4uLL, __src);
  _ifdAddTag4((char **)&v118, 50707, 1u, 4uLL, word_1AB9E388A);
  _ifdAddTagS((char **)&v118, 50708, v129);
  _ifdAddTag4((char **)&v118, 50721, 0xAu, 9uLL, v135);
  _ifdAddTag4((char **)&v118, 50722, 0xAu, 9uLL, v136);
  if (v146)
  {
    _ifdAddTag4((char **)&v118, 50723, 0xAu, 9uLL, v144);
    _ifdAddTag4((char **)&v118, 50724, 0xAu, 9uLL, v145);
  }
  if (v141[16])
  {
    v25 = (__int16 *)&v140;
    __int16 v26 = -14808;
    size_t v27 = 3;
  }
  else
  {
    v25 = (__int16 *)v141;
    __int16 v26 = -14807;
    size_t v27 = 2;
  }
  _ifdAddTag4((char **)&v118, v26, 5u, v27, v25);
  if (v143) {
    _ifdAddTag4((char **)&v118, 50727, 5u, 3uLL, v142);
  }
  if (v137) {
    _ifdAddTag4((char **)&v118, 50730, 0xAu, 1uLL, (__int16 *)&v137);
  }
  if (v138) {
    _ifdAddTag4((char **)&v118, 50731, 5u, 1uLL, (__int16 *)&v138);
  }
  if (v139) {
    _ifdAddTag4((char **)&v118, 50732, 5u, 1uLL, (__int16 *)&v139);
  }
  if (v131)
  {
    BytePtr = (__int16 *)CFDataGetBytePtr(v131);
    size_t Length = CFDataGetLength(v131);
    _ifdAddTag4((char **)&v118, 50740, 1u, Length, BytePtr);
  }
  LODWORD(keys[0]) = v133;
  _ifdAddTag4((char **)&v118, 50778, 3u, 1uLL, (__int16 *)keys);
  LODWORD(keys[0]) = v134;
  _ifdAddTag4((char **)&v118, 50779, 3u, 1uLL, (__int16 *)keys);
  if (v148) {
    _ifdAddTagS((char **)&v118, 50931, v148);
  }
  if (v149) {
    _ifdAddTagS((char **)&v118, 50932, v149);
  }
  if (__n[0] >= 1) {
    _ifdAddTag4((char **)&v118, 50940, 0xBu, __n[0], *(__int16 **)&__n[1]);
  }
  if (v150) {
    _ifdAddTagS((char **)&v118, 50934, v150);
  }
  if (v151) {
    _ifdAddTagS((char **)&v118, 50936, v151);
  }
  if (v162 != -1)
  {
    LODWORD(keys[0]) = v162;
    _ifdAddTag4((char **)&v118, 50941, 4u, 1uLL, (__int16 *)keys);
  }
  _ifdAddTag4((char **)&v118, 50935, 5u, 1uLL, &v147);
  if (a2)
  {
    LODWORD(keys[0]) = 1;
    _ifdAddTag4((char **)&v118, 254, 4u, 1uLL, (__int16 *)keys);
    LODWORD(keys[0]) = v155;
    _ifdAddTag4((char **)&v118, 256, 4u, 1uLL, (__int16 *)keys);
    LODWORD(keys[0]) = v156;
    _ifdAddTag4((char **)&v118, 257, 4u, 1uLL, (__int16 *)keys);
    _ifdAddTag4((char **)&v118, 258, 3u, 3uLL, _addJPEGPreviewTags_bps888);
    LODWORD(keys[0]) = v157;
    _ifdAddTag4((char **)&v118, 259, 3u, 1uLL, (__int16 *)keys);
    if (v157 == 52546) {
      int v30 = 2;
    }
    else {
      int v30 = 6;
    }
    LODWORD(keys[0]) = v30;
    _ifdAddTag4((char **)&v118, 262, 3u, 1uLL, (__int16 *)keys);
    LODWORD(keys[0]) = 0;
    unsigned int v31 = _ifdAddTag4((char **)&v118, 273, 4u, 1uLL, (__int16 *)keys);
    LODWORD(keys[0]) = 3;
    _ifdAddTag4((char **)&v118, 277, 3u, 1uLL, (__int16 *)keys);
    LODWORD(keys[0]) = v156;
    _ifdAddTag4((char **)&v118, 278, 4u, 1uLL, (__int16 *)keys);
    LODWORD(keys[0]) = CFDataGetLength(a2);
    _ifdAddTag4((char **)&v118, 279, 4u, 1uLL, (__int16 *)keys);
  }
  else
  {
    _addRawImageTags((char **)&v118, (uint64_t)__src, &v117, &v116);
    unsigned int v31 = 0xFFFF;
  }
  uint64_t v32 = _cmphotoDNGWriterIFDEnd((char **)&v118);
  if (v32) {
    goto LABEL_179;
  }
  if (!v152) {
    goto LABEL_105;
  }
  uint64_t v115 = 0;
  if (v154)
  {
    uint64_t v32 = _cmphotoDNGWriterIFDGetTagDataOffset((uint64_t)&v118, v23, (_DWORD *)&v115 + 1);
    if (v32) {
      goto LABEL_179;
    }
  }
  if (!v153)
  {
    int v33 = 0;
    goto LABEL_80;
  }
  uint64_t v32 = _cmphotoDNGWriterIFDGetTagDataOffset((uint64_t)&v118, v24, &v115);
  if (v32)
  {
LABEL_179:
    uint64_t v15 = v32;
    goto LABEL_157;
  }
  int v33 = v115;
LABEL_80:
  int v34 = HIDWORD(v115);
  keys[0] = *(void **)MEMORY[0x1E4F2F478];
  values = (void *)*MEMORY[0x1E4F1CFC8];
  CFDictionaryRef v35 = CFDictionaryCreate(v18, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v35)
  {
    uint64_t v15 = 4294950745;
    goto LABEL_157;
  }
  CFDictionaryRef v36 = v35;
  CFDataRef EXIFDataFromProperties = (const __CFData *)CGImageCreateEXIFDataFromProperties();
  if (!EXIFDataFromProperties)
  {
    CFRelease(v36);
    uint64_t v15 = 4294950739;
    goto LABEL_157;
  }
  CFDataRef v38 = EXIFDataFromProperties;
  v39 = CFDataGetBytePtr(EXIFDataFromProperties);
  uint64_t v40 = (uint64_t)(v39 + 6);
  int v41 = CMPhotoDNGRead16((unsigned __int16 *)v39 + 3, 0);
  if (v41 != 19789 && v41 != 18761) {
    goto LABEL_98;
  }
  int v42 = v41 == 19789;
  if (v121 != v42)
  {
    uint64_t v15 = 4294950739;
    goto LABEL_103;
  }
  if (CMPhotoDNGRead16((unsigned __int16 *)v39 + 4, v42) == 42)
  {
    unsigned int v43 = CMPhotoDNGRead32((unsigned int *)(v39 + 10), v42);
    if (!v43) {
      goto LABEL_102;
    }
    unsigned int v44 = v43;
    unsigned int v107 = v31;
    int v45 = CMPhotoDNGRead16((unsigned __int16 *)(v40 + v43), v42);
    if (v45)
    {
      int v46 = v45;
      int v106 = v34;
      unsigned int v47 = 0;
      unsigned int v48 = 0;
      v49 = (unsigned int *)&v39[v44 + 16];
      do
      {
        int v50 = CMPhotoDNGRead16((unsigned __int16 *)v49 - 4, v42);
        if (v50 == 34853)
        {
          unsigned int v47 = CMPhotoDNGRead32(v49, v42);
        }
        else if (v50 == 34665)
        {
          unsigned int v48 = CMPhotoDNGRead32(v49, v42);
        }
        v49 += 3;
        --v46;
      }
      while (v46);
      unsigned int v31 = v107;
      if (v48)
      {
        uint64_t v15 = _cmphotoDNGWriterIFDInsert((uint64_t)&v118, v40, v48, v106);
        if (v15 || !v47) {
          goto LABEL_103;
        }
        goto LABEL_101;
      }
      if (v47)
      {
LABEL_101:
        uint64_t v15 = _cmphotoDNGWriterIFDInsert((uint64_t)&v118, v40, v47, v33);
        goto LABEL_103;
      }
LABEL_102:
      uint64_t v15 = 0;
      goto LABEL_103;
    }
    uint64_t v15 = 0;
  }
  else
  {
LABEL_98:
    uint64_t v15 = 4294950743;
  }
LABEL_103:
  CFRelease(v38);
  CFRelease(v36);
  unsigned __int16 v14 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (v15) {
    goto LABEL_157;
  }
  CFDataRef v21 = a2;
LABEL_105:
  v51 = a9;
  if (v21)
  {
    LODWORD(keys[0]) = 0;
    uint64_t v20 = _cmphotoDNGWriterIFDGetTagDataOffset((uint64_t)&v118, v114, keys);
    if (v20) {
      goto LABEL_78;
    }
    uint64_t v20 = _cmphotoDNGWriterIFDBegin((uint64_t)&v118, (int)keys[0]);
    if (v20) {
      goto LABEL_78;
    }
    _addRawImageTags((char **)&v118, (uint64_t)__src, &v117, &v116);
    uint64_t v20 = _cmphotoDNGWriterIFDEnd((char **)&v118);
    if (v20) {
      goto LABEL_78;
    }
  }
  int v52 = v158;
  if (v158 >= 1)
  {
    unsigned int v108 = v31;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    int v56 = 4 * (v21 != 0);
    do
    {
      v57 = (char *)v159;
      LODWORD(values) = 0;
      uint64_t v58 = _cmphotoDNGWriterIFDGetTagDataOffset((uint64_t)&v118, v114, &values);
      if (v58) {
        goto LABEL_146;
      }
      uint64_t v58 = _cmphotoDNGWriterIFDBegin((uint64_t)&v118, v56 + (int)values);
      if (v58) {
        goto LABEL_146;
      }
      v59 = &v57[v53];
      if ((*(_DWORD *)&v57[v53 + 28] - 1) > 1)
      {
        LODWORD(keys[0]) = 65540;
        _ifdAddTag4((char **)&v118, 254, 4u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = *((_DWORD *)v59 + 8);
        _ifdAddTag4((char **)&v118, 256, 4u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = *((_DWORD *)v59 + 9);
        _ifdAddTag4((char **)&v118, 257, 4u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = 8;
        _ifdAddTag4((char **)&v118, 258, 3u, 1uLL, (__int16 *)keys);
        unsigned int v62 = *((_DWORD *)v59 + 6) - 1;
        if (v62 > 4) {
          int v63 = 0;
        }
        else {
          int v63 = dword_1AB9E38A4[v62];
        }
        LODWORD(keys[0]) = v63;
        _ifdAddTag4((char **)&v118, 259, 3u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = 52527;
        _ifdAddTag4((char **)&v118, 262, 3u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = 0;
        *((_DWORD *)v59 + 15) = _ifdAddTag4((char **)&v118, 273, 4u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = 1;
        _ifdAddTag4((char **)&v118, 277, 3u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = *((_DWORD *)v59 + 9);
        _ifdAddTag4((char **)&v118, 278, 4u, 1uLL, (__int16 *)keys);
        v69 = &v57[v53];
        LODWORD(keys[0]) = CFDataGetLength(*(CFDataRef *)&v57[v53]);
        _ifdAddTag4((char **)&v118, 279, 4u, 1uLL, (__int16 *)keys);
        CFDataRef v70 = *(const __CFData **)&v57[v53 + 8];
        if (v70)
        {
          size_t v71 = CFDataGetLength(v70);
          v72 = (__int16 *)CFDataGetBytePtr(*((CFDataRef *)v69 + 1));
          _ifdAddTag4((char **)&v118, 700, 1u, v71, v72);
        }
        _ifdAddTagS((char **)&v118, 52526, *((void *)v69 + 2));
      }
      else
      {
        LODWORD(keys[0]) = 8;
        _ifdAddTag4((char **)&v118, 254, 4u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = *((_DWORD *)v59 + 8);
        _ifdAddTag4((char **)&v118, 256, 4u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = *((_DWORD *)v59 + 9);
        _ifdAddTag4((char **)&v118, 257, 4u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = *((_DWORD *)v59 + 10);
        _ifdAddTag4((char **)&v118, 258, 3u, 1uLL, (__int16 *)keys);
        unsigned int v60 = *((_DWORD *)v59 + 6) - 1;
        if (v60 > 4) {
          int v61 = 0;
        }
        else {
          int v61 = dword_1AB9E38A4[v60];
        }
        LODWORD(keys[0]) = v61;
        _ifdAddTag4((char **)&v118, 259, 3u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = 51177;
        _ifdAddTag4((char **)&v118, 262, 3u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = 0;
        *((_DWORD *)v59 + 15) = _ifdAddTag4((char **)&v118, 273, 4u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = 1;
        _ifdAddTag4((char **)&v118, 277, 3u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = *((_DWORD *)v59 + 9);
        _ifdAddTag4((char **)&v118, 278, 4u, 1uLL, (__int16 *)keys);
        v64 = &v57[v53];
        LODWORD(keys[0]) = CFDataGetLength(*(CFDataRef *)&v57[v53]);
        _ifdAddTag4((char **)&v118, 279, 4u, 1uLL, (__int16 *)keys);
        CFDataRef v65 = *(const __CFData **)&v57[v53 + 8];
        if (v65)
        {
          size_t v66 = CFDataGetLength(v65);
          v67 = (__int16 *)CFDataGetBytePtr(*((CFDataRef *)v64 + 1));
          _ifdAddTag4((char **)&v118, 700, 1u, v66, v67);
        }
        int v68 = *((_DWORD *)v59 + 7) == 1 ? 2 : 1;
        LODWORD(keys[0]) = v68;
        _ifdAddTag4((char **)&v118, 51177, 3u, 1uLL, (__int16 *)keys);
        _ifdAddTag4((char **)&v118, 51178, 5u, 1uLL, (__int16 *)v64 + 22);
        _ifdAddTag4((char **)&v118, 51179, 5u, 1uLL, (__int16 *)v64 + 26);
        LODWORD(keys[0]) = 1;
        _ifdAddTag4((char **)&v118, 51180, 3u, 1uLL, (__int16 *)keys);
        LODWORD(keys[0]) = 1;
        _ifdAddTag4((char **)&v118, 51181, 3u, 1uLL, (__int16 *)keys);
      }
      CFIndex v73 = CFDataGetLength(*(CFDataRef *)&v57[v53]);
      uint64_t v58 = _cmphotoDNGWriterIFDEnd((char **)&v118);
      if (v58)
      {
LABEL_146:
        uint64_t v15 = v58;
        goto LABEL_147;
      }
      v55 += v73;
      ++v54;
      int v52 = v158;
      v56 += 4;
      v53 += 64;
    }
    while (v54 < v158);
    v51 = a9;
    CFDataRef v21 = a2;
    unsigned int v31 = v108;
    if (a2) {
      goto LABEL_134;
    }
    goto LABEL_136;
  }
  uint64_t v55 = 0;
  if (!v21)
  {
LABEL_136:
    if (v52 < 1)
    {
LABEL_140:
      unsigned __int16 v14 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      if (*MEMORY[0x1E4F1EBA8] == 1) {
        kdebug_trace();
      }
      unsigned int v94 = v116;
      LODWORD(keys[0]) = 0;
      LODWORD(values) = 0;
      uint64_t v95 = _cmphotoDNGWriterIFDGetTagDataOffset((uint64_t)&v118, v117, keys);
      if (v95 || (uint64_t v95 = _cmphotoDNGWriterIFDGetTagDataOffset((uint64_t)&v118, v94, &values), v95))
      {
        uint64_t v15 = v95;
        v96 = v110;
      }
      else
      {
        v96 = v110;
        if (a4)
        {
          uint64_t v97 = CMPhotoDNGWriteCompressedRaw(__src, a4, theData[1], (int)keys[0], (int)values, v121);
        }
        else if (a7)
        {
          uint64_t v97 = CMPhotoDNGCompressLinearDNG(__src, v109, theData[1], LODWORD(keys[0]), values, v121);
        }
        else
        {
          uint64_t v97 = CMPhotoDNGCompressRaw(__src, v109, theData[1], (int)keys[0], (int)values, v121);
        }
        uint64_t v15 = v97;
      }
      if (*v14 == 1) {
        kdebug_trace();
      }
      if (!v15)
      {
        CFTypeRef *v51 = CFRetain(theData[1]);
        uint64_t v15 = 0;
        if (v96) {
          void *v96 = v55;
        }
      }
      goto LABEL_157;
    }
    uint64_t v83 = 0;
    uint64_t v84 = 0;
    while (1)
    {
      LODWORD(keys[0]) = 0;
      uint64_t v74 = _cmphotoDNGWriterIFDGetTagDataOffset((uint64_t)&v118, *(_DWORD *)((char *)v159 + v83 + 60), keys);
      if (v74) {
        goto LABEL_177;
      }
      MutableBytePtr = CFDataGetMutableBytePtr(theData[1]);
      v86 = (unsigned int *)&MutableBytePtr[LODWORD(keys[0])];
      unsigned int v87 = CFDataGetLength(theData[1]);
      CMPhotoDNGWrite32(v86, v87, v121);
      CFDataRef v88 = *(const __CFData **)((char *)v159 + v83);
      v89 = theData[1];
      v90 = CFDataGetBytePtr(v88);
      CFIndex v91 = CFDataGetLength(v88);
      CFDataAppendBytes(v89, v90, v91);
      v92 = theData[1];
      int v93 = CFDataGetLength(theData[1]);
      CFDataAppendBytes(v92, zero, -v93 & 3);
      ++v84;
      v83 += 64;
      if (v84 >= v158) {
        goto LABEL_140;
      }
    }
  }
LABEL_134:
  LODWORD(keys[0]) = 0;
  uint64_t v74 = _cmphotoDNGWriterIFDGetTagDataOffset((uint64_t)&v118, v31, keys);
  if (!v74)
  {
    v75 = CFDataGetMutableBytePtr(theData[1]);
    v76 = (unsigned int *)&v75[LODWORD(keys[0])];
    unsigned int v77 = CFDataGetLength(theData[1]);
    CMPhotoDNGWrite32(v76, v77, v121);
    v78 = theData[1];
    v79 = CFDataGetBytePtr(v21);
    CFIndex v80 = CFDataGetLength(v21);
    CFDataAppendBytes(v78, v79, v80);
    v81 = theData[1];
    int v82 = CFDataGetLength(theData[1]);
    CFDataAppendBytes(v81, zero, -v82 & 3);
    int v52 = v158;
    goto LABEL_136;
  }
LABEL_177:
  uint64_t v15 = v74;
LABEL_147:
  unsigned __int16 v14 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_157:
  if (*v14 == 1) {
    kdebug_trace();
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v152) {
    CFRelease(v152);
  }
  if (v158 >= 1)
  {
    uint64_t v98 = 0;
    for (uint64_t i = 0; i < v158; ++i)
    {
      v100 = (char *)v159;
      v101 = *(const void **)((char *)v159 + v98 + 16);
      if (v101)
      {
        CFRelease(v101);
        v100 = (char *)v159;
      }
      v102 = *(const void **)&v100[v98];
      if (v102)
      {
        CFRelease(v102);
        v100 = (char *)v159;
      }
      v103 = *(const void **)&v100[v98 + 8];
      if (v103) {
        CFRelease(v103);
      }
      v98 += 64;
    }
  }
  free(v159);
  _cmphotoDNGWriterReleaseTagStorage((char **)&v118);
  if (theData[1])
  {
    CFRelease(theData[1]);
    theData[1] = 0;
  }
  v104 = v119[1];
  if (v119[1])
  {
    v119[1] = 0;
    free(v104);
  }
  free(v160);
  free(*(void **)&__n[1]);
  return v15;
}

uint64_t CMPhotoDNGCreateDNGFromRAWPixelBuffer(const __CFDictionary *a1, __CVBuffer *a2, const __CFData *a3, const __CFDictionary *a4, CFTypeRef *a5)
{
  return _createDNGInternal(a1, a3, a4, 0, a2, 0, 0, 0, a5);
}

uint64_t CMPhotoDNGCreateDNGFromRAWPixelBufferAndAuxiliaryImage(const __CFDictionary *a1, __CVBuffer *a2, const __CFData *a3, const void *a4, const void *a5, const void *a6, const __CFDictionary *a7, CFTypeRef *a8)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return _createDNGInternal(a1, a3, a7, 0, a2, 0, 0, 0, a8);
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 4294950745;
  }
  BOOL v17 = Mutable;
  uint64_t DNGInternal = 4294950746;
  if (a5 && a6)
  {
    CFDictionarySetValue(Mutable, @"AuxPixelBuffer", a4);
    CFDictionarySetValue(v17, @"AuxMetadata", a5);
    CFDictionarySetValue(v17, @"AuxImageType", a6);
    if (a7) {
      CFDictionarySetValue(v17, @"AuxOptions", a7);
    }
    v20[0] = v17;
    uint64_t DNGInternal = _createDNGInternal(a1, a3, a7, 0, a2, (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1], 0, 0, a8);
  }
  CFRelease(v17);
  return DNGInternal;
}

uint64_t CMPhotoDNGCreateLinearDNGFromPixelBuffer(const __CFDictionary *a1, __CVBuffer *a2, const __CFData *a3, const __CFDictionary *a4, CFTypeRef *a5)
{
  return _createDNGInternal(a1, a3, a4, 0, a2, 0, 1, 0, a5);
}

uint64_t CMPhotoDNGCreateCompressedDataFromRAWPixelBuffer(__CVBuffer *a1, uint64_t a2, __CFData **a3)
{
  bzero(v21, 0x828uLL);
  FigKTraceInit();
  if (!a3) {
    return 4294950746;
  }
  CFMutableDataRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (!Mutable) {
    return 4294950745;
  }
  uint64_t v6 = Mutable;
  FigCFDictionaryGetBooleanIfPresent();
  int Width = CVPixelBufferGetWidth(a1);
  int Height = CVPixelBufferGetHeight(a1);
  v21[25] = Width;
  v21[26] = Height;
  v21[405] = 2;
  _tileDescriptionInitialize((uint64_t)v21);
  *(void *)bytes = 0x163726177;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  int v16 = Width;
  int v17 = Height;
  uint64_t v18 = v22;
  CFIndex v9 = v23;
  int v19 = v23;
  int v20 = 1;
  CFDataAppendBytes(v6, bytes, 36);
  int Length = CFDataGetLength(v6);
  v9 *= 4;
  CFDataIncreaseLength(v6, v9);
  int v11 = CFDataGetLength(v6);
  CFDataIncreaseLength(v6, v9);
  uint64_t v12 = CMPhotoDNGCompressRaw(v21, a1, v6, Length, v11, v20);
  if (v12) {
    CFRelease(v6);
  }
  else {
    *a3 = v6;
  }
  return v12;
}

uint64_t _tileDescriptionInitialize(uint64_t result)
{
  CMVideoCodecType v1 = (_DWORD *)result;
  int v3 = *(_DWORD *)(result + 100);
  int v2 = *(_DWORD *)(result + 104);
  *(_DWORD *)(result + 1628) = v3;
  *(_DWORD *)(result + 1632) = v2;
  *(_DWORD *)(result + 1636) = 1;
  if (*(unsigned char *)(result + 4))
  {
    uint64_t result = CMPhotoGetPreferredDNGTileSizeForImageSize(v3, v2, *(_DWORD *)(result + 8));
    v1[407] = result;
    v1[408] = v4;
    int v5 = (v4 + v1[26] - 1) / v4 * (((int)result + v1[25] - 1) / (int)result);
LABEL_17:
    v1[409] = v5;
    return result;
  }
  if (v3 >= 512 && (v3 & 0xF) == 0)
  {
    int v5 = 1;
    do
    {
      unsigned int v7 = v3 >> 1;
      v5 *= 2;
      if (v3 < 0x400) {
        break;
      }
      int v8 = v3 & 0x1E;
      int v3 = v3 >> 1;
    }
    while (!v8);
    *(_DWORD *)(result + 1628) = v7;
    *(_DWORD *)(result + 1636) = v5;
  }
  else
  {
    int v5 = 1;
  }
  if (v2 >= 512 && (v2 & 3) == 0)
  {
    do
    {
      unsigned int v9 = v2 >> 1;
      v5 *= 2;
      if (v2 < 0x400) {
        break;
      }
      int v10 = v2 & 6;
      int v2 = v2 >> 1;
    }
    while (!v10);
    *(_DWORD *)(result + 1632) = v9;
    goto LABEL_17;
  }
  return result;
}

uint64_t CMPhotoDNGCreateCVPixelBufferFromData(const __CFData *a1, unint64_t a2, unint64_t a3, size_t a4, uint64_t a5, uint64_t a6, CVPixelBufferRef *a7)
{
  return _createCVPixelBufferFromDNGData(a1, a2, a3, 0, 0, a4, a5, a6, a7);
}

uint64_t _createCVPixelBufferFromDNGData(CFDataRef theData, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, size_t a6, uint64_t a7, uint64_t a8, CVPixelBufferRef *a9)
{
  v60[4] = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef pixelBufferOut = 0;
  if (!theData) {
    return 4294950739;
  }
  uint64_t v16 = a3;
  uint64_t v17 = a2;
  if (a5 | a4)
  {
    uint64_t v18 = 4294950741;
    if (!a4 || !a5) {
      goto LABEL_39;
    }
    uint64_t v17 = CMPhotoAlignValue(a2, a4);
    uint64_t v16 = CMPhotoAlignValue(a3, a5);
  }
  if (!a6)
  {
    a6 = CMPhotoGetBytesPerPixelForPixelFormat(a7) * v17;
    if (!a6)
    {
      uint64_t v18 = 4294950741;
      goto LABEL_39;
    }
  }
  if (a7 == 1751527984 || a7 == 875704422)
  {
    uint64_t v18 = 4294950739;
    if (!v17) {
      goto LABEL_39;
    }
    if (!v16) {
      goto LABEL_39;
    }
    unint64_t v32 = (unint64_t)((double)(unint64_t)CFDataGetLength(theData) * 0.666666667);
    if (a6 * v16 != v32) {
      goto LABEL_39;
    }
    CGColorSpaceRef v33 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE0]);
    uint64_t v34 = *MEMORY[0x1E4F24D20];
    v60[0] = MEMORY[0x1E4F1CC08];
    uint64_t v35 = *MEMORY[0x1E4F24D70];
    v59[0] = v34;
    v59[1] = v35;
    uint64_t v36 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:a7];
    uint64_t v37 = *MEMORY[0x1E4F24BC8];
    uint64_t v38 = *MEMORY[0x1E4F24BE8];
    v60[1] = v36;
    v60[2] = v38;
    uint64_t v39 = *MEMORY[0x1E4F24A00];
    v59[2] = v37;
    v59[3] = v39;
    v60[3] = v33;
    CFDictionaryRef pixelBufferAttributes = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:4];
    planeWidth[0] = a2;
    planeWidth[1] = a2 >> 1;
    v57[0] = a3;
    v57[1] = a3 >> 1;
    planeBytesPerRow[0] = a6;
    planeBytesPerRow[1] = a6;
    planeBaseAddress[0] = (void *)CFDataGetBytePtr(theData);
    planeBaseAddress[1] = (void *)&CFDataGetBytePtr(theData)[v32];
    CFRetain(theData);
    uint64_t v18 = CVPixelBufferCreateWithPlanarBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, a3, a7, 0, 0, 2uLL, planeBaseAddress, planeWidth, v57, planeBytesPerRow, (CVPixelBufferReleasePlanarBytesCallback)_pixelBufferPlanarReleaseCallback, theData, pixelBufferAttributes, &pixelBufferOut);
    if (v33) {
      CFRelease(v33);
    }
    if (v18) {
      goto LABEL_39;
    }
  }
  else if (a7)
  {
    uint64_t v18 = 4294950739;
    if (!v17 || !v16) {
      goto LABEL_39;
    }
    if (CFDataGetLength(theData) != a6 * v16)
    {
      uint64_t v18 = 4294950743;
      goto LABEL_39;
    }
    unsigned int v43 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
    if (a7 != 1815491698) {
      goto LABEL_51;
    }
    unsigned int v44 = (void *)MEMORY[0x1AD1109A0]();
    v53[0] = *MEMORY[0x1E4F2F040];
    v54[0] = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:CFDataGetBytePtr(theData)];
    v53[1] = *MEMORY[0x1E4F2EFB8];
    v54[1] = [MEMORY[0x1E4F28ED0] numberWithLong:CFDataGetLength(theData)];
    v53[2] = *MEMORY[0x1E4F2EFE0];
    v54[2] = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:a6];
    v53[3] = *MEMORY[0x1E4F2F2C0];
    v54[3] = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:a2];
    v53[4] = *MEMORY[0x1E4F2F0E8];
    v54[4] = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:a3];
    v53[5] = *MEMORY[0x1E4F2F150];
    uint64_t v45 = [MEMORY[0x1E4F28ED0] numberWithInt:1815491698];
    v53[6] = *MEMORY[0x1E4F2EFD8];
    v54[5] = v45;
    v54[6] = &unk_1F02E5180;
    IOSurfaceRef v46 = IOSurfaceCreate((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:7]);
    unsigned int v47 = (id)CFMakeCollectable(v46);
    objc_setAssociatedObject(v47, _createCVPixelBufferFromDNGData, theData, (void *)1);
    uint64_t v18 = CVPixelBufferCreateWithIOSurface(*v43, (IOSurfaceRef)v47, 0, &pixelBufferOut);
    if (v18) {
      goto LABEL_39;
    }
    if (!pixelBufferOut)
    {
LABEL_51:
      CFRetain(theData);
      CFAllocatorRef v48 = *v43;
      BytePtr = (UInt8 *)CFDataGetBytePtr(theData);
      uint64_t v50 = CVPixelBufferCreateWithBytes(v48, a2, a3, a7, BytePtr, a6, (CVPixelBufferReleaseBytesCallback)_pixelBufferReleaseCallback, theData, 0, &pixelBufferOut);
      if (v50)
      {
        uint64_t v18 = v50;
        goto LABEL_39;
      }
    }
  }
  else
  {
    int v19 = (void *)MEMORY[0x1AD1109A0]();
    int v20 = (void *)[(objc_class *)getCIImageClass_0() imageWithData:theData];
    if (!v20)
    {
      uint64_t v18 = 2;
      goto LABEL_18;
    }
    CFDataRef v21 = v20;
    CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    [v20 extent];
    size_t v24 = (unint64_t)v23;
    [v21 extent];
    uint64_t v26 = CVPixelBufferCreate(v22, v24, (unint64_t)v25, 0x6C363472u, 0, &pixelBufferOut);
    if (v26)
    {
      uint64_t v18 = v26;
      goto LABEL_18;
    }
    id v27 = objc_alloc(getCIRenderDestinationClass());
    id v28 = (id)[v27 initWithPixelBuffer:pixelBufferOut];
    [v28 setAlphaMode:2];
    objc_msgSend(v28, "setColorSpace:", objc_msgSend(v21, "colorSpace"));
    planeWidth[0] = 0;
    v29 = (void *)[(objc_class *)getCIContextClass_0() context];
    if (!v29)
    {
      uint64_t v18 = 4294950745;
      goto LABEL_18;
    }
    int v30 = (void *)[v29 startTaskToRender:v21 toDestination:v28 error:planeWidth];
    size_t v31 = planeWidth[0];
    if (!v30
      || planeWidth[0]
      || ([v30 waitUntilCompletedAndReturnError:planeWidth], (size_t v31 = planeWidth[0]) != 0))
    {
      NSLog(&stru_1F02DEB78.isa, v31);
      uint64_t v18 = 4294950739;
LABEL_18:
      goto LABEL_39;
    }
  }
  if (!a8 || a8 == a7)
  {
    uint64_t v18 = 0;
    *a9 = pixelBufferOut;
    return v18;
  }
  planeWidth[0] = 0;
  uint64_t v18 = CMPhotoScaleAndRotateSessionTransformForSize(0, pixelBufferOut, 1, 1, a8, 0, 0, 1u, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24), *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v41, v42, 0, 1u, (__CVBuffer **)planeWidth);
  if (!v18) {
    *a9 = (CVPixelBufferRef)planeWidth[0];
  }
LABEL_39:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  return v18;
}

uint64_t CMPhotoDNGCreateCVPixelBufferFromTiledData(CFDataRef theData, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, size_t a6, uint64_t a7, uint64_t a8, CVPixelBufferRef *a9)
{
  return _createCVPixelBufferFromDNGData(theData, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t CMPhotoDNGCompressorCreate(const __CFAllocator *a1, unsigned int a2, uint64_t a3, void *a4)
{
  uint64_t result = 4294950746;
  if (a2 <= 1 && a4)
  {
    pthread_once(&CMPhotoDNGCompressorGetTypeID_onceToken, (void (*)(void))RegisterCMPhotoDNGCompressor);
    uint64_t Instance = _CFRuntimeCreateInstance();
    if (Instance)
    {
      unsigned int v9 = (void *)Instance;
      *(_DWORD *)(Instance + 16) = a2;
      *(void *)(Instance + 96) = 0;
      CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x1E4F1D510]);
      v9[9] = Mutable;
      if (Mutable)
      {
        CFMutableArrayRef v11 = CFArrayCreateMutable(a1, 0, MEMORY[0x1E4F1D510]);
        v9[10] = v11;
        if (v11)
        {
          uint64_t result = 0;
          v9[8] = 0;
          v9[11] = 0;
          *a4 = v9;
          return result;
        }
      }
      CFRelease(v9);
    }
    return 4294950745;
  }
  return result;
}

uint64_t CMPhotoDNGCompressorSetMainImage(void *a1, const void *a2, CFTypeRef cf, const void *a4)
{
  uint64_t result = 4294950746;
  if (a2 && a1 && cf)
  {
    unsigned int v9 = (const void *)a1[3];
    if (v9)
    {
      CFRelease(v9);
      a1[3] = 0;
    }
    int v10 = (const void *)a1[4];
    if (v10)
    {
      CFRelease(v10);
      a1[4] = 0;
    }
    CFMutableArrayRef v11 = (const void *)a1[6];
    if (v11)
    {
      CFRelease(v11);
      a1[6] = 0;
    }
    a1[3] = CFRetain(cf);
    a1[4] = CFRetain(a2);
    if (a4)
    {
      uint64_t result = (uint64_t)CFRetain(a4);
      a1[6] = result;
      if (result)
      {
        FigCFDictionaryGetIntIfPresent();
        return 0;
      }
    }
    else
    {
      uint64_t result = 0;
      a1[6] = 0;
    }
  }
  return result;
}

uint64_t CMPhotoDNGCompressorSetCompressedPreviewImage(uint64_t a1, void *cf, CFDictionaryRef theDict)
{
  CFIndex v12 = 0;
  if (!a1) {
    return 4294950746;
  }
  if (theDict)
  {
    if (CFDictionaryGetValue(theDict, @"SourceCropRect")
      || CFDictionaryGetValue(theDict, @"PreviewImageMaxPixelSize"))
    {
      return FigSignalErrorAt();
    }
    FigCFDictionaryGetIntIfPresent();
    CMPhotoCFDictionaryGetSizeIfPresent(theDict, @"CompressedSurfaceSize", &v12);
  }
  uint64_t v6 = *(const void **)(a1 + 56);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 56) = 0;
  }
  unsigned int v7 = *(const void **)(a1 + 96);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(a1 + 96) = 0;
  }
  if (!cf) {
    return 0;
  }
  CFTypeID v8 = CFGetTypeID(cf);
  if (v8 == CFDataGetTypeID())
  {
    *(void *)(a1 + 56) = CFRetain(cf);
    return 0;
  }
  CFTypeID v9 = CFGetTypeID(cf);
  if (v9 == IOSurfaceGetTypeID())
  {
    CFDataRef DataWrappingIOSurface = CMPhotoCreateDataWrappingIOSurface((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (IOSurfaceRef)cf, 0, v12);
    *(void *)(a1 + 56) = DataWrappingIOSurface;
    if (DataWrappingIOSurface) {
      return 0;
    }
  }
  return FigSignalErrorAt();
}

uint64_t CMPhotoDNGCompressorSetPreviewImage(uint64_t a1, CVPixelBufferRef pixelBuffer, const __CFDictionary *a3)
{
  CFTypeRef cf = 0;
  uint64_t v3 = 4294950746;
  if (!a1 || !pixelBuffer) {
    return v3;
  }
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  int v8 = PixelFormatType;
  int UncompressedPixelFormatFromCompressedPixelFormat = CMPhotoGetUncompressedPixelFormatFromCompressedPixelFormat(PixelFormatType);
  int v10 = UncompressedPixelFormatFromCompressedPixelFormat;
  if (UncompressedPixelFormatFromCompressedPixelFormat == 875704422
    || UncompressedPixelFormatFromCompressedPixelFormat == 1111970369)
  {
    CFTypeRef v11 = CVBufferCopyAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
    if (FigCFEqual())
    {
      uint64_t v3 = FigSignalErrorAt();
      CFTypeRef v12 = 0;
      goto LABEL_26;
    }
    if (v8 == 875704422)
    {
      CFTypeRef v12 = CVBufferCopyAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24C18], 0);
      if (!FigCFEqual())
      {
LABEL_25:
        uint64_t v3 = FigSignalErrorAt();
LABEL_26:
        if (v11) {
          CFRelease(v11);
        }
        if (v12) {
          CFRelease(v12);
        }
        return v3;
      }
    }
    else
    {
      CFTypeRef v12 = 0;
    }
    int v17 = 0;
    if (!CMPhotoCFDictionaryGetIntIfPresent(a3, @"PreviewImageCodec", &v17) || v17 == 1785750887)
    {
      uint64_t JPEGFromPixelBuffer = _createJPEGFromPixelBuffer(pixelBuffer, a3, 0);
    }
    else
    {
      if (v17 != 1786276963 || v10 != 1111970369) {
        goto LABEL_25;
      }
      uint64_t JPEGFromPixelBuffer = _createJPEGXLFromPixelBuffer(pixelBuffer, (uint64_t)a3, (CFDataRef *)&cf);
    }
    uint64_t v3 = JPEGFromPixelBuffer;
    if (JPEGFromPixelBuffer)
    {
      if (cf) {
        CFRelease(cf);
      }
    }
    else
    {
      uint64_t v15 = *(const void **)(a1 + 56);
      if (v15)
      {
        CFRelease(v15);
        *(void *)(a1 + 56) = 0;
      }
      uint64_t v16 = *(const void **)(a1 + 96);
      if (v16)
      {
        CFRelease(v16);
        *(void *)(a1 + 96) = 0;
      }
      uint64_t v3 = 0;
      *(void *)(a1 + 56) = cf;
      CFTypeRef cf = 0;
    }
    goto LABEL_26;
  }
  return FigSignalErrorAt();
}

uint64_t _createJPEGFromPixelBuffer(__CVBuffer *a1, const __CFDictionary *a2, int a3)
{
  CFTypeRef v18 = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v7 = CMPhotoCompressionSessionCreate((const __CFAllocator *)*MEMORY[0x1E4F1CF80], 0, &v18);
  if (v7)
  {
    uint64_t v17 = v7;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (Mutable)
    {
      CFDictionaryRef v9 = Mutable;
      uint64_t v10 = FigCFDictionarySetInt();
      if (v10
        || (uint64_t v10 = FigCFDictionarySetInt(), v10)
        || (uint64_t v10 = CMPhotoCompressionSessionOpenEmptyContainer((uint64_t)v18, v9), v10))
      {
        uint64_t v17 = v10;
      }
      else
      {
        CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (v11)
        {
          CFTypeRef v12 = v11;
          uint64_t v13 = FigCFDictionarySetInt();
          if (!v13)
          {
            if (a3) {
              goto LABEL_12;
            }
            if (CVPixelBufferGetPixelFormatType(a1) == 1278226488) {
              CFDictionarySetValue(v12, @"PreferSoftwareCodec", (const void *)*MEMORY[0x1E4F1CFD0]);
            }
            uint64_t v13 = FigCFDictionarySetInt();
            if (!v13)
            {
LABEL_12:
              uint64_t v13 = FigCFDictionarySetInt();
              if (!v13)
              {
                if (a2)
                {
                  CFNumberRef Value = CFDictionaryGetValue(a2, @"SourceCropRect");
                  if (Value) {
                    CFDictionarySetValue(v12, @"SourceCropRect", Value);
                  }
                  uint64_t v15 = CFDictionaryGetValue(a2, @"PreviewImageMaxPixelSize");
                  if (v15) {
                    CFDictionarySetValue(v12, @"MaxPixelSize", v15);
                  }
                }
                uint64_t v13 = CMPhotoCompressionSessionAddImage((uint64_t)v18, v12, a1, 0);
                if (!v13)
                {
                  uint64_t v13 = CMPhotoCompressionSessionCloseContainerAndCopyBacking((uint64_t)v18);
                  if (!v13) {
                    uint64_t v13 = FigSignalErrorAt();
                  }
                }
              }
            }
          }
          uint64_t v17 = v13;
          CFRelease(v12);
        }
        else
        {
          uint64_t v17 = 4294950745;
        }
      }
      CFRelease(v9);
    }
    else
    {
      uint64_t v17 = 4294950745;
    }
  }
  if (v18) {
    CFRelease(v18);
  }
  return v17;
}

uint64_t _createJPEGXLFromPixelBuffer(__CVBuffer *a1, uint64_t a2, CFDataRef *a3)
{
  double PixelBufferSize = CMPhotoGetPixelBufferSize(a1);
  double v8 = v7;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  CFDataRef Mutable = CFDataCreateMutable(0, 0);
  int v20 = 2;
  unsigned int v21 = 2;
  float v19 = 1.0;
  CFTypeRef cf = 0;
  if (a2)
  {
    FigCFDictionaryGetFloatIfPresent();
    BOOL v12 = v19 < 0.0 || v19 > 1.0;
    if (v12 || (FigCFDictionaryGetIntIfPresent(), v21 - 10 <= 0xFFFFFFF6))
    {
      uint64_t ColorSpaceFromPixelBuffer = FigSignalErrorAt();
LABEL_20:
      uint64_t v16 = ColorSpaceFromPixelBuffer;
      goto LABEL_14;
    }
    FigCFDictionaryGetIntIfPresent();
  }
  uint64_t ColorSpaceFromPixelBuffer = CMPhotoCreateColorSpaceFromPixelBuffer(a1, (CGColorSpace **)&cf, 1, 1);
  if (ColorSpaceFromPixelBuffer) {
    goto LABEL_20;
  }
  uint64_t ColorSpaceFromPixelBuffer = CVPixelBufferLockBaseAddress(a1, 0);
  if (ColorSpaceFromPixelBuffer) {
    goto LABEL_20;
  }
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  uint64_t v15 = CMPhotoDNGJPEGXLCompressData(vcvtad_u64_f64(PixelBufferSize), vcvtad_u64_f64(v8), PixelFormatType, BaseAddress, BytesPerRow, v19, v21, v20, (CGColorSpace *)cf, Mutable);
  uint64_t v16 = v15;
  if (a3 && !v15) {
    *a3 = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Mutable);
  }
  CVPixelBufferUnlockBaseAddress(a1, 0);
LABEL_14:
  if (cf) {
    CFRelease(cf);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v16;
}

uint64_t CMPhotoDNGCompressorSetPreviewImageFromRAW(uint64_t a1, uint64_t a2, __CVBuffer *a3, const __CFDictionary *a4)
{
  CFTypeRef v4 = 0;
  CVPixelBufferRef v39 = 0;
  uint64_t v5 = 4294950746;
  if (!a1 || !a2)
  {
    CGColorSpaceRef v8 = 0;
    goto LABEL_22;
  }
  CGColorSpaceRef v8 = 0;
  if (!a3) {
    goto LABEL_22;
  }
  double PixelBufferCLAPAsRect = CMPhotoGetPixelBufferCLAPAsRect(a3);
  CGFloat v13 = v12;
  double v15 = v14;
  double v17 = v16;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType != 1751527984 && PixelFormatType != 1815491698)
  {
    uint64_t v5 = FigSignalErrorAt();
    CFTypeRef v4 = 0;
LABEL_20:
    CGColorSpaceRef v8 = 0;
    goto LABEL_22;
  }
  CFTypeRef v4 = CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
  if (!FigCFEqual())
  {
    uint64_t v5 = FigSignalErrorAt();
    goto LABEL_20;
  }
  float v19 = (void *)MEMORY[0x1AD1109A0]();
  int v20 = (void *)[(objc_class *)getCIFilterClass() filterWithCVPixelBuffer:a3 properties:a2 options:0];
  if (!v20)
  {
    uint64_t v28 = FigSignalErrorAt();
    goto LABEL_32;
  }
  id v21 = (id)[v20 outputImage];
  if (!v21)
  {
    CGColorSpaceRef v8 = 0;
LABEL_34:
    uint64_t v5 = 4294950745;
    goto LABEL_18;
  }
  CFAllocatorRef v22 = v21;
  if (CMPhotoPixelBufferHasCLAP(a3))
  {
    CGAffineTransformMakeScale(&v37, 1.0, -1.0);
    [v22 extent];
    CGAffineTransformTranslate(&v38, &v37, 0.0, -v23);
    v40.origin.x = PixelBufferCLAPAsRect;
    v40.origin.y = v13;
    v40.size.width = v15;
    v40.size.height = v17;
    CGRect v41 = CGRectApplyAffineTransform(v40, &v38);
    size_t v24 = objc_msgSend(v22, "imageByCroppingToRect:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
    [v24 extent];
    CGFloat v26 = -v25;
    [v24 extent];
    CGAffineTransformMakeTranslation(&v36, v26, -v27);
    CFAllocatorRef v22 = (void *)[v24 imageByApplyingTransform:&v36];
  }
  uint64_t v28 = CMPhotoSurfacePoolCreatePixelBuffer(@"SurfacePoolOneShot", 875704422, (unint64_t)v15, (unint64_t)v17, 1, 0, 0, 0, 0, 0, &v39);
  if (v28)
  {
LABEL_32:
    uint64_t v5 = v28;
    CGColorSpaceRef v8 = 0;
LABEL_18:
    goto LABEL_22;
  }
  CMPhotoAddDefault601709MatrixToBufferIfAllowed(v39, 1, 0);
  CGColorSpaceRef v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  if (!v8) {
    goto LABEL_34;
  }
  id v29 = objc_alloc(getCIRenderDestinationClass());
  id v30 = (id)[v29 initWithPixelBuffer:v39];
  if (!v30) {
    goto LABEL_34;
  }
  size_t v31 = v30;
  [v30 setAlphaMode:2];
  [v31 setColorSpace:v8];
  unint64_t v32 = (void *)[(objc_class *)getCIContextClass_0() context];
  if (!v32) {
    goto LABEL_34;
  }
  uint64_t v35 = 0;
  CGColorSpaceRef v33 = (void *)[v32 startTaskToRender:v22 toDestination:v31 error:&v35];
  uint64_t v5 = 4294950739;
  if (!v33) {
    goto LABEL_18;
  }
  if (v35) {
    goto LABEL_18;
  }
  [v33 waitUntilCompletedAndReturnError:&v35];
  if (v35) {
    goto LABEL_18;
  }
  uint64_t v5 = CMPhotoDNGCompressorSetPreviewImage(a1, v39, a4);
LABEL_22:
  if (v39) {
    CFRelease(v39);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

uint64_t CMPhotoDNGCompressorAddAuxiliaryImage(uint64_t a1, const void *a2, const void *a3, const void *a4, const void *a5)
{
  uint64_t result = 4294950746;
  if (a1 && a2 && a3 && a4)
  {
    CFDataRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (Mutable)
    {
      double v12 = Mutable;
      CFDictionarySetValue(Mutable, @"AuxPixelBuffer", a2);
      CFDictionarySetValue(v12, @"AuxMetadata", a3);
      CFDictionarySetValue(v12, @"AuxImageType", a4);
      if (a5)
      {
        CFDictionarySetValue(v12, @"AuxOptions", a5);
        FigCFDictionaryGetBooleanIfPresent();
      }
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 72), v12);
      CFRelease(v12);
      return 0;
    }
    else
    {
      return 4294950745;
    }
  }
  return result;
}

uint64_t CMPhotoDNGCompressorFinalizeAndCreateData(uint64_t a1, CFTypeRef *a2)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  CFTypeRef v30 = 0;
  uint64_t v2 = 4294950746;
  if (!a1) {
    return v2;
  }
  uint64_t v3 = a2;
  if (!a2) {
    return v2;
  }
  if (!*(void *)(a1 + 24)) {
    goto LABEL_60;
  }
  CFArrayRef v5 = *(const __CFArray **)(a1 + 80);
  if ((!v5 || CFArrayGetCount(v5) <= 0) && !*(void *)(a1 + 96))
  {
    CFDataRef v23 = *(const __CFData **)(a1 + 56);
    if (v23) {
      goto LABEL_46;
    }
    goto LABEL_48;
  }
  CFAllocatorRef v6 = *(const void **)(a1 + 56);
  if (!v6)
  {
LABEL_60:
    return FigSignalErrorAt();
  }
  uint64_t v7 = *(void *)(a1 + 96);
  CFArrayRef v8 = *(const __CFArray **)(a1 + 80);
  CFTypeRef cf = 0;
  CFDataRef theData = 0;
  CGAffineTransform v36 = @"BackingType";
  v37[0] = &unk_1F02E5198;
  CFDictionaryRef v9 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  if (v8)
  {
    CFIndex Count = CFArrayGetCount(v8);
    if (v7) {
      goto LABEL_13;
    }
  }
  else
  {
    CFIndex Count = 0;
    if (v7) {
      goto LABEL_13;
    }
  }
  if (!Count)
  {
    CGFloat v13 = 0;
    uint64_t v2 = 0;
    goto LABEL_56;
  }
LABEL_13:
  CFAllocatorRef v10 = CFGetAllocator(v6);
  uint64_t v11 = CMPhotoCompressionSessionCreate(v10, 0, &cf);
  if (v11) {
    goto LABEL_35;
  }
  if (v7)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = ___addAuxiliaryImagesToJPEGData_block_invoke;
    v33[3] = &__block_descriptor_40_e25_i16__0____CFDictionary__8l;
    v33[4] = v7;
    uint64_t v11 = CMPhotoCompressionSessionOpenExistingContainerForModification((uint64_t)cf, v9, v6, 0, (uint64_t)v33);
    if (!v11) {
      goto LABEL_16;
    }
LABEL_35:
    uint64_t v2 = v11;
    CGFloat v13 = 0;
    goto LABEL_56;
  }
  uint64_t v11 = CMPhotoCompressionSessionOpenExistingContainer((uint64_t)cf, v9, v6, 0);
  if (v11) {
    goto LABEL_35;
  }
LABEL_16:
  uint64_t v28 = v3;
  if (!Count)
  {
    CGFloat v13 = 0;
LABEL_37:
    uint64_t v2 = CMPhotoCompressionSessionCloseContainerAndCopyBacking((uint64_t)cf);
    if (v2) {
      goto LABEL_55;
    }
    CFDataRef v23 = theData;
    CFDataRef theData = 0;
    uint64_t v3 = v28;
    if (!v13) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  CFIndex v12 = 0;
  CGFloat v13 = 0;
  double v14 = (const void *)*MEMORY[0x1E4F1CFD0];
  while (1)
  {
    if (v13) {
      CFRelease(v13);
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, v12);
    double v16 = (opaqueCMSampleBuffer *)CFDictionaryGetValue(ValueAtIndex, @"AuxPixelBuffer");
    double v17 = CFDictionaryGetValue(ValueAtIndex, @"AuxMetadata");
    CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"AuxImageType");
    CFDictionaryRef v19 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, @"AuxOptions");
    if (v19) {
      MutableCopy = CFDictionaryCreateMutableCopy(v10, 0, v19);
    }
    else {
      MutableCopy = CFDictionaryCreateMutable(v10, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    CGFloat v13 = MutableCopy;
    if (!MutableCopy)
    {
      uint64_t v2 = 4294950745;
      goto LABEL_55;
    }
    CFDictionarySetValue(MutableCopy, @"PreferSoftwareCodec", v14);
    value = 0;
    unsigned int v31 = 0;
    v39.length = CFStringGetLength(@"kCGImageAuxiliaryDataType");
    v39.location = 0;
    if (CFStringCompareWithOptions(v18, @"kCGImageAuxiliaryDataType", v39, 0) == kCFCompareEqualTo) {
      break;
    }
    uint64_t CMPhotoAuxiliaryImageTypeAndFinalURNFromURN = CMPhotoGetCMPhotoAuxiliaryImageTypeAndFinalURNFromURN((uint64_t)v18, (__CFString **)&value);
    unsigned int v31 = CMPhotoAuxiliaryImageTypeAndFinalURNFromURN;
    if (!CMPhotoAuxiliaryImageTypeAndFinalURNFromURN) {
      goto LABEL_53;
    }
LABEL_28:
    if (CMPhotoAuxiliaryImageTypeAndFinalURNFromURN == 4 && value)
    {
      CFDictionarySetValue(v13, @"AuxiliaryImageCustomTypeURN", value);
      uint64_t CMPhotoAuxiliaryImageTypeAndFinalURNFromURN = v31;
    }
    uint64_t v22 = CMPhotoCompressionSessionAddAuxiliaryImage((uint64_t)cf, 0, CMPhotoAuxiliaryImageTypeAndFinalURNFromURN, (uint64_t)v17, v13, v16, 0);
    if (v22) {
      goto LABEL_54;
    }
    if (Count == ++v12) {
      goto LABEL_37;
    }
  }
  CMPhotoGetCMPhotoAuxiliaryImageTypeFromCGImageAuxiliaryDataType((uint64_t)v18, (__CFString **)&value, (int *)&v31);
  uint64_t CMPhotoAuxiliaryImageTypeAndFinalURNFromURN = v31;
  if (v31) {
    goto LABEL_28;
  }
LABEL_53:
  uint64_t v22 = FigSignalErrorAt();
LABEL_54:
  uint64_t v2 = v22;
LABEL_55:
  uint64_t v3 = v28;
LABEL_56:
  if (theData) {
    CFRelease(theData);
  }
  CFDataRef v23 = 0;
  if (v13) {
LABEL_39:
  }
    CFRelease(v13);
LABEL_40:
  if (cf) {
    CFRelease(cf);
  }
  if (v2)
  {
    CFTypeRef v26 = v30;
  }
  else
  {
    size_t v24 = *(const void **)(a1 + 56);
    if (v24) {
      CFRelease(v24);
    }
    *(void *)(a1 + 56) = v23;
    if (v23)
    {
LABEL_46:
      *(void *)(a1 + 64) = CFDataGetLength(v23);
      CFDataRef v25 = *(const __CFData **)(a1 + 56);
      goto LABEL_49;
    }
LABEL_48:
    CFDataRef v25 = 0;
LABEL_49:
    uint64_t v2 = _createDNGInternal(*(const __CFDictionary **)(a1 + 32), v25, *(const __CFDictionary **)(a1 + 48), 0, *(__CVBuffer **)(a1 + 24), *(const __CFArray **)(a1 + 72), *(_DWORD *)(a1 + 16) == 1, (void *)(a1 + 88), &v30);
    CFTypeRef v26 = v30;
    if (!v2)
    {
      *uint64_t v3 = v30;
      return v2;
    }
  }
  if (v26) {
    CFRelease(v26);
  }
  return v2;
}

uint64_t CMPhotoDNGCompressorFinalizeAndCreateSurface(uint64_t a1, uint64_t a2, uint64_t a3, IOSurfaceRef *a4, size_t *a5)
{
  IOSurfaceRef buffer = 0;
  CFDataRef theData = 0;
  uint64_t v5 = 4294950746;
  if (a1 && a4 && a5)
  {
    uint64_t Data = CMPhotoDNGCompressorFinalizeAndCreateData(a1, (CFTypeRef *)&theData);
    if (Data
      || (size_t Length = CFDataGetLength(theData),
          uint64_t Data = CMPhotoSurfacePoolCreateMemorySurface(a2, Length, 1, &buffer),
          Data)
      || (uint64_t Data = IOSurfaceLock(buffer, 0, 0), Data))
    {
      uint64_t v5 = Data;
    }
    else
    {
      BaseAddress = IOSurfaceGetBaseAddress(buffer);
      BytePtr = CFDataGetBytePtr(theData);
      memcpy(BaseAddress, BytePtr, Length);
      IOSurfaceUnlock(buffer, 0, 0);
      uint64_t v5 = 0;
      *a4 = buffer;
      IOSurfaceRef buffer = 0;
      *a5 = Length;
    }
  }
  if (theData) {
    CFRelease(theData);
  }
  if (buffer) {
    CFRelease(buffer);
  }
  return v5;
}

uint64_t CMPhotoDNGCompressorGetFinalizedSize(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t result = 4294950746;
  if (a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a3 = *(void *)(a1 + 64);
      *a4 = *(void *)(a1 + 88);
    }
  }
  return result;
}

uint64_t CMPhotoDNGUnpackToGetFileInformation(const __CFData *a1, const __CFDictionary *a2, CFDataRef *a3, void *a4, __CFDictionary **a5)
{
  return _dngUnpackInternal(a1, a2, a3, a4, 0, a5, 0, 0, 0);
}

uint64_t _dngUnpackInternal(const __CFData *a1, const __CFDictionary *a2, CFDataRef *a3, void *a4, _DWORD *a5, __CFDictionary **a6, CVPixelBufferRef *a7, void *a8, __CFArray **a9)
{
  uint64_t v305 = *MEMORY[0x1E4F143B8];
  CFDataRef v289 = 0;
  CFDataRef v290 = 0;
  bzero(v299, 0x400uLL);
  long long v288 = 0u;
  long long v286 = 0u;
  long long v287 = 0u;
  long long v285 = 0u;
  *(void *)v283 = 0;
  *(void *)v284 = 0;
  uint64_t v281 = 0;
  *(void *)v282 = 0;
  v279 = 0;
  v280 = 0;
  OSType pixelFormat = 0;
  size_t v277 = 0;
  char v276 = 0;
  int v275 = 0;
  __int16 v274 = 0;
  FigKTraceInit();
  CFIndex v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (!a1)
  {
    CFTypeRef cf = 0;
    value = 0;
    v271 = 0;
    CFDictionaryRef v236 = 0;
    CFTypeRef v237 = 0;
    MutableCopy = 0;
    CFMutableDictionaryRef Mutable = 0;
    CFMutableDictionaryRef v65 = 0;
    CFArrayRef v234 = 0;
    v235 = 0;
    theArraya = 0;
    int v71 = 0;
    v228 = 0;
    CVPixelBufferFromDNGuint64_t Data = 4294950746;
    goto LABEL_468;
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (a2)
  {
    FigCFDictionaryGetInt32IfPresent();
    CMPhotoCFDictionaryGetSizeIfPresent(a2, @"CompressedSurfaceSize", &v277);
    FigCFDictionaryGetBooleanIfPresent();
    FigCFDictionaryGetInt32IfPresent();
    FigCFDictionaryGetBooleanIfPresent();
    FigCFDictionaryGetBooleanIfPresent();
    size_t v13 = v277;
  }
  else
  {
    size_t v13 = 0;
  }
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v15 = CMPhotoDataCreateFromSource((const __CFAllocator *)*MEMORY[0x1E4F1CF80], a1, 0, v13, &v289, 0);
  if (v15 || (uint64_t v15 = _cmphotoDNGReaderInit((uint64_t)&v287, v289), v15))
  {
    CVPixelBufferFromDNGuint64_t Data = v15;
    CFTypeRef cf = 0;
    value = 0;
    a1 = 0;
    v271 = 0;
    CFDictionaryRef v236 = 0;
    CFTypeRef v237 = 0;
    MutableCopy = 0;
    CFMutableDictionaryRef Mutable = 0;
    CFMutableDictionaryRef v65 = 0;
    CFArrayRef v234 = 0;
    v235 = 0;
LABEL_536:
    theArraya = 0;
    int v71 = 0;
    goto LABEL_537;
  }
  double v16 = (const void **)MEMORY[0x1E4F2FD40];
  keys[0] = *(CFTypeRef *)MEMORY[0x1E4F2FF78];
  keys[1] = @"kCGImageSourceShouldUseRawDataForFullSize";
  uint64_t v17 = *MEMORY[0x1E4F1CFD0];
  *(void *)&long long values = @"com.adobe.raw-image";
  *((void *)&values + 1) = v17;
  CVPixelBufferFromDNGuint64_t Data = (uint64_t)CFDictionaryCreate(v14, keys, (const void **)&values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFTypeRef v237 = (CFTypeRef)CVPixelBufferFromDNGData;
  if (!CVPixelBufferFromDNGData)
  {
    v235 = 0;
    CFDictionaryRef v236 = 0;
    MutableCopy = 0;
    goto LABEL_534;
  }
  CFDictionaryRef v19 = CGImageSourceCreateWithData(v289, (CFDictionaryRef)CVPixelBufferFromDNGData);
  if (!v19)
  {
    v235 = 0;
    CFDictionaryRef v236 = 0;
    MutableCopy = 0;
    CVPixelBufferFromDNGuint64_t Data = 4294950743;
    goto LABEL_534;
  }
  v235 = v19;
  CFDictionaryRef v20 = CGImageSourceCopyPropertiesAtIndex(v19, 0, (CFDictionaryRef)CVPixelBufferFromDNGData);
  MutableCopy = (__CFDictionary *)FigCFDictionaryCreateMutableCopy();
  CFDictionaryRef v236 = v20;
  if (!MutableCopy || (CFDictionaryGetValue(v20, *v16), (value = (void *)FigCFDictionaryCreateMutableCopy()) == 0))
  {
    CVPixelBufferFromDNGuint64_t Data = 4294950745;
LABEL_534:
    CFTypeRef cf = 0;
    value = 0;
    a1 = 0;
    v271 = 0;
    CFMutableDictionaryRef Mutable = 0;
    CFMutableDictionaryRef v65 = 0;
LABEL_535:
    CFArrayRef v234 = 0;
    goto LABEL_536;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v14, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable || (CFMutableDictionaryRef v23 = CFDictionaryCreateMutable(v14, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])) == 0)
  {
    CFTypeRef cf = 0;
    a1 = 0;
    v271 = 0;
    CFMutableDictionaryRef v65 = 0;
    CFArrayRef v234 = 0;
    theArraya = 0;
    int v71 = 0;
    v228 = 0;
    CVPixelBufferFromDNGuint64_t Data = 4294950745;
    goto LABEL_468;
  }
  size_t v24 = v23;
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F2F630], Mutable);
  CFDictionarySetValue(MutableCopy, *v16, value);
  keys[0] = 0;
  CFStringRef v25 = _copyStringTag((uint64_t)&v287, 270);
  v262 = v24;
  v239 = a4;
  BOOL v27 = v25
     && (CFDictionarySetValue((CFMutableDictionaryRef)value, (const void *)*MEMORY[0x1E4F2FD58], v25),
         (CStringPtrAndBufferToFree = (const char *)FigCFStringGetCStringPtrAndBufferToFree()) != 0)
     && strcmp(CStringPtrAndBufferToFree, "Internal") == 0;
  _copyStringTagToDict((uint64_t)&v287, 271, (const void *)*MEMORY[0x1E4F2FD60], (__CFDictionary *)value);
  _copyStringTagToDict((uint64_t)&v287, 272, (const void *)*MEMORY[0x1E4F2FD68], (__CFDictionary *)value);
  _copyIntegerTagToDict((unint64_t)&v287, 274);
  _copyStringTagToDict((uint64_t)&v287, 305, (const void *)*MEMORY[0x1E4F2FD88], (__CFDictionary *)value);
  _copyStringTagToDict((uint64_t)&v287, 306, (const void *)*MEMORY[0x1E4F2FD38], (__CFDictionary *)value);
  _copyStringTagToDict((uint64_t)&v287, 315, (const void *)*MEMORY[0x1E4F2FD20], (__CFDictionary *)value);
  _copyStringTagToDict((uint64_t)&v287, 33432, (const void *)*MEMORY[0x1E4F2FD30], (__CFDictionary *)value);
  _copyVersionToDictAsString((uint64_t)&v287, 50706, (const void *)*MEMORY[0x1E4F2F688], Mutable);
  _copyVersionToDictAsString((uint64_t)&v287, 50707, (const void *)*MEMORY[0x1E4F2F5B8], Mutable);
  _copyStringTagToDict((uint64_t)&v287, 50708, (const void *)*MEMORY[0x1E4F2F680], Mutable);
  FloatArrayFromRationals = _createFloatArrayFromRationals((uint64_t)&v287, 50721, 9);
  id v29 = Mutable;
  CFTypeRef v30 = _createFloatArrayFromRationals((uint64_t)&v287, 50722, 9);
  unsigned int v31 = _createFloatArrayFromRationals((uint64_t)&v287, 50723, 9);
  unint64_t v32 = _createFloatArrayFromRationals((uint64_t)&v287, 50724, 9);
  if (FloatArrayFromRationals) {
    CFDictionarySetValue(v29, (const void *)*MEMORY[0x1E4F2F608], FloatArrayFromRationals);
  }
  theDict = v29;
  if (v30) {
    CFDictionarySetValue(v29, (const void *)*MEMORY[0x1E4F2F610], v30);
  }
  if (v31) {
    CFDictionarySetValue(v29, (const void *)*MEMORY[0x1E4F2F5F0], v31);
  }
  if (v32) {
    CFDictionarySetValue(v29, (const void *)*MEMORY[0x1E4F2F5F8], v32);
  }
  if (v31) {
    CFRelease(v31);
  }
  if (v32) {
    CFRelease(v32);
  }
  CFAllocatorRef allocator = v14;
  if (FloatArrayFromRationals) {
    CFRelease(FloatArrayFromRationals);
  }
  v246 = MutableCopy;
  if (v30) {
    CFRelease(v30);
  }
  if (WORD4(v288))
  {
    int v33 = 0;
    uint64_t v34 = (unsigned __int16 *)v288;
    while (1)
    {
      int v35 = CMPhotoDNGRead16(v34, BYTE10(v288));
      if (v35 == 50778) {
        break;
      }
      v34 += 6;
      if (++v33 >= WORD4(v288))
      {
        unsigned int v36 = 0;
        LODWORD(v37) = 0;
        __int16 v38 = 0;
        if (!WORD4(v288)) {
          goto LABEL_61;
        }
        goto LABEL_42;
      }
    }
    unint64_t Tag = _readTag((uint64_t)v34, BYTE10(v288));
    __int16 v38 = v40;
    unsigned int v36 = WORD1(Tag);
    unint64_t v37 = HIDWORD(Tag);
    if (!WORD4(v288)) {
      goto LABEL_61;
    }
LABEL_42:
    int v41 = 0;
    double v42 = (unsigned __int16 *)v288;
    while (CMPhotoDNGRead16(v42, BYTE10(v288)) != 50779)
    {
      v42 += 6;
      if (++v41 >= WORD4(v288)) {
        goto LABEL_61;
      }
    }
    uint64_t v43 = _readTag((uint64_t)v42, BYTE10(v288));
    if (v35 == 50778 && v37 == 1)
    {
      BOOL v45 = (v43 & 0xFFFFFFFF00000000) != 0x100000000 || v36 > 0xD;
      if (!v45 && (v36 == 8 || v36 == 3) && WORD1(v43) <= 0xDu && (WORD1(v43) == 8 || WORD1(v43) == 3))
      {
        LOWORD(values) = v38;
        LOWORD(valuePtr) = v44;
        CFNumberRef v46 = CFNumberCreate(v14, kCFNumberShortType, &values);
        CFNumberRef v47 = CFNumberCreate(v14, kCFNumberShortType, &valuePtr);
        CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F2F5E0], v46);
        CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F2F5E8], v47);
        if (v46) {
          CFRelease(v46);
        }
        if (v47) {
          CFRelease(v47);
        }
      }
    }
  }
LABEL_61:
  CFAllocatorRef v48 = _createFloatArrayFromRationals((uint64_t)&v287, 50728, 3);
  if (v48)
  {
    v49 = v48;
    uint64_t v50 = (const void *)*MEMORY[0x1E4F2F5A0];
    CFIndex v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    MutableCopy = v246;
    v51 = theDict;
  }
  else
  {
    int v52 = _createFloatArrayFromRationals((uint64_t)&v287, 50729, 2);
    CFIndex v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    MutableCopy = v246;
    v51 = theDict;
    if (!v52) {
      goto LABEL_66;
    }
    v49 = v52;
    uint64_t v50 = (const void *)*MEMORY[0x1E4F2F5B0];
  }
  CFDictionarySetValue(v51, v50, v49);
  CFRelease(v49);
LABEL_66:
  _copyRationalTagToDict((uint64_t)&v287, 50730, (const void *)*MEMORY[0x1E4F2F5C0], v51);
  _copyRationalTagToDict((uint64_t)&v287, 50731, (const void *)*MEMORY[0x1E4F2F5C8], v51);
  _copyRationalTagToDict((uint64_t)&v287, 50732, (const void *)*MEMORY[0x1E4F2F5D0], v51);
  _copyDNGDataTagToDict((uint64_t)&v287, 50740, (const void *)*MEMORY[0x1E4F2F658], v51);
  _copyStringTagToDict((uint64_t)&v287, 50931, (const void *)*MEMORY[0x1E4F2F600], v51);
  _copyStringTagToDict((uint64_t)&v287, 50932, (const void *)*MEMORY[0x1E4F2F660], v51);
  if (WORD4(v288))
  {
    int v53 = 0;
    uint64_t v54 = (const void *)*MEMORY[0x1E4F2F678];
    uint64_t v55 = (unsigned __int16 *)v288;
    while (CMPhotoDNGRead16(v55, BYTE10(v288)) != 50940)
    {
      v55 += 6;
      if (++v53 >= WORD4(v288)) {
        goto LABEL_81;
      }
    }
    unint64_t v56 = _readTag((uint64_t)v55, BYTE10(v288));
    CFIndex v58 = HIDWORD(v56);
    if (HIDWORD(v56) * tiffDataTypeToSize[WORD1(v56)] <= 4) {
      v59 = (unsigned int *)(v55 + 4);
    }
    else {
      v59 = (unsigned int *)(v287 + v57);
    }
    if ((v56 & 0xFFFF0000) == 0xB0000)
    {
      CFMutableArrayRef v60 = CFArrayCreateMutable(v14, v58, MEMORY[0x1E4F1D510]);
      if (v60)
      {
        int v61 = v60;
        if (v58)
        {
          while (1)
          {
            float v62 = CMPhotoDNGReadFloat(v59, BYTE10(v288));
            if (CMPhotoCFArrayAppendFloat(v61, v62)) {
              break;
            }
            ++v59;
            LODWORD(v58) = v58 - 1;
            if (!v58) {
              goto LABEL_79;
            }
          }
        }
        else
        {
LABEL_79:
          CFDictionarySetValue(theDict, v54, v61);
        }
        CFRelease(v61);
      }
    }
  }
LABEL_81:
  CFMutableDictionaryRef Mutable = theDict;
  _copyIntegerTagToDict((unint64_t)&v287, 51110);
  _copyStringTagToDict((uint64_t)&v287, 50936, (const void *)*MEMORY[0x1E4F2F670], theDict);
  _copyRationalTagToDict((uint64_t)&v287, 50935, (const void *)*MEMORY[0x1E4F2F650], theDict);
  _copyDoublesToDictAsArray((uint64_t)&v287, (const void *)*MEMORY[0x1E4F2F648], theDict);
  if (v25) {
    CFRelease(v25);
  }
  free((void *)keys[0]);
  if (v27) {
    int v63 = 4;
  }
  else {
    int v63 = 2;
  }
  unsigned int v249 = v63;
  int v273 = 0;
  int v64 = _readSubFileType((uint64_t)&v287, &v273);
  if (v64 && v273 == 1)
  {
    CFMutableDictionaryRef v65 = v262;
    if (v275)
    {
      int v66 = 0;
LABEL_96:
      int v67 = 1;
      goto LABEL_97;
    }
    uint64_t v70 = _readPreviewTags(&v287, &v290);
    int v71 = 0;
    if (!v70)
    {
      int v66 = 0;
      goto LABEL_96;
    }
    CVPixelBufferFromDNGuint64_t Data = v70;
    CFTypeRef cf = 0;
    a1 = 0;
    v271 = 0;
    CFArrayRef v234 = 0;
    theArraya = 0;
LABEL_537:
    v228 = 0;
    goto LABEL_468;
  }
  int v67 = 0;
  CFMutableDictionaryRef v65 = v262;
  int v66 = 0;
  if (v64 && !v273)
  {
    int v68 = CMPhotoPixelFormatContainsAlpha(pixelFormat);
    uint64_t v69 = _readRawImageTags((unint64_t)&v287, v262, v249, v68, &v284[1], v284, &v283[1], v283, (int *)&v282[1], v282, (_DWORD *)&v281 + 1, &v281, &v280, &v279);
    if (!v69)
    {
      int v67 = 0;
      long long v285 = v287;
      long long v286 = v288;
      int v66 = 1;
      goto LABEL_97;
    }
    CVPixelBufferFromDNGuint64_t Data = v69;
    CFTypeRef cf = 0;
    a1 = 0;
    v271 = 0;
    goto LABEL_535;
  }
LABEL_97:
  int v272 = 0;
  unsigned int TagDataNvals = _getTagDataNvals((uint64_t)&v287, 330, &v272);
  int v73 = v272;
  if (v272 >= 1)
  {
    unsigned int v74 = TagDataNvals;
    uint64_t v75 = 0;
    int v241 = 0;
    uint64_t v76 = TagDataNvals;
    int v77 = v66;
    int v261 = 0;
    while (1)
    {
      unsigned int v78 = v74;
      if (v73 != 1) {
        unsigned int v78 = CMPhotoDNGRead32((unsigned int *)(v287 + v76 + (4 * v75)), BYTE10(v288));
      }
      long long values = 0u;
      long long v298 = 0u;
      uint64_t v79 = _cmphotoDNGReaderInit((uint64_t)&values, v289);
      if (v79) {
        goto LABEL_518;
      }
      uint64_t v79 = _cmphotoDNGReaderOpenIFD((uint64_t)&values, v78);
      if (v79) {
        goto LABEL_518;
      }
      int v80 = _readSubFileType((uint64_t)&values, &v273);
      if (v80 && v273 == 1)
      {
        if (v67 == v275)
        {
          uint64_t v79 = _readPreviewTags(&values, &v290);
          if (v79) {
            goto LABEL_518;
          }
        }
        ++v67;
        goto LABEL_189;
      }
      if (v80 && !v273)
      {
        if (v77) {
          goto LABEL_517;
        }
        CFRelease(v65);
        CFMutableDictionaryRef v65 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFIndex v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
        if (!v65)
        {
LABEL_513:
          CVPixelBufferFromDNGuint64_t Data = 4294950745;
          goto LABEL_520;
        }
        int v81 = CMPhotoPixelFormatContainsAlpha(pixelFormat);
        uint64_t v82 = _readRawImageTags((unint64_t)&values, v65, v249, v81, &v284[1], v284, &v283[1], v283, (int *)&v282[1], v282, (_DWORD *)&v281 + 1, &v281, &v280, &v279);
        if (v82) {
          goto LABEL_514;
        }
        long long v285 = values;
        long long v286 = v298;
LABEL_114:
        int v77 = 1;
        goto LABEL_189;
      }
      if (!v80 || v273 != 8)
      {
        if (v80 && v273 == 65540)
        {
          if (v261 >= 16)
          {
LABEL_517:
            uint64_t v79 = FigSignalErrorAt();
LABEL_518:
            CVPixelBufferFromDNGuint64_t Data = v79;
LABEL_519:
            CFIndex v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_520:
            CFTypeRef cf = 0;
            a1 = 0;
            v271 = 0;
            CFArrayRef v234 = 0;
            theArraya = 0;
            v228 = 0;
            MutableCopy = v246;
LABEL_521:
            CFMutableDictionaryRef Mutable = theDict;
LABEL_522:
            int v71 = v261;
            goto LABEL_468;
          }
          if (_getTagDataNvals((uint64_t)&values, 254, keys) == 65540
            && (_getTagDataNvals((uint64_t)&values, 259, keys) == 7
             || _getTagDataNvals((uint64_t)&values, 259, keys) == 34892
             || _getTagDataNvals((uint64_t)&values, 259, keys) == 52546)
            && _getTagDataNvals((uint64_t)&values, 277, keys) == 1
            && _getTagDataNvals((uint64_t)&values, 258, keys) == 8)
          {
            v89 = v65;
            if (!WORD4(v298))
            {
LABEL_148:
              CFDataRef v92 = 0;
              goto LABEL_180;
            }
            int v90 = 0;
            CFIndex v91 = (unsigned __int16 *)v298;
            while (CMPhotoDNGRead16(v91, BYTE10(v298)) != 700)
            {
              v91 += 6;
              if (++v90 >= WORD4(v298)) {
                goto LABEL_148;
              }
            }
            unint64_t v104 = _readTag((uint64_t)v91, BYTE10(v298));
            if ((v104 & 0xFFFF0000) == 0x10000)
            {
              if (tiffDataTypeToSize[WORD1(v104)] * HIDWORD(v104) <= 4) {
                int v106 = (const UInt8 *)(v91 + 4);
              }
              else {
                int v106 = (const UInt8 *)(values + v105);
              }
              CFDataRef v92 = CFDataCreate(allocator, v106, HIDWORD(v104));
              if (!v92)
              {
                CVPixelBufferFromDNGuint64_t Data = 4294950745;
                CFIndex v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
                goto LABEL_520;
              }
LABEL_180:
              CFStringRef v107 = _copyStringTag((uint64_t)&values, 52526);
              if (!v107) {
                CFStringRef v107 = _copyStringTag((uint64_t)&values, 51182);
              }
              LODWORD(valuePtr) = 0;
              unsigned int v108 = _getTagDataNvals((uint64_t)&values, 273, &valuePtr);
              if (valuePtr == 1
                && (unsigned int v109 = v108) != 0
                && (unsigned int v110 = _getTagDataNvals((uint64_t)&values, 279, keys), v110 >= 5)
                && v110 + v109 <= DWORD2(values))
              {
                CFDataRef v111 = CFDataCreate(allocator, (const UInt8 *)(values + v109), v110);
                if (v111)
                {
                  int v112 = v261;
                  v113 = &v299[64 * (uint64_t)v261];
                  *(void *)v113 = v111;
                  *((void *)v113 + 1) = v92;
                  *((void *)v113 + 2) = v107;
                  *((void *)v113 + 3) = 0x400000000;
                  *((_OWORD *)v113 + 2) = 0u;
                  *((_OWORD *)v113 + 3) = 0u;
                  CFMutableDictionaryRef v65 = v89;
LABEL_188:
                  int v261 = v112 + 1;
                  goto LABEL_189;
                }
                CVPixelBufferFromDNGuint64_t Data = 4294950745;
              }
              else
              {
                CVPixelBufferFromDNGuint64_t Data = FigSignalErrorAt();
              }
              if (v92) {
                CFRelease(v92);
              }
              if (v107) {
                CFRelease(v107);
              }
            }
            else
            {
              CVPixelBufferFromDNGuint64_t Data = FigSignalErrorAt();
            }
            CFMutableDictionaryRef v65 = v89;
          }
          else
          {
            CVPixelBufferFromDNGuint64_t Data = FigSignalErrorAt();
          }
          int v112 = v261;
          if (CVPixelBufferFromDNGData) {
            goto LABEL_519;
          }
          goto LABEL_188;
        }
        if (!v80 || v273 != 16 || !(_BYTE)v274) {
          goto LABEL_189;
        }
        CFRelease(v65);
        CFMutableDictionaryRef v65 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFIndex v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
        if (!v65) {
          goto LABEL_513;
        }
        int v93 = CMPhotoPixelFormatContainsAlpha(pixelFormat);
        uint64_t v82 = _readRawImageTags((unint64_t)&values, v65, v249, v93, &v284[1], v284, &v283[1], v283, (int *)&v282[1], v282, (_DWORD *)&v281 + 1, &v281, &v280, &v279);
        if (v82)
        {
LABEL_514:
          CVPixelBufferFromDNGuint64_t Data = v82;
          goto LABEL_520;
        }
        long long v285 = values;
        long long v286 = v298;
        int v241 = 1;
        goto LABEL_114;
      }
      if (v261 >= 16) {
        goto LABEL_517;
      }
      long long v304 = 0u;
      long long v303 = 0u;
      long long v302 = 0u;
      *(_OWORD *)keys = 0u;
      int v83 = _getTagDataNvals((uint64_t)&values, 254, &valuePtr);
      int v84 = _getTagDataNvals((uint64_t)&values, 259, &valuePtr);
      if (v83 != 8 || v84 != 7 && v84 != 52546) {
        goto LABEL_168;
      }
      if (_getTagDataNvals((uint64_t)&values, 277, &valuePtr) != 1) {
        goto LABEL_168;
      }
      int v85 = _getTagDataNvals((uint64_t)&values, 51177, &valuePtr);
      if ((v85 - 3) <= 0xFFFFFFFD) {
        goto LABEL_168;
      }
      int v86 = v85 == 1 ? 2 : 1;
      HIDWORD(v302) = v86;
      if (_getTagDataNvals((uint64_t)&values, 51180, &valuePtr) != 1
        || _getTagDataNvals((uint64_t)&values, 51181, &valuePtr) != 1
        || !_getTagRational((uint64_t)&values, 51178, (uint64_t *)((char *)&v303 + 12))
        || !_getTagRational((uint64_t)&values, 51179, (uint64_t *)((char *)&v304 + 4)))
      {
        goto LABEL_168;
      }
      if (!WORD4(v298)) {
        break;
      }
      int v87 = 0;
      CFDataRef v88 = (unsigned __int16 *)v298;
      while (CMPhotoDNGRead16(v88, BYTE10(v298)) != 700)
      {
        v88 += 6;
        if (++v87 >= WORD4(v298)) {
          goto LABEL_160;
        }
      }
      unint64_t v94 = _readTag((uint64_t)v88, BYTE10(v298));
      if ((v94 & 0xFFFF0000) != 0x10000) {
        goto LABEL_168;
      }
      v96 = tiffDataTypeToSize[WORD1(v94)] * HIDWORD(v94) <= 4
          ? (const UInt8 *)(v88 + 4)
          : (const UInt8 *)(values + v95);
      keys[1] = CFDataCreate(allocator, v96, HIDWORD(v94));
      if (keys[1]) {
        break;
      }
      CVPixelBufferFromDNGuint64_t Data = 4294950745;
LABEL_171:
      if (keys[0]) {
        CFRelease(keys[0]);
      }
      if (CVPixelBufferFromDNGData) {
        goto LABEL_519;
      }
      ++v261;
LABEL_189:
      ++v75;
      int v73 = v272;
      if (v75 >= v272) {
        goto LABEL_205;
      }
    }
LABEL_160:
    LODWORD(v295) = 0;
    unsigned int v97 = _getTagDataNvals((uint64_t)&values, 273, &v295);
    BOOL v98 = v295 != 1 || v97 == 0;
    if (v98
      || (unsigned int v99 = v97, v100 = _getTagDataNvals((uint64_t)&values, 279, &valuePtr), v100 <= 4)
      || v100 + v99 > DWORD2(values))
    {
LABEL_168:
      CVPixelBufferFromDNGuint64_t Data = FigSignalErrorAt();
    }
    else
    {
      keys[0] = CFDataCreate(allocator, (const UInt8 *)(values + v99), v100);
      if (keys[0])
      {
        CVPixelBufferFromDNGuint64_t Data = 0;
        v101 = &v299[64 * (uint64_t)v261];
        long long v102 = v302;
        _OWORD *v101 = *(_OWORD *)keys;
        v101[1] = v102;
        long long v103 = v304;
        v101[2] = v303;
        v101[3] = v103;
        keys[1] = 0;
        keys[0] = 0;
      }
      else
      {
        CVPixelBufferFromDNGuint64_t Data = 4294950745;
      }
    }
    if (keys[1]) {
      CFRelease(keys[1]);
    }
    goto LABEL_171;
  }
  int v261 = 0;
  int v241 = 0;
LABEL_205:
  unsigned int v114 = (const void *)[(__CFDictionary *)v65 allKeys];
  if (v114) {
    CFArrayRef v115 = (const __CFArray *)CFRetain(v114);
  }
  else {
    CFArrayRef v115 = 0;
  }
  CFIndex v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  MutableCopy = v246;
  CFMutableDictionaryRef Mutable = theDict;
  CFAllocatorRef v116 = allocator;
  CFIndex v117 = 0;
  if (v115) {
    goto LABEL_211;
  }
LABEL_212:
  for (CFIndex i = 0; v117 < i; CFIndex i = CFArrayGetCount(v115))
  {
    CFDictionaryRef ValueAtIndex = (const void *)FigCFArrayGetValueAtIndex();
    FigCFArrayGetValueAtIndex();
    v119 = (const void *)FigCFDictionaryGetValue();
    CFDictionaryAddValue(theDict, ValueAtIndex, v119);
    ++v117;
    if (!v115) {
      goto LABEL_212;
    }
LABEL_211:
    ;
  }
  v257 = v280;
  CFArrayRef v234 = v115;
  if (!v280 || (v256 = v279) == 0)
  {
    CVPixelBufferFromDNGuint64_t Data = FigSignalErrorAt();
    CFTypeRef cf = 0;
    goto LABEL_526;
  }
  v263 = v65;
  if (!a7)
  {
    CFTypeRef cf = 0;
    goto LABEL_290;
  }
  if (*v12 == 1)
  {
    kdebug_trace();
    v256 = v279;
    v257 = v280;
  }
  int64_t v121 = v284[1];
  int64_t v231 = v284[0];
  unint64_t v122 = v283[1];
  unint64_t v251 = v283[0];
  int v123 = v282[1];
  keys[0] = &v285;
  int v255 = v281;
  if (v281 == 32803)
  {
    if (HIDWORD(v281) != 1 && HIDWORD(v281) != 7)
    {
      CFTypeRef cf = 0;
      CVPixelBufferFromDNGuint64_t Data = 4294950744;
      goto LABEL_287;
    }
  }
  else
  {
    CFTypeRef cf = 0;
    CVPixelBufferFromDNGuint64_t Data = 4294950744;
    if (SHIDWORD(v281) > 34891)
    {
      if (HIDWORD(v281) != 52546 && HIDWORD(v281) != 34892) {
        goto LABEL_287;
      }
    }
    else if (HIDWORD(v281) != 1 && HIDWORD(v281) != 7)
    {
      goto LABEL_287;
    }
  }
  if (!v282[1])
  {
    CFTypeRef cf = 0;
    CVPixelBufferFromDNGuint64_t Data = 4294950746;
    goto LABEL_287;
  }
  OSType v230 = v282[0];
  int v260 = HIDWORD(v281);
  if (v281 == 32803)
  {
    uint64_t v124 = 1;
  }
  else
  {
    int v125 = CMPhotoPixelFormatContainsAlpha(v282[1]);
    uint64_t v124 = 3;
    if (v125) {
      uint64_t v124 = 4;
    }
  }
  uint64_t v266 = v124;
  unsigned int v252 = v123;
  uint64_t v229 = CMPhotoAlignValue(v121, v122);
  uint64_t v126 = CMPhotoGetBytesPerPixelForPixelFormat(v123) * v229;
  unint64_t v127 = v251;
  uint64_t v248 = v126;
  CFIndex v128 = CMPhotoAlignValue(v231, v251) * v126;
  unint64_t v253 = v122;
  uint64_t v129 = CFDataCreateMutable(allocator, 0);
  CFIndex v247 = v128;
  CFDataSetLength(v129, v128);
  CFTypeRef cf = v129;
  MutableBytePtr = CFDataGetMutableBytePtr(v129);
  if ((int)v231 < 1)
  {
LABEL_282:
    CVPixelBufferFromDNGuint64_t Data = 0;
    MutableCopy = v246;
    goto LABEL_287;
  }
  CFMutableArrayRef theArray = 0;
  signed int v130 = 0;
  int64_t v270 = v121;
  uint64_t v131 = v253;
  uint64_t v132 = v266 * v253;
  if (v266 * v253 <= 1) {
    uint64_t v132 = 1;
  }
  uint64_t v265 = v132;
  signed int v133 = v230;
  while ((int)v121 < 1)
  {
LABEL_281:
    CFMutableArrayRef theArray = (CFMutableArrayRef)((char *)theArray + v127);
    if ((uint64_t)theArray >= v231) {
      goto LABEL_282;
    }
  }
  int64_t v134 = 0;
  v242 = &MutableBytePtr[2 * (void)theArray * v121];
  uint64_t v135 = v130;
  if (v130 <= v133) {
    signed int v130 = v133;
  }
  uint64_t v254 = v130;
  while (1)
  {
    unsigned int v136 = CMPhotoDNGRead32((unsigned int *)&v257[2 * v135], *((unsigned __int8 *)keys[0] + 26));
    unsigned int v137 = CMPhotoDNGRead32((unsigned int *)&v256[2 * v135], *((unsigned __int8 *)keys[0] + 26));
    if (v135 == v254) {
      break;
    }
    unsigned int v138 = v137;
    if (v137 + v136 > *((_DWORD *)keys[0] + 2)) {
      break;
    }
    if (v255 != 32803)
    {
      if (v260 == 1)
      {
        if (*v12 == 1) {
          kdebug_trace();
        }
        if ((int)v251 >= 1)
        {
          uint64_t v147 = 0;
          uint64_t v148 = v138 / v251;
          do
          {
            if (v131)
            {
              uint64_t v149 = (unsigned __int16 *)(*(void *)keys[0] + v136 + v147 * v148);
              uint64_t v150 = v265;
              uint64_t v151 = &MutableBytePtr[2 * (v134 + ((void)theArray + v147) * v270) * v266];
              do
              {
                *(_WORD *)uint64_t v151 = CMPhotoDNGRead16(v149, *((unsigned __int8 *)keys[0] + 26));
                v151 += 2;
                ++v149;
                --v150;
              }
              while (v150);
            }
            ++v147;
          }
          while (v147 != v251);
        }
        goto LABEL_277;
      }
      uint64_t BytesPerPixelForPixelFormat = CMPhotoGetBytesPerPixelForPixelFormat(v252);
      uint64_t v141 = *(void *)keys[0];
      if (*v12 == 1) {
        kdebug_trace();
      }
      CVPixelBufferFromDNGuint64_t Data = CMPhotoDNGDecompressLinearRawTile(v141 + v136, v138, (uint64_t)&MutableBytePtr[BytesPerPixelForPixelFormat* (v134 + (void)theArray * v229)], v247 - BytesPerPixelForPixelFormat * (v134 + (void)theArray * v229), v248, v252, v131, v251, v260 == 52546);
      if (*v12 == 1) {
        kdebug_trace();
      }
      int64_t v121 = v270;
      goto LABEL_258;
    }
    if (v260 == 1)
    {
      if (*v12 == 1) {
        kdebug_trace();
      }
      if ((int)v251 >= 1)
      {
        uint64_t v142 = 0;
        uint64_t v143 = v138 / v251;
        do
        {
          if (v131)
          {
            v144 = (unsigned __int16 *)(*(void *)keys[0] + v136 + v142 * v143);
            uint64_t v145 = v265;
            char v146 = &MutableBytePtr[2 * (v134 + ((void)theArray + v142) * v270) * v266];
            do
            {
              *(_WORD *)char v146 = CMPhotoDNGRead16(v144, *((unsigned __int8 *)keys[0] + 26));
              v146 += 2;
              ++v144;
              --v145;
            }
            while (v145);
          }
          ++v142;
        }
        while (v142 != v251);
      }
LABEL_277:
      CFIndex v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      CFMutableDictionaryRef v65 = v263;
      int64_t v121 = v270;
      if (*MEMORY[0x1E4F1EBA8] == 1) {
        kdebug_trace();
      }
      goto LABEL_279;
    }
    if (v260 == 7)
    {
      uint64_t v139 = *(void *)keys[0];
      if (*v12 == 1) {
        kdebug_trace();
      }
      CVPixelBufferFromDNGuint64_t Data = CMPhotoDNGDecompressRawTile(v139 + v136, v138, v131, v251, v121, (uint64_t)&v242[2 * v134], v249);
      if (*v12 == 1) {
        kdebug_trace();
      }
LABEL_258:
      if (CVPixelBufferFromDNGData) {
        goto LABEL_284;
      }
    }
LABEL_279:
    v134 += v131;
    ++v135;
    if (v134 >= v121)
    {
      signed int v130 = v135;
      CFMutableDictionaryRef Mutable = theDict;
      unint64_t v127 = v251;
      CFAllocatorRef v116 = allocator;
      signed int v133 = v230;
      goto LABEL_281;
    }
  }
  CVPixelBufferFromDNGuint64_t Data = 4294950743;
LABEL_284:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;
  MutableCopy = v246;
  CFMutableDictionaryRef Mutable = theDict;
  CFAllocatorRef v116 = allocator;
LABEL_287:
  if (*v12 == 1) {
    kdebug_trace();
  }
  if (CVPixelBufferFromDNGData)
  {
LABEL_526:
    a1 = 0;
    v271 = 0;
    theArraya = 0;
    v228 = 0;
    goto LABEL_522;
  }
LABEL_290:
  if (WORD4(v288))
  {
    int v152 = 0;
    char v153 = (unsigned __int16 *)v288;
    while (CMPhotoDNGRead16(v153, BYTE10(v288)) != 50727)
    {
      v153 += 6;
      if (++v152 >= WORD4(v288)) {
        goto LABEL_310;
      }
    }
    unint64_t v154 = _readTag((uint64_t)v153, BYTE10(v288));
    unint64_t v155 = HIDWORD(v154);
    if ((v154 & 0xFFFF0000) != 0x50000 || v155 != 3)
    {
      a1 = 0;
      v271 = 0;
      theArraya = 0;
      v228 = 0;
      CVPixelBufferFromDNGuint64_t Data = 4294950739;
      goto LABEL_521;
    }
    __memmove_chk();
    if (BYTE10(v286) && v155)
    {
      int v157 = (int8x8_t *)keys;
      unint64_t v158 = v155;
      do
      {
        *int v157 = vrev32_s8(*v157);
        ++v157;
        --v158;
      }
      while (v158);
    }
    v159 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v155];
    for (uint64_t j = 0; j != 3; ++j)
    {
      CFTypeRef v161 = keys[j];
      if (HIDWORD(v161)) {
        double v162 = (double)v161 / (double)HIDWORD(v161);
      }
      else {
        double v162 = 0.0;
      }
      objc_msgSend(v159, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", v162));
    }
    [(__CFDictionary *)theDict setValue:v159 forKey:*MEMORY[0x1E4F2F598]];
  }
LABEL_310:
  if (!WORD4(v286))
  {
LABEL_314:
    v228 = 0;
    CFMutableDictionaryRef Mutable = theDict;
    goto LABEL_354;
  }
  int v163 = 0;
  v164 = (unsigned __int16 *)v286;
  while (CMPhotoDNGRead16(v164, BYTE10(v286)) != 50712)
  {
    v164 += 6;
    if (++v163 >= WORD4(v286)) {
      goto LABEL_314;
    }
  }
  unint64_t v165 = _readTag((uint64_t)v164, BYTE10(v286));
  unint64_t v167 = HIDWORD(v165);
  if (HIDWORD(v165) * tiffDataTypeToSize[WORD1(v165)] <= 4) {
    v168 = v164 + 4;
  }
  else {
    v168 = (const void *)(v285 + v166);
  }
  CFMutableDictionaryRef Mutable = theDict;
  if (v282[1] != 1647589490 && v282[1] != 1815491698 || (v165 & 0xFFFF0000) != 0x30000)
  {
    a1 = 0;
    v271 = 0;
    theArraya = 0;
    v228 = 0;
    CVPixelBufferFromDNGuint64_t Data = 4294950739;
    goto LABEL_522;
  }
  v169 = (unsigned __int16 *)malloc_type_malloc(2 * v167, 0x1000040BDFB0063uLL);
  v228 = v169;
  if (!v169)
  {
    a1 = 0;
    v271 = 0;
    theArraya = 0;
    CVPixelBufferFromDNGuint64_t Data = 4294950745;
    goto LABEL_521;
  }
  memmove(v169, v168, 2 * v167);
  if (BYTE10(v286) && v167)
  {
    if (v167 <= 1) {
      uint64_t v170 = 1;
    }
    else {
      uint64_t v170 = v167;
    }
    v171 = v228;
    do
    {
      _WORD *v171 = bswap32((unsigned __int16)*v171) >> 16;
      ++v171;
      --v170;
    }
    while (v170);
  }
  CFMutableDictionaryRef Mutable = theDict;
  if (v276)
  {
    v258 = v228;
    v172 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v167];
    if (v167)
    {
      unint64_t v173 = v167;
      do
      {
        unsigned int v174 = *v228++;
        objc_msgSend(v172, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", v174));
        --v173;
      }
      while (v173);
    }
    CFMutableDictionaryRef Mutable = theDict;
    [(__CFDictionary *)theDict setValue:v172 forKey:*MEMORY[0x1E4F2F640]];
    v228 = v258;
  }
  if (a7)
  {
    v175 = CFDataGetMutableBytePtr(cf);
    uint64_t v176 = v283[0] * (uint64_t)v283[1] * (int)v282[0];
    uint64_t v177 = v282[1] == 1815491698 ? 4 : 3;
    if (v176)
    {
      unsigned int v178 = v167 - 1;
      v179 = (unsigned __int16 *)(v175 + 2);
      uint64_t v180 = 2 * v177;
      do
      {
        unsigned int v181 = *(v179 - 1);
        if (v178 < v181) {
          unsigned int v181 = v167 - 1;
        }
        *(v179 - 1) = v228[v181];
        unsigned int v182 = *v179;
        if (v178 < v182) {
          unsigned int v182 = v167 - 1;
        }
        unsigned __int16 *v179 = v228[v182];
        unsigned int v183 = v179[1];
        if (v178 < v183) {
          unsigned int v183 = v167 - 1;
        }
        v179[1] = v228[v183];
        v179 = (unsigned __int16 *)((char *)v179 + v180);
        --v176;
      }
      while (v176);
    }
  }
  a1 = CFArrayCreateMutable(v116, 3, MEMORY[0x1E4F1D510]);
  if (!a1)
  {
LABEL_531:
    v271 = 0;
    theArraya = 0;
    CVPixelBufferFromDNGuint64_t Data = 4294950745;
    goto LABEL_522;
  }
  int v184 = 3;
  do
  {
    uint64_t appended = FigCFArrayAppendInt32();
    if (appended)
    {
      CVPixelBufferFromDNGuint64_t Data = appended;
      a1 = 0;
      v271 = 0;
      theArraya = 0;
      goto LABEL_521;
    }
    --v184;
  }
  while (v184);
  CFMutableDictionaryRef Mutable = theDict;
  v186 = CFDictionaryGetValue(theDict, @"BitsPerSample");
  if (v186) {
    CFDictionarySetValue(theDict, @"OriginalBitsPerSample", v186);
  }
  CFDictionaryRemoveValue(theDict, @"BitsPerSample");
  CFDictionarySetValue(theDict, @"BitsPerSample", a1);
  CFRelease(a1);
LABEL_354:
  v259 = v228;
  if (!a9 || !v261)
  {
    a1 = 0;
    if (v239)
    {
      v271 = 0;
      v188 = 0;
      uint64_t v189 = 0;
      int v71 = v261;
      if (v261 >= 1)
      {
        uint64_t v189 = 0;
        a1 = (const __CFData *)v261;
        v220 = (CFDataRef *)v299;
        do
        {
          if (*v220) {
            v189 += CFDataGetLength(*v220);
          }
          v220 += 8;
          a1 = (const __CFData *)((char *)a1 - 1);
        }
        while (a1);
        v271 = 0;
        v188 = 0;
      }
    }
    else
    {
      v271 = 0;
      v188 = 0;
      uint64_t v189 = 0;
      int v71 = v261;
    }
LABEL_440:
    FigCFDictionarySetInt();
    FigCFDictionarySetInt();
    FigCFDictionarySetInt();
    if ((int)v282[0] > 1)
    {
      FigCFDictionarySetInt();
      FigCFDictionarySetInt();
    }
    if (a5) {
      *a5 = v281 == 34892;
    }
    if (a7 && (!(_BYTE)v274 || v241))
    {
      if (*v12 == 1) {
        kdebug_trace();
      }
      CVPixelBufferFromDNGuint64_t Data = _createCVPixelBufferFromDNGData(cf, v284[1], v284[0], v283[1], v283[0], 0, v282[1], pixelFormat, a7);
      if (*v12 == 1) {
        kdebug_trace();
      }
      if (CVPixelBufferFromDNGData)
      {
        theArraya = v188;
        goto LABEL_467;
      }
      CVBufferSetAttachment(*a7, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
    }
    if (a6)
    {
      v221 = a8;
      if (!(_BYTE)v274 || v241)
      {
        *a6 = MutableCopy;
        MutableCopy = 0;
      }
      if (!a8) {
        goto LABEL_459;
      }
    }
    else
    {
      v221 = a8;
      if (!a8) {
        goto LABEL_459;
      }
    }
    void *v221 = v290;
    CFDataRef v290 = 0;
LABEL_459:
    if (a9)
    {
      *a9 = v188;
      v188 = 0;
    }
    if (a3)
    {
      CFDataRef Length = v290;
      if (v290) {
        CFDataRef Length = (CFDataRef)CFDataGetLength(v290);
      }
      *a3 = Length;
    }
    theArraya = v188;
    CVPixelBufferFromDNGuint64_t Data = 0;
    if (v239) {
      void *v239 = v189;
    }
    goto LABEL_467;
  }
  CFMutableArrayRef v187 = CFArrayCreateMutable(v116, 0, MEMORY[0x1E4F1D510]);
  if (!v187)
  {
    a1 = 0;
    goto LABEL_531;
  }
  v188 = v187;
  if (v261 < 1)
  {
    a1 = 0;
    v271 = 0;
    uint64_t v189 = 0;
    int v71 = v261;
    goto LABEL_440;
  }
  theArraya = v187;
  uint64_t v189 = 0;
  v271 = 0;
  a1 = 0;
  v190 = v299;
  CGFloat v191 = *MEMORY[0x1E4F1DB20];
  CGFloat v192 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v193 = v261;
  CGFloat v194 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v195 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v196 = *MEMORY[0x1E4F1DB30];
  double v197 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v198 = v299;
  while (1)
  {
    if (*(void *)v198) {
      v189 += CFDataGetLength(*(CFDataRef *)v198);
    }
    if (*v12 == 1) {
      kdebug_trace();
    }
    v294 = 0;
    CFDataRef v295 = 0;
    v292 = 0;
    CFDictionaryRef v293 = 0;
    int v291 = 0;
    CFDataRef v199 = (const __CFData *)*((void *)v198 + 1);
    if (v199)
    {
      uint64_t v200 = CMPhotoAuxiliaryImageMetadataCreateFromXMPData(v116, v199, &v291, &v294, 0, &v293);
      if (v200)
      {
        CVPixelBufferFromDNGuint64_t Data = v200;
        v206 = 0;
        goto LABEL_398;
      }
    }
    CFDataRef v201 = *(const __CFData **)v198;
    keys[0] = 0;
    int valuePtr = 0;
    *(void *)&long long values = 0;
    uint64_t v202 = CMPhotoDecompressionSessionCreate(v116, 0, &values);
    if (v202)
    {
      CVPixelBufferFromDNGuint64_t Data = v202;
      v206 = 0;
      v204 = 0;
    }
    else
    {
      v203 = CFDictionaryCreateMutable(v116, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v204 = v203;
      if (v203)
      {
        uint64_t Container = CMPhotoCFDictionarySetInt(v203, @"OutputPixelFormat", 1278226488);
        if (Container
          || (uint64_t Container = CMPhotoCFDictionarySetInt(v204, @"AccelerationMode", 1), Container)
          || (uint64_t Container = CMPhotoDecompressionSessionCreateContainer((const void *)values, 0, v201, 0, (uint64_t *)&valuePtr), Container))
        {
          CVPixelBufferFromDNGuint64_t Data = Container;
LABEL_422:
          v206 = 0;
          goto LABEL_372;
        }
        CVPixelBufferFromDNGuint64_t Data = CMPhotoDecompressionContainerCreateImageForIndex(valuePtr, 0, v204, 2, (uint64_t)keys);
        v206 = (__CVBuffer *)keys[0];
        if (!CVPixelBufferFromDNGData)
        {
          keys[0] = 0;
          goto LABEL_372;
        }
        if (keys[0])
        {
          CFRelease(keys[0]);
          goto LABEL_422;
        }
      }
      else
      {
        v206 = 0;
        CVPixelBufferFromDNGuint64_t Data = 4294950745;
      }
    }
LABEL_372:
    if ((void)values) {
      CFRelease((CFTypeRef)values);
    }
    if (valuePtr) {
      CFRelease(valuePtr);
    }
    if (v204) {
      CFRelease(v204);
    }
    if (CVPixelBufferFromDNGData)
    {
      CFAllocatorRef v116 = allocator;
    }
    else
    {
      CFAllocatorRef v116 = allocator;
      if (v293)
      {
        if ((LODWORD(keys[0]) = 0, LODWORD(values) = 0, FigCFDictionaryGetFloatIfPresent())
          && FigCFDictionaryGetFloatIfPresent()
          && ((uint64_t v207 = *(void *)(v198 + 44), !HIDWORD(v207))
            ? (double v208 = 0.0)
            : (double v208 = (double)v207 / (double)HIDWORD(v207)),
              vabdd_f64(v208, *(float *)&values) < 0.00000999999975
           && ((uint64_t v211 = *(void *)(v198 + 52), !HIDWORD(v211))
             ? (double v212 = 0.0)
             : (double v212 = (double)v211 / (double)HIDWORD(v211)),
               vabdd_f64(v212, *(float *)keys) < 0.00000999999975
            && (LODWORD(valuePtr) = 0, FigCFDictionaryGetIntIfPresent()))))
        {
          uint64_t FractionalPixelBuffer = CMPhotoCreateFractionalPixelBuffer(v206, 0, valuePtr, 0, v293, (CFTypeRef *)&v295);
          if (!FractionalPixelBuffer)
          {
            a1 = v295;
            goto LABEL_397;
          }
        }
        else
        {
          uint64_t FractionalPixelBuffer = FigSignalErrorAt();
        }
      }
      else
      {
        if (CVPixelBufferGetPixelFormatType(v206) == 1278226488)
        {
          a1 = v206;
          v206 = 0;
LABEL_397:
          CVPixelBufferFromDNGuint64_t Data = 0;
          v271 = v294;
          v294 = 0;
          CFDataRef v295 = 0;
          goto LABEL_398;
        }
        uint64_t FractionalPixelBuffer = CMPhotoScaleAndRotateSessionTransformForSize(0, v206, 1, 1, 1278226488, 0, 0, 1u, v191, v192, v194, v195, v196, v197, v209, v210, 0, 1u, &v292);
        if (!FractionalPixelBuffer)
        {
          a1 = v292;
          v292 = 0;
          goto LABEL_397;
        }
      }
      CVPixelBufferFromDNGuint64_t Data = FractionalPixelBuffer;
    }
LABEL_398:
    if (v293) {
      CFRelease(v293);
    }
    if (v295) {
      CFRelease(v295);
    }
    if (v294) {
      CFRelease(v294);
    }
    if (v206) {
      CFRelease(v206);
    }
    if (v292) {
      CFRelease(v292);
    }
    CFMutableDictionaryRef v65 = v263;
    if (*v12 == 1) {
      kdebug_trace();
    }
    if (CVPixelBufferFromDNGData)
    {
      MutableCopy = v246;
      CFMutableDictionaryRef Mutable = theDict;
      goto LABEL_516;
    }
    CGImageAuxiliaryDataTypeFromCMPhotoAuxiliaryImageType = CMPhotoGetCGImageAuxiliaryDataTypeFromCMPhotoAuxiliaryImageType(*((_DWORD *)v198 + 7));
    if (CGImageAuxiliaryDataTypeFromCMPhotoAuxiliaryImageType) {
      break;
    }
    CFStringRef v218 = (const __CFString *)*((void *)v198 + 2);
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    CFStringGetCStringPtr(v218, SystemEncoding);
LABEL_419:
    v198 += 64;
    v190 += 64;
    if (!--v193)
    {
      MutableCopy = v246;
      CFMutableDictionaryRef Mutable = theDict;
      int v71 = v261;
      v188 = theArraya;
      goto LABEL_440;
    }
  }
  v215 = CGImageAuxiliaryDataTypeFromCMPhotoAuxiliaryImageType;
  v216 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v216)
  {
    v217 = v216;
    CFDictionarySetValue(v216, @"AuxPixelBuffer", a1);
    if (a1) {
      CFRelease(a1);
    }
    CFDictionarySetValue(v217, @"AuxMetadata", v271);
    if (v271) {
      CFRelease(v271);
    }
    CFDictionarySetValue(v217, @"AuxImageType", v215);
    CFArrayAppendValue(theArraya, v217);
    CFRelease(v217);
    a1 = 0;
    v271 = 0;
    CFMutableDictionaryRef v65 = v263;
    goto LABEL_419;
  }
  CVPixelBufferFromDNGuint64_t Data = 4294950745;
  MutableCopy = v246;
  CFMutableDictionaryRef Mutable = theDict;
  CFMutableDictionaryRef v65 = v263;
LABEL_516:
  int v71 = v261;
LABEL_467:
  v228 = v259;
LABEL_468:
  if (*v12 == 1) {
    kdebug_trace();
  }
  free(v228);
  if (v289) {
    CFRelease(v289);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v290) {
    CFRelease(v290);
  }
  if (v235) {
    CFRelease(v235);
  }
  if (v237) {
    CFRelease(v237);
  }
  if (v236) {
    CFRelease(v236);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (value) {
    CFRelease(value);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v65) {
    CFRelease(v65);
  }
  if (v234) {
    CFRelease(v234);
  }
  if (theArraya) {
    CFRelease(theArraya);
  }
  if (a1) {
    CFRelease(a1);
  }
  if (v271) {
    CFRelease(v271);
  }
  if (v71 >= 1)
  {
    uint64_t v223 = v71;
    v224 = (CFTypeRef *)&v300;
    do
    {
      v225 = *(v224 - 2);
      if (v225) {
        CFRelease(v225);
      }
      v226 = *(v224 - 1);
      if (v226) {
        CFRelease(v226);
      }
      if (*v224) {
        CFRelease(*v224);
      }
      v224 += 8;
      --v223;
    }
    while (v223);
  }
  return CVPixelBufferFromDNGData;
}

uint64_t CMPhotoDNGCompressorCreateFromSourceDNG(const __CFAllocator *a1, const __CFData *a2, id a3, void *a4)
{
  CFTypeRef v4 = 0;
  v39[1] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef theDict = 0;
  CFTypeRef cf = 0;
  CFTypeRef v34 = 0;
  CFTypeRef v35 = 0;
  CFTypeRef v33 = 0;
  uint64_t v5 = 4294950746;
  if (!a2 || !a4)
  {
LABEL_9:
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_29;
  }
  unsigned int v32 = 0;
  CFAllocatorRef v10 = (void *)MEMORY[0x1AD1109A0]();
  __int16 v38 = @"MainBufferPixelFormat";
  v39[0] = &unk_1F02E5168;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  if (a3)
  {
    if (!CFDictionaryGetValue((CFDictionaryRef)a3, @"MainBufferPixelFormat"))
    {
      a3 = (id)[a3 mutableCopy];
      [a3 setObject:&unk_1F02E5168 forKeyedSubscript:@"MainBufferPixelFormat"];
    }
  }
  else
  {
    a3 = (id)v11;
  }
  uint64_t v5 = _dngUnpackInternal(a2, (const __CFDictionary *)a3, 0, 0, &v32, &theDict, (CVPixelBufferRef *)&v35, &v34, (__CFArray **)&v33);
  if (v5) {
    goto LABEL_8;
  }
  uint64_t v13 = CMPhotoDNGCompressorCreate(a1, v32, v12, &cf);
  if (v13)
  {
    uint64_t v5 = v13;
LABEL_8:
    CFTypeRef v4 = 0;
    goto LABEL_9;
  }
  CFNumberRef Value = (__CFDictionary *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F2F630]);
  CFTypeRef v4 = Value;
  if (!Value)
  {
LABEL_42:
    uint64_t v5 = 4294950743;
    goto LABEL_9;
  }
  CFTypeID v15 = CFGetTypeID(Value);
  if (v15 != CFDictionaryGetTypeID())
  {
    CFTypeRef v4 = 0;
    goto LABEL_42;
  }
  CFTypeRef v16 = CFRetain(v4);
  *((void *)cf + 5) = v16;
  uint64_t v17 = (__CFDictionary *)CFDictionaryGetValue(v4, @"OriginalBitsPerSample");
  CFTypeRef v4 = v17;
  if (!v17) {
    goto LABEL_24;
  }
  int v31 = 0;
  CFTypeID v18 = CFGetTypeID(v17);
  if (v18 == CFArrayGetTypeID())
  {
    FigCFArrayGetIntAtIndex();
    int Int = 0;
  }
  else
  {
    CFTypeID v20 = CFGetTypeID(v4);
    if (v20 != CFNumberGetTypeID())
    {
LABEL_23:
      CFTypeRef v4 = 0;
      goto LABEL_24;
    }
    int Int = CMPhotoCFNumberGetInt(v4);
    int v31 = Int;
  }
  if (Int < 1) {
    goto LABEL_23;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFTypeRef v4 = Mutable;
  if (!Mutable)
  {
    uint64_t v5 = 4294950745;
    goto LABEL_9;
  }
  uint64_t v22 = CMPhotoCFDictionarySetInt(Mutable, @"BitDepth", v31);
  if (v22)
  {
    uint64_t v5 = v22;
    goto LABEL_9;
  }
LABEL_24:
  CFMutableDictionaryRef v23 = cf;
  size_t v24 = (const void *)*((void *)cf + 12);
  if (v24)
  {
    CFRelease(v24);
    CFMutableDictionaryRef v23 = cf;
    *((void *)cf + 12) = 0;
  }
  CFTypeRef v25 = v35;
  CFDictionaryRef v26 = theDict;
  CFTypeRef v35 = 0;
  CFDictionaryRef theDict = 0;
  v23[3] = v25;
  v23[4] = v26;
  CFArrayRef v28 = (const __CFArray *)v33;
  CFTypeRef v27 = v34;
  v23[6] = v4;
  v23[7] = v27;
  CFTypeRef v34 = 0;
  if (v28)
  {
    id v29 = (__CFArray *)v23[9];
    v40.length = CFArrayGetCount(v28);
    v40.location = 0;
    CFArrayAppendArray(v29, v28, v40);
    CFMutableDictionaryRef v23 = cf;
  }
  uint64_t v5 = 0;
  CFTypeRef v4 = 0;
  *a4 = v23;
  CFTypeRef cf = 0;
LABEL_29:
  if (theDict) {
    CFRelease(theDict);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v34) {
    CFRelease(v34);
  }
  if (v33) {
    CFRelease(v33);
  }
  return v5;
}

uint64_t CMPhotoDNGCompressorCreateFromSourceDNGWithModificationHandler(const __CFAllocator *a1, const __CFData *a2, void *a3, CFTypeRef *a4, uint64_t a5)
{
  CFAllocatorRef v6 = a1;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  CFTypeRef v81 = 0;
  uint64_t v7 = CMPhotoDNGCompressorCreateFromSourceDNG(a1, a2, a3, &v81);
  if (!v7)
  {
    context = (void *)MEMORY[0x1AD1109A0]();
    CFArrayRef v8 = (const __CFData **)v81;
    v97[0] = 0;
    v92[0] = 0;
    if (!v81) {
      goto LABEL_101;
    }
    CFDictionaryRef v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (!v9) {
      goto LABEL_112;
    }
    *(void *)&long long v93 = @"ImageHandle";
    *(void *)&long long v98 = &unk_1F02E51B0;
    id v10 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v98, &v93, 1), "mutableCopy");
    if (v10)
    {
      unsigned int v78 = v10;
      id v91 = v10;
      objc_msgSend(v9, "setObject:forKeyedSubscript:", (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v91, 1), "mutableCopy"), @"ImageList");
      if (!v8[7]) {
        goto LABEL_20;
      }
      v89 = @"ImageHandle";
      int v90 = &unk_1F02E51B0;
      id v11 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1), "mutableCopy");
      if (v11)
      {
        uint64_t v12 = v11;
        id v88 = v11;
        objc_msgSend(v78, "setObject:forKeyedSubscript:", (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v88, 1), "mutableCopy"), @"ThumbnailImage");
        CFAllocatorRef v13 = CFGetAllocator(v8);
        uint64_t Container = CMPhotoDecompressionSessionCreate(v13, 0, v97);
        if (Container
          || (uint64_t Container = CMPhotoDecompressionSessionCreateContainer(v97[0], 0, v8[7], 0, (uint64_t *)v92),
              Container)
          || (uint64_t v83 = 0,
              uint64_t Container = CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndexWithOptions((void *)v92[0], 0, 0, (uint64_t)&v83), Container))
        {
          uint64_t v29 = Container;
        }
        else
        {
          if (v83 < 1) {
            goto LABEL_20;
          }
          uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
          if (v15)
          {
            CFTypeRef v16 = (void *)v15;
            uint64_t v75 = a5;
            if (v83 >= 1)
            {
              uint64_t v17 = 0;
              while (1)
              {
                int v86 = @"ImageHandle";
                uint64_t v87 = [MEMORY[0x1E4F28ED0] numberWithInt:v17];
                id v18 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1), "mutableCopy");
                if (!v18)
                {
                  uint64_t v29 = 4294950745;
                  goto LABEL_109;
                }
                CFDictionaryRef v19 = v18;
                CFTypeRef cf = 0;
                uint64_t v20 = CMPhotoDecompressionContainerCopyAuxiliaryImageTypeURNForIndexWithOptions((void *)v92[0], 0, v17, 0, (uint64_t)&cf);
                if (v20) {
                  break;
                }
                [v19 setObject:cf forKeyedSubscript:@"AuxiliaryImageType"];
                if (cf) {
                  CFRelease(cf);
                }
                [v16 addObject:v19];
                if (v83 <= ++v17) {
                  goto LABEL_19;
                }
              }
              uint64_t v29 = v20;
LABEL_109:
              a5 = v75;
              goto LABEL_110;
            }
LABEL_19:
            [v12 setObject:v16 forKeyedSubscript:@"Auxiliary"];
            a5 = v75;
LABEL_20:
            CFArrayRef v21 = v8[9];
            if (!v21 || CFArrayGetCount(v21) < 1)
            {
              uint64_t v29 = 0;
              goto LABEL_36;
            }
            uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
            if (v22)
            {
              CFMutableDictionaryRef v23 = (void *)v22;
              CFAllocatorRef v74 = v6;
              uint64_t v76 = a5;
              int v73 = v9;
              for (CFIndex i = 0; ; ++i)
              {
                CFArrayRef v25 = v8[9];
                if (v25) {
                  LODWORD(v25) = CFArrayGetCount(v25);
                }
                if (i >= (int)v25)
                {
                  [v78 setObject:v23 forKeyedSubscript:@"Auxiliary"];
                  uint64_t v29 = 0;
                  goto LABEL_35;
                }
                CFDictionaryRef v26 = objc_msgSend((id)CFArrayGetValueAtIndex(v8[9], i), "objectForKeyedSubscript:", @"AuxImageType");
                int v84 = @"ImageHandle";
                uint64_t v85 = [MEMORY[0x1E4F28ED0] numberWithInt:i];
                id v27 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1), "mutableCopy");
                if (!v27)
                {
                  CFDictionaryRef v9 = 0;
                  uint64_t v29 = 4294950745;
                  goto LABEL_35;
                }
                CFArrayRef v28 = v27;
                uint64_t v83 = 0;
                if ([v26 hasPrefix:@"kCGImageAuxiliaryDataType"]) {
                  CMPhotoGetCMPhotoAuxiliaryImageTypeFromCGImageAuxiliaryDataType((uint64_t)v26, (__CFString **)&v83, 0);
                }
                else {
                  CMPhotoGetCMPhotoAuxiliaryImageTypeAndFinalURNFromURN((uint64_t)v26, (__CFString **)&v83);
                }
                if (!v83) {
                  break;
                }
                [v28 setObject:v83 forKeyedSubscript:@"AuxiliaryImageType"];
                [v23 addObject:v28];
              }
              uint64_t v29 = FigSignalErrorAt();
              CFDictionaryRef v9 = 0;
LABEL_35:
              CFAllocatorRef v6 = v74;
              a5 = v76;
LABEL_36:
              if (v97[0]) {
                CFRelease(v97[0]);
              }
              if (v92[0]) {
                CFRelease(v92[0]);
              }
              if (v29) {
                goto LABEL_102;
              }
              id v80 = 0;
              uint64_t v30 = CMPhotoPropertyListCopyWithMutableContainers(v6, v9, (__CFArray **)&v80);
              if (v30
                || (CFDictionaryRef v31 = (const __CFDictionary *)v80,
                    uint64_t v30 = (*(uint64_t (**)(uint64_t, const __CFDictionary *))(a5 + 16))(a5, v31),
                    v30))
              {
                uint64_t v29 = v30;
                goto LABEL_102;
              }
              if (!CMPhotoCompressionSessionCheckForIllegalModification((const __CFDictionary *)v9, v31)) {
                goto LABEL_101;
              }
              unsigned int v32 = (char *)v81;
              if (!v81) {
                goto LABEL_101;
              }
              CFTypeRef v33 = (void *)[(__CFDictionary *)v31 objectForKeyedSubscript:@"ImageList"];
              if ([v33 count] != 1) {
                goto LABEL_101;
              }
              CFTypeRef v34 = (void *)[v33 objectAtIndexedSubscript:0];
              CFTypeRef v35 = v34;
              if (*((void *)v32 + 7))
              {
                unsigned int v36 = (void *)[v34 objectForKeyedSubscript:@"ThumbnailImage"];
                unint64_t v37 = v36;
                if (v36)
                {
                  CFTypeID v38 = CFGetTypeID(v36);
                  if (v38 != CFArrayGetTypeID()) {
                    goto LABEL_101;
                  }
                }
                if (!objc_msgSend(v37, "count", v73)) {
                  goto LABEL_57;
                }
                CFRange v39 = (void *)[v37 objectAtIndexedSubscript:0];
                if (!v39) {
                  goto LABEL_101;
                }
                CFRange v40 = v39;
                CFTypeID v41 = CFGetTypeID(v39);
                if (v41 != CFDictionaryGetTypeID()) {
                  goto LABEL_101;
                }
                LODWORD(v91) = 0;
                if (FigCFDictionaryGetIntIfPresent() && !v91)
                {
                  uint64_t v42 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"ImageList"), "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", @"ThumbnailImage"), "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", @"Auxiliary"), "count");
                  __int16 v44 = (CFMutableArrayRef *)(v32 + 96);
                  uint64_t v43 = (__CFArray *)*((void *)v32 + 12);
                  if (v42)
                  {
                    if (v43)
                    {
                      CFArrayRemoveAllValues(v43);
                    }
                    else
                    {
                      CFAllocatorRef v61 = CFGetAllocator(v32);
                      CFMutableArrayRef Mutable = CFArrayCreateMutable(v61, 0, MEMORY[0x1E4F1D510]);
                      *((void *)v32 + 12) = Mutable;
                      if (!Mutable)
                      {
                        uint64_t v29 = 4294950745;
                        goto LABEL_102;
                      }
                    }
                    int v63 = (void *)[v40 objectForKeyedSubscript:@"Auxiliary"];
                    int v64 = v63;
                    if (v63)
                    {
                      CFTypeID v65 = CFGetTypeID(v63);
                      if (v65 != CFArrayGetTypeID()) {
                        goto LABEL_101;
                      }
                    }
                    long long v100 = 0u;
                    long long v101 = 0u;
                    long long v98 = 0u;
                    long long v99 = 0u;
                    uint64_t v66 = [v64 countByEnumeratingWithState:&v98 objects:v97 count:16];
                    if (v66)
                    {
                      uint64_t v67 = v66;
                      uint64_t v68 = *(void *)v99;
LABEL_92:
                      uint64_t v69 = 0;
                      while (1)
                      {
                        if (*(void *)v99 != v68) {
                          objc_enumerationMutation(v64);
                        }
                        uint64_t v70 = *(void **)(*((void *)&v98 + 1) + 8 * v69);
                        if (!v70) {
                          goto LABEL_101;
                        }
                        CFTypeID v71 = CFGetTypeID(*(CFTypeRef *)(*((void *)&v98 + 1) + 8 * v69));
                        if (v71 != CFDictionaryGetTypeID()) {
                          goto LABEL_101;
                        }
                        v72 = (const void *)[v70 objectForKeyedSubscript:@"ImageHandle"];
                        if (!v72) {
                          goto LABEL_101;
                        }
                        CFArrayAppendValue(*v44, v72);
                        if (v67 == ++v69)
                        {
                          uint64_t v67 = [v64 countByEnumeratingWithState:&v98 objects:v97 count:16];
                          if (v67) {
                            goto LABEL_92;
                          }
                          goto LABEL_62;
                        }
                      }
                    }
                    goto LABEL_62;
                  }
                }
                else
                {
LABEL_57:
                  BOOL v45 = (const void *)*((void *)v32 + 7);
                  if (v45)
                  {
                    CFRelease(v45);
                    *((void *)v32 + 7) = 0;
                  }
                  __int16 v44 = (CFMutableArrayRef *)(v32 + 96);
                  uint64_t v43 = (__CFArray *)*((void *)v32 + 12);
                }
                if (v43)
                {
                  CFRelease(v43);
                  *__int16 v44 = 0;
                }
              }
LABEL_62:
              CFArrayRef v46 = (const __CFArray *)*((void *)v32 + 9);
              if (!v46 || CFArrayGetCount(v46) < 1) {
                goto LABEL_85;
              }
              CFNumberRef v47 = (void *)[v35 objectForKeyedSubscript:@"Auxiliary"];
              CFAllocatorRef v48 = v47;
              if (!v47 || (CFTypeID v49 = CFGetTypeID(v47), v49 == CFArrayGetTypeID()))
              {
                CFArrayRef v50 = (const __CFArray *)*((void *)v32 + 9);
                if (v50)
                {
                  int Count = CFArrayGetCount(v50);
                  if (Count >= 1)
                  {
                    uint64_t v52 = Count;
                    while (1)
                    {
                      long long v95 = 0u;
                      long long v96 = 0u;
                      long long v93 = 0u;
                      long long v94 = 0u;
                      uint64_t v53 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v93, v92, 16, v73);
                      if (v53) {
                        break;
                      }
LABEL_82:
                      CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)v32 + 9), (v52 - 1));
LABEL_83:
                      if (v52-- <= 1) {
                        goto LABEL_85;
                      }
                    }
                    uint64_t v54 = v53;
                    uint64_t v55 = *(void *)v94;
LABEL_71:
                    uint64_t v56 = 0;
                    while (1)
                    {
                      if (*(void *)v94 != v55) {
                        objc_enumerationMutation(v48);
                      }
                      if (!*(void *)(*((void *)&v93 + 1) + 8 * v56)) {
                        goto LABEL_101;
                      }
                      CFTypeID v57 = CFGetTypeID(*(CFTypeRef *)(*((void *)&v93 + 1) + 8 * v56));
                      if (v57 != CFDictionaryGetTypeID()) {
                        goto LABEL_101;
                      }
                      LODWORD(v91) = 0;
                      if (FigCFDictionaryGetIntIfPresent()) {
                        BOOL v58 = v91 == v52 - 1;
                      }
                      else {
                        BOOL v58 = 0;
                      }
                      if (v58) {
                        goto LABEL_83;
                      }
                      if (v54 == ++v56)
                      {
                        uint64_t v54 = [v48 countByEnumeratingWithState:&v93 objects:v92 count:16];
                        if (v54) {
                          goto LABEL_71;
                        }
                        goto LABEL_82;
                      }
                    }
                  }
                }
LABEL_85:
                uint64_t v29 = 0;
                *a4 = v81;
                return v29;
              }
LABEL_101:
              uint64_t v29 = 4294950746;
LABEL_102:
              goto LABEL_103;
            }
            goto LABEL_111;
          }
          uint64_t v29 = 4294950745;
        }
LABEL_110:
        CFDictionaryRef v9 = 0;
        goto LABEL_36;
      }
    }
LABEL_111:
    CFDictionaryRef v9 = 0;
LABEL_112:
    uint64_t v29 = 4294950745;
    goto LABEL_36;
  }
  uint64_t v29 = v7;
LABEL_103:
  if (v81) {
    CFRelease(v81);
  }
  return v29;
}

uint64_t CMPhotoDNGCompressorReplaceMainImageOptions(uint64_t a1, CFTypeRef cf)
{
  if (!a1) {
    return 4294950746;
  }
  CFTypeRef v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 48) = 0;
  }
  if (cf) {
    CFTypeRef v5 = CFRetain(cf);
  }
  else {
    CFTypeRef v5 = 0;
  }
  uint64_t result = 0;
  *(void *)(a1 + 48) = v5;
  return result;
}

uint64_t CMPhotoDNGCompressorReplaceMainImageProperties(CFTypeRef cf, const __CFDictionary *a2)
{
  uint64_t result = 4294950746;
  if (cf && a2)
  {
    CFTypeRef v5 = (const void *)*((void *)cf + 4);
    if (v5)
    {
      CFRelease(v5);
      *((void *)cf + 4) = 0;
    }
    if (*((void *)cf + 5))
    {
      CFAllocatorRef v6 = CFGetAllocator(cf);
      MutableCopy = CFDictionaryCreateMutableCopy(v6, 0, a2);
      if (!MutableCopy) {
        return 4294950745;
      }
      CFTypeRef v8 = MutableCopy;
      CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F2F630], *((const void **)cf + 5));
    }
    else
    {
      CFTypeRef v8 = CFRetain(a2);
    }
    uint64_t result = 0;
    *((void *)cf + 4) = v8;
  }
  return result;
}

uint64_t CMPhotoDNGCompressorRemoveAuxiliaryImages(CFMutableArrayRef *cf)
{
  if (!cf) {
    return 4294950746;
  }
  if (!cf[7])
  {
LABEL_6:
    CFArrayRemoveAllValues(cf[10]);
    CFArrayRemoveAllValues(cf[9]);
    return 0;
  }
  uint64_t v2 = cf[12];
  if (v2)
  {
    CFArrayRemoveAllValues(v2);
    goto LABEL_6;
  }
  CFAllocatorRef v3 = CFGetAllocator(cf);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v3, 0, MEMORY[0x1E4F1D510]);
  cf[12] = Mutable;
  if (Mutable) {
    goto LABEL_6;
  }
  return 4294950745;
}

uint64_t CMPhotoDNGUnpack(const __CFData *a1, const __CFDictionary *a2, __CFDictionary **a3, CVPixelBufferRef *a4, void *a5, __CFArray **a6)
{
  return _dngUnpackInternal(a1, a2, 0, 0, 0, a3, a4, a5, a6);
}

uint64_t CMPhotoDNGGetLightSourceTagFromTemp(float a1)
{
  uint64_t v1 = 0;
  float v2 = 9999.0;
  CFAllocatorRef v3 = (char *)&gLightSources;
  while (1)
  {
    float v4 = a1 - *(float *)((char *)&gLightSources + v1);
    if (v4 < 0.0) {
      float v4 = -v4;
    }
    if (v4 < 75.0) {
      break;
    }
    if (v4 < v2)
    {
      CFAllocatorRef v3 = (char *)&gLightSources + v1;
      float v2 = v4;
    }
    v1 += 12;
    if (v1 == 120)
    {
      CFTypeRef v5 = (__int16 *)(v3 + 8);
      return *v5;
    }
  }
  CFTypeRef v5 = (__int16 *)((char *)&gLightSources + v1 + 8);
  return *v5;
}

double CMPhotoDNGCompressorClass_Init(_OWORD *a1)
{
  double result = 0.0;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  return result;
}

void CMPhotoDNGCompressorClass_Finalize(void *a1)
{
  float v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  CFAllocatorRef v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  float v4 = (const void *)a1[5];
  if (v4)
  {
    CFRelease(v4);
    a1[5] = 0;
  }
  CFTypeRef v5 = (const void *)a1[6];
  if (v5)
  {
    CFRelease(v5);
    a1[6] = 0;
  }
  CFAllocatorRef v6 = (const void *)a1[7];
  if (v6)
  {
    CFRelease(v6);
    a1[7] = 0;
  }
  uint64_t v7 = (const void *)a1[9];
  if (v7)
  {
    CFRelease(v7);
    a1[9] = 0;
  }
  CFTypeRef v8 = (const void *)a1[10];
  if (v8)
  {
    CFRelease(v8);
    a1[10] = 0;
  }
  CFDictionaryRef v9 = (const void *)a1[12];
  if (v9)
  {
    CFRelease(v9);
    a1[12] = 0;
  }
}

CFTypeRef CMPhotoDNGCompressorClass_CopyFormattingDesc()
{
  return CFRetain(@"[CMPhotoDNGCompressor]");
}

__CFString *CMPhotoDNGCompressorClass_CopyDebugDesc(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  CFMutableArrayRef Mutable = CFStringCreateMutable(v2, 0);
  float v4 = Mutable;
  if (Mutable)
  {
    CFStringAppendFormat(Mutable, 0, @"<CMPhotoDNGCompressor %p> {\n", a1);
    CFStringAppendFormat(v4, 0, @"\tmainBuffer: {\n%@\n}\n", *(void *)(a1 + 24));
    CFStringAppendFormat(v4, 0, @"\tmainOptions: {\n%@\n}\n", *(void *)(a1 + 48));
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5) {
      CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 56));
    }
    else {
      CFIndex Length = 0;
    }
    CFStringAppendFormat(v4, 0, @"\tjpegPreview: {\n%p (size %zd)\n}\n", v5, Length);
    CFStringAppendFormat(v4, 0, @"\tauxImages: {\n%@\n}\n", *(void *)(a1 + 72));
    CFStringAppendFormat(v4, 0, @"\tpreviewAuxImages: {\n%@\n}\n", *(void *)(a1 + 80));
    CFStringAppendFormat(v4, 0, @"}");
  }
  return v4;
}

uint64_t _dngInfoInit(uint64_t a1, const __CFData *a2, __CVBuffer *a3, const __CFDictionary *a4, const __CFArray *a5, char a6, const __CFDictionary *a7, uint64_t a8)
{
  uint64_t v233 = 0;
  uint64_t v234 = 0;
  float v232 = 0.0;
  __int16 v231 = 0;
  uint64_t v230 = 0;
  *(unsigned char *)(a1 + 4) = a6;
  float v228 = 1.0;
  int v229 = 0;
  int v226 = 2;
  int v227 = 2;
  int v225 = 0;
  char v224 = a6;
  char v223 = a6;
  v221.f64[0] = CMPhotoGetPixelBufferCLAPAsRect(a3);
  v221.f64[1] = v15;
  v222.f64[0] = v16;
  v222.f64[1] = v17;
  if ((int)CMPhotoGetCPUCount() > 7) {
    CPUint Count = 8;
  }
  else {
    CPUint Count = CMPhotoGetCPUCount();
  }
  *(_DWORD *)(a1 + 28) = CPUCount;
  if (a7)
  {
    FigCFDictionaryGetBooleanIfPresent();
    FigCFDictionaryGetFloatIfPresent();
    if (v228 < 0.0) {
      goto LABEL_35;
    }
    if (v228 > 1.0) {
      goto LABEL_35;
    }
    FigCFDictionaryGetIntIfPresent();
    if ((v227 - 10) <= 0xFFFFFFF6) {
      goto LABEL_35;
    }
    FigCFDictionaryGetIntIfPresent();
    if (v226 < 0) {
      goto LABEL_35;
    }
    FigCFDictionaryGetIntIfPresent();
    FigCFDictionaryGetIntIfPresent();
    FigCFDictionaryGetBooleanIfPresent();
    FigCFDictionaryGetBooleanIfPresent();
    CMPhotoCFDictionaryGetBooleanIfPresent(a7, @"RemoveWhiteBalance", &v231);
    CMPhotoCFDictionaryGetFloatIfPresent(a7, @"ApplyDigitalGainAmount", (char *)&v230 + 4);
    int IntIfPresent = FigCFDictionaryGetIntIfPresent();
    BOOL v20 = v230 != 1786276963 || IntIfPresent == 0;
    int v21 = v20 ? 7 : 52546;
    FigCFDictionaryGetIntIfPresent();
    if (*(_DWORD *)(a1 + 28) >= 0x100u) {
      goto LABEL_35;
    }
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a7, @"SourceCropRect");
    if (Value)
    {
      if (a2)
      {
LABEL_35:
        HIDWORD(v234) = FigSignalErrorAt();
        return HIDWORD(v234);
      }
      CGSize v25 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      rect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      rect.size = v25;
      if (CGRectMakeWithDictionaryRepresentation(Value, &rect))
      {
        HIDWORD(v234) = CMPhotoApplyCropRectToRect(v221.f64, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        if (HIDWORD(v234)) {
          return HIDWORD(v234);
        }
      }
    }
    CFDictionaryRef v26 = (const __CFDictionary *)CFDictionaryGetValue(a7, @"Tiling");
    unint64_t v24 = (unint64_t)v26;
    if (v26)
    {
      CFTypeID v27 = CFGetTypeID(v26);
      if (v27 != CFDictionaryGetTypeID()) {
        goto LABEL_35;
      }
      rect.origin.CGFloat x = 0.0;
      rect.origin.y = 0.0;
      BOOL v28 = CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)v24, (CGSize *)&rect);
      unint64_t v23 = 0;
      unint64_t v24 = 0;
      if (v28)
      {
        unint64_t v23 = vcvtad_u64_f64(rect.origin.x);
        uint64_t v29 = 7;
        if (!*(unsigned char *)(a1 + 4)) {
          uint64_t v29 = 15;
        }
        if ((v29 & v23) != 0) {
          goto LABEL_35;
        }
        uint64_t v30 = 7;
        if (!*(unsigned char *)(a1 + 4)) {
          uint64_t v30 = 3;
        }
        unint64_t v24 = vcvtad_u64_f64(rect.origin.y);
        if ((v30 & v24) != 0) {
          goto LABEL_35;
        }
      }
    }
    else
    {
      unint64_t v23 = 0;
    }
  }
  else
  {
    unint64_t v23 = 0;
    unint64_t v24 = 0;
    int v21 = 7;
  }
  int v31 = v229;
  *(_DWORD *)(a1 + 8) = v229;
  switch(v31)
  {
    case 0:
      *(_DWORD *)(a1 + 8) = 3;
      break;
    case 1:
    case 3:
      break;
    case 2:
    case 5:
      if (!*(unsigned char *)(a1 + 4)) {
        goto LABEL_35;
      }
      break;
    default:
      goto LABEL_35;
  }
  *(float *)(a1 + 12) = v228;
  int v32 = v226;
  *(_DWORD *)(a1 + 16) = v227;
  *(_DWORD *)(a1 + 20) = v32;
  *(unsigned char *)(a1 + 24) = v224;
  *(unsigned char *)(a1 + 25) = v223;
  *(unsigned char *)(a1 + 26) = v231;
  *(_DWORD *)(a1 + 32) = HIDWORD(v230);
  CFDictionaryRef theDict = (const __CFDictionary *)_readDictCFDict(a4, (const void *)*MEMORY[0x1E4F2F630]);
  if (!theDict) {
    goto LABEL_197;
  }
  *((void *)&v210 + 1) = v24;
  CFDictionaryRef DictCFDict = (const __CFDictionary *)_readDictCFDict(a4, (const void *)*MEMORY[0x1E4F2FD40]);
  if (!DictCFDict) {
    goto LABEL_197;
  }
  CFDictionaryRef v34 = DictCFDict;
  int v209 = v21;
  uint64_t v211 = a8;
  double v212 = a3;
  CFDataRef v213 = a2;
  CFDictionaryRef metadata = a4;
  *(void *)&long long v210 = v23;
  CFStringRef v35 = (const __CFString *)FigCFDictionaryGetValue();
  char v36 = 0;
  char v37 = 0;
  CFIndex v38 = 0;
  CFStringRef theString2 = (const __CFString *)*MEMORY[0x1E4F2F3B8];
  CFStringRef v218 = (const __CFString *)*MEMORY[0x1E4F2F3B0];
  if (a5) {
    goto LABEL_47;
  }
LABEL_48:
  for (CFIndex i = 0; v38 < i; CFIndex i = CFArrayGetCount(a5))
  {
    if (CFArrayGetValueAtIndex(a5, v38))
    {
      CFStringRef v39 = (const __CFString *)FigCFDictionaryGetValue();
      if (v39)
      {
        CFStringRef v40 = v39;
        if (CFStringCompare(v39, theString2, 0))
        {
          CFComparisonResult v41 = CFStringCompare(v40, v218, 0);
          v36 |= v41 == kCFCompareEqualTo;
          v37 |= v41 != kCFCompareEqualTo;
        }
        else
        {
          char v36 = 1;
        }
      }
    }
    ++v38;
    if (!a5) {
      goto LABEL_48;
    }
LABEL_47:
    ;
  }
  CFStringRef v220 = 0;
  HIDWORD(v234) = CMPhotoDNGVersionFromPropertiesAndOptions(metadata, (uint64_t)a7, v36 & 1, v37 & 1, (__CFString **)&v220);
  if (HIDWORD(v234)) {
    return HIDWORD(v234);
  }
  if (v35) {
    CFStringCompare(v35, v220, 0x40uLL);
  }
  else {
    CFStringRef v35 = v220;
  }
  CFAllocatorRef v43 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v35, @".");
  CFArrayRef v45 = ArrayBySeparatingStrings;
  if (ArrayBySeparatingStrings) {
    CFAutorelease(ArrayBySeparatingStrings);
  }
  if (CFArrayGetCount(v45) != 4) {
    goto LABEL_197;
  }
  for (CFIndex j = 0; j != 4; *(unsigned char *)(a1 + j++) = IntValue)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v45, j);
    IntCFDictionaryRef Value = CFStringGetIntValue(ValueAtIndex);
    if (IntValue > 9) {
      goto LABEL_197;
    }
  }
  *(void *)(a1 + 40) = _readDictCFString(v34, (const void *)*MEMORY[0x1E4F2FD60], (_DWORD *)&v234 + 1);
  *(void *)(a1 + 48) = _readDictCFString(v34, (const void *)*MEMORY[0x1E4F2FD68], (_DWORD *)&v234 + 1);
  *(void *)(a1 + 56) = _readDictCFString(v34, (const void *)*MEMORY[0x1E4F2FD88], (_DWORD *)&v234 + 1);
  CFTypeID v49 = CFDictionaryGetValue(v34, (const void *)*MEMORY[0x1E4F2FD38]);
  if (!v49) {
    goto LABEL_197;
  }
  CFArrayRef v50 = v49;
  if (!FigCFDictionaryGetIntIfPresent() && !FigCFDictionaryGetIntIfPresent()) {
    *(_DWORD *)(a1 + 96) = 1;
  }
  *(void *)(a1 + 88) = _readDictCFString(theDict, (const void *)*MEMORY[0x1E4F2F680], (_DWORD *)&v234 + 1);
  v51 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F2F5D8]);
  if (!v51) {
    goto LABEL_197;
  }
  uint64_t v52 = v51;
  CFTypeID v53 = CFGetTypeID(v51);
  if (v53 == CFArrayGetTypeID())
  {
    FigCFArrayGetInt32AtIndex();
  }
  else
  {
    CFTypeID v54 = CFGetTypeID(v52);
    if (v54 != CFNumberGetTypeID()) {
      goto LABEL_197;
    }
    CFNumberGetValue((CFNumberRef)v52, kCFNumberIntType, (void *)(a1 + 128));
  }
  if (*(unsigned char *)(a1 + 4))
  {
    CFNumberRef v55 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F2F618]);
    if (v55)
    {
      CFNumberRef v56 = v55;
      CFTypeID v57 = CFGetTypeID(v55);
      if (v57 == CFNumberGetTypeID()) {
        CFNumberGetValue(v56, kCFNumberIntType, (void *)(a1 + 144));
      }
    }
  }
  BOOL v58 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F2F6A0]);
  if (!v58) {
    goto LABEL_197;
  }
  v59 = v58;
  CFTypeID v60 = CFGetTypeID(v58);
  if (v60 == CFArrayGetTypeID())
  {
    FigCFArrayGetInt32AtIndex();
  }
  else
  {
    CFTypeID v61 = CFGetTypeID(v59);
    if (v61 != CFNumberGetTypeID()) {
      goto LABEL_197;
    }
    CFNumberGetValue((CFNumberRef)v59, kCFNumberIntType, (void *)(a1 + 132));
  }
  CFArrayRef DictCFArray = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F5A0], 0);
  CFArrayRef v63 = 0;
  CFArrayRef v207 = DictCFArray;
  if (!DictCFArray) {
    CFArrayRef v63 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F5B0], (_DWORD *)&v234 + 1);
  }
  CFArrayRef v194 = v63;
  CFArrayRef v64 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F598], 0);
  CFNumberRef DictCFNumber = (const __CFNumber *)_readDictCFNumber(theDict, (const void *)*MEMORY[0x1E4F2F5E0], (_DWORD *)&v234 + 1);
  CFNumberRef v66 = (const __CFNumber *)_readDictCFNumber(theDict, (const void *)*MEMORY[0x1E4F2F5E8], (_DWORD *)&v234 + 1);
  CFArrayRef v202 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F608], (_DWORD *)&v234 + 1);
  CFArrayRef v67 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F610], (_DWORD *)&v234 + 1);
  if (HIDWORD(v234)) {
    goto LABEL_197;
  }
  CFArrayRef v68 = v67;
  CFArrayRef v200 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F5F0], 0);
  CFArrayRef v203 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F5F8], 0);
  *(void *)(a1 + 680) = _readDictCFString(theDict, (const void *)*MEMORY[0x1E4F2F600], 0);
  *(void *)(a1 + 688) = _readDictCFString(theDict, (const void *)*MEMORY[0x1E4F2F660], 0);
  *(void *)(a1 + 704) = _readDictCFString(theDict, (const void *)*MEMORY[0x1E4F2F670], 0);
  *(void *)(a1 + 696) = _readDictCFString(theDict, (const void *)*MEMORY[0x1E4F2F5A8], 0);
  CFNumberRef v69 = (const __CFNumber *)_readDictCFNumber(theDict, (const void *)*MEMORY[0x1E4F2F668], 0);
  uint64_t v70 = (_DWORD *)(a1 + 2072);
  CFArrayRef v206 = v64;
  CFTypeRef cf = v50;
  CFArrayRef v201 = v68;
  if (v69) {
    CFNumberGetValue(v69, kCFNumberShortType, v70);
  }
  else {
    *uint64_t v70 = -1;
  }
  CFNumberRef v197 = v66;
  CFNumberRef number = DictCFNumber;
  *(void *)(a1 + 208) = _readDictCFData(theDict, (const void *)*MEMORY[0x1E4F2F658], 0);
  CFArrayRef v71 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F698], 0);
  CFArrayRef v72 = (const __CFArray *)_readDictCFArray(theDict, @"WarpRectilinear2", 0);
  CFArrayRef v205 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F690], 0);
  CFArrayRef v204 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F638], 0);
  CFArrayRef v73 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F648], 0);
  CFArrayRef v74 = (const __CFArray *)_readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F678], 0);
  FigCFDictionaryGetFloatIfPresent();
  FigCFDictionaryGetFloatIfPresent();
  FigCFDictionaryGetFloatIfPresent();
  float v232 = INFINITY;
  FigCFDictionaryGetFloatIfPresent();
  if (fabsf(v232) != INFINITY && (v232 < 0.0 || v232 > 1.0)) {
    goto LABEL_343;
  }
  uint64_t v75 = _readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F590], 0);
  double v196 = _readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F620], 0);
  CGFloat v195 = _readDictCFArray(theDict, (const void *)*MEMORY[0x1E4F2F628], 0);
  *(void *)(a1 + 64) = _readDictCFString(v34, (const void *)*MEMORY[0x1E4F2FD20], 0);
  *(void *)(a1 + 72) = _readDictCFString(v34, (const void *)*MEMORY[0x1E4F2FD30], 0);
  *(void *)(a1 + 216) = _readDictCFString(v34, (const void *)*MEMORY[0x1E4F2FD58], 0);
  if (v71)
  {
    HIDWORD(v234) = _unpackArrayOfDoubles(v71, 0x14u, (char *)(a1 + 768), (_DWORD *)(a1 + 928));
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    int v76 = *(_DWORD *)(a1 + 928);
    if (v76 != 8 && v76 != 20) {
      goto LABEL_239;
    }
  }
  if (v72)
  {
    int Count = CFArrayGetCount(v72);
    if (Count != 60 && Count != 22) {
      goto LABEL_239;
    }
    CFArrayRef v78 = v73;
    uint64_t v79 = 0;
    uint64_t v80 = (Count - 1);
    uint64_t v81 = a1 + 936;
    do
    {
      if (!FigCFArrayGetDoubleAtIndex()) {
        goto LABEL_239;
      }
      ++v79;
      v81 += 8;
    }
    while (v80 != v79);
    *(_DWORD *)(a1 + 1416) = v80;
    CFArrayRef v73 = v78;
    if (!FigCFArrayGetInt32AtIndex()) {
      goto LABEL_239;
    }
  }
  if (v74)
  {
    int v82 = CFArrayGetCount(v74);
    *(_DWORD *)(a1 + 2060) = v82;
    uint64_t v83 = malloc_type_malloc(4 * v82, 0x100004052888210uLL);
    *(void *)(a1 + 2064) = v83;
    HIDWORD(v234) = readFloatArray(v74, *(int *)(a1 + 2060), (uint64_t)v83);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
  }
  if (v205)
  {
    HIDWORD(v234) = _unpackArrayOfDoubles(v205, 0xEu, (char *)(a1 + 1424), (_DWORD *)(a1 + 1536));
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    if ((*(_DWORD *)(a1 + 1536) | 8) != 0xE) {
      goto LABEL_239;
    }
  }
  if (v204)
  {
    HIDWORD(v234) = _unpackArrayOfDoubles(v204, 7u, (char *)(a1 + 1544), (_DWORD *)(a1 + 1600));
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    if (*(_DWORD *)(a1 + 1600) != 7) {
      goto LABEL_239;
    }
  }
  if (v73)
  {
    HIDWORD(v234) = _unpackArrayOfDoubles(v73, 6u, (char *)(a1 + 712), (_DWORD *)(a1 + 760));
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    if ((*(_DWORD *)(a1 + 760) | 4) != 6) {
      goto LABEL_239;
    }
  }
  CFDictionaryRef v84 = (const __CFDictionary *)_readDictCFDict(theDict, @"ProfileGainTableMap");
  if (v84)
  {
    CFDictionaryRef v85 = v84;
    CFNumberRef v86 = (const __CFNumber *)_readDictCFNumber(v84, @"MapPointsV", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    CFNumberGetValue(v86, kCFNumberIntType, (void *)(a1 + 1880));
    CFNumberRef v87 = (const __CFNumber *)_readDictCFNumber(v85, @"MapPointsH", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    CFNumberGetValue(v87, kCFNumberIntType, (void *)(a1 + 1884));
    CFNumberRef v88 = (const __CFNumber *)_readDictCFNumber(v85, @"MapSpacingV", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    CFNumberGetValue(v88, kCFNumberDoubleType, (void *)(a1 + 1888));
    CFNumberRef v89 = (const __CFNumber *)_readDictCFNumber(v85, @"MapSpacingH", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    CFNumberGetValue(v89, kCFNumberDoubleType, (void *)(a1 + 1896));
    CFNumberRef v90 = (const __CFNumber *)_readDictCFNumber(v85, @"MapOriginV", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    CFNumberGetValue(v90, kCFNumberDoubleType, (void *)(a1 + 1904));
    CFNumberRef v91 = (const __CFNumber *)_readDictCFNumber(v85, @"MapOriginH", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    CFNumberGetValue(v91, kCFNumberDoubleType, (void *)(a1 + 1912));
    CFNumberRef v92 = (const __CFNumber *)_readDictCFNumber(v85, @"MapPointsN", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    CFNumberGetValue(v92, kCFNumberIntType, (void *)(a1 + 1920));
    CFArrayRef v93 = (const __CFArray *)_readDictCFArray(v85, @"MapInputWeights", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    CFArrayRef v94 = v93;
    if (CFArrayGetCount(v93) >= 1)
    {
      CFIndex v95 = 0;
      uint64_t v96 = a1 + 1924;
      while (FigCFArrayGetFloatAtIndex())
      {
        ++v95;
        v96 += 4;
        if (CFArrayGetCount(v94) <= v95) {
          goto LABEL_122;
        }
      }
      return HIDWORD(v234);
    }
LABEL_122:
    *(void *)(a1 + 1952) = _readDictCFData(v85, @"GainValues", (_DWORD *)&v234 + 1);
    *(unsigned char *)(a1 + 1944) = 0;
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
  }
  else
  {
    LODWORD(rect.origin.x) = 0;
    *(void *)(a1 + 1952) = _readDictCFData(theDict, @"ProfileGainTableMapPacked", &rect);
    *(unsigned char *)(a1 + 1944) = LODWORD(rect.origin.x) == 0;
  }
  CFDictionaryRef v97 = (const __CFDictionary *)_readDictCFDict(theDict, @"GainMap");
  if (v97)
  {
    CFDictionaryRef v98 = v97;
    _readDictCFNumber(v97, @"top", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 1960) = FigCFNumberGetSInt32();
    _readDictCFNumber(v98, @"bottom", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 1968) = FigCFNumberGetSInt32();
    _readDictCFNumber(v98, @"left", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 1964) = FigCFNumberGetSInt32();
    _readDictCFNumber(v98, @"right", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 1972) = FigCFNumberGetSInt32();
    _readDictCFNumber(v98, @"plane", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 1976) = FigCFNumberGetSInt32();
    _readDictCFNumber(v98, @"planes", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 1980) = FigCFNumberGetSInt32();
    _readDictCFNumber(v98, @"rowPitch", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 1984) = FigCFNumberGetSInt32();
    _readDictCFNumber(v98, @"colPitch", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 1988) = FigCFNumberGetSInt32();
    _readDictCFNumber(v98, @"mapsPointsV", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 1992) = FigCFNumberGetSInt32();
    _readDictCFNumber(v98, @"mapsPointsH", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 1996) = FigCFNumberGetSInt32();
    _readDictCFNumber(v98, @"mapsSpacingV", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    FigCFNumberGetFloat64();
    *(void *)(a1 + 2000) = v99;
    _readDictCFNumber(v98, @"mapsSpacingH", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    FigCFNumberGetFloat64();
    *(void *)(a1 + 2008) = v100;
    _readDictCFNumber(v98, @"mapOriginV", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    FigCFNumberGetFloat64();
    *(void *)(a1 + 2016) = v101;
    _readDictCFNumber(v98, @"mapOriginH", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    FigCFNumberGetFloat64();
    *(void *)(a1 + 2024) = v102;
    _readDictCFNumber(v98, @"mapPlanes", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    *(_DWORD *)(a1 + 2032) = FigCFNumberGetSInt32();
    *(void *)(a1 + 2040) = _readDictCFData(v98, @"gainData", (_DWORD *)&v234 + 1);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
  }
  if (fabsf(v232) == INFINITY)
  {
    *(void *)(a1 + 672) = 0;
    CFArrayRef v105 = v207;
  }
  else
  {
    unsigned int v103 = 0;
    float v104 = -v232;
    if (v232 >= 0.0) {
      float v104 = v232;
    }
    CFArrayRef v105 = v207;
    do
    {
      int v106 = 1 << v103;
      float v107 = (float)(1 << v103);
      if (v103 > 0x1D) {
        break;
      }
      ++v103;
    }
    while ((float)(v104 * v107) < 1073700000.0);
    *(_DWORD *)(a1 + 672) = llroundf(v232 * v107);
    *(_DWORD *)(a1 + 676) = v106;
  }
  unsigned int v108 = 0;
  float v109 = -*(float *)&v234;
  if (*(float *)&v234 >= 0.0) {
    float v109 = *(float *)&v234;
  }
  do
  {
    int v110 = 1 << v108;
    float v111 = (float)(1 << v108);
    if (v108 > 0x1D) {
      break;
    }
    ++v108;
  }
  while ((float)(v109 * v111) < 1073700000.0);
  unsigned int v112 = 0;
  *(_DWORD *)(a1 + 372) = llroundf(*(float *)&v234 * v111);
  *(_DWORD *)(a1 + 376) = v110;
  float v113 = -*((float *)&v233 + 1);
  if (*((float *)&v233 + 1) >= 0.0) {
    float v113 = *((float *)&v233 + 1);
  }
  do
  {
    int v114 = 1 << v112;
    float v115 = (float)(1 << v112);
    if (v112 > 0x1D) {
      break;
    }
    ++v112;
  }
  while ((float)(v113 * v115) < 1073700000.0);
  unsigned int v116 = 0;
  *(_DWORD *)(a1 + 380) = llroundf(*((float *)&v233 + 1) * v115);
  *(_DWORD *)(a1 + 384) = v114;
  float v117 = -*(float *)&v233;
  if (*(float *)&v233 >= 0.0) {
    float v117 = *(float *)&v233;
  }
  do
  {
    int v118 = 1 << v116;
    float v119 = (float)(1 << v116);
    if (v116 > 0x1D) {
      break;
    }
    ++v116;
  }
  while ((float)(v117 * v119) < 1073700000.0);
  *(_DWORD *)(a1 + 388) = llroundf(*(float *)&v233 * v119);
  *(_DWORD *)(a1 + 392) = v118;
  if (!v105)
  {
    if (v194)
    {
      HIDWORD(v234) = _floatArrayToRational(v194, a1 + 448, 2);
      if (HIDWORD(v234)) {
        return HIDWORD(v234);
      }
      goto LABEL_169;
    }
LABEL_197:
    int v122 = -16555;
LABEL_198:
    HIDWORD(v234) = v122;
    return HIDWORD(v234);
  }
  HIDWORD(v234) = _floatArrayToRational(v105, a1 + 396, 3);
  if (HIDWORD(v234)) {
    return HIDWORD(v234);
  }
  LODWORD(rect.origin.x) = 0;
  HIDWORD(v234) = _unpackArrayOfDoubles(v207, 3u, (char *)(a1 + 424), &rect);
  if (HIDWORD(v234)) {
    return HIDWORD(v234);
  }
  if (LODWORD(rect.origin.x) != 3) {
    goto LABEL_343;
  }
  *(unsigned char *)(a1 + 464) = 1;
LABEL_169:
  if (v206)
  {
    HIDWORD(v234) = _floatArrayToRational(v206, a1 + 468, 3);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    LODWORD(rect.origin.x) = 0;
    HIDWORD(v234) = _unpackArrayOfDoubles(v206, 3u, (char *)(a1 + 496), &rect);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    if (LODWORD(rect.origin.x) == 3)
    {
      *(unsigned char *)(a1 + 520) = 1;
      goto LABEL_174;
    }
LABEL_343:
    int v122 = -16550;
    goto LABEL_198;
  }
LABEL_174:
  HIDWORD(v234) = _floatArrayToRational(v202, a1 + 228, 9);
  if (HIDWORD(v234)) {
    return HIDWORD(v234);
  }
  HIDWORD(v234) = _floatArrayToRational(v201, a1 + 300, 9);
  if (HIDWORD(v234)) {
    return HIDWORD(v234);
  }
  if (v200 && v203)
  {
    HIDWORD(v234) = _floatArrayToRational(v200, a1 + 524, 9);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    HIDWORD(v234) = _floatArrayToRational(v203, a1 + 596, 9);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    if (!*(void *)(a1 + 680)) {
      *(void *)(a1 + 680) = *(void *)(a1 + 40);
    }
    if (!*(void *)(a1 + 688)) {
      *(void *)(a1 + 688) = *(void *)(a1 + 40);
    }
    *(unsigned char *)(a1 + 668) = 1;
  }
  CFNumberGetValue(number, kCFNumberShortType, (void *)(a1 + 224));
  CFNumberGetValue(v197, kCFNumberShortType, (void *)(a1 + 226));
  if (v75)
  {
    HIDWORD(v234) = _readInt32Array(v75, 4, a1 + 164);
    if (HIDWORD(v234)) {
      goto LABEL_344;
    }
    *(unsigned char *)(a1 + 180) = 1;
  }
  if (v196)
  {
    HIDWORD(v234) = _readInt32Array(v196, 2, a1 + 184);
    if (HIDWORD(v234)) {
      goto LABEL_344;
    }
    *(unsigned char *)(a1 + 192) = 1;
  }
  if (!v195) {
    goto LABEL_194;
  }
  HIDWORD(v234) = _readInt32Array(v195, 2, a1 + 196);
  if (HIDWORD(v234))
  {
LABEL_344:
    FigSignalErrorAt();
    return HIDWORD(v234);
  }
  *(unsigned char *)(a1 + 204) = 1;
LABEL_194:
  CFTypeID v120 = CFGetTypeID(cf);
  if (v120 == CFDateGetTypeID())
  {
    int64_t v121 = CFDateFormatterCreate(v43, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    CFDateFormatterSetFormat(v121, @"yyyy:MM:dd HH:mm:ss");
    *(void *)(a1 + 80) = CFDateFormatterCreateStringWithDate(v43, v121, (CFDateRef)cf);
    if (v121) {
      CFRelease(v121);
    }
  }
  else
  {
    CFTypeID v124 = CFGetTypeID(cf);
    if (v124 != CFStringGetTypeID())
    {
LABEL_239:
      int v122 = -16556;
      goto LABEL_198;
    }
    *(void *)(a1 + 80) = CFRetain(cf);
  }
  CFDataRef v125 = *(const __CFData **)(a1 + 208);
  if (v125)
  {
    BytePtr = (UInt8 *)CFDataGetBytePtr(v125);
    size_t Length = CFDataGetLength(*(CFDataRef *)(a1 + 208));
    if (!memchr(BytePtr, 0, Length)) {
      goto LABEL_239;
    }
  }
  if (v211)
  {
    *(void *)(a1 + 1640) = v211;
    *(_DWORD *)(a1 + 1656) = v209;
    HIDWORD(v234) = _parseOutWidthAndHeightFromJpeg(a1);
    if (HIDWORD(v234)) {
      goto LABEL_239;
    }
  }
  *(uint64x2_t *)(a1 + 112) = vcvtq_u64_f64(v221);
  if (v213)
  {
    CFIndex v128 = CFDataGetBytePtr(v213);
    *(void *)(a1 + 100) = *(void *)(v128 + 12);
    OSType PixelFormatType = *((_DWORD *)v128 + 2);
  }
  else
  {
    *(int32x2_t *)(a1 + 100) = vmovn_s64(vcvtq_s64_f64(v222));
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v212);
  }
  if (!*(unsigned char *)(a1 + 4))
  {
    *(_DWORD *)(a1 + 136) = 16;
    *(_DWORD *)(a1 + 156) = 16;
    if (HIBYTE(v231)) {
      unsigned int v133 = 4;
    }
    else {
      unsigned int v133 = 2;
    }
    *(_DWORD *)(a1 + 1620) = v133;
    int32x2_t v132 = vrev64_s32(vshl_s32(*(int32x2_t *)(a1 + 128), vneg_s32(vdup_n_s32(v133))));
    goto LABEL_217;
  }
  Usedunint64_t BitDepthForPixelFormat = CMPhotoGetUsedBitDepthForPixelFormat(PixelFormatType);
  *(_DWORD *)(a1 + 136) = UsedBitDepthForPixelFormat;
  if (!UsedBitDepthForPixelFormat) {
    goto LABEL_35;
  }
  int v131 = *(_DWORD *)(a1 + 8);
  if (v131 == 2)
  {
    *(_DWORD *)(a1 + 156) = 8;
    int32x2_t v132 = (int32x2_t)255;
LABEL_217:
    *(int32x2_t *)(a1 + 148) = v132;
    goto LABEL_235;
  }
  unsigned int v134 = *(_DWORD *)(a1 + 132);
  if (PixelFormatType == 1751527984 && (int)(34 - __clz(v134)) < UsedBitDepthForPixelFormat)
  {
    unsigned int v134 = ~(-1 << UsedBitDepthForPixelFormat);
    *(_DWORD *)(a1 + 132) = v134;
  }
  int v135 = *(_DWORD *)(a1 + 128);
  *(_DWORD *)(a1 + 148) = v134;
  *(_DWORD *)(a1 + 152) = v135;
  *(_DWORD *)(a1 + 156) = UsedBitDepthForPixelFormat;
  if (v131 == 5 || v131 == 3)
  {
    LODWORD(rect.origin.x) = 16;
    if (_readDictCFArray(theDict, @"BitsPerSample", 0)) {
      FigCFArrayGetInt32AtIndex();
    }
    if (SLODWORD(rect.origin.x) >= *(_DWORD *)(a1 + 136)) {
      int x_low = *(_DWORD *)(a1 + 136);
    }
    else {
      int x_low = LODWORD(rect.origin.x);
    }
    *(_DWORD *)(a1 + 136) = x_low;
    if (x_low >= (int)CMPhotoDNGDefaultBitDepth()) {
      int v137 = CMPhotoDNGDefaultBitDepth();
    }
    else {
      int v137 = *(_DWORD *)(a1 + 136);
    }
    *(_DWORD *)(a1 + 156) = v137;
    char v138 = v225;
    if (v225)
    {
      *(_DWORD *)(a1 + 156) = v225;
      if (!*(unsigned char *)(a1 + 24)) {
        *(_DWORD *)(a1 + 148) = ~(-1 << v138);
      }
    }
    if (!*(_DWORD *)(a1 + 136)) {
      goto LABEL_35;
    }
  }
LABEL_235:
  if (*(unsigned char *)(a1 + 100) & 1) != 0 || (*(unsigned char *)(a1 + 104)) {
    goto LABEL_239;
  }
  uint64_t v139 = (int *)(a1 + 1624);
  if (*(unsigned char *)(a1 + 4))
  {
    *uint64_t v139 = 0;
    int v140 = HIDWORD(v234);
  }
  else
  {
    int v140 = _cfaPatternFromPixelFormat(PixelFormatType, v139);
    HIDWORD(v234) = v140;
  }
  if (v140) {
    return HIDWORD(v234);
  }
  CFTypeRef v141 = _copyFilteredImageProperties(metadata);
  *(void *)(a1 + 1608) = v141;
  if (v141)
  {
    uint64_t v142 = (CFDictionaryRef *)(a1 + 1608);
    HIDWORD(v234) = CMPhotoUpdateImageProperties((CFDictionaryRef *)(a1 + 1608), 0, 0, v222.f64[0], v222.f64[1]);
    if (HIDWORD(v234)) {
      return HIDWORD(v234);
    }
    if (*v142)
    {
      *(unsigned char *)(a1 + 1616) = CFDictionaryContainsKey(*v142, (const void *)*MEMORY[0x1E4F2FA18]);
      if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 1608), (const void *)*MEMORY[0x1E4F2F800])) {
        BOOL v143 = 1;
      }
      else {
        BOOL v143 = CFDictionaryContainsKey(*v142, (const void *)*MEMORY[0x1E4F2FC20]) != 0;
      }
      *(unsigned char *)(a1 + 1617) = v143;
    }
  }
  *(_DWORD *)(a1 + 1660) = 0;
  *(void *)(a1 + 1664) = 0;
  if (a5)
  {
    if (CFArrayGetCount(a5) >= 1)
    {
      int v144 = CFArrayGetCount(a5);
      *(_DWORD *)(a1 + 1660) = v144;
      uint64_t v145 = malloc_type_calloc(v144, 0x40uLL, 0x1060040C5BCF64AuLL);
      *(void *)(a1 + 1664) = v145;
      if (!v145) {
        goto LABEL_35;
      }
    }
    if (*(int *)(a1 + 1660) >= 1)
    {
      CFIndex v146 = 0;
      uint64_t v147 = (int *)MEMORY[0x1E4F1EBA8];
      int v208 = (int)v43;
      int v148 = *MEMORY[0x1E4F1EBA8];
      while (1)
      {
        if (v148 == 1) {
          kdebug_trace();
        }
        CFTypeRef v237 = 0;
        CFDictionaryRef v238 = 0;
        CFDictionaryRef v149 = (const __CFDictionary *)CFArrayGetValueAtIndex(a5, v146);
        uint64_t v150 = (__CVBuffer *)CFDictionaryGetValue(v149, @"AuxPixelBuffer");
        if (!v150
          || (uint64_t v151 = v150, (v152 = (const __CFString *)CFDictionaryGetValue(v149, @"AuxImageType")) == 0)
          || (CFStringRef v153 = v152, (v154 = (const CGImageMetadata *)CFDictionaryGetValue(v149, @"AuxMetadata")) == 0))
        {
          XMPuint64_t Data = FigSignalErrorAt();
          goto LABEL_298;
        }
        metadataa = v154;
        CFDictionaryRef theDicta = (const __CFDictionary *)CFDictionaryGetValue(v149, @"AuxOptions");
        uint64_t v155 = *(void *)(a1 + 1664);
        int v156 = (int32x2_t *)(v155 + (v146 << 6));
        v156[7].i32[1] = 0xFFFF;
        v156[5].i32[0] = 8;
        v156[3].i32[0] = *(_DWORD *)(a1 + 8);
        int v157 = (int *)&v156[3];
        int v158 = CMPhotoCreateCompressionCompatiblePixelBuffer(v151, 0, 8u, 0, 0, (CFTypeRef *)&v237, &v238);
        if (v158) {
          goto LABEL_325;
        }
        v156[4].i32[0] = CVPixelBufferGetWidth(v237);
        v156[4].i32[1] = CVPixelBufferGetHeight(v237);
        if (CVPixelBufferGetPixelFormatType(v237) != 1278226488) {
          goto LABEL_324;
        }
        if (FigCFEqual()) {
          break;
        }
        CFDictionaryRef v160 = theDicta;
        if (FigCFEqual())
        {
          int v159 = 1;
          goto LABEL_265;
        }
        if (!FigCFEqual()
          && !FigCFEqual()
          && !FigCFEqual()
          && !FigCFEqual())
        {
          v239.length = CFStringGetLength(@"kCGImageAuxiliaryDataType");
          v239.location = 0;
          if (CFStringCompareWithOptions(v153, @"kCGImageAuxiliaryDataType", v239, 0))
          {
            rect.origin.CGFloat x = 0.0;
            int CMPhotoAuxiliaryImageTypeAndFinalURNFromURN = CMPhotoGetCMPhotoAuxiliaryImageTypeAndFinalURNFromURN((uint64_t)v153, (__CFString **)&rect);
            *(_DWORD *)(v155 + (v146 << 6) + 28) = CMPhotoAuxiliaryImageTypeAndFinalURNFromURN;
            if (CMPhotoAuxiliaryImageTypeAndFinalURNFromURN)
            {
              CGFloat x = rect.origin.x;
              CFDictionaryRef v160 = theDicta;
              if (*(void *)&rect.origin.x) {
                CGFloat x = COERCE_DOUBLE(CFRetain(*(CFTypeRef *)&rect.origin.x));
              }
              BOOL v171 = 0;
              *(CGFloat *)(v155 + (v146 << 6) + 16) = x;
LABEL_277:
              if (!v160) {
                goto LABEL_288;
              }
              CFDictionaryRef v172 = (const __CFDictionary *)CFDictionaryGetValue(v160, @"SourceCropRect");
              if (v172)
              {
                CFDictionaryRef v173 = v172;
                rect.origin.CGFloat x = CMPhotoGetPixelBufferCLAPAsRect(v237);
                rect.origin.y = v174;
                rect.size.width = v175;
                rect.size.height = v176;
                CGSize v177 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
                v235.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
                v235.size = v177;
                if (CGRectMakeWithDictionaryRepresentation(v173, &v235))
                {
                  int v158 = CMPhotoApplyCropRectToRect(&rect.origin.x, v235.origin.x, v235.origin.y, v235.size.width, v235.size.height);
                  if (!v158)
                  {
                    v156[4] = vmovn_s64((int64x2_t)vcvtq_u64_f64(vrndaq_f64((float64x2_t)rect.size)));
                    goto LABEL_282;
                  }
LABEL_325:
                  int v182 = v158;
                  goto LABEL_326;
                }
              }
LABEL_282:
              CFDictionaryRef v160 = theDicta;
              CMPhotoCFDictionaryGetIntIfPresent(theDicta, @"CompressionMode", v157);
              LODWORD(rect.origin.x) = 0;
              if (!FigCFDictionaryGetFloatIfPresent()) {
                goto LABEL_288;
              }
              if (*(float *)&rect.origin.x >= 0.0 && *(float *)&rect.origin.x <= 1.0)
              {
                BOOL v171 = *(float *)&rect.origin.x == 1.0;
LABEL_288:
                int v179 = *v157;
                if ((*v157 - 2) < 2)
                {
LABEL_291:
                  if (v171) {
                    int v180 = 3;
                  }
                  else {
                    int v180 = 2;
                  }
                  *int v157 = v180;
                  goto LABEL_295;
                }
                if (v179 == 5)
                {
                  int JPEGXLFromPixelBuffer = _createJPEGXLFromPixelBuffer(v237, (uint64_t)v160, (CFDataRef *)(v155 + (v146 << 6)));
                }
                else
                {
                  if (!v179) {
                    goto LABEL_291;
                  }
LABEL_295:
                  int JPEGXLFromPixelBuffer = _createJPEGFromPixelBuffer(v237, v160, v171);
                }
                int v182 = JPEGXLFromPixelBuffer;
                uint64_t v147 = (int *)MEMORY[0x1E4F1EBA8];
                if (JPEGXLFromPixelBuffer) {
                  goto LABEL_299;
                }
                XMPuint64_t Data = CMPhotoAuxiliaryImageMetadataCreateXMPData(v208, metadataa, v238, *(_DWORD *)(v155 + (v146 << 6) + 28), *(__CFString **)(v155 + (v146 << 6) + 16), (CFDataRef *)(v155 + (v146 << 6) + 8));
LABEL_298:
                int v182 = XMPData;
                goto LABEL_299;
              }
            }
          }
          else
          {
            rect.origin.CGFloat x = 0.0;
            CFIndex v187 = v155 + (v146 << 6);
            CMPhotoGetCMPhotoAuxiliaryImageTypeFromCGImageAuxiliaryDataType((uint64_t)v153, (__CFString **)&rect, (int *)(v187 + 28));
            if (*(void *)&rect.origin.x)
            {
              BOOL v171 = 0;
              *(void *)(v187 + 16) = CFRetain(*(CFTypeRef *)&rect.origin.x);
              CFDictionaryRef v160 = theDicta;
              goto LABEL_277;
            }
          }
LABEL_324:
          int v158 = FigSignalErrorAt();
          goto LABEL_325;
        }
        int v184 = CMPhotoGetCMPhotoAuxiliaryImageTypeAndFinalURNFromURN((uint64_t)v153, 0);
        *(_DWORD *)(v155 + (v146 << 6) + 28) = v184;
        if (!v184) {
          goto LABEL_324;
        }
LABEL_266:
        LODWORD(rect.origin.x) = 0;
        LODWORD(v235.origin.x) = 0;
        if (CMPhotoCFDictionaryGetFloatIfPresent(v238, @"FloatMinValue", &rect)
          && CMPhotoCFDictionaryGetFloatIfPresent(v238, @"FloatMaxValue", &v235))
        {
          unsigned int v161 = 0;
          float v162 = -*(float *)&rect.origin.x;
          if (*(float *)&rect.origin.x >= 0.0) {
            float v162 = *(float *)&rect.origin.x;
          }
          do
          {
            int v163 = 1 << v161;
            float v164 = (float)(1 << v161);
            if (v161 > 0x1D) {
              break;
            }
            ++v161;
          }
          while ((float)(v162 * v164) < 1073700000.0);
          unsigned int v165 = 0;
          CFIndex v166 = v155 + (v146 << 6);
          *(_DWORD *)(v166 + 44) = llroundf(*(float *)&rect.origin.x * v164);
          *(_DWORD *)(v166 + 48) = v163;
          float v167 = -*(float *)&v235.origin.x;
          if (*(float *)&v235.origin.x >= 0.0) {
            float v167 = *(float *)&v235.origin.x;
          }
          do
          {
            int v168 = 1 << v165;
            float v169 = (float)(1 << v165);
            if (v165 > 0x1D) {
              break;
            }
            ++v165;
          }
          while ((float)(v167 * v169) < 1073700000.0);
          CFIndex v170 = v155 + (v146 << 6);
          *(_DWORD *)(v170 + 52) = llroundf(*(float *)&v235.origin.x * v169);
          *(_DWORD *)(v170 + 56) = v168;
          BOOL v171 = 1;
          goto LABEL_277;
        }
        int v182 = -16557;
LABEL_326:
        uint64_t v147 = (int *)MEMORY[0x1E4F1EBA8];
LABEL_299:
        if (v237) {
          CFRelease(v237);
        }
        if (v238) {
          CFRelease(v238);
        }
        HIDWORD(v234) = v182;
        int v148 = *v147;
        if (*v147 == 1)
        {
          kdebug_trace();
          int v182 = HIDWORD(v234);
          int v148 = *v147;
        }
        if (v182) {
          return HIDWORD(v234);
        }
        if (++v146 >= *(int *)(a1 + 1660)) {
          goto LABEL_327;
        }
      }
      int v159 = 2;
      CFDictionaryRef v160 = theDicta;
LABEL_265:
      *(_DWORD *)(v155 + (v146 << 6) + 28) = v159;
      goto LABEL_266;
    }
  }
LABEL_327:
  int v188 = DWORD2(v210);
  if (v210 == 0)
  {
    _tileDescriptionInitialize(a1);
    int v192 = *(_DWORD *)(a1 + 1636);
    int v188 = *(_DWORD *)(a1 + 1632);
    int v191 = *(_DWORD *)(a1 + 1628);
    int v189 = *(_DWORD *)(a1 + 100);
    int v190 = *(_DWORD *)(a1 + 104);
  }
  else
  {
    int v189 = *(_DWORD *)(a1 + 100);
    int v190 = *(_DWORD *)(a1 + 104);
    if (v189 >= (int)v210) {
      int v191 = v210;
    }
    else {
      int v191 = *(_DWORD *)(a1 + 100);
    }
    *(_DWORD *)(a1 + 1628) = v191;
    if (v190 < SDWORD2(v210)) {
      int v188 = v190;
    }
    *(_DWORD *)(a1 + 1632) = v188;
    int v192 = (v190 + v188 - 1) / v188 * ((v189 + v191 - 1) / v191);
    *(_DWORD *)(a1 + 1636) = v192;
  }
  if (v188 * v192 * v191 < v189 * v190) {
    goto LABEL_35;
  }
  HIDWORD(v234) = _prepareAnalogBalance(a1);
  if (!HIDWORD(v234) && *(unsigned char *)(a1 + 4) && *(unsigned char *)(a1 + 24))
  {
    uint64_t v193 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
    HIDWORD(v234) = _applyLossyJPEGPerceptualCurve(a1, v212);
    if (*v193 == 1) {
      kdebug_trace();
    }
  }
  return HIDWORD(v234);
}

uint64_t _cmphotoDNGWriterIFDBegin(uint64_t a1, int a2)
{
  _cmphotoDNGWriterReleaseTagStorage((char **)a1);
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), zero, 2);
  float v4 = (unsigned int *)&CFDataGetMutableBytePtr(*(CFMutableDataRef *)(a1 + 40))[a2];
  unsigned int Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  CMPhotoDNGWrite32(v4, Length, *(unsigned __int8 *)(a1 + 48));
  *(void *)(a1 + 8) = 20;
  CFAllocatorRef v6 = malloc_type_calloc(0x14uLL, 0x28uLL, 0x106004007C5E651uLL);
  *(void *)a1 = v6;
  if (v6) {
    return 0;
  }
  else {
    return 4294950745;
  }
}

void _addRawImageTags(char **a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  CFMutableDataRef theData = 0;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  LODWORD(__dst[0]) = 0;
  _ifdAddTag4(a1, 254, 4u, 1uLL, (__int16 *)__dst);
  LODWORD(__dst[0]) = *(_DWORD *)(a2 + 100);
  _ifdAddTag4(a1, 256, 4u, 1uLL, (__int16 *)__dst);
  LODWORD(__dst[0]) = *(_DWORD *)(a2 + 104);
  _ifdAddTag4(a1, 257, 4u, 1uLL, (__int16 *)__dst);
  if (*(unsigned char *)(a2 + 4))
  {
    LOWORD(__dst[0]) = *(_WORD *)(a2 + 156);
    WORD1(__dst[0]) = __dst[0];
    WORD2(__dst[0]) = __dst[0];
    _ifdAddTag4(a1, 258, 3u, 3uLL, (__int16 *)__dst);
    int v8 = *(_DWORD *)(a2 + 8) - 1;
    if (v8 > 4) {
      int v9 = 0;
    }
    else {
      int v9 = dword_1AB9E38A4[v8];
    }
    int __src = v9;
    _ifdAddTag4(a1, 259, 3u, 1uLL, (__int16 *)&__src);
    int __src = 34892;
    _ifdAddTag4(a1, 262, 3u, 1uLL, (__int16 *)&__src);
    int __src = 3;
    p_src = (__int16 *)&__src;
  }
  else
  {
    LODWORD(__dst[0]) = 16;
    _ifdAddTag4(a1, 258, 3u, 1uLL, (__int16 *)__dst);
    int v10 = *(_DWORD *)(a2 + 8) - 1;
    if (v10 > 4) {
      int v11 = 0;
    }
    else {
      int v11 = dword_1AB9E38A4[v10];
    }
    LODWORD(__dst[0]) = v11;
    _ifdAddTag4(a1, 259, 3u, 1uLL, (__int16 *)__dst);
    LODWORD(__dst[0]) = 32803;
    _ifdAddTag4(a1, 262, 3u, 1uLL, (__int16 *)__dst);
    LODWORD(__dst[0]) = 1;
    p_src = (__int16 *)__dst;
  }
  _ifdAddTag4(a1, 277, 3u, 1uLL, p_src);
  LODWORD(__dst[0]) = 1;
  _ifdAddTag4(a1, 284, 3u, 1uLL, (__int16 *)__dst);
  LODWORD(__dst[0]) = *(_DWORD *)(a2 + 1628);
  _ifdAddTag4(a1, 322, 4u, 1uLL, (__int16 *)__dst);
  LODWORD(__dst[0]) = *(_DWORD *)(a2 + 1632);
  _ifdAddTag4(a1, 323, 4u, 1uLL, (__int16 *)__dst);
  *a3 = _ifdAddTag4(a1, 324, 4u, *(unsigned int *)(a2 + 1636), 0);
  *a4 = _ifdAddTag4(a1, 325, 4u, *(unsigned int *)(a2 + 1636), 0);
  if (*(unsigned char *)(a2 + 4))
  {
    LOWORD(__dst[0]) = *(_WORD *)(a2 + 152);
    WORD1(__dst[0]) = __dst[0];
    WORD2(__dst[0]) = __dst[0];
    LOWORD(__src) = *(_WORD *)(a2 + 148);
    HIWORD(__src) = __src;
    __int16 v54 = __src;
    _ifdAddTag4(a1, 50714, 3u, 3uLL, (__int16 *)__dst);
    _ifdAddTag4(a1, 50717, 3u, 3uLL, (__int16 *)&__src);
    if (*(_DWORD *)(a2 + 144) != 1) {
      goto LABEL_15;
    }
    int v58 = 1;
    CFAllocatorRef v13 = (__int16 *)&v58;
    CFAllocatorRef v14 = a1;
    __int16 v15 = -14426;
    unsigned int v16 = 4;
  }
  else
  {
    _ifdAddTag4(a1, 50713, 3u, 2uLL, _addRawImageTags_blackLevelRepeatDim);
    LODWORD(__dst[0]) = *(_DWORD *)(a2 + 152);
    _ifdAddTag4(a1, 50714, 3u, 1uLL, (__int16 *)__dst);
    LODWORD(__dst[0]) = *(_DWORD *)(a2 + 148);
    CFAllocatorRef v13 = (__int16 *)__dst;
    CFAllocatorRef v14 = a1;
    __int16 v15 = -14819;
    unsigned int v16 = 3;
  }
  _ifdAddTag4(v14, v15, v16, 1uLL, v13);
LABEL_15:
  if (!*(unsigned char *)(a2 + 4))
  {
    _ifdAddTag4(a1, 33421, 3u, 2uLL, _addRawImageTags_CFARepeatPatternDim);
    _ifdAddTag4(a1, 33422, 1u, 4uLL, (__int16 *)(a2 + 1624));
    _ifdAddTag4(a1, 50710, 1u, 3uLL, _addRawImageTags_CFAPlaneColor);
    if (*(unsigned char *)(a2 + 180)) {
      _ifdAddTag4(a1, 50829, 4u, 4uLL, (__int16 *)(a2 + 164));
    }
    if (*(unsigned char *)(a2 + 192)) {
      _ifdAddTag4(a1, 50719, 4u, 2uLL, (__int16 *)(a2 + 184));
    }
    if (*(unsigned char *)(a2 + 204)) {
      _ifdAddTag4(a1, 50720, 4u, 2uLL, (__int16 *)(a2 + 196));
    }
  }
  float64_t v17 = *(__int16 **)(a2 + 2048);
  if (v17) {
    _ifdAddTag4(a1, 50712, 3u, *(unsigned int *)(a2 + 2056), v17);
  }
  if (*(_DWORD *)(a2 + 8) == 2)
  {
    if (_cmphotoDNGOPCodeWriterOpen(&theData)) {
      goto LABEL_118;
    }
    if (*(int *)(a2 + 1876) >= 1)
    {
      uint64_t v18 = 0;
      uint64_t v19 = 1672;
      while (!_cmphotoDNGOPCodeWriterStartOPCode((uint64_t)&theData, 8u, 0))
      {
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, 0)) {
          break;
        }
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, 0)) {
          break;
        }
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 104))) {
          break;
        }
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 100))) {
          break;
        }
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, v18)) {
          break;
        }
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, 1u)) {
          break;
        }
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, 1u)) {
          break;
        }
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, 1u)) {
          break;
        }
        uint64_t v20 = a2 + 4 * v18;
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(v20 + 1864) - 1)) {
          break;
        }
        memset(__dst, 0, sizeof(__dst));
        uint64_t v21 = *(unsigned int *)(v20 + 1864);
        if ((int)v21 >= 1) {
          memcpy(__dst, (const void *)(a2 + v19), 8 * v21);
        }
        if (_cmphotoDNGOPCodeWriterWriteDoubles((uint64_t)&theData, (double *)__dst, v21)
          || _cmphotoDNGOPCodeWriterEndOPCode((uint64_t)&theData))
        {
          break;
        }
        ++v18;
        v19 += 64;
        if (v18 >= *(int *)(a2 + 1876)) {
          goto LABEL_43;
        }
      }
      goto LABEL_118;
    }
LABEL_43:
    *(void *)&__dst[0] = 0;
    _cmphotoDNGOPCodeWriterCloseAndCopyData((uint64_t)&theData, (CFMutableDataRef *)__dst);
    if (*(void *)&__dst[0])
    {
      size_t Length = CFDataGetLength(*(CFDataRef *)&__dst[0]);
      BytePtr = (__int16 *)CFDataGetBytePtr(*(CFDataRef *)&__dst[0]);
      _ifdAddTag4(a1, 51009, 7u, Length, BytePtr);
      if (*(void *)&__dst[0]) {
        CFRelease(*(CFTypeRef *)&__dst[0]);
      }
    }
  }
  int v24 = *(_DWORD *)(a2 + 928);
  if (v24 == 20) {
    unsigned int v25 = 3;
  }
  else {
    unsigned int v25 = v24 == 8;
  }
  int v26 = *(_DWORD *)(a2 + 1416);
  unsigned int v27 = v24 == 8 || v24 == 20;
  if (v26 == 59) {
    unsigned int v28 = 3;
  }
  else {
    unsigned int v28 = v26 == 21;
  }
  int v29 = *(_DWORD *)(a2 + 1536);
  if (v29 == 14) {
    unsigned int v30 = 3;
  }
  else {
    unsigned int v30 = v29 == 6;
  }
  if ((v27 & 1) != 0
    || v26 == 59
    || v26 == 21
    || v29 == 14
    || v29 == 6
    || *(_DWORD *)(a2 + 1600)
    || *(void *)(a2 + 2040))
  {
    if (_cmphotoDNGOPCodeWriterOpen(&theData)
      || (v26 == 59 || v26 == 21)
      && _cmphotoDNGOPCodeWriterWriteStandardOPCode((uint64_t)&theData, 0xEu, v28, (double *)(a2 + 936), *(_DWORD *)(a2 + 1416), v27, *(_DWORD *)(a2 + 1420)))
    {
      goto LABEL_118;
    }
    if ((v24 == 20 || v24 == 8)
      && _cmphotoDNGOPCodeWriterWriteStandardOPCode((uint64_t)&theData, 1u, v25, (double *)(a2 + 768), *(_DWORD *)(a2 + 928), 0, 0))
    {
      goto LABEL_118;
    }
    if ((v29 | 8) == 0xE
      && _cmphotoDNGOPCodeWriterWriteStandardOPCode((uint64_t)&theData, 2u, v30, (double *)(a2 + 1424), *(_DWORD *)(a2 + 1536), 0, 0))
    {
      goto LABEL_118;
    }
    unsigned int v31 = *(_DWORD *)(a2 + 1600);
    if (v31)
    {
      if (_cmphotoDNGOPCodeWriterWriteStandardOPCode((uint64_t)&theData, 3u, 0, (double *)(a2 + 1544), v31, 0, 0))goto LABEL_118; {
    }
      }
    CFDataRef v32 = *(const __CFData **)(a2 + 2040);
    if (v32)
    {
      uint64_t v33 = (*(_DWORD *)(a2 + 1996) * *(_DWORD *)(a2 + 1992) * *(_DWORD *)(a2 + 2032));
      if (CFDataGetLength(v32) != 4 * v33
        || _cmphotoDNGOPCodeWriterOpen(&theData)
        || _cmphotoDNGOPCodeWriterStartOPCode((uint64_t)&theData, 9u, 0)
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1960))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1964))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1968))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1972))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1976))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1980))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1984))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1988))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1992))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1996))
        || _cmphotoDNGOPCodeWriterWriteDoubles((uint64_t)&theData, (double *)(a2 + 2000), 1u)
        || _cmphotoDNGOPCodeWriterWriteDoubles((uint64_t)&theData, (double *)(a2 + 2008), 1u)
        || _cmphotoDNGOPCodeWriterWriteDoubles((uint64_t)&theData, (double *)(a2 + 2016), 1u)
        || _cmphotoDNGOPCodeWriterWriteDoubles((uint64_t)&theData, (double *)(a2 + 2024), 1u)
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 2032)))
      {
        goto LABEL_118;
      }
      CFDictionaryRef v34 = CFDataGetBytePtr(*(CFDataRef *)(a2 + 2040));
      if (v33)
      {
        CFStringRef v35 = (unsigned int *)v34;
        char v36 = theData;
        int v37 = HIDWORD(v56);
        int v38 = v57;
        do
        {
          if (v37)
          {
            LODWORD(__dst[0]) = bswap32(*v35);
            CFDataAppendBytes(v36, (const UInt8 *)__dst, 4);
            v38 += 4;
          }
          else if (FigSignalErrorAt())
          {
            goto LABEL_118;
          }
          ++v35;
          --v33;
        }
        while (v33);
        LODWORD(v57) = v38;
      }
      if (_cmphotoDNGOPCodeWriterEndOPCode((uint64_t)&theData)) {
        goto LABEL_118;
      }
    }
    *(void *)&__dst[0] = 0;
    _cmphotoDNGOPCodeWriterCloseAndCopyData((uint64_t)&theData, (CFMutableDataRef *)__dst);
    if (*(void *)&__dst[0])
    {
      size_t v39 = CFDataGetLength(*(CFDataRef *)&__dst[0]);
      CFStringRef v40 = (__int16 *)CFDataGetBytePtr(*(CFDataRef *)&__dst[0]);
      _ifdAddTag4(a1, 51022, 7u, v39, v40);
      if (*(void *)&__dst[0]) {
        CFRelease(*(CFTypeRef *)&__dst[0]);
      }
    }
  }
  CFDataRef v41 = *(const __CFData **)(a2 + 1952);
  if (v41)
  {
    if (*(unsigned char *)(a2 + 1944))
    {
      size_t v42 = CFDataGetLength(v41);
      CFAllocatorRef v43 = (__int16 *)CFDataGetBytePtr(*(CFDataRef *)(a2 + 1952));
      _ifdAddTag4(a1, 52525, 7u, v42, v43);
    }
    else
    {
      uint64_t v44 = (*(_DWORD *)(a2 + 1884) * *(_DWORD *)(a2 + 1880) * *(_DWORD *)(a2 + 1920));
      uint64_t v45 = (4 * v44);
      if (CFDataGetLength(v41) != v45) {
        goto LABEL_118;
      }
      CFMutableArrayRef Mutable = CFDataCreateMutable(0, (v45 + 64));
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1880));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1884));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      *(void *)&__dst[0] = bswap64(*(void *)(a2 + 1888));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 8);
      *(void *)&__dst[0] = bswap64(*(void *)(a2 + 1896));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 8);
      *(void *)&__dst[0] = bswap64(*(void *)(a2 + 1904));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 8);
      *(void *)&__dst[0] = bswap64(*(void *)(a2 + 1912));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 8);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1920));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1924));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1928));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1932));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1936));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1940));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      CFNumberRef v47 = CFDataGetBytePtr(*(CFDataRef *)(a2 + 1952));
      if (v44)
      {
        CFAllocatorRef v48 = (unsigned int *)v47;
        do
        {
          unsigned int v49 = *v48++;
          LODWORD(__dst[0]) = bswap32(v49);
          CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
          --v44;
        }
        while (v44);
      }
      size_t v50 = CFDataGetLength(Mutable);
      v51 = (__int16 *)CFDataGetBytePtr(Mutable);
      _ifdAddTag4(a1, 52525, 7u, v50, v51);
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
  }
  size_t v52 = *(unsigned int *)(a2 + 760);
  if ((int)v52 >= 1) {
    _ifdAddTag4(a1, 51041, 0xCu, v52, (__int16 *)(a2 + 712));
  }
LABEL_118:
  if (theData) {
    CFRelease(theData);
  }
}

uint64_t _cmphotoDNGWriterIFDEnd(char **a1)
{
  unsigned int v2 = *((_DWORD *)a1 + 3);
  *(_WORD *)bytes = v2;
  if (*((unsigned char *)a1 + 48)) {
    *(_WORD *)bytes = bswap32(v2) >> 16;
  }
  CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 2);
  qsort(*a1, *((unsigned int *)a1 + 3), 0x28uLL, (int (__cdecl *)(const void *, const void *))_compareTagKeysAscending);
  int Length = CFDataGetLength((CFDataRef)a1[5]);
  int v4 = *((_DWORD *)a1 + 3);
  if (v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    unsigned int v7 = Length + 12 * v4 + 4;
    do
    {
      int v8 = *a1;
      *(_WORD *)bytes = 0;
      unsigned int v9 = *(unsigned __int16 *)&v8[v5];
      *(_WORD *)bytes = *(_WORD *)&v8[v5];
      if (*((unsigned char *)a1 + 48)) {
        *(_WORD *)bytes = __rev16(v9);
      }
      CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 2);
      *(_WORD *)bytes = 0;
      unsigned int v10 = *(unsigned __int16 *)&v8[v5 + 2];
      *(_WORD *)bytes = *(_WORD *)&v8[v5 + 2];
      if (*((unsigned char *)a1 + 48)) {
        *(_WORD *)bytes = __rev16(v10);
      }
      CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 2);
      *(_DWORD *)bytes = 0;
      unsigned int v11 = *(_DWORD *)&v8[v5 + 4];
      *(_DWORD *)bytes = v11;
      if (*((unsigned char *)a1 + 48)) {
        *(_DWORD *)bytes = bswap32(v11);
      }
      CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 4);
      uint64_t v12 = (const UInt8 *)&v8[v5];
      if (*(_DWORD *)&v8[v5 + 28] > 4u)
      {
        *(_DWORD *)&a1[3][4 * *((unsigned int *)v12 + 6)] = v7;
        *(_DWORD *)bytes = v7;
        if (*((unsigned char *)a1 + 48)) {
          *(_DWORD *)bytes = bswap32(v7);
        }
        CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 4);
        v7 += *(_DWORD *)&v8[v5 + 32];
      }
      else
      {
        *(_DWORD *)&a1[3][4 * *((unsigned int *)v12 + 6)] = CFDataGetLength((CFDataRef)a1[5]);
        CFDataAppendBytes((CFMutableDataRef)a1[5], v12 + 8, 4);
      }
      ++v6;
      v5 += 40;
    }
    while (v6 < *((unsigned int *)a1 + 3));
  }
  *(_DWORD *)bytes = 0;
  CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 4);
  if (*((_DWORD *)a1 + 3))
  {
    uint64_t v13 = 0;
    for (unint64_t i = 0; i < *((unsigned int *)a1 + 3); ++i)
    {
      __int16 v15 = *a1;
      unsigned int v16 = &(*a1)[v13];
      if (*((_DWORD *)v16 + 7) >= 5u)
      {
        int v17 = *(_DWORD *)&a1[3][4 * *((unsigned int *)v16 + 6)];
        if (v17 != CFDataGetLength((CFDataRef)a1[5])) {
          return FigSignalErrorAt();
        }
        uint64_t v18 = (CFDataRef *)&v15[v13];
        CFDataRef v19 = *(const __CFData **)&v15[v13 + 16];
        uint64_t v20 = (__CFData *)a1[5];
        if (v19)
        {
          BytePtr = CFDataGetBytePtr(v19);
          CFIndex v22 = CFDataGetLength(v18[2]);
          CFDataAppendBytes(v20, BytePtr, v22);
        }
        else
        {
          CFDataIncreaseLength((CFMutableDataRef)a1[5], *((unsigned int *)v18 + 8));
        }
      }
      v13 += 40;
    }
  }
  return 0;
}

uint64_t _cmphotoDNGWriterIFDGetTagDataOffset(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  if (a2 == 0xFFFF || *(_DWORD *)(a1 + 16) <= a2) {
    return FigSignalErrorAt();
  }
  *a3 = *(_DWORD *)(*(void *)(a1 + 24) + 4 * a2);
  return 0;
}

const void *_readDictCFString(const __CFDictionary *a1, const void *a2, _DWORD *a3)
{
  CFStringGetTypeID();
  CFDictionaryRef Value = CFDictionaryGetValue(a1, a2);
  unsigned int v7 = Value;
  if (Value)
  {
    CFGetTypeID(Value);
  }
  else if (a3)
  {
    *a3 = 1;
  }
  return v7;
}

const void *_readDictCFNumber(const __CFDictionary *a1, const void *a2, _DWORD *a3)
{
  CFNumberGetTypeID();
  CFDictionaryRef Value = CFDictionaryGetValue(a1, a2);
  unsigned int v7 = Value;
  if (Value)
  {
    CFGetTypeID(Value);
  }
  else if (a3)
  {
    *a3 = 1;
  }
  return v7;
}

const void *_readDictCFData(const __CFDictionary *a1, const void *a2, _DWORD *a3)
{
  CFDataGetTypeID();
  CFDictionaryRef Value = CFDictionaryGetValue(a1, a2);
  unsigned int v7 = Value;
  if (Value)
  {
    CFGetTypeID(Value);
  }
  else if (a3)
  {
    *a3 = 1;
  }
  return v7;
}

uint64_t _unpackArrayOfDoubles(const __CFArray *a1, unsigned int a2, char *a3, _DWORD *a4)
{
  unint64_t Count = CFArrayGetCount(a1);
  if (Count <= a2)
  {
    unint64_t v9 = Count;
    if (!Count)
    {
LABEL_8:
      uint64_t result = 0;
      *a4 = v9;
      return result;
    }
    CFIndex v10 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a1, v10);
      CFTypeID v12 = CFGetTypeID(ValueAtIndex);
      if (v12 != CFNumberGetTypeID()
        || !CFNumberIsFloatType((CFNumberRef)ValueAtIndex)
        || !CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberDoubleType, a3))
      {
        break;
      }
      ++v10;
      a3 += 8;
      if (v9 == v10) {
        goto LABEL_8;
      }
    }
  }
  return 4294950740;
}

uint64_t readFloatArray(const void *a1, uint64_t a2, uint64_t a3)
{
  CFTypeID v6 = CFGetTypeID(a1);
  if (v6 != CFArrayGetTypeID()) {
    return 4294950740;
  }
  CFIndex v7 = a1 ? CFArrayGetCount((CFArrayRef)a1) : 0;
  if (v7 != a2) {
    return 4294950740;
  }
  if (a2 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      FigCFArrayGetFloatAtIndex();
      ++v8;
      a3 += 4;
    }
    while (a2 != v8);
  }
  return 0;
}

uint64_t _floatArrayToRational(const __CFArray *a1, uint64_t a2, int a3)
{
  double valuePtr = 0.0;
  CFIndex Count = CFArrayGetCount(a1);
  if (Count != a3) {
    return 4294950740;
  }
  if (a3 >= 1)
  {
    CFIndex v7 = Count;
    CFIndex v8 = 0;
    while (1)
    {
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, v8);
      if (!CFNumberIsFloatType(ValueAtIndex) || !CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr)) {
        break;
      }
      unsigned int v10 = 0;
      float v11 = valuePtr;
      float v12 = -v11;
      if (v11 >= 0.0) {
        float v12 = valuePtr;
      }
      do
      {
        int v13 = 1 << v10;
        float v14 = (float)(1 << v10);
        if (v10 > 0x1D) {
          break;
        }
        ++v10;
      }
      while ((float)(v12 * v14) < 1073700000.0);
      __int16 v15 = (_DWORD *)(a2 + 8 * v8);
      *__int16 v15 = llroundf(v11 * v14);
      v15[1] = v13;
      if (++v8 == v7) {
        return 0;
      }
    }
    return 4294950740;
  }
  return 0;
}

uint64_t _readInt32Array(const void *a1, uint64_t a2, uint64_t a3)
{
  CFTypeID v6 = CFGetTypeID(a1);
  if (v6 != CFArrayGetTypeID()) {
    return 4294950740;
  }
  CFIndex v7 = a1 ? CFArrayGetCount((CFArrayRef)a1) : 0;
  if (v7 != a2) {
    return 4294950740;
  }
  if (a2 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      FigCFArrayGetInt32AtIndex();
      ++v8;
      a3 += 4;
    }
    while (a2 != v8);
  }
  return 0;
}

uint64_t _parseOutWidthAndHeightFromJpeg(uint64_t a1)
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  CGImageSourceRef v2 = CGImageSourceCreateWithData(*(CFDataRef *)(a1 + 1640), 0);
  if (!v2) {
    return 4294950745;
  }
  CFAllocatorRef v3 = v2;
  int v4 = (void *)*MEMORY[0x1E4F2FF08];
  long long values = (void *)*MEMORY[0x1E4F1CFC8];
  keys[0] = v4;
  CFDictionaryRef v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v5)
  {
    uint64_t v8 = 4294950745;
    CFDictionaryRef v7 = v3;
LABEL_6:
    CFRelease(v7);
    return v8;
  }
  CFDictionaryRef v6 = v5;
  CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(v3, 0, v5);
  if (v7)
  {
    *(void *)(a1 + 1648) = 0;
    FigCFDictionaryGetIntIfPresent();
    FigCFDictionaryGetIntIfPresent();
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 4294950745;
  }
  CFRelease(v3);
  CFRelease(v6);
  if (v7) {
    goto LABEL_6;
  }
  return v8;
}

uint64_t _cfaPatternFromPixelFormat(int a1, int *a2)
{
  uint64_t result = 4294950746;
  if (a1 > 1735549491)
  {
    if (a1 == 1735549492)
    {
      int v4 = &kCFAPatternGRBG;
    }
    else
    {
      if (a1 != 1919379252) {
        return result;
      }
      int v4 = &kCFAPatternRGGB;
    }
  }
  else if (a1 == 1650943796)
  {
    int v4 = &kCFAPatternBGGR;
  }
  else
  {
    if (a1 != 1734505012) {
      return result;
    }
    int v4 = &kCFAPatternGBRG;
  }
  uint64_t result = 0;
  *a2 = *v4;
  return result;
}

CFTypeRef _copyFilteredImageProperties(const __CFDictionary *a1)
{
  v29[3] = *MEMORY[0x1E4F143B8];
  CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F2F800];
  uint64_t v2 = *MEMORY[0x1E4F2FA18];
  v29[0] = *MEMORY[0x1E4F2F800];
  v29[1] = v2;
  v29[2] = *MEMORY[0x1E4F2FC20];
  if (!a1) {
    return 0;
  }
  CFDictionaryRef v3 = a1;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 0;
  }
  CFDictionaryRef theDict = Mutable;
  uint64_t v6 = 0;
  key = (void *)*MEMORY[0x1E4F2F968];
  CFStringRef v26 = v1;
  CFDictionaryRef v23 = v3;
  do
  {
    CFStringRef v7 = (const __CFString *)v29[v6];
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v3, v7);
    if (Value)
    {
      CFDictionaryRef v9 = Value;
      CFTypeID v10 = CFGetTypeID(Value);
      if (v10 == CFDictionaryGetTypeID() && CFDictionaryGetCount(v9) >= 1)
      {
        if (CFStringCompare(v7, v1, 0)) {
          BOOL v11 = 0;
        }
        else {
          BOOL v11 = CFDictionaryContainsKey(v9, key) == 0;
        }
        int v12 = FigCFEqual();
        int v13 = v12;
        if (v12) {
          float v14 = (char *)&sExifTagBlackList;
        }
        else {
          float v14 = 0;
        }
        if (v12 || v11)
        {
          MutableCopy = CFDictionaryCreateMutableCopy(v4, 0, v9);
          if (v11)
          {
            __int16 v28 = 1;
            int v27 = 131074;
            int v17 = CFArrayCreateMutable(v4, 3, MEMORY[0x1E4F1D510]);
            for (uint64_t i = 0; i != 6; i += 2)
            {
              CFNumberRef v19 = CFNumberCreate(v4, kCFNumberShortType, (char *)&v27 + i);
              CFArrayAppendValue(v17, v19);
              if (v19) {
                CFRelease(v19);
              }
            }
            CFDictionaryAddValue(MutableCopy, key, v17);
            if (v17) {
              CFRelease(v17);
            }
            CFDictionaryRef v3 = v23;
          }
          if (v13)
          {
            for (uint64_t j = 0; j != 32; j += 8)
              CFDictionaryRemoveValue(MutableCopy, **(const void ***)&v14[j]);
          }
          CFTypeRef v15 = CFRetain(MutableCopy);
          if (MutableCopy) {
            CFRelease(MutableCopy);
          }
        }
        else
        {
          CFTypeRef v15 = CFRetain(v9);
        }
        CFStringRef v1 = v26;
        if (v15)
        {
          if (CFDictionaryGetCount((CFDictionaryRef)v15) >= 1) {
            CFDictionaryAddValue(theDict, v7, v15);
          }
          CFRelease(v15);
        }
      }
    }
    ++v6;
  }
  while (v6 != 3);
  if (CFDictionaryGetCount(theDict) < 1) {
    CFTypeRef v21 = 0;
  }
  else {
    CFTypeRef v21 = CFRetain(theDict);
  }
  CFRelease(theDict);
  return v21;
}

uint64_t _prepareAnalogBalance(uint64_t a1)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  CFStringRef v1 = (float32x2_t *)(a1 + 2076);
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)(a1 + 2076) = _D0;
  *(_DWORD *)(a1 + 2084) = 1065353216;
  if (!*(unsigned char *)(a1 + 464)) {
    return 0;
  }
  uint64_t v8 = (float64x2_t *)(a1 + 424);
  if (!*(unsigned char *)(a1 + 25) || *(unsigned char *)(a1 + 520))
  {
    if (*(unsigned char *)(a1 + 26))
    {
      uint64_t result = 0;
      float32x2_t *v1 = vcvt_f32_f64(*v8);
      float v10 = *(double *)(a1 + 440);
      *(float *)(a1 + 2084) = v10;
      return result;
    }
    return 0;
  }
  __asm { FMOV            V1.2D, #1.0 }
  float64x2_t v12 = vdivq_f64(_Q1, *v8);
  double v13 = 1.0 / *(double *)(a1 + 440);
  if (!*(unsigned char *)(a1 + 26))
  {
    float32x2_t *v1 = vcvt_f32_f64(v12);
    float v14 = v13;
    *(float *)(a1 + 2084) = v14;
  }
  double v16 = v12.f64[1];
  v18[0] = [MEMORY[0x1E4F28ED0] numberWithDouble:*(void *)&v12.f64[0]];
  v18[1] = [MEMORY[0x1E4F28ED0] numberWithDouble:v16];
  v18[2] = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
  CFArrayRef v15 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  uint64_t result = _floatArrayToRational(v15, a1 + 468, 3);
  if (!result)
  {
    int v17 = 0;
    uint64_t result = _unpackArrayOfDoubles(v15, 3u, (char *)(a1 + 496), &v17);
    if (!result)
    {
      if (v17 == 3)
      {
        *(unsigned char *)(a1 + 520) = 1;
        uint64_t result = _floatArrayToRational((const __CFArray *)&unk_1F02E51E0, a1 + 396, 3);
        if (!result)
        {
          uint64_t result = _unpackArrayOfDoubles((const __CFArray *)&unk_1F02E51E0, 3u, (char *)v8, &v17);
          if (!result)
          {
            if (v17 == 3) {
              return 0;
            }
            else {
              return 4294950746;
            }
          }
        }
      }
      else
      {
        return 4294950746;
      }
    }
  }
  return result;
}

uint64_t _applyLossyJPEGPerceptualCurve(uint64_t a1, __CVBuffer *a2)
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  int v4 = CMPhotoPerceptualCurveVersion();
  LODWORD(v5) = *(_DWORD *)(a1 + 32);
  if (*(float *)&v5 == 0.0) {
    *(float *)&uint64_t v5 = 1.0;
  }
  uint64_t v129 = v5;
  *(void *)(a1 + 2048) = 0;
  *(_DWORD *)(a1 + 2056) = 0;
  *(_OWORD *)(a1 + 1864) = 0u;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
  OSType v7 = PixelFormatType;
  if (PixelFormatType == 1111970369 || PixelFormatType == 1751527984 || PixelFormatType == 1815491698)
  {
    uint64_t v8 = (void *)MEMORY[0x1AD1109A0]();
    if (v7 == 1751527984)
    {
      if (CVPixelBufferLockBaseAddress(a2, 1uLL)) {
        goto LABEL_165;
      }
      size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a2, 0);
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a2, 0);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
      BaseAddressOfPlane = (int8x16_t *)CVPixelBufferGetBaseAddressOfPlane(a2, 0);
      if (HeightOfPlane)
      {
        uint64_t v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        uint16x8_t v17 = (uint16x8_t)vdupq_n_s16(0x1401u);
        uint16x8_t v18 = (uint16x8_t)vdupq_n_s16(0xC01u);
        if (WidthOfPlane >> 5 <= 1) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = WidthOfPlane >> 5;
        }
        uint16x8_t v20 = (uint16x8_t)vdupq_n_s16(0x401u);
        v21.i64[0] = 0x7C007C007C007C00;
        v21.i64[1] = 0x7C007C007C007C00;
        do
        {
          int16x8_t v22 = 0uLL;
          if (WidthOfPlane >= 0x20)
          {
            int16x8_t v24 = 0uLL;
            uint64_t v25 = v19;
            CFStringRef v26 = BaseAddressOfPlane;
            int16x8_t v23 = 0uLL;
            do
            {
              uint16x8_t v27 = (uint16x8_t)vandq_s8(*v26, v21);
              uint16x8_t v28 = (uint16x8_t)vandq_s8(v26[1], v21);
              uint16x8_t v29 = (uint16x8_t)vandq_s8(v26[2], v21);
              uint16x8_t v30 = (uint16x8_t)vandq_s8(v26[3], v21);
              int16x8_t v24 = vaddq_s16(vaddq_s16(vaddq_s16(v24, (int16x8_t)vcgtq_u16(v17, v27)), vaddq_s16((int16x8_t)vcgtq_u16(v17, v28), (int16x8_t)vcgtq_u16(v17, v29))), (int16x8_t)vcgtq_u16(v17, v30));
              int16x8_t v23 = vaddq_s16(vaddq_s16(vaddq_s16(v23, (int16x8_t)vcgtq_u16(v18, v27)), vaddq_s16((int16x8_t)vcgtq_u16(v18, v28), (int16x8_t)vcgtq_u16(v18, v29))), (int16x8_t)vcgtq_u16(v18, v30));
              int16x8_t v22 = vaddq_s16(vaddq_s16(vaddq_s16(v22, (int16x8_t)vcgtq_u16(v20, v27)), vaddq_s16((int16x8_t)vcgtq_u16(v20, v28), (int16x8_t)vcgtq_u16(v20, v29))), (int16x8_t)vcgtq_u16(v20, v30));
              v26 += 4;
              --v25;
            }
            while (v25);
            BaseAddressOfPlane += 4 * v19;
          }
          else
          {
            int16x8_t v23 = 0uLL;
            int16x8_t v24 = 0uLL;
          }
          int64x2_t v31 = vpaddlq_s32(vpaddlq_s16(v24));
          v14 += v31.i32[0] + v31.i32[2];
          int64x2_t v32 = vpaddlq_s32(vpaddlq_s16(v23));
          v15 += v32.i32[0] + v32.i32[2];
          int64x2_t v33 = vpaddlq_s32(vpaddlq_s16(v22));
          v16 += v33.i32[0] + v33.i32[2];
          BaseAddressOfPlane = (int8x16_t *)((char *)BaseAddressOfPlane
                                           + 2 * ((BytesPerRowOfPlane >> 1) - (WidthOfPlane & 0xFFFFFFFFFFFFFFE0)));
          ++v13;
        }
        while (v13 != HeightOfPlane);
        int v34 = -16384 * v14;
        unint64_t v35 = 32 * HeightOfPlane * (WidthOfPlane >> 5);
        int v36 = -16384 * v15;
        if (v35 < -16384 * v16) {
          int v37 = 1;
        }
        else {
          int v37 = 2;
        }
        if (v35 < v36) {
          int v38 = v37;
        }
        else {
          int v38 = 3;
        }
        if (v35 >= v34) {
          unsigned int v39 = 4;
        }
        else {
          unsigned int v39 = v38;
        }
      }
      else
      {
        unsigned int v39 = 4;
      }
      CVPixelBufferUnlockBaseAddress(a2, 1uLL);
    }
    else
    {
      unsigned int v39 = 2;
    }
    Class CIImageClass_0 = getCIImageClass_0();
    uint64_t v152 = getkCIImageColorSpace_0();
    uint64_t v153 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v42 = -[objc_class imageWithCVPixelBuffer:options:](CIImageClass_0, "imageWithCVPixelBuffer:options:", a2, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1]);
    if (v42)
    {
      CFAllocatorRef v43 = (void *)v42;
      if (*(float *)&v129 != 1.0 && (*(_DWORD *)(a1 + 8) == 2 || *(_DWORD *)(a1 + 156) == 16))
      {
        *(float32x2_t *)(a1 + 2076) = vmul_n_f32(*(float32x2_t *)(a1 + 2076), *(float *)&v129);
        *(float *)(a1 + 2084) = *(float *)&v129 * *(float *)(a1 + 2084);
      }
      v150[0] = @"inputRVector";
      v151[0] = [(objc_class *)getCIVectorClass_0() vectorWithX:*(float *)(a1 + 2076) Y:0.0 Z:0.0 W:0.0];
      v150[1] = @"inputGVector";
      v151[1] = [(objc_class *)getCIVectorClass_0() vectorWithX:0.0 Y:*(float *)(a1 + 2080) Z:0.0 W:0.0];
      v150[2] = @"inputBVector";
      v151[2] = [(objc_class *)getCIVectorClass_0() vectorWithX:0.0 Y:0.0 Z:*(float *)(a1 + 2084) W:0.0];
      uint64_t v44 = objc_msgSend(v43, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v151, v150, 3));
      uint64_t v45 = (void *)v44;
      if (*(_DWORD *)(a1 + 156) == 16 || v4 == 2)
      {
        if (!v44) {
          goto LABEL_46;
        }
        CFNumberRef v47 = (void *)[(objc_class *)getCIColorKernelClass() kernelWithString:@"kernel vec4 maxComponent (__sample s)__attribute__((outputFormat(kCIFormatRh))){\treturn vec4(vec3(max(max(s.r,s.g),s.b)), s.a);}"];
        [v45 extent];
        *(void *)&v154.a = v45;
        uint64_t v45 = objc_msgSend(v47, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v154, 1), v48, v49, v50, v51);
        if (!v45) {
          goto LABEL_46;
        }
        size_t v52 = (void *)[(objc_class *)getCIKernelClass() kernelWithString:@"kernel vec4 downscale( sampler src)__attribute__((outputFormat(kCIFormatRh))) {      vec2 dc = (4.0 * (destCoord() - vec2(0.5))) + vec2(0.5);     vec4 s1  = sample(src, samplerTransform(src, dc + vec2(0,0)));     float s2  = sample(src, samplerTransform(src, dc + vec2(0,1))).r;     float s3  = sample(src, samplerTransform(src, dc + vec2(0,2))).r;     float s4  = sample(src, samplerTransform(src, dc + vec2(0,3))).r;     float s5  = sample(src, samplerTransform(src, dc + vec2(1,0))).r;     float s6  = sample(src, samplerTransform(src, dc + vec2(1,1))).r;     float s7  = sample(src, samplerTransform(src, dc + vec2(1,2))).r;     float s8  = sample(src, samplerTransform(src, dc + vec2(1,3))).r;     float s9  = sample(src, samplerTransform(src, dc + vec2(2,0))).r;     float s10 = sample(src, samplerTransform(src, dc + vec2(2,1))).r;     float s11 = sample(src, samplerTransform(src, dc + vec2(2,2))).r;     float s12 = sample(src, samplerTransform(src, dc + vec2(2,3))).r;     float s13 = sample(src, samplerTransform(src, dc + vec2(3,0))).r;     float s14 = sample(src, samplerTransform(src, dc + vec2(3,1))).r;     float s15 = sample(src, samplerTransform(src, dc + vec2(3,2))).r;     float s16 = sample(src, samplerTransform(src, dc + vec2(3,3))).r;     float g1 = max(max(max(s1.r, s2), s3), s4);     float g2 = max(max(max(s5, s6), s7), s8);     float g3 = max(max(max(s9, s10), s11), s12);     float g4 = max(max(max(s13, s14), s15), s16);     return vec4(vec3(max(max(max(g1, g2), g3), g4)), s1.a);}"];
        [v45 extent];
        CGFloat v54 = v53;
        CGFloat v56 = v55;
        CGFloat v58 = v57;
        CGFloat v60 = v59;
        CGAffineTransformMakeScale(&v154, 0.25, 0.25);
        v157.origin.CGFloat x = v54;
        v157.origin.y = v56;
        v157.size.width = v58;
        v157.size.height = v60;
        CGRect v158 = CGRectApplyAffineTransform(v157, &v154);
        uint64_t v142 = v45;
        uint64_t v46 = objc_msgSend(v52, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_294, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v142, 1), v158.origin.x, v158.origin.y, v158.size.width, v158.size.height);
      }
      else
      {
        CGAffineTransformMakeScale(&v133, 0.25, 0.25);
        uint64_t v46 = [v45 imageByApplyingTransform:&v133 highQualityDownsample:1];
      }
      uint64_t v45 = (void *)v46;
LABEL_46:
      uint64_t v148 = 0;
      uint64_t v149 = 0;
      CFIndex v146 = @"inputExtent";
      Class CIVectorClass_0 = getCIVectorClass_0();
      [v45 extent];
      CGRect v160 = CGRectInset(v159, -1.0, -1.0);
      uint64_t v147 = -[objc_class vectorWithCGRect:](CIVectorClass_0, "vectorWithCGRect:", v160.origin.x, v160.origin.y, v160.size.width, v160.size.height);
      float v62 = objc_msgSend(v45, "imageByApplyingFilter:withInputParameters:", @"CIAreaMaximum", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1));
      Class CIContextClass_0 = getCIContextClass_0();
      Class v64 = CIContextClass_0;
      if (v4 == 2)
      {
        v144[0] = getkCIContextCacheIntermediates_0();
        v145[0] = MEMORY[0x1E4F1CC28];
        v144[1] = getkCIContextName_0();
        v145[1] = @"measure max value";
        uint64_t v65 = -[objc_class contextWithOptions:](v64, "contextWithOptions:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:2]);
      }
      else
      {
        uint64_t v65 = [(objc_class *)CIContextClass_0 context];
      }
      CFNumberRef v66 = (void *)v65;
      CFArrayRef v67 = (float32x2_t *)(a1 + 2076);
      objc_msgSend(v62, "extent", v129);
      objc_msgSend(v66, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v62, &v148, 16, getkCIFormatRGBAf(), 0, v68, v69, v70, v71);
      v72.i32[0] = v148;
      if (*(float *)&v148 <= *((float *)&v148 + 1)) {
        v72.i32[0] = HIDWORD(v148);
      }
      if (*(float *)v72.i32 <= *(float *)&v149) {
        v72.i32[0] = v149;
      }
      float v73 = (float)*(int *)(a1 + 372) / (float)*(int *)(a1 + 376);
      int v74 = *(_DWORD *)(a1 + 8);
      if (v74 == 2 || (int v75 = *(_DWORD *)(a1 + 156), v75 == 16))
      {
        int32x2_t v131 = v72;
        float v76 = log2f(*(float *)v72.i32);
        float32x2_t *v67 = vdiv_f32(*v67, (float32x2_t)vdup_lane_s32(v131, 0));
        *(float *)(a1 + 2084) = *(float *)(a1 + 2084) / *(float *)v131.i32;
        float v77 = 1.0;
        float v78 = 1.0;
LABEL_56:
        unsigned int v79 = 0;
        float v80 = v73 + v76;
        float v81 = -v80;
        if (v80 >= 0.0) {
          float v81 = v80;
        }
        do
        {
          int v82 = 1 << v79;
          float v83 = (float)(1 << v79);
          if (v79 > 0x1D) {
            break;
          }
          ++v79;
        }
        while ((float)(v81 * v83) < 1073700000.0);
        uint64_t v84 = 0;
        *(_DWORD *)(a1 + 372) = llroundf(v80 * v83);
        *(_DWORD *)(a1 + 376) = v82;
        *(unsigned char *)(a1 + 24) = 1;
        *(_DWORD *)(a1 + 1876) = 3;
        float v85 = fminf(v77, 1.0);
        do
        {
          v140[v84] = 0.0;
          if (v74 == 2)
          {
            v141[v84] = 0.03125;
            *(_DWORD *)((char *)&v142 + v84 * 4) = 1048576000;
            float v86 = 0.71875;
          }
          else if (v4 == 2)
          {
            if (v78 <= 0.02)
            {
              v141[v84] = 0.015625;
              *(_DWORD *)((char *)&v142 + v84 * 4) = 0;
              float v88 = 0.0;
              float v87 = 0.015625;
            }
            else if (v78 <= 0.04)
            {
              v141[v84] = 0.03125;
              *(_DWORD *)((char *)&v142 + v84 * 4) = 1048576000;
              float v88 = 0.25;
              float v87 = 0.03125;
            }
            else if (v78 <= 0.08)
            {
              v141[v84] = 0.0625;
              *(_DWORD *)((char *)&v142 + v84 * 4) = 1050924810;
              float v87 = 0.0625;
              float v88 = 0.32;
            }
            else if (v78 <= 0.16)
            {
              v141[v84] = 0.125;
              *(_DWORD *)((char *)&v142 + v84 * 4) = 1050253722;
              float v87 = 0.125;
              float v88 = 0.3;
            }
            else if (v78 <= 0.32)
            {
              v141[v84] = 0.25;
              *(_DWORD *)((char *)&v142 + v84 * 4) = 1043207291;
              float v87 = 0.25;
              float v88 = 0.17;
            }
            else if (v78 <= 0.64)
            {
              v141[v84] = 0.5;
              *(_DWORD *)((char *)&v142 + v84 * 4) = -1095887749;
              float v87 = 0.5;
              float v88 = -0.34;
            }
            else
            {
              v141[v84] = 1.0;
              *(_DWORD *)((char *)&v142 + v84 * 4) = 0;
              float v87 = 1.0;
              float v88 = 0.0;
            }
            float v86 = (float)(1.0 - v87) - v88;
          }
          else
          {
            if ((float)(v77 * 0.0625) > v78) {
              float v78 = v77 * 0.0625;
            }
            v141[v84] = v85 * v78;
            *(_DWORD *)((char *)&v142 + v84 * 4) = 0;
            float v86 = v77 - (float)(v78 * v77);
            if (v77 >= 1.0) {
              float v86 = v77 - v78;
            }
          }
          *(float *)((char *)&v154.a + v84 * 4) = v86;
          ++v84;
        }
        while (v84 != 3);
        uint64_t v89 = 0;
        CFNumberRef v90 = (double *)(a1 + 1696);
        do
        {
          double v91 = v141[v89];
          *(v90 - 3) = v140[v89];
          *(v90 - 2) = v91;
          double v92 = *((float *)&v154.a + v89);
          *(v90 - 1) = *((float *)&v142 + v89);
          double *v90 = v92;
          *(_DWORD *)(a1 + 1864 + 4 * v89++) = 4;
          v90 += 8;
        }
        while (v89 < *(int *)(a1 + 1876));
        if (v74 != 2)
        {
          uint64_t v93 = 0;
          int v94 = *(_DWORD *)(a1 + 156);
          if (v94 == 16 || v78 == 1.0) {
            goto LABEL_93;
          }
          int v95 = 1 << v94;
          *(_DWORD *)(a1 + 2056) = v95;
          uint64_t v96 = malloc_type_malloc(2 * v95, 0x1000040BDFB0063uLL);
          *(void *)(a1 + 2048) = v96;
          if (!v96) {
            goto LABEL_166;
          }
          Class CIFilterClass = getCIFilterClass();
          v138[0] = @"inputColor0";
          v139[0] = [(objc_class *)getCIColorClass() blackColor];
          v138[1] = @"inputColor1";
          v139[1] = [(objc_class *)getCIColorClass() whiteColor];
          v138[2] = @"inputPoint0";
          v139[2] = -[objc_class vectorWithCGPoint:](getCIVectorClass_0(), "vectorWithCGPoint:", 0.5, 0.5);
          v138[3] = @"inputPoint1";
          v139[3] = -[objc_class vectorWithCGPoint:](getCIVectorClass_0(), "vectorWithCGPoint:", (float)*(int *)(a1 + 2056) + -0.5, 0.5);
          CFDictionaryRef v98 = objc_msgSend((id)objc_msgSend((id)-[objc_class filterWithName:withInputParameters:](CIFilterClass, "filterWithName:withInputParameters:", @"CILinearGradient", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v139, v138, 4)), "outputImage"), "imageByCroppingToRect:", 0.0, 0.0, (double)*(int *)(a1 + 2056), 1.0);
          v136[0] = @"inputRedCoefficients";
          v137[0] = [(objc_class *)getCIVectorClass_0() vectorWithX:(float)(v140[0] / v77) Y:(float)(v141[0] / v77) Z:(float)(*(float *)&v142 / v77) W:(float)(*(float *)&v154.a / v77)];
          v136[1] = @"inputGreenCoefficients";
          v137[1] = [(objc_class *)getCIVectorClass_0() vectorWithX:(float)(v140[1] / v77) Y:(float)(v141[1] / v77) Z:(float)(*((float *)&v142 + 1) / v77) W:(float)(*((float *)&v154.a + 1) / v77)];
          v136[2] = @"inputBlueCoefficients";
          v137[2] = [(objc_class *)getCIVectorClass_0() vectorWithX:(float)(v140[2] / v77) Y:(float)(v141[2] / v77) Z:(float)(v143 / v77) W:(float)(*(float *)&v154.b / v77)];
          uint64_t v99 = objc_msgSend(v98, "imageByApplyingFilter:withInputParameters:", @"CIColorPolynomial", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v137, v136, 3));
          if (!v99)
          {
LABEL_166:
            uint64_t v93 = 4294950745;
            goto LABEL_93;
          }
          uint64_t v100 = (void *)v99;
          Class v101 = getCIContextClass_0();
          uint64_t v134 = getkCIContextName_0();
          int v135 = @"linearizationTable creation";
          uint64_t v102 = (void *)-[objc_class contextWithOptions:](v101, "contextWithOptions:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1]);
          uint64_t v103 = *(void *)(a1 + 2048);
          uint64_t v104 = 2 * *(int *)(a1 + 2056);
          [v100 extent];
          objc_msgSend(v102, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v100, v103, v104, getkCIFormatL16(), 0, v105, v106, v107, v108);
        }
        uint64_t v93 = 0;
LABEL_93:
        return v93;
      }
      if (v4 == 1 && v7 == 1751527984)
      {
        float v109 = v130 * *(float *)v72.i32;
        float v110 = 1.0;
        if (*(float *)v72.i32 <= 1.0) {
          float v111 = v130;
        }
        else {
          float v111 = v130 * *(float *)v72.i32;
        }
        if (*(float *)v72.i32 <= 1.0) {
          float v112 = 1.0;
        }
        else {
          float v112 = 1.0 / *(float *)v72.i32;
        }
        if (v111 >= 2.0)
        {
          if (v111 >= 8.0) {
            float v114 = 1.0;
          }
          else {
            float v114 = 0.5;
          }
          if (v111 >= 8.0) {
            float v110 = 0.5;
          }
        }
        else
        {
          uint64_t v113 = (int)v39 - 2;
          if (v113 > 2)
          {
            float v114 = 0.0625;
          }
          else
          {
            float v110 = flt_1AB9E38B8[v113];
            float v114 = flt_1AB9E38C4[(int)v113];
          }
        }
        float v122 = v112 * v110;
        float v77 = 1.0;
        if (v122 != 1.0)
        {
          float32x2_t *v67 = vmul_n_f32(*v67, v122);
          *(float *)(a1 + 2084) = v122 * *(float *)(a1 + 2084);
        }
        double v123 = 1.0 / v111;
        if (*(float *)v72.i32 <= 1.0) {
          float v124 = *(float *)v72.i32;
        }
        else {
          float v124 = 1.0;
        }
        if (v123 <= v124) {
          float v125 = v123;
        }
        else {
          float v125 = v124;
        }
        if (v109 <= 1.0) {
          float v126 = 0.5;
        }
        else {
          float v126 = 0.5 / v109;
        }
        if (v126 <= v114) {
          float v126 = v114;
        }
        float v78 = v110 * (float)(v125 * v126);
        float v127 = v111 / v110;
      }
      else
      {
        if (v4 != 2)
        {
          float v132 = *(float *)v72.i32;
          float v76 = log2f(*(float *)v72.i32);
          float v78 = 0.5;
          float v77 = v132;
          goto LABEL_56;
        }
        if (*(float *)v72.i32 <= 1.0) {
          float v115 = *(float *)v72.i32;
        }
        else {
          float v115 = 1.0;
        }
        if (*(float *)v72.i32 <= 1.0) {
          float v116 = 1.0;
        }
        else {
          float v116 = 1.0 / *(float *)v72.i32;
        }
        if (v75 < 11)
        {
          if (v130 >= 1.5)
          {
            float v121 = 1.0;
            if (v130 >= 16.0) {
              float v121 = 0.75;
            }
          }
          else
          {
            float v121 = 1.0 / v115;
          }
          if (v39 >= 3) {
            float v78 = 0.03125;
          }
          else {
            float v78 = 0.015625;
          }
        }
        else
        {
          float v117 = 0.5;
          if (v39 == 3) {
            float v118 = 0.5;
          }
          else {
            float v118 = 1.0;
          }
          if (v39 == 4) {
            float v118 = 0.25;
          }
          if (v130 < 4.0) {
            float v117 = 1.0;
          }
          if (v130 >= 16.0) {
            float v117 = 0.25;
          }
          if (v130 >= 1.5) {
            float v119 = v117;
          }
          else {
            float v119 = v118;
          }
          BOOL v120 = v119 != 1.0 || v115 <= 0.75;
          float v121 = 0.75 / v115;
          if (v120) {
            float v121 = v119;
          }
          float v78 = 1.0 / (float)(1 << (16 - v75));
        }
        float v128 = v116 * v121;
        float v77 = 1.0;
        if (v128 != 1.0)
        {
          float32x2_t *v67 = vmul_n_f32(*v67, v128);
          *(float *)(a1 + 2084) = v128 * *(float *)(a1 + 2084);
        }
        float v127 = v130 / v128;
      }
      *(float *)(a1 + 32) = v127;
      float v76 = log2f(v127);
      goto LABEL_56;
    }
LABEL_165:
    uint64_t v93 = FigSignalErrorAt();
    goto LABEL_93;
  }
  return FigSignalErrorAt();
}

Class initCIImage_0()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  Class result = objc_getClass("CIImage");
  classCIImage_0 = (uint64_t)result;
  getClass CIImageClass_0 = CIImageFunction_0;
  return result;
}

uint64_t CIImageFunction_0()
{
  return classCIImage_0;
}

void *__CoreImageLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/Frameworks/CoreImage.framework/CoreImage", 2);
  CoreImageLibrary_sLib_0 = (uint64_t)result;
  return result;
}

uint64_t initValkCIImageColorSpace_0()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  BOOL v0 = (uint64_t *)dlsym((void *)CoreImageLibrary_sLib_0, "kCIImageColorSpace");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkCIImageColorSpace_0 = result;
  }
  else
  {
    uint64_t result = constantValkCIImageColorSpace_0;
  }
  getkCIImageColorSpace_0 = kCIImageColorSpaceFunction_0;
  return result;
}

uint64_t kCIImageColorSpaceFunction_0()
{
  return constantValkCIImageColorSpace_0;
}

Class initCIVector_0()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  Class result = objc_getClass("CIVector");
  classCIVector_0 = (uint64_t)result;
  getClass CIVectorClass_0 = CIVectorFunction_0;
  return result;
}

uint64_t CIVectorFunction_0()
{
  return classCIVector_0;
}

Class initCIColorKernel()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  Class result = objc_getClass("CIColorKernel");
  classCIColorKernel = (uint64_t)result;
  getCIColorKernelClass = CIColorKernelFunction;
  return result;
}

uint64_t CIColorKernelFunction()
{
  return classCIColorKernel;
}

void ___downscaleRh_block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGAffineTransformMakeScale(&v8, 4.0, 4.0);
  v9.origin.CGFloat x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  CGRectApplyAffineTransform(v9, &v8);
}

Class initCIKernel()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  Class result = objc_getClass("CIKernel");
  classCIKernel = (uint64_t)result;
  getCIKernelClass = CIKernelFunction;
  return result;
}

uint64_t CIKernelFunction()
{
  return classCIKernel;
}

uint64_t initValkCIContextCacheIntermediates_0()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  BOOL v0 = (uint64_t *)dlsym((void *)CoreImageLibrary_sLib_0, "kCIContextCacheIntermediates");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkCIContextCacheIntermediates_0 = result;
  }
  else
  {
    uint64_t result = constantValkCIContextCacheIntermediates_0;
  }
  getkCIContextCacheIntermediates_0 = kCIContextCacheIntermediatesFunction_0;
  return result;
}

uint64_t kCIContextCacheIntermediatesFunction_0()
{
  return constantValkCIContextCacheIntermediates_0;
}

uint64_t initValkCIContextName_0()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  BOOL v0 = (uint64_t *)dlsym((void *)CoreImageLibrary_sLib_0, "kCIContextName");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkCIContextName_0 = result;
  }
  else
  {
    uint64_t result = constantValkCIContextName_0;
  }
  getkCIContextName_0 = kCIContextNameFunction_0;
  return result;
}

uint64_t kCIContextNameFunction_0()
{
  return constantValkCIContextName_0;
}

uint64_t initValkCIFormatRGBAf()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  BOOL v0 = (unsigned int *)dlsym((void *)CoreImageLibrary_sLib_0, "kCIFormatRGBAf");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkCIFormatRGBAf = result;
  }
  else
  {
    uint64_t result = constantValkCIFormatRGBAf;
  }
  getkCIFormatRGBAf = kCIFormatRGBAfFunction;
  return result;
}

uint64_t kCIFormatRGBAfFunction()
{
  return constantValkCIFormatRGBAf;
}

Class initCIColor()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  Class result = objc_getClass("CIColor");
  classCIColor = (uint64_t)result;
  getCIColorClass = CIColorFunction;
  return result;
}

uint64_t CIColorFunction()
{
  return classCIColor;
}

uint64_t initValkCIFormatL16()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  BOOL v0 = (unsigned int *)dlsym((void *)CoreImageLibrary_sLib_0, "kCIFormatL16");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkCIFormatL16 = result;
  }
  else
  {
    uint64_t result = constantValkCIFormatL16;
  }
  getkCIFormatL16 = kCIFormatL16Function;
  return result;
}

uint64_t kCIFormatL16Function()
{
  return constantValkCIFormatL16;
}

void _cmphotoDNGWriterReleaseTagStorage(char **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    unint64_t v3 = *((unsigned int *)a1 + 3);
    if (v3)
    {
      unint64_t v4 = 0;
      uint64_t v5 = 16;
      do
      {
        if (*(void *)&v2[v5])
        {
          CFRelease(*(CFTypeRef *)&v2[v5]);
          uint64_t v2 = *a1;
          *(void *)&(*a1)[v5] = 0;
          unint64_t v3 = *((unsigned int *)a1 + 3);
        }
        ++v4;
        v5 += 40;
      }
      while (v4 < v3);
    }
    *a1 = 0;
    free(v2);
  }
  a1[1] = 0;
}

void _ifdAddTagS(char **a1, __int16 a2, uint64_t a3)
{
  if (a3)
  {
    CStringPtrAndBufferToFree = (const char *)FigCFStringGetCStringPtrAndBufferToFree();
    if (CStringPtrAndBufferToFree)
    {
      uint64_t v6 = (__int16 *)CStringPtrAndBufferToFree;
      int v7 = strlen(CStringPtrAndBufferToFree);
      _ifdAddTag4(a1, a2, 2u, (v7 + 1), v6);
      free(0);
    }
  }
}

uint64_t _ifdAddTag4(char **a1, __int16 a2, unsigned int a3, size_t __n, __int16 *__src)
{
  LODWORD(v6) = __n;
  int v10 = *((_DWORD *)a1 + 3);
  if (v10 == *((_DWORD *)a1 + 2))
  {
    int v11 = 2 * v10;
    float64x2_t v12 = (char *)malloc_type_realloc(*a1, 40 * (2 * v10), 0x106004007C5E651uLL);
    *a1 = v12;
    bzero(&v12[40 * *((unsigned int *)a1 + 2)], 40 * (v11 - *((_DWORD *)a1 + 2)));
    *((_DWORD *)a1 + 2) = v11;
  }
  uint64_t result = *((unsigned int *)a1 + 4);
  if (result == *((_DWORD *)a1 + 8))
  {
    *((_DWORD *)a1 + 8) = 2 * result;
    a1[3] = (char *)malloc_type_realloc(a1[3], 4 * (2 * result), 0x100004052888210uLL);
    uint64_t result = *((unsigned int *)a1 + 4);
  }
  int v14 = *a1;
  int v15 = *((_DWORD *)a1 + 3);
  uint64_t v16 = (uint64_t)&(*a1)[40 * v15];
  *(_WORD *)uint64_t v16 = a2;
  *(_WORD *)(v16 + 2) = a3;
  *(_DWORD *)(v16 + 4) = v6;
  *(_DWORD *)(v16 + 24) = result;
  uint16x8_t v17 = (unsigned int *)(v16 + 24);
  unsigned int v18 = tiffDataTypeToSize[a3] * v6;
  *(_DWORD *)(v16 + 28) = v18;
  size_t v19 = -v18 & 3;
  CFIndex v20 = v19 + v18;
  *(_DWORD *)(v16 + 32) = v20;
  int8x16_t v21 = (unsigned int *)(v16 + 32);
  if (__src)
  {
    if (v18 > 4)
    {
      CFMutableDictionaryRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v20);
      uint64_t v25 = &v14[40 * v15];
      *((void *)v25 + 2) = Mutable;
      CFDataSetLength(Mutable, *v21);
      MutableBytePtr = CFDataGetMutableBytePtr(*((CFMutableDataRef *)v25 + 2));
    }
    else
    {
      MutableBytePtr = (UInt8 *)(v16 + 8);
    }
    int v26 = *((unsigned __int8 *)a1 + 48);
    switch((__int16)a3)
    {
      case 0:
      case 1:
      case 2:
      case 6:
      case 7:
        memcpy(MutableBytePtr, __src, v6);
        MutableBytePtr += v6;
        break;
      case 3:
      case 8:
        if (v6)
        {
          uint64_t v6 = v6;
          do
          {
            __int16 v28 = *__src++;
            CMPhotoDNGWrite16(MutableBytePtr, v28, v26);
            MutableBytePtr += 2;
            --v6;
          }
          while (v6);
        }
        break;
      case 4:
      case 9:
      case 11:
      case 13:
        if (v6)
        {
          uint64_t v6 = v6;
          do
          {
            unsigned int v27 = *(_DWORD *)__src;
            __src += 2;
            CMPhotoDNGWrite32((unsigned int *)MutableBytePtr, v27, v26);
            MutableBytePtr += 4;
            --v6;
          }
          while (v6);
        }
        break;
      case 5:
      case 10:
        uint64_t v29 = (2 * v6);
        if (v29)
        {
          do
          {
            unsigned int v30 = *(_DWORD *)__src;
            __src += 2;
            CMPhotoDNGWrite32((unsigned int *)MutableBytePtr, v30, v26);
            MutableBytePtr += 4;
            --v29;
          }
          while (v29);
        }
        break;
      case 12:
        if (v6)
        {
          uint64_t v6 = v6;
          do
          {
            unint64_t v31 = *(void *)__src;
            __src += 4;
            CMPhotoDNGWrite64((unint64_t *)MutableBytePtr, v31, v26);
            MutableBytePtr += 8;
            --v6;
          }
          while (v6);
        }
        break;
      default:
        break;
    }
    bzero(MutableBytePtr, v19);
    int v15 = *((_DWORD *)a1 + 3);
    int v23 = *((_DWORD *)a1 + 4);
    uint64_t result = *v17;
  }
  else
  {
    int v23 = result;
  }
  *((_DWORD *)a1 + 3) = v15 + 1;
  *((_DWORD *)a1 + 4) = v23 + 1;
  return result;
}

uint64_t _cmphotoDNGOPCodeWriterOpen(__CFData **a1)
{
  a1[1] = 0;
  CFMutableDictionaryRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  *a1 = Mutable;
  if (!Mutable) {
    return 4294950745;
  }
  CFDataSetLength(Mutable, 4);
  return 0;
}

uint64_t _cmphotoDNGOPCodeWriterStartOPCode(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (*(_DWORD *)(a1 + 12))
  {
    return FigSignalErrorAt();
  }
  else
  {
    *(_DWORD *)(a1 + 12) = CFDataGetLength(*(CFDataRef *)a1);
    *(_DWORD *)(a1 + 16) = 0;
    *(_DWORD *)bytes = bswap32(a2);
    CFDataAppendBytes(*(CFMutableDataRef *)a1, bytes, 4);
    *(_DWORD *)bytes = 769;
    CFDataAppendBytes(*(CFMutableDataRef *)a1, bytes, 4);
    *(_DWORD *)bytes = bswap32(a3);
    CFDataAppendBytes(*(CFMutableDataRef *)a1, bytes, 4);
    *(_DWORD *)bytes = 0;
    CFDataAppendBytes(*(CFMutableDataRef *)a1, bytes, 4);
    return 0;
  }
}

uint64_t _cmphotoDNGOPCodeWriterWrite32(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 12))
  {
    *(_DWORD *)bytes = bswap32(a2);
    CFDataAppendBytes(*(CFMutableDataRef *)a1, bytes, 4);
    *(_DWORD *)(a1 + 16) += 4;
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

uint64_t _cmphotoDNGOPCodeWriterWriteDoubles(uint64_t a1, double *a2, unsigned int a3)
{
  if (*(_DWORD *)(a1 + 12))
  {
    if (a3)
    {
      CFIndex Length = CFDataGetLength(*(CFDataRef *)a1);
      int v7 = 8 * a3;
      uint64_t v8 = a3;
      CFDataIncreaseLength(*(CFMutableDataRef *)a1, 8 * a3);
      CGRect v9 = (double *)&CFDataGetMutableBytePtr(*(CFMutableDataRef *)a1)[Length];
      do
      {
        double v10 = *a2++;
        CMPhotoDNGWriteDouble(v9++, 1, v10);
        --v8;
      }
      while (v8);
      *(_DWORD *)(a1 + 16) += v7;
    }
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

uint64_t _cmphotoDNGOPCodeWriterEndOPCode(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 12))
  {
    MutableBytePtr = CFDataGetMutableBytePtr(*(CFMutableDataRef *)a1);
    CMPhotoDNGWrite32((unsigned int *)&MutableBytePtr[*(unsigned int *)(a1 + 12) + 12], *(_DWORD *)(a1 + 16), 1);
    *(_DWORD *)(a1 + 12) = 0;
    *(_DWORD *)(a1 + 16) = 0;
    ++*(_DWORD *)(a1 + 8);
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

void _cmphotoDNGOPCodeWriterCloseAndCopyData(uint64_t a1, CFMutableDataRef *a2)
{
  if (*(_DWORD *)(a1 + 8))
  {
    MutableBytePtr = (unsigned int *)CFDataGetMutableBytePtr(*(CFMutableDataRef *)a1);
    CMPhotoDNGWrite32(MutableBytePtr, *(_DWORD *)(a1 + 8), 1);
    CFMutableDataRef v5 = *(CFMutableDataRef *)a1;
    *(void *)a1 = 0;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  CFMutableDataRef v5 = 0;
  if (a2) {
LABEL_3:
  }
    *a2 = v5;
LABEL_4:
  if (*(void *)a1)
  {
    CFRelease(*(CFTypeRef *)a1);
    *(void *)a1 = 0;
  }
}

uint64_t _cmphotoDNGOPCodeWriterWriteStandardOPCode(uint64_t a1, unsigned int a2, unsigned int a3, double *a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  uint64_t result = _cmphotoDNGOPCodeWriterStartOPCode(a1, a2, a6);
  if (!result)
  {
    if (!a3 || (uint64_t result = _cmphotoDNGOPCodeWriterWrite32(a1, a3), !result))
    {
      uint64_t result = _cmphotoDNGOPCodeWriterWriteDoubles(a1, a4, a5);
      if (!result)
      {
        if (a2 != 14 || (uint64_t result = _cmphotoDNGOPCodeWriterWrite32(a1, a7), !result))
        {
          return _cmphotoDNGOPCodeWriterEndOPCode(a1);
        }
      }
    }
  }
  return result;
}

uint64_t _compareTagKeysAscending(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 - *a2;
}

uint64_t _cmphotoDNGWriterIFDInsert(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  CFMutableDataRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (!Mutable) {
    return 4294950745;
  }
  CFDataRef theData = Mutable;
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), zero, 2);
  CGRect v9 = (unsigned int *)&CFDataGetMutableBytePtr(*(CFMutableDataRef *)(a1 + 40))[a4];
  unsigned int Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  CMPhotoDNGWrite32(v9, Length, *(unsigned __int8 *)(a1 + 48));
  uint64_t v33 = a2;
  int v11 = (unsigned __int16 *)(a2 + a3);
  unsigned int v12 = CMPhotoDNGRead16(v11, *(unsigned __int8 *)(a1 + 48));
  int v13 = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  *(_WORD *)bytes = v12;
  if (*(unsigned char *)(a1 + 48)) {
    *(_WORD *)bytes = __rev16(v12);
  }
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), bytes, 2);
  if (v12)
  {
    uint64_t v14 = (uint64_t)(v11 + 1);
    int v32 = 12 * v12 + v13 + 6;
    uint64_t v31 = a1;
    do
    {
      unint64_t Tag = _readTag(v14, *(unsigned __int8 *)(a1 + 48));
      int v17 = Tag;
      unsigned int v18 = v16;
      unint64_t v19 = HIDWORD(Tag);
      uint64_t v20 = WORD1(Tag);
      CFIndex v21 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)];
      if (v21 >= 5)
      {
        unsigned int v22 = v16;
        unsigned int v18 = v32 + CFDataGetLength(theData);
        CFDataAppendBytes(theData, (const UInt8 *)(v33 + v22), v21);
        if (v21)
        {
          bytes[0] = 0;
          CFDataAppendBytes(theData, bytes, 1);
        }
        a1 = v31;
      }
      int v23 = *(__CFData **)(a1 + 40);
      int v24 = *(unsigned __int8 *)(a1 + 48);
      unsigned int v36 = v18;
      unsigned int v38 = 0;
      *(void *)int v37 = 0;
      CMPhotoDNGWrite16(v37, v17, v24);
      CMPhotoDNGWrite16(&v37[2], v20, v24);
      CMPhotoDNGWrite32((unsigned int *)&v37[4], v19, v24);
      if (tiffDataTypeToSize[v20] * (int)v19 <= 4 && ((0x2A10uLL >> v20) & 1) == 0)
      {
        if ((0xC6uLL >> v20))
        {
          __memcpy_chk();
        }
        else if (HIWORD(v17) == 8 || HIWORD(v17) == 3)
        {
          CMPhotoDNGWrite16(&v38, v18, v24);
          if (v19 == 2) {
            CMPhotoDNGWrite16((_WORD *)&v38 + 1, SHIWORD(v18), v24);
          }
        }
      }
      else
      {
        CMPhotoDNGWrite32(&v38, v18, v24);
      }
      CFDataAppendBytes(v23, v37, 12);
      v14 += 12;
      --v12;
    }
    while (v12);
  }
  *(_DWORD *)bytes = 0;
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), bytes, 4);
  CFIndex v26 = CFDataGetLength(theData);
  if (v26)
  {
    CFIndex v27 = v26;
    __int16 v28 = *(__CFData **)(a1 + 40);
    BytePtr = CFDataGetBytePtr(theData);
    CFDataAppendBytes(v28, BytePtr, v27);
    CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), zero, -(int)v27 & 3);
  }
  CFRelease(theData);
  return 0;
}

uint64_t _readTag(uint64_t a1, int a2)
{
  LOWORD(v9) = CMPhotoDNGRead16((unsigned __int16 *)a1, a2);
  int v4 = CMPhotoDNGRead16((unsigned __int16 *)(a1 + 2), a2);
  WORD1(v9) = v4;
  int v5 = CMPhotoDNGRead32((unsigned int *)(a1 + 4), a2);
  HIDWORD(v9) = v5;
  if (v5 * tiffDataTypeToSize[v4] <= 4 && ((0x2A10uLL >> v4) & 1) == 0)
  {
    if ((0xC6uLL >> v4))
    {
      __memcpy_chk();
    }
    else
    {
      int v7 = v5;
      if (v4 == 8 || v4 == 3)
      {
        CMPhotoDNGRead16((unsigned __int16 *)(a1 + 8), a2);
        if (v7 == 2) {
          CMPhotoDNGRead16((unsigned __int16 *)(a1 + 10), a2);
        }
      }
    }
  }
  else
  {
    CMPhotoDNGRead32((unsigned int *)(a1 + 8), a2);
  }
  return v9;
}

void _pixelBufferPlanarReleaseCallback(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void _pixelBufferReleaseCallback(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

Class initCIFilter()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  Class result = objc_getClass("CIFilter");
  classCIFilter = (uint64_t)result;
  getClass CIFilterClass = CIFilterFunction;
  return result;
}

uint64_t CIFilterFunction()
{
  return classCIFilter;
}

Class initCIRenderDestination()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  Class result = objc_getClass("CIRenderDestination");
  classCIRenderDestination = (uint64_t)result;
  getCIRenderDestinationClass = CIRenderDestinationFunction;
  return result;
}

uint64_t CIRenderDestinationFunction()
{
  return classCIRenderDestination;
}

Class initCIContext_0()
{
  if (CoreImageLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  }
  Class result = objc_getClass("CIContext");
  classCIContext_0 = (uint64_t)result;
  getClass CIContextClass_0 = CIContextFunction_0;
  return result;
}

uint64_t CIContextFunction_0()
{
  return classCIContext_0;
}

uint64_t ___addAuxiliaryImagesToJPEGData_block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294950739;
  }
  unint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"ImageList"];
  if (v3)
  {
    int v4 = (void *)[v3 objectAtIndexedSubscript:0];
    if (v4)
    {
      int v5 = (void *)[v4 objectForKeyedSubscript:@"Auxiliary"];
      if (v5)
      {
        uint64_t v6 = v5;
        int v7 = [v5 count];
        if (v7 < 1) {
          return 0;
        }
        uint64_t v8 = v7 + 1;
        while (1)
        {
          uint64_t v9 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", (v8 - 2)), "objectForKeyedSubscript:", @"ImageHandle");
          if (!v9) {
            break;
          }
          if (([*(id *)(a1 + 32) containsObject:v9] & 1) == 0) {
            [v6 removeObjectAtIndex:(v8 - 2)];
          }
          if ((unint64_t)--v8 <= 1) {
            return 0;
          }
        }
      }
    }
  }
  return 4294950739;
}

uint64_t _cmphotoDNGReaderInit(uint64_t a1, CFDataRef theData)
{
  if (!theData) {
    return 4294950746;
  }
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)a1 = CFDataGetBytePtr(theData);
  unsigned int Length = CFDataGetLength(theData);
  *(_DWORD *)(a1 + 8) = Length;
  if (Length < 9) {
    return 4294950743;
  }
  int v5 = *(_DWORD **)a1;
  if (**(_DWORD **)a1 == _cmphotoDNGReaderInit_sTiffHeaderLE)
  {
    int v7 = 0;
  }
  else
  {
    if (*v5 != _cmphotoDNGReaderInit_sTiffHeaderBE) {
      return 4294950743;
    }
    int v7 = 1;
  }
  *(unsigned char *)(a1 + 26) = v7;
  unsigned int v8 = CMPhotoDNGRead32(v5 + 1, v7);
  return _cmphotoDNGReaderOpenIFD(a1, v8);
}

uint64_t _readSubFileType(uint64_t a1, _DWORD *a2)
{
  if (*(_WORD *)(a1 + 24))
  {
    int v4 = 0;
    int v5 = *(unsigned __int16 **)(a1 + 16);
    while (CMPhotoDNGRead16(v5, *(unsigned __int8 *)(a1 + 26)) != 254)
    {
      v5 += 6;
      if (++v4 >= *(unsigned __int16 *)(a1 + 24)) {
        goto LABEL_5;
      }
    }
    _readTag((uint64_t)v5, *(unsigned __int8 *)(a1 + 26));
    uint64_t result = 1;
  }
  else
  {
LABEL_5:
    int v6 = 0;
    uint64_t result = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t _readPreviewTags(void *a1, CFDataRef *a2)
{
  int TagDataNvals = _getTagDataNvals((uint64_t)a1, 277, &v12);
  int v5 = _getTagDataNvals((uint64_t)a1, 254, &v12);
  int v10 = 0;
  int v11 = 0;
  int v6 = _getTagDataNvals((uint64_t)a1, 273, &v11);
  int v7 = _getTagDataNvals((uint64_t)a1, 279, &v10);
  _getTagDataNvals((uint64_t)a1, 259, &v12);
  CFDataRef v8 = 0;
  if (!v11 || !v10)
  {
LABEL_8:
    uint64_t result = 0;
    *a2 = v8;
    return result;
  }
  uint64_t result = 4294950743;
  if (v11 == 1 && v10 == 1 && v5 == 1 && TagDataNvals == 3)
  {
    CFDataRef v8 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)(*a1 + v6), v7);
    if (!v8) {
      return 4294950745;
    }
    goto LABEL_8;
  }
  return result;
}

uint64_t _readRawImageTags(unint64_t a1, __CFDictionary *a2, uint64_t a3, int a4, int *a5, int *a6, int *a7, int *a8, int *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12, unsigned __int16 **a13, unsigned __int16 **a14)
{
  if (!a1) {
    return 4294950746;
  }
  int TagDataNvals = _getTagDataNvals(a1, 254, v147);
  if ((TagDataNvals | 0x10) != 0x10) {
    return 4294950738;
  }
  int v22 = TagDataNvals;
  int v23 = _getTagDataNvals(a1, 262, v147);
  *a12 = v23;
  if (v23 == 34892)
  {
    if (!*(_WORD *)(a1 + 24)) {
      return 4294950743;
    }
    int v26 = 0;
    for (uint64_t i = *(unsigned __int16 **)(a1 + 16);
          CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != 258;
          i += 6)
    {
      if (++v26 >= *(unsigned __int16 *)(a1 + 24)) {
        return 4294950743;
      }
    }
    uint64_t Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
    if (HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5) {
      unsigned int v30 = i + 4;
    }
    else {
      unsigned int v30 = (unsigned __int16 *)(*(void *)a1 + v29);
    }
    int v35 = CMPhotoDNGRead16(v30, *(unsigned __int8 *)(a1 + 26));
    if (a4) {
      int v36 = 1815491698;
    }
    else {
      int v36 = 1647589490;
    }
    if (v35 == 8) {
      int v36 = 1111970369;
    }
    int v140 = v36;
    if (!_copyShortsToDictAsArray(a1, 258, @"BitsPerSample", a2)) {
      return 4294950743;
    }
    int v37 = _copyShortsOrLongOrRationalToDictAsArray(a1, (const void *)*MEMORY[0x1E4F2F5D8], a2);
    if (v22 != 16 && !v37) {
      return 4294950743;
    }
    CFIndex v146 = a7;
    BOOL v38 = _copyShortsToDictAsArray(a1, 50717, (const void *)*MEMORY[0x1E4F2F6A0], a2);
    if (v22 != 16 && !v38) {
      return 4294950743;
    }
    _copyIntegerTagToDict(a1, 51110);
    _copyStringTagToDict(a1, 50936, (const void *)*MEMORY[0x1E4F2F670], a2);
    _copyRationalTagToDict(a1, 50935, (const void *)*MEMORY[0x1E4F2F650], a2);
    goto LABEL_34;
  }
  if (v23 != 32803) {
    return 4294950738;
  }
  if (_getTagDataNvals(a1, 258, v147) != 16
    || _getTagDataNvals(a1, 277, v147) != 1
    || _getTagDataNvals(a1, 284, v147) != 1
    || !*(_WORD *)(a1 + 24))
  {
    return 4294950743;
  }
  int v24 = 0;
  for (uint64_t j = *(unsigned __int16 **)(a1 + 16);
        CMPhotoDNGRead16(j, *(unsigned __int8 *)(a1 + 26)) != 33422;
        j += 6)
  {
    if (++v24 >= *(unsigned __int16 *)(a1 + 24)) {
      return 4294950743;
    }
  }
  unint64_t v31 = _readTag((uint64_t)j, *(unsigned __int8 *)(a1 + 26));
  unint64_t v33 = HIDWORD(v31);
  uint64_t v34 = HIDWORD(v31) * tiffDataTypeToSize[WORD1(v31)] < 5 ? (uint64_t)(j + 4) : *(void *)a1 + v32;
  BOOL v41 = HIDWORD(v31) == 16 || HIDWORD(v31) == 4;
  if (!v41 || (v31 & 0xFFFF0000) != 0x10000) {
    return 4294950743;
  }
  BOOL v42 = v33 == 16 || v33 == 4;
  uint64_t result = 4294950743;
  if (!v42 || !v34) {
    return result;
  }
  if (v33 == 4)
  {
    if (*(_DWORD *)v34 != 65794)
    {
      if (*(_DWORD *)v34 != 33620224)
      {
        int v46 = 1734505012;
        if (*(_DWORD *)v34 != 16908289)
        {
          if (*(_DWORD *)v34 != 16777729) {
            return result;
          }
          goto LABEL_160;
        }
        goto LABEL_159;
      }
      goto LABEL_148;
    }
  }
  else
  {
    if (v33 != 16) {
      return result;
    }
    if (*(void *)v34 != 0x101020201010202 || *(void *)(v34 + 8) != 0x10100000101)
    {
      if (*(void *)v34 != 0x101000001010000 || *(void *)(v34 + 8) != 0x202010102020101)
      {
        int v46 = 1734505012;
        if (*(void *)v34 != 0x10100000101 || *(void *)(v34 + 8) != 0x101020201010202)
        {
          uint64_t v49 = *(void *)v34;
          uint64_t v48 = *(void *)(v34 + 8);
          if (v49 != 0x202010102020101 || v48 != 0x101000001010000) {
            return result;
          }
          goto LABEL_160;
        }
LABEL_159:
        int v46 = 1735549492;
        goto LABEL_160;
      }
LABEL_148:
      int v46 = 1919379252;
      goto LABEL_160;
    }
  }
  int v46 = 1650943796;
LABEL_160:
  if (!*(_WORD *)(a1 + 24)) {
    return result;
  }
  int v140 = v46;
  unsigned int v101 = 0;
  uint64_t v102 = *(unsigned __int16 **)(a1 + 16);
  while (CMPhotoDNGRead16(v102, *(unsigned __int8 *)(a1 + 26)) != 50714)
  {
    v102 += 6;
    ++v101;
    uint64_t result = 4294950743;
    if (v101 >= *(unsigned __int16 *)(a1 + 24)) {
      return result;
    }
  }
  uint64_t v103 = _readTag((uint64_t)v102, *(unsigned __int8 *)(a1 + 26));
  if (WORD1(v103) == 5)
  {
    if (!_copyShortsOrLongOrRationalToDictAsArray(a1, (const void *)*MEMORY[0x1E4F2F5D8], a2)) {
      return 4294950743;
    }
  }
  else
  {
    if (WORD1(v103) - 3 > 1 || (v103 & 0xFFFFFFFF00000000) != 0x100000000) {
      return 4294950743;
    }
    FigCFDictionarySetInt();
  }
  if (!*(_WORD *)(a1 + 24)) {
    return 4294950743;
  }
  unsigned int v105 = 0;
  double v106 = *(unsigned __int16 **)(a1 + 16);
  while (CMPhotoDNGRead16(v106, *(unsigned __int8 *)(a1 + 26)) != 50717)
  {
    v106 += 6;
    ++v105;
    uint64_t result = 4294950743;
    if (v105 >= *(unsigned __int16 *)(a1 + 24)) {
      return result;
    }
  }
  CFIndex v146 = a7;
  unint64_t v109 = _readTag((uint64_t)v106, *(unsigned __int8 *)(a1 + 26));
  if (HIDWORD(v109) != 1 || WORD1(v109) - 3 > 1) {
    return 4294950743;
  }
  FigCFDictionarySetInt();
LABEL_34:
  uint64_t v139 = a8;
  if (*(_WORD *)(a1 + 24))
  {
    int v39 = 0;
    CFStringRef v40 = *(unsigned __int16 **)(a1 + 16);
    while (CMPhotoDNGRead16(v40, *(unsigned __int8 *)(a1 + 26)) != 51022)
    {
      v40 += 6;
      if (++v39 >= *(unsigned __int16 *)(a1 + 24)) {
        goto LABEL_104;
      }
    }
    uint64_t v51 = _readTag((uint64_t)v40, *(unsigned __int8 *)(a1 + 26));
    if (HIDWORD(v51) * tiffDataTypeToSize[WORD1(v51)] < 5) {
      double v53 = (unsigned int *)(v40 + 4);
    }
    else {
      double v53 = (unsigned int *)(*(void *)a1 + v52);
    }
    int v143 = CMPhotoDNGRead32(v53, 1);
    if (v143)
    {
      int v54 = 0;
      double v55 = (unint64_t *)(v53 + 1);
      unsigned int v136 = (__CFString *)*MEMORY[0x1E4F2F638];
      uint64_t v134 = (__CFString *)*MEMORY[0x1E4F2F690];
      float v132 = (__CFString *)*MEMORY[0x1E4F2F698];
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      while (2)
      {
        int v56 = CMPhotoDNGRead32((unsigned int *)v55, 1);
        int v57 = CMPhotoDNGRead32((unsigned int *)v55 + 3, 1);
        int v58 = v57;
        double v59 = v55 + 2;
        switch(v56)
        {
          case 1:
            unsigned int v60 = 6 * CMPhotoDNGRead32((unsigned int *)v55 + 4, 1) + 2;
            if (((16 * (v60 >> 1)) | 4) == v58)
            {
              double v59 = (unint64_t *)((char *)v55 + 20);
              CFTypeID v61 = v132;
              if (v60) {
                goto LABEL_95;
              }
            }
            break;
          case 2:
            unsigned int v60 = (4 * CMPhotoDNGRead32((unsigned int *)v55 + 4, 1)) | 2;
            if (((16 * (v60 >> 1)) | 4) == v58)
            {
              double v59 = (unint64_t *)((char *)v55 + 20);
              CFTypeID v61 = v134;
              goto LABEL_91;
            }
            break;
          case 3:
            if (v57 == 56)
            {
              unsigned int v60 = 7;
              CFTypeID v61 = v136;
              goto LABEL_95;
            }
            break;
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            break;
          case 9:
            int v129 = CMPhotoDNGRead32((unsigned int *)v55 + 4, 1);
            int v128 = CMPhotoDNGRead32((unsigned int *)v55 + 5, 1);
            int v145 = CMPhotoDNGRead32((unsigned int *)v55 + 6, 1);
            int v138 = CMPhotoDNGRead32((unsigned int *)v55 + 7, 1);
            int v137 = CMPhotoDNGRead32((unsigned int *)v55 + 8, 1);
            int v135 = CMPhotoDNGRead32((unsigned int *)v55 + 9, 1);
            int v133 = CMPhotoDNGRead32((unsigned int *)v55 + 10, 1);
            int v131 = CMPhotoDNGRead32((unsigned int *)v55 + 11, 1);
            int v111 = CMPhotoDNGRead32((unsigned int *)v55 + 12, 1);
            int v112 = CMPhotoDNGRead32((unsigned int *)v55 + 13, 1);
            double v113 = CMPhotoDNGReadDouble(v55 + 7, 1);
            double v114 = CMPhotoDNGReadDouble(v55 + 8, 1);
            double v115 = CMPhotoDNGReadDouble(v55 + 9, 1);
            double v116 = CMPhotoDNGReadDouble(v55 + 10, 1);
            int v117 = v112;
            int v126 = CMPhotoDNGRead32((unsigned int *)v55 + 22, 1);
            CFIndex v118 = (v112 * v111 * v126);
            if ((4 * v118) + 76 == v58)
            {
              int v119 = v111;
              CFMutableArrayRef Mutable = CFArrayCreateMutable(allocator, v118, MEMORY[0x1E4F1D510]);
              if (Mutable)
              {
                float v121 = Mutable;
                if (v118)
                {
                  float v122 = (unsigned int *)v55 + 23;
                  do
                  {
                    float v123 = CMPhotoDNGReadFloat(v122, 1);
                    CMPhotoCFArrayAppendFloat(v121, v123);
                    LODWORD(v118) = v118 - 1;
                  }
                  while (v118);
                }
                float v124 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                CMPhotoCFDictionarySetInt32(v124, @"top", v129);
                CMPhotoCFDictionarySetInt32(v124, @"left", v128);
                CMPhotoCFDictionarySetInt32(v124, @"bottom", v145);
                CMPhotoCFDictionarySetInt32(v124, @"right", v138);
                CMPhotoCFDictionarySetInt32(v124, @"plane", v137);
                CMPhotoCFDictionarySetInt32(v124, @"planes", v135);
                CMPhotoCFDictionarySetInt32(v124, @"rowPitch", v133);
                CMPhotoCFDictionarySetInt32(v124, @"colPitch", v131);
                CMPhotoCFDictionarySetInt32(v124, @"mapsPointsV", v119);
                CMPhotoCFDictionarySetInt32(v124, @"mapsPointsH", v117);
                CMPhotoCFDictionarySetDouble(v124, @"mapsSpacingV", v113);
                CMPhotoCFDictionarySetDouble(v124, @"mapsSpacingH", v114);
                CMPhotoCFDictionarySetDouble(v124, @"mapOriginV", v115);
                CMPhotoCFDictionarySetDouble(v124, @"mapOriginH", v116);
                CMPhotoCFDictionarySetInt32(v124, @"mapPlanes", v126);
                CFDictionarySetValue(v124, @"gainData", v121);
                CFDictionarySetValue(a2, @"GainMap", v124);
                CFRelease(v121);
                if (v124) {
                  CFRelease(v124);
                }
              }
            }
            break;
          default:
            if (v56 == 14)
            {
              unsigned int v60 = 19 * CMPhotoDNGRead32((unsigned int *)v55 + 4, 1) + 2;
              if (8 * v60 + 8 == v58)
              {
                double v59 = (unint64_t *)((char *)v55 + 20);
                CFTypeID v61 = @"WarpRectilinear2";
LABEL_91:
                if (v60)
                {
LABEL_95:
                  if (v61)
                  {
                    int v62 = v56 == 14 ? v60 + 1 : v60;
                    CFArrayRef v63 = CFArrayCreateMutable(allocator, v62, MEMORY[0x1E4F1D510]);
                    if (v63)
                    {
                      do
                      {
                        double v64 = CMPhotoDNGReadDouble(v59++, 1);
                        CMPhotoCFArrayAppendDouble(v63, v64);
                        --v60;
                      }
                      while (v60);
                      if (v56 == 14)
                      {
                        int v65 = CMPhotoDNGRead32((unsigned int *)v59, 1);
                        double v59 = (unint64_t *)((char *)v59 + 4);
                        CMPhotoCFArrayAppendInt32(v63, v65);
                      }
                      CFDictionarySetValue(a2, v61, v63);
                      CFRelease(v63);
                      ++v54;
                      double v55 = v59;
                      if (v54 != v143) {
                        continue;
                      }
                    }
                  }
                }
              }
            }
            break;
        }
        break;
      }
    }
  }
LABEL_104:
  _copyDoublesToDictAsArray(a1, (const void *)*MEMORY[0x1E4F2F648], a2);
  _copyLongsToDictAsArray(a1, 50829, (const void *)*MEMORY[0x1E4F2F590], a2);
  _copyLongsToDictAsArray(a1, 50720, (const void *)*MEMORY[0x1E4F2F628], a2);
  _copyLongsToDictAsArray(a1, 50719, (const void *)*MEMORY[0x1E4F2F620], a2);
  int v66 = _getTagDataNvals(a1, 256, v147);
  int v67 = _getTagDataNvals(a1, 257, v147);
  uint64_t result = 4294950743;
  if (v66 >= 1 && v67 >= 1 && *(_WORD *)(a1 + 24))
  {
    unsigned int v68 = 0;
    double v69 = *(unsigned __int16 **)(a1 + 16);
    int allocatora = v66;
    while (1)
    {
      int v70 = CMPhotoDNGRead16(v69, *(unsigned __int8 *)(a1 + 26));
      if (v70 == 324) {
        break;
      }
      v69 += 6;
      ++v68;
      unsigned int v71 = *(unsigned __int16 *)(a1 + 24);
      if (v68 >= v71)
      {
        int v72 = 0;
        LODWORD(v144) = 0;
        float v73 = 0;
        goto LABEL_115;
      }
    }
    unint64_t v74 = _readTag((uint64_t)v69, *(unsigned __int8 *)(a1 + 26));
    int v72 = WORD1(v74);
    unint64_t v144 = HIDWORD(v74);
    if (HIDWORD(v74) * tiffDataTypeToSize[WORD1(v74)] < 5) {
      float v73 = v69 + 4;
    }
    else {
      float v73 = (unsigned __int16 *)(*(void *)a1 + v75);
    }
    unsigned int v71 = *(unsigned __int16 *)(a1 + 24);
LABEL_115:
    if (!v71) {
      return 4294950743;
    }
    float v130 = v73;
    unsigned int v76 = 0;
    float v77 = *(unsigned __int16 **)(a1 + 16);
    while (CMPhotoDNGRead16(v77, *(unsigned __int8 *)(a1 + 26)) != 325)
    {
      v77 += 6;
      ++v76;
      unsigned int v78 = *(unsigned __int16 *)(a1 + 24);
      if (v76 >= v78)
      {
        unsigned int v79 = 0;
        LODWORD(v80) = 0;
        int v81 = 0;
        goto LABEL_140;
      }
    }
    unint64_t v82 = _readTag((uint64_t)v77, *(unsigned __int8 *)(a1 + 26));
    int v81 = WORD1(v82);
    unint64_t v80 = HIDWORD(v82);
    if (HIDWORD(v82) * tiffDataTypeToSize[WORD1(v82)] < 5) {
      unsigned int v79 = v77 + 4;
    }
    else {
      unsigned int v79 = (unsigned __int16 *)(*(void *)a1 + v83);
    }
    uint64_t v84 = v146;
    if (v70 == 324)
    {
      if (v144 != HIDWORD(v82) || v72 != 4 || WORD1(v82) - 3 > 1) {
        return 4294950743;
      }
      uint64_t result = 4294950743;
      int v87 = allocatora;
      if (!v130 || !v79) {
        return result;
      }
      _copyDNGDataTagToDict(a1, 52525, @"ProfileGainTableMapPacked", a2);
      if ((int)v144 >= 2)
      {
        int v88 = _getTagDataNvals(a1, 322, v147);
        int v89 = _getTagDataNvals(a1, 323, v147);
        uint64_t result = 4294950741;
        if (!v88) {
          return result;
        }
        if (!v89) {
          return result;
        }
        uint64_t result = 4294950743;
        if (v88 > allocatora || v89 > v67) {
          return result;
        }
        goto LABEL_191;
      }
LABEL_190:
      int v88 = v87;
      int v89 = v67;
LABEL_191:
      int v108 = _getTagDataNvals(a1, 259, v147);
      if (a5) {
        *a5 = v87;
      }
      if (a6) {
        *a6 = v67;
      }
      if (v84) {
        *uint64_t v84 = v88;
      }
      if (v139) {
        *uint64_t v139 = v89;
      }
      if (a9) {
        *a9 = v140;
      }
      if (a10) {
        *a10 = v144;
      }
      if (a11) {
        *a11 = v108;
      }
      if (a13) {
        *a13 = v130;
      }
      uint64_t result = 0;
      if (a14) {
        *a14 = v79;
      }
      return result;
    }
    unsigned int v78 = *(unsigned __int16 *)(a1 + 24);
LABEL_140:
    if (!v78) {
      return 4294950743;
    }
    int v125 = v81;
    float v127 = v79;
    unsigned int v90 = 0;
    double v91 = *(unsigned __int16 **)(a1 + 16);
    while (1)
    {
      int v92 = CMPhotoDNGRead16(v91, *(unsigned __int8 *)(a1 + 26));
      if (v92 == 273) {
        break;
      }
      v91 += 6;
      ++v90;
      unsigned int v93 = *(unsigned __int16 *)(a1 + 24);
      if (v90 >= v93) {
        goto LABEL_151;
      }
    }
    unint64_t v94 = _readTag((uint64_t)v91, *(unsigned __int8 *)(a1 + 26));
    int v72 = WORD1(v94);
    unint64_t v144 = HIDWORD(v94);
    if (HIDWORD(v94) * tiffDataTypeToSize[WORD1(v94)] < 5) {
      uint64_t v96 = v91 + 4;
    }
    else {
      uint64_t v96 = (unsigned __int16 *)(*(void *)a1 + v95);
    }
    float v130 = v96;
    unsigned int v93 = *(unsigned __int16 *)(a1 + 24);
LABEL_151:
    if (v93)
    {
      int v97 = 0;
      CFDictionaryRef v98 = *(unsigned __int16 **)(a1 + 16);
      while (CMPhotoDNGRead16(v98, *(unsigned __int8 *)(a1 + 26)) != 279)
      {
        v98 += 6;
        if (++v97 >= *(unsigned __int16 *)(a1 + 24))
        {
          unsigned int v93 = 0;
          goto LABEL_156;
        }
      }
      unint64_t v99 = _readTag((uint64_t)v98, *(unsigned __int8 *)(a1 + 26));
      int v125 = WORD1(v99);
      unint64_t v80 = HIDWORD(v99);
      if (HIDWORD(v99) * tiffDataTypeToSize[WORD1(v99)] < 5) {
        unsigned int v79 = v98 + 4;
      }
      else {
        unsigned int v79 = (unsigned __int16 *)(*(void *)a1 + v100);
      }
      unsigned int v93 = 1;
    }
    else
    {
LABEL_156:
      unsigned int v79 = v127;
    }
    uint64_t result = 4294950743;
    uint64_t v84 = v146;
    if (v92 == 273)
    {
      unsigned int v107 = v72 - 5;
      int v87 = allocatora;
      if (v107 >= 0xFFFFFFFE)
      {
        if ((v125 - 3) >= 2) {
          unsigned int v93 = 0;
        }
        if (v144 == v80 && v93)
        {
          if (v144 != 1 || _getTagDataNvals(a1, 278, v147) != v67) {
            return 4294950738;
          }
          _copyDNGDataTagToDict(a1, 52525, @"ProfileGainTableMapPacked", a2);
          LODWORD(v144) = 1;
          goto LABEL_190;
        }
      }
    }
  }
  return result;
}

uint64_t _getTagDataNvals(uint64_t a1, int a2, _DWORD *a3)
{
  LODWORD(v4) = *(unsigned __int16 *)(a1 + 24);
  if (*(_WORD *)(a1 + 24))
  {
    int v7 = 0;
    CFDataRef v8 = *(unsigned __int16 **)(a1 + 16);
    while (CMPhotoDNGRead16(v8, *(unsigned __int8 *)(a1 + 26)) != a2)
    {
      v8 += 6;
      if (++v7 >= *(unsigned __int16 *)(a1 + 24))
      {
        LODWORD(v4) = 0;
        goto LABEL_6;
      }
    }
    unint64_t Tag = _readTag((uint64_t)v8, *(unsigned __int8 *)(a1 + 26));
    uint64_t result = v11;
    unint64_t v4 = HIDWORD(Tag);
  }
  else
  {
LABEL_6:
    uint64_t result = 0;
  }
  *a3 = v4;
  return result;
}

uint64_t _cmphotoDNGReaderOpenIFD(uint64_t a1, unsigned int a2)
{
  if (a2 < 8) {
    return 4294950743;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 8);
  unsigned int v5 = v4 - a2;
  if (v4 <= a2) {
    return 4294950743;
  }
  if (v5 < 6) {
    return 4294950743;
  }
  int v6 = CMPhotoDNGRead16((unsigned __int16 *)(*(void *)a1 + a2), *(unsigned __int8 *)(a1 + 26));
  if (v5 < 12 * v6 + 6) {
    return 4294950743;
  }
  __int16 v7 = v6;
  uint64_t result = 0;
  *(_WORD *)(a1 + 24) = v7;
  *(void *)(a1 + 16) = *(void *)a1 + a2 + 2;
  return result;
}

CFStringRef _copyStringTag(uint64_t a1, int a2)
{
  if (!*(_WORD *)(a1 + 24)) {
    return 0;
  }
  int v4 = 0;
  for (uint64_t i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v4 >= *(unsigned __int16 *)(a1 + 24)) {
      return 0;
    }
  }
  unint64_t Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  unint64_t v8 = HIDWORD(Tag);
  uint64_t v9 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5
     ? (const UInt8 *)(i + 4)
     : (const UInt8 *)(*(void *)a1 + v7);
  if ((Tag & 0xFFFF0000) != 0x20000 || v9 == 0) {
    return 0;
  }
  if (HIDWORD(Tag) >= 2 && !v9[HIDWORD(Tag) - 1]) {
    LODWORD(v8) = HIDWORD(Tag) - 1;
  }
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  return CFStringCreateWithBytes(v12, v9, (int)v8, 0x8000100u, 0);
}

void _copyStringTagToDict(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  CFStringRef v6 = _copyStringTag(a1, a2);
  if (v6)
  {
    CFStringRef v7 = v6;
    CFDictionarySetValue(a4, a3, v6);
    CFRelease(v7);
  }
}

unint64_t _copyIntegerTagToDict(unint64_t result, int a2)
{
  if (*(_WORD *)(result + 24))
  {
    unint64_t v3 = result;
    int v4 = 0;
    for (uint64_t i = *(unsigned __int16 **)(result + 16); ; i += 6)
    {
      uint64_t result = CMPhotoDNGRead16(i, *(unsigned __int8 *)(v3 + 26));
      if (result == a2) {
        break;
      }
      if (++v4 >= *(unsigned __int16 *)(v3 + 24)) {
        return result;
      }
    }
    uint64_t result = _readTag((uint64_t)i, *(unsigned __int8 *)(v3 + 26));
    BOOL v6 = HIDWORD(result) != 1 || WORD1(result) > 0xDu;
    if (!v6 && ((0x2BDFuLL >> SBYTE2(result)) & 1) != 0)
    {
      return FigCFDictionarySetInt();
    }
  }
  return result;
}

void _copyVersionToDictAsString(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  if (*(_WORD *)(a1 + 24))
  {
    int v8 = 0;
    for (uint64_t i = *(unsigned __int16 **)(a1 + 16);
          CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2;
          i += 6)
    {
      if (++v8 >= *(unsigned __int16 *)(a1 + 24)) {
        return;
      }
    }
    uint64_t Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
    if (HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5) {
      CFAllocatorRef v12 = (unsigned __int8 *)(i + 4);
    }
    else {
      CFAllocatorRef v12 = (unsigned __int8 *)(*(void *)a1 + v11);
    }
    if ((Tag & 0xFFFF0000) == 0x10000 && HIDWORD(Tag) == 4)
    {
      CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      if (Mutable)
      {
        int v15 = Mutable;
        unsigned int v16 = CMPhotoDNGRead8(v12);
        CFStringAppendFormat(v15, 0, @"%d", v16);
        CFStringAppendFormat(v15, 0, @".", 0);
        unsigned int v17 = CMPhotoDNGRead8(v12 + 1);
        CFStringAppendFormat(v15, 0, @"%d", v17);
        CFStringAppendFormat(v15, 0, @".", 0);
        unsigned int v18 = CMPhotoDNGRead8(v12 + 2);
        CFStringAppendFormat(v15, 0, @"%d", v18);
        CFStringAppendFormat(v15, 0, @".", 0);
        unsigned int v19 = CMPhotoDNGRead8(v12 + 3);
        CFStringAppendFormat(v15, 0, @"%d", v19);
        CFDictionarySetValue(a4, a3, v15);
        CFRelease(v15);
      }
    }
  }
}

uint64_t _copyRationalTagToDict(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  if (!*(_WORD *)(a1 + 24)) {
    return 0;
  }
  int v8 = 0;
  for (uint64_t i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v8 >= *(unsigned __int16 *)(a1 + 24)) {
      return 0;
    }
  }
  unint64_t Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  CFIndex v12 = HIDWORD(Tag);
  int v13 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5
      ? (unsigned int *)(i + 4)
      : (unsigned int *)(*(void *)a1 + v11);
  BOOL v14 = WORD1(Tag) == 10 || WORD1(Tag) == 5;
  if (!v14 || !HIDWORD(Tag)) {
    return 0;
  }
  if (HIDWORD(Tag) == 1)
  {
    CMPhotoDNGReadRational(v13, *(unsigned __int8 *)(a1 + 26));
    FigCFDictionarySetDouble();
    return 1;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, MEMORY[0x1E4F1D510]);
  if (!Mutable) {
    return 0;
  }
  CFMutableArrayRef v16 = Mutable;
  while (1)
  {
    CMPhotoDNGReadRational(v13, *(unsigned __int8 *)(a1 + 26));
    if (FigCFArrayAppendDouble()) {
      break;
    }
    v13 += 2;
    LODWORD(v12) = v12 - 1;
    if (!v12)
    {
      CFDictionarySetValue(a4, a3, v16);
      uint64_t v18 = 1;
      goto LABEL_25;
    }
  }
  uint64_t v18 = 0;
LABEL_25:
  CFRelease(v16);
  return v18;
}

void _copyDNGDataTagToDict(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  if (*(_WORD *)(a1 + 24))
  {
    int v8 = 0;
    for (uint64_t i = *(unsigned __int16 **)(a1 + 16);
          CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2;
          i += 6)
    {
      if (++v8 >= *(unsigned __int16 *)(a1 + 24)) {
        return;
      }
    }
    unint64_t Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
    if (HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5) {
      CFIndex v12 = (const UInt8 *)(i + 4);
    }
    else {
      CFIndex v12 = (const UInt8 *)(*(void *)a1 + v11);
    }
    if (HIDWORD(Tag))
    {
      CFDataRef v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, HIDWORD(Tag));
      if (v13)
      {
        CFDataRef v14 = v13;
        CFDictionarySetValue(a4, a3, v13);
        CFRelease(v14);
      }
    }
  }
}

void _copyDoublesToDictAsArray(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  if (*(_WORD *)(a1 + 24))
  {
    int v6 = 0;
    for (uint64_t i = *(unsigned __int16 **)(a1 + 16);
          CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != 51041;
          i += 6)
    {
      if (++v6 >= *(unsigned __int16 *)(a1 + 24)) {
        return;
      }
    }
    unint64_t Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
    CFIndex v10 = HIDWORD(Tag);
    if (HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5) {
      unsigned int v11 = (unint64_t *)(i + 4);
    }
    else {
      unsigned int v11 = (unint64_t *)(*(void *)a1 + v9);
    }
    if ((Tag & 0xFFFF0000) == 0xC0000)
    {
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, MEMORY[0x1E4F1D510]);
      if (Mutable)
      {
        CFDataRef v13 = Mutable;
        if (v10)
        {
          while (1)
          {
            double v14 = CMPhotoDNGReadDouble(v11, *(unsigned __int8 *)(a1 + 26));
            if (CMPhotoCFArrayAppendDouble(v13, v14)) {
              break;
            }
            ++v11;
            LODWORD(v10) = v10 - 1;
            if (!v10) {
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:
          CFDictionarySetValue(a3, a2, v13);
        }
        CFRelease(v13);
      }
    }
  }
}

__CFArray *_createFloatArrayFromRationals(uint64_t a1, int a2, int a3)
{
  if (!*(_WORD *)(a1 + 24)) {
    return 0;
  }
  int v6 = 0;
  for (uint64_t i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v6 >= *(unsigned __int16 *)(a1 + 24)) {
      return 0;
    }
  }
  unint64_t Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  int v10 = WORD1(Tag);
  if (HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] > 4)
  {
    if (*(void *)a1)
    {
      unsigned int v11 = (unsigned int *)(*(void *)a1 + v9);
      goto LABEL_10;
    }
    return 0;
  }
  unsigned int v11 = (unsigned int *)(i + 4);
LABEL_10:
  BOOL v12 = WORD1(Tag) == 10 || WORD1(Tag) == 5;
  if (!v12 || HIDWORD(Tag) != a3) {
    return 0;
  }
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  for (uint64_t j = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], HIDWORD(Tag), MEMORY[0x1E4F1D510]); a3; --a3)
  {
    uint64_t v15 = CMPhotoDNGReadRational(v11, *(unsigned __int8 *)(a1 + 26));
    if (HIDWORD(v15))
    {
      if (v10 == 5)
      {
        double v16 = (double)v15;
        double v17 = (double)HIDWORD(v15);
      }
      else
      {
        double v16 = (double)(int)v15;
        double v17 = (double)SHIDWORD(v15);
      }
      double v18 = v16 / v17;
    }
    else
    {
      double v18 = 0.0;
    }
    float v19 = v18;
    float valuePtr = v19;
    CFNumberRef v20 = CFNumberCreate(v13, kCFNumberFloatType, &valuePtr);
    CFArrayAppendValue(j, v20);
    if (v20) {
      CFRelease(v20);
    }
    v11 += 2;
  }
  return j;
}

uint64_t _copyShortsOrLongOrRationalToDictAsArray(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  if (!*(_WORD *)(a1 + 24)) {
    return 0;
  }
  int v6 = 0;
  for (uint64_t i = *(unsigned __int16 **)(a1 + 16);
        CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != 50714;
        i += 6)
  {
    if (++v6 >= *(unsigned __int16 *)(a1 + 24)) {
      return 0;
    }
  }
  unsigned int v9 = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26)) >> 16;
  switch(v9)
  {
    case 3u:
      return _copyShortsToDictAsArray(a1, 50714, a2, a3);
    case 4u:
      return _copyLongsToDictAsArray(a1, 50714, a2, a3);
    case 5u:
      return _copyRationalTagToDict(a1, 50714, a2, a3);
    default:
      return 0;
  }
}

BOOL _copyShortsToDictAsArray(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  if (!*(_WORD *)(a1 + 24)) {
    return 0;
  }
  int v8 = 0;
  for (uint64_t i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v8 >= *(unsigned __int16 *)(a1 + 24)) {
      return 0;
    }
  }
  unint64_t Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  CFIndex v12 = HIDWORD(Tag);
  CFAllocatorRef v13 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5
      ? i + 4
      : (unsigned __int16 *)(*(void *)a1 + v11);
  if ((Tag & 0xFFFF0000) != 0x30000) {
    return 0;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, MEMORY[0x1E4F1D510]);
  if (Mutable)
  {
    CFMutableArrayRef v15 = Mutable;
    if (v12)
    {
      while (1)
      {
        CMPhotoDNGRead16(v13, *(unsigned __int8 *)(a1 + 26));
        int appended = FigCFArrayAppendInt32();
        if (appended) {
          break;
        }
        ++v13;
        LODWORD(v12) = v12 - 1;
        if (!v12) {
          goto LABEL_14;
        }
      }
      int v17 = appended;
    }
    else
    {
LABEL_14:
      CFDictionarySetValue(a4, a3, v15);
      int v17 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    int v17 = -16551;
  }
  return v17 == 0;
}

BOOL _copyLongsToDictAsArray(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  if (!*(_WORD *)(a1 + 24)) {
    return 0;
  }
  int v8 = 0;
  for (uint64_t i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v8 >= *(unsigned __int16 *)(a1 + 24)) {
      return 0;
    }
  }
  unint64_t Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  CFIndex v12 = HIDWORD(Tag);
  CFAllocatorRef v13 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5
      ? (unsigned int *)(i + 4)
      : (unsigned int *)(*(void *)a1 + v11);
  if ((Tag & 0xFFFF0000) != 0x40000) {
    return 0;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, MEMORY[0x1E4F1D510]);
  if (Mutable)
  {
    CFMutableArrayRef v15 = Mutable;
    if (v12)
    {
      while (1)
      {
        int v16 = CMPhotoDNGRead32(v13, *(unsigned __int8 *)(a1 + 26));
        int appended = CMPhotoCFArrayAppendInt32(v15, v16);
        if (appended) {
          break;
        }
        ++v13;
        LODWORD(v12) = v12 - 1;
        if (!v12) {
          goto LABEL_14;
        }
      }
      int v18 = appended;
    }
    else
    {
LABEL_14:
      CFDictionarySetValue(a4, a3, v15);
      int v18 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    int v18 = -16551;
  }
  return v18 == 0;
}

uint64_t _getTagRational(uint64_t a1, int a2, uint64_t *a3)
{
  if (!*(_WORD *)(a1 + 24)) {
    return 0;
  }
  int v6 = 0;
  for (uint64_t i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v6 >= *(unsigned __int16 *)(a1 + 24)) {
      return 0;
    }
  }
  uint64_t Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  int v10 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5
      ? (unsigned int *)(i + 4)
      : (unsigned int *)(*(void *)a1 + v9);
  if (HIDWORD(Tag) != 1) {
    return 0;
  }
  if (WORD1(Tag) != 10 && WORD1(Tag) != 5) {
    return 0;
  }
  *a3 = CMPhotoDNGReadRational(v10, *(unsigned __int8 *)(a1 + 26));
  return 1;
}

void CreateThreadContext(int a1, uint64_t a2, _DWORD *a3)
{
  *a3 = a1;
  a3[1] = 4 * (int)a2 * HIDWORD(a2) / (unint64_t)a1;
  operator new[]();
}

uint64_t DestroyThreadContext(uint64_t a1)
{
  int v2 = *(_DWORD *)a1;
  if (*(int *)a1 >= 1)
  {
    uint64_t v3 = 1;
    do
    {
      uint64_t v4 = *(void *)(a1 + 8 * v3);
      if (v4)
      {
        MEMORY[0x1AD110140](v4, 0x1000C8077774924);
        int v2 = *(_DWORD *)a1;
      }
    }
    while (v3++ < v2);
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    JUMPOUT(0x1AD110140);
  }
  return result;
}

uint64_t EncodeFrameThreads(uint64_t a1, unsigned __int16 *a2, unsigned int a3, _WORD *a4, int a5, int a6)
{
  int v8 = a2;
  v24[1] = *(void ***)MEMORY[0x1E4F143B8];
  int v22 = a2;
  uint64_t v23 = a1;
  int v20 = a6;
  int v21 = a5;
  int v10 = *(void **)(a1 + 72);
  unsigned int v11 = a4 + 2;
  bzero(v10, 0x20000uLL);
  if (a3 >= 2)
  {
    uint64_t v13 = 2 * (a3 >> 1);
    do
    {
      unsigned int v14 = *v8++;
      *((_WORD *)v10 + v14) = 1;
      v13 -= 2;
    }
    while (v13);
  }
  uint64_t v15 = 0;
  __int16 v16 = 0;
  do
  {
    if (*((_WORD *)v10 + v15) == 1)
    {
      *((_WORD *)v10 + v15) = v16++;
      *v11++ = v15;
    }
    ++v15;
  }
  while (v15 != 0x10000);
  *a4 = 23043;
  a4[1] = v16;
  int v17 = *(_DWORD *)a1;
  MEMORY[0x1F4188790](v12);
  std::vector<std::thread>::vector(v19, v17);
  if (v17 >= 1) {
    operator new();
  }
  v24[0] = (void **)v19;
  std::vector<std::thread>::__destroy_vector::operator()[abi:ne180100](v24);
  return (v11 - a4);
}

void sub_1AB9D3600(_Unwind_Exception *exception_object)
{
}

void *std::vector<std::thread>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::thread>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1AB9D36D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *std::vector<std::thread>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<std::thread>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::thread>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<std::thread>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::thread>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5E2CD78, MEMORY[0x1E4FBA1C8]);
}

void sub_1AB9D37C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  CFStringRef v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::vector<std::thread>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  CFStringRef v1 = *a1;
  int v2 = (std::thread *)**a1;
  if (v2)
  {
    uint64_t v4 = (std::thread *)v1[1];
    unsigned int v5 = v2;
    if (v4 != v2)
    {
      do
        std::thread::~thread(v4 - 1);
      while (v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,EncodeFrameThreads::$_0,int,int,int>>(uint64_t *a1)
{
  CFIndex v27 = a1;
  CFStringRef v1 = std::__thread_local_data();
  int v2 = (const void *)*v27;
  *CFIndex v27 = 0;
  pthread_setspecific(v1->__key_, v2);
  uint64_t v3 = v27;
  uint64_t v4 = *((int *)v27 + 14);
  uint64_t v5 = *((int *)v27 + 16);
  int v6 = (unsigned __int16 *)(*(void *)v27[3] + v4);
  unsigned int v7 = *((_DWORD *)v27 + 15) - v4;
  uint64_t v8 = *(void *)v27[4];
  unsigned int v9 = *(unsigned char **)(v8 + 8 * v5 + 8);
  int v10 = *(_DWORD *)v27[5];
  unsigned int v11 = *(_DWORD *)v27[6];
  uint64_t v12 = *(void *)(v8 + 72);
  unsigned int v13 = v7 >> 1;
  unsigned int v14 = *(unsigned __int16 *)(v12 + 2 * *v6);
  *unsigned int v9 = (v14 >> 12) | 0xF0;
  v9[1] = v14 >> 4;
  uint64_t v15 = v9 + 2;
  int v16 = 16 * v14;
  if (v13 == 1)
  {
LABEL_27:
    *uint64_t v15 = v16 + 13;
    LODWORD(v15) = v15 + 1;
    goto LABEL_28;
  }
  int v17 = &v6[v13];
  int v18 = v6 + 1;
  int v19 = 1;
  int v20 = 1;
  do
  {
    unsigned int v21 = v14;
    unsigned int v14 = *(unsigned __int16 *)(v12 + 2 * *v18);
    unsigned int v22 = v14 - v21;
    int v23 = (__int16)(v14 - v21);
    if (v23 < 0) {
      int v23 = -v23;
    }
    if ((unsigned __int16)v23 <= 6u)
    {
      v22 += 6;
      if (!v20)
      {
        char v24 = 0;
        goto LABEL_14;
      }
      int v20 = 0;
      v16 += v22;
      *v15++ = v16;
LABEL_16:
      char v24 = 1;
      goto LABEL_19;
    }
    if (v20)
    {
      v16 += 15;
      *uint64_t v15 = v16;
      if ((unsigned __int16)(v22 + 64) <= 0x7Fu)
      {
        int v20 = 0;
        v15[1] = v22 - 64;
        char v24 = 1;
        v15 += 2;
        goto LABEL_19;
      }
      int v20 = 0;
      *(_WORD *)(v15 + 1) = __rev16(v14);
      v15 += 3;
      goto LABEL_16;
    }
    if ((unsigned __int16)(v22 + 64) > 0x7Fu)
    {
      char v24 = 0;
      *uint64_t v15 = (v14 >> 12) | 0xF0;
      v15[1] = v14 >> 4;
      v15 += 2;
      int v16 = 16 * v14;
      goto LABEL_18;
    }
    char v24 = 0;
    *v15++ = ((v22 + 192) >> 4) - 16;
LABEL_14:
    int v16 = 16 * v22;
LABEL_18:
    int v20 = 1;
LABEL_19:
    if (v19 + 1 == v10) {
      unsigned int v25 = v11;
    }
    else {
      unsigned int v25 = 0;
    }
    v18 += v25 + 1;
    if (v19 + 1 == v10) {
      int v19 = 0;
    }
    else {
      ++v19;
    }
  }
  while (v18 != v17);
  if ((v24 & 1) == 0) {
    goto LABEL_27;
  }
LABEL_28:
  *(_DWORD *)(v3[2] + 4 * v5) = v15 - v9;
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,EncodeFrameThreads::$_0,int,int,int>>::~unique_ptr[abi:ne180100](&v27);
  return 0;
}

void sub_1AB9D3AB4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,EncodeFrameThreads::$_0,int,int,int>>::~unique_ptr[abi:ne180100]((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t **std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,EncodeFrameThreads::$_0,int,int,int>>::~unique_ptr[abi:ne180100](uint64_t **a1)
{
  int v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::unique_ptr<std::__thread_struct>::reset[abi:ne180100](v2, 0);
    MEMORY[0x1AD110160](v2, 0x10B0C40A21EAA3BLL);
  }
  return a1;
}

uint64_t std::unique_ptr<std::__thread_struct>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    MEMORY[0x1AD1100E0]();
    JUMPOUT(0x1AD110160);
  }
  return result;
}

void vectorload_1x16_packed10_cold_1()
{
}

void CMPhotoInterchangeCompactEncode_cold_1()
{
  __assert_rtn("_compact", "CMPhotoInterchangeCompact.m", 172, "size == dataLength");
}

void CMPhotoInterchangeCompactDecode_cold_1()
{
  __assert_rtn("_expand", "CMPhotoInterchangeCompact.m", 208, "size == dataLength");
}

void _logHang_cold_1()
{
  *(_WORD *)BOOL v0 = 0;
  _os_log_fault_impl(&dword_1AB8D3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "CMPhoto: Hang detected while waiting for callbacks from decoder. Please file a radar to CoreMedia Photo | all.", v0, 2u);
}

void _startDecoderSession_cold_1()
{
  __assert_rtn("_startDecoderSession", "SlimVideoDecoder.c", 358, "NULL != storage->slimHandle->root");
}

void CreateTreeLeaves_cold_1()
{
  __assert_rtn("CreateTreeLeaves", "SlimPack.c", 631, "NULL != leaves_ptr[i]");
}

void CreateHuffTree_cold_1()
{
}

void CreateHuffTree_cold_2()
{
  __assert_rtn("CreateHuffTree", "SlimPack.c", 666, "leaves_ptr[i] != NULL");
}

void CreateHuffTree_cold_3()
{
  __assert_rtn("CreateHuffTree", "SlimPack.c", 667, "node!=NULL");
}

void SlimDecodeFrame_cold_1()
{
  __assert_rtn("SlimDecodeFrame", "SlimPack.c", 944, "(slimHandle->pixelFormat == '2vuy' || slimHandle->pixelFormat == 'yuvs' || slimHandle->pixelFormat == '420v' || slimHandle->pixelFormat == '420f' || slimHandle->pixelFormat == 'bgg4' || slimHandle->pixelFormat == '444f' || slimHandle->pixelFormat == '444v' || slimHandle->pixelFormat == 'yuvf' || slimHandle->pixelFormat == 'L016' || slimHandle->pixelFormat == '13.3' || slimHandle->pixelFormat == 'L00h')");
}

void SlimDecodeFrame_cold_2()
{
  __assert_rtn("SlimDecodeFrame", "SlimPack.c", 976, "NULL != in32 || NULL != out32 || NULL != out16");
}

void SlimDecodeFrame_cold_3()
{
  __assert_rtn("UnHuffBgg4", "SlimPack.c", 713, "NULL != *in");
}

void SlimDecodeFrame_cold_4()
{
  __assert_rtn("SlimDecodeFrame", "SlimPack.c", 940, "(slimHandle->width >= 16) && (slimHandle->height >= 16)");
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1F40D7158](theArray, range.location, range.length, value, comparator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7810](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1F40D78E0](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7BF8](allocator, localeIdentifier);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D7CA0](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x1F40D7D98](allocator, locale, style);
}

CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options)
{
  return (CFNumberRef)MEMORY[0x1F40D7DA0](allocator, formatter, string, rangep, options);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8390](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1F40D83E0](alloc, theArray, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8400](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8798](url);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

uint64_t CFWriteStreamCreate()
{
  return MEMORY[0x1F40D8A98]();
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

uint64_t CGBitmapAllocateData()
{
  return MEMORY[0x1F40D9800]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x1F40D9888]();
}

uint64_t CGBitmapGetFastestAlignment()
{
  return MEMORY[0x1F40D9898]();
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x1F40D9948](options, a2, *(void *)&a3, *(void *)&a4);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

void CGColorRelease(CGColorRef color)
{
}

uint64_t CGColorSpaceContainsFlexGTCInfo()
{
  return MEMORY[0x1F40D9A68]();
}

uint64_t CGColorSpaceCopyBaseColorSpace()
{
  return MEMORY[0x1F40D9A70]();
}

uint64_t CGColorSpaceCopyFlexGTCInfo()
{
  return MEMORY[0x1F40D9A88]();
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1F40D9A98](space);
}

uint64_t CGColorSpaceCopyICCProfileASCIIDescriptionString()
{
  return MEMORY[0x1F40D9AA8]();
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9AB8](space);
}

CGColorSpaceRef CGColorSpaceCreateExtendedLinearized(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B08](space);
}

uint64_t CGColorSpaceCreateFromCICP()
{
  return MEMORY[0x1F40D9B10]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B48](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1F40D9B78]();
}

uint64_t CGColorSpaceGetCICPInfo()
{
  return MEMORY[0x1F40D9B98]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

CFTypeID CGColorSpaceGetTypeID(void)
{
  return MEMORY[0x1F40D9C10]();
}

BOOL CGColorSpaceIsHLGBased(CGColorSpaceRef s)
{
  return MEMORY[0x1F40D9C20](s);
}

BOOL CGColorSpaceIsPQBased(CGColorSpaceRef s)
{
  return MEMORY[0x1F40D9C30](s);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C58](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C60](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C68](a1);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGDataConsumerRef CGDataConsumerCreate(void *info, const CGDataConsumerCallbacks *cbks)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2B8](info, cbks);
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA2F0](info, size, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGImageApplyHDRGainMap()
{
  return MEMORY[0x1F40E9678]();
}

uint64_t CGImageConvertHDRPixelBufferToSDR()
{
  return MEMORY[0x1F40E9680]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateColorSpaceFromExifOrData()
{
  return MEMORY[0x1F40E96B0]();
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

uint64_t CGImageCreateDataFromMetadata()
{
  return MEMORY[0x1F40E96C0]();
}

uint64_t CGImageCreateEXIFDataFromProperties()
{
  return MEMORY[0x1F40E96C8]();
}

uint64_t CGImageCreateFlexRangeMetadata()
{
  return MEMORY[0x1F40E96D8]();
}

uint64_t CGImageCreateMetadataFromData()
{
  return MEMORY[0x1F40E96E8]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithMask(CGImageRef image, CGImageRef mask)
{
  return (CGImageRef)MEMORY[0x1F40DA8A8](image, mask);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9748](consumer, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x1F40DA9A8]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CFArrayRef CGImageMetadataCopyTags(CGImageMetadataRef metadata)
{
  return (CFArrayRef)MEMORY[0x1F40E97A0](metadata);
}

CGImageMetadataRef CGImageMetadataCreateFromXMPData(CFDataRef data)
{
  return (CGImageMetadataRef)MEMORY[0x1F40E97B8](data);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97C8]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97D0](metadata);
}

CFDataRef CGImageMetadataCreateXMPData(CGImageMetadataRef metadata, CFDictionaryRef options)
{
  return (CFDataRef)MEMORY[0x1F40E97E0](metadata, options);
}

void CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadataRef metadata, CFStringRef rootPath, CFDictionaryRef options, CGImageMetadataTagBlock block)
{
}

CFTypeID CGImageMetadataGetTypeID(void)
{
  return MEMORY[0x1F40E97F0]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1F40E9810](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x1F40E9818](metadata, parent, path);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x1F40E9820](metadata, parent, path, tag);
}

CFStringRef CGImageMetadataTagCopyName(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1F40E9838](tag);
}

CFStringRef CGImageMetadataTagCopyNamespace(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1F40E9840](tag);
}

CFStringRef CGImageMetadataTagCopyPrefix(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1F40E9848](tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x1F40E9850](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x1F40E9858](xmlns, prefix, name, *(void *)&type, value);
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1F40DAAB0]();
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

uint64_t CGImageWriteEXIFJPEGWithMetadata()
{
  return MEMORY[0x1F40E9A78]();
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB200]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1F40DB210](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1F40DB4E0](dict, size);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1F40DB920]();
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1F40DB950](theBuffer, targetBBuf, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferAppendMemoryBlock(CMBlockBufferRef theBuffer, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1F40DB958](theBuffer, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB970](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateEmpty(CFAllocatorRef structureAllocator, uint32_t subBlockCapacity, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB978](structureAllocator, *(void *)&subBlockCapacity, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithBufferReference(CFAllocatorRef structureAllocator, CMBlockBufferRef bufferReference, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB980](structureAllocator, bufferReference, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB988](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB998](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1F40DB9A0](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CFTypeID CMBlockBufferGetTypeID(void)
{
  return MEMORY[0x1F40DB9B0]();
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x1F40DB9C0](theBuffer, offset, length);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x1F40DB9C8](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

Boolean CMBufferQueueContainsEndOfData(CMBufferQueueRef queue)
{
  return MEMORY[0x1F40DB9D8](queue);
}

CMTime *__cdecl CMBufferQueueGetDuration(CMTime *__return_ptr retstr, CMBufferQueueRef queue)
{
  return (CMTime *)MEMORY[0x1F40DBA28](retstr, queue);
}

OSStatus CMBufferQueueInstallTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerCallback callback, void *refcon, CMBufferQueueTriggerCondition condition, CMTime *time, CMBufferQueueTriggerToken *triggerTokenOut)
{
  return MEMORY[0x1F40DBA68](queue, callback, refcon, *(void *)&condition, time, triggerTokenOut);
}

OSStatus CMBufferQueueMarkEndOfData(CMBufferQueueRef queue)
{
  return MEMORY[0x1F40DBA98](queue);
}

OSStatus CMBufferQueueRemoveTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerToken triggerToken)
{
  return MEMORY[0x1F40DBAA0](queue, triggerToken);
}

uint64_t CMByteStreamAppend()
{
  return MEMORY[0x1F40DBAD0]();
}

uint64_t CMByteStreamAppendBlockBuffer()
{
  return MEMORY[0x1F40DBAD8]();
}

uint64_t CMByteStreamBaseGetTypeID()
{
  return MEMORY[0x1F40DBAE0]();
}

uint64_t CMByteStreamCreateForBlockBuffer()
{
  return MEMORY[0x1F40DBAF0]();
}

uint64_t CMByteStreamCreateForFileURL()
{
  return MEMORY[0x1F40DBAF8]();
}

uint64_t CMByteStreamCreateWritableForBlockBuffer()
{
  return MEMORY[0x1F40DBB00]();
}

uint64_t CMByteStreamGetCMBaseObject()
{
  return MEMORY[0x1F40DBB08]();
}

uint64_t CMCreateContiguousBlockBufferFromStream()
{
  return MEMORY[0x1F40DBB78]();
}

Boolean CMFormatDescriptionEqualIgnoringExtensionKeys(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription, CFTypeRef formatDescriptionExtensionKeysToIgnore, CFTypeRef sampleDescriptionExtensionAtomKeysToIgnore)
{
  return MEMORY[0x1F40DBBB0](formatDescription, otherFormatDescription, formatDescriptionExtensionKeysToIgnore, sampleDescriptionExtensionAtomKeysToIgnore);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1F40DBBB8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBBC0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

CFTypeID CMFormatDescriptionGetTypeID(void)
{
  return MEMORY[0x1F40DBBD8]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1F40DBBF0](target, key, attachmentModeOut);
}

CMMemoryPoolRef CMMemoryPoolCreate(CFDictionaryRef options)
{
  return (CMMemoryPoolRef)MEMORY[0x1F40DBC08](options);
}

void CMMemoryPoolFlush(CMMemoryPoolRef pool)
{
}

CFAllocatorRef CMMemoryPoolGetAllocator(CMMemoryPoolRef pool)
{
  return (CFAllocatorRef)MEMORY[0x1F40DBC18](pool);
}

void CMMemoryPoolInvalidate(CMMemoryPoolRef pool)
{
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x1F40DBCA8]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x1F40DBCB8]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x1F40DBCD8]();
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD30](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD40](allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD48](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1F40DBDA0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1F40DBE00](sbuf, createIfNecessary);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x1F40DBE08](sbuf, sampleIndex);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1F40DBE18](sbuf, sampleIndex, timingInfoOut);
}

size_t CMSampleBufferGetTotalSampleSize(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE30](sbuf);
}

CFTypeID CMSampleBufferGetTypeID(void)
{
  return MEMORY[0x1F40DBE38]();
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC300](allocator, *(void *)&codecType, *(void *)&width, *(void *)&height, extensions, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC308](allocator, imageBuffer, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateFromHEVCParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC328](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(void *)&NALUnitHeaderLength, extensions, formatDescriptionOut);
}

CGRect CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescriptionRef videoDesc, Boolean originIsAtTopLeft)
{
  MEMORY[0x1F40DC330](videoDesc, originIsAtTopLeft);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFB50](buffer, *(void *)&attachmentMode);
}

Boolean CVBufferHasAttachment(CVBufferRef buffer, CFStringRef key)
{
  return MEMORY[0x1F40DFB68](buffer, key);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

int CVColorPrimariesGetIntegerCodePointForString(CFStringRef colorPrimariesString)
{
  return MEMORY[0x1F40DFBA8](colorPrimariesString);
}

CFStringRef CVColorPrimariesGetStringForIntegerCodePoint(int colorPrimariesCodePoint)
{
  return (CFStringRef)MEMORY[0x1F40DFBB0](*(void *)&colorPrimariesCodePoint);
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC18](attachments);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD00](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithPlanarBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *dataPtr, size_t dataSize, size_t numberOfPlanes, void **planeBaseAddress, size_t *planeWidth, size_t *planeHeight, size_t *planeBytesPerRow, CVPixelBufferReleasePlanarBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD10](allocator, width, height, *(void *)&pixelFormatType, dataPtr, dataSize, numberOfPlanes, planeBaseAddress);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1F40DFD20]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD50](pixelBuffer);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x1F40DFD90]();
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFDB0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFDF0](pool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFE50](allocator, *(void *)&pixelFormat);
}

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x1F40DFE58]();
}

int CVTransferFunctionGetIntegerCodePointForString(CFStringRef transferFunctionString)
{
  return MEMORY[0x1F40DFE78](transferFunctionString);
}

CFStringRef CVTransferFunctionGetStringForIntegerCodePoint(int transferFunctionCodePoint)
{
  return (CFStringRef)MEMORY[0x1F40DFE80](*(void *)&transferFunctionCodePoint);
}

int CVYCbCrMatrixGetIntegerCodePointForString(CFStringRef yCbCrMatrixString)
{
  return MEMORY[0x1F40DFE88](yCbCrMatrixString);
}

CFStringRef CVYCbCrMatrixGetStringForIntegerCodePoint(int yCbCrMatrixCodePoint)
{
  return (CFStringRef)MEMORY[0x1F40DFE90](*(void *)&yCbCrMatrixCodePoint);
}

ColorSyncProfileRef ColorSyncProfileCreate(CFDataRef data, CFErrorRef *error)
{
  return (ColorSyncProfileRef)MEMORY[0x1F40D6578](data, error);
}

CFTypeRef ColorSyncTransformCopyProperty(ColorSyncTransformRef transform, CFTypeRef key, CFDictionaryRef options)
{
  return (CFTypeRef)MEMORY[0x1F40D65D0](transform, key, options);
}

ColorSyncTransformRef ColorSyncTransformCreate(CFArrayRef profileSequence, CFDictionaryRef options)
{
  return (ColorSyncTransformRef)MEMORY[0x1F40D65D8](profileSequence, options);
}

uint64_t FigAV1Bridge_GetChromaFormatAndBitDepthsFromAV1CodecConfigurationRecord()
{
  return MEMORY[0x1F40DC448]();
}

uint64_t FigAtomStreamInitWithByteStream()
{
  return MEMORY[0x1F40DC4C8]();
}

uint64_t FigAtomStreamPositionAtFirstAtomWithType()
{
  return MEMORY[0x1F40DC4E8]();
}

uint64_t FigByteStreamCreateWithCFData()
{
  return MEMORY[0x1F40DC790]();
}

uint64_t FigByteStreamCreateWithIOSurface()
{
  return MEMORY[0x1F40DC798]();
}

uint64_t FigByteStreamCreateWritableWithCFMutableData()
{
  return MEMORY[0x1F40DC7A0]();
}

uint64_t FigByteStreamCreateWritableWithIOSurface()
{
  return MEMORY[0x1F40DC7A8]();
}

uint64_t FigCFArrayAppendDouble()
{
  return MEMORY[0x1F40DC7F8]();
}

uint64_t FigCFArrayAppendInt()
{
  return MEMORY[0x1F40DC808]();
}

uint64_t FigCFArrayAppendInt32()
{
  return MEMORY[0x1F40DC810]();
}

uint64_t FigCFArrayAppendInt64()
{
  return MEMORY[0x1F40DC818]();
}

uint64_t FigCFArrayApplyBlock()
{
  return MEMORY[0x1F40DC820]();
}

uint64_t FigCFArrayApplyFunction()
{
  return MEMORY[0x1F40DC828]();
}

uint64_t FigCFArrayContainsInt()
{
  return MEMORY[0x1F40DC830]();
}

uint64_t FigCFArrayContainsValue()
{
  return MEMORY[0x1F40DC848]();
}

uint64_t FigCFArrayCreateMutableCopy()
{
  return MEMORY[0x1F40DC870]();
}

uint64_t FigCFArrayGetDoubleAtIndex()
{
  return MEMORY[0x1F40DC8A0]();
}

uint64_t FigCFArrayGetFloatAtIndex()
{
  return MEMORY[0x1F40DC8C0]();
}

uint64_t FigCFArrayGetInt32AtIndex()
{
  return MEMORY[0x1F40DC8D0]();
}

uint64_t FigCFArrayGetInt64AtIndex()
{
  return MEMORY[0x1F40DC8D8]();
}

uint64_t FigCFArrayGetIntAtIndex()
{
  return MEMORY[0x1F40DC8E0]();
}

uint64_t FigCFArrayGetValueAtIndex()
{
  return MEMORY[0x1F40DC8F0]();
}

uint64_t FigCFDictionaryAddEntriesToDictionaryWithRecursion()
{
  return MEMORY[0x1F40DC940]();
}

uint64_t FigCFDictionaryApplyBlock()
{
  return MEMORY[0x1F40DC948]();
}

uint64_t FigCFDictionaryCreateMutableCopy()
{
  return MEMORY[0x1F40DC970]();
}

uint64_t FigCFDictionaryCreateMutableCopyWithCFTypeCallbacks()
{
  return MEMORY[0x1F40DC978]();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x1F40DC988]();
}

uint64_t FigCFDictionaryGetCFIndexIfPresent()
{
  return MEMORY[0x1F40DC998]();
}

uint64_t FigCFDictionaryGetCGSizeIfPresent()
{
  return MEMORY[0x1F40DC9B0]();
}

uint64_t FigCFDictionaryGetCount()
{
  return MEMORY[0x1F40DC9C8]();
}

uint64_t FigCFDictionaryGetDoubleIfPresent()
{
  return MEMORY[0x1F40DC9E0]();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return MEMORY[0x1F40DC9F0]();
}

uint64_t FigCFDictionaryGetInt16IfPresent()
{
  return MEMORY[0x1F40DC9F8]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x1F40DCA00]();
}

uint64_t FigCFDictionaryGetInt64IfPresent()
{
  return MEMORY[0x1F40DCA08]();
}

uint64_t FigCFDictionaryGetIntIfPresent()
{
  return MEMORY[0x1F40DCA10]();
}

uint64_t FigCFDictionaryGetValue()
{
  return MEMORY[0x1F40DCA38]();
}

uint64_t FigCFDictionaryGetValueIfPresent()
{
  return MEMORY[0x1F40DCA48]();
}

uint64_t FigCFDictionarySetBoolean()
{
  return MEMORY[0x1F40DCA60]();
}

uint64_t FigCFDictionarySetCFIndex()
{
  return MEMORY[0x1F40DCA68]();
}

uint64_t FigCFDictionarySetDouble()
{
  return MEMORY[0x1F40DCA98]();
}

uint64_t FigCFDictionarySetFloat()
{
  return MEMORY[0x1F40DCAA0]();
}

uint64_t FigCFDictionarySetInt()
{
  return MEMORY[0x1F40DCAB0]();
}

uint64_t FigCFDictionarySetInt16()
{
  return MEMORY[0x1F40DCAB8]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x1F40DCAC0]();
}

uint64_t FigCFDictionarySetInt64()
{
  return MEMORY[0x1F40DCAC8]();
}

uint64_t FigCFDictionarySetUInt32()
{
  return MEMORY[0x1F40DCAD8]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x1F40DCAE8]();
}

uint64_t FigCFDictionarySetValueFromKeyInDict()
{
  return MEMORY[0x1F40DCAF0]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x1F40DCAF8]();
}

uint64_t FigCFNumberCreateSInt32()
{
  return MEMORY[0x1F40DCB30]();
}

uint64_t FigCFNumberCreateUInt32()
{
  return MEMORY[0x1F40DCB50]();
}

uint64_t FigCFNumberGetFloat64()
{
  return MEMORY[0x1F40DCB70]();
}

uint64_t FigCFNumberGetSInt32()
{
  return MEMORY[0x1F40DCB78]();
}

uint64_t FigCFNumberGetUInt32()
{
  return MEMORY[0x1F40DCB90]();
}

uint64_t FigCFStringGetCStringPtrAndBufferToFree()
{
  return MEMORY[0x1F40DCC20]();
}

uint64_t FigCFStringGetCStringPtrMaybeUsingPreallocatedBuffer()
{
  return MEMORY[0x1F40DCC28]();
}

uint64_t FigCreateBlockBufferWithCFDataNoCopy()
{
  return MEMORY[0x1F40DD008]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x1F4103088]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x1F4103098]();
}

uint64_t FigDebugIsInternalBuild()
{
  return MEMORY[0x1F40DD2D8]();
}

uint64_t FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority()
{
  return MEMORY[0x1F40DD398]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x1F40DD3A8]();
}

uint64_t FigEditCursorGetFigBaseObject()
{
  return MEMORY[0x1F40ED560]();
}

uint64_t FigFileForkClose()
{
  return MEMORY[0x1F40DD660]();
}

uint64_t FigFileForkGetLengthAtOffset()
{
  return MEMORY[0x1F40DD668]();
}

uint64_t FigFileForkOpenMainByCFURL()
{
  return MEMORY[0x1F40DD670]();
}

uint64_t FigFileForkWrite()
{
  return MEMORY[0x1F40DD688]();
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x1F40DD700]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x1F40DD708]();
}

uint64_t FigFormatReaderCreateForStreamReturningMatchingContainerLabel()
{
  return MEMORY[0x1F40ED5D0]();
}

uint64_t FigFormatReaderGetFigBaseObject()
{
  return MEMORY[0x1F40ED5E0]();
}

uint64_t FigFormatReaderGetTypeID()
{
  return MEMORY[0x1F40ED5E8]();
}

uint64_t FigFormatWriterGetFigBaseObject()
{
  return MEMORY[0x1F40ED5F0]();
}

uint64_t FigGetAlignmentForIOSurfaceOutput()
{
  return MEMORY[0x1F41030A8]();
}

uint64_t FigGetDefaultManagedFilePool()
{
  return MEMORY[0x1F40DD888]();
}

uint64_t FigGetNumberOfScalerCores()
{
  return MEMORY[0x1F41030B8]();
}

uint64_t FigH264Bridge_GetSPSChromaFormatAndBitDepths()
{
  return MEMORY[0x1F40DD960]();
}

uint64_t FigH264Bridge_GetSPSFromAVCC()
{
  return MEMORY[0x1F40DD968]();
}

uint64_t FigH264Bridge_GetSPS_VUI_ChromaLocation()
{
  return MEMORY[0x1F40DD988]();
}

uint64_t FigH264Bridge_GetSPS_VUI_NCLC()
{
  return MEMORY[0x1F40DD998]();
}

uint64_t FigHEVCBridge_GetHEVCParameterSetAtIndex()
{
  return MEMORY[0x1F40DDA70]();
}

uint64_t FigHEVCBridge_GetSPSChromaFormatAndBitDepths()
{
  return MEMORY[0x1F40DDA80]();
}

uint64_t FigHEVCBridge_GetSPS_VUI_ChromaLocation()
{
  return MEMORY[0x1F40DDA90]();
}

uint64_t FigHEVCBridge_GetSPS_VUI_NCLC()
{
  return MEMORY[0x1F40DDA98]();
}

uint64_t FigIFFPictureCollectionWriterCreateWithByteStream()
{
  return MEMORY[0x1F40ED618]();
}

uint64_t FigKTraceInit()
{
  return MEMORY[0x1F40DDB70]();
}

uint64_t FigManagedFilePoolCreateByteStreamForFile()
{
  return MEMORY[0x1F40DDB98]();
}

uint64_t FigMovieFormatWriterCreateWithByteStream()
{
  return MEMORY[0x1F40ED740]();
}

uint64_t FigPictureCollectionCreateBrandsFromByteStream()
{
  return MEMORY[0x1F40ED8A0]();
}

uint64_t FigPictureCollectionCreateFromByteStream()
{
  return MEMORY[0x1F40ED8A8]();
}

uint64_t FigPictureCollectionCreateFromByteStreamWithOptions()
{
  return MEMORY[0x1F40ED8B0]();
}

uint64_t FigPictureCollectionGetCMBaseObject()
{
  return MEMORY[0x1F40ED8B8]();
}

uint64_t FigPictureCollectionWriterGetCMBaseObject()
{
  return MEMORY[0x1F40ED8C0]();
}

uint64_t FigPictureReaderGetFigBaseObject()
{
  return MEMORY[0x1F40ED8C8]();
}

uint64_t FigPictureTileCursorGetCMBaseObject()
{
  return MEMORY[0x1F40ED8D0]();
}

uint64_t FigPictureTileCursorServiceGetCMBaseObject()
{
  return MEMORY[0x1F40ED8D8]();
}

uint64_t FigSampleBufferCreateCopyWithNoData()
{
  return MEMORY[0x1F40DE1F0]();
}

uint64_t FigSampleCursorGetFigBaseObject()
{
  return MEMORY[0x1F40EDB70]();
}

uint64_t FigSampleGeneratorCreateForFormatReaderUsingByteStreams()
{
  return MEMORY[0x1F40EDB78]();
}

uint64_t FigSemaphoreCreate()
{
  return MEMORY[0x1F40DE298]();
}

uint64_t FigSemaphoreDestroy()
{
  return MEMORY[0x1F40DE2A0]();
}

uint64_t FigSemaphoreSignal()
{
  return MEMORY[0x1F40DE2A8]();
}

uint64_t FigSemaphoreWaitRelative()
{
  return MEMORY[0x1F40DE2B0]();
}

uint64_t FigServer_IsServerProcess()
{
  return MEMORY[0x1F40DE2F8]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1F40DE320]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x1F40DE340]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x1F40DE348]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x1F40DE350]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x1F40DE360]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1F40DE5F0]();
}

uint64_t FigTrackReaderGetFigBaseObject()
{
  return MEMORY[0x1F40EDC48]();
}

uint64_t FigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom()
{
  return MEMORY[0x1F40DE850]();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86D8](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x1F40E8700](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x1F40E8F18](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return MEMORY[0x1F40E91E8](*(void *)&entry, propertyName, buffer, size);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t IOSurfaceAcceleratorBlitSurface()
{
  return MEMORY[0x1F4124C40]();
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1F4124C48]();
}

uint64_t IOSurfaceAcceleratorGetRunLoopSource()
{
  return MEMORY[0x1F4124C58]();
}

uint64_t IOSurfaceBindAccel()
{
  return MEMORY[0x1F40E92E8]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

uint64_t IOSurfaceCreateChildSurface()
{
  return MEMORY[0x1F40E9310]();
}

uint64_t IOSurfaceCreateWiringAssertion()
{
  return MEMORY[0x1F40E9320]();
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane()
{
  return MEMORY[0x1F40E9360]();
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane()
{
  return MEMORY[0x1F40E9370]();
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40E9380](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E93A8](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E93B8](buffer, planeIndex);
}

uint64_t IOSurfaceGetBytesPerTileDataOfPlane()
{
  return MEMORY[0x1F40E93C8]();
}

uint64_t IOSurfaceGetCompressedTileHeightOfPlane()
{
  return MEMORY[0x1F40E93E0]();
}

uint64_t IOSurfaceGetCompressedTileWidthOfPlane()
{
  return MEMORY[0x1F40E93E8]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x1F40E93F0]();
}

uint64_t IOSurfaceGetExtendedPixelsOfPlane()
{
  return MEMORY[0x1F40E9428]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane()
{
  return MEMORY[0x1F40E9448]();
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9450](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9488](buffer);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1F40E94E0]();
}

int32_t IOSurfaceGetUseCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94E8](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane()
{
  return MEMORY[0x1F40E9500]();
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9530](buffer);
}

uint64_t IOSurfaceIsTiled()
{
  return MEMORY[0x1F40E9538]();
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

void IOSurfaceRemoveAllValues(IOSurfaceRef buffer)
{
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
}

uint64_t IOSurfaceSetOwnership()
{
  return MEMORY[0x1F40E95C8]();
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x1F40E95D8](buffer, *(void *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t IOSurfaceWrapClientImage()
{
  return MEMORY[0x1F40E9640]();
}

uint64_t JxlDecoderCreate()
{
  return MEMORY[0x1F410A3C8]();
}

uint64_t JxlDecoderDestroy()
{
  return MEMORY[0x1F410A3D0]();
}

uint64_t JxlDecoderGetBasicInfo()
{
  return MEMORY[0x1F410A3D8]();
}

uint64_t JxlDecoderGetBoxSizeRaw()
{
  return MEMORY[0x1F410A3E0]();
}

uint64_t JxlDecoderGetBoxType()
{
  return MEMORY[0x1F410A3E8]();
}

uint64_t JxlDecoderGetColorAsEncodedProfile()
{
  return MEMORY[0x1F410A3F0]();
}

uint64_t JxlDecoderGetColorAsICCProfile()
{
  return MEMORY[0x1F410A3F8]();
}

uint64_t JxlDecoderGetICCProfileSize()
{
  return MEMORY[0x1F410A400]();
}

uint64_t JxlDecoderImageOutBufferSize()
{
  return MEMORY[0x1F410A408]();
}

uint64_t JxlDecoderProcessInput()
{
  return MEMORY[0x1F410A410]();
}

uint64_t JxlDecoderReleaseBoxBuffer()
{
  return MEMORY[0x1F410A418]();
}

uint64_t JxlDecoderSetBoxBuffer()
{
  return MEMORY[0x1F410A420]();
}

uint64_t JxlDecoderSetDecompressBoxes()
{
  return MEMORY[0x1F410A428]();
}

uint64_t JxlDecoderSetImageOutBitDepth()
{
  return MEMORY[0x1F410A430]();
}

uint64_t JxlDecoderSetImageOutCallback()
{
  return MEMORY[0x1F410A440]();
}

uint64_t JxlDecoderSetInput()
{
  return MEMORY[0x1F410A448]();
}

uint64_t JxlDecoderSetKeepOrientation()
{
  return MEMORY[0x1F410A450]();
}

uint64_t JxlDecoderSetParallelRunner()
{
  return MEMORY[0x1F410A458]();
}

uint64_t JxlDecoderSetPreferredColorProfile()
{
  return MEMORY[0x1F410A460]();
}

uint64_t JxlDecoderSetUnpremultiplyAlpha()
{
  return MEMORY[0x1F410A468]();
}

uint64_t JxlDecoderSubscribeEvents()
{
  return MEMORY[0x1F410A470]();
}

uint64_t JxlDecoderVersion()
{
  return MEMORY[0x1F410A478]();
}

uint64_t JxlEncoderAddImageFrame()
{
  return MEMORY[0x1F410A480]();
}

uint64_t JxlEncoderCloseInput()
{
  return MEMORY[0x1F410A488]();
}

uint64_t JxlEncoderCreate()
{
  return MEMORY[0x1F410A490]();
}

uint64_t JxlEncoderDestroy()
{
  return MEMORY[0x1F410A498]();
}

uint64_t JxlEncoderFrameSettingsCreate()
{
  return MEMORY[0x1F410A4A0]();
}

uint64_t JxlEncoderFrameSettingsSetOption()
{
  return MEMORY[0x1F410A4A8]();
}

uint64_t JxlEncoderInitBasicInfo()
{
  return MEMORY[0x1F410A4B0]();
}

uint64_t JxlEncoderProcessOutput()
{
  return MEMORY[0x1F410A4B8]();
}

uint64_t JxlEncoderSetBasicInfo()
{
  return MEMORY[0x1F410A4C0]();
}

uint64_t JxlEncoderSetColorEncoding()
{
  return MEMORY[0x1F410A4C8]();
}

uint64_t JxlEncoderSetFrameDistance()
{
  return MEMORY[0x1F410A4D0]();
}

uint64_t JxlEncoderSetFrameLossless()
{
  return MEMORY[0x1F410A4D8]();
}

uint64_t JxlEncoderSetICCProfile()
{
  return MEMORY[0x1F410A4E0]();
}

uint64_t JxlEncoderSetParallelRunner()
{
  return MEMORY[0x1F410A4E8]();
}

uint64_t JxlThreadParallelRunnerCreate()
{
  return MEMORY[0x1F410A4F0]();
}

uint64_t JxlThreadParallelRunnerDestroy()
{
  return MEMORY[0x1F410A4F8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

void NSLog(NSString *format, ...)
{
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint64_t VTAreVideoDecodersRunningInProcess()
{
  return MEMORY[0x1F41030C0]();
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return MEMORY[0x1F41030F0](session, completeUntilPresentationTimeStamp);
}

OSStatus VTCompressionSessionCreate(CFAllocatorRef allocator, int32_t width, int32_t height, CMVideoCodecType codecType, CFDictionaryRef encoderSpecification, CFDictionaryRef sourceImageBufferAttributes, CFAllocatorRef compressedDataAllocator, VTCompressionOutputCallback outputCallback, void *outputCallbackRefCon, VTCompressionSessionRef *compressionSessionOut)
{
  return MEMORY[0x1F4103100](allocator, *(void *)&width, *(void *)&height, *(void *)&codecType, encoderSpecification, sourceImageBufferAttributes, compressedDataAllocator, outputCallback);
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x1F4103110](session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

CFTypeID VTCompressionSessionGetTypeID(void)
{
  return MEMORY[0x1F4103140]();
}

void VTCompressionSessionInvalidate(VTCompressionSessionRef session)
{
}

OSStatus VTCompressionSessionPrepareToEncodeFrames(VTCompressionSessionRef session)
{
  return MEMORY[0x1F4103150](session);
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x1F41031B0]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x1F41031B8]();
}

uint64_t VTDecompressionSessionCreateWithOptions()
{
  return MEMORY[0x1F41031F0]();
}

OSStatus VTDecompressionSessionDecodeFrame(VTDecompressionSessionRef session, CMSampleBufferRef sampleBuffer, VTDecodeFrameFlags decodeFlags, void *sourceFrameRefCon, VTDecodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x1F41031F8](session, sampleBuffer, *(void *)&decodeFlags, sourceFrameRefCon, infoFlagsOut);
}

CFTypeID VTDecompressionSessionGetTypeID(void)
{
  return MEMORY[0x1F4103220]();
}

void VTDecompressionSessionInvalidate(VTDecompressionSessionRef session)
{
}

OSStatus VTDecompressionSessionWaitForAsynchronousFrames(VTDecompressionSessionRef session)
{
  return MEMORY[0x1F4103250](session);
}

uint64_t VTEncoderSessionCreateVideoFormatDescription()
{
  return MEMORY[0x1F4103268]();
}

uint64_t VTEncoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x1F4103290]();
}

uint64_t VTFillPixelBufferBorderWithBlack()
{
  return MEMORY[0x1F41032B0]();
}

uint64_t VTFillPixelBufferWithBlack()
{
  return MEMORY[0x1F41032B8]();
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x1F4103340]();
}

uint64_t VTImageRotationSessionInvalidate()
{
  return MEMORY[0x1F4103348]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x1F4103360]();
}

uint64_t VTImageRotationSessionTransferSubImage()
{
  return MEMORY[0x1F4103368]();
}

uint64_t VTParavirtualizedJPEGSessionCopyCapabilities()
{
  return MEMORY[0x1F4103400]();
}

uint64_t VTParavirtualizedJPEGSessionCreate()
{
  return MEMORY[0x1F4103408]();
}

uint64_t VTParavirtualizedJPEGSessionDecodeImage()
{
  return MEMORY[0x1F4103410]();
}

uint64_t VTParavirtualizedJPEGSessionEncodeImage()
{
  return MEMORY[0x1F4103418]();
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x1F4103490](allocator, pixelRotationSessionOut);
}

uint64_t VTPixelRotationSessionRotateSubImage()
{
  return MEMORY[0x1F41034B0]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

uint64_t VTSelectAndCreateVideoDecoderInstance()
{
  return MEMORY[0x1F4103510]();
}

uint64_t VTSelectAndCreateVideoEncoderInstance()
{
  return MEMORY[0x1F4103518]();
}

OSStatus VTSessionCopyProperty(VTSessionRef session, CFStringRef propertyKey, CFAllocatorRef allocator, void *propertyValueOut)
{
  return MEMORY[0x1F4103520](session, propertyKey, allocator, propertyValueOut);
}

OSStatus VTSessionCopySupportedPropertyDictionary(VTSessionRef session, CFDictionaryRef *supportedPropertyDictionaryOut)
{
  return MEMORY[0x1F4103528](session, supportedPropertyDictionaryOut);
}

OSStatus VTSessionSetProperties(VTSessionRef session, CFDictionaryRef propertyDictionary)
{
  return MEMORY[0x1F4103530](session, propertyDictionary);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

uint64_t VTTileCompressionSessionCompleteTiles()
{
  return MEMORY[0x1F4103568]();
}

uint64_t VTTileCompressionSessionCreate()
{
  return MEMORY[0x1F4103570]();
}

uint64_t VTTileCompressionSessionEncodeTile()
{
  return MEMORY[0x1F4103578]();
}

uint64_t VTTileCompressionSessionGetTypeID()
{
  return MEMORY[0x1F4103580]();
}

uint64_t VTTileCompressionSessionInvalidate()
{
  return MEMORY[0x1F4103588]();
}

uint64_t VTTileCompressionSessionPrepareToEncodeTiles()
{
  return MEMORY[0x1F4103590]();
}

uint64_t VTTileDecompressionSessionCreate()
{
  return MEMORY[0x1F41035A8]();
}

uint64_t VTTileDecompressionSessionDecodeTile()
{
  return MEMORY[0x1F41035B0]();
}

uint64_t VTTileDecompressionSessionGetTypeID()
{
  return MEMORY[0x1F41035B8]();
}

uint64_t VTTileDecompressionSessionInvalidate()
{
  return MEMORY[0x1F41035C0]();
}

uint64_t WriteStackshotReportWithPID()
{
  return MEMORY[0x1F4116EC0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x1F417E968](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x1F417EAA0]();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::thread::join(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1F40C9C30]();
}

double __tanpi(double a1)
{
  MEMORY[0x1F40C9CF0](a1);
  return result;
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BA0](adler, buf, *(void *)&len);
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x1F41138D8]();
}

uint64_t applejpeg_decode_build_index()
{
  return MEMORY[0x1F410A198]();
}

uint64_t applejpeg_decode_clear_options()
{
  return MEMORY[0x1F410A1A8]();
}

uint64_t applejpeg_decode_create()
{
  return MEMORY[0x1F410A1B8]();
}

uint64_t applejpeg_decode_destroy()
{
  return MEMORY[0x1F410A1C0]();
}

uint64_t applejpeg_decode_dump_ra_table()
{
  return MEMORY[0x1F410A1C8]();
}

uint64_t applejpeg_decode_get_chroma_subsampling()
{
  return MEMORY[0x1F410A1D0]();
}

uint64_t applejpeg_decode_get_image_info()
{
  return MEMORY[0x1F410A1D8]();
}

uint64_t applejpeg_decode_get_output_buffer_size()
{
  return MEMORY[0x1F410A1E0]();
}

uint64_t applejpeg_decode_get_output_dimensions()
{
  return MEMORY[0x1F410A1E8]();
}

uint64_t applejpeg_decode_get_precision()
{
  return MEMORY[0x1F410A1F8]();
}

uint64_t applejpeg_decode_get_ra_table_sz()
{
  return MEMORY[0x1F410A208]();
}

uint64_t applejpeg_decode_image_all()
{
  return MEMORY[0x1F410A218]();
}

uint64_t applejpeg_decode_open_file()
{
  return MEMORY[0x1F410A220]();
}

uint64_t applejpeg_decode_open_mem()
{
  return MEMORY[0x1F410A230]();
}

uint64_t applejpeg_decode_set_option_buildindex()
{
  return MEMORY[0x1F410A248]();
}

uint64_t applejpeg_decode_set_option_crop()
{
  return MEMORY[0x1F410A250]();
}

uint64_t applejpeg_decode_set_option_multithread()
{
  return MEMORY[0x1F410A270]();
}

uint64_t applejpeg_decode_set_option_orientation()
{
  return MEMORY[0x1F410A278]();
}

uint64_t applejpeg_decode_set_option_outformat()
{
  return MEMORY[0x1F410A280]();
}

uint64_t applejpeg_decode_set_option_outsize()
{
  return MEMORY[0x1F410A288]();
}

uint64_t applejpeg_decode_set_option_stride()
{
  return MEMORY[0x1F410A290]();
}

uint64_t applejpeg_decode_set_parse_option_use_first_sof()
{
  return MEMORY[0x1F410A2A0]();
}

uint64_t applejpeg_decode_set_ra_table()
{
  return MEMORY[0x1F410A2A8]();
}

uint64_t applejpeg_encode_commit_options_for_file()
{
  return MEMORY[0x1F410A2B0]();
}

uint64_t applejpeg_encode_create()
{
  return MEMORY[0x1F410A2B8]();
}

uint64_t applejpeg_encode_destroy()
{
  return MEMORY[0x1F410A2C0]();
}

uint64_t applejpeg_encode_image_all()
{
  return MEMORY[0x1F410A2C8]();
}

uint64_t applejpeg_encode_image_all_with_bitstream_offset()
{
  return MEMORY[0x1F410A2D0]();
}

uint64_t applejpeg_encode_set_option_insert_segment()
{
  return MEMORY[0x1F410A2E8]();
}

uint64_t applejpeg_encode_set_option_num_threads()
{
  return MEMORY[0x1F410A2F0]();
}

uint64_t applejpeg_encode_set_option_q_tables()
{
  return MEMORY[0x1F410A2F8]();
}

uint64_t applejpeg_encode_set_option_record_rst_offsets()
{
  return MEMORY[0x1F410A300]();
}

uint64_t applejpeg_encode_set_option_restart_markers()
{
  return MEMORY[0x1F410A308]();
}

uint64_t applejpeg_encode_set_option_strip_encode()
{
  return MEMORY[0x1F410A310]();
}

uint64_t applejpeg_encode_set_option_type_baseline()
{
  return MEMORY[0x1F410A318]();
}

uint64_t applejpeg_encode_set_option_type_lossless()
{
  return MEMORY[0x1F410A320]();
}

uint64_t applejpeg_recode_all_file()
{
  return MEMORY[0x1F410A338]();
}

uint64_t applejpeg_recode_clear_options()
{
  return MEMORY[0x1F410A340]();
}

uint64_t applejpeg_recode_close()
{
  return MEMORY[0x1F410A348]();
}

uint64_t applejpeg_recode_open_file()
{
  return MEMORY[0x1F410A358]();
}

uint64_t applejpeg_recode_set_option_aspect()
{
  return MEMORY[0x1F410A368]();
}

uint64_t applejpeg_recode_set_option_converter()
{
  return MEMORY[0x1F410A370]();
}

uint64_t applejpeg_recode_set_option_crop()
{
  return MEMORY[0x1F410A378]();
}

uint64_t applejpeg_recode_set_option_hw_accelerated_resize()
{
  return MEMORY[0x1F410A380]();
}

uint64_t applejpeg_recode_set_option_jpeg_format()
{
  return MEMORY[0x1F410A388]();
}

uint64_t applejpeg_recode_set_option_orientation()
{
  return MEMORY[0x1F410A3A0]();
}

uint64_t applejpeg_recode_set_option_outsize()
{
  return MEMORY[0x1F410A3A8]();
}

uint64_t applejpeg_recode_set_option_quantization_tables()
{
  return MEMORY[0x1F410A3B0]();
}

uint64_t applejpeg_recode_set_option_skip_app0()
{
  return MEMORY[0x1F410A3B8]();
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void bzero(void *a1, size_t a2)
{
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0B0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1F417F0C0](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1F417F0E0](stream, *(void *)&flags);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1F40CBBE8](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x1F40DED58]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x1F40DED60]();
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x1F40CC800](*(void *)&__e, __x);
  return result;
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x1F40CC808](*(void *)&a2, a1);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

void longjmp(jmp_buf a1, int a2)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x1F40CD538]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

uint64_t proc_can_use_foreground_hw()
{
  return MEMORY[0x1F40CD840]();
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int setjmp(jmp_buf a1)
{
  return MEMORY[0x1F40CDF80](a1);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

vImage_Error vImageClipToAlpha_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2398](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_AnyToAny(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2578](converter, srcs, dests, tempBuffer, *(void *)&flags);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25B0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2648](src, dest, *(void *)&flags);
}

vImageConverterRef vImageConverter_CreateWithColorSyncCodeFragment(CFTypeRef codeFragment, const vImage_CGImageFormat *srcFormat, const vImage_CGImageFormat *destFormat, const CGFloat *backgroundColor, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x1F40D27B0](codeFragment, srcFormat, destFormat, backgroundColor, *(void *)&flags, error);
}

vImage_Error vImageExtractChannel_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint64_t channelIndex, vImage_Flags flags)
{
  return MEMORY[0x1F40D28D8](src, dest, channelIndex, *(void *)&flags);
}

vImage_Error vImageExtractChannel_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint64_t channelIndex, vImage_Flags flags)
{
  return MEMORY[0x1F40D28E0](src, dest, channelIndex, *(void *)&flags);
}

uint64_t vImageOverwriteChannels_ARGB16U()
{
  return MEMORY[0x1F40D2B28]();
}

vImage_Error vImageOverwriteChannels_ARGB8888(const vImage_Buffer *newSrc, const vImage_Buffer *origSrc, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x1F40D2B30](newSrc, origSrc, dest, copyMask, *(void *)&flags);
}

vImage_Error vImagePremultiplyData_RGBA16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C18](src, dest, *(void *)&flags);
}

vImage_Error vImagePremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C20](src, dest, *(void *)&flags);
}

vImage_Error vImageUnpremultiplyData_RGBA16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D70](src, dest, *(void *)&flags);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

uint64_t yzip_codec_create()
{
  return MEMORY[0x1F417F110]();
}

uint64_t yzip_codec_destroy()
{
  return MEMORY[0x1F417F118]();
}

uint64_t yzip_image_create()
{
  return MEMORY[0x1F417F120]();
}

uint64_t yzip_image_decode()
{
  return MEMORY[0x1F417F128]();
}

uint64_t yzip_image_destroy()
{
  return MEMORY[0x1F417F130]();
}

uint64_t yzip_image_encode()
{
  return MEMORY[0x1F417F138]();
}

uint64_t yzip_image_get_max_payload_size()
{
  return MEMORY[0x1F417F140]();
}

uint64_t yzip_image_get_plane_descriptor()
{
  return MEMORY[0x1F417F148]();
}

uint64_t yzip_image_set_plane_data()
{
  return MEMORY[0x1F417F150]();
}