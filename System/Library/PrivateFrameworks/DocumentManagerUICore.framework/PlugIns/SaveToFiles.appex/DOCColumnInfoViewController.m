@interface DOCColumnInfoViewController
- (_TtC11SaveToFiles27DOCColumnInfoViewController)initWithCoder:(id)a3;
- (_TtP11SaveToFiles34DOCBrowserContainedActionReporting_)actionReporting;
- (id)actionContextFrom:(id)a3;
- (void)_doc_performLiveResizeSkipped_updateOverlay;
- (void)observeEditingStateChangedWithNotification:(id)a3;
- (void)setActionReporting:(id)a3;
- (void)viewDidLoad;
@end

@implementation DOCColumnInfoViewController

- (_TtP11SaveToFiles34DOCBrowserContainedActionReporting_)actionReporting
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (_TtP11SaveToFiles34DOCBrowserContainedActionReporting_ *)Strong;
}

- (void)setActionReporting:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100141CD8();

  swift_unknownObjectRelease();
}

- (_TtC11SaveToFiles27DOCColumnInfoViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles27DOCColumnInfoViewController_itemInfoViewController) = 0;
  id v4 = a3;

  result = (_TtC11SaveToFiles27DOCColumnInfoViewController *)sub_1004D2DC0();
  __break(1u);
  return result;
}

- (void)observeEditingStateChangedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001403D8(v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100140620();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles27DOCColumnInfoViewController_itemInfoViewController);
}

- (void)_doc_performLiveResizeSkipped_updateOverlay
{
  v2 = self;
  sub_100141870();
}

- (id)actionContextFrom:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  id v6 = sub_1003BE628();

  sub_10003D810((uint64_t)v8, &qword_10062D740);
  return v6;
}

@end