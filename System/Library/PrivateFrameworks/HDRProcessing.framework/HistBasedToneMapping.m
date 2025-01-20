@interface HistBasedToneMapping
- (BOOL)isDataValid;
- (BOOL)isSceneChanged;
- (BOOL)sceneChanged:(float *)a3 Prev:(float *)a4 Threshold:(float)a5 CorrCoeff:(float *)a6;
- (BOOL)toneChanged:(float)a3 Prev:(float)a4 Threshold:(float)a5;
- (HistBasedToneMapping)init;
- (HistStatLinkedListNode)statLinkedListCurr;
- (HistStatLinkedListNode)statLinkedListHead;
- (HistStatLinkedListNode)statLinkedListTail;
- (const)getHistDataPtr;
- (float)FIRFilterHistStat:(double)a3 statBuffer:(double *)a4 currIndex:(int)a5 numOfProcessedFrames:(int)a6;
- (float)FIRFilterHistStat:(float)a3 statBuffer:(float *)a4 currIndex:(int)a5 prevIndex:(int)a6 numOfProcessedFrames:(int)a7;
- (float)avgPixelLevel;
- (float)avgVal;
- (float)computeFrameAPLFromPQHistData:(float *)a3;
- (float)histBinCentroidInLinear;
- (float)histBinCentroidInPQ;
- (float)maxVal;
- (float)minVal;
- (float)normHistHeight;
- (float)pcntVal;
- (float)prctVal;
- (float)stdVal;
- (int)numPrct;
- (int)tempMode;
- (int64_t)computeFramePrctFromHistData;
- (int64_t)computeFrameStatFromHistData;
- (int64_t)debugHistDataFromLayer:(__IOSurface *)a3;
- (int64_t)getHistDataFromLayer:(__IOSurface *)a3;
- (int64_t)getHistStatFromLayer:(__IOSurface *)a3 HDRMode:(unsigned int)a4 transferFunction:(int)a5 temporalMode:(int)a6 iirAlpha:(float)a7 frameNumber:(unint64_t)a8;
- (int64_t)normalizeHistData:(unsigned int)a3 transferFunction:(int)a4;
- (int64_t)sanityCheckAndGetDataFromHist;
- (int64_t)temporalProcessHistStat:(int64_t)a3 iirAlpha:(float)a4;
- (unint64_t)getSumHist;
- (unsigned)bufSize;
- (void)computeFrameAvgFromHistData;
- (void)computeFrameMaxFromHistData;
- (void)computeFrameMinFromHistData;
- (void)computeFrameStdFromHistData;
- (void)dealloc;
- (void)findStatLinkedListNode:(int64_t)a3;
- (void)getSettingsFromDefaultsWrite;
- (void)mapBinFromNarrowRangeToFullRange;
- (void)normalizeHistDataAndMapToPQForHLGInput:(int)a3;
- (void)normalizeHistDataForDoViInput;
- (void)normalizeHistDataForHDR10Input;
- (void)setHistBasedToneMappingTemporalType:(unsigned int)a3 temporalMode:(int)a4;
- (void)setbufSize;
@end

@implementation HistBasedToneMapping

