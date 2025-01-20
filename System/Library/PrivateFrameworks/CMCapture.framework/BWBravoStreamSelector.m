@interface BWBravoStreamSelector
+ (void)initialize;
- ($06E035DAA80D7DA92D7AC3530BEA5F2A)selectionConfiguration;
- (BOOL)_conditionsAllowSwitchToRecommendedMasterStream:(BOOL)result debugOverlayInfo:(void *)a2;
- (BOOL)superWideAutoSwitchingSupported;
- (BOOL)telephotoLimitsReachedForFrameStatisticsByPortType:(id)a3;
- (BWBravoStreamSelector)initWithStreamSelectionAttributes:(id)a3 wideStream:(id)a4 teleStream:(id)a5 superWideStream:(id)a6 cameraCalibrationValid:(BOOL)a7;
- (BWFigVideoCaptureStream)preferredMasterStreamIgnoringEligibleFallbackPortTypes;
- (BWFigVideoCaptureStream)recommendedMasterStream;
- (BWFigVideoCaptureStream)slaveStreamBlockingFocusAndExposureStability;
- (NSArray)eligibleFallbackPortTypes;
- (float)superWideToWideFocusDistance;
- (float)teleMaxAEGain;
- (float)teleMaxEIT;
- (float)wideToSuperWideFocusDistance;
- (id)preferredMasterPortTypeForFrameStatisticsByPortType:(id)a3 zoomFactor:(float)a4;
- (id)recommendMasterStreamUsingCurrentMasterStream:(id)a3 frameStatisticsByPortType:(id)a4 zoomFactor:(float)a5 isAutoFlashScene:(BOOL)a6 digitalFlashMode:(int)a7 detectedObjects:(id)a8 cameraControlsStatisticsMasterStream:(id)a9;
- (int)lastSelectionReason;
- (uint64_t)_exposureAllowsSwitchToRecommendedMasterStream:(void *)a3 frameStatisticsByPortType:;
- (uint64_t)_exposureAndFocusStableForSwitchOverTo:(uint64_t)a1 forFrameStatisticsByPortType:(uint64_t)a2 debugOverlayInfo:(void *)a3;
- (uint64_t)_focusIsStable:(uint64_t)a1;
- (uint64_t)_selectionBehaviorAllowsSwitchOverTo:(void *)a3 forFrameStatisticsByPortType:(unsigned char *)a4 zoomFactor:blockedByExposureFocusStability:debugOverlayInfo:;
- (uint64_t)_telephotoLimitsReachedForFrameStatisticsByPortType:(uint64_t)result debugOverlayInfo:(void *)a2;
- (uint64_t)_updateSceneChangeMonitorWithFrameStatisticsByPortType:(uint64_t)result fromMasterStream:(void *)a2 zoomFactor:(void *)a3 digitalFlashMode:(int)a4 debugOverlayInfo:(float)a5;
- (uint64_t)_updateStateWithFrameStatisticsByPortType:(void *)a3 detectedObjects:;
- (uint64_t)_updateSuperWideFocusIsStableOnceWithFrameStatisticsByPortType:(uint64_t)result;
- (void)_preferredMasterStreamForFrameStatisticsByPortType:(char)a3 zoomFactor:(int)a4 isAutoFlashScene:(void *)a5 digitalFlashMode:(int)a6 debugOverlayInfo:(unsigned char *)a7 ignoreEligibleFallbackPortTypes:(int *)a8 requiresFocusExposeStabilityOut:(float)a9 selectionReasonOut:;
- (void)dealloc;
- (void)exposureModeDidChange;
- (void)focusModeDidChange;
- (void)resetWithZoomFactor:(float)a3 currentMasterStream:(id)a4;
- (void)setEligibleFallbackPortTypes:(id)a3;
- (void)setSelectionConfiguration:(id)a3;
- (void)setTeleMaxAEGain:(float)a3;
- (void)setTeleMaxEIT:(float)a3;
@end

@implementation BWBravoStreamSelector

- (uint64_t)_exposureAllowsSwitchToRecommendedMasterStream:(void *)a3 frameStatisticsByPortType:
{
  if (result)
  {
    uint64_t v4 = result;
    if (*(void *)(result + 16) == a2 || *(void *)(result + 24) == a2)
    {
      int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(*(id *)(result + 152), "portType")), "aeTarget");
      float v6 = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(*(id *)(v4 + 152), "portType")), "aeAverage");
      return (float)(*(float *)(v4 + 424) * (float)v5) <= v6 && (float)(*(float *)(v4 + 428) * (float)v5) >= v6;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)_exposureAndFocusStableForSwitchOverTo:(uint64_t)a1 forFrameStatisticsByPortType:(uint64_t)a2 debugOverlayInfo:(void *)a3
{
  if (!a1) {
    return 0;
  }
  float v6 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 24), "portType"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 8), "portType"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 16), "portType"));
  int v9 = [v7 aeStable];
  int v10 = [v8 aeStable];
  uint64_t v11 = -[BWBravoStreamSelector _focusIsStable:](a1, v6);
  uint64_t v12 = -[BWBravoStreamSelector _focusIsStable:](a1, v7);
  unsigned int v13 = -[BWBravoStreamSelector _focusIsStable:](a1, v8);
  uint64_t v14 = *(void *)(a1 + 152);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 8);
  if (v14 == v15)
  {
    if (v16 == a2)
    {
      return v12 & v11;
    }
    else if (*(void *)(a1 + 16) == a2)
    {
      return v10 & v13 & v12;
    }
    else if (v14 == a2)
    {
      return v11;
    }
    else
    {
      return 0;
    }
  }
  else if (v14 == v16)
  {
    if (*(void *)(a1 + 16) == a2)
    {
      return v9 & v10 & v12 & v13;
    }
    else if (v15 != a2)
    {
      if (v14 == a2) {
        return v12;
      }
      else {
        return 0;
      }
    }
  }
  else if (v16 == a2)
  {
    return v12;
  }
  else if (v15 != a2)
  {
    if (*(void *)(a1 + 16) == a2) {
      int v17 = v10;
    }
    else {
      int v17 = 0;
    }
    return v17 & v13;
  }
  return v11;
}

- (BWFigVideoCaptureStream)slaveStreamBlockingFocusAndExposureStability
{
  return self->_slaveStreamBlockingFocusAndExposureStability;
}

