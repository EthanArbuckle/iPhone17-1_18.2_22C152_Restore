@interface HalogenLdcmCalc
- (BOOL)_allocBuffers;
- (BOOL)_isClipped:(id)a3;
- (BOOL)isBoundViolation_currentGainCorrection;
- (BOOL)isBoundViolation_currentPhaseCompensation;
- (BOOL)isBoundViolation_measurementCondetSNR;
- (BOOL)isBoundViolation_voltageGainCorrection;
- (BOOL)isDigitalFilterTrigger;
- (BOOL)isLowerBoundViolation_goertzelImpedance;
- (BOOL)isLowerBoundViolation_goertzelPhase;
- (BOOL)isUpperBoundViolation_goertzelImpedance;
- (BOOL)isUpperBoundViolation_goertzelPhase;
- (HalogenLdcmCalc)initWithSize:(int)a3;
- (NSMutableData)tmp1DataBuff;
- (NSMutableData)tmp2DataBuff;
- (NSMutableData)tmp3DataBuff;
- (OpaqueFFTSetupD)fftContext;
- (double)_condetSnr:(double *)a3;
- (double)_mean:(double *)a3 ofSize:(unint64_t)a4;
- (double)_median:(double *)a3 ofSize:(unint64_t)a4;
- (double)_sineExtractor:(id)a3;
- (double)_snr:(id)a3 withGain:(double)a4 hasSignalLevel:(double *)a5 hasNoiseLevel:(double *)a6 hasCondetSnr:(double *)a7;
- (double)_stdev:(double *)a3 ofSize:(unint64_t)a4;
- (double)_variance:(double *)a3 ofSize:(unint64_t)a4;
- (double)adcGain;
- (double)calCurrentNoiseLevel;
- (double)calCurrentSNR;
- (double)calCurrentSignalLevel;
- (double)calVoltageNoiseLevel;
- (double)calVoltageSNR;
- (double)calVoltageSignalLevel;
- (double)capacitanceInNanoF;
- (double)clippingScore;
- (double)compensatedImpedance;
- (double)compensatedPhase;
- (double)currentGainCorrection;
- (double)currentPhaseCompensation;
- (double)goertzelImpedance;
- (double)goertzelPhase;
- (double)hydraImpedance;
- (double)hydraR;
- (double)ldcmAcCap;
- (double)measurementCondetSNR;
- (double)measurementCurrentNoiseLevel;
- (double)measurementCurrentSNR;
- (double)measurementCurrentSignalLevel;
- (double)measurementVoltageNoiseLevel;
- (double)measurementVoltageSNR;
- (double)measurementVoltageSignalLevel;
- (double)movesumClipThreshold;
- (double)precalCurrentNoiseLevel;
- (double)precalCurrentSNR;
- (double)precalCurrentSignalLevel;
- (double)precalVoltageNoiseLevel;
- (double)precalVoltageSNR;
- (double)precalVoltageSignalLevel;
- (double)resistanceInOhms;
- (double)sampleRate;
- (double)sanitycheckCurrentGainCorrectionLowerbound;
- (double)sanitycheckCurrentGainCorrectionUpperbound;
- (double)sanitycheckCurrentPhaseCompensationLowerbound;
- (double)sanitycheckCurrentPhaseCompensationUpperbound;
- (double)sanitycheckImpedanceLowerbound;
- (double)sanitycheckImpedanceUpperbound;
- (double)sanitycheckPhaseLowerbound;
- (double)sanitycheckPhaseUperbound;
- (double)sanitycheckVoltageGainCorrectionLowerbound;
- (double)sanitycheckVoltageGainCorrectionUpperbound;
- (double)signalFrequency;
- (double)tiaGain;
- (double)voltageGainCorrection;
- (int)clipDetectWindowSize;
- (int)diffWindowSize;
- (int)doCalibration:(id)a3 withCurrentData:(id)a4;
- (int)doLiquidDetection:(id)a3 withCurrentData:(id)a4 isReceptacleEmpty:(BOOL)a5 isReceptacleWet:(BOOL)a6 withWetTransitionThreshold:(double)a7 withDryTransitionThreshold:(double)a8;
- (int)doPreCalibration:(id)a3 withCurrentData:(id)a4;
- (int)nSamples;
- (int)sizeofSample;
- (int)tmp1DataBuffSize;
- (int)tmp2DataBuffSize;
- (int)tmp3DataBuffSize;
- (void)_applyDigitalFilter:(id)a3;
- (void)_applyFractionalPhaseShift:(id)a3 withPhaseDelay:(double)a4;
- (void)_applyGain:(double)a3 toData:(id)a4;
- (void)_applyHanningWindow:(id)a3 withSize:(int)a4;
- (void)_applyTiaGain:(id)a3 toCurrentData:(id)a4;
- (void)_doHydraComp:(double)a3 withPhase:(double)a4;
- (void)_freeBuffers;
- (void)_goertzelSecondOrder:(id)a3 hasFftValue:(double *)a4 hasPhase:(double *)a5 withHanning:(BOOL)a6;
- (void)_rcSolver;
- (void)_reconstructSignal:(id)a3;
- (void)dealloc;
- (void)setAdcGain:(double)a3;
- (void)setClipDetectWindowSize:(int)a3;
- (void)setDiffWindowSize:(int)a3;
- (void)setFftContext:(OpaqueFFTSetupD *)a3;
- (void)setHydraImpedance:(double)a3;
- (void)setHydraR:(double)a3;
- (void)setIsDigitalFilterTrigger:(BOOL)a3;
- (void)setLdcmAcCap:(double)a3;
- (void)setMovesumClipThreshold:(double)a3;
- (void)setNSamples:(int)a3;
- (void)setSampleRate:(double)a3;
- (void)setSanitycheckCurrentGainCorrectionLowerbound:(double)a3;
- (void)setSanitycheckCurrentGainCorrectionUpperbound:(double)a3;
- (void)setSanitycheckCurrentPhaseCompensationLowerbound:(double)a3;
- (void)setSanitycheckCurrentPhaseCompensationUpperbound:(double)a3;
- (void)setSanitycheckImpedanceLowerbound:(double)a3;
- (void)setSanitycheckImpedanceUpperbound:(double)a3;
- (void)setSanitycheckPhaseLowerbound:(double)a3;
- (void)setSanitycheckPhaseUperbound:(double)a3;
- (void)setSanitycheckVoltageGainCorrectionLowerbound:(double)a3;
- (void)setSanitycheckVoltageGainCorrectionUpperbound:(double)a3;
- (void)setSignalFrequency:(double)a3;
- (void)setSizeofSample:(int)a3;
- (void)setTiaGain:(double)a3;
- (void)setTmp1DataBuff:(id)a3;
- (void)setTmp1DataBuffSize:(int)a3;
- (void)setTmp2DataBuff:(id)a3;
- (void)setTmp2DataBuffSize:(int)a3;
- (void)setTmp3DataBuff:(id)a3;
- (void)setTmp3DataBuffSize:(int)a3;
@end

