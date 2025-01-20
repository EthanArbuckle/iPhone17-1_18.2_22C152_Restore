@interface BCSNFCCodeParser
- (void)postNotificationForURL:(id)a3 payload:(id)a4 completionHandler:(id)a5;
@end

@implementation BCSNFCCodeParser

- (void)postNotificationForURL:(id)a3 payload:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = +[BCSURLDataParser parseURL:a3];
  if (v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = [v10 type];
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSNFCCodeParser: Detected NFC URL has type %ld", buf, 0xCu);
    }
    if (!self->_notificationServiceConnection)
    {
      v11 = objc_alloc_init(BCSNotificationServiceConnection);
      notificationServiceConnection = self->_notificationServiceConnection;
      self->_notificationServiceConnection = v11;
    }
    v13 = [[BCSNFCCodePayload alloc] initWithNFCPayload:v8];
    v14 = self->_notificationServiceConnection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __69__BCSNFCCodeParser_postNotificationForURL_payload_completionHandler___block_invoke;
    v15[3] = &unk_26468B9E0;
    id v16 = v9;
    [(BCSNotificationServiceConnection *)v14 notifyParsedCodeWithData:v10 codePayload:v13 shouldReplacePreviousNotifications:0 withReply:v15];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BCSNFCCodeParser postNotificationForURL:payload:completionHandler:]();
    }
    v13 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, void, BCSNFCCodePayload *))v9 + 2))(v9, 0, v13);
  }
}

void __69__BCSNFCCodeParser_postNotificationForURL_payload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __69__BCSNFCCodeParser_postNotificationForURL_payload_completionHandler___block_invoke_cold_1(v5);
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:4 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSNFCCodeParser: Finished posting notification", v9, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void).cxx_destruct
{
}

- (void)postNotificationForURL:payload:completionHandler:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSNFCCodeParser: Does not recognize NFC URL", v0, 2u);
}

void __69__BCSNFCCodeParser_postNotificationForURL_payload_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  int v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSNFCCodeParser: Error posting notification: %@", (uint8_t *)&v2, 0xCu);
}

@end