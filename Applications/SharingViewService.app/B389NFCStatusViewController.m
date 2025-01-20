@interface B389NFCStatusViewController
- (_TtC18SharingViewService27B389NFCStatusViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService27B389NFCStatusViewController)initWithMainController:(id)a3;
- (_TtC18SharingViewService27B389NFCStatusViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_dismiss;
- (void)_dismissX;
- (void)contactPressed;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation B389NFCStatusViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10002F434(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_10003259C(a3);
}

- (void)contactPressed
{
  v2 = self;
  sub_1000326F8();
}

- (void)_dismiss
{
  v2 = self;
  sub_100033DA8(0, 0);
}

- (void)_dismissX
{
  v2 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_onDoneAction);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_onDoneAction);
  void *v2 = 0;
  v2[1] = 0;
  v4 = self;
  sub_100017C38(v3);
  sub_100033DA8(0, 0);
}

- (_TtC18SharingViewService27B389NFCStatusViewController)initWithMainController:(id)a3
{
  id v3 = a3;
  v4 = (_TtC18SharingViewService27B389NFCStatusViewController *)sub_100034A68((uint64_t)v3);

  return v4;
}

- (_TtC18SharingViewService27B389NFCStatusViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18SharingViewService27B389NFCStatusViewController *)sub_10003407C(v5, v7, a4);
}

- (_TtC18SharingViewService27B389NFCStatusViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService27B389NFCStatusViewController *)sub_1000342D4(a3);
}

- (void).cxx_destruct
{
  sub_100017C38(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_onDoneAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_previousNFCConfig));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_coalescer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_nfcConfig));
  sub_100017C38(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_responseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_bigBtn));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_numberLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_msgLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_connectingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_spinner));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_player));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_heightConstraint));

  swift_bridgeObjectRelease();
}

@end