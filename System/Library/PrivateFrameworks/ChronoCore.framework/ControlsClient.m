@interface ControlsClient
- (_TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient)init;
- (void)allControlConfigurationsByHostWithCompletion:(id)a3;
- (void)controlDescriptorMatching:(id)a3 completion:(id)a4;
- (void)fetchControlDescriptorsForExtensionBundleIdentifier:(id)a3 userInitiated:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)invalidateControlHost:(id)a3;
- (void)performControlAction:(id)a3 completion:(id)a4;
- (void)reloadControlsForExtension:(id)a3 kind:(id)a4 reason:(id)a5;
- (void)sendPushToken:(id)a3 completion:(id)a4;
- (void)sendPushUpdate:(id)a3 completion:(id)a4;
- (void)setControlState:(id)a3 completion:(id)a4;
- (void)setEnvironmentModifiers:(id)a3 forSession:(id)a4;
- (void)setTaskPriority:(id)a3 forSession:(id)a4;
- (void)setVisibility:(id)a3 forSession:(id)a4;
- (void)subscribeToSessionWithRequest:(id)a3 completion:(id)a4;
- (void)unsubscribeFromSession:(id)a3;
- (void)unsubscribeToPushes:(id)a3 completion:(id)a4;
- (void)updateControlHost:(id)a3 activationState:(id)a4;
- (void)updateControlHost:(id)a3 configuration:(id)a4 activationState:(id)a5;
@end

@implementation ControlsClient

- (_TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient)init
{
  result = (_TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient__processHandle));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient__queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient__queue_connection));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)sendPushToken:(id)a3 completion:(id)a4
{
}

- (void)sendPushUpdate:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void *, void))_Block_copy(a4);
  id v7 = a3;
  v8 = self;
  BSDispatchQueueAssert();
  __swift_project_boxed_opaque_existential_1(*(void **)((char *)&v8->super.isa+ OBJC_IVAR____TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient__services)+ 37, (*(void **)((char *)&v8->super.isa+ OBJC_IVAR____TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient__services))[40]);
  sub_1DA9E92E4(v7);
  v6[2](v6, 0);
  _Block_release(v6);
}

- (void)unsubscribeToPushes:(id)a3 completion:(id)a4
{
}

- (void)reloadControlsForExtension:(id)a3 kind:(id)a4 reason:(id)a5
{
  uint64_t v7 = sub_1DAD27918();
  uint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = sub_1DAD27918();
    a4 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = sub_1DAD27918();
  uint64_t v14 = v13;
  v15 = self;
  sub_1DAC5E568(v7, v9, v10, (uint64_t)a4, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updateControlHost:(id)a3 configuration:(id)a4 activationState:(id)a5
{
  uint64_t v8 = sub_1DAD27918();
  uint64_t v10 = v9;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = self;
  sub_1DAC5E8C0(v8, v10, (uint64_t)a4, v12);

  swift_bridgeObjectRelease();
}

- (void)updateControlHost:(id)a3 activationState:(id)a4
{
  uint64_t v6 = sub_1DAD27918();
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  sub_1DAC5F0D8(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void)invalidateControlHost:(id)a3
{
  sub_1DAD27918();
  v4 = self;
  sub_1DAC5F7F8();

  swift_bridgeObjectRelease();
}

- (void)subscribeToSessionWithRequest:(id)a3 completion:(id)a4
{
}

- (void)unsubscribeFromSession:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  uint64_t v5 = sub_1DAD21E58();
  unint64_t v7 = v6;

  sub_1DAC5FEE4();
  sub_1DA9F1FD8(v5, v7);
}

- (void)setTaskPriority:(id)a3 forSession:(id)a4
{
}

- (void)setVisibility:(id)a3 forSession:(id)a4
{
}

- (void)setEnvironmentModifiers:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = self;
  uint64_t v8 = sub_1DAD21E58();
  unint64_t v10 = v9;

  uint64_t v11 = sub_1DAD21E58();
  unint64_t v13 = v12;

  sub_1DAC61044(v8, v10);
  sub_1DA9F1FD8(v11, v13);
  sub_1DA9F1FD8(v8, v10);
}

- (void)performControlAction:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  unint64_t v12 = self;
  uint64_t v8 = sub_1DAD21E58();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_1DAC61584(v8, v10, (uint64_t)sub_1DAA8D57C, v11);
  swift_release();
  sub_1DA9F1FD8(v8, v10);
}

- (void)setControlState:(id)a3 completion:(id)a4
{
}

- (void)fetchControlDescriptorsForExtensionBundleIdentifier:(id)a3 userInitiated:(id)a4 reason:(id)a5 completion:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_1DAD27918();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1DAD27918();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v8;
  id v16 = a4;
  v17 = self;
  sub_1DAC61AC8(v9, v11, v16, v12, v14, (uint64_t)sub_1DAAAF584, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)controlDescriptorMatching:(id)a3 completion:(id)a4
{
}

- (void)allControlConfigurationsByHostWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1DAC677C0((char *)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

@end