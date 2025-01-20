@interface DOCNodeContextMenuConfiguration
- (_TtC11SaveToFiles31DOCNodeContextMenuConfiguration)init;
@end

@implementation DOCNodeContextMenuConfiguration

- (_TtC11SaveToFiles31DOCNodeContextMenuConfiguration)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11SaveToFiles31DOCNodeContextMenuConfiguration_nodes) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles31DOCNodeContextMenuConfiguration_presentingNode) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCNodeContextMenuConfiguration();
  return [(DOCNodeContextMenuConfiguration *)&v3 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end