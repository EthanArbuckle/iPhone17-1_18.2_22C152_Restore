@interface ProgressViewServiceUIViewController
- (_TtC21TDGSharingViewService35ProgressViewServiceUIViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation ProgressViewServiceUIViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ProgressViewServiceUIViewController();
  v2 = (char *)v5.receiver;
  [(ProgressViewServiceUIViewController *)&v5 viewDidLoad];
  v3 = *(char **)&v2[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler];
  if (v3)
  {
    uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler + 8];
    sub_10002BDC4(*(void **)&v2[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler]);
    sub_100022158(v3, v4);

    swift_release();
    v2 = v3;
  }
}

- (_TtC21TDGSharingViewService35ProgressViewServiceUIViewController)initWithContentView:(id)a3
{
  objc_super v5 = &self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler];
  v6 = (objc_class *)type metadata accessor for ProgressViewServiceUIViewController();
  *(void *)objc_super v5 = 0;
  *((void *)v5 + 1) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(ViewServiceUIViewControllerExtendedHeight *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end