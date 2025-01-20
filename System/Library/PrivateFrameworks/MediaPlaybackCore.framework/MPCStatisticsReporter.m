@interface MPCStatisticsReporter
- (MPCPlaybackEngine)playbackEngine;
- (MPCStatisticsReporter)init;
- (NSString)recordScenarioName;
- (id)_reportDirectoryURL;
- (id)_reportingFileForRecorder:(id)a3 extension:(id)a4;
- (id)coreAnalyticsEventName;
- (id)description;
- (void)_clearLocalReports;
- (void)_sendAnalyticsData;
- (void)_writeAnalyticsDataFromRecorder:(id)a3;
- (void)_writeData:(id)a3 toFileAtPath:(id)a4;
- (void)_writeSamplesFromRecorder:(id)a3;
- (void)flush;
- (void)reportRecordedResults:(id)a3;
@end

@implementation MPCStatisticsReporter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playbackEngine);

  objc_storeStrong((id *)&self->_writerQueue, 0);
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPCStatisticsReporter *)self recordScenarioName];
  v6 = [v3 stringWithFormat:@"<%@: %p - recordScenarioName:%@>", v4, self, v5];

  return v6;
}

- (id)coreAnalyticsEventName
{
  return @"com.apple.music.mediaplayback.dsp.evaluation";
}

- (void)_writeData:(id)a3 toFileAtPath:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_writerQueue);
  v8 = [MEMORY[0x263F08850] defaultManager];
  char v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    v10 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:v7];
    v11 = v10;
    if (v10)
    {
      id v28 = 0;
      int v12 = [v10 seekToEndReturningOffset:0 error:&v28];
      v13 = v28;
      v14 = v13;
      if (!v12 || v13)
      {
        v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v31 = self;
          __int16 v32 = 2114;
          v33 = v14;
          _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Unable to seek to file for records update - error: %{public}@", buf, 0x16u);
        }

        goto LABEL_25;
      }
      id v27 = 0;
      [v11 writeData:v6 error:&v27];
      id v15 = v27;
      v14 = v27;
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v31 = self;
          __int16 v32 = 2114;
          v33 = v14;
          v18 = "[AP] - %{public}@ - Unable to write data for records update - error: %{public}@";
          v19 = v17;
          os_log_type_t v20 = OS_LOG_TYPE_ERROR;
LABEL_23:
          _os_log_impl(&dword_21BB87000, v19, v20, v18, buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v31 = self;
        __int16 v32 = 2114;
        v33 = v7;
        v18 = "[AP] - %{public}@ - Records update successful at %{public}@";
        v19 = v17;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_23;
      }

      [v11 closeFile];
      goto LABEL_25;
    }
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v31 = self;
      v23 = "[AP] - %{public}@ - Unable to open file for records update";
      v24 = v14;
      uint32_t v25 = 12;
      goto LABEL_17;
    }
    goto LABEL_25;
  }
  id v29 = 0;
  int v21 = [v6 writeToFile:v7 options:0 error:&v29];
  v11 = v29;
  v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v14 = v22;
  if (!v21 || v11)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v31 = self;
      __int16 v32 = 2114;
      v33 = v11;
      v23 = "[AP] - %{public}@ - Unable to create file for records - error: %{public}@";
      v24 = v14;
      uint32_t v25 = 22;
LABEL_17:
      _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
    }
LABEL_25:

    goto LABEL_26;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Records creation successful at %{public}@", buf, 0x16u);
  }
  v11 = v14;
LABEL_26:
}

- (void)_writeSamplesFromRecorder:(id)a3
{
  writerQueue = self->_writerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(writerQueue);
  id v9 = [(MPCStatisticsReporter *)self _reportingFileForRecorder:v5 extension:@".csv"];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = [v6 fileExistsAtPath:v9] ^ 1;

  v8 = [v5 flushSamplesToCSVDataWithHeader:v7];

  if (v8) {
    [(MPCStatisticsReporter *)self _writeData:v8 toFileAtPath:v9];
  }
}

