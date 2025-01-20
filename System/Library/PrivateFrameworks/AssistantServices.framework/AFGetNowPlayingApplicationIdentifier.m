@interface AFGetNowPlayingApplicationIdentifier
@end

@implementation AFGetNowPlayingApplicationIdentifier

void ___AFGetNowPlayingApplicationIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___AFGetNowPlayingApplicationIdentifier_block_invoke_2;
  block[3] = &unk_1E592C598;
  id v11 = v5;
  id v12 = v6;
  v7 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void ___AFGetNowPlayingApplicationIdentifier_block_invoke_118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v4 = MRNowPlayingClientGetBundleIdentifier();
  }
  else
  {
    if (a3)
    {
      id v6 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315394;
        id v8 = "_AFGetNowPlayingApplicationIdentifier_block_invoke";
        __int16 v9 = 2112;
        uint64_t v10 = a3;
        _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s MRMediaRemoteGetNowPlayingClient failed with error %@", (uint8_t *)&v7, 0x16u);
      }
    }
    v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___AFGetNowPlayingApplicationIdentifier_block_invoke_2(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  if (v2 && !a1[5])
  {
    uint64_t v4 = a1[6];
    id v8 = [v2 playerPath];
    id v5 = [v8 client];
    id v6 = [v5 bundleIdentifier];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
  else
  {
    v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "_AFGetNowPlayingApplicationIdentifier_block_invoke_2";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Failed to get response: %@", buf, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

@end