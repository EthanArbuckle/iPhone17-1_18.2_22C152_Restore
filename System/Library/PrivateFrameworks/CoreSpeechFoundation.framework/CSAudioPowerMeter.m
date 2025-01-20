@interface CSAudioPowerMeter
- (CSAudioPowerMeter)initWithSampleRate:(float)a3;
- (double)_ampToDB:(double)a3;
- (double)_linearToDB:(double)a3;
- (double)getAveragePowerDB;
- (double)getPeakPowerDB;
- (void)_reset;
- (void)_savePeaks:(int)a3 averagePower:(int)a4 maxSample:(int)a5;
- (void)_scaleDecayConstants:(int)a3;
- (void)_zapgremlins:(double *)a3;
- (void)processFloatBuffer:(const float *)a3 stride:(int)a4 inFrameToProcess:(int)a5;
- (void)processShortBuffer:(const signed __int16 *)a3 stride:(int)a4 inFrameToProcess:(int)a5;
@end

@implementation CSAudioPowerMeter

- (void).cxx_destruct
{
}

- (void)_zapgremlins:(double *)a3
{
  double v3 = *a3;
  double v4 = fabs(*a3);
  if (v4 >= 1.0e15 || v4 <= 1.0e-15) {
    double v3 = 0.0;
  }
  *a3 = v3;
}

- (double)_linearToDB:(double)a3
{
  if (a3 <= 0.000001) {
    return -120.0;
  }
  -[CSAudioPowerMeter _ampToDB:](self, "_ampToDB:");
  return result;
}

- (double)_ampToDB:(double)a3
{
  return log10(a3) * 20.0;
}

- (double)getAveragePowerDB
{
  [(CSAudioPowerMeter *)self _linearToDB:self->_averagePowerPeak];
  return result;
}

- (double)getPeakPowerDB
{
  [(CSAudioPowerMeter *)self _linearToDB:self->_maxPeak];
  return result;
}

- (void)_savePeaks:(int)a3 averagePower:(int)a4 maxSample:(int)a5
{
  float v5 = (double)a5 * 0.0000305175781;
  self->_averagePowerI = a4;
  BOOL instantaneousMode = self->_instantaneousMode;
  if (self->_instantaneousMode)
  {
    double v7 = v5;
  }
  else
  {
    double peak = self->_peak;
    double v7 = v5;
    if (peak > v7) {
      double v7 = peak + (v7 - peak) * self->_decay;
    }
  }
  self->_double peak = v7;
  int v9 = self->_peakHoldCount + a3;
  self->_peakHoldCount = v9;
  double maxPeak = self->_maxPeak;
  if (v9 >= (int)(self->_sampleRate * 0.907029478))
  {
    double maxPeak = maxPeak - maxPeak * self->_peakDecay;
    self->_double maxPeak = maxPeak;
  }
  double v11 = sqrt((double)a4 * 9.31322575e-10);
  if (maxPeak < v7)
  {
    self->_double maxPeak = v7;
    self->_peakHoldCount = 0;
    double maxPeak = v7;
  }
  double v12 = v11 * 1.41421356;
  if (!instantaneousMode)
  {
    double averagePowerPeak = self->_averagePowerPeak;
    if (averagePowerPeak > v12) {
      double v12 = averagePowerPeak + (v12 - averagePowerPeak) * self->_decay;
    }
  }
  self->_double averagePowerPeak = v12;
  if (v12 > maxPeak) {
    self->_double averagePowerPeak = maxPeak;
  }
}

