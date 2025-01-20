@interface AFGetNowPlayingInfoDictionary
@end

@implementation AFGetNowPlayingInfoDictionary

void ___AFGetNowPlayingInfoDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___AFGetNowPlayingInfoDictionary_block_invoke_2;
  block[3] = &unk_1E592C598;
  id v11 = v5;
  id v12 = v6;
  v7 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void ___AFGetNowPlayingInfoDictionary_block_invoke_120(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  [a2 firstObject];
  id v8 = (id)MRContentItemCopyNowPlayingInfo();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___AFGetNowPlayingInfoDictionary_block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  if (v2 && !a1[5])
  {
    v4 = [v2 playbackQueue];
    id v5 = [v4 contentItems];
    id v9 = [v5 firstObject];

    uint64_t v6 = a1[6];
    id v7 = [v9 nowPlayingInfo];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
  else
  {
    v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[5];
      *(_DWORD *)buf = 136315394;
      id v11 = "_AFGetNowPlayingInfoDictionary_block_invoke_2";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Failed to get response: %@", buf, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

@end