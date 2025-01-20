@interface DPDaemonConnection
@end

@implementation DPDaemonConnection

uint64_t __54___DPDaemonConnection_recordNumbers_forKey_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63___DPDaemonConnection_recordNumbers_metadata_forKey_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61___DPDaemonConnection_recordNumbersVectors_forKey_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70___DPDaemonConnection_recordNumbersVectors_metadata_forKey_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56___DPDaemonConnection_recordBitValues_forKey_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65___DPDaemonConnection_recordBitValues_metadata_forKey_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57___DPDaemonConnection_recordBitVectors_forKey_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66___DPDaemonConnection_recordBitVectors_metadata_forKey_withReply___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = +[_DPLog framework];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1DC55E000, v2, OS_LOG_TYPE_DEFAULT, "End: recordBitVectors:metadata: for key %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __59___DPDaemonConnection_recordFloatVectors_forKey_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68___DPDaemonConnection_recordFloatVectors_metadata_forKey_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54___DPDaemonConnection_recordStrings_forKey_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63___DPDaemonConnection_recordStrings_metadata_forKey_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52___DPDaemonConnection_recordWords_forKey_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55___DPDaemonConnection_reportsNotYetSubmittedWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47___DPDaemonConnection_retireReports_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end