- (HistBasedToneMapping)init
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)HistBasedToneMapping;
  v2 = [(HistBasedToneMapping *)&v35 init];
  v3 = v2;
  if (v2)
  {
    v2->_hist = 0;
    v2->_histDataPtr = 0;
    *(void *)&v2->_minHistBin = 128;
    v2->_sumHist = 0;
    v4 = (float *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
    v3->_normHistHeight = v4;
    if (v4)
    {
      v5 = (float *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
      v3->_histBinCentroidInPQ = v5;
      if (v5)
      {
        v6 = (float *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
        v3->_binCenter = v6;
        if (v6)
        {
          v7 = (float *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
          v3->_histBinCentroidInLinear = v7;
          if (v7)
          {
            uint64_t v8 = 0;
            int32x4_t v9 = (int32x4_t)xmmword_2222D1810;
            binCenter = v3->_binCenter;
            __asm { FMOV            V1.2D, #0.5 }
            v16.i64[0] = 0x3C0000003C000000;
            v16.i64[1] = 0x3C0000003C000000;
            v17.i64[0] = 0x400000004;
            v17.i64[1] = 0x400000004;
            do
            {
              v18.i64[0] = v9.i32[0];
              v18.i64[1] = v9.i32[1];
              float64x2_t v19 = vcvtq_f64_s64(v18);
              v18.i64[0] = v9.i32[2];
              v18.i64[1] = v9.i32[3];
              *(float32x4_t *)&binCenter[v8] = vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(v19, _Q1)), vaddq_f64(vcvtq_f64_s64(v18), _Q1)), v16);
              int32x4_t v9 = vaddq_s32(v9, v17);
              v8 += 4;
            }
            while (v8 != 128);
            v20 = (float *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
            v3->_hlgBinCenterInPQ = v20;
            if (v20)
            {
              histogram_HLG2PQ(v3->_binCenter, 128, v20, 1000.0);
              v21 = (int *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
              v3->_fullRangeBinIdx = v21;
              if (v21)
              {
                [(HistBasedToneMapping *)v3 mapBinFromNarrowRangeToFullRange];
                statLinkedListHead = v3->_statLinkedListHead;
                v3->_statLinkedListHead = 0;

                statLinkedListTail = v3->_statLinkedListTail;
                v3->_statLinkedListTail = 0;

                statLinkedListCurr = v3->_statLinkedListCurr;
                v3->_statLinkedListCurr = 0;

                v3->_tempMode = 2;
                v3->_bufSize = 0;
                *(_OWORD *)&v3->_minVal = xmmword_2222D09D0;
                *(_WORD *)&v3->_histMinMaxBinCenter = 0;
                v25 = (float *)malloc_type_calloc(0xFuLL, 4uLL, 0x100004052888210uLL);
                v3->_pcntVal = v25;
                if (v25)
                {
                  v26 = (float *)malloc_type_calloc(0xFuLL, 4uLL, 0x100004052888210uLL);
                  v3->_prctVal = v26;
                  if (v26)
                  {
                    v3->_numPrct = 5;
                    v27 = v3;
                    goto LABEL_90;
                  }
                  if (enableLogInstance)
                  {
                    if (logInstanceID) {
                      uint64_t v28 = logInstanceID;
                    }
                    else {
                      uint64_t v28 = prevLogInstanceID;
                    }
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_72;
                    }
                    *(_DWORD *)buf = 134217984;
                    v37 = (const char *)WORD1(v28);
                    v29 = &_os_log_internal;
                    v30 = " [1.419.54] #%04llx Memory allocation for prctVal failed";
LABEL_71:
                    _os_log_impl(&dword_22224D000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
LABEL_72:
                    prevLogInstanceID = v28;
                    goto LABEL_80;
                  }
                  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_87;
                  }
                  *(_WORD *)buf = 0;
                  v31 = &_os_log_internal;
                  v32 = " [1.419.54] Memory allocation for prctVal failed";
                }
                else
                {
                  if (enableLogInstance)
                  {
                    if (logInstanceID) {
                      uint64_t v28 = logInstanceID;
                    }
                    else {
                      uint64_t v28 = prevLogInstanceID;
                    }
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_72;
                    }
                    *(_DWORD *)buf = 134217984;
                    v37 = (const char *)WORD1(v28);
                    v29 = &_os_log_internal;
                    v30 = " [1.419.54] #%04llx Memory allocation for pcntVal failed";
                    goto LABEL_71;
                  }
                  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_87;
                  }
                  *(_WORD *)buf = 0;
                  v31 = &_os_log_internal;
                  v32 = " [1.419.54] Memory allocation for pcntVal failed";
                }
              }
              else
              {
                if (enableLogInstance)
                {
                  if (logInstanceID) {
                    uint64_t v28 = logInstanceID;
                  }
                  else {
                    uint64_t v28 = prevLogInstanceID;
                  }
                  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_72;
                  }
                  *(_DWORD *)buf = 134217984;
                  v37 = (const char *)WORD1(v28);
                  v29 = &_os_log_internal;
                  v30 = " [1.419.54] #%04llx Memory allocation for fullRangeBinIdx failed";
                  goto LABEL_71;
                }
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_87;
                }
                *(_WORD *)buf = 0;
                v31 = &_os_log_internal;
                v32 = " [1.419.54] Memory allocation for fullRangeBinIdx failed";
              }
            }
            else
            {
              if (enableLogInstance)
              {
                if (logInstanceID) {
                  uint64_t v28 = logInstanceID;
                }
                else {
                  uint64_t v28 = prevLogInstanceID;
                }
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_72;
                }
                *(_DWORD *)buf = 134217984;
                v37 = (const char *)WORD1(v28);
                v29 = &_os_log_internal;
                v30 = " [1.419.54] #%04llx Memory allocation for hlgBinCenterInPQ failed";
                goto LABEL_71;
              }
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v31 = &_os_log_internal;
              v32 = " [1.419.54] Memory allocation for hlgBinCenterInPQ failed";
            }
          }
          else
          {
            if (enableLogInstance)
            {
              if (logInstanceID) {
                uint64_t v28 = logInstanceID;
              }
              else {
                uint64_t v28 = prevLogInstanceID;
              }
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_72;
              }
              *(_DWORD *)buf = 134217984;
              v37 = (const char *)WORD1(v28);
              v29 = &_os_log_internal;
              v30 = " [1.419.54] #%04llx Memory allocation for  histBinCentroidInLinear failed";
              goto LABEL_71;
            }
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_87;
            }
            *(_WORD *)buf = 0;
            v31 = &_os_log_internal;
            v32 = " [1.419.54] Memory allocation for  histBinCentroidInLinear failed";
          }
        }
        else
        {
          if (enableLogInstance)
          {
            if (logInstanceID) {
              uint64_t v28 = logInstanceID;
            }
            else {
              uint64_t v28 = prevLogInstanceID;
            }
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_72;
            }
            *(_DWORD *)buf = 134217984;
            v37 = (const char *)WORD1(v28);
            v29 = &_os_log_internal;
            v30 = " [1.419.54] #%04llx Memory allocation for pqBinCenterInPQ failed";
            goto LABEL_71;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_87;
          }
          *(_WORD *)buf = 0;
          v31 = &_os_log_internal;
          v32 = " [1.419.54] Memory allocation for pqBinCenterInPQ failed";
        }
      }
      else
      {
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v28 = logInstanceID;
          }
          else {
            uint64_t v28 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_72;
          }
          *(_DWORD *)buf = 134217984;
          v37 = (const char *)WORD1(v28);
          v29 = &_os_log_internal;
          v30 = " [1.419.54] #%04llx Memory allocation for histBinCenter failed";
          goto LABEL_71;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_87;
        }
        *(_WORD *)buf = 0;
        v31 = &_os_log_internal;
        v32 = " [1.419.54] Memory allocation for histBinCenter failed";
      }
    }
    else
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v28 = logInstanceID;
        }
        else {
          uint64_t v28 = prevLogInstanceID;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_72;
        }
        *(_DWORD *)buf = 134217984;
        v37 = (const char *)WORD1(v28);
        v29 = &_os_log_internal;
        v30 = " [1.419.54] #%04llx Memory allocation for normHist failed";
        goto LABEL_71;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_87;
      }
      *(_WORD *)buf = 0;
      v31 = &_os_log_internal;
      v32 = " [1.419.54] Memory allocation for normHist failed";
    }
    _os_log_impl(&dword_22224D000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
  }
LABEL_80:
  if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v33 = logInstanceID;
    }
    else {
      uint64_t v33 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v37 = (const char *)WORD1(v33);
      __int16 v38 = 2080;
      v39 = "-[HistBasedToneMapping init]";
      __int16 v40 = 2048;
      v41 = v3;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : Initialization Failed, self=%p\n", buf, 0x20u);
    }
    v27 = 0;
    prevLogInstanceID = v33;
    goto LABEL_90;
  }
LABEL_87:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[HistBasedToneMapping init]";
    __int16 v38 = 2048;
    v39 = (const char *)v3;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : Initialization Failed, self=%p\n", buf, 0x16u);
  }
  v27 = 0;
LABEL_90:

  return v27;
}

- (void)dealloc
{
  [(HistStatLinkedListNode *)self->_statLinkedListHead detachAllNodes];
  statLinkedListHead = self->_statLinkedListHead;
  self->_statLinkedListHead = 0;

  statLinkedListTail = self->_statLinkedListTail;
  self->_statLinkedListTail = 0;

  statLinkedListCurr = self->_statLinkedListCurr;
  self->_statLinkedListCurr = 0;

  self->_histDataPtr = 0;
  hist = self->_hist;
  if (hist) {
    CFRelease(hist);
  }
  normHistHeight = self->_normHistHeight;
  if (normHistHeight)
  {
    free(normHistHeight);
    self->_normHistHeight = 0;
  }
  histBinCentroidInPQ = self->_histBinCentroidInPQ;
  if (histBinCentroidInPQ)
  {
    free(histBinCentroidInPQ);
    self->_histBinCentroidInPQ = 0;
  }
  histBinCentroidInLinear = self->_histBinCentroidInLinear;
  if (histBinCentroidInLinear)
  {
    free(histBinCentroidInLinear);
    self->_histBinCentroidInLinear = 0;
  }
  binCenter = self->_binCenter;
  if (binCenter)
  {
    free(binCenter);
    self->_binCenter = 0;
  }
  hlgBinCenterInPQ = self->_hlgBinCenterInPQ;
  if (hlgBinCenterInPQ)
  {
    free(hlgBinCenterInPQ);
    self->_hlgBinCenterInPQ = 0;
  }
  fullRangeBinIdx = self->_fullRangeBinIdx;
  if (fullRangeBinIdx)
  {
    free(fullRangeBinIdx);
    self->_fullRangeBinIdx = 0;
  }
  pcntVal = self->_pcntVal;
  if (pcntVal)
  {
    free(pcntVal);
    self->_pcntVal = 0;
  }
  prctVal = self->_prctVal;
  if (prctVal)
  {
    free(prctVal);
    self->_prctVal = 0;
  }
  self->_numPrct = 0;
  v15.receiver = self;
  v15.super_class = (Class)HistBasedToneMapping;
  [(HistBasedToneMapping *)&v15 dealloc];
}

