@interface RPAudioMixUtility
+ (id)exportPresetForAVAsset:(id)a3;
+ (id)tempFileURL;
+ (id)videoCodecTypeForAVAsset:(id)a3;
+ (void)mixAudioForMovie:(id)a3 finalMovieURL:(id)a4 outputFileType:(id)a5 withCompletionHandler:(id)a6;
+ (void)mixAudioForMovie:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation RPAudioMixUtility

+ (void)mixAudioForMovie:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[RPAudioMixUtility tempFileURL];
  uint64_t v8 = *MEMORY[0x263EF9888];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__RPAudioMixUtility_mixAudioForMovie_withCompletionHandler___block_invoke;
  v11[3] = &unk_26451DBB8;
  id v12 = v7;
  id v13 = v5;
  id v9 = v7;
  id v10 = v5;
  +[RPAudioMixUtility mixAudioForMovie:v6 finalMovieURL:v9 outputFileType:v8 withCompletionHandler:v11];
}

uint64_t __60__RPAudioMixUtility_mixAudioForMovie_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

+ (void)mixAudioForMovie:(id)a3 finalMovieURL:(id)a4 outputFileType:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9)
  {
    if (__RPLogLevel <= 1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
        __int16 v40 = 1024;
        int v41 = 33;
        __int16 v42 = 2112;
        id v43 = v9;
        _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d movieURL  %@", buf, 0x1Cu);
      }
      if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
        __int16 v40 = 1024;
        int v41 = 34;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d finalMovieURL %@", buf, 0x1Cu);
      }
    }
    id v29 = v9;
    id v13 = [MEMORY[0x263EFA470] assetWithURL:v9];
    v26 = +[RPAudioMixUtility exportPresetForAVAsset:v13];
    v14 = (void *)[objc_alloc(MEMORY[0x263EFA4A8]) initWithAsset:v13 presetName:v26];
    id v28 = v10;
    [v14 setOutputURL:v10];
    id v27 = v11;
    [v14 setOutputFileType:v11];
    v15 = [v13 tracksWithMediaType:*MEMORY[0x263EF9CE8]];
    v16 = [MEMORY[0x263EFF980] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v23 = [MEMORY[0x263EFA780] audioMixInputParameters];
          objc_msgSend(v23, "setTrackID:", objc_msgSend(v22, "trackID"));
          [v16 addObject:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v19);
    }

    v24 = [MEMORY[0x263EFA778] audioMix];
    [v24 setInputParameters:v16];
    [v14 setAudioMix:v24];
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
      __int16 v40 = 1024;
      int v41 = 63;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d starting export session", buf, 0x12u);
    }
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __89__RPAudioMixUtility_mixAudioForMovie_finalMovieURL_outputFileType_withCompletionHandler___block_invoke;
    v30[3] = &unk_26451D9B8;
    id v31 = v14;
    id v32 = v12;
    id v25 = v14;
    [v25 exportAsynchronouslyWithCompletionHandler:v30];

    id v10 = v28;
    id v9 = v29;
    id v11 = v27;
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]();
    }
    id v13 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5818 userInfo:0];
    (*((void (**)(id, void *))v12 + 2))(v12, v13);
  }
}

