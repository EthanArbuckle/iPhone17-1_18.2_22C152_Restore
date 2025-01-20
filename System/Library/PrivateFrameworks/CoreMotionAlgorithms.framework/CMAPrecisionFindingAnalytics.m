@interface CMAPrecisionFindingAnalytics
- (CMAPrecisionFindingAnalytics)init;
- (NSNumber)firstAcceptedRange;
- (NSNumber)maxEstimatedDeltaHeightOverSession;
- (NSNumber)maxPercentParticlesAboveHeightThreshold;
- (NSNumber)meanAcceptedFrequencyQualityDuringRevoke;
- (NSNumber)meanAcceptedRangeFrequencyThroughoutSession;
- (NSNumber)meanAcceptedRangeFrequencyWhileConverging;
- (NSNumber)meanRawRangeFrequencyDuringRevoke;
- (NSNumber)meanRawRangeFrequencyThroughoutSession;
- (NSNumber)meanRawRangeFrequencyWhileConverging;
- (NSNumber)percentOfSessionInWristDown;
- (NSNumber)percentOfSessionInWristUp;
- (NSNumber)timeFromFirstRangeToFirstAcceptedRange;
- (id)analyticsDictionary;
- (void)dealloc;
- (void)feedAcceptedRange:(CMARangeType *)a3;
- (void)feedDeviceMotion:(CMADeviceMotionType *)a3;
- (void)feedEstimatedHeight:(double)maxEstimatedHeight;
- (void)feedFractionAboveThreshold:(double)a3;
- (void)feedRange:(CMARangeType *)a3;
- (void)feedRevokeReason:(int)a3;
- (void)feedWatchOrientation:(CMAWatchOrientationStruct)a3;
- (void)setFirstAcceptedRange:(id)a3;
- (void)setMaxEstimatedDeltaHeightOverSession:(id)a3;
- (void)setMaxPercentParticlesAboveHeightThreshold:(id)a3;
- (void)setMeanAcceptedFrequencyQualityDuringRevoke:(id)a3;
- (void)setMeanAcceptedRangeFrequencyThroughoutSession:(id)a3;
- (void)setMeanAcceptedRangeFrequencyWhileConverging:(id)a3;
- (void)setMeanRawRangeFrequencyDuringRevoke:(id)a3;
- (void)setMeanRawRangeFrequencyThroughoutSession:(id)a3;
- (void)setMeanRawRangeFrequencyWhileConverging:(id)a3;
- (void)setPercentOfSessionInWristDown:(id)a3;
- (void)setPercentOfSessionInWristUp:(id)a3;
- (void)setTimeFromFirstRangeToFirstAcceptedRange:(id)a3;
@end

@implementation CMAPrecisionFindingAnalytics

