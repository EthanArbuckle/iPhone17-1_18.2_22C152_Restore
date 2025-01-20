@interface AXMSynthMainParameters
+ (id)defaultParameters;
- (AXMSynthMainParameters)init;
- (AXMSynthOscillatorParameters)fmOperatorAParams;
- (AXMSynthOscillatorParameters)fmOperatorBParams;
- (AXMSynthOscillatorParameters)fmOperatorCParams;
- (AXMSynthOscillatorParameters)fmOperatorDParams;
- (AXMSynthOscillatorParameters)mainOsc1Params;
- (AXMSynthOscillatorParameters)mainOsc2Params;
- (AXMSynthOscillatorParameters)mainOsc3Params;
- (NSArray)allOperatorParameters;
- (NSArray)allOscillatorParameters;
- (float)baseFrequency;
- (float)mainVolume;
- (float)sampleRate;
- (id)description;
- (id)dictionaryRepresentation;
- (id)oscillatorParametersWithIdentifier:(id)a3;
- (id)oscillatorParametersWithIdentifiers:(id)a3;
- (void)addSupportedParameters;
- (void)setBaseFrequency:(float)a3;
- (void)setFmOperatorAParams:(id)a3;
- (void)setFmOperatorBParams:(id)a3;
- (void)setFmOperatorCParams:(id)a3;
- (void)setFmOperatorDParams:(id)a3;
- (void)setMainOsc1Params:(id)a3;
- (void)setMainOsc2Params:(id)a3;
- (void)setMainOsc3Params:(id)a3;
- (void)setMainVolume:(float)a3;
- (void)setSampleRate:(float)a3;
@end

@implementation AXMSynthMainParameters

- (AXMSynthMainParameters)init
{
  v18.receiver = self;
  v18.super_class = (Class)AXMSynthMainParameters;
  v2 = [(AXMSynthObservableParameters *)&v18 init];
  if (v2)
  {
    uint64_t v3 = +[AXMSynthOscillatorParameters defaultParameters];
    mainOsc1Params = v2->_mainOsc1Params;
    v2->_mainOsc1Params = (AXMSynthOscillatorParameters *)v3;

    uint64_t v5 = +[AXMSynthOscillatorParameters defaultParameters];
    mainOsc2Params = v2->_mainOsc2Params;
    v2->_mainOsc2Params = (AXMSynthOscillatorParameters *)v5;

    uint64_t v7 = +[AXMSynthOscillatorParameters defaultParameters];
    mainOsc3Params = v2->_mainOsc3Params;
    v2->_mainOsc3Params = (AXMSynthOscillatorParameters *)v7;

    uint64_t v9 = +[AXMSynthOscillatorParameters defaultParameters];
    fmOperatorAParams = v2->_fmOperatorAParams;
    v2->_fmOperatorAParams = (AXMSynthOscillatorParameters *)v9;

    uint64_t v11 = +[AXMSynthOscillatorParameters defaultParameters];
    fmOperatorBParams = v2->_fmOperatorBParams;
    v2->_fmOperatorBParams = (AXMSynthOscillatorParameters *)v11;

    uint64_t v13 = +[AXMSynthOscillatorParameters defaultParameters];
    fmOperatorCParams = v2->_fmOperatorCParams;
    v2->_fmOperatorCParams = (AXMSynthOscillatorParameters *)v13;

    uint64_t v15 = +[AXMSynthOscillatorParameters defaultParameters];
    fmOperatorDParams = v2->_fmOperatorDParams;
    v2->_fmOperatorDParams = (AXMSynthOscillatorParameters *)v15;

    [(AXMSynthOscillatorParameters *)v2->_mainOsc1Params setIdentifier:@"1"];
    [(AXMSynthOscillatorParameters *)v2->_mainOsc2Params setIdentifier:@"2"];
    [(AXMSynthOscillatorParameters *)v2->_mainOsc3Params setIdentifier:@"3"];
    [(AXMSynthOscillatorParameters *)v2->_fmOperatorAParams setIdentifier:@"A"];
    [(AXMSynthOscillatorParameters *)v2->_fmOperatorBParams setIdentifier:@"B"];
    [(AXMSynthOscillatorParameters *)v2->_fmOperatorCParams setIdentifier:@"C"];
    [(AXMSynthOscillatorParameters *)v2->_fmOperatorDParams setIdentifier:@"D"];
    [(AXMSynthOscillatorParameters *)v2->_mainOsc1Params setMainParameters:v2];
    [(AXMSynthOscillatorParameters *)v2->_mainOsc2Params setMainParameters:v2];
    [(AXMSynthOscillatorParameters *)v2->_mainOsc3Params setMainParameters:v2];
    [(AXMSynthOscillatorParameters *)v2->_fmOperatorAParams setMainParameters:v2];
    [(AXMSynthOscillatorParameters *)v2->_fmOperatorBParams setMainParameters:v2];
    [(AXMSynthOscillatorParameters *)v2->_fmOperatorCParams setMainParameters:v2];
    [(AXMSynthOscillatorParameters *)v2->_fmOperatorDParams setMainParameters:v2];
    [(AXMSynthOscillatorParameters *)v2->_mainOsc3Params setGain:0.0];
    [(AXMSynthOscillatorParameters *)v2->_mainOsc2Params setGain:0.0];
  }
  return v2;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)AXMSynthMainParameters;
  uint64_t v3 = [(AXMSynthObservableParameters *)&v18 dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(AXMSynthMainParameters *)self allOscillatorParameters];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 dictionaryRepresentation];
        uint64_t v11 = [v9 identifier];
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v4 copy];

  return v12;
}

