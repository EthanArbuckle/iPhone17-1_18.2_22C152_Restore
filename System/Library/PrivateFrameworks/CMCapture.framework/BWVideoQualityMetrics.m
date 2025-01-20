@interface BWVideoQualityMetrics
+ (double)_luxThreshold;
+ (double)_luxTransition;
+ (id)filterMetadata:(id)a3;
+ (void)initialize;
- (double)_computeLuxScore;
- (double)computeQualityScore;
- (unsigned)qualityScoringVersion;
- (void)processMetadata:(id)a3;
- (void)reset;
@end

@implementation BWVideoQualityMetrics

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    vqm_luxThreshold = 0x4062C00000000000;
    vqm_luxTransition = 0x4072C00000000000;
  }
}

+ (id)filterMetadata:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  uint64_t v5 = *MEMORY[0x1E4F54068];
  uint64_t v6 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F54068]];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
  return v4;
}

+ (double)_luxThreshold
{
  return *(double *)&vqm_luxThreshold;
}

+ (double)_luxTransition
{
  return *(double *)&vqm_luxTransition;
}

- (void)reset
{
  self->_totalLux = 0;
  self->_frames = 0;
}

- (void)processMetadata:(id)a3
{
  self->_totalLux += (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F54068]), "intValue");
  ++self->_frames;
}

- (double)_computeLuxScore
{
  double result = ((double)self->_totalLux / (double)self->_frames
          - (*(double *)&vqm_luxThreshold
           + *(double *)&vqm_luxTransition * -0.5))
         / *(double *)&vqm_luxTransition;
  double v3 = 1.0;
  BOOL v4 = result > 1.0 || result < 0.0;
  if (result < 0.0 && result <= 1.0) {
    double v3 = 0.0;
  }
  if (v4) {
    return v3;
  }
  return result;
}

- (double)computeQualityScore
{
  if (!self->_frames) {
    return 1.0;
  }
  [(BWVideoQualityMetrics *)self _computeLuxScore];
  return result;
}

- (unsigned)qualityScoringVersion
{
  return 1;
}

@end