@implementation HalogenLdcmCalc

- (HalogenLdcmCalc)initWithSize:(int)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HalogenLdcmCalc;
  v4 = [(HalogenLdcmCalc *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_nSamples = a3;
    v4->_sizeofSample = 8;
    *(int32x2_t *)&v4->_diffWindowSize = vadd_s32(vdup_n_s32(a3), (int32x2_t)-2);
    *(_OWORD *)&v4->_sampleRate = xmmword_1D964D180;
    *(_OWORD *)&v4->_adcGain = xmmword_1D964D190;
    *(_OWORD *)&v4->_hydraImpedance = xmmword_1D964D1A0;
    *(_OWORD *)&v4->_hydraR = xmmword_1D964D1B0;
    *(_OWORD *)&v4->_sanitycheckImpedanceLowerbound = xmmword_1D964D1C0;
    *(_OWORD *)&v4->_sanitycheckPhaseLowerbound = xmmword_1D964D1D0;
    *(_OWORD *)&v4->_sanitycheckVoltageGainCorrectionLowerbound = xmmword_1D964D1E0;
    *(_OWORD *)&v4->_sanitycheckCurrentGainCorrectionLowerbound = xmmword_1D964D1E0;
    *(_OWORD *)&v4->_sanitycheckCurrentPhaseCompensationLowerbound = xmmword_1D964D1F0;
    if ([(HalogenLdcmCalc *)v4 _allocBuffers])
    {
      FFTSetupD fftsetupD = vDSP_create_fftsetupD(0xCuLL, 0);
      v5->_fftContext = fftsetupD;
      if (fftsetupD) {
        return v5;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        v8 = MEMORY[0x1E4F14500];
        v9 = "HalogenLdcmCalc:vDSP_create_fftsetupD() failed";
        goto LABEL_9;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      v8 = MEMORY[0x1E4F14500];
      v9 = "HalogenLdcmCalc:_allocBuffers() failed";
LABEL_9:
      _os_log_impl(&dword_1D9622000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  fftContext = self->_fftContext;
  if (fftContext) {
    vDSP_destroy_fftsetupD(fftContext);
  }
  [(HalogenLdcmCalc *)self _freeBuffers];
  v4.receiver = self;
  v4.super_class = (Class)HalogenLdcmCalc;
  [(HalogenLdcmCalc *)&v4 dealloc];
}

- (BOOL)_allocBuffers
{
  self->_tmp1DataBuffSize = self->_sizeofSample * self->_nSamples;
  v3 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  self->_tmp1DataBuff = v3;
  if (!v3)
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v7) {
      return result;
    }
    __int16 v15 = 0;
    v8 = MEMORY[0x1E4F14500];
    v9 = "HalogenLdcmCalc:Failed to alloc _tmp1DataBuff";
    v10 = (uint8_t *)&v15;
    goto LABEL_12;
  }
  self->_tmp2DataBuffSize = self->_sizeofSample * self->_nSamples;
  objc_super v4 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  self->_tmp2DataBuff = v4;
  if (!v4)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v11) {
      return result;
    }
    __int16 v14 = 0;
    v8 = MEMORY[0x1E4F14500];
    v9 = "HalogenLdcmCalc:Failed to alloc _tmp2DataBuff";
    v10 = (uint8_t *)&v14;
LABEL_12:
    _os_log_impl(&dword_1D9622000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    return 0;
  }
  self->_tmp3DataBuffSize = self->_sizeofSample * self->_nSamples;
  v5 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  self->_tmp3DataBuff = v5;
  if (v5) {
    return 1;
  }
  BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v12)
  {
    __int16 v13 = 0;
    v8 = MEMORY[0x1E4F14500];
    v9 = "HalogenLdcmCalc:Failed to alloc _tmp3DataBuff";
    v10 = (uint8_t *)&v13;
    goto LABEL_12;
  }
  return result;
}

- (void)_freeBuffers
{
  tmp3DataBuff = self->_tmp3DataBuff;
}

- (int)doPreCalibration:(id)a3 withCurrentData:(id)a4
{
  [(HalogenLdcmCalc *)self _snr:a3 withGain:&self->_precalVoltageSignalLevel hasSignalLevel:&self->_precalVoltageNoiseLevel hasNoiseLevel:0 hasCondetSnr:self->_adcGain];
  double v7 = v6;
  self->_precalVoltageSNR = v6;
  [(HalogenLdcmCalc *)self _snr:a4 withGain:&self->_precalCurrentSignalLevel hasSignalLevel:&self->_precalCurrentNoiseLevel hasNoiseLevel:0 hasCondetSnr:self->_adcGain];
  self->_precalCurrentSNR = v8;
  BOOL v9 = v7 < 26.0 || v8 < 26.0;
  double v10 = vabdd_f64(v7, v8);
  if (!v9 && v10 < 0.25) {
    return 0;
  }
  else {
    return 2;
  }
}

- (int)doCalibration:(id)a3 withCurrentData:(id)a4
{
  [(HalogenLdcmCalc *)self _snr:a3 withGain:&self->_calVoltageSignalLevel hasSignalLevel:&self->_calVoltageNoiseLevel hasNoiseLevel:0 hasCondetSnr:self->_adcGain];
  double v8 = v7;
  self->_calVoltageSNR = v7;
  [(HalogenLdcmCalc *)self _snr:a4 withGain:&self->_calCurrentSignalLevel hasSignalLevel:&self->_calCurrentNoiseLevel hasNoiseLevel:0 hasCondetSnr:self->_adcGain];
  double v10 = v9;
  self->_calCurrentSNR = v9;
  double v16 = NAN;
  double v17 = NAN;
  [(HalogenLdcmCalc *)self _goertzelSecondOrder:a3 hasFftValue:&v17 hasPhase:&v16 withHanning:1];
  double v14 = NAN;
  double v15 = NAN;
  [(HalogenLdcmCalc *)self _goertzelSecondOrder:a4 hasFftValue:&v15 hasPhase:&v14 withHanning:1];
  double v11 = (v17 + v15) * 0.5;
  double v12 = v11 / v15;
  self->_voltageGainCorrection = v11 / v17;
  self->_currentGainCorrection = v12;
  self->_currentPhaseCompensation = v16 - v14;
  int result = 2;
  if (v8 >= 26.0 && v10 >= 26.0 && vabdd_f64(v8, v10) < 0.25)
  {
    if ([(HalogenLdcmCalc *)self isBoundViolation_voltageGainCorrection]) {
      return 1;
    }
    if ([(HalogenLdcmCalc *)self isBoundViolation_currentGainCorrection]) {
      return 1;
    }
    int result = [(HalogenLdcmCalc *)self isBoundViolation_currentPhaseCompensation];
    if (result) {
      return 1;
    }
  }
  return result;
}

