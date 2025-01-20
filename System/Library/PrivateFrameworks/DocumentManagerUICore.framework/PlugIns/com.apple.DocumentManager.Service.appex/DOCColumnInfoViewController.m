@interface DOCColumnInfoViewController
- (_TtC33com_apple_DocumentManager_Service27DOCColumnInfoViewController)initWithCoder:(id)a3;
- (_TtP33com_apple_DocumentManager_Service34DOCBrowserContainedActionReporting_)actionReporting;
- (id)actionContextFrom:(id)a3;
- (void)_doc_performLiveResizeSkipped_updateOverlay;
- (void)observeEditingStateChangedWithNotification:(id)a3;
- (void)setActionReporting:(id)a3;
- (void)viewDidLoad;
@end

@implementation DOCColumnInfoViewController

- (_TtP33com_apple_DocumentManager_Service34DOCBrowserContainedActionReporting_)actionReporting
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (_TtP33com_apple_DocumentManager_Service34DOCBrowserContainedActionReporting_ *)Strong;
}

- (void)setActionReporting:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100240520();

  swift_unknownObjectRelease();
}

- (_TtC33com_apple_DocumentManager_Service27DOCColumnInfoViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service27DOCColumnInfoViewController_itemInfoViewController) = 0;
  id v4 = a3;

  result = (_TtC33com_apple_DocumentManager_Service27DOCColumnInfoViewController *)sub_1004CEE70();
  __break(1u);
  return result;
}

- (void)observeEditingStateChangedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10023EC20(v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10023EE68();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service27DOCColumnInfoViewController_itemInfoViewController);
}

- (void)_doc_performLiveResizeSkipped_updateOverlay
{
  v2 = self;
  sub_1002400B8();
}

- (id)actionContextFrom:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1004CEA50();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  id v6 = sub_1003CCA58();

  sub_10003B3B8((uint64_t)v8, &qword_10062CB00);
  return v6;
}

@end