@interface DOCColumnInfoViewController
- (_TtC17RecentsAppPopover27DOCColumnInfoViewController)initWithCoder:(id)a3;
- (_TtP17RecentsAppPopover34DOCBrowserContainedActionReporting_)actionReporting;
- (id)actionContextFrom:(id)a3;
- (void)_doc_performLiveResizeSkipped_updateOverlay;
- (void)observeEditingStateChangedWithNotification:(id)a3;
- (void)setActionReporting:(id)a3;
- (void)viewDidLoad;
@end

@implementation DOCColumnInfoViewController

- (id)actionContextFrom:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1004C0260();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  id v6 = sub_100227C3C();

  sub_1000516C4((uint64_t)v8, (uint64_t *)&unk_100618730);
  return v6;
}

- (_TtP17RecentsAppPopover34DOCBrowserContainedActionReporting_)actionReporting
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (_TtP17RecentsAppPopover34DOCBrowserContainedActionReporting_ *)Strong;
}

- (void)setActionReporting:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_10027E244();

  swift_unknownObjectRelease();
}

- (_TtC17RecentsAppPopover27DOCColumnInfoViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover27DOCColumnInfoViewController_itemInfoViewController) = 0;
  id v4 = a3;

  result = (_TtC17RecentsAppPopover27DOCColumnInfoViewController *)sub_1004C0670();
  __break(1u);
  return result;
}

- (void)observeEditingStateChangedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10027D754(v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10027D99C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover27DOCColumnInfoViewController_itemInfoViewController);
}

- (void)_doc_performLiveResizeSkipped_updateOverlay
{
  v2 = self;
  sub_10027DCC4();
}

@end