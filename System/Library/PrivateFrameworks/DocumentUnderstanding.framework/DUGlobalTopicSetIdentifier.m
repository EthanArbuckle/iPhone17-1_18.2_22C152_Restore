@interface DUGlobalTopicSetIdentifier
- (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier)init;
- (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)topicSetName;
- (int64_t)topicSetVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setTopicSetName:(int64_t)a3;
- (void)setTopicSetVersion:(int64_t)a3;
@end

@implementation DUGlobalTopicSetIdentifier

- (int64_t)topicSetName
{
  return DUGlobalTopicSetIdentifier.topicSetName.getter();
}

- (void)setTopicSetName:(int64_t)a3
{
}

- (int64_t)topicSetVersion
{
  return DUGlobalTopicSetIdentifier.topicSetVersion.getter();
}

- (void)setTopicSetVersion:(int64_t)a3
{
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2367E8224(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))DUGlobalTopicSetIdentifier.copy(with:));
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DUGlobalTopicSetIdentifier.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier *)DUGlobalTopicSetIdentifier.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier)init
{
  return (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier *)DUGlobalTopicSetIdentifier.init()();
}

@end