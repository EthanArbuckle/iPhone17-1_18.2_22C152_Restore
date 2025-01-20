@interface CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand
@end

@implementation CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand

void ___CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E4F965A8];
  id v7 = a2;
  id v8 = [v6 alloc];
  v9 = (void *)[v8 initWithErrorCode:*MEMORY[0x1E4F97448]];
  v10 = [v7 objectForKey:*MEMORY[0x1E4F77508]];

  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v12 = &stru_1EEE35D28;
    *(_DWORD *)v14 = 136315650;
    *(void *)&v14[4] = "_CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand_block_invoke";
    *(_WORD *)&v14[12] = 2112;
    if (v5) {
      v12 = v5;
    }
    *(void *)&v14[14] = v10;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s kMRMediaRemoteNowPlayingInfoIsAlwaysLive = %@ %@", v14, 0x20u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v10 BOOLValue])
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v14 = 136315138;
      *(void *)&v14[4] = "_CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand_block_invoke";
      _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s Reporting SAMPExceededSkipLimitErrorCode instead, because media is always live", v14, 0xCu);
    }
    objc_msgSend(v9, "setErrorCode:", *MEMORY[0x1E4F97390], *(_OWORD *)v14);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end