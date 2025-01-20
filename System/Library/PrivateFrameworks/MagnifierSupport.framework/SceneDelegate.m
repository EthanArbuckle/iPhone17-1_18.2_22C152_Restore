@interface SceneDelegate
- (UIWindow)window;
- (_TtC16MagnifierSupport13SceneDelegate)init;
- (uint64_t)sceneDidBecomeActive:;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidEnterBackground:;
- (void)sceneWillEnterForeground:;
- (void)sceneWillResignActive:;
- (void)setWindow:(id)a3;
- (void)updateAppearanceForReduceTransparency:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC16MagnifierSupport13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16MagnifierSupport13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16MagnifierSupport13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_2358C2CBC(v8, v10);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_2358C3648(v7);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = (void (**)(void *, uint64_t))_Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_2358C0174(a4);
  v8[2](v8, 1);
  _Block_release(v8);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_2356594B0(0, &qword_26AF15248);
  sub_2358C467C((unint64_t *)&unk_26AF15250, &qword_26AF15248);
  uint64_t v6 = sub_235949FE8();
  id v7 = a3;
  id v8 = self;
  sub_2358C07A8(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)updateAppearanceForReduceTransparency:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF12EA0);
  MEMORY[0x270FA5388](v5 - 8, v6, v7, v8, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_235947498();
    uint64_t v12 = sub_2359474C8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_2359474C8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = self;
  sub_2358C2880();

  sub_23566A3AC((uint64_t)v11, &qword_26AF12EA0);
}

- (_TtC16MagnifierSupport13SceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16MagnifierSupport13SceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return [(SceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

- (uint64_t)sceneDidBecomeActive:
{
  uint64_t v0 = sub_2359481C8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2, v3, v4, v5);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v9, v10, v11, v12);
  v14 = (char *)&v26 - v13;
  if (qword_26880E3E0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_235948278();
  __swift_project_value_buffer(v15, (uint64_t)qword_26880F728);
  v16 = sub_235948258();
  os_log_type_t v17 = sub_23594A148();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_235640000, v16, v17, "Scene Became Active", v18, 2u);
    MEMORY[0x237DE9F30](v18, -1, -1);
  }

  if (qword_26880E4A8 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_2359481F8();
  __swift_project_value_buffer(v19, (uint64_t)qword_26880FB98);
  sub_2359481B8();
  v20 = sub_2359481D8();
  os_signpost_type_t v21 = sub_23594A328();
  if (sub_23594A5B8())
  {
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v7, v14, v0);
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    os_signpost_id_t v23 = sub_2359481A8();
    _os_signpost_emit_with_name_impl(&dword_235640000, v20, v21, v23, "SceneBecameActive", "", v22, 2u);
    MEMORY[0x237DE9F30](v22, -1, -1);

    v24 = *(void (**)(char *, uint64_t))(v1 + 8);
    v24(v14, v0);
    return ((uint64_t (*)(char *, uint64_t))v24)(v7, v0);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v14, v0);
  }
}

- (void)sceneWillResignActive:
{
  id v0 = objc_msgSend(self, sel_sharedApplication);
  objc_msgSend(v0, sel_setShortcutItems_, 0);

  if (qword_26880E3E0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_235948278();
  __swift_project_value_buffer(v1, (uint64_t)qword_26880F728);
  oslog = sub_235948258();
  os_log_type_t v2 = sub_23594A148();
  if (os_log_type_enabled(oslog, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_235640000, oslog, v2, "Scene Will Resign Active", v3, 2u);
    MEMORY[0x237DE9F30](v3, -1, -1);
  }
}

- (void)sceneWillEnterForeground:
{
  uint64_t v0 = sub_2359481C8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2, v3, v4, v5);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v9, v10, v11, v12);
  v14 = (char *)&v26 - v13;
  if (qword_26880E3E0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_235948278();
  __swift_project_value_buffer(v15, (uint64_t)qword_26880F728);
  v16 = sub_235948258();
  os_log_type_t v17 = sub_23594A148();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_235640000, v16, v17, "Scene Will Enter Foreground", v18, 2u);
    MEMORY[0x237DE9F30](v18, -1, -1);
  }

  if (qword_26880E4A8 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_2359481F8();
  __swift_project_value_buffer(v19, (uint64_t)qword_26880FB98);
  sub_2359481B8();
  v20 = sub_2359481D8();
  os_signpost_type_t v21 = sub_23594A328();
  if (sub_23594A5B8())
  {
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v7, v14, v0);
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    os_signpost_id_t v23 = sub_2359481A8();
    _os_signpost_emit_with_name_impl(&dword_235640000, v20, v21, v23, "SceneEnterFG", "", v22, 2u);
    MEMORY[0x237DE9F30](v22, -1, -1);

    v24 = *(void (**)(char *, uint64_t))(v1 + 8);
    v24(v14, v0);
    v24(v7, v0);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v1 + 8))(v14, v0);
  }
  id v25 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v25, sel_beginGeneratingDeviceOrientationNotifications);
}

- (void)sceneDidEnterBackground:
{
  if (qword_26880E3E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_235948278();
  __swift_project_value_buffer(v0, (uint64_t)qword_26880F728);
  uint64_t v1 = sub_235948258();
  os_log_type_t v2 = sub_23594A148();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_235640000, v1, v2, "Scene Did Enter Background", v3, 2u);
    MEMORY[0x237DE9F30](v3, -1, -1);
  }

  id v4 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v4, sel_endGeneratingDeviceOrientationNotifications);
}

@end