- (NSArray)allOscillatorParameters
{
  v5[3] = *MEMORY[0x1E4F143B8];
  mainOsc2Params = self->_mainOsc2Params;
  v5[0] = self->_mainOsc1Params;
  v5[1] = mainOsc2Params;
  v5[2] = self->_mainOsc3Params;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];

  return (NSArray *)v3;
}

- (NSArray)allOperatorParameters
{
  v6[4] = *MEMORY[0x1E4F143B8];
  fmOperatorBParams = self->_fmOperatorBParams;
  v6[0] = self->_fmOperatorAParams;
  v6[1] = fmOperatorBParams;
  fmOperatorDParams = self->_fmOperatorDParams;
  v6[2] = self->_fmOperatorCParams;
  v6[3] = fmOperatorDParams;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];

  return (NSArray *)v4;
}

- (id)oscillatorParametersWithIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v6 = [(AXMSynthMainParameters *)self oscillatorParametersWithIdentifiers:v5];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (id)oscillatorParametersWithIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v12;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isEqualToString:@"1"])
        {
          v10 = [(AXMSynthMainParameters *)self mainOsc1Params];
          [v4 addObject:v10];
        }
        else if ([v9 isEqualToString:@"2"])
        {
          v10 = [(AXMSynthMainParameters *)self mainOsc2Params];
          [v4 addObject:v10];
        }
        else if ([v9 isEqualToString:@"3"])
        {
          v10 = [(AXMSynthMainParameters *)self mainOsc3Params];
          [v4 addObject:v10];
        }
        else if ([v9 isEqualToString:@"A"])
        {
          v10 = [(AXMSynthMainParameters *)self fmOperatorAParams];
          [v4 addObject:v10];
        }
        else if ([v9 isEqualToString:@"B"])
        {
          v10 = [(AXMSynthMainParameters *)self fmOperatorBParams];
          [v4 addObject:v10];
        }
        else if ([v9 isEqualToString:@"C"])
        {
          v10 = [(AXMSynthMainParameters *)self fmOperatorCParams];
          [v4 addObject:v10];
        }
        else
        {
          if (![v9 isEqualToString:@"D"]) {
            continue;
          }
          v10 = [(AXMSynthMainParameters *)self fmOperatorDParams];
          [v4 addObject:v10];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4;
}

- (float)sampleRate
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterSampleRate"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setSampleRate:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (float)baseFrequency
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterBaseFrequency"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setBaseFrequency:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (float)mainVolume
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterMainVolume"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setMainVolume:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (void)addSupportedParameters
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"kSynthParameterSampleRate";
  v4[1] = @"kSynthParameterMainVolume";
  v4[2] = @"kSynthParameterBaseFrequency";
  float v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  [(AXMSynthObservableParameters *)self addSupportedParameters:v3];
}

+ (id)defaultParameters
{
  v2 = objc_alloc_init(AXMSynthMainParameters);
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E940A0 forParameter:@"kSynthParameterMainVolume"];
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E940B0 forParameter:@"kSynthParameterBaseFrequency"];

  return v2;
}

- (id)description
{
  float v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(AXMSynthMainParameters *)self mainVolume];
  return (id)[v3 stringWithFormat:@"<%@ %p gain=%.2f\n\toscillators:\n\t\t%@\n\t\t%@\n\t\t%@\n\toperators:\n\t\t%@\n\t\t%@\n\t\t%@\n\t\t%@\n>", v4, self, v5, self->_mainOsc1Params, self->_mainOsc2Params, self->_mainOsc3Params, self->_fmOperatorAParams, self->_fmOperatorBParams, self->_fmOperatorCParams, self->_fmOperatorDParams];
}

- (AXMSynthOscillatorParameters)mainOsc1Params
{
  return self->_mainOsc1Params;
}

- (void)setMainOsc1Params:(id)a3
{
}

- (AXMSynthOscillatorParameters)mainOsc2Params
{
  return self->_mainOsc2Params;
}

- (void)setMainOsc2Params:(id)a3
{
}

- (AXMSynthOscillatorParameters)mainOsc3Params
{
  return self->_mainOsc3Params;
}

- (void)setMainOsc3Params:(id)a3
{
}

- (AXMSynthOscillatorParameters)fmOperatorAParams
{
  return self->_fmOperatorAParams;
}

- (void)setFmOperatorAParams:(id)a3
{
}

- (AXMSynthOscillatorParameters)fmOperatorBParams
{
  return self->_fmOperatorBParams;
}

- (void)setFmOperatorBParams:(id)a3
{
}

- (AXMSynthOscillatorParameters)fmOperatorCParams
{
  return self->_fmOperatorCParams;
}

- (void)setFmOperatorCParams:(id)a3
{
}

- (AXMSynthOscillatorParameters)fmOperatorDParams
{
  return self->_fmOperatorDParams;
}

- (void)setFmOperatorDParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmOperatorDParams, 0);
  objc_storeStrong((id *)&self->_fmOperatorCParams, 0);
  objc_storeStrong((id *)&self->_fmOperatorBParams, 0);
  objc_storeStrong((id *)&self->_fmOperatorAParams, 0);
  objc_storeStrong((id *)&self->_mainOsc3Params, 0);
  objc_storeStrong((id *)&self->_mainOsc2Params, 0);

  objc_storeStrong((id *)&self->_mainOsc1Params, 0);
}

@end