- (uint64_t)_updateSuperWideFocusIsStableOnceWithFrameStatisticsByPortType:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (!*(unsigned char *)(result + 420))
    {
      v3 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(result + 24), "portType"));
      uint64_t v4 = v3;
      if (!*(unsigned char *)(v2 + 412))
      {
        if (v3)
        {
          [v3 pts];
          if ((v15 & 0x100000000) != 0)
          {
            float v6 = (_OWORD *)(v2 + 384);
            if (*(unsigned char *)(v2 + 396))
            {
              int v8 = *(_DWORD *)(v2 + 408);
              if (v8 != [v4 logicalFocusLensPosition]
                || (HostTimeClock = CMClockGetHostTimeClock(),
                    CMClockGetTime(&lhs, HostTimeClock),
                    *(_OWORD *)&rhs.value = *v6,
                    rhs.epoch = *(void *)(v2 + 400),
                    CMTimeSubtract(&time1, &lhs, &rhs),
                    CMTimeMake(&time2, *(unsigned int *)(v2 + 416), 1000),
                    CMTimeCompare(&time1, &time2) >= 1))
              {
                *(unsigned char *)(v2 + 412) = 1;
              }
            }
            else
            {
              v7 = CMClockGetHostTimeClock();
              CMClockGetTime(&rhs, v7);
              *float v6 = *(_OWORD *)&rhs.value;
              *(void *)(v2 + 400) = rhs.epoch;
            }
          }
        }
        else
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 0;
        }
      }
      result = [v4 logicalFocusLensPosition];
      *(_DWORD *)(v2 + 408) = result;
      char v5 = *(unsigned char *)(v2 + 412);
      if (v5)
      {
        result = [v4 afStationaryCount];
        char v5 = (int)result > 1;
      }
      *(unsigned char *)(v2 + 420) = v5;
    }
  }
  return result;
}

- (float)wideToSuperWideFocusDistance
{
  return self->_wideToSuperWideFocusDistance;
}

- (float)superWideToWideFocusDistance
{
  return self->_superWideToWideFocusDistance;
}

- (BOOL)superWideAutoSwitchingSupported
{
  return self->_wideToSuperWideFocusDistance != 0.0;
}

- (BWBravoStreamSelector)initWithStreamSelectionAttributes:(id)a3 wideStream:(id)a4 teleStream:(id)a5 superWideStream:(id)a6 cameraCalibrationValid:(BOOL)a7
{
  v45.receiver = self;
  v45.super_class = (Class)BWBravoStreamSelector;
  uint64_t v11 = [(BWBravoStreamSelector *)&v45 init];
  if (v11)
  {
    *((void *)v11 + 1) = a4;
    *((void *)v11 + 2) = a5;
    *((void *)v11 + 3) = a6;
    *(_OWORD *)(v11 + 168) = xmmword_1A5EFD500;
    *(_OWORD *)(v11 + 184) = *(_OWORD *)(v11 + 168);
    *((_DWORD *)v11 + 50) = 0;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"minFocusDistanceChange"), "floatValue");
    *((_DWORD *)v11 + 88) = v12;
    unsigned int v13 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (a4 && a5)
    {
      objc_msgSend(v13, "addObject:", objc_msgSend(a4, "portType"));
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"wideToTeleFocusDistance"), "floatValue");
      *((_DWORD *)v11 + 15) = v14;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"teleToWideFocusDistance"), "floatValue");
      *((_DWORD *)v11 + 14) = v15;
      uint64_t v16 = (void *)[a5 stream];
      objc_msgSend((id)objc_msgSend(v16, "getPropertyIfSupported:error:", *MEMORY[0x1E4F54AE0], 0), "floatValue");
      float v18 = v17;
      v19 = (void *)[a5 stream];
      objc_msgSend((id)objc_msgSend(v19, "getPropertyIfSupported:error:", *MEMORY[0x1E4F54AD8], 0), "floatValue");
      if (v18 > v20) {
        float v20 = v18;
      }
      float v21 = v20 * 1.1;
      if (v21 > 0.0)
      {
        *((float *)v11 + 14) = v21 - (float)(*((float *)v11 + 15) - *((float *)v11 + 14));
        *((float *)v11 + 15) = v21;
      }
    }
    int v22 = [a6 hasFocus];
    if (a4 && v22)
    {
      objc_msgSend(v13, "addObject:", objc_msgSend(a6, "portType"));
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"superWideMaximumAETargetOffset"), "floatValue");
      *((_DWORD *)v11 + 21) = v23;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"superWideMaximumAETargetOffsetHysteresisLag"), "floatValue");
      *((_DWORD *)v11 + 22) = v24;
      *((_DWORD *)v11 + 24) = 10;
      v11[100] = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"superWideAllowedInAutoFlashScenes"), "BOOLValue");
      v25 = (void *)[a4 stream];
      objc_msgSend((id)objc_msgSend(v25, "getPropertyIfSupported:error:", *MEMORY[0x1E4F54AE0], 0), "floatValue");
      float v27 = v26;
      v28 = (void *)[a4 stream];
      objc_msgSend((id)objc_msgSend(v28, "getPropertyIfSupported:error:", *MEMORY[0x1E4F54AD8], 0), "floatValue");
      if (v27 > v29) {
        float v29 = v27;
      }
      float v30 = v29 * 1.1;
      if (v30 == 0.0) {
        float v30 = 12.0;
      }
      *((float *)v11 + 19) = v30;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"superWideToWideHysteresisLag"), "floatValue");
      *((float *)v11 + 20) = v31 + *((float *)v11 + 19);
      v11[380] = 1;
      *((_DWORD *)v11 + 104) = 1000;
    }
    *((void *)v11 + 40) = [v13 copy];
    *((void *)v11 + 41) = [v13 copy];
    *((_DWORD *)v11 + 78) = 0;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"gainHysteresisLag"), "floatValue");
    *((_DWORD *)v11 + 9) = v32;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"minLuxLevelChange"), "floatValue");
    *((_DWORD *)v11 + 84) = v33;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"maxLuxLevelForSceneChangeMonitoring"), "floatValue");
    *((_DWORD *)v11 + 85) = v34;
    *((_DWORD *)v11 + 16) = 2;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"minTeleToWideEITThresholdPercentage"), "floatValue");
    *((_DWORD *)v11 + 12) = v35;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"maxTeleToWideEITThresholdPercentage"), "floatValue");
    *((float *)v11 + 13) = v36;
    BOOL v37 = v36 > 0.0 && *((float *)v11 + 12) > 0.0;
    v11[40] = v37;
    *((_DWORD *)v11 + 17) = 2;
    v11[72] = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"teleSwitchBasedOnExposureAndFocusTargetOffsetEnabled"), "BOOLValue");
    *((void *)v11 + 53) = 0x3FB333333F4CCCCDLL;
    v38 = (void *)[a3 objectForKeyedSubscript:@"digitalFlash"];
    objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", @"minTeleToWideEITThreshold"), "doubleValue");
    *((void *)v11 + 13) = v39;
    objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", @"maxTeleToWideEITThreshold"), "doubleValue");
    *((void *)v11 + 14) = v40;
    objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", @"minTeleToWideEITThresholdWithHumansPresent"), "doubleValue");
    *((void *)v11 + 15) = v41;
    objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", @"maxTeleToWideEITThresholdWithHumansPresent"), "doubleValue");
    *((void *)v11 + 16) = v42;
    *((_DWORD *)v11 + 34) = 2;
    objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", @"minEITPercentageChange"), "doubleValue");
    *((void *)v11 + 43) = v43;
    v11[140] = 0;
    v11[248] = 0;
    v11[141] = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"autoFocusRecommendedMasterPortTypeEnabled"), "BOOLValue");
    v11[142] = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"autoFocusRecommendedMasterPortTypeEnabled"), "BOOLValue");
    *((_DWORD *)v11 + 36) = 2;
  }
  return (BWBravoStreamSelector *)v11;
}