- (int)doLiquidDetection:(id)a3 withCurrentData:(id)a4 isReceptacleEmpty:(BOOL)a5 isReceptacleWet:(BOOL)a6 withWetTransitionThreshold:(double)a7 withDryTransitionThreshold:(double)a8
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  self->_capacitanceInNanoF = 0.0;
  *(_OWORD *)&self->_compensatedImpedance = 0u;
  *(_OWORD *)&self->_clippingScore = 0u;
  *(_OWORD *)&self->_goertzelImpedance = 0u;
  [(HalogenLdcmCalc *)self _applyGain:a4 toData:self->_adcGain];
  [(HalogenLdcmCalc *)self _applyGain:a3 toData:self->_adcGain];
  [(HalogenLdcmCalc *)self _applyFractionalPhaseShift:a4 withPhaseDelay:self->_currentPhaseCompensation / -360.0 / self->_signalFrequency * self->_sampleRate];
  [(HalogenLdcmCalc *)self _applyGain:a4 toData:self->_currentGainCorrection];
  [(HalogenLdcmCalc *)self _applyGain:a3 toData:self->_voltageGainCorrection];
  BOOL v15 = [(HalogenLdcmCalc *)self _isClipped:a4];
  [(HalogenLdcmCalc *)self _applyTiaGain:a3 toCurrentData:a4];
  [(HalogenLdcmCalc *)self _snr:a3 withGain:&self->_measurementVoltageSignalLevel hasSignalLevel:&self->_measurementVoltageNoiseLevel hasNoiseLevel:0 hasCondetSnr:1.0];
  double v17 = v16;
  self->_measurementVoltageSNR = v16;
  p_measurementCondetSNR = &self->_measurementCondetSNR;
  [(HalogenLdcmCalc *)self _snr:a4 withGain:&self->_measurementCurrentSignalLevel hasSignalLevel:&self->_measurementCurrentNoiseLevel hasNoiseLevel:&self->_measurementCondetSNR hasCondetSnr:1.0];
  double v20 = v19;
  self->_measurementCurrentSNR = v19;
  if (v9 && *p_measurementCondetSNR >= 1.0)
  {
    -[HalogenLdcmCalc setIsDigitalFilterTrigger:](self, "setIsDigitalFilterTrigger:", 1, *p_measurementCondetSNR);
    [(HalogenLdcmCalc *)self _applyDigitalFilter:a4];
  }
  else
  {
    [(HalogenLdcmCalc *)self setIsDigitalFilterTrigger:0];
  }
  double v27 = NAN;
  double v28 = NAN;
  [(HalogenLdcmCalc *)self _goertzelSecondOrder:a3 hasFftValue:&v28 hasPhase:&v27 withHanning:1];
  double v25 = NAN;
  double v26 = NAN;
  [(HalogenLdcmCalc *)self _goertzelSecondOrder:a4 hasFftValue:&v26 hasPhase:&v25 withHanning:1];
  double v21 = v28 / v26;
  self->_goertzelImpedance = v28 / v26;
  long double v22 = v27 - v25;
  if (v27 - v25 > 0.0) {
    long double v22 = fmod(v27 - v25, 360.0) + -360.0;
  }
  self->_goertzelPhase = v22;
  -[HalogenLdcmCalc _doHydraComp:withPhase:](self, "_doHydraComp:withPhase:", v21);
  [(HalogenLdcmCalc *)self _rcSolver];
  char v23 = v17 < 26.0 || v15;
  if (v17 >= 26.0) {
    int result = 3;
  }
  else {
    int result = 8;
  }
  if ((v23 & 1) == 0)
  {
    if ([(HalogenLdcmCalc *)self isLowerBoundViolation_goertzelImpedance]
      || [(HalogenLdcmCalc *)self isUpperBoundViolation_goertzelImpedance]
      || [(HalogenLdcmCalc *)self isLowerBoundViolation_goertzelPhase]
      || [(HalogenLdcmCalc *)self isUpperBoundViolation_goertzelPhase])
    {
      return 0;
    }
    else if (v20 >= 7.0 || self->_isDigitalFilterTrigger)
    {
      if (!v8) {
        a8 = a7;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v30 = a8;
        __int16 v31 = 1024;
        BOOL v32 = v8;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenLdcmCalc:doLiquidDetection capacitanceThreshholdNanoF = %f, isReceptacleWet: %d", buf, 0x12u);
      }
      if (self->_capacitanceInNanoF <= a8) {
        return 1;
      }
      else {
        return 2;
      }
    }
    else
    {
      return 8;
    }
  }
  return result;
}

- (void)_applyGain:(double)a3 toData:(id)a4
{
  double v7 = (double *)[a4 bytes];
  unint64_t v8 = [a4 length];
  unint64_t sizeofSample = self->_sizeofSample;
  if (v8 >= sizeofSample)
  {
    unint64_t v10 = v8 / sizeofSample;
    if (v10 <= 1) {
      unint64_t v10 = 1;
    }
    do
    {
      *double v7 = *v7 * a3;
      ++v7;
      --v10;
    }
    while (v10);
  }
}

- (void)_applyTiaGain:(id)a3 toCurrentData:(id)a4
{
  double v6 = (double *)[a4 bytes];
  double v7 = (double *)[a3 bytes];
  unint64_t v8 = [a3 length];
  unint64_t sizeofSample = self->_sizeofSample;
  if (v8 >= sizeofSample)
  {
    unint64_t v10 = v8 / sizeofSample;
    if (v10 <= 1) {
      unint64_t v10 = 1;
    }
    do
    {
      double v11 = *v7++;
      *double v6 = (*v6 - v11) / self->_tiaGain;
      ++v6;
      --v10;
    }
    while (v10);
  }
}

