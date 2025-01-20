@interface AXMAVCaptureSessionNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AVCaptureSession)captureSession;
- (AXMAVCaptureSessionNodeDelegate)captureSessionNodeDelegate;
- (AXMAVCaptureSessionNodeFrameDelegate)frameDelegate;
- (AXMCaptureVideoDataOutput)axVideoDataOutput;
- (AXMVisionAnalysisOptions)analysisOptions;
- (void)addVideoDataOutputWithAVCaptureSession:(id)a3 queue:(id)a4;
- (void)autoTriggerVideoFrameEventsWithAVCaptureSession:(id)a3 options:(id)a4 delegate:(id)a5;
- (void)beginFrameEventsWithAVCaptureSession:(id)a3 delegate:(id)a4 queue:(id)a5;
- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureSessionNode:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)endAutoTriggerOfVideoFrameEvents;
- (void)endVideoFrameEvents;
- (void)nodeInitialize;
- (void)produceImage:(id)a3;
- (void)setAnalysisOptions:(id)a3;
- (void)setAxVideoDataOutput:(id)a3;
- (void)setCaptureSession:(id)a3;
- (void)setCaptureSessionNodeDelegate:(id)a3;
- (void)setFrameDelegate:(id)a3;
- (void)setShouldProcessRemotely:(BOOL)a3;
- (void)triggerWithSampleBuffer:(opaqueCMSampleBuffer *)a3 interfaceOrientation:(int64_t)a4 mirrored:(BOOL)a5 options:(id)a6 userContext:(id)a7;
@end

@implementation AXMAVCaptureSessionNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return @"Capture Session";
}

- (void)setShouldProcessRemotely:(BOOL)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    [v3 raise:v4 format:@"AXMAVCaptureSessionNode does not support remote triggering"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMAVCaptureSessionNode;
    -[AXMSourceNode setShouldProcessRemotely:](&v5, sel_setShouldProcessRemotely_);
  }
}

- (void)produceImage:(id)a3
{
}

uint64_t __40__AXMAVCaptureSessionNode_produceImage___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"input"];
}

- (void)nodeInitialize
{
  v2.receiver = self;
  v2.super_class = (Class)AXMAVCaptureSessionNode;
  [(AXMSourceNode *)&v2 nodeInitialize];
}

- (void)autoTriggerVideoFrameEventsWithAVCaptureSession:(id)a3 options:(id)a4 delegate:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!self->_autotrigger_queue)
  {
    v10 = (OS_dispatch_queue *)dispatch_queue_create("AXMAVCaptureSessionNode-avkit-queue", 0);
    autotrigger_queue = self->_autotrigger_queue;
    self->_autotrigger_queue = v10;
  }
  [(AXMAVCaptureSessionNode *)self setCaptureSessionNodeDelegate:v9];
  [(AXMAVCaptureSessionNode *)self setAnalysisOptions:v8];
  [(AXMAVCaptureSessionNode *)self beginFrameEventsWithAVCaptureSession:v12 delegate:self queue:self->_autotrigger_queue];
}

- (AXMCaptureVideoDataOutput)axVideoDataOutput
{
  axVideoDataOutput = self->_axVideoDataOutput;
  if (!axVideoDataOutput)
  {
    uint64_t v4 = objc_alloc_init(AXMCaptureVideoDataOutput);
    objc_super v5 = self->_axVideoDataOutput;
    self->_axVideoDataOutput = v4;

    [(AVCaptureVideoDataOutput *)self->_axVideoDataOutput setAutomaticallyConfiguresOutputBufferDimensions:0];
    [(AVCaptureVideoDataOutput *)self->_axVideoDataOutput setDeliversPreviewSizedOutputBuffers:1];
    axVideoDataOutput = self->_axVideoDataOutput;
  }

  return axVideoDataOutput;
}

- (void)addVideoDataOutputWithAVCaptureSession:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXMAVCaptureSessionNode *)self axVideoDataOutput];
  [v8 setSampleBufferDelegate:self queue:v7];

  id v9 = [(AXMAVCaptureSessionNode *)self axVideoDataOutput];
  LODWORD(v8) = [v6 canAddOutput:v9];

  if (v8)
  {
    v10 = [(AXMAVCaptureSessionNode *)self axVideoDataOutput];
    [v6 addOutput:v10];

    [(AXMAVCaptureSessionNode *)self setCaptureSession:v6];
    v11 = [(AXMVisionEngineNode *)self delegate];
    [v11 captureSessionNodeDidBeginProcessingFrames:self];
  }
  else
  {
    v11 = AXMediaLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AXMAVCaptureSessionNode addVideoDataOutputWithAVCaptureSession:queue:]((id *)&self->super.super.super.isa, v11);
    }
  }
}

- (void)beginFrameEventsWithAVCaptureSession:(id)a3 delegate:(id)a4 queue:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11 = [(AXMAVCaptureSessionNode *)self captureSession];

    if (v11)
    {
      id v12 = AXMediaLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[AXMAVCaptureSessionNode beginFrameEventsWithAVCaptureSession:delegate:queue:](v12);
      }
    }
    else
    {
      [(AXMAVCaptureSessionNode *)self setFrameDelegate:v9];
      id v12 = [v8 outputs];
      v13 = [v12 ax_filteredArrayUsingBlock:&__block_literal_global_38_0];
      if ([v13 count])
      {
        v14 = AXMediaLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSession);
          v16 = [v13 firstObject];
          int v17 = 138412546;
          id v18 = WeakRetained;
          __int16 v19 = 2112;
          v20 = v16;
          _os_log_impl(&dword_1B57D5000, v14, OS_LOG_TYPE_DEFAULT, "Capture session '%@' already has output '%@'", (uint8_t *)&v17, 0x16u);
        }
      }
      else
      {
        [(AXMAVCaptureSessionNode *)self addVideoDataOutputWithAVCaptureSession:v8 queue:v10];
      }
    }
  }
}

