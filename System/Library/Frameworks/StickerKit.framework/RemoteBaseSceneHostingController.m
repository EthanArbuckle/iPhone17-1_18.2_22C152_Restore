@interface RemoteBaseSceneHostingController
- (_TtC10StickerKit32RemoteBaseSceneHostingController)initWithCoder:(id)a3;
- (_TtC10StickerKit32RemoteBaseSceneHostingController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)activityType;
- (id)transitionerForConnectingHostingController:(id)a3;
- (void)dealloc;
- (void)sendAction:(id)a3;
- (void)viewDidLoad;
@end

@implementation RemoteBaseSceneHostingController

- (id)activityType
{
  v2 = (void *)sub_2453FFB08();

  return v2;
}

- (void)sendAction:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  v6 = self;
  sub_245400168();
  swift_release();
  swift_release();
  objc_msgSend(v7, sel_sendAction_, v5);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteBaseSceneHostingController();
  id v2 = v6.receiver;
  [(RemoteBaseSceneHostingController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    sub_24531BF28();
  }
  else
  {
    __break(1u);
  }
}

- (id)transitionerForConnectingHostingController:(id)a3
{
  v5[4] = sub_2452ADC58;
  v5[5] = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_245311E20;
  v5[3] = &block_descriptor_27;
  id v3 = _Block_copy(v5);
  swift_release();

  return v3;
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10StickerKit32RemoteBaseSceneHostingController_keyboardSuppression);
  v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_invalidate);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoteBaseSceneHostingController();
  [(RemoteBaseSceneHostingController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  id v2 = (char *)self + OBJC_IVAR____TtC10StickerKit32RemoteBaseSceneHostingController__sceneHostingController;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED3D70);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_unknownObjectRelease();
}

- (_TtC10StickerKit32RemoteBaseSceneHostingController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_2453FFB38();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  sub_245203D98(0, (unint64_t *)&unk_268ED3CE0);
  v8 = self;
  id v9 = a4;
  sub_245400188();
  *(Class *)((char *)&v8->super.super.super.isa
           + OBJC_IVAR____TtC10StickerKit32RemoteBaseSceneHostingController_keyboardSuppression) = 0;

  if (v7)
  {
    v10 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for RemoteBaseSceneHostingController();
  v11 = [(RemoteBaseSceneHostingController *)&v13 initWithNibName:v10 bundle:v9];

  return v11;
}

- (_TtC10StickerKit32RemoteBaseSceneHostingController)initWithCoder:(id)a3
{
  sub_245203D98(0, (unint64_t *)&unk_268ED3CE0);
  id v5 = a3;
  uint64_t v6 = self;
  sub_245400188();
  *(Class *)((char *)&v6->super.super.super.isa
           + OBJC_IVAR____TtC10StickerKit32RemoteBaseSceneHostingController_keyboardSuppression) = 0;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for RemoteBaseSceneHostingController();
  uint64_t v7 = [(RemoteBaseSceneHostingController *)&v9 initWithCoder:v5];

  return v7;
}

@end