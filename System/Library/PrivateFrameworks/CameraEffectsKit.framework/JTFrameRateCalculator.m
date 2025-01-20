@interface JTFrameRateCalculator
- (JTFrameRateCalculator)initWithWindowSize:(double)a3;
- (NSDate)stateDate;
- (NSString)name;
- (double)windowSize;
- (unint64_t)droppedDisplayFrameCount;
- (unint64_t)droppedRenderCount;
- (unint64_t)receivedDisplayFrameCount;
- (unint64_t)receivedRenderCount;
- (void)JT_restart;
- (void)log:(id)a3;
- (void)setDroppedDisplayFrameCount:(unint64_t)a3;
- (void)setDroppedRenderCount:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setReceivedDisplayFrameCount:(unint64_t)a3;
- (void)setReceivedRenderCount:(unint64_t)a3;
- (void)setStateDate:(id)a3;
- (void)setWindowSize:(double)a3;
- (void)tickDropped;
- (void)tickDroppedDisplay;
- (void)tickFrameReceived;
- (void)tickReceived;
@end

@implementation JTFrameRateCalculator

- (JTFrameRateCalculator)initWithWindowSize:(double)a3
{
  v14.receiver = self;
  v14.super_class = (Class)JTFrameRateCalculator;
  v4 = [(JTFrameRateCalculator *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_windowSize = a3;
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v6 stringWithFormat:@"com.apple.%@", v8];

    id v10 = v9;
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    [(JTFrameRateCalculator *)v5 JT_restart];
  }
  return v5;
}

- (void)log:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__JTFrameRateCalculator_log___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __29__JTFrameRateCalculator_log___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) stateDate];
  [v2 timeIntervalSinceNow];
  double v4 = v3;

  [*(id *)(a1 + 32) windowSize];
  if (v5 > 0.0)
  {
    double v6 = -v4;
    [*(id *)(a1 + 32) windowSize];
    if (v7 < -v4)
    {
      uint64_t v8 = [*(id *)(a1 + 32) receivedRenderCount];
      unint64_t v9 = v8 - [*(id *)(a1 + 32) droppedRenderCount];
      float v10 = (double)(v9 - [*(id *)(a1 + 32) droppedDisplayFrameCount]) / v6;
      dispatch_queue_t v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
      int v12 = [v11 BOOLForKey:@"JTLogFPS"];

      if (v12)
      {
        v13 = +[JFXVideoCameraController sharedInstance];
        objc_super v14 = [v13 debugFrameRateLabel];

        v15 = JFXLog_core();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          double v16 = (double)v9 / v6;
          v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "receivedRenderCount"));
          v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "droppedRenderCount"));
          v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "receivedDisplayFrameCount"));
          v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "droppedDisplayFrameCount"));
          v21 = [*(id *)(a1 + 32) name];
          *(_DWORD *)buf = 134219778;
          double v26 = v16;
          __int16 v27 = 2048;
          double v28 = v10;
          __int16 v29 = 2112;
          v30 = v17;
          __int16 v31 = 2112;
          v32 = v18;
          __int16 v33 = 2112;
          v34 = v19;
          __int16 v35 = 2112;
          v36 = v20;
          __int16 v37 = 2112;
          v38 = v14;
          __int16 v39 = 2112;
          v40 = v21;
          _os_log_impl(&dword_234C41000, v15, OS_LOG_TYPE_DEFAULT, "Processed FPS (%f); Display FPS (%f); recieved (%@); dropped (%@); frameCount(%@); droppedDisplay(%@); cameraRate (%@) [%@]",
            buf,
            0x52u);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "JT_restart");
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __29__JTFrameRateCalculator_log___block_invoke_7;
      v22[3] = &unk_264C0C330;
      id v23 = *(id *)(a1 + 40);
      float v24 = v10;
      dispatch_async(MEMORY[0x263EF83A0], v22);
    }
  }
}

uint64_t __29__JTFrameRateCalculator_log___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(float *)(a1 + 40));
}

- (void)tickReceived
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__JTFrameRateCalculator_tickReceived__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__JTFrameRateCalculator_tickReceived__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 receivedRenderCount] + 1;
  return [v1 setReceivedRenderCount:v2];
}

- (void)tickDropped
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__JTFrameRateCalculator_tickDropped__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__JTFrameRateCalculator_tickDropped__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 droppedRenderCount] + 1;
  return [v1 setDroppedRenderCount:v2];
}

- (void)tickFrameReceived
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__JTFrameRateCalculator_tickFrameReceived__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__JTFrameRateCalculator_tickFrameReceived__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 receivedDisplayFrameCount] + 1;
  return [v1 setReceivedDisplayFrameCount:v2];
}

- (void)tickDroppedDisplay
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__JTFrameRateCalculator_tickDroppedDisplay__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__JTFrameRateCalculator_tickDroppedDisplay__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 droppedDisplayFrameCount] + 1;
  return [v1 setDroppedDisplayFrameCount:v2];
}

- (void)JT_restart
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__JTFrameRateCalculator_JT_restart__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__JTFrameRateCalculator_JT_restart__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF910] date];
  [*(id *)(a1 + 32) setStateDate:v2];

  [*(id *)(a1 + 32) setReceivedRenderCount:0];
  [*(id *)(a1 + 32) setDroppedRenderCount:0];
  [*(id *)(a1 + 32) setReceivedDisplayFrameCount:0];
  double v3 = *(void **)(a1 + 32);
  return [v3 setDroppedDisplayFrameCount:0];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)receivedRenderCount
{
  return self->_receivedRenderCount;
}

- (void)setReceivedRenderCount:(unint64_t)a3
{
  self->_receivedRenderCount = a3;
}

- (unint64_t)droppedRenderCount
{
  return self->_droppedRenderCount;
}

- (void)setDroppedRenderCount:(unint64_t)a3
{
  self->_droppedRenderCount = a3;
}

- (unint64_t)receivedDisplayFrameCount
{
  return self->_receivedDisplayFrameCount;
}

- (void)setReceivedDisplayFrameCount:(unint64_t)a3
{
  self->_receivedDisplayFrameCount = a3;
}

- (unint64_t)droppedDisplayFrameCount
{
  return self->_droppedDisplayFrameCount;
}

- (void)setDroppedDisplayFrameCount:(unint64_t)a3
{
  self->_droppedDisplayFrameCount = a3;
}

- (double)windowSize
{
  return self->_windowSize;
}

- (void)setWindowSize:(double)a3
{
  self->_windowSize = a3;
}

- (NSDate)stateDate
{
  return self->_stateDate;
}

- (void)setStateDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end