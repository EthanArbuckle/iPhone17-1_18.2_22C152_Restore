@interface SAMPQueueState(SiriMediaRemoteHelpers)
- (id)_mediaItemIdURLFromNowPlayingInfo:()SiriMediaRemoteHelpers;
- (id)_mediaTypeFromNowPlayingInfo:()SiriMediaRemoteHelpers;
- (void)_af_setNowPlayingInfo:()SiriMediaRemoteHelpers mediaType:;
- (void)_af_setShuffleModeFromNowPlayingInfo:()SiriMediaRemoteHelpers;
- (void)_af_validateAndFinalize;
@end

@implementation SAMPQueueState(SiriMediaRemoteHelpers)

- (void)_af_validateAndFinalize
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [a1 applicationIdentifier];

  if (!v2)
  {
    if ([a1 state] == 1)
    {
      v3 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315138;
        v9 = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_validateAndFinalize]";
        _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s NowPlaying reports we are playing, but we have no ApplicationDisplayID for who is playing", (uint8_t *)&v8, 0xCu);
      }
    }
    v4 = [a1 listeningToItem];

    if (v4)
    {
      v5 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v6 = v5;
        v7 = [a1 listeningToItem];
        int v8 = 136315394;
        v9 = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_validateAndFinalize]";
        __int16 v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s We have a NowPlaying listeningToItem but no ApplicationDisplayID for it %@", (uint8_t *)&v8, 0x16u);
      }
    }
    [a1 setState:3];
    [a1 setListeningToItem:0];
    [a1 setPlaybackQueuePosition:0];
    [a1 setSource:0];
    [a1 setPlaybackRate:0];
  }
}

- (void)_af_setNowPlayingInfo:()SiriMediaRemoteHelpers mediaType:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v6 = AFValidatedNowPlayingInfo(a3);
  v7 = [v6 objectForKey:*MEMORY[0x1E4F77500]];
  int v8 = [v7 BOOLValue];

  v9 = (Class *)0x1E4F967B0;
  if (!v8) {
    v9 = (Class *)0x1E4F96808;
  }
  id v10 = objc_alloc_init(*v9);
  v11 = [v6 objectForKey:*MEMORY[0x1E4F775F0]];
  [v10 setTitle:v11];

  uint64_t v12 = [v6 objectForKey:*MEMORY[0x1E4F77418]];
  [v10 setAlbum:v12];

  v13 = [v6 objectForKey:*MEMORY[0x1E4F77430]];
  [v10 setArtist:v13];

  v14 = [v6 objectForKey:*MEMORY[0x1E4F77478]];
  [v10 setBrandIdentifier:v14];

  v15 = [v6 objectForKey:*MEMORY[0x1E4F774E0]];
  [v10 setExternalIdentifier:v15];

  v16 = AFGetCurrentItemAdamIDFromNowPlayingInfo(v6);
  v17 = [v16 stringValue];
  [v10 setAdamIdentifier:v17];

  switch(a4)
  {
    case 0:
      id v19 = [a1 _mediaTypeFromNowPlayingInfo:v6];
LABEL_12:
      [v10 setMediaType:v19];
      goto LABEL_14;
    case 1:
      v18 = (id *)MEMORY[0x1E4F97450];
      goto LABEL_9;
    case 2:
      v18 = (id *)MEMORY[0x1E4F97458];
LABEL_9:
      id v19 = *v18;
      goto LABEL_11;
  }
  id v19 = 0;
LABEL_11:
  if ([v19 length]) {
    goto LABEL_12;
  }
  v20 = [a1 _mediaTypeFromNowPlayingInfo:v6];
  [v10 setMediaType:v20];