- (uint64_t)_updateStateWithFrameStatisticsByPortType:(void *)a3 detectedObjects:
{
  if (result)
  {
    uint64_t v4 = result;
    result = *(void *)(result + 16);
    if (result)
    {
      char v5 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend((id)result, "portType"));
      [v5 gain];
      if (v6 >= *(float *)(v4 + 32)) {
        int v7 = *(_DWORD *)(v4 + 300) + 1;
      }
      else {
        int v7 = 0;
      }
      *(_DWORD *)(v4 + 300) = v7;
      result = [v5 aeLimitsReached];
      if ((result & 1) != 0
        || (result = [v5 eit], v8 >= (float)((float)(*(float *)(v4 + 44) * *(float *)(v4 + 52)) / 100.0)))
      {
        ++*(_DWORD *)(v4 + 304);
        if (!a3)
        {
LABEL_14:
          *(_DWORD *)(v4 + 308) = 0;
          return result;
        }
LABEL_12:
        int v9 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F538C8]];
        uint64_t v10 = *MEMORY[0x1E4F538F8];
        int v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F538F8]), "count");
        result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F538C0]), "objectForKeyedSubscript:", v10), "count");
        if ((int)result + v11 >= 1)
        {
          ++*(_DWORD *)(v4 + 308);
          return result;
        }
        goto LABEL_14;
      }
      *(_DWORD *)(v4 + 304) = 0;
    }
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  return result;
}

- (void)_preferredMasterStreamForFrameStatisticsByPortType:(char)a3 zoomFactor:(int)a4 isAutoFlashScene:(void *)a5 digitalFlashMode:(int)a6 debugOverlayInfo:(unsigned char *)a7 ignoreEligibleFallbackPortTypes:(int *)a8 requiresFocusExposeStabilityOut:(float)a9 selectionReasonOut:
{
  if (!a1) {
    return 0;
  }
  uint64_t v14 = 152;
  if (a6) {
    uint64_t v14 = 240;
  }
  int v15 = *(void **)(a1 + v14);
  uint64_t v16 = (void *)[(id)a1 eligibleFallbackPortTypes];
  float v17 = v16;
  if (a6) {
    float v17 = *(void **)(a1 + 328);
  }
  float v18 = (void *)[MEMORY[0x1E4F1CA48] array];
  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    [v19 baseZoomFactor];
    if (v20 <= a9) {
      [v18 addObject:*(void *)(a1 + 16)];
    }
  }
  float v21 = *(void **)(a1 + 8);
  if (v21)
  {
    [v21 baseZoomFactor];
    if (v22 <= a9
      && (![v18 count]
       || objc_msgSend(v17, "containsObject:", objc_msgSend(*(id *)(a1 + 8), "portType"))))
    {
      [v18 addObject:*(void *)(a1 + 8)];
    }
  }
  int v23 = *(void **)(a1 + 24);
  if (v23)
  {
    [v23 baseZoomFactor];
    if (v24 <= a9
      && (![v18 count]
       || objc_msgSend(v17, "containsObject:", objc_msgSend(*(id *)(a1 + 24), "portType"))))
    {
      [v18 addObject:*(void *)(a1 + 24)];
    }
  }
  int v25 = [v18 containsObject:v15];
  float v26 = v15;
  if (![v18 count]) {
    goto LABEL_100;
  }
  if ((unint64_t)[v18 count] > 1)
  {
    if (v25 && *(void *)(a1 + 168) == 2)
    {
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __221__BWBravoStreamSelector__preferredMasterStreamForFrameStatisticsByPortType_zoomFactor_isAutoFlashScene_digitalFlashMode_debugOverlayInfo_ignoreEligibleFallbackPortTypes_requiresFocusExposeStabilityOut_selectionReasonOut___block_invoke;
      v94[3] = &unk_1E5C24918;
      v94[4] = v15;
      v94[5] = a1;
      v94[6] = a5;
      objc_msgSend(v18, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v94));
    }
    if (!*(void *)(a1 + 16) || !objc_msgSend(v18, "containsObject:")) {
      goto LABEL_69;
    }
    float v27 = *(void **)(a1 + 16);
    if (v15 == v27)
    {
      if (-[BWBravoStreamSelector _telephotoLimitsReachedForFrameStatisticsByPortType:debugOverlayInfo:](a1, a2)) {
        goto LABEL_69;
      }
LABEL_52:
      float v26 = *(void **)(a1 + 16);
      if (!a4) {
        goto LABEL_100;
      }
      v46 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 16), "portType"));
      [v46 eit];
      if (*(unsigned char *)(a1 + 140))
      {
        double v48 = 1.0;
        if ([v46 aeTarget] && objc_msgSend(v46, "aeAverage"))
        {
          double v49 = (double)[v46 aeTarget];
          double v48 = v49 / (double)[v46 aeAverage];
        }
        [v46 eit];
        double v51 = v48 * v50;
        [v46 exposureBias];
        double v47 = v51 / exp2(v52);
      }
      uint64_t v53 = 112;
      if (a4 == 1) {
        uint64_t v53 = 104;
      }
      double v54 = *(double *)(a1 + v53);
      uint64_t v55 = 128;
      if (a4 == 1) {
        uint64_t v55 = 120;
      }
      BOOL v56 = v47 < *(double *)(a1 + v55) || *(_DWORD *)(a1 + 308) <= *(_DWORD *)(a1 + 136);
      if (v47 < v54 && v56)
      {
        float v26 = *(void **)(a1 + 16);
        if (!a7) {
          goto LABEL_102;
        }
        goto LABEL_101;
      }
