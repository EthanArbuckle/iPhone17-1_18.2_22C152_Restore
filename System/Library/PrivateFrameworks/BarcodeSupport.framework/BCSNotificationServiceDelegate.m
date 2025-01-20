@interface BCSNotificationServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation BCSNotificationServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v30[8] = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.private.barcodesupport.allowNotifications"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v5 BOOLValue])
  {
    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D616098];
    v7 = (void *)MEMORY[0x263EFFA08];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v30[3] = objc_opt_class();
    v30[4] = objc_opt_class();
    v30[5] = objc_opt_class();
    v30[6] = objc_opt_class();
    v30[7] = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:8];
    v9 = [v7 setWithArray:v8];
    [v6 setClasses:v9 forSelector:sel_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply_ argumentIndex:0 ofReply:0];

    v10 = (void *)MEMORY[0x263EFFA08];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    v12 = [v10 setWithArray:v11];

    v13 = [v12 setByAddingObject:objc_opt_class()];

    v14 = [v13 setByAddingObject:objc_opt_class()];

    BOOL v15 = 1;
    [v6 setClasses:v14 forSelector:sel_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply_ argumentIndex:1 ofReply:0];
    v16 = (void *)MEMORY[0x263EFFA08];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    v18 = [v16 setWithArray:v17];
    [v6 setClasses:v18 forSelector:sel_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply_ argumentIndex:1 ofReply:1];

    v19 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D61CBF0];
    [v6 setInterface:v19 forSelector:sel_startNFCReaderWithDelegate_ argumentIndex:0 ofReply:0];

    [v4 setExportedInterface:v6];
    v20 = [[BCSNotificationService alloc] initWithConnection:v4];
    [v4 setExportedObject:v20];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __69__BCSNotificationServiceDelegate_listener_shouldAcceptNewConnection___block_invoke;
    v26 = &unk_26468AE90;
    v27 = v20;
    v21 = v20;
    [v4 setInvalidationHandler:&v23];
    objc_msgSend(v4, "resume", v23, v24, v25, v26);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BCSNotificationServiceDelegate listener:shouldAcceptNewConnection:](v4);
    }
    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __69__BCSNotificationServiceDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopNFCReader];
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = [a1 processIdentifier];
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSNotificationServiceDelegate: Connection rejected for lacking entitlement for pid %d", (uint8_t *)v1, 8u);
}

@end