- (void)_applyHanningWindow:(id)a3 withSize:(int)a4
{
  uint64_t v5 = [a3 bytes];
  if (a4 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      *(long double *)(v6 + 8 * v7) = (1.0 - cos((double)((int)v7 + 1) * 6.28318531 / (double)(a4 + 1)))
                                    * 0.5
                                    * *(double *)(v6 + 8 * v7);
      ++v7;
    }
    while (a4 != v7);
  }
}

- (void)_goertzelSecondOrder:(id)a3 hasFftValue:(double *)a4 hasPhase:(double *)a5 withHanning:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v11 = [a3 bytes];
  unint64_t v12 = [a3 length];
  unint64_t sizeofSample = self->_sizeofSample;
  unint64_t v14 = v12 / sizeofSample;
  __double2 v15 = __sincos_stret(self->_signalFrequency / self->_sampleRate * 6.28318531);
  double v16 = 0.0;
  double v17 = 0.0;
  if (v12 >= sizeofSample)
  {
    uint64_t v18 = 0;
    double v19 = v15.__cosval + v15.__cosval;
    if (v14 <= 1) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v14;
    }
    double v21 = 0.0;
    double v22 = 0.0;
    do
    {
      if (v6) {
        double v23 = v19 * v22
      }
            + *(double *)(v11 + 8 * v18) * ((1.0 - cos((double)((int)v18 + 1) * 6.28318531 / (double)(v14 + 1))) * 0.5);
      else {
        double v23 = *(double *)(v11 + 8 * v18) + v19 * v22;
      }
      ++v18;
      double v16 = v23 - v21;
      double v17 = v22;
      double v21 = v22;
      double v22 = v16;
    }
    while (v18 != v20);
  }
  double v24 = v16 - v17 * v15.__cosval;
  double v25 = v15.__sinval * v17;
  if (a4)
  {
    double v26 = sqrt(v25 * v25 + v24 * v24);
    *a4 = (v26 + v26) / (double)v14;
  }
  if (a5) {
    *a5 = atan2(v25, v24) * 180.0 / 3.14159265;
  }
}

- (void)_applyFractionalPhaseShift:(id)a3 withPhaseDelay:(double)a4
{
  uint64_t v26 = -1;
  uint64_t v7 = (uint64_t *)[a3 bytes];
  double v8 = -a4;
  [a3 appendBytes:&v7[objc_msgSend(a3 length:"length") / (unint64_t)self->_sizeofSample - 1]];
  if (a4 >= 1.0)
  {
    unsigned int v9 = vcvtpd_s64_f64(v8);
    double v8 = (double)-v9 - a4;
    uint64_t v26 = *v7;
    if ((v9 & 0x80000000) != 0)
    {
      if ((signed int)-v9 <= 1) {
        int v10 = 1;
      }
      else {
        int v10 = -v9;
      }
      do
      {
        objc_msgSend(a3, "replaceBytesInRange:withBytes:length:", 0, 0, &v26, self->_sizeofSample);
        --v10;
      }
      while (v10);
    }
  }
  if (v8 >= 1.0)
  {
    int v11 = vcvtmd_s64_f64(v8);
    double v8 = v8 - (double)v11;
    objc_msgSend(a3, "replaceBytesInRange:withBytes:length:", 0, self->_sizeofSample * (uint64_t)v11, 0, 0);
  }
  unint64_t v12 = (double *)[a3 bytes];
  unint64_t v13 = [a3 length];
  unint64_t sizeofSample = self->_sizeofSample;
  unint64_t v15 = v13 / sizeofSample;
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
    {
      unint64_t v20 = v15 - 1;
      if (v15 != 1)
      {
        double v21 = v12 + 1;
        double v22 = *v12;
        do
        {
          double v23 = *v21;
          *(v21 - 1) = (1.0 - v8) * v22 + *v21 * v8;
          ++v21;
          double v22 = v23;
          --v20;
        }
        while (v20);
      }
    }
  }
  else if (v15 >= 2)
  {
    double v16 = v12 + 1;
    double v17 = *v12;
    unint64_t v18 = v15 - 1;
    do
    {
      double v19 = *v16;
      *double v16 = *v16 * (v8 + 1.0) - v17 * v8;
      ++v16;
      double v17 = v19;
      --v18;
    }
    while (v18);
  }
  unint64_t nSamples = self->_nSamples;
  if (v15 >= nSamples)
  {
    if (v15 > nSamples) {
      [a3 setLength:(int)nSamples * (uint64_t)(int)sizeofSample];
    }
  }
  else
  {
    unint64_t v25 = v15 - 1;
    uint64_t v26 = *(void *)&v12[v15 - 1];
    do
    {
      v12[v15] = v12[v25];
      [a3 appendBytes:&v26 length:self->_sizeofSample];
      ++v15;
    }
    while (v15 < self->_nSamples);
  }
}

- (void)_doHydraComp:(double)a3 withPhase:(double)a4
{
  __double2 v6 = __sincos_stret(a4 * 3.14159265 / 180.0);
  double v7 = 1.0 / self->_hydraImpedance;
  double v8 = __divdc3(1.0, 0.0, v6.__cosval * a3 + v6.__sinval * a3 * 0.0, v6.__sinval * a3);
  double v10 = v9;
  double v11 = v8 - v7;
  float v12 = __divsc3(-0.0, -1.0, 2.0, 0.0);
  double v14 = __divdc3(1.0, 0.0, v11 + self->_signalFrequency * (v12 * 3.14159265) * 3.3e-11, v10 + self->_signalFrequency * (v13 * 3.14159265) * 3.3e-11);
  double v16 = v15;
  self->_compensatedImpedance = MEMORY[0x1E0165FE0]();
  v17.c[0] = v14;
  v17.c[1] = v16;
  self->_compensatedPhase = carg(v17) / 3.14159265 * 180.0;
}

