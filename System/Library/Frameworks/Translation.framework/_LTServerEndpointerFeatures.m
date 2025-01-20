@interface _LTServerEndpointerFeatures
+ (BOOL)supportsSecureCoding;
- (NSArray)pauseCounts;
- (_LTServerEndpointerFeatures)initWithCoder:(id)a3;
- (double)eosLikelihood;
- (double)silencePosterior;
- (int64_t)processedAudioDurationInMilliseconds;
- (int64_t)trailingSilenceDuration;
- (int64_t)wordCount;
- (void)encodeWithCoder:(id)a3;
- (void)setEosLikelihood:(double)a3;
- (void)setPauseCounts:(id)a3;
- (void)setProcessedAudioDurationInMilliseconds:(int64_t)a3;
- (void)setSilencePosterior:(double)a3;
- (void)setTrailingSilenceDuration:(int64_t)a3;
- (void)setWordCount:(int64_t)a3;
@end

@implementation _LTServerEndpointerFeatures

- (_LTServerEndpointerFeatures)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTServerEndpointerFeatures;
  v5 = [(_LTServerEndpointerFeatures *)&v15 init];
  if (v5)
  {
    v5->_wordCount = [v4 decodeIntegerForKey:@"wordCount"];
    v5->_trailingSilenceDuration = [v4 decodeIntegerForKey:@"trailingSilenceDuration"];
    [v4 decodeDoubleForKey:@"eosLikelihood"];
    v5->_eosLikelihood = v6;
    v7 = (void *)MEMORY[0x263EFFA08];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    v9 = [v7 setWithArray:v8];

    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"pauseCounts"];
    pauseCounts = v5->_pauseCounts;
    v5->_pauseCounts = v10;

    objc_storeStrong((id *)&v5->_pauseCounts, v10);
    [v4 decodeDoubleForKey:@"silencePosterior"];
    v5->_silencePosterior = v12;
    v5->_processedAudioDurationInMilliseconds = [v4 decodeIntegerForKey:@"processedAudioDurationInMilliseconds"];
    v13 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t wordCount = self->_wordCount;
  id v5 = a3;
  [v5 encodeInteger:wordCount forKey:@"wordCount"];
  [v5 encodeInteger:self->_trailingSilenceDuration forKey:@"trailingSilenceDuration"];
  [v5 encodeDouble:@"eosLikelihood" forKey:self->_eosLikelihood];
  [v5 encodeObject:self->_pauseCounts forKey:@"pauseCounts"];
  [v5 encodeDouble:@"silencePosterior" forKey:self->_silencePosterior];
  [v5 encodeInteger:self->_processedAudioDurationInMilliseconds forKey:@"processedAudioDurationInMilliseconds"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)wordCount
{
  return self->_wordCount;
}

- (void)setWordCount:(int64_t)a3
{
  self->_int64_t wordCount = a3;
}

- (int64_t)trailingSilenceDuration
{
  return self->_trailingSilenceDuration;
}

- (void)setTrailingSilenceDuration:(int64_t)a3
{
  self->_trailingSilenceDuration = a3;
}

- (double)eosLikelihood
{
  return self->_eosLikelihood;
}

- (void)setEosLikelihood:(double)a3
{
  self->_eosLikelihood = a3;
}

- (NSArray)pauseCounts
{
  return self->_pauseCounts;
}

- (void)setPauseCounts:(id)a3
{
}

- (double)silencePosterior
{
  return self->_silencePosterior;
}

- (void)setSilencePosterior:(double)a3
{
  self->_silencePosterior = a3;
}

- (int64_t)processedAudioDurationInMilliseconds
{
  return self->_processedAudioDurationInMilliseconds;
}

- (void)setProcessedAudioDurationInMilliseconds:(int64_t)a3
{
  self->_processedAudioDurationInMilliseconds = a3;
}

- (void).cxx_destruct
{
}

@end