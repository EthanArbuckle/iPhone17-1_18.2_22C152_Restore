@interface ViewServiceUIViewControllerExtendedHeight
- (_TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation ViewServiceUIViewControllerExtendedHeight

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100027B60();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  v4 = (char *)v7.receiver;
  [(ViewServiceUIViewControllerExtendedHeight *)&v7 viewDidAppear:v3];
  v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler];
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_10000AE58((uint64_t)v5);
  }
}

- (_TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight)initWithContentView:(id)a3
{
  swift_weakInit();
  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler];
  uint64_t v6 = (objc_class *)type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(ViewServiceUIViewControllerExtendedHeight *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  uint64_t v3 = *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler];

  sub_10000AE58(v3);
}

@end