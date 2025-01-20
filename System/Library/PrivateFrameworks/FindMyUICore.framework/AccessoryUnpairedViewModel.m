@interface AccessoryUnpairedViewModel
- (void)secondaryButtonAction;
@end

@implementation AccessoryUnpairedViewModel

- (void)secondaryButtonAction
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  sub_24E706098(113, 1, 0);
  swift_release();

  swift_release();
}

@end