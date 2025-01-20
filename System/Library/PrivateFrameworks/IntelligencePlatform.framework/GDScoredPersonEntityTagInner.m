@interface GDScoredPersonEntityTagInner
- (GDScoredPersonEntityTagInner)init;
- (GDScoredPersonEntityTagInner)initWithGdTag:(int64_t)a3 score:(double)a4 inferenceEventIdValue:(int64_t)a5;
- (double)score;
- (int64_t)gdTag;
- (int64_t)inferenceEventIdValue;
@end

@implementation GDScoredPersonEntityTagInner

- (GDScoredPersonEntityTagInner)initWithGdTag:(int64_t)a3 score:(double)a4 inferenceEventIdValue:(int64_t)a5
{
  return (GDScoredPersonEntityTagInner *)PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag.init(gdTag:score:inferenceEventIdValue:)(a4, a3, a5);
}

- (int64_t)inferenceEventIdValue
{
  return PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag.inferenceEventId.getter();
}

- (int64_t)gdTag
{
  return sub_1B2AFE778();
}

- (double)score
{
  return PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag.score.getter();
}

- (GDScoredPersonEntityTagInner)init
{
}

@end