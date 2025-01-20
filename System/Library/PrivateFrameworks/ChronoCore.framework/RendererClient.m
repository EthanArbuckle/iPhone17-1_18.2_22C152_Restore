@interface RendererClient
- (_TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient)init;
- (void)handleInteraction:(id)a3 keybagLockPolicy:(id)a4 action:(id)a5 handler:(id)a6;
- (void)reloadWidget:(id)a3 reason:(id)a4;
- (void)reloadWidgetIfFailed:(id)a3 reason:(id)a4;
- (void)setEnvironmentModifiers:(id)a3 forSession:(id)a4;
- (void)setVisiblySettled:(id)a3 forSession:(id)a4;
- (void)setWidgetTaskPriority:(id)a3 forSession:(id)a4;
- (void)subscribe:(id)a3 completion:(id)a4;
- (void)unsubscribe:(id)a3;
@end

@implementation RendererClient

- (_TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient)init
{
  result = (_TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__processHandle));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__queue_connection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__queue_runningAssertion));
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__queue_runningAssertionExpirationTimer);
}

- (void)subscribe:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v11 = self;
  uint64_t v8 = sub_1DAD21E58();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_1DAC25B6C(v8, v10, v11, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_1DA9F1FD8(v8, v10);
}

- (void)unsubscribe:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DAC22B24(v4);
}

- (void)reloadWidget:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1DAC22EBC(v6, v7);
}

- (void)reloadWidgetIfFailed:(id)a3 reason:(id)a4
{
  __swift_project_boxed_opaque_existential_1(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__services)+ 35, (*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__services))[38]);
  id v11 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = objc_msgSend(v11, sel_widget);
  id v10 = objc_msgSend(v11, sel_metrics);
  LOBYTE(a3) = sub_1DAD25468();

  if (a3) {
    [(RendererClient *)v8 reloadWidget:v11 reason:v7];
  }
}

- (void)handleInteraction:(id)a3 keybagLockPolicy:(id)a4 action:(id)a5 handler:(id)a6
{
  id v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_1DAC233D0(v12, v13, v14, (uint64_t)sub_1DAA8D57C, v11);

  swift_release();
}

- (void)setVisiblySettled:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1DAC238F0(v6, v7);
}

- (void)setWidgetTaskPriority:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1DAC23C30(v6, v7);
}

- (void)setEnvironmentModifiers:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = self;
  uint64_t v8 = sub_1DAD21E58();
  unint64_t v10 = v9;

  sub_1DAC24274(v8, v10, v7);
  sub_1DA9F1FD8(v8, v10);
}

@end