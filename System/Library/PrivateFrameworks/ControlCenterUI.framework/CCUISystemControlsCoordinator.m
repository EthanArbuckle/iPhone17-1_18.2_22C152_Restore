@interface CCUISystemControlsCoordinator
- (CCUISystemControlsCoordinator)init;
- (CCUISystemControlsCoordinator)initWithSystemHost:(id)a3;
- (void)beginObservingSystemState;
- (void)endObservingSystemState;
- (void)userInterfaceStyleModeDidChange:(id)a3;
@end

@implementation CCUISystemControlsCoordinator

- (CCUISystemControlsCoordinator)initWithSystemHost:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISystemControlsCoordinator_userInterfaceStyleMode) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISystemControlsCoordinator_silentModeObservation) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISystemControlsCoordinator_systemHost) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)CCUISystemControlsCoordinator;
  swift_unknownObjectRetain();
  return [(CCUISystemControlsCoordinator *)&v4 init];
}

- (void)beginObservingSystemState
{
  v2 = self;
  sub_1D7B9F9D0();
}

- (void)endObservingSystemState
{
  v2 = self;
  sub_1D7B9FC08();
}

- (CCUISystemControlsCoordinator)init
{
  result = (CCUISystemControlsCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)userInterfaceStyleModeDidChange:(id)a3
{
}

@end