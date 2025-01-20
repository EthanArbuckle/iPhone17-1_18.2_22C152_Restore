@interface MRUTimeControls
- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLive;
- (BOOL)scrubbable;
- (MPCPlayerSeekCommand)seekCommand;
- (MRUTimeControls)init;
- (MRUTimeControls)initWithResponseItem:(id)a3;
- (NSString)liveText;
- (double)duration;
- (double)elapsedTime;
- (double)elapsedTimeForDate:(id)a3;
- (double)startTime;
- (float)rate;
- (id)description;
- (void)setDurationSnapshot:(id *)a3;
- (void)setElapsedTime:(double)a3;
- (void)setSeekCommand:(id)a3;
@end

@implementation MRUTimeControls

- (MRUTimeControls)initWithResponseItem:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MRUTimeControls;
  v5 = [(MRUTimeControls *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 seekCommand];
    seekCommand = v5->_seekCommand;
    v5->_seekCommand = (MPCPlayerSeekCommand *)v6;

    v8 = [(MPCPlayerSeekCommand *)v5->_seekCommand changePositionToElapsedInterval:0.0];
    v5->_scrubbable = v8 != 0;

    if (v4)
    {
      [v4 duration];
      v5->_isEnabled = v23 > 0.0;
      objc_msgSend(v4, "duration", v23);
      *(_OWORD *)&v5->_durationSnapshot.snapshotTime = v19;
      *(_OWORD *)&v5->_durationSnapshot.endTime = v20;
      *(_OWORD *)&v5->_durationSnapshot.elapsedDuration = v21;
      *(void *)&v5->_durationSnapshot.isLiveContent = v22;
      [v4 duration];
      BOOL v9 = v18;
    }
    else
    {
      BOOL v9 = 0;
      v5->_isEnabled = 0;
      *(void *)&v5->_durationSnapshot.isLiveContent = 0;
      *(_OWORD *)&v5->_durationSnapshot.endTime = 0u;
      *(_OWORD *)&v5->_durationSnapshot.elapsedDuration = 0u;
      *(_OWORD *)&v5->_durationSnapshot.snapshotTime = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      BOOL v18 = 0;
    }
    v5->_isLive = v9;
    v10 = objc_msgSend(v4, "localizedDurationString", v15, v16, v17, v18);
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v12 = +[MRUStringsProvider scrubberLive];
    }
    liveText = v5->_liveText;
    v5->_liveText = v12;
  }
  return v5;
}

- (MRUTimeControls)init
{
  return [(MRUTimeControls *)self initWithResponseItem:0];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(MRUTimeControls *)self startTime];
  uint64_t v6 = v5;
  [(MRUTimeControls *)self duration];
  v8 = @"Yes";
  if (self->_scrubbable) {
    BOOL v9 = @"Yes";
  }
  else {
    BOOL v9 = @"No";
  }
  if (self->_isEnabled) {
    v10 = @"Yes";
  }
  else {
    v10 = @"No";
  }
  if (!self->_isLive) {
    v8 = @"No";
  }
  return (id)[v3 stringWithFormat:@"%@ start: %f | duration: %f | elapsed: %f | scrubbable: %@ | enabled: %@ | live: %@ - %@", v4, v6, v7, *(void *)&self->_durationSnapshot.elapsedDuration, v9, v10, v8, self->_liveText];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRUTimeControls *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = v5;
      if (v5)
      {
        [(MRUTimeControls *)v5 durationSnapshot];
        double v7 = v27;
      }
      else
      {
        double v7 = 0.0;
      }
      BOOL v9 = v7 == self->_durationSnapshot.snapshotTime;
      [(MRUTimeControls *)v6 startTime];
      double v11 = v10;
      [(MRUTimeControls *)self startTime];
      if (v11 != v12) {
        BOOL v9 = 0;
      }
      [(MRUTimeControls *)v6 duration];
      double v14 = v13;
      [(MRUTimeControls *)self duration];
      if (v14 != v15) {
        BOOL v9 = 0;
      }
      if (v6)
      {
        [(MRUTimeControls *)v6 durationSnapshot];
        double v16 = v26;
      }
      else
      {
        double v16 = 0.0;
      }
      [(MRUTimeControls *)self durationSnapshot];
      if (v16 != v25) {
        BOOL v9 = 0;
      }
      [(MRUTimeControls *)v6 rate];
      float v18 = v17;
      [(MRUTimeControls *)self rate];
      if (v18 != v19) {
        BOOL v9 = 0;
      }
      if (self->_scrubbable != [(MRUTimeControls *)v6 scrubbable]) {
        BOOL v9 = 0;
      }
      if (self->_isEnabled != [(MRUTimeControls *)v6 isEnabled]) {
        BOOL v9 = 0;
      }
      BOOL v20 = self->_isLive == [(MRUTimeControls *)v6 isLive] && v9;
      long long v21 = [(MRUTimeControls *)v6 liveText];
      uint64_t v22 = v21;
      if (v21 == self->_liveText) {
        char v23 = 1;
      }
      else {
        char v23 = -[NSString isEqual:](v21, "isEqual:");
      }
      char v8 = v20 & v23;
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (double)startTime
{
  double startTime = self->_durationSnapshot.startTime;
  [(MRUTimeControls *)self duration];
  if (startTime < result) {
    return startTime;
  }
  return result;
}

