@interface ImageDataConfiguration
- (BOOL)activityItemsConfigurationSupportsInteraction:(id)a3;
- (NSArray)itemProvidersForActivityItemsConfiguration;
- (_TtC6Tamale22ImageDataConfiguration)init;
- (void)setItemProvidersForActivityItemsConfiguration:(id)a3;
@end

@implementation ImageDataConfiguration

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  sub_1003CFC3C();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setItemProvidersForActivityItemsConfiguration:(id)a3
{
  sub_1003CFC3C();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC6Tamale22ImageDataConfiguration_itemProvidersForActivityItemsConfiguration) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (BOOL)activityItemsConfigurationSupportsInteraction:(id)a3
{
  return 1;
}

- (_TtC6Tamale22ImageDataConfiguration)init
{
  result = (_TtC6Tamale22ImageDataConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC6Tamale22ImageDataConfiguration_fileWriter;

  _s6Tamale17AnyLocalizedErrorVwxx_0((uint64_t)v3);
}

@end