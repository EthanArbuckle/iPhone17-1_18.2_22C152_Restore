@interface AWAttentionStreamer
- ($EB925890EBEBD6850280D1FB85A9BD43)getStreamerOptionsWithMask:(unint64_t)a3;
- (AWAttentionStreamer)initWithOptions:(id)a3;
- (BOOL)isStreamerRunningWithMask:(unint64_t)a3;
- (id)cancelEventStreamWithMask:(unint64_t)a3;
- (id)initForUnitTest:(BOOL)a3 useAVFoundation:(BOOL)a4;
- (id)streamEventsWithMask:(unint64_t)a3 block:(id)a4 options:(id)a5 operationStartFailedBlock:(id)a6;
- (void)logStreamComplete:(unint64_t)a3 identifier:(id)a4 duration:(unint64_t)a5 ERActivated:(BOOL)a6;
- (void)setDisplayStateWithMask:(unint64_t)a3 displayState:(BOOL)a4;
- (void)setNotificationHandler:(id)a3 withMask:(unint64_t)a4;
- (void)setSmartCoverStateWithMask:(unint64_t)a3 smartCoverState:(BOOL)a4;
@end

@implementation AWAttentionStreamer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleLogger, 0);
  objc_storeStrong((id *)&self->_faceDetectStreamer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDisplayStateWithMask:(unint64_t)a3 displayState:(BOOL)a4
{
  if (a3 == 128) {
    [(StreamingOperation *)self->_faceDetectStreamer setDisplayState:a4];
  }
}

- (void)setSmartCoverStateWithMask:(unint64_t)a3 smartCoverState:(BOOL)a4
{
  if (a3 == 128) {
    [(StreamingOperation *)self->_faceDetectStreamer setSmartCoverState:a4];
  }
}

- (void)logStreamComplete:(unint64_t)a3 identifier:(id)a4 duration:(unint64_t)a5 ERActivated:(BOOL)a6
{
  if (a3 == 128) {
    [(AWSampleLogger *)self->_sampleLogger streamingCompleteWithidentifier:a4 duration:a5 ERActivated:a6];
  }
}

- ($EB925890EBEBD6850280D1FB85A9BD43)getStreamerOptionsWithMask:(unint64_t)a3
{
  if (a3 == 128) {
    return ($EB925890EBEBD6850280D1FB85A9BD43)[(StreamingOperation *)self->_faceDetectStreamer getStreamerOptions];
  }
  else {
    LODWORD(v3) = 0;
  }
  return ($EB925890EBEBD6850280D1FB85A9BD43)v3;
}

- (void)setNotificationHandler:(id)a3 withMask:(unint64_t)a4
{
  if (a4 == 128) {
    [(StreamingOperation *)self->_faceDetectStreamer setNotificationHandler:a3];
  }
}

- (BOOL)isStreamerRunningWithMask:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 != 128) {
    return 0;
  }
  faceDetectStreamer = self->_faceDetectStreamer;
  if (!faceDetectStreamer)
  {
    if (currentLogLevel >= 3)
    {
      v5 = _AALog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        unint64_t v6 = absTimeNS();
        if (v6 == -1) {
          double v7 = INFINITY;
        }
        else {
          double v7 = (double)v6 / 1000000000.0;
        }
        int v8 = 134217984;
        double v9 = v7;
        _os_log_error_impl(&dword_1B3B4B000, v5, OS_LOG_TYPE_ERROR, "%13.5f: No Attention streamer available", (uint8_t *)&v8, 0xCu);
      }
    }
    return 0;
  }

  return [(StreamingOperation *)faceDetectStreamer attentionStreamerRunning];
}

