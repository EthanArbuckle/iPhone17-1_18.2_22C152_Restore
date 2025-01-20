@interface JFXCapturePreviewFrameStats
- (BOOL)dropped;
- (double)times;
- (void)printLabels;
- (void)printStats;
- (void)setDropped:(BOOL)a3;
@end

@implementation JFXCapturePreviewFrameStats

- (double)times
{
  return self->_frameTimes;
}

- (void)printLabels
{
  v2 = JFXLog_automation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_234C41000, v2, OS_LOG_TYPE_DEFAULT, " GetBGBuffers | GenMatte (Total) | Render | WaitToDisplay | Total  | Dropped ", v3, 2u);
  }
}

- (void)printStats
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = JFXLog_automation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = self->_frameTimes[0];
    double v5 = self->_frameTimes[1];
    double v6 = self->_frameTimes[2];
    double v7 = self->_frameTimes[3];
    double v8 = self->_frameTimes[4];
    double v9 = self->_frameTimes[5];
    BOOL dropped = self->_dropped;
    int v11 = 134219520;
    double v12 = v4;
    __int16 v13 = 2048;
    double v14 = v6;
    __int16 v15 = 2048;
    double v16 = v5;
    __int16 v17 = 2048;
    double v18 = v7;
    __int16 v19 = 2048;
    double v20 = v8;
    __int16 v21 = 2048;
    double v22 = v9;
    __int16 v23 = 1024;
    BOOL v24 = dropped;
    _os_log_impl(&dword_234C41000, v3, OS_LOG_TYPE_DEFAULT, " %12.3f | %8.3f (%5.3f) | %6.3f | %13.3f | %7.3f | %d ", (uint8_t *)&v11, 0x44u);
  }
}

- (BOOL)dropped
{
  return self->_dropped;
}

- (void)setDropped:(BOOL)a3
{
  self->_BOOL dropped = a3;
}

@end