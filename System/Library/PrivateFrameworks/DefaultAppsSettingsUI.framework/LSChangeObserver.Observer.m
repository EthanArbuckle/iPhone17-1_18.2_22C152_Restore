@interface LSChangeObserver.Observer
- (_TtCC21DefaultAppsSettingsUI16LSChangeObserverP33_7689C6B5CF2FFB3629BA237567A0B8718Observer)init;
- (void)observerDidObserveDatabaseChange:(id)a3;
@end

@implementation LSChangeObserver.Observer

- (void)observerDidObserveDatabaseChange:(id)a3
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC21DefaultAppsSettingsUI16LSChangeObserverP33_7689C6B5CF2FFB3629BA237567A0B8718Observer_notify);
  id v5 = a3;
  v6 = self;
  uint64_t v7 = swift_retain();
  v4(v7);

  swift_release();
}

- (_TtCC21DefaultAppsSettingsUI16LSChangeObserverP33_7689C6B5CF2FFB3629BA237567A0B8718Observer)init
{
  result = (_TtCC21DefaultAppsSettingsUI16LSChangeObserverP33_7689C6B5CF2FFB3629BA237567A0B8718Observer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC21DefaultAppsSettingsUI16LSChangeObserverP33_7689C6B5CF2FFB3629BA237567A0B8718Observer_lsObserver);
}

@end