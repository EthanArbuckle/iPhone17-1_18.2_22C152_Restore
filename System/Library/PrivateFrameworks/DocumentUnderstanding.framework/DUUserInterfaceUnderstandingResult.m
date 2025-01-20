@interface DUUserInterfaceUnderstandingResult
- (NSString)topicIdentifier;
- (_TtC21DocumentUnderstanding34DUUserInterfaceUnderstandingResult)init;
- (_TtC21DocumentUnderstanding34DUUserInterfaceUnderstandingResult)initWithCoder:(id)a3;
- (double)topicConfidence;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTopicConfidence:(double)a3;
- (void)setTopicIdentifier:(id)a3;
@end

@implementation DUUserInterfaceUnderstandingResult

- (NSString)topicIdentifier
{
  DUUserInterfaceUnderstandingResult.topicIdentifier.getter();
  v2 = (void *)sub_23697AF3C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setTopicIdentifier:(id)a3
{
  uint64_t v4 = sub_23697AF6C();
  uint64_t v6 = v5;
  v7 = self;
  DUUserInterfaceUnderstandingResult.topicIdentifier.setter(v4, v6);
}

- (double)topicConfidence
{
  return DUUserInterfaceUnderstandingResult.topicConfidence.getter();
}

- (void)setTopicConfidence:(double)a3
{
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUUserInterfaceUnderstandingResult.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  uint64_t v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DUUserInterfaceUnderstandingResult.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding34DUUserInterfaceUnderstandingResult)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding34DUUserInterfaceUnderstandingResult *)DUUserInterfaceUnderstandingResult.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding34DUUserInterfaceUnderstandingResult)init
{
  return (_TtC21DocumentUnderstanding34DUUserInterfaceUnderstandingResult *)DUUserInterfaceUnderstandingResult.init()();
}

- (void).cxx_destruct
{
}

@end