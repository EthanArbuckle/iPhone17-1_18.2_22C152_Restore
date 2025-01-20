@interface AXMOscillatorADSREnvelope
- (AXMOscillatorADSREnvelope)initWithParameters:(id)a3 parentSynth:(id)a4;
- (AXMSynth)parentSynth;
- (AXMSynthEnvelopeParameters)parameters;
- (BOOL)isActive;
- (BOOL)isBypassed;
- (BOOL)shouldSustain;
- (double)getNextSample;
- (double)sampleBuffer;
- (double)sampleRate;
- (double)sustainEndTime;
- (float)attackLevel;
- (float)attackMS;
- (float)decayMS;
- (float)releaseMS;
- (float)sustainLevel;
- (unint64_t)currentSampleIndex;
- (unint64_t)releasePhaseSampleIndex;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)setAttackLevel:(float)a3;
- (void)setAttackTime:(float)a3;
- (void)setCurrentSampleIndex:(unint64_t)a3;
- (void)setDecayTime:(float)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsBypassed:(BOOL)a3;
- (void)setParameters:(id)a3;
- (void)setParentSynth:(id)a3;
- (void)setReleasePhaseSampleIndex:(unint64_t)a3;
- (void)setReleaseTime:(float)a3;
- (void)setShouldSustain:(BOOL)a3;
- (void)setSustainEndTime:(double)a3;
- (void)setSustainLevel:(float)a3;
@end

@implementation AXMOscillatorADSREnvelope

- (AXMOscillatorADSREnvelope)initWithParameters:(id)a3 parentSynth:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXMOscillatorADSREnvelope;
  v9 = [(AXMOscillatorADSREnvelope *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_parentSynth, v8);
    objc_storeStrong((id *)&v10->_parameters, a3);
    v10->_currentSampleIndex = 0;
    v10->_sampleBuffer = (double *)malloc_type_malloc(0x8000uLL, 0x100004000313F17uLL);
    objc_storeStrong((id *)&v10->_parameters, a3);
    v11 = [v8 parameters];
    [(AXMSynthEnvelopeParameters *)v10->_parameters setMainParameters:v11];
  }
  return v10;
}

- (void)dealloc
{
  free(self->_sampleBuffer);
  v3.receiver = self;
  v3.super_class = (Class)AXMOscillatorADSREnvelope;
  [(AXMOscillatorADSREnvelope *)&v3 dealloc];
}

- (void)activate
{
  [(AXMOscillatorADSREnvelope *)self sustainLevel];
  self->_shouldSustain = v3 > 0.0;
  self->_currentSampleIndex = 0;
}

- (void)deactivate
{
  self->_sustainEndTime = CFAbsoluteTimeGetCurrent();
  self->_shouldSustain = 0;
  self->_releasePhaseSampleIndex = 0;
}

- (double)getNextSample
{
  [(AXMOscillatorADSREnvelope *)self sampleRate];
  float v4 = v3;
  [(AXMOscillatorADSREnvelope *)self attackMS];
  float v6 = v5;
  double v7 = v4;
  [(AXMOscillatorADSREnvelope *)self decayMS];
  float v9 = v8;
  [(AXMOscillatorADSREnvelope *)self releaseMS];
  unint64_t v11 = (unint64_t)(v10 / 1000.0 * v7);
  unint64_t releasePhaseSampleIndex = self->_releasePhaseSampleIndex;
  if (releasePhaseSampleIndex < v11 || self->_shouldSustain)
  {
    unint64_t v13 = (unint64_t)(v6 / 1000.0 * v7);
    unint64_t currentSampleIndex = self->_currentSampleIndex;
    if (currentSampleIndex >= v13)
    {
      unint64_t v17 = (unint64_t)(v9 / 1000.0 * v7);
      if (currentSampleIndex >= v17 + v13)
      {
        if (!self->_shouldSustain)
        {
          double result = 0.0;
          if (releasePhaseSampleIndex < v11)
          {
            float v23 = (float)releasePhaseSampleIndex;
            float v24 = (float)v11;
            [(AXMOscillatorADSREnvelope *)self sustainLevel];
            float v26 = v25;
            [(AXMOscillatorADSREnvelope *)self sustainLevel];
            double result = (float)(v26 + (float)((float)((float)-v23 / v24) * v27));
            ++self->_releasePhaseSampleIndex;
          }
          goto LABEL_10;
        }
        [(AXMOscillatorADSREnvelope *)self sustainLevel];
      }
      else
      {
        float v18 = (float)(currentSampleIndex - v13) / (float)v17;
        [(AXMOscillatorADSREnvelope *)self attackLevel];
        float v20 = v19;
        [(AXMOscillatorADSREnvelope *)self sustainLevel];
        float v16 = v20 + (float)(v18 * (float)(v21 - v20));
      }
    }
    else
    {
      [(AXMOscillatorADSREnvelope *)self attackLevel];
      float v16 = (float)(v15 * (float)self->_currentSampleIndex) / (float)v13;
    }
    double result = v16;
LABEL_10:
    ++self->_currentSampleIndex;
    return result;
  }
  return 0.0;
}

