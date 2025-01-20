@interface NSXPCConnection(DOCAdditions)
- (BOOL)doc_hasSandboxAccessToFile:()DOCAdditions;
@end

@implementation NSXPCConnection(DOCAdditions)

- (BOOL)doc_hasSandboxAccessToFile:()DOCAdditions
{
  id v4 = a3;
  [a1 auditToken];
  id v5 = v4;
  [v5 fileSystemRepresentation];

  int v6 = sandbox_check_by_audit_token();
  if (v6 == -1)
  {
    int v7 = *__error();
    v8 = (NSObject **)MEMORY[0x263F3AC28];
    v9 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NSXPCConnection(DOCAdditions) doc_hasSandboxAccessToFile:](v7, v9);
    }
  }
  return v6 == 0;
}

- (void)doc_hasSandboxAccessToFile:()DOCAdditions .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21361D000, a2, OS_LOG_TYPE_ERROR, "Sandbox check returned error. errno=%d", (uint8_t *)v2, 8u);
}

@end