- (BOOL)_isClipped:(id)a3
{
  uint64_t v4 = [a3 bytes];
  uint64_t v5 = [(NSMutableData *)self->_tmp1DataBuff bytes];
  uint64_t v6 = [(NSMutableData *)self->_tmp2DataBuff bytes];
  uint64_t v7 = [(NSMutableData *)self->_tmp3DataBuff bytes];
  uint64_t diffWindowSize = self->_diffWindowSize;
  if ((int)diffWindowSize > 0)
  {
    uint64_t v9 = 0;
    do
    {
      *(double *)(v5 + v9) = *(double *)(v4 + v9 + 8) - *(double *)(v4 + v9);
      v9 += 8;
    }
    while (8 * diffWindowSize != v9);
    uint64_t v10 = 0;
    double v11 = (double *)(v6 + 792);
    int v12 = diffWindowSize - 199;
    double v13 = 0.0;
    while (1)
    {
      uint64_t v14 = 0;
      *(void *)(v6 + 8 * v10) = 0;
      double v15 = (double *)v5;
      uint64_t v16 = v10;
      double v17 = 0.0;
      do
      {
        if (v14)
        {
          if (v16 <= 0x64)
          {
            unint64_t v18 = v15;
            if (v14 < self->_clipDetectWindowSize) {
              goto LABEL_12;
            }
          }
        }
        else if (v16 <= 0x64)
        {
          unint64_t v18 = (double *)v5;
          if (self->_clipDetectWindowSize >= 1)
          {
LABEL_12:
            double v17 = v17 + fir1[v16] * *v18;
            *(double *)(v6 + 8 * v10) = v17;
          }
        }
        ++v14;
        --v16;
        ++v15;
      }
      while (v16 != -1);
      if ((unint64_t)v10 > 0x62)
      {
        BOOL v19 = v17 > v13 && v10 < self->_clipDetectWindowSize - 100;
        if (v19) {
          double v13 = v17;
        }
      }
      if (++v10 == diffWindowSize)
      {
        if ((int)diffWindowSize < 200)
        {
          int v21 = 0;
        }
        else
        {
          uint64_t v20 = (diffWindowSize - 199);
          do
          {
            *double v11 = *v11 / v13;
            ++v11;
            --v20;
          }
          while (v20);
          int v21 = 1;
        }
        goto LABEL_27;
      }
    }
  }
  int v21 = 0;
  int v12 = diffWindowSize - 199;
LABEL_27:
  int v22 = llround(self->_sampleRate / self->_signalFrequency * 0.5);
  if (v22 >= 0) {
    int v23 = v22;
  }
  else {
    int v23 = v22 + 1;
  }
  int v24 = v23 >> 1;
  unsigned int v25 = v22 - (v23 & 0xFFFFFFFE);
  if (v21)
  {
    uint64_t v26 = 0;
    int v27 = v24 + v25 - 1;
    double v28 = (double)v22;
    int v29 = -v24;
    do
    {
      signed int v30 = v27 + v26;
      if (v27 + (int)v26 >= (int)diffWindowSize - 200) {
        signed int v30 = diffWindowSize - 200;
      }
      double v31 = 0.0;
      if (((v26 - v24) & ~(((int)v26 - v24) >> 31)) <= v30)
      {
        uint64_t v32 = v29 & ~(v29 >> 31);
        do
        {
          double v31 = v31 + fabs(*(double *)(v6 + 792 + 8 * v32));
          BOOL v19 = v32++ < v30;
        }
        while (v19);
      }
      *(double *)(v7 + 8 * v26++) = v31 / v28;
      ++v29;
    }
    while (v26 != v12);
  }
  signed int v33 = v24 + v25;
  uint64_t v34 = (diffWindowSize - 2 * v33 - 198);
  double v35 = *(double *)(v7 + 8 * v33);
  if ((int)v34 >= 2)
  {
    v36 = (double *)(v7 + 8 * v33 + 8);
    uint64_t v37 = v34 - 1;
    do
    {
      double v38 = *v36++;
      double v39 = v38;
      if (v35 > v38) {
        double v35 = v39;
      }
      --v37;
    }
    while (v37);
  }
  self->_clippingScore = v35;
  return v35 < self->_movesumClipThreshold;
}

- (void)_rcSolver
{
  double compensatedImpedance = self->_compensatedImpedance;
  __double2 v4 = __sincos_stret(self->_compensatedPhase * 3.14159265 / 180.0);
  double signalFrequency = self->_signalFrequency;
  double v6 = signalFrequency * 6.28318531 * self->_ldcmAcCap;
  double v7 = compensatedImpedance * v4.__cosval + compensatedImpedance * v4.__sinval * 0.0 - (self->_hydraR - 0.0 / v6);
  double v8 = compensatedImpedance * v4.__sinval + 1.0 / v6;
  double v9 = v7 + v8 * v8 / v7;
  self->_resistanceInOhms = v9;
  self->_capacitanceInNanoF = v8 / (signalFrequency * ((v7 * v9 + v7 * v9) * 3.14159265)) * -1000000000.0;
}

- (double)_snr:(id)a3 withGain:(double)a4 hasSignalLevel:(double *)a5 hasNoiseLevel:(double *)a6 hasCondetSnr:(double *)a7
{
  int v12 = (const void *)[a3 bytes];
  tmp1DataBuff = self->_tmp1DataBuff;
  uint64_t v14 = (double *)[(NSMutableData *)tmp1DataBuff bytes];
  double v15 = (double *)[(NSMutableData *)self->_tmp2DataBuff bytes];
  uint64_t v16 = [(NSMutableData *)self->_tmp3DataBuff bytes];
  v25.realp = v14;
  v25.imagp = v15;
  memcpy(v14, v12, (uint64_t)self->_sizeofSample << 11);
  bzero(v15, (uint64_t)self->_sizeofSample << 11);
  -[HalogenLdcmCalc _applyGain:toData:](self, "_applyGain:toData:", tmp1DataBuff, a4, v14, v15);
  [(HalogenLdcmCalc *)self _applyHanningWindow:tmp1DataBuff withSize:2048];
  vDSP_fft_zripD(self->_fftContext, &v25, 1, 0xCuLL, 1);
  for (uint64_t i = 0; i != 1024; ++i)
  {
    v14[i] = v14[i] * 0.000244140625;
    double v18 = v15[i] * 0.000244140625;
    v15[i] = v18;
    *(double *)(v16 + i * 8) = v18 * v18 + v14[i] * v14[i];
  }
  double v19 = 0.0;
  for (uint64_t j = 32; j != 56; j += 8)
    double v19 = v19 + *(double *)(v16 + j);
  double v21 = 2.22507386e-308;
  for (uint64_t k = 56; k != 0x2000; k += 8)
    double v21 = v21 + *(double *)(v16 + k);
  if (a5) {
    *a5 = v19;
  }
  if (a6) {
    *a6 = v21;
  }
  if (a7)
  {
    [(HalogenLdcmCalc *)self _condetSnr:v16];
    *(void *)a7 = v23;
  }
  return log10(v19 / v21) * 10.0;
}

