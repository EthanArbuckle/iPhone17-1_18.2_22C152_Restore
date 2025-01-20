@interface ASPasskeyConfigurationSubscriberApplicator
+ (id)supportedConfigurationTypes;
- (_TtC26AuthenticationServicesCore42ASPasskeyConfigurationSubscriberApplicator)init;
- (_TtC26AuthenticationServicesCore42ASPasskeyConfigurationSubscriberApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4;
@end

@implementation ASPasskeyConfigurationSubscriberApplicator

- (_TtC26AuthenticationServicesCore42ASPasskeyConfigurationSubscriberApplicator)init
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ASPasskeyConfigurationSubscriberAdapter()), sel_init);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ASPasskeyConfigurationSubscriberApplicator();
  v4 = [(RMConfigurationMultipleApplicator *)&v6 initWithAdapter:v3 inPlaceUpdates:1];

  return v4;
}

+ (id)supportedConfigurationTypes
{
  sub_2193B9548((uint64_t)&unk_26CAB4D80);
  swift_arrayDestroy();
  v2 = (void *)sub_2193E2A90();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtC26AuthenticationServicesCore42ASPasskeyConfigurationSubscriberApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  swift_unknownObjectRetain();
  result = (_TtC26AuthenticationServicesCore42ASPasskeyConfigurationSubscriberApplicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end