LABEL_69:
      if (!*(void *)(a1 + 8) || !objc_msgSend(v18, "containsObject:"))
      {
LABEL_95:
        float v26 = v15;
        if (*(void *)(a1 + 24))
        {
          float v26 = v15;
          if (objc_msgSend(v18, "containsObject:"))
          {
            float v26 = *(void **)(a1 + 24);
            if (!a7) {
              goto LABEL_102;
            }
LABEL_101:
            *a7 = v25;
            goto LABEL_102;
          }
        }
LABEL_100:
        if (!a7) {
          goto LABEL_102;
        }
        goto LABEL_101;
      }
      if ((objc_msgSend(v17, "containsObject:", objc_msgSend(*(id *)(a1 + 24), "portType")) & 1) == 0)
      {
LABEL_99:
        float v26 = *(void **)(a1 + 8);
        goto LABEL_100;
      }
      float v57 = *(float *)(a1 + 76);
      float v58 = *(float *)(a1 + 84) / *(float *)(a1 + 88);
      if (v15 == *(void **)(a1 + 24)
        && objc_msgSend(v16, "containsObject:", objc_msgSend(v15, "portType")))
      {
        float v57 = *(float *)(a1 + 80);
        float v58 = *(float *)(a1 + 84);
      }
      v59 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 24), "portType"));
      v60 = v59;
      if (*(unsigned char *)(a1 + 142))
      {
        v61 = (void *)[v59 afRecommendedMasterPortType];
        char v62 = [v61 isEqualToString:*MEMORY[0x1E4F52DE8]];
      }
      else
      {
        objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 8), "portType")), "focusDistance");
        float v64 = v63;
        [v60 focusDistance];
        char v62 = v65 > 0.0 && (v64 < v57 || v65 < v57);
      }
      char v66 = a3 ^ 1;
      if (a4) {
        char v66 = 0;
      }
      if ((v66 & 1) == 0 && *(unsigned char *)(a1 + 100))
      {
        v67 = a8;
        *(_DWORD *)(a1 + 92) = 0;
        BOOL v68 = 1;
        goto LABEL_94;
      }
      char v93 = v62;
      float v69 = (float)[v60 aeTarget];
      float v71 = v69 / (float)[v60 aeAverage];
      v67 = a8;
      if (v71 <= v58)
      {
        *(_DWORD *)(a1 + 92) = 0;
        BOOL v68 = 1;
        v72 = a5;
        if (!a5)
        {
LABEL_93:
          char v62 = v93;
LABEL_94:
          char v74 = v62 & v68;
          a8 = v67;
          if (v74) {
            goto LABEL_95;
          }
          goto LABEL_99;
        }
      }
      else
      {
        v72 = a5;
        if (v15 == *(void **)(a1 + 24))
        {
          int v85 = *(_DWORD *)(a1 + 92);
          int v86 = *(_DWORD *)(a1 + 96);
          *(_DWORD *)(a1 + 92) = v85 + 1;
          BOOL v68 = v85 < v86;
          if (!a5) {
            goto LABEL_93;
          }
        }
        else
        {
          BOOL v68 = 0;
          *(_DWORD *)(a1 + 92) = 0;
          if (!a5) {
            goto LABEL_93;
          }
        }
      }
      *(float *)&double v70 = v58;
      objc_msgSend(v72, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v70), @"SuperWideAERatioThreshold");
      *(float *)&double v73 = v71;
      objc_msgSend(v72, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v73), @"SuperWideAERatio");
      goto LABEL_93;
    }
    v87 = a8;
    v28 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(v27, "portType"));
    float v29 = v28;
    float v30 = *(float *)(a1 + 36);
    if (v30 == 0.0) {
      float v31 = 3.4028e38;
    }
    else {
      float v31 = *(float *)(a1 + 32) / v30;
    }
    [v28 gain];
    float v33 = v32;
    float v34 = *(float *)(a1 + 48);
    v88 = a7;
    if (v34 == 0.0) {
      float v35 = 3.4028e38;
    }
    else {
      float v35 = (float)(v34 * *(float *)(a1 + 44)) / 100.0;
    }
    [v29 eit];
    double v37 = v36;
    int v38 = -[BWBravoStreamSelector _exposureAllowsSwitchToRecommendedMasterStream:frameStatisticsByPortType:](a1, *(void *)(a1 + 16), a2);
    if (*(unsigned char *)(a1 + 141))
    {
      uint64_t v39 = (void *)[v29 afRecommendedMasterPortType];
      int v40 = [v39 isEqualToString:*MEMORY[0x1E4F52DF0]];
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 8), "portType")), "focusDistance");
      if (v41 > 0.0)
      {
        a8 = v87;
        if (v41 >= *(float *)(a1 + 60))
        {
          if (objc_msgSend(v17, "containsObject:", objc_msgSend(*(id *)(a1 + 24), "portType")))
          {
            objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 24), "portType")), "focusDistance");
            int v40 = v84 >= *(float *)(a1 + 76);
          }
          else
          {
            int v40 = 1;
          }
        }
        else
        {
          int v40 = 0;
        }