- (id)cancelEventStreamWithMask:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 == 128)
  {
    faceDetectStreamer = self->_faceDetectStreamer;
    if (faceDetectStreamer)
    {
      v4 = [(StreamingOperation *)faceDetectStreamer cancelEventStream];
      goto LABEL_6;
    }
    if (currentLogLevel >= 3)
    {
      v12 = _AALog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unint64_t v15 = absTimeNS();
        if (v15 == -1) {
          double v16 = INFINITY;
        }
        else {
          double v16 = (double)v15 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v22 = v16;
        _os_log_error_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_ERROR, "%13.5f: No Attention streamer available", buf, 0xCu);
      }
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28798];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20 = @" No attention streamer found";
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    int v8 = v13;
    uint64_t v9 = v14;
    uint64_t v10 = 19;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28798];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18 = @" Invalid mask to start a stream";
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    int v8 = v5;
    uint64_t v9 = v6;
    uint64_t v10 = 22;
  }
  v4 = [v8 errorWithDomain:v9 code:v10 userInfo:v7];

LABEL_6:

  return v4;
}

- (id)streamEventsWithMask:(unint64_t)a3 block:(id)a4 options:(id)a5 operationStartFailedBlock:(id)a6
{
  int v7 = *(_DWORD *)&a5.var0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  if (a3 == 128)
  {
    faceDetectStreamer = self->_faceDetectStreamer;
    if (faceDetectStreamer)
    {
      v13 = [(StreamingOperation *)faceDetectStreamer streamEventWithBlock:v10 options:*(void *)&v7 & 0xFFFFFFLL operationStartFailedBlock:v11];
      goto LABEL_6;
    }
    if (currentLogLevel >= 3)
    {
      v21 = _AALog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        unint64_t v24 = absTimeNS();
        if (v24 == -1) {
          double v25 = INFINITY;
        }
        else {
          double v25 = (double)v24 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v31 = v25;
        _os_log_error_impl(&dword_1B3B4B000, v21, OS_LOG_TYPE_ERROR, "%13.5f: No Attention streamer available", buf, 0xCu);
      }
    }
    double v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28798];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29 = @" No attention streamer found";
    double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v17 = v22;
    uint64_t v18 = v23;
    uint64_t v19 = 19;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28798];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27 = @" Invalid mask to start a stream";
    double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v17 = v14;
    uint64_t v18 = v15;
    uint64_t v19 = 22;
  }
  v13 = [v17 errorWithDomain:v18 code:v19 userInfo:v16];

LABEL_6:

  return v13;
}

- (id)initForUnitTest:(BOOL)a3 useAVFoundation:(BOOL)a4
{
  BOOL v4 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AWAttentionStreamer;
  uint64_t v6 = [(AWAttentionStreamer *)&v16 init];
  int v7 = v6;
  if (v6)
  {
    v6->_unitTestMode = a3;
    uint64_t v8 = awQueue(1);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = +[AWSampleLogger sharedLogger];
    sampleLogger = v7->_sampleLogger;
    v7->_sampleLogger = (AWSampleLogger *)v10;

    v12 = off_1E6069CF0;
    if (!v4) {
      v12 = off_1E6069D20;
    }
    uint64_t v13 = [objc_alloc(*v12) initForUnitTest:v7->_unitTestMode queue:v7->_queue];
    faceDetectStreamer = v7->_faceDetectStreamer;
    v7->_faceDetectStreamer = (StreamingOperation *)v13;
  }
  return v7;
}

- (AWAttentionStreamer)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v6 = [v4 valueForKey:@"eventMask"];

  if (v6)
  {
    uint64_t v6 = [v5 valueForKey:@"useAVFoundation"];

    if (v6)
    {
      uint64_t v6 = [v5 valueForKey:@"unitTest"];

      if (v6)
      {
        int v7 = [v5 valueForKey:@"eventMask"];
        uint64_t v8 = [v7 unsignedLongValue];

        uint64_t v9 = [v5 valueForKey:@"unitTest"];
        uint64_t v10 = [v9 BOOLValue];

        id v11 = [v5 valueForKey:@"useAVFoundation"];
        uint64_t v12 = [v11 BOOLValue];

        if (v8 == 128)
        {
          self = (AWAttentionStreamer *)[(AWAttentionStreamer *)self initForUnitTest:v10 useAVFoundation:v12];
          uint64_t v6 = self;
          goto LABEL_8;
        }
LABEL_7:
        uint64_t v6 = 0;
      }
    }
  }
LABEL_8:

  return v6;
}

@end