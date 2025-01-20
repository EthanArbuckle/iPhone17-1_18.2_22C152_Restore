@interface BarAppearanceBridge
- (_TtC7SwiftUI19BarAppearanceBridge)init;
@end

@implementation BarAppearanceBridge

- (_TtC7SwiftUI19BarAppearanceBridge)init
{
  return (_TtC7SwiftUI19BarAppearanceBridge *)BarAppearanceBridge.init()();
}

- (void).cxx_destruct
{
  outlined destroy of BarAppearanceBridge.PlatformStorage((uint64_t)self + OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_platformStorage);
  outlined destroy of ToolbarPlacement.Role?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_updateContext, &lazy cache variable for type metadata for BarAppearanceBridge.UpdateContext?, (uint64_t)&type metadata for BarAppearanceBridge.UpdateContext);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  outlined consume of NavigationTitleStorage?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_lastNavigationTitleStorage), *(void *)&self->platformStorage[OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_lastNavigationTitleStorage], *(void *)&self->platformStorage[OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_lastNavigationTitleStorage + 8], *(void *)&self->platformStorage[OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_lastNavigationTitleStorage + 16], *(void *)&self->updateContext[OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_lastNavigationTitleStorage + 7]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end