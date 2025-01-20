@interface DiagnosticLogHandleForCategory
@end

@implementation DiagnosticLogHandleForCategory

void __DiagnosticLogHandleForCategory_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Diagnostics", "unspecified");
  v2 = (void *)DiagnosticLogHandleForCategory_logHandles;
  DiagnosticLogHandleForCategory_logHandles = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.Diagnostics", "host");
  v4 = (void *)qword_28080;
  qword_28080 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.Diagnostics", "networking");
  v6 = (void *)qword_28088;
  qword_28088 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.Diagnostics", "diagnostic");
  v8 = (void *)qword_28090;
  qword_28090 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.Diagnostics", "localization");
  v10 = (void *)qword_28098;
  qword_28098 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.Diagnostics", "ui");
  v12 = (void *)qword_280A0;
  qword_280A0 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.Diagnostics", "component");
  v14 = (void *)qword_280A8;
  qword_280A8 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.Diagnostics", "ids");
  v16 = (void *)qword_280B0;
  qword_280B0 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.Diagnostics", "xpc");
  v18 = (void *)qword_280B8;
  qword_280B8 = (uint64_t)v17;

  os_log_t v19 = os_log_create("com.apple.Diagnostics", "unit-test");
  v20 = (void *)qword_280C0;
  qword_280C0 = (uint64_t)v19;

  os_log_t v21 = os_log_create("com.apple.Diagnostics", "device-management");
  v22 = (void *)qword_280C8;
  qword_280C8 = (uint64_t)v21;

  qword_280D0 = (uint64_t)os_log_create("com.apple.Diagnostics", "enhanced-logging-state");

  _objc_release_x1();
}

@end