@interface BridgedColorPicker.Coordinator
- (_TtCV7SwiftUIP33_0B012DB3D42FBF9295A4AA29478C936C18BridgedColorPicker11Coordinator)init;
- (void)colorChanged:(id)a3;
@end

@implementation BridgedColorPicker.Coordinator

- (void)colorChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  BridgedColorPicker.Coordinator.colorChanged(_:)(v4);
}

- (_TtCV7SwiftUIP33_0B012DB3D42FBF9295A4AA29478C936C18BridgedColorPicker11Coordinator)init
{
  result = (_TtCV7SwiftUIP33_0B012DB3D42FBF9295A4AA29478C936C18BridgedColorPicker11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)&self->parent[OBJC_IVAR____TtCV7SwiftUIP33_0B012DB3D42FBF9295A4AA29478C936C18BridgedColorPicker11Coordinator_parent
                                  + 8]);
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

@end