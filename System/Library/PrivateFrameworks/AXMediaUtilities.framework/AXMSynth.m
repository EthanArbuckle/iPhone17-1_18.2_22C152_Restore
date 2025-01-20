@interface AXMSynth
- (AXMADSREnvelope)envelope;
- (AXMOscillator)mainOperator;
- (AXMOscillator)mainOscillator;
- (AXMSynth)initWithSampleRate:(double)a3 envelope:(id)a4;
- (AXMSynthMainParameters)parameters;
- (double)baseFrequency;
- (double)gain;
- (double)getNextSample;
- (double)sampleBuffer;
- (double)sampleRate;
- (float)mainVolume;
- (id)oscillatorAndOperator;
- (id)oscillatorWithIdentifier:(id)a3;
- (id)oscillatorsWithIdentifiers:(id)a3;
- (void)bypassAllOperatorsAndOscillators;
- (void)bypassEnvelopes;
- (void)enumerateOscillatorsWithBlock:(id)a3;
- (void)loadPreset:(id)a3;
- (void)playNote:(float)a3;
- (void)releaseNote;
- (void)setBaseFrequency:(double)a3;
- (void)setGain:(double)a3;
- (void)setMainOperator:(id)a3;
- (void)setMainOscillator:(id)a3;
- (void)setMainVolume:(float)a3;
- (void)setParameters:(id)a3;
- (void)setSampleBuffer:(double *)a3;
- (void)setSampleRate:(double)a3;
@end

@implementation AXMSynth

- (AXMSynth)initWithSampleRate:(double)a3 envelope:(id)a4
{
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AXMSynth;
  v8 = [(AXMSynth *)&v23 init];
  if (v8)
  {
    uint64_t v9 = +[AXMSynthMainParameters defaultParameters];
    parameters = v8->_parameters;
    v8->_parameters = (AXMSynthMainParameters *)v9;

    *(float *)&double v11 = a3;
    [(AXMSynthMainParameters *)v8->_parameters setSampleRate:v11];
    objc_storeStrong((id *)&v8->_envelope, a4);
    v8->_gain = 0.707945784;
    v8->_sampleRate = a3;
    v12 = [AXMOscillator alloc];
    v13 = [(AXMSynthMainParameters *)v8->_parameters mainOsc1Params];
    uint64_t v14 = [(AXMOscillator *)v12 initWithParameters:v13 parentSynth:v8];
    mainOscillator = v8->_mainOscillator;
    v8->_mainOscillator = (AXMOscillator *)v14;

    v16 = [AXMOscillator alloc];
    v17 = [(AXMSynthMainParameters *)v8->_parameters fmOperatorAParams];
    uint64_t v18 = [(AXMOscillator *)v16 initWithParameters:v17 parentSynth:v8];
    mainOperator = v8->_mainOperator;
    v8->_mainOperator = (AXMOscillator *)v18;

    [(AXMOscillator *)v8->_mainOscillator setIsBypassed:0];
    [(AXMOscillator *)v8->_mainOscillator setWaveform:0];
    [(AXMOscillator *)v8->_mainOperator setIsBypassed:0];
    [(AXMOscillator *)v8->_mainOperator setWaveform:1];
    LODWORD(v20) = 0.5;
    [(AXMOscillator *)v8->_mainOperator setFrequencyRatio:v20];
    LODWORD(v21) = 1061997773;
    [(AXMOscillator *)v8->_mainOperator setGain:v21];
    [(AXMOscillator *)v8->_mainOperator routeTo:v8->_mainOscillator];
    v8->_sampleBuffer = (double *)malloc_type_malloc(0x8000uLL, 0x100004000313F17uLL);
  }

  return v8;
}

- (double)baseFrequency
{
  v2 = [(AXMSynth *)self parameters];
  v3 = [v2 getValueForParameter:@"kSynthParameterBaseFrequency"];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (void)setBaseFrequency:(double)a3
{
  id v5 = [(AXMSynth *)self parameters];
  float v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forParameter:@"kSynthParameterBaseFrequency"];
}

