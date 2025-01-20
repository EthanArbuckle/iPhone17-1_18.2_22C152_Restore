@interface CAFUIProminentAncestorObserver
- (_TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver)init;
- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4;
@end

@implementation CAFUIProminentAncestorObserver

- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  if (MEMORY[0x24C5A0810]((char *)self+ OBJC_IVAR____TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver_delegate, a2, a3, a4))
  {
    id v6 = a3;
    v7 = self;
    CAFUITileDataSource.refreshProminentSection(reloadSection:)(1);

    swift_unknownObjectRelease();
  }
}

- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIProminentAncestorObserver.automakerSettingService(_:didUpdateHidden:)();
}

- (_TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver_observedAncestors) = (Class)MEMORY[0x263F8EE88];
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAFUIProminentAncestorObserver();
  return [(CAFUIProminentAncestorObserver *)&v4 init];
}

- (void).cxx_destruct
{
  outlined destroy of weak CAFUIAutomakerSettingObserverDelegate?((uint64_t)self + OBJC_IVAR____TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver_delegate);

  swift_bridgeObjectRelease();
}

@end