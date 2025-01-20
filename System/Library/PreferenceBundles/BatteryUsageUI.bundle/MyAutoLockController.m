@interface MyAutoLockController
- (id)specifiers;
@end

@implementation MyAutoLockController

- (id)specifiers
{
  v3 = BatteryUILocalization(@"AUTOLOCK");
  [(MyAutoLockController *)self setTitle:v3];

  uint64_t v4 = OBJC_IVAR___PSListController__specifiers;
  v5 = *(void **)&self->PSListItemsController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v5)
  {
    v6 = +[NSMutableArray array];
    v10.receiver = self;
    v10.super_class = (Class)MyAutoLockController;
    v7 = [(MyAutoLockController *)&v10 specifiers];
    [v6 addObjectsFromArray:v7];

    v8 = *(void **)&self->PSListItemsController_opaque[v4];
    *(void *)&self->PSListItemsController_opaque[v4] = v6;

    v5 = *(void **)&self->PSListItemsController_opaque[v4];
  }

  return v5;
}

@end