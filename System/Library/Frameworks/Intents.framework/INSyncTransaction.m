@interface INSyncTransaction
@end

@implementation INSyncTransaction

void __70___INSyncTransaction_beginTransactionForBundleID_bundlePath_syncSlot___block_invoke(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v5 = @"can NOT";
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    if (a2) {
      v5 = @"can";
    }
    int v8 = 136315906;
    v9 = "+[_INSyncTransaction beginTransactionForBundleID:bundlePath:syncSlot:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_INFO, "%s %@ %@ sync %@", (uint8_t *)&v8, 0x2Au);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

@end