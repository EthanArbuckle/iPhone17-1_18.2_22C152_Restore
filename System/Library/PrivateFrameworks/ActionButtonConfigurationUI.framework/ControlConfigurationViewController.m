@interface ControlConfigurationViewController
- (_TtC27ActionButtonConfigurationUI34ControlConfigurationViewController)initWithCoder:(id)a3;
- (_TtC27ActionButtonConfigurationUI34ControlConfigurationViewController)initWithOptions:(id)a3;
- (void)dealloc;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)widgetConfigurationViewController:(id)a3 didFinishWithIntent:(id)a4;
@end

@implementation ControlConfigurationViewController

- (_TtC27ActionButtonConfigurationUI34ControlConfigurationViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion) = 0;
  id v5 = a3;

  result = (_TtC27ActionButtonConfigurationUI34ControlConfigurationViewController *)sub_24740E480();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion);
  id v5 = self;
  if (v4) {
    objc_msgSend(v4, sel_invalidate);
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(WFWidgetConfigurationViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_2473D81A0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_configuredAction));
  swift_unknownObjectRelease();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_2473DE410(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_2473DE6EC(a3);
}

- (void)widgetConfigurationViewController:(id)a3 didFinishWithIntent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2473DE7B0(v6, v7);
}

- (_TtC27ActionButtonConfigurationUI34ControlConfigurationViewController)initWithOptions:(id)a3
{
  id v3 = a3;
  result = (_TtC27ActionButtonConfigurationUI34ControlConfigurationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end