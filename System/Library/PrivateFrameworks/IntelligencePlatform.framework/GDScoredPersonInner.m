@interface GDScoredPersonInner
- (GDScoredPersonInner)init;
- (GDScoredPersonInner)initWithIdValue:(unint64_t)a3 score:(double)a4 inferenceEventIdValue:(int64_t)a5;
- (double)score;
- (int64_t)inferenceEventIdValue;
- (unint64_t)idValue;
@end

@implementation GDScoredPersonInner

- (unint64_t)idValue
{
  return sub_1B2AFEACC();
}

- (int64_t)inferenceEventIdValue
{
  return PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson.inferenceEventId.getter();
}

- (double)score
{
  return PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson.score.getter();
}

- (GDScoredPersonInner)initWithIdValue:(unint64_t)a3 score:(double)a4 inferenceEventIdValue:(int64_t)a5
{
  return (GDScoredPersonInner *)PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson.init(idValue:score:inferenceEventIdValue:)(a3, a5, a4);
}

- (GDScoredPersonInner)init
{
}

@end