- (int64_t)getHistDataFromLayer:(__IOSurface *)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_hist)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v5 = logInstanceID;
      }
      else {
        uint64_t v5 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        uint64_t v8 = WORD1(v5);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"!_hist\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/hist_based_tone_mapping.mm\" at line 218\n", (uint8_t *)&v7, 0xCu);
      }
      prevLogInstanceID = v5;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"!_hist\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/hist_based_tone_mapping.mm\" at line 218\n", (uint8_t *)&v7, 2u);
    }
  }
  self->_hist = (void *)IOSurfaceCopyValue(a3, @"kIOSurfacePixelMetadata");
  return [(HistBasedToneMapping *)self sanityCheckAndGetDataFromHist];
}

- (int64_t)sanityCheckAndGetDataFromHist
{
  hist = self->_hist;
  if (!hist) {
    return -17001;
  }
  CFTypeID v4 = CFGetTypeID(hist);
  if (v4 != CFDictionaryGetTypeID()) {
    return -17001;
  }
  CFDictionaryRef v5 = (const __CFDictionary *)self->_hist;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v5, @"kIOSurfaceSessionCookie");
  if (!Value) {
    return -17001;
  }
  CFNumberGetValue(Value, kCFNumberSInt64Type, &self->_streamId);
  CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(v5, @"kIOSurfaceSessionFrameNumber");
  if (!v7) {
    return -17001;
  }
  int valuePtr = 0;
  CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr);
  CFDataRef v8 = (const __CFData *)CFDictionaryGetValue(v5, @"kIOSurfaceLumaHistogramV1");
  if (!v8) {
    return -17001;
  }
  CFDataRef v9 = v8;
  if (CFDataGetLength(v8) != 512) {
    return -17001;
  }
  BytePtr = (const char *)CFDataGetBytePtr(v9);
  self->_histDataPtr = BytePtr;
  if (!BytePtr) {
    return -17001;
  }
  uint64_t v11 = 0;
  int64x2_t v12 = 0uLL;
  int64x2_t v13 = 0uLL;
  do
  {
    uint32x4_t v14 = *(uint32x4_t *)&BytePtr[v11];
    int64x2_t v13 = (int64x2_t)vaddw_high_u32((uint64x2_t)v13, v14);
    int64x2_t v12 = (int64x2_t)vaddw_u32((uint64x2_t)v12, *(uint32x2_t *)v14.i8);
    v11 += 16;
  }
  while (v11 != 512);
  unint64_t v15 = vaddvq_s64(vaddq_s64(v12, v13));
  self->_sumHist = v15;
  if (v15) {
    return -17000;
  }
  else {
    return -17001;
  }
}

- (void)mapBinFromNarrowRangeToFullRange
{
  uint64_t v2 = 0;
  binCenter = self->_binCenter;
  float32x4_t v4 = (float32x4_t)vdupq_n_s32(0xBD802008);
  fullRangeBinIdx = self->_fullRangeBinIdx;
  float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x3F5B36CEu);
  v7.i64[0] = 0x7F0000007FLL;
  v7.i64[1] = 0x7F0000007FLL;
  do
  {
    *(uint32x4_t *)&fullRangeBinIdx[v2] = vminq_u32((uint32x4_t)vmaxq_s32(vcvtq_n_s32_f32(vdivq_f32(vaddq_f32(*(float32x4_t *)&binCenter[v2], v4), v6), 7uLL), (int32x4_t)0), v7);
    v2 += 4;
  }
  while (v2 != 128);
}

- (void)normalizeHistDataForHDR10Input
{
  uint64_t v2 = 0;
  histDataPtr = self->_histDataPtr;
  normHistHeight = self->_normHistHeight;
  *((_OWORD *)normHistHeight + 30) = 0u;
  *((_OWORD *)normHistHeight + 31) = 0u;
  *((_OWORD *)normHistHeight + 28) = 0u;
  *((_OWORD *)normHistHeight + 29) = 0u;
  *((_OWORD *)normHistHeight + 26) = 0u;
  *((_OWORD *)normHistHeight + 27) = 0u;
  *((_OWORD *)normHistHeight + 24) = 0u;
  *((_OWORD *)normHistHeight + 25) = 0u;
  *((_OWORD *)normHistHeight + 22) = 0u;
  *((_OWORD *)normHistHeight + 23) = 0u;
  *((_OWORD *)normHistHeight + 20) = 0u;
  *((_OWORD *)normHistHeight + 21) = 0u;
  *((_OWORD *)normHistHeight + 18) = 0u;
  *((_OWORD *)normHistHeight + 19) = 0u;
  *((_OWORD *)normHistHeight + 16) = 0u;
  *((_OWORD *)normHistHeight + 17) = 0u;
  *((_OWORD *)normHistHeight + 14) = 0u;
  *((_OWORD *)normHistHeight + 15) = 0u;
  *((_OWORD *)normHistHeight + 12) = 0u;
  *((_OWORD *)normHistHeight + 13) = 0u;
  *((_OWORD *)normHistHeight + 10) = 0u;
  *((_OWORD *)normHistHeight + 11) = 0u;
  *((_OWORD *)normHistHeight + 8) = 0u;
  *((_OWORD *)normHistHeight + 9) = 0u;
  *((_OWORD *)normHistHeight + 6) = 0u;
  *((_OWORD *)normHistHeight + 7) = 0u;
  *((_OWORD *)normHistHeight + 4) = 0u;
  *((_OWORD *)normHistHeight + 5) = 0u;
  *((_OWORD *)normHistHeight + 2) = 0u;
  *((_OWORD *)normHistHeight + 3) = 0u;
  *(_OWORD *)normHistHeight = 0u;
  *((_OWORD *)normHistHeight + 1) = 0u;
  fullRangeBinIdx = self->_fullRangeBinIdx;
  float sumHist = (float)self->_sumHist;
  uint32x4_t v7 = self->_normHistHeight;
  do
  {
    v7[fullRangeBinIdx[v2]] = v7[fullRangeBinIdx[v2]] + (float)((float)*(unsigned int *)&histDataPtr[v2 * 4] / sumHist);
    ++v2;
  }
  while (v2 != 128);
  memcpy(self->_histBinCentroidInPQ, self->_binCenter, 0x200uLL);
}

