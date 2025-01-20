@interface VCPLivePhotoStatistics
- (VCPLivePhotoStatistics)init;
- (double)recommendedSec;
- (unint64_t)activityDecisionCounter:(unint64_t)a3;
- (unint64_t)analyzedMovies;
- (unint64_t)analyzedPhotos;
- (unint64_t)assetCountWithLivePhotoEffectsAnalyzed;
- (unint64_t)firstFailedSubClassifierCounter:(unint64_t)a3;
- (unint64_t)gatingDecisionCounter:(unint64_t)a3;
- (unint64_t)recommended;
- (unint64_t)recommended1Sec;
- (unint64_t)recommended2Sec;
- (unint64_t)recommended3Sec;
- (unint64_t)stablizeResultsCounter:(unint64_t)a3;
- (void)addCount:(unint64_t)a3 toActivityDecisionCounter:(unint64_t)a4;
- (void)addCount:(unint64_t)a3 toFirstFailedSubClassifierCounter:(unint64_t)a4;
- (void)addCount:(unint64_t)a3 toGatingDecisionCounter:(unint64_t)a4;
- (void)addCount:(unint64_t)a3 toStablizeResultsCounter:(unint64_t)a4;
- (void)addLivePhotoEffectsAnalyzedCount:(unint64_t)a3;
- (void)setAnalyzedMovies:(unint64_t)a3;
- (void)setAnalyzedPhotos:(unint64_t)a3;
- (void)setRecommended1Sec:(unint64_t)a3;
- (void)setRecommended2Sec:(unint64_t)a3;
- (void)setRecommended3Sec:(unint64_t)a3;
- (void)setRecommended:(unint64_t)a3;
- (void)setRecommendedSec:(double)a3;
@end

@implementation VCPLivePhotoStatistics

- (VCPLivePhotoStatistics)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPLivePhotoStatistics;
  v2 = [(VCPLivePhotoStatistics *)&v6 init];
  v3 = (VCPLivePhotoStatistics *)v2;
  if (v2)
  {
    *((void *)v2 + 61) = 0;
    *(_OWORD *)(v2 + 248) = 0u;
    *(_OWORD *)(v2 + 232) = 0u;
    *(_OWORD *)(v2 + 216) = 0u;
    *(_OWORD *)(v2 + 200) = 0u;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 456) = 0u;
    *(_OWORD *)(v2 + 472) = 0u;
    *(_OWORD *)(v2 + 424) = 0u;
    *(_OWORD *)(v2 + 440) = 0u;
    *(_OWORD *)(v2 + 392) = 0u;
    *(_OWORD *)(v2 + 408) = 0u;
    *(_OWORD *)(v2 + 360) = 0u;
    *(_OWORD *)(v2 + 376) = 0u;
    *(_OWORD *)(v2 + 328) = 0u;
    *(_OWORD *)(v2 + 344) = 0u;
    *(_OWORD *)(v2 + 296) = 0u;
    *(_OWORD *)(v2 + 312) = 0u;
    *(_OWORD *)(v2 + 264) = 0u;
    *(_OWORD *)(v2 + 280) = 0u;
    v4 = v2;
  }

  return v3;
}

- (void)addCount:(unint64_t)a3 toGatingDecisionCounter:(unint64_t)a4
{
  self->_gatingDecisionCounter[a4] += a3;
}

- (void)addCount:(unint64_t)a3 toActivityDecisionCounter:(unint64_t)a4
{
  self->_activityDecisionCounter[a4] += a3;
}

- (void)addCount:(unint64_t)a3 toStablizeResultsCounter:(unint64_t)a4
{
  self->_stablizeResultsCounter[a4] += a3;
}

- (void)addCount:(unint64_t)a3 toFirstFailedSubClassifierCounter:(unint64_t)a4
{
  self->_firstFailedSubClassifierCounter[a4] += a3;
}

- (void)addLivePhotoEffectsAnalyzedCount:(unint64_t)a3
{
  self->_assetCountWithLivePhotoEffectsAnalyzed += a3;
}

- (unint64_t)gatingDecisionCounter:(unint64_t)a3
{
  return self->_gatingDecisionCounter[a3];
}

- (unint64_t)activityDecisionCounter:(unint64_t)a3
{
  return self->_activityDecisionCounter[a3];
}

- (unint64_t)stablizeResultsCounter:(unint64_t)a3
{
  return self->_stablizeResultsCounter[a3];
}

- (unint64_t)firstFailedSubClassifierCounter:(unint64_t)a3
{
  return self->_firstFailedSubClassifierCounter[a3];
}

- (unint64_t)assetCountWithLivePhotoEffectsAnalyzed
{
  return self->_assetCountWithLivePhotoEffectsAnalyzed;
}

- (unint64_t)analyzedPhotos
{
  return self->_analyzedPhotos;
}

- (void)setAnalyzedPhotos:(unint64_t)a3
{
  self->_analyzedPhotos = a3;
}

- (unint64_t)analyzedMovies
{
  return self->_analyzedMovies;
}

- (void)setAnalyzedMovies:(unint64_t)a3
{
  self->_analyzedMovies = a3;
}

- (unint64_t)recommended
{
  return self->_recommended;
}

- (void)setRecommended:(unint64_t)a3
{
  self->_recommended = a3;
}

- (unint64_t)recommended1Sec
{
  return self->_recommended1Sec;
}

- (void)setRecommended1Sec:(unint64_t)a3
{
  self->_recommended1Sec = a3;
}

- (unint64_t)recommended2Sec
{
  return self->_recommended2Sec;
}

- (void)setRecommended2Sec:(unint64_t)a3
{
  self->_recommended2Sec = a3;
}

- (unint64_t)recommended3Sec
{
  return self->_recommended3Sec;
}

- (void)setRecommended3Sec:(unint64_t)a3
{
  self->_recommended3Sec = a3;
}

- (double)recommendedSec
{
  return self->_recommendedSec;
}

- (void)setRecommendedSec:(double)a3
{
  self->_recommendedSec = a3;
}

@end