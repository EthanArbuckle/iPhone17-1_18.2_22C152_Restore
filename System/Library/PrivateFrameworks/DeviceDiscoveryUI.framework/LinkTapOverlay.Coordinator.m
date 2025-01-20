@interface LinkTapOverlay.Coordinator
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtCV17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90014LinkTapOverlay11Coordinator)init;
- (void)didTapLabel:(id)a3;
@end

@implementation LinkTapOverlay.Coordinator

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = objc_msgSend(v6, sel_view);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v7, sel_locationInView_, v9);

    unint64_t v11 = sub_24CB08C88();
    unint64_t v12 = v11;
    if (v11) {
      sub_24CB0BDEC(v11);
    }

    LOBYTE(v9) = v12 != 0;
  }
  else
  {
    __break(1u);
  }
  return (char)v9;
}

- (void)didTapLabel:(id)a3
{
  id v4 = a3;
  id v9 = self;
  id v5 = objc_msgSend(v4, sel_view);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v4, sel_locationInView_, v5);

    id v7 = (void (*)(void))sub_24CB08C88();
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      v7();
      sub_24CB0BDEC(v8);
    }
  }
  else
  {
    __break(1u);
  }
}

- (_TtCV17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90014LinkTapOverlay11Coordinator)init
{
  result = (_TtCV17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90014LinkTapOverlay11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90014LinkTapOverlay11Coordinator_layoutManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90014LinkTapOverlay11Coordinator_textContainer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90014LinkTapOverlay11Coordinator_textStorage);
}

@end