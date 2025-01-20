@interface CSUBeamSearchConfiguration
- (CSUBeamSearchConfiguration)init;
- (NSNumber)beamWidth;
- (NSNumber)lengthNormalizationAlpha;
- (NSNumber)maxSteps;
- (NSNumber)topK;
- (void)setBeamWidth:(id)a3;
- (void)setLengthNormalizationAlpha:(id)a3;
- (void)setMaxSteps:(id)a3;
- (void)setTopK:(id)a3;
@end

@implementation CSUBeamSearchConfiguration

- (CSUBeamSearchConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSUBeamSearchConfiguration;
  v2 = [(CSUBeamSearchConfiguration *)&v9 init];
  v3 = v2;
  if (v2)
  {
    beamWidth = v2->_beamWidth;
    v2->_beamWidth = 0;

    maxSteps = v3->_maxSteps;
    v3->_maxSteps = 0;

    topK = v3->_topK;
    v3->_topK = 0;

    lengthNormalizationAlpha = v3->_lengthNormalizationAlpha;
    v3->_lengthNormalizationAlpha = 0;
  }
  return v3;
}

- (NSNumber)beamWidth
{
  return self->_beamWidth;
}

- (void)setBeamWidth:(id)a3
{
}

- (NSNumber)maxSteps
{
  return self->_maxSteps;
}

- (void)setMaxSteps:(id)a3
{
}

- (NSNumber)topK
{
  return self->_topK;
}

- (void)setTopK:(id)a3
{
}

- (NSNumber)lengthNormalizationAlpha
{
  return self->_lengthNormalizationAlpha;
}

- (void)setLengthNormalizationAlpha:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lengthNormalizationAlpha, 0);
  objc_storeStrong((id *)&self->_topK, 0);
  objc_storeStrong((id *)&self->_maxSteps, 0);
  objc_storeStrong((id *)&self->_beamWidth, 0);
}

@end