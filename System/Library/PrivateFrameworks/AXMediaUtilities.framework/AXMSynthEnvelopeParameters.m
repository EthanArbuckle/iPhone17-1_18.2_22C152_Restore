@interface AXMSynthEnvelopeParameters
+ (id)defaultParameters;
- (AXMSynthMainParameters)mainParameters;
- (float)attackLevel;
- (float)attackMS;
- (float)decayMS;
- (float)releaseMS;
- (float)sampleRate;
- (float)sustainLevel;
- (void)addSupportedParameters;
- (void)setAttackLevel:(float)a3;
- (void)setAttackTime:(float)a3;
- (void)setDecayTime:(float)a3;
- (void)setMainParameters:(id)a3;
- (void)setReleaseTime:(float)a3;
- (void)setSustainLevel:(float)a3;
@end

@implementation AXMSynthEnvelopeParameters

- (void)addSupportedParameters
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"kSynthParameterEnvelopeAttackTime";
  v5[1] = @"kSynthParameterEnvelopeAttackLevel";
  v5[2] = @"kSynthParameterEnvelopeDecayTime";
  v5[3] = @"kSynthParameterEnvelopeSustainLevel";
  v5[4] = @"kSynthParameterEnvelopeReleaseTime";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v4 = [(AXMSynthObservableParameters *)self supportedParameters];
  [v4 addObjectsFromArray:v3];
}

+ (id)defaultParameters
{
  v2 = objc_alloc_init(AXMSynthEnvelopeParameters);
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E93F10 forParameter:@"kSynthParameterEnvelopeAttackTime"];
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E93F20 forParameter:@"kSynthParameterEnvelopeAttackLevel"];
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E93F30 forParameter:@"kSynthParameterEnvelopeDecayTime"];
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E93F40 forParameter:@"kSynthParameterEnvelopeSustainLevel"];
  [(AXMSynthObservableParameters *)v2 setValue:&unk_1F0E93F30 forParameter:@"kSynthParameterEnvelopeReleaseTime"];

  return v2;
}

- (float)sampleRate
{
  v2 = [(AXMSynthEnvelopeParameters *)self mainParameters];
  [v2 sampleRate];
  float v4 = v3;

  return v4;
}

- (float)attackMS
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterEnvelopeAttackTime"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setAttackTime:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (float)attackLevel
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterEnvelopeAttackLevel"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setAttackLevel:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (float)decayMS
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterEnvelopeDecayTime"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setDecayTime:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (float)sustainLevel
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterEnvelopeSustainLevel"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setSustainLevel:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (float)releaseMS
{
  v2 = [(AXMSynthObservableParameters *)self getValueForParameter:@"kSynthParameterEnvelopeReleaseTime"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setReleaseTime:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");
}

- (AXMSynthMainParameters)mainParameters
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainParameters);

  return (AXMSynthMainParameters *)WeakRetained;
}

- (void)setMainParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end