@interface FastSyncActivitySession
- (void)assertionWillInvalidate:(id)a3;
@end

@implementation FastSyncActivitySession

- (void)assertionWillInvalidate:(id)a3
{
  uint64_t v4 = one-time initialization token for host;
  id v10 = a3;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.host);
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B0DF7000, v7, v8, "[Assertion] DomainAssertionObserver assertionWillInvalidate for app.", v9, 2u);
    MEMORY[0x1B3EA39E0](v9, -1, -1);
  }
}

@end