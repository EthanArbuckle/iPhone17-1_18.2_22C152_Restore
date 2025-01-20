@interface ControlCenterModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (BOOL)isDeviceUnlockedForControlCenterModuleViewController:(id)a3;
- (CCUIContentModuleContext)contentModuleContext;
- (NSString)moduleDescription;
- (_TtC33HomeControlCenterSingleTileModule19ControlCenterModule)init;
- (id)contentViewControllerForContext:(id)a3;
- (unint64_t)supportedGridSizeClasses;
- (void)controlCenterModuleViewController:(id)a3 didChangeDisplayedItems:(id)a4;
- (void)controlCenterModuleViewController:(id)a3 moduleDidDisappear:(BOOL)a4;
- (void)controlCenterModuleViewController:(id)a3 moduleWillAppear:(BOOL)a4;
- (void)dealloc;
- (void)launchHomeAppForControlCenterModuleViewController:(id)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation ControlCenterModule

- (_TtC33HomeControlCenterSingleTileModule19ControlCenterModule)init
{
  return (_TtC33HomeControlCenterSingleTileModule19ControlCenterModule *)ControlCenterModule.init()();
}

- (void)dealloc
{
  v2 = self;
  ControlCenterModule.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController));
  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (NSString)moduleDescription
{
  v2 = self;
  v3 = (void *)sub_2427901B0();
  id v4 = (id)HULocalizedString();

  sub_2427901C0();
  v5 = (void *)sub_2427901B0();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (unint64_t)supportedGridSizeClasses
{
  return 21;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void)setContentModuleContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context) = (Class)a3;
  id v3 = a3;
}

- (id)contentViewControllerForContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)_s33HomeControlCenterSingleTileModule0bcF0C21contentViewController3forSo011CCUIContentf7ContenthI0_So06UIViewI0CXcSo0kF19PresentationContextCSg_tF_0();

  return v6;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return (CCUIContentModuleContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context));
}

- (void)controlCenterModuleViewController:(id)a3 moduleWillAppear:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  _s33HomeControlCenterSingleTileModule0bcF0C07controlcF14ViewController_16moduleWillAppearySo09HUControlcfhI0C_SbtF_0();
}

- (void)controlCenterModuleViewController:(id)a3 didChangeDisplayedItems:(id)a4
{
  sub_24278F0FC(0, &qword_268D56FA8);
  sub_24278EE94();
  uint64_t v6 = sub_242790260();
  id v7 = a3;
  v8 = self;
  ControlCenterModule.controlCenterModuleViewController(_:didChangeDisplayedItems:)(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)controlCenterModuleViewController:(id)a3 moduleDidDisappear:(BOOL)a4
{
  uint64_t v6 = sub_242789B74(&qword_268D56D00);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  id v10 = a3;
  v11 = self;
  id v12 = objc_msgSend(v9, sel_sharedManager);
  objc_msgSend(v12, sel_exitModuleViewDidDisappear);

  sub_24278BA60();
  uint64_t v13 = sub_242790250();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  sub_242789D5C((uint64_t)v8, (uint64_t)&unk_268D56FA0, v14);

  swift_release();
}

- (void)launchHomeAppForControlCenterModuleViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ControlCenterModule.launchHomeApp(for:)(v4);
}

- (BOOL)isDeviceUnlockedForControlCenterModuleViewController:(id)a3
{
  return *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_lockState)
      && sub_24278F9AC();
}

@end