- (void)setSampleRate:(double)a3
{
  id v5 = [(AXMSynth *)self parameters];
  float v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forParameter:@"kSynthParameterSampleRate"];
}

- (float)mainVolume
{
  v2 = [(AXMSynth *)self parameters];
  v3 = [v2 getValueForParameter:@"kSynthParameterMainVolume"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setMainVolume:(float)a3
{
  id v6 = [(AXMSynth *)self parameters];
  *(float *)&double v4 = a3;
  float v5 = [NSNumber numberWithFloat:v4];
  [v6 setValue:v5 forParameter:@"kSynthParameterMainVolume"];
}

- (void)playNote:(float)a3
{
  [(AXMSynth *)self setBaseFrequency:a3];

  [(AXMSynth *)self enumerateOscillatorsWithBlock:&__block_literal_global_21];
}

uint64_t __21__AXMSynth_playNote___block_invoke(uint64_t a1, void *a2)
{
  return [a2 start];
}

- (void)releaseNote
{
}

uint64_t __23__AXMSynth_releaseNote__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

- (void)enumerateOscillatorsWithBlock:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v4 = (void (**)(id, void))a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  float v5 = [(AXMSynth *)self oscillatorAndOperator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)oscillatorAndOperator
{
  v5[2] = *MEMORY[0x1E4F143B8];
  mainOperator = self->_mainOperator;
  v5[0] = self->_mainOscillator;
  v5[1] = mainOperator;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

- (id)oscillatorWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  float v5 = [(AXMSynth *)self oscillatorAndOperator];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)oscillatorsWithIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  float v5 = [MEMORY[0x1E4F1CA48] array];
  [(AXMSynth *)self oscillatorAndOperator];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v11 = objc_msgSend(v10, "identifier", (void)v15);
        int v12 = [v4 containsObject:v11];

        if (v12) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  long long v13 = (void *)[v5 copy];

  return v13;
}

- (void)bypassAllOperatorsAndOscillators
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = [(AXMSynth *)self oscillatorAndOperator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setIsBypassed:1];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)bypassEnvelopes
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(AXMSynth *)self oscillatorAndOperator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        long long v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        long long v7 = [v6 envelope];
        [v7 setIsBypassed:1];

        [v6 updateCache];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (double)getNextSample
{
  [(AXMOscillator *)self->_mainOscillator getNextSample];
  if (v3 >= 1.0) {
    return 1.0;
  }
  mainOscillator = self->_mainOscillator;

  [(AXMOscillator *)mainOscillator getNextSample];
  return result;
}

- (void)loadPreset:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kSynthParameterMainVolume"];
  [v5 floatValue];
  -[AXMSynth setMainVolume:](self, "setMainVolume:");

  long long v6 = [v4 objectForKeyedSubscript:@"kSynthParameterBaseFrequency"];
  [v6 floatValue];
  [(AXMSynth *)self setBaseFrequency:v7];

  long long v8 = [v4 objectForKeyedSubscript:@"kSynthParameterSampleRate"];
  [v8 floatValue];
  [(AXMSynth *)self setSampleRate:v9];

  [(AXMSynth *)self bypassAllOperatorsAndOscillators];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"kSynthEnabledOscillators", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = [v14 valueForKey:@"kSynthParameterIdentifier"];
        long long v16 = [(AXMSynth *)self oscillatorWithIdentifier:v15];

        id v17 = v16;
        long long v18 = (void *)[v17 initWithDictionary:v14];

        [v18 setIsBypassed:0];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (AXMADSREnvelope)envelope
{
  return self->_envelope;
}

- (double)gain
{
  return self->_gain;
}

- (void)setGain:(double)a3
{
  self->_gain = a3;
}

- (AXMSynthMainParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (AXMOscillator)mainOscillator
{
  return self->_mainOscillator;
}

- (void)setMainOscillator:(id)a3
{
}

- (AXMOscillator)mainOperator
{
  return self->_mainOperator;
}

- (void)setMainOperator:(id)a3
{
}

- (double)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(double *)a3
{
  self->_sampleBuffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainOperator, 0);
  objc_storeStrong((id *)&self->_mainOscillator, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_envelope, 0);
}

@end