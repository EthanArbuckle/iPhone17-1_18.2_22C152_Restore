@interface SASServerEndpointFeatures
+ (BOOL)ad_shouldClassLogToMetrics;
- (id)ad_csASRFeatures;
@end

@implementation SASServerEndpointFeatures

- (id)ad_csASRFeatures
{
  id v3 = objc_alloc((Class)CSASRFeatures);
  id v4 = [(SASServerEndpointFeatures *)self numOfWords];
  id v5 = [(SASServerEndpointFeatures *)self trailingSilenceDuration];
  [(SASServerEndpointFeatures *)self eosLikelihood];
  double v7 = v6;
  v8 = [(SASServerEndpointFeatures *)self pauseCounts];
  [(SASServerEndpointFeatures *)self silenceProbability];
  double v10 = v9;
  v11 = [(SASServerEndpointFeatures *)self taskName];
  id v12 = objc_msgSend(v3, "initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:", v4, v5, v8, v11, -[SASServerEndpointFeatures processedAudioDurationMs](self, "processedAudioDurationMs"), v7, v10, 0.0);

  return v12;
}

+ (BOOL)ad_shouldClassLogToMetrics
{
  return 0;
}

@end