@interface BKSTouchStreamPolicy
- (BOOL)shouldSendAmbiguityRecommendations;
- (void)setShouldSendAmbiguityRecommendations:(BOOL)a3;
@end

@implementation BKSTouchStreamPolicy

- (void)setShouldSendAmbiguityRecommendations:(BOOL)a3
{
  self->_shouldSendAmbiguityRecommendations = a3;
}

- (BOOL)shouldSendAmbiguityRecommendations
{
  return self->_shouldSendAmbiguityRecommendations;
}

@end