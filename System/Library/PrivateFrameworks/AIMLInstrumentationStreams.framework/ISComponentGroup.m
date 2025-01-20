@interface ISComponentGroup
- (ISComponentGroup)init;
- (ISComponentGroup)initWithEventsBridge:(id)a3;
- (ISComponentIdentifier)componentIdentifier;
- (NSArray)events;
@end

@implementation ISComponentGroup

- (ISComponentGroup)initWithEventsBridge:(id)a3
{
  sub_22AE80044();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ISComponentGroup_eventsInternal) = (Class)sub_22AEAA0F8();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ComponentGroupBridge();
  return [(ISComponentGroup *)&v5 init];
}

- (NSArray)events
{
  sub_22AE80044();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22AEAA0E8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (ISComponentIdentifier)componentIdentifier
{
  v2 = self;
  sub_22AE95290();
  v4 = v3;

  return (ISComponentIdentifier *)v4;
}

- (ISComponentGroup)init
{
  result = (ISComponentGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end