- (void)normalizeHistDataAndMapToPQForHLGInput:(int)a3
{
  uint64_t v3 = 0;
  histDataPtr = self->_histDataPtr;
  normHistHeight = self->_normHistHeight;
  *((_OWORD *)normHistHeight + 30) = 0u;
  *((_OWORD *)normHistHeight + 31) = 0u;
  *((_OWORD *)normHistHeight + 28) = 0u;
  *((_OWORD *)normHistHeight + 29) = 0u;
  *((_OWORD *)normHistHeight + 26) = 0u;
  *((_OWORD *)normHistHeight + 27) = 0u;
  *((_OWORD *)normHistHeight + 24) = 0u;
  *((_OWORD *)normHistHeight + 25) = 0u;
  *((_OWORD *)normHistHeight + 22) = 0u;
  *((_OWORD *)normHistHeight + 23) = 0u;
  *((_OWORD *)normHistHeight + 20) = 0u;
  *((_OWORD *)normHistHeight + 21) = 0u;
  *((_OWORD *)normHistHeight + 18) = 0u;
  *((_OWORD *)normHistHeight + 19) = 0u;
  *((_OWORD *)normHistHeight + 16) = 0u;
  *((_OWORD *)normHistHeight + 17) = 0u;
  *((_OWORD *)normHistHeight + 14) = 0u;
  *((_OWORD *)normHistHeight + 15) = 0u;
  *((_OWORD *)normHistHeight + 12) = 0u;
  *((_OWORD *)normHistHeight + 13) = 0u;
  *((_OWORD *)normHistHeight + 10) = 0u;
  *((_OWORD *)normHistHeight + 11) = 0u;
  *((_OWORD *)normHistHeight + 8) = 0u;
  *((_OWORD *)normHistHeight + 9) = 0u;
  *((_OWORD *)normHistHeight + 6) = 0u;
  *((_OWORD *)normHistHeight + 7) = 0u;
  *((_OWORD *)normHistHeight + 4) = 0u;
  *((_OWORD *)normHistHeight + 5) = 0u;
  *((_OWORD *)normHistHeight + 2) = 0u;
  *((_OWORD *)normHistHeight + 3) = 0u;
  *(_OWORD *)normHistHeight = 0u;
  *((_OWORD *)normHistHeight + 1) = 0u;
  histBinCentroidInPQ = self->_histBinCentroidInPQ;
  *((_OWORD *)histBinCentroidInPQ + 30) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 31) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 28) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 29) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 26) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 27) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 24) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 25) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 22) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 23) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 20) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 21) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 18) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 19) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 16) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 17) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 14) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 15) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 12) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 13) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 10) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 11) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 8) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 9) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 6) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 7) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 4) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 5) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 2) = 0u;
  *((_OWORD *)histBinCentroidInPQ + 3) = 0u;
  *(_OWORD *)histBinCentroidInPQ = 0u;
  *((_OWORD *)histBinCentroidInPQ + 1) = 0u;
  hlgBinCenterInPQ = self->_hlgBinCenterInPQ;
  CFDataRef v8 = self->_normHistHeight;
  CFDataRef v9 = self->_histBinCentroidInPQ;
  do
  {
    if (a3) {
      int v10 = v3;
    }
    else {
      int v10 = self->_fullRangeBinIdx[v3];
    }
    signed int v11 = vcvts_n_s32_f32(hlgBinCenterInPQ[v10], 7uLL);
    float v12 = (float)*(unsigned int *)&histDataPtr[4 * v3];
    v8[v11] = v8[v11] + v12;
    v9[v11] = v9[v11] + (float)(hlgBinCenterInPQ[v10] * v12);
    ++v3;
  }
  while (v3 != 128);
  for (uint64_t i = 0; i != 128; ++i)
  {
    float v14 = v8[i];
    if (v14 == 0.0)
    {
      v9[i] = self->_binCenter[i];
    }
    else
    {
      v9[i] = v9[i] / v14;
      v8[i] = v8[i] / (float)self->_sumHist;
    }
  }
}

- (void)normalizeHistDataForDoViInput
{
  uint64_t v3 = 0;
  histDataPtr = self->_histDataPtr;
  normHistHeight = self->_normHistHeight;
  *(float *)v2.i32 = (float)self->_sumHist;
  float32x4_t v6 = (float32x4_t)vdupq_lane_s32(v2, 0);
  do
  {
    *(float32x4_t *)&normHistHeight[v3] = vdivq_f32(vcvtq_f32_u32(*(uint32x4_t *)&histDataPtr[v3 * 4]), v6);
    v3 += 4;
  }
  while (v3 != 128);
  memcpy(self->_histBinCentroidInPQ, self->_binCenter, 0x200uLL);
}

- (int64_t)normalizeHistData:(unsigned int)a3 transferFunction:(int)a4
{
  switch(a3)
  {
    case 1u:
      if (a4 != 18)
      {
        [(HistBasedToneMapping *)self normalizeHistDataForDoViInput];
        goto LABEL_9;
      }
      goto LABEL_6;
    case 3u:
LABEL_6:
      -[HistBasedToneMapping normalizeHistDataAndMapToPQForHLGInput:](self, "normalizeHistDataAndMapToPQForHLGInput:", 0, *(void *)&a4);
      goto LABEL_9;
    case 2u:
      [(HistBasedToneMapping *)self normalizeHistDataForHDR10Input];
LABEL_9:
      int64_t v5 = -17000;
      goto LABEL_10;
  }
  int64_t v5 = -17006;
LABEL_10:
  uint64_t v6 = 0;
  histBinCentroidInPQ = self->_histBinCentroidInPQ;
  histBinCentroidInLinear = self->_histBinCentroidInLinear;
  do
  {
    float v9 = histBinCentroidInPQ[v6];
    BOOL v10 = v9 < 0.00000073096;
    if (v9 < 0.00000073096) {
      float v9 = -(float)(v9 + -0.0000014619);
    }
    float v11 = flt_2222D1868[v10];
    float v12 = powf(v9, 0.012683);
    float v13 = fmax((float)((float)(v12 + -0.83594) / (float)((float)(v12 * -18.688) + 18.852)), 0.0);
    histBinCentroidInLinear[v6++] = v11 * powf(v13, 6.2774);
  }
  while (v6 != 128);
  return v5;
}

- (void)computeFrameMinFromHistData
{
  uint64_t v2 = 0;
  while (self->_normHistHeight[v2] == 0.0)
  {
    if (++v2 == 128) {
      goto LABEL_6;
    }
  }
  self->_minHistBin = v2;
LABEL_6:
  if (self->_histMinMaxBinCenter) {
    float v3 = self->_histBinCentroidInPQ[self->_minHistBin];
  }
  else {
    float v3 = (float)self->_minHistBin * 0.0078125;
  }
  self->_minVal = v3;
}