- (id)_reportingFileForRecorder:(id)a3 extension:(id)a4
{
  id v6 = a4;
  writerQueue = self->_writerQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(writerQueue);
  uint64_t v9 = MSVGetDeviceProductType();
  v10 = (void *)v9;
  v11 = @"Unknown";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  int v12 = v11;

  v13 = [(MPCStatisticsReporter *)self recordScenarioName];
  v14 = NSString;
  id v15 = [v8 modelID];

  v16 = [v14 stringWithFormat:@"%@__%@", v15, v12];

  if (v13)
  {
    uint64_t v17 = [v16 stringByAppendingFormat:@"__%@", v13];

    v16 = (void *)v17;
  }
  v18 = [v16 stringByAppendingString:v6];

  v19 = [(MPCStatisticsReporter *)self _reportDirectoryURL];
  os_log_type_t v20 = [v19 path];
  int v21 = [v20 stringByAppendingPathComponent:v18];

  return v21;
}

- (id)_reportDirectoryURL
{
  v12[2] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_writerQueue);
  v2 = NSURL;
  v3 = MSVMobileHomeDirectory();
  v12[0] = v3;
  v12[1] = @"Media/Espresso/Analytics";
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v5 = [v2 fileURLWithPathComponents:v4];

  id v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    v10 = [v5 path];
    [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];
  }

  return v5;
}

- (void)_clearLocalReports
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_writerQueue);
  v3 = [MEMORY[0x263F08850] defaultManager];
  v26 = self;
  id v28 = [(MPCStatisticsReporter *)self _reportDirectoryURL];
  uint64_t v4 = [v28 path];
  id v27 = v3;
  id v5 = [v3 enumeratorAtPath:v4];

  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v28 path];
    *(_DWORD *)buf = 138543618;
    v35 = v26;
    __int16 v36 = 2114;
    v37 = v7;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Removing local report files in %{public}@", buf, 0x16u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v31;
    *(void *)&long long v9 = 138543874;
    long long v24 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "pathExtension", v24);
        if ([v14 isEqualToString:@"json"])
        {
        }
        else
        {
          id v15 = [v13 pathExtension];
          int v16 = [v15 isEqualToString:@"csv"];

          if (!v16) {
            continue;
          }
        }
        uint64_t v17 = [v28 path];
        v18 = [v17 stringByAppendingPathComponent:v13];

        v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v35 = v26;
          __int16 v36 = 2114;
          v37 = v18;
          _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Removing %{public}@", buf, 0x16u);
        }

        id v29 = 0;
        int v20 = [v27 removeItemAtPath:v18 error:&v29];
        id v21 = v29;
        v22 = v21;
        if (!v20 || v21)
        {
          v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v35 = v26;
            __int16 v36 = 2114;
            v37 = v18;
            __int16 v38 = 2114;
            v39 = v22;
            _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Failed to remove: %{public}@ - error:%{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v10);
  }
}

- (void)_sendAnalyticsData
{
  v2 = self;
  uint64_t v52 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_writerQueue);
  v3 = [MEMORY[0x263F08850] defaultManager];
  __int16 v36 = [(MPCStatisticsReporter *)v2 _reportDirectoryURL];
  uint64_t v4 = [v36 path];
  v35 = v3;
  id v5 = [v3 enumeratorAtPath:v4];

  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v36 path];
    *(_DWORD *)buf = 138543618;
    v46 = v2;
    __int16 v47 = 2114;
    v48 = v7;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Flushing local analytics files in %{public}@", buf, 0x16u);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = @"analytics";
    uint64_t v12 = *(void *)v42;
    long long v33 = v2;
    id v34 = v8;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if ([v14 containsString:v11])
        {
          id v15 = [v14 pathExtension];
          int v16 = [v15 isEqualToString:@"plist"];

          if (v16)
          {
            uint64_t v17 = v11;
            v18 = [v36 path];
            v19 = [v18 stringByAppendingPathComponent:v14];

            int v20 = [NSURL fileURLWithPath:v19];
            id v40 = 0;
            id v21 = [NSDictionary dictionaryWithContentsOfURL:v20 error:&v40];
            id v22 = v40;
            v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            long long v24 = v23;
            if (v22)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v46 = v2;
                __int16 v47 = 2114;
                v48 = v19;
                __int16 v49 = 2114;
                id v50 = v22;
                _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Error getting data in %{public}@: %{public}@", buf, 0x20u);
              }
            }
            else
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                uint32_t v25 = objc_msgSend(v21, "msv_compactDescription");
                *(_DWORD *)buf = 138543874;
                v46 = v33;
                __int16 v47 = 2114;
                v48 = v19;
                __int16 v49 = 2114;
                id v50 = v25;
                _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Sending data in %{public}@: %{public}@", buf, 0x20u);

                v2 = v33;
              }

              aBlock[0] = MEMORY[0x263EF8330];
              aBlock[1] = 3221225472;
              aBlock[2] = __43__MPCStatisticsReporter__sendAnalyticsData__block_invoke;
              aBlock[3] = &unk_2643C58D0;
              v39 = v21;
              v26 = _Block_copy(aBlock);
              id v27 = [(MPCStatisticsReporter *)v2 coreAnalyticsEventName];
              AnalyticsSendEventLazy();

              v2 = v33;
              long long v24 = v39;
            }

            id v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v46 = v2;
              __int16 v47 = 2114;
              v48 = v19;
              _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Removing %{public}@", buf, 0x16u);
            }

            id v37 = 0;
            int v29 = [v35 removeItemAtPath:v19 error:&v37];
            id v30 = v37;
            long long v31 = v30;
            if (!v29 || v30)
            {
              long long v32 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v46 = v2;
                __int16 v47 = 2114;
                v48 = v19;
                __int16 v49 = 2114;
                id v50 = v31;
                _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Failed to remove: %{public}@ - error:%{public}@", buf, 0x20u);
              }
            }
            uint64_t v11 = v17;
            id v8 = v34;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v10);
  }
}

