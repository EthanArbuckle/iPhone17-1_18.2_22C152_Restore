@interface PHASEWaterProcedureNodeDefinition
+ (id)new;
- (PHASENumberMetaParameterDefinition)averageDropDiameterMetaParameterDefinition;
- (PHASENumberMetaParameterDefinition)baseFrequencyMultiplierMetaParameterDefinition;
- (PHASENumberMetaParameterDefinition)bubbleGainMetaParameterDefinition;
- (PHASENumberMetaParameterDefinition)chirpRiseRateMetaParameterDefinition;
- (PHASENumberMetaParameterDefinition)fallRateMetaParameterDefinition;
- (PHASENumberMetaParameterDefinition)impulseGainExponentMetaParameterDefinition;
- (PHASENumberMetaParameterDefinition)impulseGainMetaParameterDefinition;
- (PHASENumberMetaParameterDefinition)impulseShapeMetaParameterDefinition;
- (PHASENumberMetaParameterDefinition)maxDropDiameterMetaParameterDefinition;
- (PHASEWaterProcedureNodeDefinition)init;
- (PHASEWaterProcedureNodeDefinition)initWithMixerDefinition:(id)a3 maxPolyphony:(int)a4 voiceStealingType:(int64_t)a5;
- (PHASEWaterProcedureNodeDefinition)initWithMixerDefinition:(id)a3 maxPolyphony:(int)a4 voiceStealingType:(int64_t)a5 identifier:(id)a6;
- (double)averageDropDiameter;
- (double)baseFrequencyMultiplier;
- (double)bubbleGain;
- (double)chirpRiseRate;
- (double)fallRate;
- (double)impulseGain;
- (double)impulseGainExponent;
- (double)impulseShape;
- (double)maxDropDiameter;
- (void)setAverageDropDiameter:(double)a3;
- (void)setAverageDropDiameterMetaParameterDefinition:(id)a3;
- (void)setBaseFrequencyMultiplier:(double)a3;
- (void)setBaseFrequencyMultiplierMetaParameterDefinition:(id)a3;
- (void)setBubbleGain:(double)a3;
- (void)setBubbleGainMetaParameterDefinition:(id)a3;
- (void)setChirpRiseRate:(double)a3;
- (void)setChirpRiseRateMetaParameterDefinition:(id)a3;
- (void)setFallRate:(double)a3;
- (void)setFallRateMetaParameterDefinition:(id)a3;
- (void)setImpulseGain:(double)a3;
- (void)setImpulseGainExponent:(double)a3;
- (void)setImpulseGainExponentMetaParameterDefinition:(id)a3;
- (void)setImpulseGainMetaParameterDefinition:(id)a3;
- (void)setImpulseShape:(double)a3;
- (void)setImpulseShapeMetaParameterDefinition:(id)a3;
- (void)setMaxDropDiameter:(double)a3;
- (void)setMaxDropDiameterMetaParameterDefinition:(id)a3;
@end

@implementation PHASEWaterProcedureNodeDefinition

- (PHASEWaterProcedureNodeDefinition)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEWaterProcedureNodeDefinition)initWithMixerDefinition:(id)a3 maxPolyphony:(int)a4 voiceStealingType:(int64_t)a5 identifier:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  v12 = [(PHASEWaterProcedureNodeDefinition *)self initWithMixerDefinition:v10 maxPolyphony:v8 voiceStealingType:a5];
  v13 = v12;
  if (v12) {
    [(PHASEDefinition *)v12 setIdentifier:v11];
  }

  return v13;
}

- (PHASEWaterProcedureNodeDefinition)initWithMixerDefinition:(id)a3 maxPolyphony:(int)a4 voiceStealingType:(int64_t)a5
{
  v17.receiver = self;
  v17.super_class = (Class)PHASEWaterProcedureNodeDefinition;
  v5 = [(PHASEProcedureNodeDefinition *)&v17 initInternal:a3 maxPolyphony:*(void *)&a4 voiceStealingType:a5];
  v6 = v5;
  if (v5)
  {
    v5->_fallRate = 1000.0;
    v5->_averageDropDiameter = 1.0;
    v5->_maxDropDiameter = 5.0;
    v5->_impulseShape = 1.0;
    v5->_impulseGainExponent = 4.0;
    v5->_impulseGain = 1.0;
    v5->_chirpRiseRate = 0.1;
    v5->_baseFrequencyMultiplier = 3.0;
    v5->_bubbleGain = 1.0;
    fallRateMetaParameterDefinition = v5->_fallRateMetaParameterDefinition;
    v5->_fallRateMetaParameterDefinition = 0;

    averageDropDiameterMetaParameterDefinition = v6->_averageDropDiameterMetaParameterDefinition;
    v6->_averageDropDiameterMetaParameterDefinition = 0;

    maxDropDiameterMetaParameterDefinition = v6->_maxDropDiameterMetaParameterDefinition;
    v6->_maxDropDiameterMetaParameterDefinition = 0;

    impulseShapeMetaParameterDefinition = v6->_impulseShapeMetaParameterDefinition;
    v6->_impulseShapeMetaParameterDefinition = 0;

    impulseGainExponentMetaParameterDefinition = v6->_impulseGainExponentMetaParameterDefinition;
    v6->_impulseGainExponentMetaParameterDefinition = 0;

    impulseGainMetaParameterDefinition = v6->_impulseGainMetaParameterDefinition;
    v6->_impulseGainMetaParameterDefinition = 0;

    chirpRiseRateMetaParameterDefinition = v6->_chirpRiseRateMetaParameterDefinition;
    v6->_chirpRiseRateMetaParameterDefinition = 0;

    baseFrequencyMultiplierMetaParameterDefinition = v6->_baseFrequencyMultiplierMetaParameterDefinition;
    v6->_baseFrequencyMultiplierMetaParameterDefinition = 0;

    bubbleGainMetaParameterDefinition = v6->_bubbleGainMetaParameterDefinition;
    v6->_bubbleGainMetaParameterDefinition = 0;
  }
  return v6;
}

