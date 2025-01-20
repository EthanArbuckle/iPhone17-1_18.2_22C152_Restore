@interface RemoteAlertDeactivationHandler
- (_TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler)init;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation RemoteAlertDeactivationHandler

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22B56FE64(v4);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_22B570080(v6, a4);
}

- (_TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler)init
{
  result = (_TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)remoteAlertHandleDidActivate:
{
  if (qword_268405398 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22B571130();
  __swift_project_value_buffer(v0, (uint64_t)qword_268405FA8);
  oslog = sub_22B571110();
  os_log_type_t v1 = sub_22B571370();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v5 = v3;
    *(_DWORD *)v2 = 136315138;
    sub_22B570404(0xD000000000000020, 0x800000022B5730A0, &v5);
    sub_22B5713D0();
    _os_log_impl(&dword_22B55C000, oslog, v1, "%s", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F4B780](v3, -1, -1);
    MEMORY[0x230F4B780](v2, -1, -1);
  }
  else
  {
  }
}

@end