- (CMAPrecisionFindingAnalytics)init
{
  v8.receiver = self;
  v8.super_class = (Class)CMAPrecisionFindingAnalytics;
  result = [(CMAPrecisionFindingAnalytics *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_timestampOfFirstRawRange = _Q0;
    *(_OWORD *)&result->_timestampOfPreviousDMSample = _Q0;
    *(_OWORD *)&result->_totalTimeDuringRevoke = 0u;
    *(_OWORD *)&result->_countWristDown = 0u;
    *(_OWORD *)&result->_countAcceptedRange = 0u;
    *(void *)((char *)&result->_countRawRangeDuringRevoke + 2) = 0;
    *(_OWORD *)&result->_minEstimatedHeight = 0u;
    *(_OWORD *)&result->_percentOfSessionInWristUp = 0u;
    *(_OWORD *)&result->_timeFromFirstRangeToFirstAcceptedRange = 0u;
    *(_OWORD *)&result->_meanRawRangeFrequencyThroughoutSession = 0u;
    *(_OWORD *)&result->_meanRawRangeFrequencyWhileConverging = 0u;
    *(_OWORD *)&result->_meanRawRangeFrequencyDuringRevoke = 0u;
    *(_OWORD *)&result->_maxEstimatedDeltaHeightOverSession = 0u;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMAPrecisionFindingAnalytics;
  [(CMAPrecisionFindingAnalytics *)&v3 dealloc];
}

- (void)feedDeviceMotion:(CMADeviceMotionType *)a3
{
  if (self->_timestampOfFirstDMSample == -1.0) {
    self->_timestampOfFirstDMSample = a3->var0;
  }
  self->_timestampOfRecentDMSample = a3->var0;
  if (self->_crown && self->_wrist)
  {
    ++self->_countDM;
    float32x4_t v5 = *(float32x4_t *)&a3->var1.var2;
    float32x4_t v30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var1.var0), (float64x2_t)v5);
    sub_227CA506C(&v30, v5);
    float v6 = sub_227CA4DCC(v30.f32);
    float v8 = v7;
    float v10 = v9 * v9;
    float v11 = sqrtf((float)(v9 * v9) + (float)(v7 * v7));
    float v12 = atan2f(v11, v6);
    if (self->_wrist == self->_crown) {
      float v12 = atan2f(v11, -v6);
    }
    float v13 = v12;
    float v17 = atan2f(sqrtf((float)(v6 * v6) + v10), v8);
    if (v13 < 1.9199 && v13 > 1.309 && v17 > 1.5708) {
      ++self->_countWristUp;
    }
    if (v13 < 1.0472) {
      ++self->_countWristDown;
    }
    int countDM = self->_countDM;
    if (countDM >= 1)
    {
      uint64_t v19 = objc_msgSend_numberWithDouble_(NSNumber, v14, v15, v16, (double)self->_countWristUp / (double)countDM * 100.0);
      objc_msgSend_setPercentOfSessionInWristUp_(self, v20, v19, v21);
      uint64_t v25 = objc_msgSend_numberWithDouble_(NSNumber, v22, v23, v24, (double)self->_countWristDown / (double)self->_countDM * 100.0);
      objc_msgSend_setPercentOfSessionInWristDown_(self, v26, v25, v27);
    }
    if (self->_wasFirstArcShown && self->_revokeReason == 2)
    {
      double timestampOfPreviousDMSample = self->_timestampOfPreviousDMSample;
      if (timestampOfPreviousDMSample > 0.0)
      {
        double v29 = a3->var0 - timestampOfPreviousDMSample;
        if (v29 > 0.0) {
          self->_totalTimeDuringRevoke = v29 + self->_totalTimeDuringRevoke;
        }
      }
    }
    self->_double timestampOfPreviousDMSample = a3->var0;
  }
}

- (void)feedRange:(CMARangeType *)a3
{
  double timestampOfFirstRawRange = self->_timestampOfFirstRawRange;
  if (timestampOfFirstRawRange == -1.0)
  {
    double timestampOfFirstRawRange = a3->timestamp;
    self->_double timestampOfFirstRawRange = a3->timestamp;
  }
  int v6 = self->_countRawRange + 1;
  self->_countRawRange = v6;
  if (self->_timestampOfFirstDMSample > 0.0)
  {
    uint64_t v7 = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, v3, (double)v6 / (self->_timestampOfRecentDMSample - timestampOfFirstRawRange));
    objc_msgSend_setMeanRawRangeFrequencyThroughoutSession_(self, v8, v7, v9);
    if (self->_wasFirstRangeAccepted && !self->_wasFirstArcShown)
    {
      int v13 = self->_countRawRangeWhileConverging + 1;
      self->_countRawRangeWhileConverging = v13;
      uint64_t v14 = objc_msgSend_numberWithDouble_(NSNumber, v10, v11, v12, (double)v13 / (self->_timestampOfRecentDMSample - self->_timestampOfFirstAcceptedRange));
      objc_msgSend_setMeanRawRangeFrequencyWhileConverging_(self, v15, v14, v16);
    }
    if (self->_wasFirstArcShown && self->_revokeReason == 2)
    {
      int v17 = self->_countRawRangeDuringRevoke + 1;
      self->_countRawRangeDuringRevoke = v17;
      double totalTimeDuringRevoke = self->_totalTimeDuringRevoke;
      if (totalTimeDuringRevoke > 0.0)
      {
        uint64_t v19 = objc_msgSend_numberWithDouble_(NSNumber, v10, v11, v12, (double)v17 / totalTimeDuringRevoke);
        MEMORY[0x270F9A6D0](self, sel_setMeanRawRangeFrequencyDuringRevoke_, v19, v20);
      }
    }
  }
}

