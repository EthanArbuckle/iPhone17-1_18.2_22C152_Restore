@interface MRUHardwareVolumeDataSource
- (BOOL)debounceVolumeRepeat;
- (MPVolumeControllerDataSource)volumeDataSource;
- (MRUHardwareVolumeDataSource)initWithVolumeDataSource:(id)a3;
- (double)calculateButtonRepeatDelay;
- (double)pendingVolumeChange;
- (void)cancelVolumeEvent;
- (void)changeVolumeBy:(double)a3;
- (void)consumeSinglePressDownForButtonKind:(int64_t)a3;
- (void)consumeSinglePressUpForButtonKind:(int64_t)a3;
- (void)decreaseVolume;
- (void)handleDecreaseDown;
- (void)handleIncreaseDown;
- (void)increaseVolume;
- (void)setDebounceVolumeRepeat:(BOOL)a3;
- (void)setPendingVolumeChange:(double)a3;
@end

@implementation MRUHardwareVolumeDataSource

- (MRUHardwareVolumeDataSource)initWithVolumeDataSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRUHardwareVolumeDataSource;
  v6 = [(MRUHardwareVolumeDataSource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_volumeDataSource, a3);
    [(MPVolumeControllerDataSource *)v7->_volumeDataSource volume];
    v7->_pendingVolumeChange = v8;
  }

  return v7;
}

- (void)consumeSinglePressDownForButtonKind:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    id v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = objc_opt_class();
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received volume increase touch down", (uint8_t *)&v6, 0xCu);
    }

    [(MRUHardwareVolumeDataSource *)self handleIncreaseDown];
  }
  else if (a3 == 4)
  {
    v4 = MCLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = objc_opt_class();
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received volume decrease touch down", (uint8_t *)&v6, 0xCu);
    }

    [(MRUHardwareVolumeDataSource *)self handleDecreaseDown];
  }
}

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 == 4)
  {
    [(MRUHardwareVolumeDataSource *)self cancelVolumeEvent];
    v3 = MCLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      uint64_t v6 = objc_opt_class();
      v4 = "%{public}@ received volume decrease touch up";
      goto LABEL_7;
    }
  }
  else
  {
    if (a3 != 3) {
      return;
    }
    [(MRUHardwareVolumeDataSource *)self cancelVolumeEvent];
    v3 = MCLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      uint64_t v6 = objc_opt_class();
      v4 = "%{public}@ received volume increase touch up";
LABEL_7:
      _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)handleDecreaseDown
{
  v7[1] = *MEMORY[0x1E4F143B8];
  [(MPVolumeControllerDataSource *)self->_volumeDataSource volume];
  self->_pendingVolumeChange = v3;
  self->_debounceVolumeRepeat = 1;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_increaseVolume object:0];
  [(MRUHardwareVolumeDataSource *)self calculateButtonRepeatDelay];
  double v5 = v4;
  v7[0] = *MEMORY[0x1E4F1C4B0];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(MRUHardwareVolumeDataSource *)self performSelector:sel_decreaseVolume withObject:0 afterDelay:v6 inModes:v5];

  [(MRUHardwareVolumeDataSource *)self decreaseVolume];
}

- (void)handleIncreaseDown
{
  v7[1] = *MEMORY[0x1E4F143B8];
  [(MPVolumeControllerDataSource *)self->_volumeDataSource volume];
  self->_pendingVolumeChange = v3;
  self->_debounceVolumeRepeat = 1;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_decreaseVolume object:0];
  [(MRUHardwareVolumeDataSource *)self calculateButtonRepeatDelay];
  double v5 = v4;
  v7[0] = *MEMORY[0x1E4F1C4B0];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(MRUHardwareVolumeDataSource *)self performSelector:sel_increaseVolume withObject:0 afterDelay:v6 inModes:v5];

  [(MRUHardwareVolumeDataSource *)self increaseVolume];
}

- (void)increaseVolume
{
  self->_debounceVolumeRepeat = 0;
  if (([(MPVolumeControllerDataSource *)self->_volumeDataSource volumeControlCapabilities] & 5) != 0)
  {
    [(MPVolumeControllerDataSource *)self->_volumeDataSource beginIncreasingRelativeVolume];
    volumeDataSource = self->_volumeDataSource;
    [(MPVolumeControllerDataSource *)volumeDataSource endIncreasingRelativeVolume];
  }
  else
  {
    [(MRUHardwareVolumeDataSource *)self changeVolumeBy:0.0625];
  }
}

- (void)decreaseVolume
{
  self->_debounceVolumeRepeat = 0;
  if (([(MPVolumeControllerDataSource *)self->_volumeDataSource volumeControlCapabilities] & 5) != 0)
  {
    [(MPVolumeControllerDataSource *)self->_volumeDataSource beginDecreasingRelativeVolume];
    volumeDataSource = self->_volumeDataSource;
    [(MPVolumeControllerDataSource *)volumeDataSource endDecreasingRelativeVolume];
  }
  else
  {
    [(MRUHardwareVolumeDataSource *)self changeVolumeBy:-0.0625];
  }
}

- (void)cancelVolumeEvent
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_increaseVolume object:0];
  float v3 = (void *)MEMORY[0x1E4FBA8A8];

  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel_decreaseVolume object:0];
}

- (void)changeVolumeBy:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v3 = -a3;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (v3 > 0.00000011920929)
  {
    double v5 = self->_pendingVolumeChange + a3;
    if (v5 < 0.0) {
      double v5 = 0.0;
    }
    self->_double pendingVolumeChange = fmin(v5, 1.0);
    uint64_t v6 = MCLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double pendingVolumeChange = self->_pendingVolumeChange;
      int v9 = 134217984;
      double v10 = pendingVolumeChange;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "Committing volume change to: %f", (uint8_t *)&v9, 0xCu);
    }

    double v8 = self->_pendingVolumeChange;
    *(float *)&double v8 = v8;
    [(MPVolumeControllerDataSource *)self->_volumeDataSource setVolume:v8];
  }
}

- (double)calculateButtonRepeatDelay
{
  return *((double *)&xmmword_1AE964330 + !self->_debounceVolumeRepeat);
}

- (MPVolumeControllerDataSource)volumeDataSource
{
  return self->_volumeDataSource;
}

- (double)pendingVolumeChange
{
  return self->_pendingVolumeChange;
}

- (void)setPendingVolumeChange:(double)a3
{
  self->_double pendingVolumeChange = a3;
}

- (BOOL)debounceVolumeRepeat
{
  return self->_debounceVolumeRepeat;
}

- (void)setDebounceVolumeRepeat:(BOOL)a3
{
  self->_debounceVolumeRepeat = a3;
}

- (void).cxx_destruct
{
}

@end