LABEL_42:
        if (*(unsigned char *)(a1 + 40))
        {
          if (v37 < v35) {
            char v42 = v40;
          }
          else {
            char v42 = 0;
          }
          char v43 = v42 & v38;
          a7 = v88;
          if ((v43 & 1) == 0) {
            goto LABEL_69;
          }
        }
        else
        {
          if (v33 < v31) {
            int v44 = v40;
          }
          else {
            int v44 = 0;
          }
          int v45 = v44 & v38;
          a7 = v88;
          if (v45 != 1) {
            goto LABEL_69;
          }
        }
        goto LABEL_52;
      }
      int v40 = 0;
    }
    a8 = v87;
    goto LABEL_42;
  }
  float v26 = (void *)[v18 firstObject];
  if (a7) {
    goto LABEL_101;
  }
LABEL_102:
  if (a8)
  {
    if (a6) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Cannot compute selection reason when ignoreEligibleFallbackPortTypes is YES.", 0 reason userInfo]);
    }
    if ([*(id *)(a1 + 232) isEqualToArray:v17])
    {
      int v75 = 0;
      int v76 = 0;
    }
    else
    {
      uint64_t v77 = [v26 portType];
      uint64_t v78 = [v15 portType];
      if ([v17 containsObject:v77]) {
        int v75 = [*(id *)(a1 + 232) containsObject:v77] ^ 1;
      }
      else {
        int v75 = 0;
      }
      if ([*(id *)(a1 + 232) containsObject:v78]) {
        int v76 = [v17 containsObject:v78] ^ 1;
      }
      else {
        int v76 = 0;
      }

      *(void *)(a1 + 232) = v17;
    }
    if ([*(id *)(a1 + 224) isEqualToArray:v18])
    {
      int v79 = 1;
LABEL_127:
      *a8 = v79;
      return v26;
    }
    if (*(void *)(a1 + 224) || v26 == v15)
    {
      if (v26 == (void *)[v18 firstObject]) {
        int v81 = v75;
      }
      else {
        int v81 = 1;
      }
      int v82 = v81 | v76;
      v80 = *(void **)(a1 + 224);
      if (v82 != 1)
      {
        int v79 = 0;
LABEL_126:

        *(void *)(a1 + 224) = v18;
        goto LABEL_127;
      }
    }
    else
    {
      v80 = 0;
    }
    if (((v80 != 0) & (v75 | v76)) != 0) {
      int v79 = 2;
    }
    else {
      int v79 = 1;
    }
    goto LABEL_126;
  }
  return v26;
}

- (NSArray)eligibleFallbackPortTypes
{
  p_eligibleFallbackPortTypesLock = &self->_eligibleFallbackPortTypesLock;
  os_unfair_lock_lock(&self->_eligibleFallbackPortTypesLock);
  uint64_t v4 = self->_eligibleFallbackPortTypes;
  os_unfair_lock_unlock(p_eligibleFallbackPortTypesLock);
  return v4;
}