- (double)elapsedTime
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double duration = self->_durationSnapshot.elapsedDuration
           + (v3 - self->_durationSnapshot.snapshotTime) * self->_durationSnapshot.rate;
  if (duration >= self->_durationSnapshot.duration) {
    double duration = self->_durationSnapshot.duration;
  }
  return fmax(duration, 0.0);
}

- (double)duration
{
  return self->_durationSnapshot.duration;
}

- (float)rate
{
  return self->_durationSnapshot.rate;
}

- (void)setElapsedTime:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(MRUTimeControls *)self duration];
  double v6 = v5;
  double v7 = MCLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2050;
    *(double *)&buf[14] = a3;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ set time to: %{public}f", buf, 0x16u);
  }
  double v8 = fmax(a3, 0.0);
  if (v8 < v6) {
    double v6 = v8;
  }

  BOOL v9 = [(MPCPlayerSeekCommand *)self->_seekCommand changePositionToElapsedInterval:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__MRUTimeControls_setElapsedTime___block_invoke;
  v12[3] = &unk_1E5F0E0F8;
  v12[4] = self;
  *(double *)&v12[5] = a3;
  [MEMORY[0x1E4F76E88] performRequest:v9 completion:v12];
  long long v10 = *(_OWORD *)&self->_durationSnapshot.startTime;
  *(double *)&buf[16] = self->_durationSnapshot.duration;
  long long v13 = *(_OWORD *)&self->_durationSnapshot.rate;
  *(_OWORD *)buf = v10;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_durationSnapshot.snapshotTime = v11;
  *(_OWORD *)&self->_durationSnapshot.double startTime = *(_OWORD *)buf;
  self->_durationSnapshot.double duration = *(double *)&buf[16];
  self->_durationSnapshot.elapsedDuration = v6;
  *(_OWORD *)&self->_durationSnapshot.rate = v13;
}

void __34__MRUTimeControls_setElapsedTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2050;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ complete set time to: %{public}f | error %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (double)elapsedTimeForDate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] now];
  }
  [v4 timeIntervalSinceReferenceDate];
  double duration = self->_durationSnapshot.elapsedDuration
           + (v5 - self->_durationSnapshot.snapshotTime) * self->_durationSnapshot.rate;
  if (duration >= self->_durationSnapshot.duration) {
    double duration = self->_durationSnapshot.duration;
  }
  double v7 = fmax(duration, 0.0);

  return v7;
}

- (BOOL)scrubbable
{
  return self->_scrubbable;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (NSString)liveText
{
  return self->_liveText;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot
{
  long long v3 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var1;
  *(double *)&retstr->var7 = self[1].var3;
  return self;
}

- (void)setDurationSnapshot:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  long long v5 = *(_OWORD *)&a3->var4;
  *(void *)&self->_durationSnapshot.isLiveContent = *(void *)&a3->var7;
  *(_OWORD *)&self->_durationSnapshot.endTime = v4;
  *(_OWORD *)&self->_durationSnapshot.elapsedDuration = v5;
  *(_OWORD *)&self->_durationSnapshot.snapshotTime = v3;
}

- (MPCPlayerSeekCommand)seekCommand
{
  return self->_seekCommand;
}

- (void)setSeekCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seekCommand, 0);

  objc_storeStrong((id *)&self->_liveText, 0);
}

@end