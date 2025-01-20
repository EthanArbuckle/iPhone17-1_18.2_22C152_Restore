@interface AXMSynthOscillatorParameters
+ (id)defaultParameters;
- (AXMSynthEnvelopeParameters)envelopeParameters;
- (AXMSynthMainParameters)mainParameters;
- (AXMSynthOscillatorParameters)fmTargetParameters;
- (AXMSynthOscillatorParameters)init;
- (BOOL)isBypassed;
- (NSArray)fmOperatorIdentifiers;
- (NSString)displayName;
- (NSString)fmTargetIdentifier;
- (NSString)identifier;
- (float)baseFrequency;
- (float)frequencyRatio;
- (float)gain;
- (float)lowpassCutoff;
- (float)sampleRate;
- (id)description;
- (int64_t)detuning;
- (int64_t)waveform;
- (void)addFmOperatorIdentifier:(id)a3;
- (void)addSupportedParameters;
- (void)removeFmOperatorIdentifier:(id)a3;
- (void)routeTo:(id)a3;
- (void)setBaseFrequency:(float)a3;
- (void)setDetuning:(int64_t)a3;
- (void)setFrequencyRatio:(float)a3;
- (void)setGain:(float)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsBypassed:(BOOL)a3;
- (void)setLowpassCutoff:(float)a3;
- (void)setMainParameters:(id)a3;
- (void)setWaveform:(int64_t)a3;
@end

@implementation AXMSynthOscillatorParameters

- (AXMSynthOscillatorParameters)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXMSynthOscillatorParameters;
  v2 = [(AXMSynthObservableParameters *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[AXMSynthEnvelopeParameters defaultParameters];
    envelopeParameters = v2->_envelopeParameters;
    v2->_envelopeParameters = (AXMSynthEnvelopeParameters *)v3;

    v5 = [(AXMSynthOscillatorParameters *)v2 mainParameters];
    [(AXMSynthEnvelopeParameters *)v2->_envelopeParameters setMainParameters:v5];
  }
  return v2;
}

- (void)addFmOperatorIdentifier:(id)a3
{
  id v9 = a3;
  v4 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterFMOperatorIdentifiers"];
  if (([v4 containsObject:v9] & 1) == 0)
  {
    v5 = [v4 arrayByAddingObject:v9];
    [(AXMSynthObservableParameters *)self setValue:v5 forParameter:@"kSynthParameterFMOperatorIdentifiers"];
    v6 = [(AXMSynthOscillatorParameters *)self mainParameters];
    objc_super v7 = [v6 oscillatorParametersWithIdentifier:v9];

    v8 = [(AXMSynthOscillatorParameters *)self identifier];
    [v7 setValue:v8 forParameter:@"kSynthParameterFMTargetIdentifier"];
  }
}

- (void)removeFmOperatorIdentifier:(id)a3
{
  id v9 = a3;
  v4 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterFMOperatorIdentifiers"];
  if ([v4 containsObject:v9])
  {
    v5 = (void *)[v4 mutableCopy];
    [v5 removeObject:v9];
    v6 = (void *)[v5 copy];
    [(AXMSynthObservableParameters *)self setValue:v6 forParameter:@"kSynthParameterFMOperatorIdentifiers"];

    objc_super v7 = [(AXMSynthOscillatorParameters *)self mainParameters];
    v8 = [v7 oscillatorParametersWithIdentifier:v9];

    [v8 setValue:0 forParameter:@"kSynthParameterFMTargetIdentifier"];
  }
}

- (AXMSynthOscillatorParameters)fmTargetParameters
{
  uint64_t v3 = [(AXMSynthOscillatorParameters *)self fmTargetIdentifier];

  if (v3)
  {
    v4 = [(AXMSynthOscillatorParameters *)self mainParameters];
    v5 = [(AXMSynthOscillatorParameters *)self fmTargetIdentifier];
    v6 = [v4 oscillatorParametersWithIdentifier:v5];
  }
  else
  {
    v6 = 0;
  }

  return (AXMSynthOscillatorParameters *)v6;
}

- (void)routeTo:(id)a3
{
  id v7 = a3;
  v4 = [(AXMSynthOscillatorParameters *)self fmTargetParameters];
  v5 = [(AXMSynthOscillatorParameters *)self identifier];
  [v4 removeFmOperatorIdentifier:v5];

  v6 = [(AXMSynthOscillatorParameters *)self identifier];
  [v7 addFmOperatorIdentifier:v6];
}