- (void)feedWatchOrientation:(CMAWatchOrientationStruct)a3
{
  *(void *)&self->_crown = __ROR8__(*(void *)&a3.wrist, 32);
}

- (void)feedAcceptedRange:(CMARangeType *)a3
{
  if (self->_timestampOfFirstAcceptedRange == -1.0)
  {
    double timestamp = a3->timestamp;
    self->_timestampOfFirstAcceptedRange = a3->timestamp;
    uint64_t v7 = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, v3, timestamp - self->_timestampOfFirstRawRange);
    objc_msgSend_setTimeFromFirstRangeToFirstAcceptedRange_(self, v8, v7, v9);
    uint64_t v13 = objc_msgSend_numberWithDouble_(NSNumber, v10, v11, v12, a3->range);
    objc_msgSend_setFirstAcceptedRange_(self, v14, v13, v15);
    self->_wasFirstRangeAccepted = 1;
  }
  int v16 = self->_countAcceptedRange + 1;
  self->_countAcceptedRange = v16;
  if (self->_timestampOfFirstDMSample > 0.0)
  {
    uint64_t v17 = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, v3, (double)v16 / (self->_timestampOfRecentDMSample - self->_timestampOfFirstAcceptedRange));
    objc_msgSend_setMeanAcceptedRangeFrequencyThroughoutSession_(self, v18, v17, v19);
    if (self->_wasFirstRangeAccepted && !self->_wasFirstArcShown)
    {
      int v23 = self->_countAcceptedRangeWhileConverging + 1;
      self->_countAcceptedRangeWhileConverging = v23;
      uint64_t v24 = objc_msgSend_numberWithDouble_(NSNumber, v20, v21, v22, (double)v23 / (self->_timestampOfRecentDMSample - self->_timestampOfFirstAcceptedRange));
      objc_msgSend_setMeanAcceptedRangeFrequencyWhileConverging_(self, v25, v24, v26);
    }
    if (self->_wasFirstArcShown && self->_revokeReason == 2)
    {
      int v27 = self->_countAcceptedRangeDuringRevoke + 1;
      self->_countAcceptedRangeDuringRevoke = v27;
      double totalTimeDuringRevoke = self->_totalTimeDuringRevoke;
      if (totalTimeDuringRevoke > 0.0)
      {
        uint64_t v29 = objc_msgSend_numberWithDouble_(NSNumber, v20, v21, v22, (double)v27 / totalTimeDuringRevoke);
        MEMORY[0x270F9A6D0](self, sel_setMeanAcceptedFrequencyQualityDuringRevoke_, v29, v30);
      }
    }
  }
}

- (void)feedRevokeReason:(int)a3
{
  self->_revokeReason = a3;
  if (!a3) {
    self->_wasFirstArcShown = 1;
  }
}

- (void)feedEstimatedHeight:(double)maxEstimatedHeight
{
  double minEstimatedHeight = self->_minEstimatedHeight;
  if (minEstimatedHeight > maxEstimatedHeight) {
    double minEstimatedHeight = maxEstimatedHeight;
  }
  if (self->_maxEstimatedHeight >= maxEstimatedHeight) {
    maxEstimatedHeight = self->_maxEstimatedHeight;
  }
  self->_double minEstimatedHeight = minEstimatedHeight;
  self->_maxEstimatedHeight = maxEstimatedHeight;
  uint64_t v7 = objc_msgSend_numberWithDouble_(NSNumber, a2, v3, v4, vabdd_f64(maxEstimatedHeight, minEstimatedHeight));

  MEMORY[0x270F9A6D0](self, sel_setMaxEstimatedDeltaHeightOverSession_, v7, v8);
}