- (void)computeFrameMaxFromHistData
{
  uint64_t v2 = self->_normHistHeight + 127;
  int v3 = 127;
  while (*v2 == 0.0)
  {
    --v3;
    --v2;
    if (v3 == -1) {
      goto LABEL_6;
    }
  }
  self->_maxHistBin = v3;
LABEL_6:
  if (self->_histMinMaxBinCenter) {
    float v4 = self->_histBinCentroidInPQ[self->_maxHistBin];
  }
  else {
    float v4 = (float)(self->_maxHistBin + 1) * 0.0078125;
  }
  self->_maxVal = v4;
}

- (void)computeFrameAvgFromHistData
{
  self->_avgVal = 0.0;
  int maxHistBin = self->_maxHistBin;
  uint64_t minHistBin = self->_minHistBin;
  if ((int)minHistBin <= maxHistBin)
  {
    float v4 = &self->_normHistHeight[minHistBin];
    int v5 = maxHistBin - minHistBin + 1;
    uint64_t v6 = &self->_histBinCentroidInPQ[minHistBin];
    float v7 = 0.0;
    do
    {
      float v8 = *v4++;
      float v9 = v8;
      float v10 = *v6++;
      float v7 = v7 + (float)(v9 * v10);
      self->_avgVal = v7;
      --v5;
    }
    while (v5);
  }
}

- (void)computeFrameStdFromHistData
{
  int maxHistBin = self->_maxHistBin;
  uint64_t minHistBin = self->_minHistBin;
  float v4 = 0.0;
  if ((int)minHistBin <= maxHistBin)
  {
    int v5 = &self->_normHistHeight[minHistBin];
    int v6 = maxHistBin - minHistBin + 1;
    float v7 = &self->_histBinCentroidInPQ[minHistBin];
    do
    {
      float v8 = *v5++;
      float v9 = v8;
      float v10 = *v7++;
      float v4 = v4 + (float)((float)(v9 * v10) * v10);
      --v6;
    }
    while (v6);
  }
  self->_stdVal = sqrtf(v4 - (float)(self->_avgVal * self->_avgVal));
}

- (float)computeFrameAPLFromPQHistData:(float *)a3
{
  uint64_t v4 = 0;
  float32x2_t v22 = (float32x2_t)vdup_n_s32(0xB5C436E8);
  float32x2_t v23 = (float32x2_t)vdup_n_s32(0x354436E8u);
  int8x8_t v20 = (int8x8_t)vdup_n_s32(0x461C4000u);
  int8x8_t v21 = (int8x8_t)vdup_n_s32(0xC61C4000);
  float32x2_t v5 = (float32x2_t)vdup_n_s32(0xBF560000);
  float32x2_t v6 = (float32x2_t)vdup_n_s32(0xC1958000);
  float32x2_t v7 = (float32x2_t)vdup_n_s32(0x4196D000u);
  normHistHeight = self->_normHistHeight;
  float v9 = 0.0;
  do
  {
    float32x2_t v10 = *(float32x2_t *)&normHistHeight[v4];
    float32x2_t v11 = *(float32x2_t *)&a3[v4];
    int8x8_t v12 = (int8x8_t)vcge_f32(v11, v23);
    int8x8_t v13 = vbsl_s8(v12, (int8x8_t)v11, (int8x8_t)vneg_f32(vadd_f32(v11, v22)));
    float v24 = *(float *)v13.i32;
    float32x2_t v14 = (float32x2_t)vbsl_s8(v12, v20, v21);
    float v26 = powf(*(float *)&v13.i32[1], 0.012683);
    v15.f32[0] = powf(v24, 0.012683);
    v15.f32[1] = v26;
    float32x2_t v16 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(vadd_f32(v15, v5), vmla_f32(v7, v6, v15))), (float64x2_t)0));
    float v25 = v16.f32[0];
    float v27 = powf(v16.f32[1], 6.2774);
    v17.f32[0] = powf(v25, 6.2774);
    v17.f32[1] = v27;
    float32x2_t v18 = vmul_f32(v10, vmul_f32(v14, v17));
    float v9 = (float)(v9 + v18.f32[0]) + v18.f32[1];
    v4 += 2;
  }
  while (v4 != 128);
  return v9;
}

- (int64_t)computeFrameStatFromHistData
{
  [(HistBasedToneMapping *)self computeFrameMinFromHistData];
  [(HistBasedToneMapping *)self computeFrameMaxFromHistData];
  if (self->_minVal > self->_maxVal) {
    return -17001;
  }
  [(HistBasedToneMapping *)self computeFrameAvgFromHistData];
  [(HistBasedToneMapping *)self computeFrameStdFromHistData];
  [(HistBasedToneMapping *)self computeFrameAPLFromPQHistData:self->_histBinCentroidInPQ];
  self->_avgPixelLevel = v4;
  return -17000;
}

- (int64_t)computeFramePrctFromHistData
{
  uint64_t v2 = 0;
  int v3 = 0;
  LODWORD(v4) = 0;
  float v5 = *(float *)&debugPercentEntry0;
  float v6 = 0.0;
  if (*(float *)&debugPercentEntry0 > 1.0 || *(float *)&debugPercentEntry0 < 0.0) {
    float v5 = 0.001;
  }
  pcntVal = self->_pcntVal;
  prctVal = self->_prctVal;
  float *pcntVal = v5;
  float v10 = *(float *)&debugPercentEntry1;
  if (*(float *)&debugPercentEntry1 > 1.0 || *(float *)&debugPercentEntry1 < 0.0) {
    float v10 = 0.05;
  }
  float v12 = *(float *)&debugPercentEntry2;
  if (*(float *)&debugPercentEntry2 > 1.0 || *(float *)&debugPercentEntry2 < 0.0) {
    float v12 = 0.5;
  }
  self->_numPrct = 5;
  pcntVal[1] = v10;
  pcntVal[2] = v12;
  float v14 = *(float *)&debugPercentEntry3;
  if (*(float *)&debugPercentEntry3 > 1.0 || *(float *)&debugPercentEntry3 < 0.0) {
    float v14 = 0.985;
  }
  BOOL v16 = *(float *)&debugPercentEntry4 > 1.0 || *(float *)&debugPercentEntry4 < 0.0;
  float v17 = 0.999;
  if (!v16) {
    float v17 = *(float *)&debugPercentEntry4;
  }
  pcntVal[3] = v14;
  pcntVal[4] = v17;
  normHistHeight = self->_normHistHeight;
  histBinCentroidInPQ = self->_histBinCentroidInPQ;
  do
  {
    if ((int)v4 <= 127)
    {
      float v20 = pcntVal[v2];
      if (v6 < v20)
      {
        uint64_t v4 = (int)v4;
        while (1)
        {
          float v6 = v6 + normHistHeight[v4];
          if (v4 == 127) {
            break;
          }
          ++v4;
          if (v6 >= v20)
          {
            int v3 = v4 - 1;
            goto LABEL_38;
          }
        }
        int v3 = 127;
        LODWORD(v4) = 128;
      }
    }
LABEL_38:
    prctVal[v2++] = histBinCentroidInPQ[v3];
  }
  while (v2 != 5);
  return -17000;
}

