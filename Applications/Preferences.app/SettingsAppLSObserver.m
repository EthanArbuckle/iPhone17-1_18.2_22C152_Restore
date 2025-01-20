@interface SettingsAppLSObserver
- (_TtC11SettingsApp21SettingsAppLSObserver)init;
- (void)observerDidObserveDatabaseChange:(id)a3;
@end

@implementation SettingsAppLSObserver

- (void)observerDidObserveDatabaseChange:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11SettingsApp21SettingsAppLSObserver_callback);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_1000A4454((uint64_t)v3);
    v3(v6);
    sub_10006BD44((uint64_t)v3);
  }
}

- (_TtC11SettingsApp21SettingsAppLSObserver)init
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp21SettingsAppLSObserver_callback);
  v4 = (objc_class *)type metadata accessor for SettingsAppLSObserver();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(SettingsAppLSObserver *)&v6 init];
}

- (void).cxx_destruct
{
}

@end