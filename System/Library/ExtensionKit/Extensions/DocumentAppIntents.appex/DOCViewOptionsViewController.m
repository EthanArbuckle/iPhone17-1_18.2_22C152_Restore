@interface DOCViewOptionsViewController
- (_TtC18DocumentAppIntents28DOCViewOptionsViewController)init;
- (_TtC18DocumentAppIntents28DOCViewOptionsViewController)initWithRootViewController:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DOCViewOptionsViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(DOCViewOptionsViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC18DocumentAppIntents28DOCViewOptionsViewController_viewOptionsHostingController], "navigationItem", v7.receiver, v7.super_class);
  if ([v4 _isInPopoverPresentation]) {
    v6 = 0;
  }
  else {
    v6 = sub_1003F53F4();
  }
  [v5 setRightBarButtonItem:v6];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  objc_super v7 = (char *)v10.receiver;
  -[DOCViewOptionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  id v8 = objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC18DocumentAppIntents28DOCViewOptionsViewController_viewOptionsHostingController], "navigationItem", v10.receiver, v10.super_class);
  if ([v7 _isInPopoverPresentation]) {
    v9 = 0;
  }
  else {
    v9 = sub_1003F53F4();
  }
  [v8 setRightBarButtonItem:v9];
  swift_unknownObjectRelease();
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = (char *)v12.receiver;
  [(DOCViewOptionsViewController *)&v12 preferredContentSizeDidChangeForChildContentContainer:a3];
  id v5 = *(void **)&v4[OBJC_IVAR____TtC18DocumentAppIntents28DOCViewOptionsViewController_viewOptionsHostingController];
  objc_msgSend(v5, "preferredContentSize", v12.receiver, v12.super_class);
  double v7 = v6;
  id v8 = [v4 navigationBar];
  [v8 intrinsicContentSize];
  double v10 = v9;

  [v5 preferredContentSize];
  objc_msgSend(v4, "setPreferredContentSize:", v7, v10 + v11);
  swift_unknownObjectRelease();
}

- (_TtC18DocumentAppIntents28DOCViewOptionsViewController)init
{
  result = (_TtC18DocumentAppIntents28DOCViewOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents28DOCViewOptionsViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC18DocumentAppIntents28DOCViewOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents28DOCViewOptionsViewController_viewOptionsHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents28DOCViewOptionsViewController____lazy_storage___doneBarButtonButtonItem));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents28DOCViewOptionsViewController____lazy_storage___dismissAction);
}

@end