- (void)feedFractionAboveThreshold:(double)a3
{
  uint64_t v7 = objc_msgSend_maxPercentParticlesAboveHeightThreshold(self, a2, v3, v4);
  uint64_t v11 = NSNumber;
  if (v7)
  {
    uint64_t v12 = objc_msgSend_maxPercentParticlesAboveHeightThreshold(self, v8, v9, v10);
    objc_msgSend_doubleValue(v12, v13, v14, v15);
    if (v16 >= a3) {
      a3 = v16;
    }
  }
  uint64_t v17 = objc_msgSend_numberWithDouble_(v11, v8, v9, v10, a3);

  MEMORY[0x270F9A6D0](self, sel_setMaxPercentParticlesAboveHeightThreshold_, v17, v18);
}

- (id)analyticsDictionary
{
  float32x4_t v5 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3);
  if (objc_msgSend_percentOfSessionInWristUp(self, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend_percentOfSessionInWristUp(self, v9, v10, v11);
    objc_msgSend_setObject_forKey_(v5, v13, v12, @"PercentOfSessionInWristUp");
  }
  if (objc_msgSend_percentOfSessionInWristDown(self, v9, v10, v11))
  {
    uint64_t v17 = objc_msgSend_percentOfSessionInWristDown(self, v14, v15, v16);
    objc_msgSend_setObject_forKey_(v5, v18, v17, @"PercentOfSessionInWristDown");
  }
  if (objc_msgSend_timeFromFirstRangeToFirstAcceptedRange(self, v14, v15, v16))
  {
    uint64_t RangeToFirstAcceptedRange = objc_msgSend_timeFromFirstRangeToFirstAcceptedRange(self, v19, v20, v21);
    objc_msgSend_setObject_forKey_(v5, v23, RangeToFirstAcceptedRange, @"TimeFromFirstRangeToFirstAcceptedRange");
  }
  if (objc_msgSend_firstAcceptedRange(self, v19, v20, v21))
  {
    uint64_t AcceptedRange = objc_msgSend_firstAcceptedRange(self, v24, v25, v26);
    objc_msgSend_setObject_forKey_(v5, v28, AcceptedRange, @"FirstAcceptedRange");
  }
  if (objc_msgSend_meanRawRangeFrequencyThroughoutSession(self, v24, v25, v26))
  {
    uint64_t v32 = objc_msgSend_meanRawRangeFrequencyThroughoutSession(self, v29, v30, v31);
    objc_msgSend_setObject_forKey_(v5, v33, v32, @"MeanRawRangeFrequencyThroughoutSession");
  }
  if (objc_msgSend_meanAcceptedRangeFrequencyThroughoutSession(self, v29, v30, v31))
  {
    uint64_t v37 = objc_msgSend_meanAcceptedRangeFrequencyThroughoutSession(self, v34, v35, v36);
    objc_msgSend_setObject_forKey_(v5, v38, v37, @"MeanAcceptedRangeFrequencyThroughoutSession");
  }
  if (objc_msgSend_meanRawRangeFrequencyWhileConverging(self, v34, v35, v36))
  {
    uint64_t v42 = objc_msgSend_meanRawRangeFrequencyWhileConverging(self, v39, v40, v41);
    objc_msgSend_setObject_forKey_(v5, v43, v42, @"MeanRawRangeFrequencyWhileConverging");
  }
  if (objc_msgSend_meanAcceptedRangeFrequencyWhileConverging(self, v39, v40, v41))
  {
    uint64_t v47 = objc_msgSend_meanAcceptedRangeFrequencyWhileConverging(self, v44, v45, v46);
    objc_msgSend_setObject_forKey_(v5, v48, v47, @"MeanAcceptedRangeFrequencyWhileConverging");
  }
  if (objc_msgSend_meanRawRangeFrequencyDuringRevoke(self, v44, v45, v46))
  {
    uint64_t v52 = objc_msgSend_meanRawRangeFrequencyDuringRevoke(self, v49, v50, v51);
    objc_msgSend_setObject_forKey_(v5, v53, v52, @"MeanRawRangeFrequencyDuringRevoke");
  }
  if (objc_msgSend_meanAcceptedFrequencyQualityDuringRevoke(self, v49, v50, v51))
  {
    uint64_t v57 = objc_msgSend_meanAcceptedFrequencyQualityDuringRevoke(self, v54, v55, v56);
    objc_msgSend_setObject_forKey_(v5, v58, v57, @"MeanAcceptedFrequencyQualityDuringRevoke");
  }
  if (objc_msgSend_maxEstimatedDeltaHeightOverSession(self, v54, v55, v56))
  {
    uint64_t v62 = objc_msgSend_maxEstimatedDeltaHeightOverSession(self, v59, v60, v61);
    objc_msgSend_setObject_forKey_(v5, v63, v62, @"MaxEstimatedDeltaHeightOverSession");
  }
  if (objc_msgSend_maxPercentParticlesAboveHeightThreshold(self, v59, v60, v61))
  {
    uint64_t v67 = objc_msgSend_maxPercentParticlesAboveHeightThreshold(self, v64, v65, v66);
    objc_msgSend_setObject_forKey_(v5, v68, v67, @"MaxPercentParticlesAboveHeightThreshold");
  }
  return v5;
}