- (double)_condetSnr:(double *)a3
{
  if (!a3) {
    return 2.22507386e-308;
  }
  double v4 = self->_sampleRate * 0.00048828125;
  uint64_t v5 = a3 - 2;
  int v6 = 25;
  double v7 = 25.0;
  double v8 = 2.22507386e-308;
  do
  {
    int v9 = llround(v4 * v7);
    double v10 = 0.0;
    if (v9 <= 23999)
    {
      int v11 = v9;
      do
      {
        int v12 = llround((double)v11 / v4);
        if (v12 <= 2) {
          uint64_t v13 = 2;
        }
        else {
          uint64_t v13 = v12;
        }
        if (v12 >= 1021) {
          int v12 = 1021;
        }
        int v14 = v12 + 2;
        if ((int)v13 - 2 <= v14)
        {
          do
          {
            double v10 = v10 + v5[v13];
            uint64_t v15 = v13 - 2;
            ++v13;
          }
          while (v15 < v14);
        }
        v11 += v9;
      }
      while (v11 < 24000);
    }
    int v16 = llround((double)v9 / v4);
    if (v16 > 1025)
    {
      double v18 = 2.22507386e-308;
    }
    else
    {
      uint64_t v17 = v16 - 2;
      double v18 = 2.22507386e-308;
      do
        double v18 = v18 + a3[v17];
      while (v17++ < 1023);
    }
    double v20 = log10(v10 / (v18 - v10)) * 10.0;
    if (v20 > v8) {
      double v8 = v20;
    }
    double v7 = v7 + 1.0;
    ++v6;
  }
  while (v6 != 32);
  return v8;
}

- (double)_mean:(double *)a3 ofSize:(unint64_t)a4
{
  double v4 = 0.0;
  if (a4)
  {
    unint64_t v5 = a4;
    do
    {
      double v6 = *a3++;
      double v4 = v4 + v6;
      --v5;
    }
    while (v5);
  }
  return v4 / (double)a4;
}

- (double)_variance:(double *)a3 ofSize:(unint64_t)a4
{
  -[HalogenLdcmCalc _mean:ofSize:](self, "_mean:ofSize:");
  double v7 = 0.0;
  if (a4)
  {
    unint64_t v8 = a4;
    do
    {
      double v9 = *a3++;
      double v7 = v7 + (v9 - v6) * (v9 - v6);
      --v8;
    }
    while (v8);
  }
  return v7 / (double)(a4 - 1);
}

- (double)_stdev:(double *)a3 ofSize:(unint64_t)a4
{
  [(HalogenLdcmCalc *)self _variance:a3 ofSize:a4];
  return sqrt(v4);
}

- (double)_median:(double *)a3 ofSize:(unint64_t)a4
{
  qsort(a3, a4, self->_sizeofSample, (int (__cdecl *)(const void *, const void *))compare);
  double result = a3[a4 >> 1];
  if ((a4 & 1) == 0) {
    return (result + a3[(a4 >> 1) - 1]) * 0.5;
  }
  return result;
}

- (void)_reconstructSignal:(id)a3
{
  unint64_t v5 = (char *)[a3 bytes];
  double v6 = (double *)[(NSMutableData *)self->_tmp1DataBuff bytes];
  double v7 = (double *)[(NSMutableData *)self->_tmp2DataBuff bytes];
  __dst = (void *)[(NSMutableData *)self->_tmp3DataBuff bytes];
  unint64_t v8 = [a3 length];
  unint64_t v9 = v8;
  unint64_t sizeofSample = self->_sizeofSample;
  unint64_t v11 = v8 / sizeofSample;
  uint64_t v12 = v8 / sizeofSample - 1;
  unint64_t v43 = sizeofSample;
  if (v8 >= sizeofSample)
  {
    uint64_t v13 = 0;
    if (v11 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v8 / sizeofSample;
    }
    do
    {
      if ((int)v13 <= 1) {
        int v15 = 1;
      }
      else {
        int v15 = v13;
      }
      uint64_t v16 = (v15 - 1);
      uint64_t v17 = v13 + 1;
      if (v11 > v13 + 1) {
        uint64_t v18 = v13 + 1;
      }
      else {
        uint64_t v18 = v12;
      }
      [(HalogenLdcmCalc *)self _mean:&v5[8 * v16] ofSize:v18 - v16 + 1];
      v6[v13++] = v19;
    }
    while (v14 != v17);
  }
  if (v12)
  {
    double v20 = v6 + 1;
    double v21 = *v6;
    uint64_t v22 = v12;
    do
    {
      double v23 = *v20;
      *(v20 - 1) = *v20 - v21;
      ++v20;
      double v21 = v23;
      --v22;
    }
    while (v22);
  }
  v6[v12] = 0.0;
  if (v9 >= v43)
  {
    uint64_t v24 = 0;
    if (v11 <= 1) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = v11;
    }
    do
    {
      if ((int)v24 <= 3) {
        int v26 = 3;
      }
      else {
        int v26 = v24;
      }
      uint64_t v27 = (v26 - 3);
      uint64_t v28 = v24 + 3;
      if (v11 <= v24 + 3) {
        uint64_t v28 = v12;
      }
      [(HalogenLdcmCalc *)self _variance:&v6[v27] ofSize:v28 - v27 + 1];
      v7[v24++] = v29;
    }
    while (v25 != v24);
    signed int v30 = v7;
    do
    {
      *signed int v30 = sqrt(*v30);
      ++v30;
      --v25;
    }
    while (v25);
  }
  memcpy(__dst, v7, v11 * self->_sizeofSample);
  [(HalogenLdcmCalc *)self _median:__dst ofSize:v11];
  double v32 = v31;
  [(HalogenLdcmCalc *)self _stdev:v7 ofSize:v11];
  if (v9 >= v43)
  {
    uint64_t v34 = 0;
    double v35 = v32 + v33 * 1.5;
    if (v11 <= 1) {
      uint64_t v36 = 1;
    }
    else {
      uint64_t v36 = v11;
    }
    do
    {
      if (fabs(v7[v34]) >= v35) {
        v6[v34] = 0.0;
      }
      ++v34;
    }
    while (v36 != v34);
    uint64_t v37 = 0;
    double v38 = 0.0;
    do
    {
      double v38 = v38 + v6[v37];
      v6[v37++] = v38;
    }
    while (v36 != v37);
    [(HalogenLdcmCalc *)self _mean:v6 ofSize:v11];
    v40 = v6;
    do
    {
      double *v40 = *v40 - v39;
      ++v40;
      --v36;
    }
    while (v36);
  }
  else
  {
    [(HalogenLdcmCalc *)self _mean:v6 ofSize:v11];
  }
  size_t v41 = v11 * self->_sizeofSample;
  memcpy(v5, v6, v41);
}

