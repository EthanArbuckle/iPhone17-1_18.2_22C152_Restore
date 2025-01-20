@interface AXMOscillator
- (AXMOscillator)fmTarget;
- (AXMOscillator)initWithDictionary:(id)a3;
- (AXMOscillator)initWithParameters:(id)a3 parentSynth:(id)a4;
- (AXMOscillator)rootOscillator;
- (AXMOscillatorADSREnvelope)envelope;
- (AXMSynth)parentSynth;
- (AXMSynthOscillatorParameters)parameters;
- (BOOL)isBypassed;
- (BOOL)isUsingFM;
- (NSArray)fmOperatorIdentifiers;
- (NSArray)fmOperators;
- (NSString)description;
- (NSString)displayName;
- (NSString)fmTargetIdentifier;
- (NSString)identifier;
- (double)getNextSample;
- (double)sampleBuffer;
- (double)startTime;
- (float)baseFrequency;
- (float)currentPhase;
- (float)fmRootFrequencyRatio;
- (float)frequencyRatio;
- (float)gain;
- (float)lowpassCutoff;
- (float)phaseIncrement;
- (float)rootFrequency;
- (float)sampleRate;
- (id)dictionaryRepresentation;
- (int64_t)detuning;
- (int64_t)waveform;
- (void)dealloc;
- (void)routeTo:(id)a3;
- (void)setCurrentPhase:(float)a3;
- (void)setDetuning:(int64_t)a3;
- (void)setFmTarget:(id)a3;
- (void)setFrequencyRatio:(float)a3;
- (void)setGain:(float)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsBypassed:(BOOL)a3;
- (void)setLowpassCutoff:(float)a3;
- (void)setParameters:(id)a3;
- (void)setParentSynth:(id)a3;
- (void)setSampleBuffer:(double *)a3;
- (void)setStartTime:(double)a3;
- (void)setWaveform:(int64_t)a3;
- (void)start;
- (void)stop;
- (void)updateCache;
@end

@implementation AXMOscillator

- (void)updateCache
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(AXMOscillator *)self fmOperators];
  cachedFMOperators = self->_cachedFMOperators;
  self->_cachedFMOperators = v3;

  [(AXMOscillator *)self sampleRate];
  self->_cachedSampleRate = v5;
  [(AXMOscillator *)self gain];
  self->_cachedGain = v6;
  [(AXMOscillator *)self baseFrequency];
  self->_cachedBaseFrequency = v7;
  [(AXMOscillator *)self frequencyRatio];
  self->_cachedFrequencyRatio = v8;
  self->_cachedWaveform = [(AXMOscillator *)self waveform];
  self->_cachedIsBypassed = [(AXMOscillator *)self isBypassed];
  v9 = [(AXMOscillator *)self envelope];
  self->_cachedEnvelopeIsBypassed = [v9 isBypassed];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v10 = self->_cachedFMOperators;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "updateCache", (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (AXMOscillator)initWithParameters:(id)a3 parentSynth:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXMOscillator;
  v9 = [(AXMOscillator *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_parentSynth, v8);
    objc_storeStrong((id *)&v10->_parameters, a3);
    v10->_sampleBuffer = (double *)malloc_type_malloc(0x8000uLL, 0x100004000313F17uLL);
    uint64_t v11 = [AXMOscillatorADSREnvelope alloc];
    uint64_t v12 = [v7 envelopeParameters];
    uint64_t v13 = [(AXMOscillatorADSREnvelope *)v11 initWithParameters:v12 parentSynth:v8];
    envelope = v10->_envelope;
    v10->_envelope = (AXMOscillatorADSREnvelope *)v13;
  }
  return v10;
}