- (void)setFallRate:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_fallRate = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.1, 48000.0);
}

- (void)setAverageDropDiameter:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_averageDropDiameter = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.1, 5.0);
}

- (void)setMaxDropDiameter:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_maxDropDiameter = PHASEGetPropertyBounded<double>(v8, v7, a3, 5.0, 20.0);
}

- (void)setImpulseShape:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_impulseShape = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.1, 10.0);
}

- (void)setImpulseGainExponent:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_impulseGainExponent = PHASEGetPropertyBounded<double>(v8, v7, a3, 4.0, 7.0);
}

- (void)setImpulseGain:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_impulseGain = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.0);
}

- (void)setChirpRiseRate:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_chirpRiseRate = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.01, 10.0);
}

- (void)setBaseFrequencyMultiplier:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_baseFrequencyMultiplier = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.1, 10.0);
}

- (void)setBubbleGain:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_bubbleGain = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.0);
}

- (double)fallRate
{
  return self->_fallRate;
}

- (double)averageDropDiameter
{
  return self->_averageDropDiameter;
}

- (double)maxDropDiameter
{
  return self->_maxDropDiameter;
}

- (double)impulseShape
{
  return self->_impulseShape;
}

- (double)impulseGainExponent
{
  return self->_impulseGainExponent;
}

- (double)impulseGain
{
  return self->_impulseGain;
}

- (double)chirpRiseRate
{
  return self->_chirpRiseRate;
}

- (double)baseFrequencyMultiplier
{
  return self->_baseFrequencyMultiplier;
}

- (double)bubbleGain
{
  return self->_bubbleGain;
}

- (PHASENumberMetaParameterDefinition)fallRateMetaParameterDefinition
{
  return self->_fallRateMetaParameterDefinition;
}

- (void)setFallRateMetaParameterDefinition:(id)a3
{
}

- (PHASENumberMetaParameterDefinition)averageDropDiameterMetaParameterDefinition
{
  return self->_averageDropDiameterMetaParameterDefinition;
}

- (void)setAverageDropDiameterMetaParameterDefinition:(id)a3
{
}

- (PHASENumberMetaParameterDefinition)maxDropDiameterMetaParameterDefinition
{
  return self->_maxDropDiameterMetaParameterDefinition;
}

- (void)setMaxDropDiameterMetaParameterDefinition:(id)a3
{
}

- (PHASENumberMetaParameterDefinition)impulseShapeMetaParameterDefinition
{
  return self->_impulseShapeMetaParameterDefinition;
}

- (void)setImpulseShapeMetaParameterDefinition:(id)a3
{
}

- (PHASENumberMetaParameterDefinition)impulseGainExponentMetaParameterDefinition
{
  return self->_impulseGainExponentMetaParameterDefinition;
}

- (void)setImpulseGainExponentMetaParameterDefinition:(id)a3
{
}

- (PHASENumberMetaParameterDefinition)impulseGainMetaParameterDefinition
{
  return self->_impulseGainMetaParameterDefinition;
}

- (void)setImpulseGainMetaParameterDefinition:(id)a3
{
}

- (PHASENumberMetaParameterDefinition)chirpRiseRateMetaParameterDefinition
{
  return self->_chirpRiseRateMetaParameterDefinition;
}

- (void)setChirpRiseRateMetaParameterDefinition:(id)a3
{
}

- (PHASENumberMetaParameterDefinition)baseFrequencyMultiplierMetaParameterDefinition
{
  return self->_baseFrequencyMultiplierMetaParameterDefinition;
}

- (void)setBaseFrequencyMultiplierMetaParameterDefinition:(id)a3
{
}

- (PHASENumberMetaParameterDefinition)bubbleGainMetaParameterDefinition
{
  return self->_bubbleGainMetaParameterDefinition;
}

- (void)setBubbleGainMetaParameterDefinition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleGainMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_baseFrequencyMultiplierMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_chirpRiseRateMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_impulseGainMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_impulseGainExponentMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_impulseShapeMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_maxDropDiameterMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_averageDropDiameterMetaParameterDefinition, 0);

  objc_storeStrong((id *)&self->_fallRateMetaParameterDefinition, 0);
}

@end