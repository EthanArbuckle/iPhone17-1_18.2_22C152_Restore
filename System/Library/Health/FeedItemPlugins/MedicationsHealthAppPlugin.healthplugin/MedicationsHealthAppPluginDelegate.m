@interface MedicationsHealthAppPluginDelegate
- (_TtC26MedicationsHealthAppPlugin34MedicationsHealthAppPluginDelegate)init;
- (id)makeDataListViewControllerForHealthStore:(id)a3 displayType:(id)a4 predicate:(id)a5;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MedicationsHealthAppPluginDelegate

- (_TtC26MedicationsHealthAppPlugin34MedicationsHealthAppPluginDelegate)init
{
  return (_TtC26MedicationsHealthAppPlugin34MedicationsHealthAppPluginDelegate *)sub_2410EC084();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin34MedicationsHealthAppPluginDelegate_healthStore));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26MedicationsHealthAppPlugin34MedicationsHealthAppPluginDelegate_scheduleControl);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (id)makeDataListViewControllerForHealthStore:(id)a3 displayType:(id)a4 predicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_2410F26C0((uint64_t)v8, v9);

  return v12;
}

@end