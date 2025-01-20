@interface LSChangeObserver.Observer
- (_TtCC27DefaultAppsSettingsUIPlugin16LSChangeObserverP33_8C266E9A54B8FCC77A7EDD4AE9F2EF1A8Observer)init;
- (void)observerDidObserveDatabaseChange:(id)a3;
@end

@implementation LSChangeObserver.Observer

- (void)observerDidObserveDatabaseChange:(id)a3
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC27DefaultAppsSettingsUIPlugin16LSChangeObserverP33_8C266E9A54B8FCC77A7EDD4AE9F2EF1A8Observer_notify);
  id v5 = a3;
  v6 = self;
  uint64_t v7 = swift_retain();
  v4(v7);

  swift_release();
}

- (_TtCC27DefaultAppsSettingsUIPlugin16LSChangeObserverP33_8C266E9A54B8FCC77A7EDD4AE9F2EF1A8Observer)init
{
  result = (_TtCC27DefaultAppsSettingsUIPlugin16LSChangeObserverP33_8C266E9A54B8FCC77A7EDD4AE9F2EF1A8Observer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC27DefaultAppsSettingsUIPlugin16LSChangeObserverP33_8C266E9A54B8FCC77A7EDD4AE9F2EF1A8Observer_lsObserver);
}

@end