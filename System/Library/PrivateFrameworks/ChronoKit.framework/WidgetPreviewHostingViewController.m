@interface WidgetPreviewHostingViewController
- (CHSInlineTextParameters)inlineTextParameters;
- (CHSWidgetTintParameters)tintParameters;
- (_TtC9ChronoKit34WidgetPreviewHostingViewController)initWithCoder:(id)a3;
- (void)setInlineTextParameters:(id)a3;
- (void)setTintParameters:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation WidgetPreviewHostingViewController

- (_TtC9ChronoKit34WidgetPreviewHostingViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_isLuminanceReduced) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_tintParameters) = 0;
  id v4 = a3;

  result = (_TtC9ChronoKit34WidgetPreviewHostingViewController *)sub_1DA98CBB8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DA86D04C();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DA86D1D8();
}

- (CHSWidgetTintParameters)tintParameters
{
  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_tintParameters);
  swift_beginAccess();
  return (CHSWidgetTintParameters *)*v2;
}

- (void)setTintParameters:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_tintParameters);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_1DA86D420();
}

- (CHSInlineTextParameters)inlineTextParameters
{
  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters);
  swift_beginAccess();
  return (CHSInlineTextParameters *)*v2;
}

- (void)setInlineTextParameters:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_1DA86D420();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(UIView **)((char *)&self->super.super.super._view
                  + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_autoupdatingPreviewView);
  id v4 = *(UITabBarItem **)((char *)&self->super.super.super._tabBarItem
                        + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_autoupdatingPreviewView);
  swift_release();
  swift_release();

  swift_release();
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9ChronoKit34WidgetPreviewHostingViewController_tintParameters);
}

@end