- (void)findStatLinkedListNode:(int64_t)a3
{
  p_statLinkedListHead = &self->_statLinkedListHead;
  statLinkedListHead = self->_statLinkedListHead;
  if (statLinkedListHead)
  {
    float32x2_t v7 = statLinkedListHead;
    int v8 = 0;
    while (1)
    {
      obj = v7;
      if ([(HistStatLinkedListNode *)v7 streamId] == a3) {
        break;
      }
      uint64_t v9 = [(HistStatLinkedListNode *)obj next];

      ++v8;
      float32x2_t v7 = (HistStatLinkedListNode *)v9;
      if (!v9)
      {
        float v10 = [[HistStatLinkedListNode alloc] initWithStreamId:a3 bufferSize:self->_bufSize];
        [(HistStatLinkedListNode *)v10 setNext:*p_statLinkedListHead];
        [(HistStatLinkedListNode *)v10 setPrev:0];
        [(HistStatLinkedListNode *)*p_statLinkedListHead setPrev:v10];
        objc_storeStrong((id *)p_statLinkedListHead, v10);
        ++v8;
        float32x2_t v11 = v10;
        goto LABEL_12;
      }
    }
    float32x2_t v11 = obj;
    if (obj != *p_statLinkedListHead)
    {
      float32x2_t v15 = [(HistStatLinkedListNode *)obj next];
      BOOL v16 = [(HistStatLinkedListNode *)obj prev];
      [v16 setNext:v15];

      if (obj == self->_statLinkedListTail)
      {
        float64x2_t v19 = [(HistStatLinkedListNode *)obj prev];
        statLinkedListTail = self->_statLinkedListTail;
        self->_statLinkedListTail = v19;
      }
      else
      {
        statLinkedListTail = [(HistStatLinkedListNode *)obj prev];
        float32x2_t v18 = [(HistStatLinkedListNode *)obj next];
        [v18 setPrev:statLinkedListTail];
      }
      [(HistStatLinkedListNode *)obj setNext:*p_statLinkedListHead];
      [(HistStatLinkedListNode *)obj setPrev:0];
      [(HistStatLinkedListNode *)*p_statLinkedListHead setPrev:obj];
      objc_storeStrong((id *)p_statLinkedListHead, obj);
      float32x2_t v11 = obj;
    }
LABEL_12:
    obja = v11;
    objc_storeStrong((id *)&self->_statLinkedListCurr, v11);
    if (v8 >= 101)
    {
      float v20 = [(HistStatLinkedListNode *)self->_statLinkedListTail prev];
      int8x8_t v21 = self->_statLinkedListTail;
      self->_statLinkedListTail = v20;

      float32x2_t v22 = [(HistStatLinkedListNode *)self->_statLinkedListTail next];
      [v22 setPrev:0];

      [(HistStatLinkedListNode *)self->_statLinkedListTail setNext:0];
    }
  }
  else
  {
    float v12 = [[HistStatLinkedListNode alloc] initWithStreamId:a3 bufferSize:self->_bufSize];
    int8x8_t v13 = self->_statLinkedListHead;
    self->_statLinkedListHead = v12;

    objc_storeStrong((id *)&self->_statLinkedListCurr, self->_statLinkedListHead);
    float v14 = self->_statLinkedListCurr;
    obja = self->_statLinkedListTail;
    self->_statLinkedListTail = v14;
  }
}

- (float)FIRFilterHistStat:(float)a3 statBuffer:(float *)a4 currIndex:(int)a5 prevIndex:(int)a6 numOfProcessedFrames:(int)a7
{
  int bufSize = self->_bufSize;
  float v8 = a4[a6] + a3;
  if (bufSize <= a7)
  {
    uint64_t v10 = a5;
    float result = (float)(v8 - a4[a5]) / (float)bufSize;
  }
  else
  {
    float result = v8 / (float)(a7 + 1);
    uint64_t v10 = a5;
  }
  a4[v10] = v8;
  return result;
}

- (float)FIRFilterHistStat:(double)a3 statBuffer:(double *)a4 currIndex:(int)a5 numOfProcessedFrames:(int)a6
{
  float v6 = &a4[a5];
  double *v6 = a3;
  double v7 = 0.0;
  if ((a5 & 0x80000000) == 0)
  {
    float v8 = &a4[a5];
    do
    {
      double v9 = *v8--;
      double v7 = v7 + v9;
    }
    while (v8 >= a4);
  }
  uint64_t bufSize = self->_bufSize;
  float32x2_t v11 = &a4[bufSize - 1];
  if ((int)bufSize <= a6 && v11 > v6)
  {
    do
    {
      double v13 = *v11--;
      double v7 = v7 + v13;
    }
    while (v11 > v6);
  }
  if ((int)bufSize > a6) {
    int v14 = a6 + 1;
  }
  else {
    int v14 = self->_bufSize;
  }
  return v7 / (double)v14;
}

