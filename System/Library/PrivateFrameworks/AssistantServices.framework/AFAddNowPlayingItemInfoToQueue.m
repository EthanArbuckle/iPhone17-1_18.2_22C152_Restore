@interface AFAddNowPlayingItemInfoToQueue
@end

@implementation AFAddNowPlayingItemInfoToQueue

void ___AFAddNowPlayingItemInfoToQueue_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = [v9 domain];
    int v12 = [v11 isEqualToString:*MEMORY[0x1E4F77398]];

    if (v12 && ((uint64_t v13 = [v10 code], v13 == 35) || v13 == 4))
    {
      v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
        __int16 v71 = 2048;
        uint64_t v72 = v15;
        _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s group=%p No NowPlaying info because nothing is playing right now.", buf, 0x16u);
      }
    }
    else
    {
      v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
        __int16 v71 = 2048;
        uint64_t v72 = v49;
        __int16 v73 = 2112;
        uint64_t v74 = (uint64_t)v10;
        _os_log_error_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_ERROR, "%s group=%p Error getting NowPlaying queue %@", buf, 0x20u);
      }
    }
  }
  uint64_t v17 = [v8 count];
  v18 = AFSiriLogContextDaemon;
  v50 = v10;
  if (!v17 && os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
    __int16 v71 = 2048;
    uint64_t v72 = v19;
    _os_log_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_INFO, "%s group=%p no contentItems", buf, 0x16u);
    v18 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
    __int16 v71 = 2048;
    uint64_t v72 = v20;
    __int16 v73 = 2048;
    uint64_t v74 = v17;
    __int16 v75 = 2048;
    uint64_t v76 = a3;
    _os_log_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_INFO, "%s group=%p contentItems has %lu items location %ld", buf, 0x2Au);
  }
  if (v17 >= 1)
  {
    uint64_t v21 = 0;
    id v55 = v8;
    uint64_t v51 = a1;
    uint64_t v52 = a3;
    uint64_t v53 = v17;
    do
    {
      uint64_t v22 = v21 + a3;
      uint64_t v23 = objc_msgSend(v8, "objectAtIndex:", v21, v50);
      if (v21 + a3)
      {
        objc_msgSend(MEMORY[0x1E4F96808], "_af_mediaItemWithMRContentItemRef:", v23);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        if (v22 == 1)
        {
          v44 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            uint64_t v45 = a3;
            uint64_t v46 = *(void *)(a1 + 32);
            v47 = v44;
            v48 = [v24 title];
            *(_DWORD *)buf = 136315650;
            v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
            __int16 v71 = 2048;
            uint64_t v72 = v46;
            a3 = v45;
            id v8 = v55;
            __int16 v73 = 2112;
            uint64_t v74 = (uint64_t)v48;
            _os_log_impl(&dword_19CF1D000, v47, OS_LOG_TYPE_INFO, "%s group=%p next: %@", buf, 0x20u);
          }
          [*(id *)(a1 + 40) setNextListeningToItem:v24];
        }
        else if (v22 == -1)
        {
          v25 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = a3;
            uint64_t v27 = *(void *)(a1 + 32);
            v28 = v25;
            v29 = [v24 title];
            *(_DWORD *)buf = 136315650;
            v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
            __int16 v71 = 2048;
            uint64_t v72 = v27;
            a3 = v26;
            id v8 = v55;
            __int16 v73 = 2112;
            uint64_t v74 = (uint64_t)v29;
            _os_log_impl(&dword_19CF1D000, v28, OS_LOG_TYPE_INFO, "%s group=%p previous: %@", buf, 0x20u);
          }
          [*(id *)(a1 + 40) setPreviousListenedToItem:v24];
        }
      }
      else
      {
        v30 = (void *)MRContentItemCopyNowPlayingInfo();
        uint64_t v31 = *(void *)(a1 + 32);
        id v24 = v30;
        v32 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          v33 = (void *)MEMORY[0x1E4F28ED0];
          v34 = v32;
          v35 = objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
          *(_DWORD *)buf = 136315650;
          v70 = "_LogNowPlayingInfo";
          __int16 v71 = 2048;
          uint64_t v72 = v31;
          __int16 v73 = 2112;
          uint64_t v74 = (uint64_t)v35;
          _os_log_impl(&dword_19CF1D000, v34, OS_LOG_TYPE_INFO, "%s group=%p got NowPlaying info with %@ keys:", buf, 0x20u);
        }
        uint64_t v56 = v21;
        if (AFIsInternalInstall_onceToken != -1) {
          dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
        }
        if (AFIsInternalInstall_isInternal)
        {
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v54 = v24;
          id v36 = v24;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:buf count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v58;
            do
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v58 != v39) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v41 = *(void *)(*((void *)&v57 + 1) + 8 * i);
                v42 = [v36 objectForKey:v41];
                v43 = AFSiriLogContextDaemon;
                if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v61 = 136315906;
                  v62 = "_LogNowPlayingInfo";
                  __int16 v63 = 2048;
                  uint64_t v64 = v31;
                  __int16 v65 = 2112;
                  uint64_t v66 = v41;
                  __int16 v67 = 2112;
                  v68 = v42;
                  _os_log_impl(&dword_19CF1D000, v43, OS_LOG_TYPE_INFO, "%s %p         %@ -> %@:", v61, 0x2Au);
                }
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v57 objects:buf count:16];
            }
            while (v38);
          }

          id v24 = v54;
          id v8 = v55;
          a1 = v51;
          a3 = v52;
        }

        objc_msgSend(*(id *)(a1 + 40), "_af_setNowPlayingInfo:mediaType:", v24, MRContentItemGetMediaType());
        uint64_t v17 = v53;
        uint64_t v21 = v56;
      }

      ++v21;
    }
    while (v21 != v17);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end