- (NSString)displayName
{
  uint64_t v3 = [(AXMSynthOscillatorParameters *)self fmTargetIdentifier];
  v4 = @"Operator";
  if (!v3) {
    v4 = @"Oscillator";
  }
  v5 = v4;

  v6 = NSString;
  id v7 = [(AXMSynthOscillatorParameters *)self identifier];
  v8 = [v6 stringWithFormat:@"%@ %@", v5, v7];

  return (NSString *)v8;
}

- (NSString)identifier
{
  return (NSString *)[(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterIdentifier"];
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)waveform
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterWaveform"];
  int64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setWaveform:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (float)sampleRate
{
  v2 = [(AXMSynthOscillatorParameters *)self mainParameters];
  int64_t v3 = [v2 getValueForParameter:@"kSynthParameterSampleRate"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (float)baseFrequency
{
  v2 = [(AXMSynthOscillatorParameters *)self mainParameters];
  int64_t v3 = [v2 getValueForParameter:@"kSynthParameterBaseFrequency"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setBaseFrequency:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (float)frequencyRatio
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterFrequencyRatio"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setFrequencyRatio:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (NSArray)fmOperatorIdentifiers
{
  return (NSArray *)[(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterFMOperatorIdentifiers"];
}

- (NSString)fmTargetIdentifier
{
  return (NSString *)[(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterFMTargetIdentifier"];
}

- (float)gain
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterGain"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setGain:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (int64_t)detuning
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterDetuning"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setDetuning:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (BOOL)isBypassed
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterBypass"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIsBypassed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (void)addSupportedParameters
{
  v5[10] = *MEMORY[0x1E4F143B8];
  v5[0] = @"kSynthParameterIdentifier";
  v5[1] = @"kSynthParameterGain";
  v5[2] = @"kSynthParameterWaveform";
  v5[3] = @"kSynthParameterFrequencyRatio";
  v5[4] = @"kSynthParameterDetuning";
  v5[5] = @"kSynthParameterFMOperatorIdentifiers";
  v5[6] = @"kSynthParameterFMTargetIdentifier";
  v5[7] = @"kSynthParameterBypass";
  v5[8] = @"kSynthParameterADSREnvelope";
  v5[9] = @"kSynthParameterLowpassCutoff";
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:10];
  id v4 = [(AXMSynthObservableParameters *)self supportedParameters];
  [v4 addObjectsFromArray:v3];
}

+ (id)defaultParameters
{
  v2 = objc_alloc_init(AXMSynthOscillatorParameters);
  [(AXMSynthObservableParameters *)v2 setValue:&stru_1F0E72D10 forParameter:@"kSynthParameterIdentifier"];
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E93F50 forParameter:@"kSynthParameterGain"];
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E937A8 forParameter:@"kSynthParameterWaveform"];
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E93F60 forParameter:@"kSynthParameterFrequencyRatio"];
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E937C0 forParameter:@"kSynthParameterDetuning"];
  [(AXMSynthObservableParameters *)v2 setValue:MEMORY[0x1E4F1CBF0] forParameter:@"kSynthParameterFMOperatorIdentifiers"];
  [(AXMSynthObservableParameters *)v2 setValue:0 forParameter:@"kSynthParameterFMTargetIdentifier"];
  [(AXMSynthObservableParameters *)v2 setValue:MEMORY[0x1E4F1CC38] forParameter:@"kSynthParameterBypass"];
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E93F70 forParameter:@"kSynthParameterLowpassCutoff"];

  return v2;
}

- (id)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  float v5 = [(AXMSynthOscillatorParameters *)self identifier];
  [(AXMSynthOscillatorParameters *)self gain];
  float v7 = v6;
  [(AXMSynthOscillatorParameters *)self baseFrequency];
  float v9 = v8;
  [(AXMSynthOscillatorParameters *)self frequencyRatio];
  float v11 = v10;
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXMSynthOscillatorParameters waveform](self, "waveform"));
  BOOL v13 = [(AXMSynthOscillatorParameters *)self isBypassed];
  v14 = &stru_1F0E72D10;
  if (v13) {
    v14 = @"bypassed";
  }
  v15 = [v3 stringWithFormat:@"<%@ %p id=%@ gain=%.2f frq=%.1f wf=%@ %@>", v4, self, v5, v7, (float)(v9 * v11), v12, v14];

  return v15;
}

- (AXMSynthMainParameters)mainParameters
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainParameters);

  return (AXMSynthMainParameters *)WeakRetained;
}

- (void)setMainParameters:(id)a3
{
}

- (AXMSynthEnvelopeParameters)envelopeParameters
{
  return self->_envelopeParameters;
}

- (float)lowpassCutoff
{
  return self->_lowpassCutoff;
}

- (void)setLowpassCutoff:(float)a3
{
  self->_lowpassCutoff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_envelopeParameters, 0);

  objc_destroyWeak((id *)&self->_mainParameters);
}

@end