- (int64_t)temporalProcessHistStat:(int64_t)a3 iirAlpha:(float)a4
{
  float avgVal = self->_avgVal;
  float v7 = self->_prctVal[self->_numPrct - 1];
  self->_BOOL isSceneChanged = 1;
  int tempMode = self->_tempMode;
  if ((tempMode & 0xFFFFFFFE) == 2)
  {
    [(HistBasedToneMapping *)self findStatLinkedListNode:a3];
    [(HistStatLinkedListNode *)self->_statLinkedListCurr prevAvgVal];
    int v10 = v9;
    [(HistStatLinkedListNode *)self->_statLinkedListCurr prevMaxVal];
    int v12 = v11;
    if ([(HistStatLinkedListNode *)self->_statLinkedListCurr numOfProcessedFrames])
    {
      LODWORD(v15) = 1027101164;
      *(float *)&double v13 = avgVal;
      LODWORD(v14) = v10;
      BOOL v16 = [(HistBasedToneMapping *)self toneChanged:v13 Prev:v14 Threshold:v15];
      LODWORD(v17) = 1036831949;
      *(float *)&double v18 = v7;
      LODWORD(v19) = v12;
      int v20 = v16 | [(HistBasedToneMapping *)self toneChanged:v18 Prev:v19 Threshold:v17];
    }
    else
    {
      LOBYTE(v20) = 1;
    }
    self->_BOOL isSceneChanged = v20;
    *(float *)&double v13 = avgVal;
    [(HistStatLinkedListNode *)self->_statLinkedListCurr setPrevAvgVal:v13];
    *(float *)&double v21 = v7;
    [(HistStatLinkedListNode *)self->_statLinkedListCurr setPrevMaxVal:v21];
    int tempMode = self->_tempMode;
  }
  if (tempMode == 1) {
    return -17000;
  }
  if (tempMode == 3)
  {
    unint64_t v28 = [(HistStatLinkedListNode *)self->_statLinkedListCurr numOfProcessedFrames];
    unint64_t bufSize = self->_bufSize;
    BOOL isSceneChanged = self->_isSceneChanged;
    float minVal = self->_minVal;
    v32 = [(HistStatLinkedListNode *)self->_statLinkedListCurr minValBuffer];
    uint64_t v33 = v32;
    if (isSceneChanged)
    {
      float *v32 = minVal;
      float maxVal = self->_maxVal;
      *[(HistStatLinkedListNode *)self->_statLinkedListCurr maxValBuffer] = maxVal;
      float v35 = self->_avgVal;
      *[(HistStatLinkedListNode *)self->_statLinkedListCurr avgValBuffer] = v35;
      float stdVal = self->_stdVal;
      *[(HistStatLinkedListNode *)self->_statLinkedListCurr stdValBuffer] = stdVal;
      if (self->_numPrct >= 1)
      {
        uint64_t v37 = 0;
        do
        {
          float v38 = self->_prctVal[v37];
          *[(HistStatLinkedListNode *)self->_statLinkedListCurr prctValBuffer][8 * v37++] = v38;
        }
        while (v37 < self->_numPrct);
      }
      goto LABEL_18;
    }
    uint64_t v48 = (v28 % bufSize);
    uint64_t v49 = (((int)bufSize + (int)v48 - 1) % (int)bufSize);
    unint64_t v50 = [(HistStatLinkedListNode *)self->_statLinkedListCurr numOfProcessedFrames];
    *(float *)&double v51 = minVal;
    [(HistBasedToneMapping *)self FIRFilterHistStat:v33 statBuffer:v48 currIndex:v49 prevIndex:v50 numOfProcessedFrames:v51];
    self->_float minVal = v52;
    float v53 = self->_maxVal;
    v54 = [(HistStatLinkedListNode *)self->_statLinkedListCurr maxValBuffer];
    unint64_t v55 = [(HistStatLinkedListNode *)self->_statLinkedListCurr numOfProcessedFrames];
    *(float *)&double v56 = v53;
    [(HistBasedToneMapping *)self FIRFilterHistStat:v54 statBuffer:v48 currIndex:v49 prevIndex:v55 numOfProcessedFrames:v56];
    self->_float maxVal = v57;
    float v58 = self->_avgVal;
    v59 = [(HistStatLinkedListNode *)self->_statLinkedListCurr avgValBuffer];
    unint64_t v60 = [(HistStatLinkedListNode *)self->_statLinkedListCurr numOfProcessedFrames];
    *(float *)&double v61 = v58;
    [(HistBasedToneMapping *)self FIRFilterHistStat:v59 statBuffer:v48 currIndex:v49 prevIndex:v60 numOfProcessedFrames:v61];
    self->_float avgVal = v62;
    float v63 = self->_stdVal;
    v64 = [(HistStatLinkedListNode *)self->_statLinkedListCurr stdValBuffer];
    unint64_t v65 = [(HistStatLinkedListNode *)self->_statLinkedListCurr numOfProcessedFrames];
    *(float *)&double v66 = v63;
    [(HistBasedToneMapping *)self FIRFilterHistStat:v64 statBuffer:v48 currIndex:v49 prevIndex:v65 numOfProcessedFrames:v66];
    self->_float stdVal = v67;
    if (self->_numPrct >= 1)
    {
      uint64_t v68 = 0;
      prctVal = self->_prctVal;
      do
      {
        float v70 = prctVal[v68];
        uint64_t v71 = (uint64_t)[(HistStatLinkedListNode *)self->_statLinkedListCurr prctValBuffer][8 * v68];
        unint64_t v72 = [(HistStatLinkedListNode *)self->_statLinkedListCurr numOfProcessedFrames];
        *(float *)&double v73 = v70;
        [(HistBasedToneMapping *)self FIRFilterHistStat:v71 statBuffer:v48 currIndex:v49 prevIndex:v72 numOfProcessedFrames:v73];
        prctVal = self->_prctVal;
        prctVal[v68++] = v74;
      }
      while (v68 < self->_numPrct);
    }
LABEL_27:
    statLinkedListCurr = self->_statLinkedListCurr;
    uint64_t v40 = [(HistStatLinkedListNode *)statLinkedListCurr numOfProcessedFrames] + 1;
    v39 = statLinkedListCurr;
    goto LABEL_28;
  }
  if (tempMode != 2) {
    return -17006;
  }
  if (!self->_isSceneChanged)
  {
    float v42 = (float)(self->_minVal * a4)
        + (float)((float)(1.0 - a4) * *[(HistStatLinkedListNode *)self->_statLinkedListCurr minValBuffer]);
    *[(HistStatLinkedListNode *)self->_statLinkedListCurr minValBuffer] = v42;
    self->_float minVal = v42;
    float v43 = (float)(self->_maxVal * a4)
        + (float)((float)(1.0 - a4) * *[(HistStatLinkedListNode *)self->_statLinkedListCurr maxValBuffer]);
    *[(HistStatLinkedListNode *)self->_statLinkedListCurr maxValBuffer] = v43;
    self->_float maxVal = v43;
    float v44 = (float)(self->_avgVal * a4)
        + (float)((float)(1.0 - a4) * *[(HistStatLinkedListNode *)self->_statLinkedListCurr avgValBuffer]);
    *[(HistStatLinkedListNode *)self->_statLinkedListCurr avgValBuffer] = v44;
    self->_float avgVal = v44;
    float v45 = (float)(self->_stdVal * a4)
        + (float)((float)(1.0 - a4) * *[(HistStatLinkedListNode *)self->_statLinkedListCurr stdValBuffer]);
    *[(HistStatLinkedListNode *)self->_statLinkedListCurr stdValBuffer] = v45;
    self->_float stdVal = v45;
    if (self->_numPrct >= 1)
    {
      uint64_t v46 = 0;
      do
      {
        float v47 = (float)(self->_prctVal[v46] * a4)
            + (float)((float)(1.0 - a4)
                    * *[(HistStatLinkedListNode *)self->_statLinkedListCurr prctValBuffer][8 * v46]);
        *[(HistStatLinkedListNode *)self->_statLinkedListCurr prctValBuffer][8 * v46] = v47;
        self->_prctVal[v46++] = v47;
      }
      while (v46 < self->_numPrct);
    }
    goto LABEL_27;
  }
  float v22 = self->_minVal;
  *[(HistStatLinkedListNode *)self->_statLinkedListCurr minValBuffer] = v22;
  float v23 = self->_maxVal;
  *[(HistStatLinkedListNode *)self->_statLinkedListCurr maxValBuffer] = v23;
  float v24 = self->_avgVal;
  *[(HistStatLinkedListNode *)self->_statLinkedListCurr avgValBuffer] = v24;
  float v25 = self->_stdVal;
  *[(HistStatLinkedListNode *)self->_statLinkedListCurr stdValBuffer] = v25;
  if (self->_numPrct >= 1)
  {
    uint64_t v26 = 0;
    do
    {
      float v27 = self->_prctVal[v26];
      *[(HistStatLinkedListNode *)self->_statLinkedListCurr prctValBuffer][8 * v26++] = v27;
    }
    while (v26 < self->_numPrct);
  }
LABEL_18:
  v39 = self->_statLinkedListCurr;
  uint64_t v40 = 1;
LABEL_28:
  [(HistStatLinkedListNode *)v39 setNumOfProcessedFrames:v40];
  return -17000;
}