- (id)recommendMasterStreamUsingCurrentMasterStream:(id)a3 frameStatisticsByPortType:(id)a4 zoomFactor:(float)a5 isAutoFlashScene:(BOOL)a6 digitalFlashMode:(int)a7 detectedObjects:(id)a8 cameraControlsStatisticsMasterStream:(id)a9
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  p_pendingSelectionConfigurationLock = &self->_pendingSelectionConfigurationLock;
  os_unfair_lock_lock(&self->_pendingSelectionConfigurationLock);
  self->_selectionConfiguration = self->_pendingSelectionConfiguration;
  os_unfair_lock_unlock(p_pendingSelectionConfigurationLock);
  if (self->_previousZoomFactor != a5)
  {
    self->_timeOfLastZoomFactorChange = mach_absolute_time();
    if (self->_selectionConfiguration.selectionBehavior == 2
      && (self->_selectionConfiguration.restrictedSelectionConditions & 1) == 0)
    {
      if (self->_superWideStream)
      {
        p_wideStream = &self->_wideStream;
        wideStream = self->_wideStream;
        if (wideStream != a3)
        {
          float previousZoomFactor = self->_previousZoomFactor;
          [(BWFigVideoCaptureStream *)wideStream baseZoomFactor];
          if (previousZoomFactor < v21)
          {
            [(BWFigVideoCaptureStream *)*p_wideStream baseZoomFactor];
            if (v22 <= a5) {
              goto LABEL_12;
            }
          }
        }
      }
      p_wideStream = &self->_teleStream;
      teleStream = self->_teleStream;
      if (teleStream)
      {
        if (teleStream != a3)
        {
          float v24 = self->_previousZoomFactor;
          [(BWFigVideoCaptureStream *)teleStream baseZoomFactor];
          if (v24 < v25)
          {
            [(BWFigVideoCaptureStream *)*p_wideStream baseZoomFactor];
            if (v26 <= a5)
            {
LABEL_12:
              float v27 = [(BWFigVideoCaptureStream *)*p_wideStream portType];
              self->_timeOfLastPortTypeMadeEligibleByZoom = self->_timeOfLastZoomFactorChange;
              self->_lastPortTypeMadeEligibleByZoom = v27;
            }
          }
        }
      }
    }
  }
  if (self->_superWideWaitForStableFocusOnce) {
    -[BWBravoStreamSelector _updateSuperWideFocusIsStableOnceWithFrameStatisticsByPortType:]((uint64_t)self, a4);
  }
  -[BWBravoStreamSelector _updateSceneChangeMonitorWithFrameStatisticsByPortType:fromMasterStream:zoomFactor:digitalFlashMode:debugOverlayInfo:]((uint64_t)self, a4, a3, a7, a5);
  -[BWBravoStreamSelector _updateStateWithFrameStatisticsByPortType:detectedObjects:]((uint64_t)self, a4, a8);
  self->_currentMasterStream = (BWFigVideoCaptureStream *)a3;
  int lastSelectionReason = self->_lastSelectionReason;
  if (self->_selectionConfiguration.selectionBehavior == 3) {
    goto LABEL_52;
  }
  v41[0] = 0;
  v28 = (BWFigVideoCaptureStream *)-[BWBravoStreamSelector _preferredMasterStreamForFrameStatisticsByPortType:zoomFactor:isAutoFlashScene:digitalFlashMode:debugOverlayInfo:ignoreEligibleFallbackPortTypes:requiresFocusExposeStabilityOut:selectionReasonOut:]((uint64_t)self, a4, a6, a7, 0, 0, v41, &lastSelectionReason, a5);
  unint64_t v29 = [(NSArray *)self->_eligibleFallbackPortTypes count];
  float v30 = v28;
  if (v29 < [(NSArray *)self->_supportedFallbackPortTypes count]) {
    float v30 = (BWFigVideoCaptureStream *)-[BWBravoStreamSelector _preferredMasterStreamForFrameStatisticsByPortType:zoomFactor:isAutoFlashScene:digitalFlashMode:debugOverlayInfo:ignoreEligibleFallbackPortTypes:requiresFocusExposeStabilityOut:selectionReasonOut:]((uint64_t)self, a4, a6, a7, 0, 1, 0, 0, a5);
  }
  float v31 = 0;
  if (v28 == a3 || !v41[0]) {
    goto LABEL_26;
  }
  if (v28 == self->_teleStream && !self->_sceneChangeDetected)
  {
LABEL_52:
    float v31 = 0;
    goto LABEL_40;
  }
  LOBYTE(v40) = 0;
  int v32 = -[BWBravoStreamSelector _selectionBehaviorAllowsSwitchOverTo:forFrameStatisticsByPortType:zoomFactor:blockedByExposureFocusStability:debugOverlayInfo:]((uint64_t)self, v28, a4, &v40);
  float v31 = 0;
  if ((v32 & 1) == 0
    && (_BYTE)v40
    && (float v31 = v28, v28 == self->_teleStream)
    && (float v31 = v28, a9)
    && (float v31 = v28, self->_superWideStream == a3)
    && (float v31 = v28, self->_wideStream == a9))
  {
    int v37 = -[BWBravoStreamSelector _selectionBehaviorAllowsSwitchOverTo:forFrameStatisticsByPortType:zoomFactor:blockedByExposureFocusStability:debugOverlayInfo:]((uint64_t)self, a9, a4, &v40);
    if ((_BYTE)v40) {
      int v38 = v37;
    }
    else {
      int v38 = 1;
    }
    if (v38) {
      float v31 = v28;
    }
    else {
      float v31 = (BWFigVideoCaptureStream *)a9;
    }
    v28 = (BWFigVideoCaptureStream *)a9;
    if ((v37 & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (!v32)
  {
    goto LABEL_40;
  }
LABEL_26:
  if (v28 != self->_recommendedMasterStream)
  {
    if (dword_1E96B69C8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    self->_timeOfLastZoomFactorChange = 0;
    self->_timeOfLastFocusModeChange = 0;
    self->_timeOfLastExposureModeChange = 0;
    self->_recommendedMasterStream = v28;
LABEL_35:
    self->_int lastSelectionReason = lastSelectionReason;
    goto LABEL_36;
  }
  if (lastSelectionReason == 1
    && !self->_lastSelectionReason
    && v28 != [(NSArray *)self->_lastPotentialMasterStreams firstObject])
  {
    if (dword_1E96B69C8)
    {
      float v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_35;
  }
LABEL_36:
  if (v30 != self->_preferredMasterStreamIgnoringEligibleFallbackPortTypes)
  {
    if (dword_1E96B69C8)
    {
      float v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    self->_preferredMasterStreamIgnoringEligibleFallbackPortTypes = v30;
  }
LABEL_40:
  self->_float previousZoomFactor = a5;
  self->_slaveStreamBlockingFocusAndExposureStability = v31;
  return self->_recommendedMasterStream;
}

- (uint64_t)_updateSceneChangeMonitorWithFrameStatisticsByPortType:(uint64_t)result fromMasterStream:(void *)a2 zoomFactor:(void *)a3 digitalFlashMode:(int)a4 debugOverlayInfo:(float)a5
{
  if (!result) {
    return result;
  }
  uint64_t v8 = result;
  int v9 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(a3, "portType"));
  int v10 = [v9 luxLevel];
  [v9 eit];
  double v12 = v11;
  result = [v9 focusDistance];
  float v14 = v13;
  if (*(void **)(v8 + 8) == a3 && *(void *)(v8 + 152) == *(void *)(v8 + 16)) {
    *(unsigned char *)(v8 + 356) = 1;
  }
  if (*(unsigned char *)(v8 + 356))
  {
    if (*(float *)(v8 + 252) == a5)
    {
      float v16 = *(float *)(v8 + 340);
      BOOL v15 = v16 > 0.0 && v16 < (float)v10;
    }
    else
    {
      BOOL v15 = 1;
    }
    *(unsigned char *)(v8 + 357) = v15;
    *(_DWORD *)(v8 + 360) = v10;
    *(double *)(v8 + 368) = v12;
    *(float *)(v8 + 376) = v14;
    *(unsigned char *)(v8 + 356) = 0;
    return result;
  }
  if (*(unsigned char *)(v8 + 357)) {
    return result;
  }
  if (*(void **)(v8 + 152) != a3)
  {
    *(_DWORD *)(v8 + 360) = v10;
    *(double *)(v8 + 368) = v12;
    *(float *)(v8 + 376) = v13;
    return result;
  }
  if (*(float *)(v8 + 252) != a5)
  {
LABEL_17:
    *(unsigned char *)(v8 + 357) = 1;
    return result;
  }
  if ((int)[v9 afStationaryCount] >= 2) {
    *(unsigned char *)(v8 + 357) = vabds_f32(*(float *)(v8 + 376), v14) > *(float *)(v8 + 352);
  }
  result = [v9 aeStable];
  if (!*(unsigned char *)(v8 + 357) && result)
  {
    int v17 = *(_DWORD *)(v8 + 360);
    float v18 = *(float *)(v8 + 336);
    if (v10 >= v17)
    {
      float v19 = (float)v10;
      if ((float)(v18 * (float)v17) < (float)v10) {
        goto LABEL_17;
      }
      float v20 = *(float *)(v8 + 340);
      if (v20 <= 0.0)
      {
        BOOL v21 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      float v19 = (float)v17;
      float v20 = v18 * (float)v10;
    }
    BOOL v21 = v20 < v19;
LABEL_25:
    *(unsigned char *)(v8 + 357) = v21;
    if (!a4
      || v21
      || fabs((*(double *)(v8 + 368) - v12) / ((v12 + *(double *)(v8 + 368)) * 0.5)) < *(double *)(v8 + 344))
    {
      return result;
    }
    goto LABEL_17;
  }
  return result;
}

- (uint64_t)_selectionBehaviorAllowsSwitchOverTo:(void *)a3 forFrameStatisticsByPortType:(unsigned char *)a4 zoomFactor:blockedByExposureFocusStability:debugOverlayInfo:
{
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  int v8 = -[BWBravoStreamSelector _exposureAndFocusStableForSwitchOverTo:forFrameStatisticsByPortType:debugOverlayInfo:](result, (uint64_t)a2, a3);
  int v9 = -[BWBravoStreamSelector _exposureAllowsSwitchToRecommendedMasterStream:frameStatisticsByPortType:](v7, (uint64_t)a2, a3);
  BOOL v10 = v9
     && *(void **)(v7 + 16) == a2
     && *(unsigned char *)(v7 + 72)
     && (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(a2, "portType")), "filteredLogicalFocusLensPositionStep") < 4;
  uint64_t v11 = *(void *)(v7 + 168);
  if (v11 != 2)
  {
    if (v11 == 1)
    {
      mach_absolute_time();
      uint64_t v12 = FigHostTimeToNanoseconds();
      if (*(uint64_t *)(v7 + 256) > 0 && v12 < 200000000) {
        int v14 = v9;
      }
      else {
        int v14 = 0;
      }
      result = v14 | v8 | v10;
      char v15 = (v14 | v8 | v10) ^ 1;
      if (!a4) {
        return result;
      }
    }
    else
    {
      char v15 = 0;
      result = 0;
      if (!a4) {
        return result;
      }
    }
LABEL_23:
    *a4 = v15;
    return result;
  }
  BOOL v16 = -[BWBravoStreamSelector _conditionsAllowSwitchToRecommendedMasterStream:debugOverlayInfo:](v7, a2);
  int v17 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(a2, "portType"));
  if ([a2 hasFocus]) {
    int v18 = -[BWBravoStreamSelector _focusIsStable:](v7, v17);
  }
  else {
    int v18 = 1;
  }
  result = v9 & v16 & v18;
  char v15 = v16 & (result ^ 1);
  *(unsigned char *)(v7 + 296) = v15;
  if (a4) {
    goto LABEL_23;
  }
  return result;
}

- (void)setTeleMaxAEGain:(float)a3
{
  if (self->_teleMaxAEGain < a3) {
    self->_sceneChangeDetected = 1;
  }
  self->_teleMaxAEGain = a3;
}

- (void)resetWithZoomFactor:(float)a3 currentMasterStream:(id)a4
{
  self->_currentMasterStream = (BWFigVideoCaptureStream *)a4;
  self->_recommendedMasterStream = (BWFigVideoCaptureStream *)a4;
  self->_preferredMasterStreamIgnoringEligibleFallbackPortTypes = (BWFigVideoCaptureStream *)a4;
  self->_float previousZoomFactor = a3;
  self->_timeOfLastZoomFactorChange = 0;
  self->_resetSceneChangeMonitoring = 0;
  *(void *)&self->_teleMaxGainReachedCounter = 0;
  self->_timeOfLastFocusModeChange = 0;
  self->_timeOfLastExposureModeChange = 0;
  self->_waitingForSlaveFocusAfterZoomChange = 0;
  teleStream = self->_teleStream;
  if (teleStream && ([(BWFigVideoCaptureStream *)teleStream baseZoomFactor], v7 <= a3)
    || self->_superWideStream
    && ([(BWFigVideoCaptureStream *)self->_wideStream baseZoomFactor], v8 <= a3))
  {
    self->_sceneChangeDetected = 1;
  }
}

- ($06E035DAA80D7DA92D7AC3530BEA5F2A)selectionConfiguration
{
  p_pendingSelectionConfigurationLock = &self->_pendingSelectionConfigurationLock;
  os_unfair_lock_lock(&self->_pendingSelectionConfigurationLock);
  int64_t selectionBehavior = self->_pendingSelectionConfiguration.selectionBehavior;
  unint64_t restrictedSelectionConditions = self->_pendingSelectionConfiguration.restrictedSelectionConditions;
  os_unfair_lock_unlock(p_pendingSelectionConfigurationLock);
  int64_t v6 = selectionBehavior;
  unint64_t v7 = restrictedSelectionConditions;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (BWFigVideoCaptureStream)preferredMasterStreamIgnoringEligibleFallbackPortTypes
{
  return self->_preferredMasterStreamIgnoringEligibleFallbackPortTypes;
}

- (int)lastSelectionReason
{
  return self->_lastSelectionReason;
}

- (uint64_t)_focusIsStable:(uint64_t)a1
{
  uint64_t result = 0;
  if (!a1 || !a2) {
    return result;
  }
  if ([a2 afStatus] != 4)
  {
    if (([a2 logicalFocusLensPositionStep] & 0x80000000) != 0)
    {
      unsigned int v5 = [a2 focusPositionStep];
      if ((v5 & 0x80000000) != 0)
      {
LABEL_9:
        [a2 focusingMethod];
        uint64_t result = FigCaptureStreamFocusingMethodIsPhaseDetectionBased();
        if (!result) {
          return result;
        }
        if ((objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 24), "portType")) & 1) == 0&& (!*(unsigned char *)(a1 + 248) || objc_msgSend(a2, "afStatus") != 3))
        {
          return 0;
        }
        return !objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 24), "portType"))|| !*(unsigned char *)(a1 + 380)|| *(unsigned char *)(a1 + 420) != 0;
      }
    }
    else
    {
      unsigned int v5 = [a2 logicalFocusLensPositionStep];
      if ((v5 & 0x80000000) != 0) {
        goto LABEL_9;
      }
    }
    if (v5 >= *(_DWORD *)(a1 + 144)) {
      goto LABEL_9;
    }
  }
  return !objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 24), "portType"))|| !*(unsigned char *)(a1 + 380)|| *(unsigned char *)(a1 + 420) != 0;
}

