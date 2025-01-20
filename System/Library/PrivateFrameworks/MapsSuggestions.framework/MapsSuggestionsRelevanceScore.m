@interface MapsSuggestionsRelevanceScore
- (MapsSuggestionsRelevanceScore)initWithConfidence:(double)a3;
- (NSDate)lastInteractionTime;
- (double)confidence;
- (void)setConfidence:(double)a3;
- (void)setLastInteractionTime:(id)a3;
@end

@implementation MapsSuggestionsRelevanceScore

- (MapsSuggestionsRelevanceScore)initWithConfidence:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsRelevanceScore;
  result = [(MapsSuggestionsRelevanceScore *)&v5 init];
  if (result) {
    result->_confidence = a3;
  }
  return result;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSDate)lastInteractionTime
{
  return self->_lastInteractionTime;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (void)setLastInteractionTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end