- (void)setHistBasedToneMappingTemporalType:(unsigned int)a3 temporalMode:(int)a4
{
  if (a3 - 1 > 2)
  {
    self->_int tempMode = 0;
  }
  else
  {
    self->_int tempMode = a4;
    [(HistBasedToneMapping *)self setbufSize];
  }
}

- (void)setbufSize
{
  int tempMode = self->_tempMode;
  if (tempMode == 3) {
    __int16 v3 = 30;
  }
  else {
    __int16 v3 = 0;
  }
  if (tempMode == 2) {
    unsigned __int16 v4 = 1;
  }
  else {
    unsigned __int16 v4 = v3;
  }
  self->_unint64_t bufSize = v4;
}

- (BOOL)toneChanged:(float)a3 Prev:(float)a4 Threshold:(float)a5
{
  return vabds_f32(a4, a3) > a5;
}

- (BOOL)sceneChanged:(float *)a3 Prev:(float *)a4 Threshold:(float)a5 CorrCoeff:(float *)a6
{
  float v6 = *a3;
  if (*a3 <= *a4) {
    float v6 = *a4;
  }
  float v7 = (float)((float)(*a3 - *a4) * (float)(*a3 - *a4)) / v6;
  float v8 = -0.0;
  if ((float)(*a3 + *a4) != 0.0) {
    float v8 = v7;
  }
  float v9 = 0.0;
  int v10 = 128;
  do
  {
    float v9 = v8 + v9;
    --v10;
  }
  while (v10);
  float v11 = v9 * 100.0;
  *a6 = v11;
  return v11 >= a5;
}

- (void)getSettingsFromDefaultsWrite
{
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    unsigned __int16 v4 = GetConfig((HDRConfig *)Config);
    ConfigEntryCFNumberRef Value = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v4, 0, 0);
    if (*(unsigned char *)ConfigEntryValue)
    {
      float v6 = (HDRConfig *)GetConfig(ConfigEntryValue);
      if (v6)
      {
        float v7 = GetConfig(v6);
        float v6 = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v7, 0x34u, 0);
        unsigned __int8 v8 = *(unsigned char *)v6 != 0;
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
      self->_histPrintData = v8;
      float v9 = GetConfig(v6);
      if (v9)
      {
        int v10 = GetConfig((HDRConfig *)v9);
        unsigned __int8 v11 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v10, 0x33u, 0) != 0;
      }
      else
      {
        unsigned __int8 v11 = 0;
      }
      self->_histMinMaxBinCenter = v11;
    }
  }
}

- (int64_t)getHistStatFromLayer:(__IOSurface *)a3 HDRMode:(unsigned int)a4 transferFunction:(int)a5 temporalMode:(int)a6 iirAlpha:(float)a7 frameNumber:(unint64_t)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  self->_frameNumber = a8;
  [(HistBasedToneMapping *)self getSettingsFromDefaultsWrite];
  [(HistBasedToneMapping *)self setHistBasedToneMappingTemporalType:v11 temporalMode:v9];
  if ((self->_tempMode - 1) > 2)
  {
    int64_t v14 = -17001;
  }
  else
  {
    int64_t v14 = [(HistBasedToneMapping *)self getHistDataFromLayer:a3];
    if (v14 == -17000)
    {
      int64_t v14 = [(HistBasedToneMapping *)self normalizeHistData:v11 transferFunction:v10];
      if (v14 == -17000)
      {
        int64_t v14 = [(HistBasedToneMapping *)self computeFrameStatFromHistData];
        if (v14 == -17000)
        {
          int64_t v14 = [(HistBasedToneMapping *)self computeFramePrctFromHistData];
          if (v14 == -17000)
          {
            *(float *)&double v15 = a7;
            int64_t v14 = [(HistBasedToneMapping *)self temporalProcessHistStat:self->_streamId iirAlpha:v15];
            if (v14 == -17000)
            {
              BOOL v16 = 1;
              int64_t v14 = -17000;
              goto LABEL_10;
            }
          }
        }
      }
    }
  }
  BOOL v16 = 0;
LABEL_10:
  self->_isDataValid = v16;
  hist = self->_hist;
  if (hist)
  {
    CFRelease(hist);
    self->_hist = 0;
  }
  return v14;
}

- (int64_t)debugHistDataFromLayer:(__IOSurface *)a3
{
  [(HistBasedToneMapping *)self getSettingsFromDefaultsWrite];
  int64_t result = [(HistBasedToneMapping *)self getHistDataFromLayer:a3];
  self->_isDataValid = result == -17000;
  return result;
}

- (const)getHistDataPtr
{
  return self->_histDataPtr;
}

- (unint64_t)getSumHist
{
  return self->_sumHist;
}

- (float)normHistHeight
{
  return self->_normHistHeight;
}

- (float)histBinCentroidInPQ
{
  return self->_histBinCentroidInPQ;
}

- (float)histBinCentroidInLinear
{
  return self->_histBinCentroidInLinear;
}

- (float)minVal
{
  return self->_minVal;
}

- (float)maxVal
{
  return self->_maxVal;
}

- (float)avgVal
{
  return self->_avgVal;
}

- (float)stdVal
{
  return self->_stdVal;
}

- (int)numPrct
{
  return self->_numPrct;
}

- (float)pcntVal
{
  return self->_pcntVal;
}

- (float)prctVal
{
  return self->_prctVal;
}

- (float)avgPixelLevel
{
  return self->_avgPixelLevel;
}

- (BOOL)isDataValid
{
  return self->_isDataValid;
}

- (BOOL)isSceneChanged
{
  return self->_isSceneChanged;
}

- (HistStatLinkedListNode)statLinkedListHead
{
  return (HistStatLinkedListNode *)objc_getProperty(self, a2, 184, 1);
}

- (HistStatLinkedListNode)statLinkedListTail
{
  return (HistStatLinkedListNode *)objc_getProperty(self, a2, 192, 1);
}

- (HistStatLinkedListNode)statLinkedListCurr
{
  return (HistStatLinkedListNode *)objc_getProperty(self, a2, 200, 1);
}

- (int)tempMode
{
  return self->_tempMode;
}

- (unsigned)bufSize
{
  return self->_bufSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statLinkedListCurr, 0);
  objc_storeStrong((id *)&self->_statLinkedListTail, 0);
  objc_storeStrong((id *)&self->_statLinkedListHead, 0);
}

@end