- (void)setEligibleFallbackPortTypes:(id)a3
{
  p_eligibleFallbackPortTypesLock = &self->_eligibleFallbackPortTypesLock;
  os_unfair_lock_lock(&self->_eligibleFallbackPortTypesLock);

  self->_eligibleFallbackPortTypes = (NSArray *)[a3 copy];
  os_unfair_lock_unlock(p_eligibleFallbackPortTypesLock);
}

- (void)focusModeDidChange
{
  self->_timeOfLastFocusModeChange = mach_absolute_time();
}

- (void)exposureModeDidChange
{
  self->_timeOfLastExposureModeChange = mach_absolute_time();
}

- (void)setTeleMaxEIT:(float)a3
{
  if (self->_teleMaxEIT < a3) {
    self->_sceneChangeDetected = 1;
  }
  self->_teleMaxEIT = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWBravoStreamSelector;
  [(BWBravoStreamSelector *)&v3 dealloc];
}

- (float)teleMaxAEGain
{
  return self->_teleMaxAEGain;
}

- (float)teleMaxEIT
{
  return self->_teleMaxEIT;
}

- (void)setSelectionConfiguration:(id)a3
{
  int64_t selectionBehavior = self->_pendingSelectionConfiguration.selectionBehavior;
  if (a3.var0 != selectionBehavior)
  {
    self->_waitingForSlaveFocusAfterZoomChange = 0;
LABEL_5:
    if (a3.var0 != 2)
    {
LABEL_18:
      self->_pendingSelectionConfiguration = ($30301DB2717890DD193FABC42FD37CDA)a3;
      return;
    }
    if (selectionBehavior == 2)
    {
      unint64_t restrictedSelectionConditions = self->_pendingSelectionConfiguration.restrictedSelectionConditions;
      if ((a3.var1 & 2) == 0)
      {
LABEL_12:
        if ((a3.var1 & 4) != 0 && (restrictedSelectionConditions & 4) == 0) {
          self->_timeOfLastExposureModeChange = 0;
        }
        if ((a3.var1 & 1) != 0 && (restrictedSelectionConditions & 1) == 0) {
          self->_timeOfLastZoomFactorChange = 0;
        }
        goto LABEL_18;
      }
    }
    else
    {
      LOBYTE(restrictedSelectionConditions) = 0;
      if ((a3.var1 & 2) == 0) {
        goto LABEL_12;
      }
    }
    if ((restrictedSelectionConditions & 2) == 0) {
      self->_timeOfLastFocusModeChange = 0;
    }
    goto LABEL_12;
  }
  if (a3.var1 != self->_pendingSelectionConfiguration.restrictedSelectionConditions) {
    goto LABEL_5;
  }
}

