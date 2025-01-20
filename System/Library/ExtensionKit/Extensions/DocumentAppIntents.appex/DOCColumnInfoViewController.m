@interface DOCColumnInfoViewController
- (_TtC18DocumentAppIntents27DOCColumnInfoViewController)initWithCoder:(id)a3;
- (_TtP18DocumentAppIntents34DOCBrowserContainedActionReporting_)actionReporting;
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
    sub_1004F5D00();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  id v6 = sub_1002202B0();

  sub_10004B8B4((uint64_t)v8, &qword_10065B250);

  return v6;
}

- (_TtP18DocumentAppIntents34DOCBrowserContainedActionReporting_)actionReporting
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP18DocumentAppIntents34DOCBrowserContainedActionReporting_ *)Strong;
}

- (void)setActionReporting:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_10028F2F8();

  swift_unknownObjectRelease();
}

- (_TtC18DocumentAppIntents27DOCColumnInfoViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents27DOCColumnInfoViewController_itemInfoViewController) = 0;
  id v4 = a3;

  result = (_TtC18DocumentAppIntents27DOCColumnInfoViewController *)sub_1004F6110();
  __break(1u);
  return result;
}

- (void)observeEditingStateChangedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10028E808(v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10028EA50();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents27DOCColumnInfoViewController_itemInfoViewController);
}

- (void)_doc_performLiveResizeSkipped_updateOverlay
{
  v2 = self;
  sub_10028ED78();
}

@end