LABEL_14:
  v21 = [a1 _mediaItemIdURLFromNowPlayingInfo:v6];
  [v10 setIdentifier:v21];

  id v22 = objc_alloc_init(MEMORY[0x1E4F96830]);
  v23 = [v6 objectForKey:*MEMORY[0x1E4F774C8]];
  v24 = v23;
  if (v23)
  {
    [v23 doubleValue];
    double v26 = v25;
    [v22 setDurationMillis:(uint64_t)(v25 * 1000.0)];
  }
  else
  {
    double v26 = -1.0;
  }
  v27 = [v6 objectForKey:*MEMORY[0x1E4F774D0]];
  v28 = (void *)MEMORY[0x1E4F77560];
  if (v27)
  {
    v29 = [v6 objectForKey:*MEMORY[0x1E4F775E8]];
    if (v29)
    {
      v30 = [MEMORY[0x1E4F1C9C8] date];
      [v30 timeIntervalSinceDate:v29];
      double v32 = v31;

      v33 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v60 = 136315394;
        *(void *)&v60[4] = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_setNowPlayingInfo:mediaType:]";
        *(_WORD *)&v60[12] = 2048;
        *(double *)&v60[14] = v32;
        _os_log_impl(&dword_19CF1D000, v33, OS_LOG_TYPE_INFO, "%s infoToNowOffset = %g", v60, 0x16u);
      }
    }
    else
    {
      double v32 = 0.0;
    }
    v34 = [v6 objectForKey:*v28];
    v35 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v60 = 136315394;
      *(void *)&v60[4] = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_setNowPlayingInfo:mediaType:]";
      *(_WORD *)&v60[12] = 2112;
      *(void *)&v60[14] = v34;
      _os_log_impl(&dword_19CF1D000, v35, OS_LOG_TYPE_INFO, "%s playbackRate = %@", v60, 0x16u);
    }
    if (v34)
    {
      [v34 doubleValue];
      double v32 = v32 * v36;
      v37 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v60 = 136315394;
        *(void *)&v60[4] = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_setNowPlayingInfo:mediaType:]";
        *(_WORD *)&v60[12] = 2048;
        *(double *)&v60[14] = v32;
        _os_log_impl(&dword_19CF1D000, v37, OS_LOG_TYPE_INFO, "%s adjusted infoToNowOffset = %g", v60, 0x16u);
      }
    }
    [v27 doubleValue];
    double v39 = v32 + v38;
    if (v39 >= v26) {
      double v40 = v26;
    }
    else {
      double v40 = v39;
    }
    if (v26 <= 0.0) {
      double v41 = v39;
    }
    else {
      double v41 = v40;
    }
    v42 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v60 = 136315394;
      *(void *)&v60[4] = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_setNowPlayingInfo:mediaType:]";
      *(_WORD *)&v60[12] = 2048;
      *(double *)&v60[14] = v41;
      _os_log_impl(&dword_19CF1D000, v42, OS_LOG_TYPE_INFO, "%s calculatedElapsedTime = %g", v60, 0x16u);
    }
    [v22 setPlaybackPositionMillis:(uint64_t)(v41 * 1000.0)];

    v28 = (void *)MEMORY[0x1E4F77560];
  }
  else if (!v24)
  {
    if (v8) {
      goto LABEL_44;
    }
    goto LABEL_40;
  }
  [v10 setPlaybackInfo:v22];
  if (v8) {
    goto LABEL_44;
  }