- (double)sampleRate
{
  v2 = [(AXMOscillatorADSREnvelope *)self parameters];
  [v2 sampleRate];
  double v4 = v3;

  return v4;
}

- (float)attackMS
{
  v2 = [(AXMOscillatorADSREnvelope *)self parameters];
  [v2 attackMS];
  float v4 = v3;

  return v4;
}

- (void)setAttackTime:(float)a3
{
  id v5 = [(AXMOscillatorADSREnvelope *)self parameters];
  *(float *)&double v4 = a3;
  [v5 setAttackMS:v4];
}

- (float)attackLevel
{
  v2 = [(AXMOscillatorADSREnvelope *)self parameters];
  [v2 attackLevel];
  float v4 = v3;

  return v4;
}

- (void)setAttackLevel:(float)a3
{
  id v5 = [(AXMOscillatorADSREnvelope *)self parameters];
  *(float *)&double v4 = a3;
  [v5 setAttackLevel:v4];
}

- (float)decayMS
{
  v2 = [(AXMOscillatorADSREnvelope *)self parameters];
  [v2 decayMS];
  float v4 = v3;

  return v4;
}

- (void)setDecayTime:(float)a3
{
  id v5 = [(AXMOscillatorADSREnvelope *)self parameters];
  *(float *)&double v4 = a3;
  [v5 setDecayMS:v4];
}

- (float)sustainLevel
{
  v2 = [(AXMOscillatorADSREnvelope *)self parameters];
  [v2 sustainLevel];
  float v4 = v3;

  return v4;
}

- (void)setSustainLevel:(float)a3
{
  id v5 = [(AXMOscillatorADSREnvelope *)self parameters];
  *(float *)&double v4 = a3;
  [v5 setSustainLevel:v4];
}

- (float)releaseMS
{
  v2 = [(AXMOscillatorADSREnvelope *)self parameters];
  [v2 releaseMS];
  float v4 = v3;

  return v4;
}

- (void)setReleaseTime:(float)a3
{
  id v5 = [(AXMOscillatorADSREnvelope *)self parameters];
  *(float *)&double v4 = a3;
  [v5 setReleaseMS:v4];
}

- (AXMSynth)parentSynth
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSynth);

  return (AXMSynth *)WeakRetained;
}

- (void)setParentSynth:(id)a3
{
}

- (AXMSynthEnvelopeParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (BOOL)isBypassed
{
  return self->_isBypassed;
}

- (void)setIsBypassed:(BOOL)a3
{
  self->_isBypassed = a3;
}

- (double)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unint64_t)currentSampleIndex
{
  return self->_currentSampleIndex;
}

- (void)setCurrentSampleIndex:(unint64_t)a3
{
  self->_unint64_t currentSampleIndex = a3;
}

- (BOOL)shouldSustain
{
  return self->_shouldSustain;
}

- (void)setShouldSustain:(BOOL)a3
{
  self->_shouldSustain = a3;
}

- (double)sustainEndTime
{
  return self->_sustainEndTime;
}

- (void)setSustainEndTime:(double)a3
{
  self->_sustainEndTime = a3;
}

- (unint64_t)releasePhaseSampleIndex
{
  return self->_releasePhaseSampleIndex;
}

- (void)setReleasePhaseSampleIndex:(unint64_t)a3
{
  self->_unint64_t releasePhaseSampleIndex = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_destroyWeak((id *)&self->_parentSynth);
}

@end