- (double)_sineExtractor:(id)a3
{
  unint64_t v5 = (double *)[a3 bytes];
  unint64_t v6 = [a3 length] / (unint64_t)self->_sizeofSample;
  if (v6 != 1)
  {
    double v7 = v5 + 1;
    double v8 = *v5;
    unint64_t v9 = v6 - 1;
    do
    {
      double v10 = *v7;
      *(v7 - 1) = *v7 - v8;
      ++v7;
      double v8 = v10;
      --v9;
    }
    while (v9);
  }
  v5[v6 - 1] = 0.0;
  double v12 = NAN;
  [(HalogenLdcmCalc *)self _goertzelSecondOrder:a3 hasFftValue:0 hasPhase:&v12 withHanning:0];
  return (v12 + -90.0 + (double)(v6 + 2) / (self->_sampleRate / self->_signalFrequency) * -360.0) * 3.14159265 / 180.0;
}

- (void)_applyDigitalFilter:(id)a3
{
  uint64_t v5 = [a3 bytes];
  unint64_t v6 = [a3 length];
  unint64_t sizeofSample = self->_sizeofSample;
  unint64_t v8 = v6 / sizeofSample;
  [(HalogenLdcmCalc *)self _mean:v5 ofSize:v6 / sizeofSample];
  double v10 = v9;
  *(double *)&uint64_t v15 = NAN;
  [(HalogenLdcmCalc *)self _goertzelSecondOrder:a3 hasFftValue:&v15 hasPhase:0 withHanning:0];
  [(HalogenLdcmCalc *)self _reconstructSignal:a3];
  [(HalogenLdcmCalc *)self _sineExtractor:a3];
  if (v6 >= sizeofSample)
  {
    double v12 = v11;
    uint64_t v13 = 0;
    double v14 = *(double *)&v15;
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    do
    {
      *(long double *)(v5 + 8 * v13) = v10
                                     + v14
                                     * cos(v12+ self->_signalFrequency * 6.28318531 * ((double)(int)v13 / self->_sampleRate));
      ++v13;
    }
    while (v8 != v13);
  }
}

- (BOOL)isBoundViolation_voltageGainCorrection
{
  double voltageGainCorrection = self->_voltageGainCorrection;
  return voltageGainCorrection < self->_sanitycheckVoltageGainCorrectionLowerbound
      || voltageGainCorrection > self->_sanitycheckVoltageGainCorrectionUpperbound;
}

- (BOOL)isBoundViolation_currentGainCorrection
{
  double currentGainCorrection = self->_currentGainCorrection;
  return currentGainCorrection < self->_sanitycheckCurrentGainCorrectionLowerbound
      || currentGainCorrection > self->_sanitycheckCurrentGainCorrectionUpperbound;
}

- (BOOL)isBoundViolation_currentPhaseCompensation
{
  double currentPhaseCompensation = self->_currentPhaseCompensation;
  return currentPhaseCompensation < self->_sanitycheckCurrentPhaseCompensationLowerbound
      || currentPhaseCompensation > self->_sanitycheckCurrentPhaseCompensationUpperbound;
}

- (BOOL)isLowerBoundViolation_goertzelImpedance
{
  return self->_goertzelImpedance < self->_sanitycheckImpedanceLowerbound;
}

- (BOOL)isUpperBoundViolation_goertzelImpedance
{
  return self->_goertzelImpedance > self->_sanitycheckImpedanceUpperbound;
}

- (BOOL)isLowerBoundViolation_goertzelPhase
{
  return self->_goertzelPhase < self->_sanitycheckPhaseLowerbound;
}

- (BOOL)isUpperBoundViolation_goertzelPhase
{
  return self->_goertzelPhase > self->_sanitycheckPhaseUperbound;
}

- (BOOL)isBoundViolation_measurementCondetSNR
{
  return self->_isDigitalFilterTrigger;
}

- (double)precalVoltageSignalLevel
{
  return self->_precalVoltageSignalLevel;
}

- (double)precalVoltageNoiseLevel
{
  return self->_precalVoltageNoiseLevel;
}

- (double)precalVoltageSNR
{
  return self->_precalVoltageSNR;
}

- (double)precalCurrentSignalLevel
{
  return self->_precalCurrentSignalLevel;
}

- (double)precalCurrentNoiseLevel
{
  return self->_precalCurrentNoiseLevel;
}

- (double)precalCurrentSNR
{
  return self->_precalCurrentSNR;
}

- (double)voltageGainCorrection
{
  return self->_voltageGainCorrection;
}

- (double)currentGainCorrection
{
  return self->_currentGainCorrection;
}

- (double)currentPhaseCompensation
{
  return self->_currentPhaseCompensation;
}

- (double)calVoltageSignalLevel
{
  return self->_calVoltageSignalLevel;
}

- (double)calVoltageNoiseLevel
{
  return self->_calVoltageNoiseLevel;
}

- (double)calVoltageSNR
{
  return self->_calVoltageSNR;
}

- (double)calCurrentSignalLevel
{
  return self->_calCurrentSignalLevel;
}

- (double)calCurrentNoiseLevel
{
  return self->_calCurrentNoiseLevel;
}

- (double)calCurrentSNR
{
  return self->_calCurrentSNR;
}

- (double)goertzelImpedance
{
  return self->_goertzelImpedance;
}

- (double)goertzelPhase
{
  return self->_goertzelPhase;
}

- (double)compensatedImpedance
{
  return self->_compensatedImpedance;
}

- (double)compensatedPhase
{
  return self->_compensatedPhase;
}

- (double)clippingScore
{
  return self->_clippingScore;
}

- (double)resistanceInOhms
{
  return self->_resistanceInOhms;
}

- (double)capacitanceInNanoF
{
  return self->_capacitanceInNanoF;
}

- (double)measurementVoltageSignalLevel
{
  return self->_measurementVoltageSignalLevel;
}

- (double)measurementVoltageNoiseLevel
{
  return self->_measurementVoltageNoiseLevel;
}

- (double)measurementVoltageSNR
{
  return self->_measurementVoltageSNR;
}

- (double)measurementCurrentSignalLevel
{
  return self->_measurementCurrentSignalLevel;
}

- (double)measurementCurrentNoiseLevel
{
  return self->_measurementCurrentNoiseLevel;
}

- (double)measurementCurrentSNR
{
  return self->_measurementCurrentSNR;
}

- (double)measurementCondetSNR
{
  return self->_measurementCondetSNR;
}

- (int)nSamples
{
  return self->_nSamples;
}

