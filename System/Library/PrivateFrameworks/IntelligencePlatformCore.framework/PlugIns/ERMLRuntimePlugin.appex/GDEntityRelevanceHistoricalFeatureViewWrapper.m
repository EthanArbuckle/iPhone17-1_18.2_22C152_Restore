@interface GDEntityRelevanceHistoricalFeatureViewWrapper
- (GDEntityRelevanceHistoricalFeatureViewWrapper)init;
- (id)getPFLTrainingDataForAllEventsWithOrderedFeatureNames:(id)a3 entityTypes:(id)a4;
@end

@implementation GDEntityRelevanceHistoricalFeatureViewWrapper

- (id)getPFLTrainingDataForAllEventsWithOrderedFeatureNames:(id)a3 entityTypes:(id)a4
{
  uint64_t v6 = sub_10000B5C0();
  if (a4) {
    sub_10000B5C0();
  }
  v7 = self;
  id v8 = sub_100003DAC(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

- (GDEntityRelevanceHistoricalFeatureViewWrapper)init
{
  return (GDEntityRelevanceHistoricalFeatureViewWrapper *)sub_100004348();
}

- (void).cxx_destruct
{
}

@end