- (void)processFloatBuffer:(const float *)a3 stride:(int)a4 inFrameToProcess:(int)a5
{
  if (a5 < 1) {
    return;
  }
  [(CSAudioPowerMeter *)self _scaleDecayConstants:*(void *)&a5];
  double averagePowerF = self->_averagePowerF;
  unsigned int v11 = a5 + 1;
  float v12 = 0.0;
  do
  {
    float v13 = *a3;
    if (*a3 < 0.0) {
      float v13 = -*a3;
    }
    if (v13 > v12) {
      float v12 = v13;
    }
    double averagePowerF = averagePowerF + ((float)(v13 * v13) - averagePowerF) * 0.03;
    a3 += a4;
    --v11;
  }
  while (v11 > 1);
  [(CSAudioUnitMeterClipping *)self->_clipping peakValueSinceLastCall];
  if (v12 > *(float *)&v14)
  {
    *(float *)&double v14 = v12;
    [(CSAudioUnitMeterClipping *)self->_clipping setPeakValueSinceLastCall:v14];
  }
  int v15 = __fpclassifyd(averagePowerF);
  if (v15 == 2)
  {
    [(CSAudioUnitMeterClipping *)self->_clipping setSawInfinity:1];
    goto LABEL_15;
  }
  if (v15 == 1)
  {
    [(CSAudioUnitMeterClipping *)self->_clipping setSawNotANumber:1];
LABEL_15:
    float v12 = 1.0;
    double averagePowerF = 0.0;
  }
  self->_double averagePowerF = averagePowerF;
  BOOL instantaneousMode = self->_instantaneousMode;
  if (self->_instantaneousMode)
  {
    double v17 = v12;
  }
  else
  {
    double peak = self->_peak;
    double v17 = v12;
    if (peak > v12) {
      double v17 = peak + (v17 - peak) * self->_decay;
    }
  }
  self->_double peak = v17;
  double maxPeak = self->_maxPeak;
  int v20 = self->_peakHoldCount + a5;
  self->_peakHoldCount = v20;
  if (v20 >= (int)(self->_sampleRate * 0.907029478))
  {
    double maxPeak = maxPeak - maxPeak * self->_peakDecay;
    self->_double maxPeak = maxPeak;
  }
  double v21 = sqrt(averagePowerF);
  if (maxPeak < v17)
  {
    self->_double maxPeak = v17;
    self->_peakHoldCount = 0;
    double maxPeak = v17;
  }
  double v22 = v21 * 1.41421356;
  if (!instantaneousMode)
  {
    double averagePowerPeak = self->_averagePowerPeak;
    if (averagePowerPeak > v22) {
      double v22 = averagePowerPeak + (v22 - averagePowerPeak) * self->_decay;
    }
  }
  self->_double averagePowerPeak = v22;
  if (v22 > maxPeak) {
    self->_double averagePowerPeak = maxPeak;
  }
  [(CSAudioPowerMeter *)self _zapgremlins:&self->_averagePowerF];
  [(CSAudioPowerMeter *)self _zapgremlins:&self->_averagePowerPeak];
  [(CSAudioPowerMeter *)self _zapgremlins:&self->_peak];
  [(CSAudioPowerMeter *)self _zapgremlins:&self->_maxPeak];
}

- (void)processShortBuffer:(const signed __int16 *)a3 stride:(int)a4 inFrameToProcess:(int)a5
{
  if (a5 >= 1)
  {
    uint64_t v6 = *(void *)&a5;
    [(CSAudioPowerMeter *)self _scaleDecayConstants:*(void *)&a5];
    LODWORD(v10) = 0;
    LODWORD(v11) = self->_averagePowerI;
    unsigned int v12 = v6 + 1;
    do
    {
      int v13 = *a3;
      if (v13 < 0) {
        int v13 = -v13;
      }
      if ((int)v10 <= v13) {
        uint64_t v10 = v13;
      }
      else {
        uint64_t v10 = v10;
      }
      uint64_t v11 = (v11 + ((v13 * v13 - (int)v11) >> 5));
      --v12;
      a3 += a4;
    }
    while (v12 > 1);
    [(CSAudioPowerMeter *)self _savePeaks:v6 averagePower:v11 maxSample:v10];
  }
}

- (void)_scaleDecayConstants:(int)a3
{
  if (self->_previousBlockSize != a3)
  {
    long double v5 = (double)a3;
    self->_peakDecay = 1.0 - pow(self->_peakDecay1, (double)a3);
    self->_decay = 1.0 - pow(self->_decay1, v5);
    self->_previousBlockSize = a3;
  }
}

- (void)_reset
{
  *(_OWORD *)&self->_decay1 = xmmword_1BA25E730;
  self->_averagePowerI = 0;
  self->_double averagePowerF = 0.0;
  self->_peakHoldCount = 0;
  self->_previousBlockSize = 0;
  self->_double averagePowerPeak = 0.0;
  self->_double peak = 0.0;
  self->_double maxPeak = 0.0;
  self->_BOOL instantaneousMode = 1;
}

- (CSAudioPowerMeter)initWithSampleRate:(float)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSAudioPowerMeter;
  double v4 = [(CSAudioPowerMeter *)&v7 init];
  long double v5 = v4;
  if (v4)
  {
    [(CSAudioPowerMeter *)v4 _reset];
    v5->_sampleRate = a3;
  }
  return v5;
}

@end