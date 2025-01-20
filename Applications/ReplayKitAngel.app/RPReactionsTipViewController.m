@interface RPReactionsTipViewController
- (_TtC14ReplayKitAngel28RPReactionsTipViewController)initWithCoder:(id)a3;
- (_TtC14ReplayKitAngel28RPReactionsTipViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)prepareForPopoverPresentation:;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RPReactionsTipViewController

- (_TtC14ReplayKitAngel28RPReactionsTipViewController)initWithCoder:(id)a3
{
  return (_TtC14ReplayKitAngel28RPReactionsTipViewController *)sub_100025100(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100025210();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_100025700(v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100027F00();
}

- (_TtC14ReplayKitAngel28RPReactionsTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC14ReplayKitAngel28RPReactionsTipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView));
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (uint64_t)prepareForPopoverPresentation:
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  BOOL v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)v7 = 136315138;
    uint64_t v9 = sub_10001CEC4(0xD000000000000021, 0x8000000100037A90, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end