- (AXMOscillator)initWithDictionary:(id)a3
{
  id v4 = a3;
  float v5 = [v4 objectForKeyedSubscript:@"kSynthParameterDetuning"];
  -[AXMOscillator setDetuning:](self, "setDetuning:", (int)[v5 intValue]);

  float v6 = [v4 objectForKeyedSubscript:@"kSynthParameterLowpassCutoff"];
  [v6 floatValue];
  -[AXMOscillator setLowpassCutoff:](self, "setLowpassCutoff:");

  id v7 = [v4 objectForKeyedSubscript:@"kSynthParameterFrequencyRatio"];
  [v7 floatValue];
  -[AXMOscillator setFrequencyRatio:](self, "setFrequencyRatio:");

  id v8 = [v4 objectForKeyedSubscript:@"kSynthParameterWaveform"];
  -[AXMOscillator setWaveform:](self, "setWaveform:", (int)[v8 intValue]);

  v9 = [v4 objectForKeyedSubscript:@"kSynthParameterIdentifier"];
  v10 = [v9 stringValue];
  [(AXMOscillator *)self setIdentifier:v10];

  uint64_t v11 = [v4 objectForKeyedSubscript:@"kSynthParameterBypass"];
  -[AXMOscillator setIsBypassed:](self, "setIsBypassed:", [v11 BOOLValue]);

  uint64_t v12 = [v4 objectForKeyedSubscript:@"kSynthParameterADSREnvelope"];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"kSynthParameterEnvelopeAttackTime"];
  [v13 floatValue];
  int v15 = v14;
  objc_super v16 = [(AXMOscillator *)self envelope];
  LODWORD(v17) = v15;
  [v16 setAttackMS:v17];

  v18 = [v12 objectForKeyedSubscript:@"kSynthParameterEnvelopeAttackLevel"];
  [v18 floatValue];
  int v20 = v19;
  v21 = [(AXMOscillator *)self envelope];
  LODWORD(v22) = v20;
  [v21 setAttackLevel:v22];

  v23 = [v12 objectForKeyedSubscript:@"kSynthParameterEnvelopeReleaseTime"];
  [v23 floatValue];
  int v25 = v24;
  v26 = [(AXMOscillator *)self envelope];
  LODWORD(v27) = v25;
  [v26 setReleaseMS:v27];

  v28 = [v12 objectForKeyedSubscript:@"kSynthParameterEnvelopeSustainLevel"];
  [v28 floatValue];
  int v30 = v29;
  v31 = [(AXMOscillator *)self envelope];
  LODWORD(v32) = v30;
  [v31 setSustainLevel:v32];

  v33 = [v12 objectForKeyedSubscript:@"kSynthParameterEnvelopeDecayTime"];
  [v33 floatValue];
  int v35 = v34;
  v36 = [(AXMOscillator *)self envelope];
  LODWORD(v37) = v35;
  [v36 setDecayMS:v37];

  v38 = [v4 objectForKeyedSubscript:@"kSynthParameterFMOperatorIdentifiers"];
  if ([v38 count])
  {
    v39 = [(AXMOscillator *)self parentSynth];
    v40 = [v38 firstObject];
    v41 = [v39 oscillatorWithIdentifier:v40];

    [v41 routeTo:self];
  }

  return self;
}

- (id)dictionaryRepresentation
{
  v2 = [(AXMOscillator *)self parameters];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (void)dealloc
{
  free(self->_sampleBuffer);
  v3.receiver = self;
  v3.super_class = (Class)AXMOscillator;
  [(AXMOscillator *)&v3 dealloc];
}

- (void)start
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
  envelope = self->_envelope;

  [(AXMOscillatorADSREnvelope *)envelope activate];
}

- (void)routeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(AXMOscillator *)self parameters];
  float v5 = [v6 parameters];
  [v4 routeTo:v5];
}

- (void)stop
{
  self->_startTime = 0.0;
  [(AXMOscillatorADSREnvelope *)self->_envelope deactivate];
}

- (NSArray)fmOperators
{
  objc_super v3 = [(AXMOscillator *)self parentSynth];
  id v4 = [(AXMOscillator *)self fmOperatorIdentifiers];
  float v5 = [v3 oscillatorsWithIdentifiers:v4];

  return (NSArray *)v5;
}

- (AXMOscillator)fmTarget
{
  objc_super v3 = [(AXMOscillator *)self parentSynth];
  id v4 = [(AXMOscillator *)self fmTargetIdentifier];
  float v5 = [v3 oscillatorWithIdentifier:v4];

  return (AXMOscillator *)v5;
}

- (double)getNextSample
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double result = 0.0;
  if (!self->_cachedIsBypassed)
  {
    id v4 = self->_cachedFMOperators;
    uint64_t v5 = [(NSArray *)v4 count];
    if (v5)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = v4;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v26;
        float v9 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v26 != v8) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "getNextSample", (void)v25);
            float v9 = v11 + v9;
          }
          uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v7);
      }
      else
      {
        float v9 = 0.0;
      }
    }
    else
    {
      float v9 = 0.0;
    }
    [(AXMOscillator *)self baseFrequency];
    float v13 = v12;
    [(AXMOscillator *)self fmRootFrequencyRatio];
    float v15 = v13 * v14;
    if (v5)
    {
      float v16 = v15 + v9 * 1000.0;
      float v17 = v16;
    }
    else
    {
      float v17 = v15;
    }
    float cachedSampleRate = self->_cachedSampleRate;
    float cachedGain = self->_cachedGain;
    switch(self->_cachedWaveform)
    {
      case 0:
        double v20 = sin(self->_currentPhase * 6.28318531);
        goto LABEL_25;
      case 1:
        double v20 = fabs(fmod(self->_currentPhase, 1.0) * 2.0 + -1.0) * 2.0 + -1.0;
        goto LABEL_25;
      case 2:
        double v20 = 1.0;
        if (self->_currentPhase > 0.5) {
          double v20 = 0.0;
        }
        goto LABEL_25;
      case 3:
        double v20 = fmod(self->_currentPhase, 1.0);
LABEL_25:
        float v21 = v20 * cachedGain;
        break;
      case 4:
        float v21 = cachedGain * (float)((float)rand() * 4.6566e-10);
        break;
      default:
        float v21 = 0.0;
        break;
    }
    float v22 = 1.0 / cachedSampleRate * v17;
    float v23 = self->_currentPhase + v22;
    if (v23 > 1.0) {
      float v23 = v23 + -1.0;
    }
    self->_currentPhase = v23;
    if (!self->_cachedEnvelopeIsBypassed)
    {
      [(AXMOscillatorADSREnvelope *)self->_envelope getNextSample];
      float v21 = v24 * v21;
    }

    return v21;
  }
  return result;
}

