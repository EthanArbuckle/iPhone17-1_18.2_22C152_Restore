@interface GDScoreRankedPersonEntityTagsInner
- (GDScoreRankedPersonEntityTagsInner)init;
- (GDScoreRankedPersonEntityTagsInner)initWithIdValue:(int64_t)a3 scoredPersonEntityTags:(id)a4 inferenceEventIdValue:(int64_t)a5;
- (NSArray)scoredPersonEntityTags;
- (int64_t)inferenceEventIdValue;
- (unint64_t)idValue;
@end

@implementation GDScoreRankedPersonEntityTagsInner

- (GDScoreRankedPersonEntityTagsInner)initWithIdValue:(int64_t)a3 scoredPersonEntityTags:(id)a4 inferenceEventIdValue:(int64_t)a5
{
  return (GDScoreRankedPersonEntityTagsInner *)sub_1B2AFEE68((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(void))type metadata accessor for PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag, (uint64_t (*)(uint64_t, uint64_t, uint64_t))PersonEntityTaggingService.ScoreRankedPersonEntityTags.init(idValue:scoredPersonEntityTags:inferenceEventIdValue:));
}

- (unint64_t)idValue
{
  return sub_1B2AFE9C8();
}

- (NSArray)scoredPersonEntityTags
{
  return (NSArray *)sub_1B2AFEF7C((uint64_t)self, (uint64_t)a2, (void (*)(void))PersonEntityTaggingService.ScoreRankedPersonEntityTags.scoredPersonEntityTags.getter, (void (*)(void))type metadata accessor for PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag);
}

- (int64_t)inferenceEventIdValue
{
  return PersonEntityTaggingService.ScoreRankedPersonEntityTags.inferenceEventId.getter();
}

- (GDScoreRankedPersonEntityTagsInner)init
{
}

- (void).cxx_destruct
{
}

@end