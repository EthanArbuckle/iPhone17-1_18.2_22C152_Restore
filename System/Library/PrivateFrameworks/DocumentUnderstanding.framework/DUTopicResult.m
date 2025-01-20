@interface DUTopicResult
- (NSArray)topicNames;
- (NSString)topicIdentifier;
- (_TtC21DocumentUnderstanding13DUTopicResult)init;
- (_TtC21DocumentUnderstanding13DUTopicResult)initWithCoder:(id)a3;
- (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier)topicSet;
- (double)topicConfidence;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTopicConfidence:(double)a3;
- (void)setTopicIdentifier:(id)a3;
- (void)setTopicNames:(id)a3;
- (void)setTopicSet:(id)a3;
@end

@implementation DUTopicResult

- (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier)topicSet
{
  id v2 = DUTopicResult.topicSet.getter();
  return (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier *)v2;
}

- (void)setTopicSet:(id)a3
{
  id v4 = a3;
  v5 = self;
  DUTopicResult.topicSet.setter(v4);
}

- (NSString)topicIdentifier
{
  DUTopicResult.topicIdentifier.getter();
  id v2 = (void *)sub_23697AF3C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setTopicIdentifier:(id)a3
{
  uint64_t v4 = sub_23697AF6C();
  uint64_t v6 = v5;
  v7 = self;
  DUTopicResult.topicIdentifier.setter(v4, v6);
}

- (double)topicConfidence
{
  return DUTopicResult.topicConfidence.getter();
}

- (void)setTopicConfidence:(double)a3
{
}

- (NSArray)topicNames
{
  DUTopicResult.topicNames.getter();
  id v2 = (void *)sub_23697B1CC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setTopicNames:(id)a3
{
  uint64_t v4 = sub_23697B1DC();
  uint64_t v5 = self;
  DUTopicResult.topicNames.setter(v4);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2367E8224(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))DUTopicResult.copy(with:));
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DUTopicResult.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding13DUTopicResult)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding13DUTopicResult *)DUTopicResult.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding13DUTopicResult)init
{
  return (_TtC21DocumentUnderstanding13DUTopicResult *)DUTopicResult.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end