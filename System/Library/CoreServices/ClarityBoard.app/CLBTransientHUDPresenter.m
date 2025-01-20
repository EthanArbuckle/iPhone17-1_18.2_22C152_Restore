@interface CLBTransientHUDPresenter
- (CLBTransientHUDPresenter)init;
- (CLBTransientHUDPresenter)initWithWindow:(id)a3;
@end

@implementation CLBTransientHUDPresenter

- (CLBTransientHUDPresenter)initWithWindow:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBTransientHUDPresenter_dismissTask) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBTransientHUDPresenter_window) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TransientHUDPresenter();
  id v4 = a3;
  return [(CLBTransientHUDPresenter *)&v6 init];
}

- (CLBTransientHUDPresenter)init
{
  result = (CLBTransientHUDPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end