@interface ANAnchorTrackPlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (void)handleInterruptionDelay:(double)a3;
- (void)playInternalWithCompletionHandler:(id)a3;
- (void)setStartTime:(id *)a3;
@end

@implementation ANAnchorTrackPlayer

- (void)playInternalWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[ANAnchorTrackPlayer playInternalWithCompletionHandler:]";
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6 = [(ANTrackPlayer *)self queuePlayer];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ANAnchorTrackPlayer_playInternalWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E6BCE6A0;
  objc_copyWeak(&v11, (id *)buf);
  v9[4] = self;
  int v12 = 1065353216;
  id v7 = v4;
  id v10 = v7;
  LODWORD(v8) = 1.0;
  [v6 prerollAtRate:v9 completionHandler:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __57__ANAnchorTrackPlayer_playInternalWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = [WeakRetained log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 67109120;
    HIDWORD(buf.value) = a2;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Preroll Finished: %d", (uint8_t *)&buf, 8u);
  }

  if ((a2 & 1) == 0)
  {
    v6 = [WeakRetained log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __57__ANAnchorTrackPlayer_playInternalWithCompletionHandler___block_invoke_cold_1(v6);
    }
  }
  memset(&v28, 0, sizeof(v28));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v28, HostTimeClock);
  memset(&v27[1], 0, sizeof(CMTime));
  if (WeakRetained) {
    [WeakRetained startTime];
  }
  memset(v27, 0, 24);
  double v8 = [WeakRetained queuePlayer];
  v9 = v8;
  if (v8) {
    [v8 currentTime];
  }
  else {
    memset(v27, 0, 24);
  }

  memset(&v26, 0, sizeof(v26));
  CMTime buf = v27[1];
  CMTime v25 = v28;
  CMTimeSubtract(&v26, &buf, &v25);
  id v10 = [WeakRetained log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 134218752;
    *(CMTimeValue *)((char *)&buf.value + 4) = v27[0].value;
    LOWORD(buf.flags) = 2048;
    *(void *)((char *)&buf.flags + 2) = v27[1].value;
    HIWORD(buf.epoch) = 2048;
    CMTimeValue value = v28.value;
    __int16 v31 = 2048;
    double v32 = (double)v26.value / (double)v26.timescale;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "AVQueuePlayer Current Time %lld, Target Host Time: %lld, Now: %lld, Delta(sec): %f", (uint8_t *)&buf, 0x2Au);
  }

  CMTime buf = v28;
  CMTime v25 = v27[1];
  if (CMTimeCompare(&buf, &v25) == 1)
  {
    id v11 = [WeakRetained log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "Start Time is in the past. Will use play", (uint8_t *)&buf, 2u);
    }

    int v12 = [WeakRetained queuePlayer];
    [v12 play];

    v13 = [WeakRetained queuePlayer];
    v14 = [v13 error];
  }
  else
  {
    uint64_t v15 = [*(id *)(a1 + 32) queuePlayer];
    [v15 setAutomaticallyWaitsToMinimizeStalling:0];

    v16 = [WeakRetained log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [WeakRetained queuePlayer];
      v18 = [WeakRetained queuePlayer];
      [v18 rate];
      LODWORD(buf.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v17;
      LOWORD(buf.flags) = 2048;
      *(double *)((char *)&buf.flags + 2) = v19;
      _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "Will Set Rate on AVQueuePlayer %@, rate = %f", (uint8_t *)&buf, 0x16u);
    }
    v20 = [WeakRetained queuePlayer];
    LODWORD(v21) = *(_DWORD *)(a1 + 56);
    CMTime buf = v27[0];
    CMTime v25 = v27[1];
    [v20 setRate:&buf time:&v25 atHostTime:v21];

    v13 = [WeakRetained log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [WeakRetained queuePlayer];
      v23 = [WeakRetained queuePlayer];
      [v23 rate];
      LODWORD(buf.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v22;
      LOWORD(buf.flags) = 2048;
      *(double *)((char *)&buf.flags + 2) = v24;
      _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "Did set Rate on AVQueuePlayer %@, rate = %f", (uint8_t *)&buf, 0x16u);
    }
    v14 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleInterruptionDelay:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ANAnchorTrackPlayer handleInterruptionDelay:]";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a3;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%s: amountOfTimeInterrupted %f", buf, 0x16u);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = [(ANTrackPlayer *)self playerItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v12 = [v11 playerItem];
        v13 = [(ANTrackPlayer *)self queuePlayer];
        v14 = [v13 currentItem];

        if (v12 == v14)
        {
          uint64_t v15 = [v11 trackType];
          v16 = [(ANTrackPlayer *)self queuePlayer];
          v17 = v16;
          if (v15)
          {
            [v16 advanceToNextItem];
          }
          else
          {
            v18 = [v16 currentItem];
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __47__ANAnchorTrackPlayer_handleInterruptionDelay___block_invoke;
            v19[3] = &unk_1E6BCE338;
            v19[4] = self;
            *(_OWORD *)CMTime buf = *MEMORY[0x1E4F1FA48];
            *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
            [v18 seekToTime:buf completionHandler:v19];
          }
          goto LABEL_16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

void __47__ANAnchorTrackPlayer_handleInterruptionDelay___block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = "unsuccessful";
    if (a2) {
      id v4 = "successful";
    }
    int v5 = 136315394;
    v6 = "-[ANAnchorTrackPlayer handleInterruptionDelay:]_block_invoke";
    __int16 v7 = 2080;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_INFO, "%s: Attempt to restart announcement after interruption was %s.", (uint8_t *)&v5, 0x16u);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (void)setStartTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_startTime.CMTimeValue value = *(_OWORD *)&a3->var0;
  self->_startTime.epoch = var3;
}

void __57__ANAnchorTrackPlayer_playInternalWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA5ED000, log, OS_LOG_TYPE_ERROR, "Preroll did not finish. Will still attempt to play.", v1, 2u);
}

@end