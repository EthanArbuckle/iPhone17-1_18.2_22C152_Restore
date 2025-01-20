@interface AFAddPlaybackStateToQueue
@end

@implementation AFAddPlaybackStateToQueue

void ___AFAddPlaybackStateToQueue_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = v4;
    v7 = AFStringFromMRPlaybackState(a2);
    int v14 = 136315650;
    v15 = "_AFAddPlaybackStateToQueue_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s group=%p MRMediaRemoteGetNowPlayingApplicationPlaybackState gave us state %@", (uint8_t *)&v14, 0x20u);
  }
  if (a2 == 4)
  {
    v8 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(unsigned int *)(a1 + 48);
      v11 = v8;
      v12 = AFStringFromMRPlaybackState(v10);
      int v14 = 136315650;
      v15 = "_AFAddPlaybackStateToQueue_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s group=%p Treating kMRPlaybackStateInterrupted as %@", (uint8_t *)&v14, 0x20u);
    }
    LODWORD(a2) = *(_DWORD *)(a1 + 48);
  }
  if ((a2 - 1) > 4) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = dword_19D0E2654[(int)a2 - 1];
  }
  [*(id *)(a1 + 40) setState:v13];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end