id __43__MPCStatisticsReporter__sendAnalyticsData__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_writeAnalyticsDataFromRecorder:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  writerQueue = self->_writerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(writerQueue);
  id v6 = NSString;
  uint64_t v7 = [v5 recordID];
  id v8 = [v6 stringWithFormat:@"analytics_%@.plist", v7];

  uint64_t v9 = [(MPCStatisticsReporter *)self _reportDirectoryURL];
  uint64_t v10 = [v9 URLByAppendingPathComponent:v8];

  uint64_t v11 = [v5 dictionaryRepresentation];

  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v10 path];
    v14 = objc_msgSend(v11, "msv_compactDescription");
    *(_DWORD *)buf = 138543874;
    int v20 = self;
    __int16 v21 = 2114;
    id v22 = v13;
    __int16 v23 = 2114;
    id v24 = v14;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Writing data to %{public}@ %{public}@", buf, 0x20u);
  }
  id v18 = 0;
  [v11 writeToURL:v10 error:&v18];
  id v15 = v18;
  if (v15)
  {
    int v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [v10 path];
      *(_DWORD *)buf = 138543874;
      int v20 = self;
      __int16 v21 = 2114;
      id v22 = v17;
      __int16 v23 = 2114;
      id v24 = v15;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Failed to write: %{public}@ - error:%{public}@", buf, 0x20u);
    }
  }
}

- (NSString)recordScenarioName
{
  v2 = [MEMORY[0x263F12178] standardUserDefaults];
  v3 = [v2 vocalAttenuationStatisticsName];

  if (v3)
  {
    uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (void)flush
{
  writerQueue = self->_writerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__MPCStatisticsReporter_flush__block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(writerQueue, block);
}

uint64_t __30__MPCStatisticsReporter_flush__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendAnalyticsData];
}

- (void)reportRecordedResults:(id)a3
{
  id v4 = a3;
  writerQueue = self->_writerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__MPCStatisticsReporter_reportRecordedResults___block_invoke;
  v7[3] = &unk_2643C5EE8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(writerQueue, v7);
}

uint64_t __47__MPCStatisticsReporter_reportRecordedResults___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isStoringSamples]) {
    [*(id *)(a1 + 40) _writeSamplesFromRecorder:*(void *)(a1 + 32)];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 _writeAnalyticsDataFromRecorder:v3];
}

- (MPCStatisticsReporter)init
{
  v9.receiver = self;
  v9.super_class = (Class)MPCStatisticsReporter;
  v2 = [(MPCStatisticsReporter *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlaybackCore/Suntory.statsReporterQueue", 0);
    writerQueue = v2->_writerQueue;
    v2->_writerQueue = (OS_dispatch_queue *)v3;

    id v5 = v2->_writerQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__MPCStatisticsReporter_init__block_invoke;
    block[3] = &unk_2643C5FC8;
    id v8 = v2;
    dispatch_async(v5, block);
  }
  return v2;
}

uint64_t __29__MPCStatisticsReporter_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendAnalyticsData];
  v2 = *(void **)(a1 + 32);

  return [v2 _clearLocalReports];
}

@end