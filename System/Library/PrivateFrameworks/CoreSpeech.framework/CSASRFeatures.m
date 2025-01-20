@interface CSASRFeatures
+ (id)initialASRFeatures;
+ (id)initialResultCandidateFeatures;
- (CSASRFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10;
- (NSArray)pauseCounts;
- (NSString)taskName;
- (double)acousticEndpointerScore;
- (double)eosLikelihood;
- (double)silencePosterior;
- (id)description;
- (id)dictionary;
- (int64_t)processedAudioDurationInMilliseconds;
- (int64_t)trailingSilenceDuration;
- (int64_t)wordCount;
- (void)setAcousticEndpointerScore:(double)a3;
- (void)setEosLikelihood:(double)a3;
- (void)setPauseCounts:(id)a3;
- (void)setProcessedAudioDurationInMilliseconds:(int64_t)a3;
- (void)setSilencePosterior:(double)a3;
- (void)setTaskName:(id)a3;
- (void)setTrailingSilenceDuration:(int64_t)a3;
- (void)setWordCount:(int64_t)a3;
@end

@implementation CSASRFeatures

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_pauseCounts, 0);
}

- (void)setTaskName:(id)a3
{
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setAcousticEndpointerScore:(double)a3
{
  self->_acousticEndpointerScore = a3;
}

- (double)acousticEndpointerScore
{
  return self->_acousticEndpointerScore;
}

- (void)setProcessedAudioDurationInMilliseconds:(int64_t)a3
{
  self->_processedAudioDurationInMilliseconds = a3;
}

- (int64_t)processedAudioDurationInMilliseconds
{
  return self->_processedAudioDurationInMilliseconds;
}

- (void)setSilencePosterior:(double)a3
{
  self->_silencePosterior = a3;
}

- (double)silencePosterior
{
  return self->_silencePosterior;
}

- (void)setPauseCounts:(id)a3
{
}

- (NSArray)pauseCounts
{
  return self->_pauseCounts;
}

- (void)setEosLikelihood:(double)a3
{
  self->_eosLikelihood = a3;
}

- (double)eosLikelihood
{
  return self->_eosLikelihood;
}

- (void)setTrailingSilenceDuration:(int64_t)a3
{
  self->_trailingSilenceDuration = a3;
}

- (int64_t)trailingSilenceDuration
{
  return self->_trailingSilenceDuration;
}

- (void)setWordCount:(int64_t)a3
{
  self->_wordCount = a3;
}

- (int64_t)wordCount
{
  return self->_wordCount;
}

- (id)dictionary
{
  v13[0] = @"WordCount";
  v3 = +[NSNumber numberWithInteger:self->_wordCount];
  v14[0] = v3;
  v13[1] = @"TrailingSilDuration";
  v4 = +[NSNumber numberWithInteger:self->_trailingSilenceDuration];
  v14[1] = v4;
  v13[2] = @"EOSLikelihood";
  uint64_t v5 = +[NSNumber numberWithDouble:self->_eosLikelihood];
  v6 = (void *)v5;
  pauseCounts = self->_pauseCounts;
  if (!pauseCounts) {
    pauseCounts = (NSArray *)&__NSArray0__struct;
  }
  v14[2] = v5;
  v14[3] = pauseCounts;
  v13[3] = @"PauseCounts";
  v13[4] = @"SilencePosterior";
  v8 = +[NSNumber numberWithDouble:self->_silencePosterior];
  v14[4] = v8;
  v13[5] = @"ProcessedAudioDurationInMilliseconds";
  v9 = +[NSNumber numberWithInteger:self->_processedAudioDurationInMilliseconds];
  v14[5] = v9;
  v13[6] = @"AcousticEndpointerScore";
  v10 = +[NSNumber numberWithDouble:self->_acousticEndpointerScore];
  v14[6] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];

  return v11;
}

- (id)description
{
  int64_t wordCount = self->_wordCount;
  int64_t trailingSilenceDuration = self->_trailingSilenceDuration;
  double eosLikelihood = self->_eosLikelihood;
  v6 = [(NSArray *)self->_pauseCounts componentsJoinedByString:@","];
  v7 = +[NSString stringWithFormat:@"{wordCount: %ld, trailingSilDuration: %ld, eosLikelihood: %f, pauseCounts: (%@), silencePosterior: %f, taskName: %@, processedAudioDurationInMilliseconds: %ld, acousticEndpointerScore: %f}", wordCount, trailingSilenceDuration, *(void *)&eosLikelihood, v6, *(void *)&self->_silencePosterior, self->_taskName, self->_processedAudioDurationInMilliseconds, *(void *)&self->_acousticEndpointerScore];

  return v7;
}

- (CSASRFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10
{
  id v19 = a6;
  id v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CSASRFeatures;
  v21 = [(CSASRFeatures *)&v24 init];
  v22 = v21;
  if (v21)
  {
    v21->_int64_t wordCount = a3;
    v21->_int64_t trailingSilenceDuration = a4;
    v21->_double eosLikelihood = a5;
    objc_storeStrong((id *)&v21->_pauseCounts, a6);
    v22->_silencePosterior = a7;
    objc_storeStrong((id *)&v22->_taskName, a8);
    v22->_processedAudioDurationInMilliseconds = a9;
    v22->_acousticEndpointerScore = a10;
  }

  return v22;
}

+ (id)initialResultCandidateFeatures
{
  id v2 = [objc_alloc((Class)a1) initWithWordCount:0 trailingSilenceDuration:50 eosLikelihood:&__NSArray0__struct pauseCounts:@"SearchOrMessaging" silencePosterior:10 taskName:8.98999977 processedAudioDurationInMilliseconds:0.0 acousticEndpointerScore:0.0];
  return v2;
}

+ (id)initialASRFeatures
{
  id v2 = [objc_alloc((Class)a1) initWithWordCount:0 trailingSilenceDuration:0 eosLikelihood:&__NSArray0__struct pauseCounts:@"SearchOrMessaging" silencePosterior:0 taskName:8.98999977 processedAudioDurationInMilliseconds:0.997685015 acousticEndpointerScore:0.0];
  return v2;
}

@end