- (float)fmRootFrequencyRatio
{
  [(AXMOscillator *)self frequencyRatio];
  float v4 = v3;
  uint64_t v5 = [(AXMOscillator *)self parameters];
  id v6 = [v5 fmTargetParameters];

  if (v6)
  {
    do
    {
      [v6 frequencyRatio];
      float v8 = v7;
      uint64_t v9 = [v6 fmTargetParameters];
      float v4 = v4 * v8;

      id v6 = (void *)v9;
    }
    while (v9);
  }
  return v4;
}

- (NSString)identifier
{
  v2 = [(AXMOscillator *)self parameters];
  float v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)setIdentifier:(id)a3
{
  id v5 = a3;
  float v4 = [(AXMOscillator *)self parameters];
  [v4 setIdentifier:v5];
}

- (int64_t)waveform
{
  v2 = [(AXMOscillator *)self parameters];
  int64_t v3 = [v2 waveform];

  return v3;
}

- (void)setWaveform:(int64_t)a3
{
  id v4 = [(AXMOscillator *)self parameters];
  [v4 setWaveform:a3];
}

- (float)sampleRate
{
  v2 = [(AXMOscillator *)self parameters];
  [v2 sampleRate];
  float v4 = v3;

  return v4;
}

- (float)baseFrequency
{
  v2 = [(AXMOscillator *)self parameters];
  [v2 baseFrequency];
  float v4 = v3;

  return v4;
}

- (float)frequencyRatio
{
  v2 = [(AXMOscillator *)self parameters];
  [v2 frequencyRatio];
  float v4 = v3;

  return v4;
}

- (void)setFrequencyRatio:(float)a3
{
  id v5 = [(AXMOscillator *)self parameters];
  *(float *)&double v4 = a3;
  [v5 setFrequencyRatio:v4];
}

- (NSArray)fmOperatorIdentifiers
{
  v2 = [(AXMOscillator *)self parameters];
  float v3 = [v2 fmOperatorIdentifiers];

  return (NSArray *)v3;
}

- (NSString)fmTargetIdentifier
{
  v2 = [(AXMOscillator *)self parameters];
  float v3 = [v2 fmTargetIdentifier];

  return (NSString *)v3;
}

- (float)gain
{
  v2 = [(AXMOscillator *)self parameters];
  [v2 gain];
  float v4 = v3;

  return v4;
}

- (void)setGain:(float)a3
{
  id v5 = [(AXMOscillator *)self parameters];
  *(float *)&double v4 = a3;
  [v5 setGain:v4];
}

- (int64_t)detuning
{
  v2 = [(AXMOscillator *)self parameters];
  int64_t v3 = [v2 detuning];

  return v3;
}

- (void)setDetuning:(int64_t)a3
{
  id v4 = [(AXMOscillator *)self parameters];
  [v4 setDetuning:a3];
}

- (BOOL)isBypassed
{
  v2 = [(AXMOscillator *)self parameters];
  char v3 = [v2 isBypassed];

  return v3;
}

- (void)setIsBypassed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AXMOscillator *)self parameters];
  [v4 setIsBypassed:v3];
}

- (NSString)displayName
{
  v2 = [(AXMOscillator *)self parameters];
  BOOL v3 = [v2 displayName];

  return (NSString *)v3;
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(AXMOscillator *)self displayName];
  id v6 = [v3 stringWithFormat:@"<%@ %p name=%@>", v4, self, v5];

  return (NSString *)v6;
}

- (AXMSynth)parentSynth
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSynth);

  return (AXMSynth *)WeakRetained;
}

- (void)setParentSynth:(id)a3
{
}

- (AXMSynthOscillatorParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (BOOL)isUsingFM
{
  return self->_isUsingFM;
}

- (AXMOscillatorADSREnvelope)envelope
{
  return self->_envelope;
}

- (void)setFmTarget:(id)a3
{
}

- (float)lowpassCutoff
{
  return self->_lowpassCutoff;
}

- (void)setLowpassCutoff:(float)a3
{
  self->_lowpassCutoff = a3;
}

- (float)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(float)a3
{
  self->_currentPhase = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (float)phaseIncrement
{
  return self->_phaseIncrement;
}

- (double)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(double *)a3
{
  self->_sampleBuffer = a3;
}

- (AXMOscillator)rootOscillator
{
  return self->_rootOscillator;
}

- (float)rootFrequency
{
  return self->_rootFrequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootOscillator, 0);
  objc_destroyWeak((id *)&self->_fmTarget);
  objc_storeStrong((id *)&self->_envelope, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_destroyWeak((id *)&self->_parentSynth);

  objc_storeStrong((id *)&self->_cachedFMOperators, 0);
}

@end