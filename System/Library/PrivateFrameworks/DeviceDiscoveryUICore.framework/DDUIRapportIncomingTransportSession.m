@interface DDUIRapportIncomingTransportSession
@end

@implementation DDUIRapportIncomingTransportSession

void __75___DDUIRapportIncomingTransportSession_sendMessage_withTimeout_completion___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  v8 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    int v12 = 134218754;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1CFC71000, v8, OS_LOG_TYPE_DEFAULT, "_DDUIRapportIncomingTransportSession finished sending message {self: %p, messageID: %@, inResponse: %@ inError: %@}", (uint8_t *)&v12, 0x2Au);
  }

  uint64_t v11 = a1[6];
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v7);
  }
}

@end