LABEL_40:
  v43 = [v10 title];
  if (v43
    || ([v10 album], (v43 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v10 artist], (v43 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v59 = [v10 identifier];

    if (!v59)
    {

      [a1 setListeningToItem:0];
      goto LABEL_48;
    }
  }
LABEL_44:
  [a1 setListeningToItem:v10];
  if (v10)
  {
    v44 = [v6 objectForKey:*MEMORY[0x1E4F77588]];

    v45 = (void *)MEMORY[0x1E4F97388];
    if (!v44) {
      v45 = (void *)MEMORY[0x1E4F97380];
    }
    [a1 setSource:*v45];
    v46 = [v6 objectForKey:*MEMORY[0x1E4F77540]];
    objc_msgSend(a1, "setCurrentItemSteerable:", objc_msgSend(v46, "BOOLValue"));
  }
LABEL_48:
  id v47 = objc_alloc_init(MEMORY[0x1E4F96828]);
  v48 = [v6 objectForKey:*MEMORY[0x1E4F77580]];
  objc_msgSend(v47, "setIndex:", objc_msgSend(v48, "unsignedIntegerValue"));
  v49 = [v6 objectForKey:*MEMORY[0x1E4F77608]];
  objc_msgSend(v47, "setQueueSize:", objc_msgSend(v49, "unsignedIntegerValue"));
  [a1 setPlaybackQueuePosition:v47];
  v50 = [v6 objectForKey:*v28];
  [v50 doubleValue];
  double v52 = v51;

  v53 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithDouble:v52];
  [a1 setPlaybackRate:v53];

  v54 = [v6 objectForKey:*MEMORY[0x1E4F77490]];
  if ([v54 count])
  {
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)v60 = MEMORY[0x1E4F143A8];
    *(void *)&v60[8] = 3221225472;
    *(void *)&v60[16] = ___ListeningToContainerFromNowPlayingInfo_block_invoke;
    v61 = &unk_1E592ACD0;
    id v56 = v55;
    id v62 = v56;
    [v54 enumerateKeysAndObjectsUsingBlock:v60];
  }
  else
  {
    v57 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v60 = 136315138;
      *(void *)&v60[4] = "_ListeningToContainerFromNowPlayingInfo";
      _os_log_impl(&dword_19CF1D000, v57, OS_LOG_TYPE_INFO, "%s No container info", v60, 0xCu);
    }
    id v56 = 0;
  }

  [a1 setCurrentListeningToContainer:v56];
  objc_msgSend(a1, "_af_setShuffleModeFromNowPlayingInfo:", v6);
  v58 = AFLanguageOptionsForNowPlayingInfo(v6);
  [a1 setAudioAndSubtitleLanguageOptions:v58];
}

- (void)_af_setShuffleModeFromNowPlayingInfo:()SiriMediaRemoteHelpers
{
  v4 = [a3 objectForKey:*MEMORY[0x1E4F775B8]];
  id v7 = v4;
  if (v4 && (unsigned int v5 = [v4 intValue] - 1, v5 <= 2)) {
    uint64_t v6 = qword_1E592ADE0[v5];
  }
  else {
    uint64_t v6 = 0;
  }
  [a1 setShuffleEnabled:v6];
}

- (id)_mediaTypeFromNowPlayingInfo:()SiriMediaRemoteHelpers
{
  v3 = [a3 objectForKey:*MEMORY[0x1E4F77550]];
  if (([v3 isEqualToString:*MEMORY[0x1E4F77620]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F773B8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F773C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F773A0]] & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E4F97450];
LABEL_6:
    id v5 = *v4;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F77628]])
  {
    v4 = (id *)MEMORY[0x1E4F97458];
    goto LABEL_6;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)_mediaItemIdURLFromNowPlayingInfo:()SiriMediaRemoteHelpers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = AFGetCurrentItemAdamIDFromNowPlayingInfo(v3);
  id v5 = [v4 stringValue];

  if (v5)
  {
    id v6 = v5;
    id v7 = @"store";
    goto LABEL_3;
  }
  uint64_t v10 = [v3 objectForKey:*MEMORY[0x1E4F774E0]];
  if (v10)
  {
    v11 = (void *)v10;
    uint64_t v12 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    id v6 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];

    if (v6)
    {
      id v7 = @"external";
      goto LABEL_3;
    }
  }
  v13 = [v3 objectForKey:*MEMORY[0x1E4F77630]];
  if (!v13) {
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    id v6 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v14];

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      int v18 = 136315650;
      id v19 = "_DeviceIdFromNowPlayingInfo";
      __int16 v20 = 2112;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2112;
      v23 = v13;
      id v17 = v21;
      _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, "%s Bad NowPlaying Info, kMRMediaRemoteNowPlayingInfoUniqueIdentifier gave unexpected item of class %@,  %@", (uint8_t *)&v18, 0x20u);
    }
LABEL_19:

    id v6 = 0;
    id v7 = 0;
    goto LABEL_3;
  }
  id v6 = [v13 stringValue];
LABEL_14:

  if (v6) {
    id v7 = @"device";
  }
  else {
    id v7 = 0;
  }
LABEL_3:
  int v8 = _AFMediaIdURLFromHostAndIdentifier(v7, v6);

  return v8;
}

@end