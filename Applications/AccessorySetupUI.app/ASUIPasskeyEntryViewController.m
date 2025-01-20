@interface ASUIPasskeyEntryViewController
- (_TtC16AccessorySetupUI30ASUIPasskeyEntryViewController)initWithContentView:(id)a3;
- (void)didCompleteTextEntry:(id)a3;
- (void)textDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation ASUIPasskeyEntryViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ASUIPasskeyEntryViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (void)textDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002A6BC(v4);
}

- (void)didCompleteTextEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [(ASUIPasskeyEntryViewController *)v5 actions];
  sub_10002AC2C();
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v7 >> 62))
  {
    if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v7 & 0xC000000000000001) != 0)
  {
LABEL_11:
    id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_6;
  }
  if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return;
  }
  id v8 = *(id *)(v7 + 32);
LABEL_6:
  id v10 = v8;
  swift_bridgeObjectRelease();
  [v10 setEnabled:1];
}

- (_TtC16AccessorySetupUI30ASUIPasskeyEntryViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_type] = 4;
  id v6 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_routingContext];
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 1;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  *(void *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_router] = 0;
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(ASUIPasskeyEntryViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_10000CBC4(*(void *)&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_routingContext], *(void *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_routingContext], *(void *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_routingContext+ 7]);
  objc_super v3 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_router];

  sub_10000CC2C((uint64_t)v3);
}

@end