- (NSNumber)percentOfSessionInWristUp
{
  return self->_percentOfSessionInWristUp;
}

- (void)setPercentOfSessionInWristUp:(id)a3
{
}

- (NSNumber)percentOfSessionInWristDown
{
  return self->_percentOfSessionInWristDown;
}

- (void)setPercentOfSessionInWristDown:(id)a3
{
}

- (NSNumber)timeFromFirstRangeToFirstAcceptedRange
{
  return self->_timeFromFirstRangeToFirstAcceptedRange;
}

- (void)setTimeFromFirstRangeToFirstAcceptedRange:(id)a3
{
}

- (NSNumber)firstAcceptedRange
{
  return self->_firstAcceptedRange;
}

- (void)setFirstAcceptedRange:(id)a3
{
}

- (NSNumber)meanRawRangeFrequencyThroughoutSession
{
  return self->_meanRawRangeFrequencyThroughoutSession;
}

- (void)setMeanRawRangeFrequencyThroughoutSession:(id)a3
{
}

- (NSNumber)meanAcceptedRangeFrequencyThroughoutSession
{
  return self->_meanAcceptedRangeFrequencyThroughoutSession;
}

- (void)setMeanAcceptedRangeFrequencyThroughoutSession:(id)a3
{
}

- (NSNumber)meanRawRangeFrequencyWhileConverging
{
  return self->_meanRawRangeFrequencyWhileConverging;
}

- (void)setMeanRawRangeFrequencyWhileConverging:(id)a3
{
}

- (NSNumber)meanAcceptedRangeFrequencyWhileConverging
{
  return self->_meanAcceptedRangeFrequencyWhileConverging;
}

- (void)setMeanAcceptedRangeFrequencyWhileConverging:(id)a3
{
}

- (NSNumber)meanRawRangeFrequencyDuringRevoke
{
  return self->_meanRawRangeFrequencyDuringRevoke;
}

- (void)setMeanRawRangeFrequencyDuringRevoke:(id)a3
{
}

- (NSNumber)meanAcceptedFrequencyQualityDuringRevoke
{
  return self->_meanAcceptedFrequencyQualityDuringRevoke;
}

- (void)setMeanAcceptedFrequencyQualityDuringRevoke:(id)a3
{
}

- (NSNumber)maxEstimatedDeltaHeightOverSession
{
  return self->_maxEstimatedDeltaHeightOverSession;
}

- (void)setMaxEstimatedDeltaHeightOverSession:(id)a3
{
}

- (NSNumber)maxPercentParticlesAboveHeightThreshold
{
  return self->_maxPercentParticlesAboveHeightThreshold;
}

- (void)setMaxPercentParticlesAboveHeightThreshold:(id)a3
{
}

@end