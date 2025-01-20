@interface FMUIAccessoryOnboardingCoordinator
- (BOOL)shouldShowFMOnboardingFlow;
- (FMUIAccessoryOnboardingCoordinator)init;
- (FMUIAccessoryOnboardingCoordinator)initWithPopoverPresenter:(id)a3 accessory:(id)a4;
- (FMUIAccessoryOnboardingCoordinator)initWithPresenter:(id)a3 accessory:(id)a4;
- (FMUIAccessoryOnboardingCoordinatorDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation FMUIAccessoryOnboardingCoordinator

- (FMUIAccessoryOnboardingCoordinatorDelegate)delegate
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = (char *)v3 + OBJC_IVAR___FMUIAccessoryOnboardingCoordinator_delegate;
  swift_beginAccess();
  v5 = (void *)MEMORY[0x2533436E0](v4);
  swift_release();

  swift_release();

  return (FMUIAccessoryOnboardingCoordinatorDelegate *)v5;
}

- (void)setDelegate:(id)a3
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_unknownObjectRetain();
  v4 = self;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
}

- (FMUIAccessoryOnboardingCoordinator)initWithPresenter:(id)a3 accessory:(id)a4
{
  return (FMUIAccessoryOnboardingCoordinator *)sub_24E6F4444((uint64_t)self, (uint64_t)a2, a3, a4, 54, (uint64_t (*)(void *, void *))AccessoryOnboardingCoordinator.init(presenter:accessory:));
}

- (FMUIAccessoryOnboardingCoordinator)initWithPopoverPresenter:(id)a3 accessory:(id)a4
{
  return (FMUIAccessoryOnboardingCoordinator *)sub_24E6F4444((uint64_t)self, (uint64_t)a2, a3, a4, 67, (uint64_t (*)(void *, void *))AccessoryOnboardingCoordinator.init(presenter:accessory:));
}

- (BOOL)shouldShowFMOnboardingFlow
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  Swift::Bool v4 = AccessoryOnboardingCoordinator.shouldShowFMOnboardingFlow()();
  swift_release();

  return v4;
}

- (void)start
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  AccessoryOnboardingCoordinator.start()();

  swift_release();
}

- (FMUIAccessoryOnboardingCoordinator)init
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (FMUIAccessoryOnboardingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24E577458((uint64_t)self + OBJC_IVAR___FMUIAccessoryOnboardingCoordinator_delegate);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  sub_24E6F7990((uint64_t)self + OBJC_IVAR___FMUIAccessoryOnboardingCoordinator_viewModel);
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR___FMUIAccessoryOnboardingCoordinator_logger;
  uint64_t v4 = sub_24E862168();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end