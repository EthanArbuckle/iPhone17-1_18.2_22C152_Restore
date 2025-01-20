@interface AccessoryPairedViewModel
- (void)primaryButtonAction;
- (void)secondaryButtonAction;
@end

@implementation AccessoryPairedViewModel

- (void)primaryButtonAction
{
  swift_retain();
  sub_24E700FC4();

  swift_release();
}

- (void)secondaryButtonAction
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  sub_24E7010B8();
  swift_release();

  swift_release();
}

@end