void __89__RPAudioMixUtility_mixAudioForMovie_finalMovieURL_outputFileType_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) status];
  if (v2 == 5)
  {
    if (__RPLogLevel > 1 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)v7 = 136446466;
    *(void *)&v7[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v7[12] = 1024;
    *(_DWORD *)&v7[14] = 72;
    uint64_t v3 = &_os_log_internal;
    v4 = " [INFO] %{public}s:%d AVAssetExportSessionStatusCancelled";
    goto LABEL_9;
  }
  if (v2 == 4)
  {
    if (__RPLogLevel > 1 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)v7 = 136446466;
    *(void *)&v7[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v7[12] = 1024;
    *(_DWORD *)&v7[14] = 67;
    uint64_t v3 = &_os_log_internal;
    v4 = " [INFO] %{public}s:%d AVAssetExportSessionFailed";
LABEL_9:
    _os_log_impl(&dword_21F69F000, v3, OS_LOG_TYPE_DEFAULT, v4, v7, 0x12u);
LABEL_10:
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "_rpUserErrorForCode:userInfo:", -5818, 0, *(_OWORD *)v7, *(void *)&v7[16]);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    return;
  }
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v7 = 136446466;
    *(void *)&v7[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v7[12] = 1024;
    *(_DWORD *)&v7[14] = 77;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAssetExportSession returned with no errors", v7, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)tempFileURL
{
  uint64_t v2 = NSString;
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [v3 _srTempPath];
  uint64_t v5 = [v2 stringWithFormat:@"%@/RPReplay_Final", v4];

  id v6 = NSString;
  v7 = [MEMORY[0x263EFF910] date];
  [v7 timeIntervalSince1970];
  id v9 = objc_msgSend(v6, "stringWithFormat:", @"%ld", (uint64_t)v8);

  id v10 = [NSString stringWithFormat:@"%@%@%@", v5, v9, @".mp4"];
  id v11 = [NSURL fileURLWithPath:v10];

  return v11;
}

+ (id)videoCodecTypeForAVAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 tracksWithMediaType:*MEMORY[0x263EF9D48]];
  if ([v3 count] != 1)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RPAudioMixUtility videoCodecTypeForAVAsset:]();
    }
    uint64_t v5 = 0;
    v4 = 0;
    goto LABEL_14;
  }
  v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 formatDescriptions];
  if ([v5 count] != 1)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RPAudioMixUtility videoCodecTypeForAVAsset:]();
    }
LABEL_14:
    double v8 = 0;
    goto LABEL_6;
  }
  id v6 = [v5 objectAtIndexedSubscript:0];
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v6);

  double v8 = [NSString stringWithUTF8String:RPStringUtility_FourccToCStr(MediaSubType)];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446722;
    id v12 = "+[RPAudioMixUtility videoCodecTypeForAVAsset:]";
    __int16 v13 = 1024;
    int v14 = 111;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d videoCodecType=%@", (uint8_t *)&v11, 0x1Cu);
  }
LABEL_6:
  id v9 = v8;

  return v9;
}

+ (id)exportPresetForAVAsset:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (id)*MEMORY[0x263EF9588];
  uint64_t v5 = +[RPAudioMixUtility videoCodecTypeForAVAsset:a3];
  id v6 = v5;
  if (v5)
  {
    if (![v5 isEqualToString:*MEMORY[0x263EFA370]])
    {
      if ([v6 isEqualToString:*MEMORY[0x263EFA368]])
      {
        if (__RPLogLevel > 1 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_7;
        }
        int v12 = 136446466;
        __int16 v13 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
        __int16 v14 = 1024;
        int v15 = 124;
        id v9 = &_os_log_internal;
        id v10 = " [INFO] %{public}s:%d AVAssetExportPresetHighestQuality for H264";
        uint32_t v11 = 18;
      }
      else
      {
        if (__RPLogLevel > 1 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_7;
        }
        int v12 = 136446722;
        __int16 v13 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
        __int16 v14 = 1024;
        int v15 = 127;
        __int16 v16 = 2112;
        uint64_t v17 = v6;
        id v9 = &_os_log_internal;
        id v10 = " [INFO] %{public}s:%d videoCodecType=%@, use default preset";
        uint32_t v11 = 28;
      }
      _os_log_impl(&dword_21F69F000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, v11);
      goto LABEL_7;
    }
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446466;
      __int16 v13 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
      __int16 v14 = 1024;
      int v15 = 121;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAssetExportPresetHEVCHighestQuality for HEVC", (uint8_t *)&v12, 0x12u);
    }
    id v7 = (id)*MEMORY[0x263EF9580];

    id v4 = v7;
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[RPAudioMixUtility exportPresetForAVAsset:]();
  }
LABEL_7:

  return v4;
}

+ (void)mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d video URL is nil", v1, v2, v3, v4, v5);
}

+ (void)videoCodecTypeForAVAsset:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Asset Video Track constains more than one formatDescscriptions", v1, v2, v3, v4, v5);
}

+ (void)videoCodecTypeForAVAsset:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Asset should only contain 1 video track", v1, v2, v3, v4, v5);
}

+ (void)exportPresetForAVAsset:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Failed to get videoCodecType for asset", v1, v2, v3, v4, v5);
}

@end