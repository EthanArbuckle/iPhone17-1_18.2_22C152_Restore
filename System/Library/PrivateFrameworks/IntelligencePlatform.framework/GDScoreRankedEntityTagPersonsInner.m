@interface GDScoreRankedEntityTagPersonsInner
- (GDScoreRankedEntityTagPersonsInner)init;
- (GDScoreRankedEntityTagPersonsInner)initWithGdTag:(int64_t)a3 scoredEntities:(id)a4 inferenceEventIdValue:(int64_t)a5;
- (NSArray)scoredEntities;
- (int64_t)gdTag;
- (int64_t)inferenceEventIdValue;
@end

@implementation GDScoreRankedEntityTagPersonsInner

- (GDScoreRankedEntityTagPersonsInner)initWithGdTag:(int64_t)a3 scoredEntities:(id)a4 inferenceEventIdValue:(int64_t)a5
{
  return (GDScoreRankedEntityTagPersonsInner *)sub_1B2AFEE68((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(void))type metadata accessor for PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson, (uint64_t (*)(uint64_t, uint64_t, uint64_t))PersonEntityTaggingService.ScoreRankedEntityTagPersons.init(gdTag:scoredEntities:inferenceEventIdValue:));
}

- (int64_t)gdTag
{
  return sub_1B2AFEF14();
}

- (NSArray)scoredEntities
{
  return (NSArray *)sub_1B2AFEF7C((uint64_t)self, (uint64_t)a2, (void (*)(void))PersonEntityTaggingService.ScoreRankedEntityTagPersons.scoredEntities.getter, (void (*)(void))type metadata accessor for PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson);
}

- (int64_t)inferenceEventIdValue
{
  return PersonEntityTaggingService.ScoreRankedEntityTagPersons.inferenceEventId.getter();
}

- (GDScoreRankedEntityTagPersonsInner)init
{
}

- (void).cxx_destruct
{
}

@end