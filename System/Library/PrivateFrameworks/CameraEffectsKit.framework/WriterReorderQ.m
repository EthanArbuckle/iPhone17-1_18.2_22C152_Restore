@interface WriterReorderQ
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastReorderedTime;
- (PVFrameSet)frameSet;
- (WriterReorderQ)init;
- (id)clearQueuedFrameSet;
- (id)getReorderedFrameSet:(id)a3;
- (void)clearQueuedFrameSet;
- (void)setFrameSet:(id)a3;
- (void)setLastReorderedTime:(id *)a3;
@end

@implementation WriterReorderQ

- (WriterReorderQ)init
{
  v7.receiver = self;
  v7.super_class = (Class)WriterReorderQ;
  v2 = [(WriterReorderQ *)&v7 init];
  v3 = v2;
  if (v2)
  {
    frameSet = v2->_frameSet;
    v2->_frameSet = 0;

    uint64_t v5 = MEMORY[0x263F010E0];
    *(_OWORD *)&v3->_lastReorderedTime.value = *MEMORY[0x263F010E0];
    v3->_lastReorderedTime.epoch = *(void *)(v5 + 16);
  }
  return v3;
}

- (id)getReorderedFrameSet:(id)a3
{
  id v4 = a3;
  memset(&v26, 0, sizeof(v26));
  uint64_t v5 = [v4 colorSampleBuffer];
  v6 = v5;
  if (v5) {
    [v5 presentationTimeStamp];
  }
  else {
    memset(&v26, 0, sizeof(v26));
  }

  if ((v26.flags & 1) == 0)
  {
    objc_super v7 = JFXLog_DebugWriterReorder();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[WriterReorderQ getReorderedFrameSet:].cold.5();
    }
  }
  v8 = [(WriterReorderQ *)self frameSet];

  if (v8)
  {
    memset(&v25, 0, sizeof(v25));
    v9 = [(WriterReorderQ *)self frameSet];
    v10 = [v9 colorSampleBuffer];
    v11 = v10;
    if (v10) {
      [v10 presentationTimeStamp];
    }
    else {
      memset(&v25, 0, sizeof(v25));
    }

    CMTime time1 = v26;
    CMTime time2 = v25;
    int32_t v13 = CMTimeCompare(&time1, &time2);
    v14 = JFXLog_DebugWriterReorder();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v13 < 0)
    {
      if (v15) {
        -[WriterReorderQ getReorderedFrameSet:].cold.4((uint64_t)&v26);
      }

      id v16 = v4;
    }
    else
    {
      if (v15) {
        -[WriterReorderQ getReorderedFrameSet:]((uint64_t)&v26);
      }

      id v16 = [(WriterReorderQ *)self frameSet];
      [(WriterReorderQ *)self setFrameSet:v4];
    }
    memset(&time1, 0, sizeof(time1));
    v17 = [v16 colorSampleBuffer];
    v18 = v17;
    if (v17) {
      [v17 presentationTimeStamp];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }

    [(WriterReorderQ *)self lastReorderedTime];
    CMTime time2 = time1;
    if ((CMTimeCompare(&time2, &v22) & 0x80000000) == 0)
    {
      CMTime v21 = time1;
      [(WriterReorderQ *)self setLastReorderedTime:&v21];
      goto LABEL_31;
    }
    v19 = JFXLog_DebugWriterReorder();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[WriterReorderQ getReorderedFrameSet:]();
    }
  }
  else
  {
    v12 = JFXLog_DebugWriterReorder();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[WriterReorderQ getReorderedFrameSet:]((uint64_t)&v26);
    }

    [(WriterReorderQ *)self setFrameSet:v4];
  }
  id v16 = 0;
LABEL_31:

  return v16;
}

- (id)clearQueuedFrameSet
{
  v3 = JFXLog_DebugWriterReorder();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(WriterReorderQ *)self clearQueuedFrameSet];
  }

  id v4 = [(WriterReorderQ *)self frameSet];
  [(WriterReorderQ *)self setFrameSet:0];
  return v4;
}

- (PVFrameSet)frameSet
{
  return self->_frameSet;
}

- (void)setFrameSet:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastReorderedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setLastReorderedTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastReorderedTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastReorderedTime.value = v3;
}

- (void).cxx_destruct
{
}

- (void)getReorderedFrameSet:(uint64_t)a1 .cold.1(uint64_t a1)
{
  OUTLINED_FUNCTION_2(a1);
  v2 = JFXNSStringForCMTime(v1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "Queued first reorder frame:   %@", v5, v6, v7, v8, v9);
}

- (void)getReorderedFrameSet:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "WriterQ dropping severely OOO frame to writer.", v2, v3, v4, v5, v6);
}

- (void)getReorderedFrameSet:(uint64_t)a1 .cold.3(uint64_t a1)
{
  OUTLINED_FUNCTION_2(a1);
  uint64_t v2 = JFXNSStringForCMTime(v1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "Queued frame was in order:  %@", v5, v6, v7, v8, v9);
}

- (void)getReorderedFrameSet:(uint64_t)a1 .cold.4(uint64_t a1)
{
  OUTLINED_FUNCTION_2(a1);
  uint64_t v2 = JFXNSStringForCMTime(v1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "Queued frame was out of order: %@", v5, v6, v7, v8, v9);
}

- (void)getReorderedFrameSet:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "* invalid time", v2, v3, v4, v5, v6);
}

- (void)clearQueuedFrameSet
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 frameSet];
  uint8_t v6 = [v5 colorSampleBuffer];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 presentationTimeStamp];
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  uint64_t v8 = JFXNSStringForCMTime((CMTime *)a2);
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_234C41000, a3, OS_LOG_TYPE_DEBUG, "clearing queued frame:         %@", v9, 0xCu);
}

@end