uint64_t __79__AXMAVCaptureSessionNode_beginFrameEventsWithAVCaptureSession_delegate_queue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)endAutoTriggerOfVideoFrameEvents
{
  [(AXMAVCaptureSessionNode *)self endVideoFrameEvents];

  [(AXMAVCaptureSessionNode *)self setCaptureSessionNodeDelegate:0];
}

- (void)endVideoFrameEvents
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(AXMAVCaptureSessionNode *)self captureSession];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objc_super v5 = [v3 outputs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        objc_msgSend(v16, "setSampleBufferDelegate:queue:", 0, 0, (void)v18);
        [v3 removeOutput:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  [(AXMAVCaptureSessionNode *)self setFrameDelegate:0];
  [(AXMAVCaptureSessionNode *)self setCaptureSession:0];
  int v17 = [(AXMVisionEngineNode *)self delegate];
  [v17 captureSessionNodeDidEndProcessingFrames:self];
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  if (a4)
  {
    id v9 = [(AXMVisionEngineNode *)self delegate];
    int v10 = [v9 engineWillAcceptTiggerWithSource:self];

    if (v10)
    {
      if (CMSampleBufferGetImageBuffer(a4))
      {
        id v11 = [(AXMAVCaptureSessionNode *)self frameDelegate];
        [v11 captureSessionNode:self didOutputSampleBuffer:a4 fromConnection:v8];
      }
    }
  }
}

- (void)triggerWithSampleBuffer:(opaqueCMSampleBuffer *)a3 interfaceOrientation:(int64_t)a4 mirrored:(BOOL)a5 options:(id)a6 userContext:(id)a7
{
  BOOL v8 = a5;
  v22[2] = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    v15 = +[AXMPixelBufferWrapper wrapperWithPixelBuffer:ImageBuffer orientation:AXMEXIFOrientationFromInterfaceOrientation(a4, v8)];
    v16 = +[AXMPipelineContextInput inputWithPixelBuffer:v15];
    v21[0] = @"input";
    v21[1] = @"diagnosticsEnabled";
    v22[0] = v16;
    int v17 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
    v22[1] = v17;
    long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    long long v19 = +[AXMVisionPipelineContext contextWithSourceParameters:v18 options:v12];

    [v19 setShouldCallCompletionHandlersForEmptyResultSet:1];
    [v19 setUserContext:v13];
    [(AXMSourceNode *)self triggerWithContext:v19 cacheKey:0 resultHandler:0];
    long long v20 = [(AXMVisionEngineNode *)self delegate];
    [v20 captureSessionNodeWillProcessFrame:self];
  }
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v6 = [(AXMVisionEngineNode *)self delegate];
  [v6 captureSessionNodeDidDropFrame:self];
}

- (void)captureSessionNode:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v7 = a5;
  BOOL v8 = [(AXMAVCaptureSessionNode *)self captureSessionNodeDelegate];
  uint64_t v9 = [v8 interfaceOrientationForCaptureSessionNode:self];

  id v12 = +[AXMAVUtilities videoDeviceFromConnection:v7];

  BOOL v10 = +[AXMAVUtilities isMirroredVideoDevice:v12];
  id v11 = [(AXMAVCaptureSessionNode *)self analysisOptions];
  [(AXMAVCaptureSessionNode *)self triggerWithSampleBuffer:a4 interfaceOrientation:v9 mirrored:v10 options:v11 userContext:0];
}

- (void)setAxVideoDataOutput:(id)a3
{
}

- (AXMAVCaptureSessionNodeDelegate)captureSessionNodeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSessionNodeDelegate);

  return (AXMAVCaptureSessionNodeDelegate *)WeakRetained;
}

- (void)setCaptureSessionNodeDelegate:(id)a3
{
}

- (AXMAVCaptureSessionNodeFrameDelegate)frameDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_frameDelegate);

  return (AXMAVCaptureSessionNodeFrameDelegate *)WeakRetained;
}

- (void)setFrameDelegate:(id)a3
{
}

- (AVCaptureSession)captureSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSession);

  return (AVCaptureSession *)WeakRetained;
}

- (void)setCaptureSession:(id)a3
{
}

- (AXMVisionAnalysisOptions)analysisOptions
{
  return self->_analysisOptions;
}

- (void)setAnalysisOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisOptions, 0);
  objc_destroyWeak((id *)&self->_captureSession);
  objc_destroyWeak((id *)&self->_frameDelegate);
  objc_destroyWeak((id *)&self->_captureSessionNodeDelegate);
  objc_storeStrong((id *)&self->_axVideoDataOutput, 0);

  objc_storeStrong((id *)&self->_autotrigger_queue, 0);
}

- (void)addVideoDataOutputWithAVCaptureSession:(id *)a1 queue:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 axVideoDataOutput];
  id WeakRetained = objc_loadWeakRetained(a1 + 11);
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = WeakRetained;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Cannot add output '%@' to session '%@'", (uint8_t *)&v6, 0x16u);
}

- (void)beginFrameEventsWithAVCaptureSession:(os_log_t)log delegate:queue:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B57D5000, log, OS_LOG_TYPE_FAULT, "AXMAVCaptureSessionNode already has a AVCaptureSession attached", v1, 2u);
}

@end