- (id)preferredMasterPortTypeForFrameStatisticsByPortType:(id)a3 zoomFactor:(float)a4
{
  uint64_t v4 = -[BWBravoStreamSelector _preferredMasterStreamForFrameStatisticsByPortType:zoomFactor:isAutoFlashScene:digitalFlashMode:debugOverlayInfo:ignoreEligibleFallbackPortTypes:requiresFocusExposeStabilityOut:selectionReasonOut:]((uint64_t)self, a3, 0, 0, 0, 1, 0, 0, a4);
  return (id)[v4 portType];
}

BOOL __221__BWBravoStreamSelector__preferredMasterStreamForFrameStatisticsByPortType_zoomFactor_isAutoFlashScene_digitalFlashMode_debugOverlayInfo_ignoreEligibleFallbackPortTypes_requiresFocusExposeStabilityOut_selectionReasonOut___block_invoke(uint64_t a1, void *a2)
{
  return *(void **)(a1 + 32) == a2
      || -[BWBravoStreamSelector _conditionsAllowSwitchToRecommendedMasterStream:debugOverlayInfo:](*(void *)(a1 + 40), a2);
}

- (BOOL)_conditionsAllowSwitchToRecommendedMasterStream:(BOOL)result debugOverlayInfo:(void *)a2
{
  if (result)
  {
    uint64_t v3 = result;
    mach_absolute_time();
    if (*(unsigned char *)(v3 + 176))
    {
      uint64_t v4 = FigHostTimeToNanoseconds();
      if (*(uint64_t *)(v3 + 256) >= 1 && v4 < 1000000000) {
        return 1;
      }
    }
    else if (*(void *)(v3 + 272))
    {
      if (FigHostTimeToNanoseconds() <= 999999999)
      {
        if (objc_msgSend(*(id *)(v3 + 272), "isEqualToString:", objc_msgSend(a2, "portType"))) {
          return 1;
        }
      }
      else
      {
        *(void *)(v3 + 264) = 0;
        *(void *)(v3 + 272) = 0;
      }
    }
    uint64_t v6 = *(void *)(v3 + 176);
    if ((v6 & 2) != 0)
    {
      uint64_t v7 = FigHostTimeToNanoseconds();
      if (*(uint64_t *)(v3 + 280) >= 1 && v7 < 4000000000) {
        return 1;
      }
      uint64_t v6 = *(void *)(v3 + 176);
    }
    if ((v6 & 4) != 0)
    {
      uint64_t v8 = FigHostTimeToNanoseconds();
      return *(uint64_t *)(v3 + 288) > 0 && v8 < 1000000000;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_telephotoLimitsReachedForFrameStatisticsByPortType:(uint64_t)result debugOverlayInfo:(void *)a2
{
  if (result)
  {
    uint64_t v2 = result;
    int v3 = *(_DWORD *)(result + 300);
    int v4 = *(_DWORD *)(result + 304);
    int v5 = *(_DWORD *)(result + 64);
    int v6 = *(_DWORD *)(result + 68);
    if (*(unsigned char *)(result + 141))
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(result + 16), "portType")), "afRecommendedMasterPortType");
      uint64_t result = [v7 isEqualToString:*MEMORY[0x1E4F52DF0]] ^ 1;
    }
    else
    {
      uint64_t v8 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(result + 8), "portType"));
      [v8 focusDistance];
      if (v9 <= 0.0)
      {
        uint64_t result = 0;
      }
      else
      {
        [v8 focusDistance];
        uint64_t result = v10 < *(float *)(v2 + 56);
      }
    }
    if (*(unsigned char *)(v2 + 40))
    {
      if (v4 <= v6) {
        return result;
      }
    }
    else if (v3 <= v5)
    {
      return result;
    }
    return 1;
  }
  return result;
}

- (BOOL)telephotoLimitsReachedForFrameStatisticsByPortType:(id)a3
{
  return -[BWBravoStreamSelector _telephotoLimitsReachedForFrameStatisticsByPortType:debugOverlayInfo:]((uint64_t)self, a3);
}

- (BWFigVideoCaptureStream)recommendedMasterStream
{
  return self->_recommendedMasterStream;
}

@end