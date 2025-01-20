@interface SNResultsCollector
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (NSArray)errors;
- (NSArray)results;
- (SNResultsCollector)init;
- (int64_t)completeCount;
- (void)clearCompleteCount;
- (void)clearErrors;
- (void)clearResults;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)requestDidComplete:(id)a3;
- (void)setCompleteCount:(int64_t)a3;
- (void)setErrors:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation SNResultsCollector

- (NSArray)results
{
  return (NSArray *)sub_1DC9B3B24((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SNResultsCollector_results, &qword_1EAA9E960);
}

- (void)setResults:(id)a3
{
}

- (NSArray)errors
{
  return (NSArray *)sub_1DC9B3B24((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SNResultsCollector_errors, &qword_1EAA9DF60);
}

- (void)setErrors:(id)a3
{
}

- (int64_t)completeCount
{
  return sub_1DC9B3CD8();
}

- (void)setCompleteCount:(int64_t)a3
{
}

- (SNResultsCollector)init
{
  return (SNResultsCollector *)sub_1DC9B3D20();
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v3 = sub_1DCB87938();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  unsigned __int8 v6 = static SNResultsCollector.automaticallyNotifiesObservers(forKey:)(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  SNResultsCollector.request(_:didProduce:)();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  unsigned __int8 v6 = self;
  SNResultsCollector.request(_:didFailWithError:)((uint64_t)v6, v7);
  swift_unknownObjectRelease();
}

- (void)requestDidComplete:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  SNResultsCollector.requestDidComplete(_:)();
  swift_unknownObjectRelease();
}

- (void)clearResults
{
  v2 = self;
  sub_1DC9B42B4();
}

- (void)clearErrors
{
  v2 = self;
  sub_1DC9B4370();
}

- (void)clearCompleteCount
{
  v2 = self;
  sub_1DC9B442C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end