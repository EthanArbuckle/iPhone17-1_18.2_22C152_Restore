@interface ANSimpleTrackPlayer
- (void)handleInterruptionDelay:(double)a3;
- (void)playInternalWithCompletionHandler:(id)a3;
@end

@implementation ANSimpleTrackPlayer

- (void)playInternalWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  v5 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(ANTrackPlayer *)self queuePlayer];
    v7 = [v6 currentItem];
    v8 = v7;
    if (v7) {
      [v7 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);
    *(_DWORD *)buf = 136315394;
    v16 = "-[ANSimpleTrackPlayer playInternalWithCompletionHandler:]";
    __int16 v17 = 2048;
    Float64 v18 = Seconds;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%s: Duration = %fs", buf, 0x16u);
  }
  v10 = [(ANTrackPlayer *)self queuePlayer];
  [v10 play];

  v11 = [(ANTrackPlayer *)self queuePlayer];
  v12 = [v11 error];

  if (v12)
  {
    v13 = [(ANTrackPlayer *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ANSimpleTrackPlayer playInternalWithCompletionHandler:]((uint64_t)v12, v13);
    }
  }
  v4[2](v4, v12);
}

- (void)handleInterruptionDelay:(double)a3
{
  CMTime v19 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  v4 = [(ANTrackPlayer *)self queuePlayer];
  v5 = v4;
  if (v4) {
    [v4 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  [(ANTrackPlayer *)self previousSkipGoesToPreviousTrackDelta];
  if (Seconds > v7)
  {
    [(ANTrackPlayer *)self previousSkipGoesToPreviousTrackDelta];
    double v9 = Seconds - v8;
    v10 = [(ANTrackPlayer *)self queuePlayer];
    v11 = v10;
    if (v10)
    {
      [v10 currentTime];
      LODWORD(v10) = v16;
    }
    else
    {
      v15[5] = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
    }
    CMTimeMakeWithSeconds(&v19, v9, (int32_t)v10);
  }
  v12 = [(ANTrackPlayer *)self queuePlayer];
  v13 = [v12 currentItem];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__ANSimpleTrackPlayer_handleInterruptionDelay___block_invoke;
  v15[3] = &unk_1E6BCE338;
  v15[4] = self;
  CMTime v14 = v19;
  [v13 seekToTime:&v14 completionHandler:v15];
}

void __47__ANSimpleTrackPlayer_handleInterruptionDelay___block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = "unsuccessful";
    if (a2) {
      v4 = "successful";
    }
    int v5 = 136315394;
    v6 = "-[ANSimpleTrackPlayer handleInterruptionDelay:]_block_invoke";
    __int16 v7 = 2080;
    double v8 = v4;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_INFO, "%s: Attempt to restart announcement after interruption was %s.", (uint8_t *)&v5, 0x16u);
  }
}

- (void)playInternalWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA5ED000, a2, OS_LOG_TYPE_ERROR, "Failed to play AVQueuePlayer %@", (uint8_t *)&v2, 0xCu);
}

@end