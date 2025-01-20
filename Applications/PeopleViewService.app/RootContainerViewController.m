@interface RootContainerViewController
- (_TtC17PeopleViewService27RootContainerViewController)initWithCoder:(id)a3;
- (_TtC17PeopleViewService27RootContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)showMetrics;
@end

@implementation RootContainerViewController

- (void)showMetrics
{
  uint64_t v3 = type metadata accessor for MetricTemplateView();
  __chkstk_darwin(v3 - 8);
  v4 = self;
  MetricTemplateView.init(dragRefresh:)();
  id v5 = objc_allocWithZone((Class)sub_1000067F8(&qword_100026800));
  v6 = (void *)UIHostingController.init(rootView:)();
  sub_100011F60(v6);
}

- (void)loadView
{
  v2 = self;
  sub_100011E08();
}

- (_TtC17PeopleViewService27RootContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RootContainerViewController();
  v9 = [(RootContainerViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC17PeopleViewService27RootContainerViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootContainerViewController();
  return [(RootContainerViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView));
}

@end