- (void)setNSamples:(int)a3
{
  self->_unint64_t nSamples = a3;
}

- (int)diffWindowSize
{
  return self->_diffWindowSize;
}

- (void)setDiffWindowSize:(int)a3
{
  self->_uint64_t diffWindowSize = a3;
}

- (int)clipDetectWindowSize
{
  return self->_clipDetectWindowSize;
}

- (void)setClipDetectWindowSize:(int)a3
{
  self->_clipDetectWindowSize = a3;
}

- (int)sizeofSample
{
  return self->_sizeofSample;
}

- (void)setSizeofSample:(int)a3
{
  self->_unint64_t sizeofSample = a3;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
}

- (double)signalFrequency
{
  return self->_signalFrequency;
}

- (void)setSignalFrequency:(double)a3
{
  self->_double signalFrequency = a3;
}

- (double)adcGain
{
  return self->_adcGain;
}

- (void)setAdcGain:(double)a3
{
  self->_adcGain = a3;
}

- (double)tiaGain
{
  return self->_tiaGain;
}

- (void)setTiaGain:(double)a3
{
  self->_tiaGain = a3;
}

- (double)hydraImpedance
{
  return self->_hydraImpedance;
}

- (void)setHydraImpedance:(double)a3
{
  self->_hydraImpedance = a3;
}

- (double)movesumClipThreshold
{
  return self->_movesumClipThreshold;
}

- (void)setMovesumClipThreshold:(double)a3
{
  self->_movesumClipThreshold = a3;
}

- (double)hydraR
{
  return self->_hydraR;
}

- (void)setHydraR:(double)a3
{
  self->_hydraR = a3;
}

- (double)ldcmAcCap
{
  return self->_ldcmAcCap;
}

- (void)setLdcmAcCap:(double)a3
{
  self->_ldcmAcCap = a3;
}

- (double)sanitycheckImpedanceLowerbound
{
  return self->_sanitycheckImpedanceLowerbound;
}

- (void)setSanitycheckImpedanceLowerbound:(double)a3
{
  self->_sanitycheckImpedanceLowerbound = a3;
}

- (double)sanitycheckImpedanceUpperbound
{
  return self->_sanitycheckImpedanceUpperbound;
}

- (void)setSanitycheckImpedanceUpperbound:(double)a3
{
  self->_sanitycheckImpedanceUpperbound = a3;
}

- (double)sanitycheckPhaseLowerbound
{
  return self->_sanitycheckPhaseLowerbound;
}

- (void)setSanitycheckPhaseLowerbound:(double)a3
{
  self->_sanitycheckPhaseLowerbound = a3;
}

- (double)sanitycheckPhaseUperbound
{
  return self->_sanitycheckPhaseUperbound;
}

- (void)setSanitycheckPhaseUperbound:(double)a3
{
  self->_sanitycheckPhaseUperbound = a3;
}

- (double)sanitycheckVoltageGainCorrectionLowerbound
{
  return self->_sanitycheckVoltageGainCorrectionLowerbound;
}

- (void)setSanitycheckVoltageGainCorrectionLowerbound:(double)a3
{
  self->_sanitycheckVoltageGainCorrectionLowerbound = a3;
}

- (double)sanitycheckVoltageGainCorrectionUpperbound
{
  return self->_sanitycheckVoltageGainCorrectionUpperbound;
}

- (void)setSanitycheckVoltageGainCorrectionUpperbound:(double)a3
{
  self->_sanitycheckVoltageGainCorrectionUpperbound = a3;
}

- (double)sanitycheckCurrentGainCorrectionLowerbound
{
  return self->_sanitycheckCurrentGainCorrectionLowerbound;
}

- (void)setSanitycheckCurrentGainCorrectionLowerbound:(double)a3
{
  self->_sanitycheckCurrentGainCorrectionLowerbound = a3;
}

- (double)sanitycheckCurrentGainCorrectionUpperbound
{
  return self->_sanitycheckCurrentGainCorrectionUpperbound;
}

- (void)setSanitycheckCurrentGainCorrectionUpperbound:(double)a3
{
  self->_sanitycheckCurrentGainCorrectionUpperbound = a3;
}

- (double)sanitycheckCurrentPhaseCompensationLowerbound
{
  return self->_sanitycheckCurrentPhaseCompensationLowerbound;
}

- (void)setSanitycheckCurrentPhaseCompensationLowerbound:(double)a3
{
  self->_sanitycheckCurrentPhaseCompensationLowerbound = a3;
}

- (double)sanitycheckCurrentPhaseCompensationUpperbound
{
  return self->_sanitycheckCurrentPhaseCompensationUpperbound;
}

- (void)setSanitycheckCurrentPhaseCompensationUpperbound:(double)a3
{
  self->_sanitycheckCurrentPhaseCompensationUpperbound = a3;
}

- (BOOL)isDigitalFilterTrigger
{
  return self->_isDigitalFilterTrigger;
}

- (void)setIsDigitalFilterTrigger:(BOOL)a3
{
  self->_isDigitalFilterTrigger = a3;
}

- (NSMutableData)tmp1DataBuff
{
  return self->_tmp1DataBuff;
}

- (void)setTmp1DataBuff:(id)a3
{
  self->_tmp1DataBuff = (NSMutableData *)a3;
}

- (int)tmp1DataBuffSize
{
  return self->_tmp1DataBuffSize;
}

- (void)setTmp1DataBuffSize:(int)a3
{
  self->_tmp1DataBuffSize = a3;
}

- (NSMutableData)tmp2DataBuff
{
  return self->_tmp2DataBuff;
}

- (void)setTmp2DataBuff:(id)a3
{
  self->_tmp2DataBuff = (NSMutableData *)a3;
}

- (int)tmp2DataBuffSize
{
  return self->_tmp2DataBuffSize;
}

- (void)setTmp2DataBuffSize:(int)a3
{
  self->_tmp2DataBuffSize = a3;
}

- (NSMutableData)tmp3DataBuff
{
  return self->_tmp3DataBuff;
}

- (void)setTmp3DataBuff:(id)a3
{
  self->_tmp3DataBuff = (NSMutableData *)a3;
}

- (int)tmp3DataBuffSize
{
  return self->_tmp3DataBuffSize;
}

- (void)setTmp3DataBuffSize:(int)a3
{
  self->_tmp3DataBuffSize = a3;
}

- (OpaqueFFTSetupD)fftContext
{
  return self->_fftContext;
}

- (void)setFftContext:(OpaqueFFTSetupD *)a3
{
  self->_fftContext = a3;
}

@end