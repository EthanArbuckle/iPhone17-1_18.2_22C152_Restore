@interface AFGetPlaybackState
@end

@implementation AFGetPlaybackState

void ___AFGetPlaybackState_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___AFGetPlaybackState_block_invoke_2;
  block[3] = &unk_1E592C598;
  id v11 = v6;
  id v12 = v5;
  v7 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

uint64_t ___AFGetPlaybackState_block_invoke_116(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    v7 = "_AFGetPlaybackState_block_invoke";
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Done MRMediaRemoteGetNowPlayingApplicationPlaybackState() (state = %u)", (uint8_t *)&v6, 0x12u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___AFGetPlaybackState_block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (v2 || (id v5 = (void *)a1[5]) == 0)
  {
    v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      int v9 = (void *)a1[5];
      int v10 = 136315650;
      id v11 = "_AFGetPlaybackState_block_invoke";
      __int16 v12 = 2112;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v2;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Failed -[MRNowPlayingController performRequestWithCompletion:] (response = %@, error = %@)", (uint8_t *)&v10, 0x20u);
    }
    v4 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    int v6 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      id v11 = "_AFGetPlaybackState_block_invoke_2";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s Succeeded -[MRNowPlayingController performRequestWithCompletion:] (response = %@)", (uint8_t *)&v10, 0x16u);
      id v5 = (void *)a1[5];
    }
    uint64_t v7 = a1[6];
    [v5 playbackState];
    v4 = *(uint64_t (**)(void))(v7 + 16);
  }
  return v4();
}

@end