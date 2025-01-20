@interface SystemApertureAccessoryViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC9AirDropUI37SystemApertureAccessoryViewController)initWithCoder:(id)a3;
- (_TtC9AirDropUI37SystemApertureAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
@end

@implementation SystemApertureAccessoryViewController

- (_TtC9AirDropUI37SystemApertureAccessoryViewController)initWithCoder:(id)a3
{
  result = (_TtC9AirDropUI37SystemApertureAccessoryViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = [(SystemApertureAccessoryViewController *)v5 parentViewController];
  [v6 preferredContentSizeDidChangeForChildContentContainer:a3];
  swift_unknownObjectRelease();
}

- (_TtC9AirDropUI37SystemApertureAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9AirDropUI37SystemApertureAccessoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI37SystemApertureAccessoryViewController__view));
}

@end