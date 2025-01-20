@interface AVCustomVideoCompositorSession
+ (AVCustomVideoCompositorSession)sessionWithVideoComposition:(id)a3 recyclingSession:(id)a4;
+ (BOOL)_colorPropertiesAreSetInVideoComposition:(id)a3;
- (AVCustomVideoCompositorSession)initWithVideoComposition:(id)a3;
- (BOOL)_validateRequiredPixelBufferAttributesForRenderContext:(id)a3 andReturnException:(id *)a4;
- (BOOL)_validateSourcePixelBufferAttributes:(id)a3 andReturnException:(id *)a4;
- (BOOL)commitCustomVideoCompositorPropertiesAndReturnError:(id *)a3;
- (BOOL)supportsHDRSourceFrames;
- (BOOL)supportsWideColorSourceFrames;
- (OpaqueFigVideoCompositor)_copyFigVideoCompositor;
- (id)customVideoCompositor;
- (id)getAndClearClientError;
- (int)_compositionFrame:(OpaqueFigVideoCompositorFrame *)a3 atTime:(id *)a4 requiresRenderUsingSources:(id)a5 requiresSampleBuffersUsingSources:(id)a6 withInstruction:(void *)a7;
- (int)_customCompositorShouldAnticipateRenderingFromTime:(id *)a3 toTime:(id *)a4 andThenFromTime:(id *)a5 toTime:(id *)a6;
- (int)_customCompositorShouldCancelPendingFrames;
- (int)_customCompositorShouldPrerollForRenderingFromTime:(id *)a3 toTime:(id *)a4 andThenFromTime:(id *)a5 toTime:(id *)a6 requestID:(int64_t)a7;
- (int)_setupFigCallbacks;
- (void)_cleanupFigCallbacks;
- (void)_customCompositorFigPropertyDidChange;
- (void)_willDeallocOrFinalize;
- (void)compositionFrame:(OpaqueFigVideoCompositorFrame *)a3 didFinishWithComposedPixelBuffer:(__CVBuffer *)a4;
- (void)compositionFrame:(OpaqueFigVideoCompositorFrame *)a3 didFinishWithError:(id)a4;
- (void)compositionFrameDidCancel:(OpaqueFigVideoCompositorFrame *)a3;
- (void)dealloc;
- (void)detachVideoComposition;
- (void)setVideoComposition:(id)a3;
@end

@implementation AVCustomVideoCompositorSession

+ (AVCustomVideoCompositorSession)sessionWithVideoComposition:(id)a3 recyclingSession:(id)a4
{
  if (a4
    && [a4 customVideoCompositor]
    && ([a4 customVideoCompositor],
        [a3 customVideoCompositorClass],
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    [a4 setVideoComposition:a3];
    return (AVCustomVideoCompositorSession *)a4;
  }
  else
  {
    v7 = [[AVCustomVideoCompositorSession alloc] initWithVideoComposition:a3];
    return v7;
  }
}

+ (BOOL)_colorPropertiesAreSetInVideoComposition:(id)a3
{
  return [a3 colorPrimaries]
      || [a3 colorTransferFunction]
      || [a3 colorYCbCrMatrix] != 0;
}

- (AVCustomVideoCompositorSession)initWithVideoComposition:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)AVCustomVideoCompositorSession;
  v4 = [(AVCustomVideoCompositorSession *)&v28 init];
  if (v4)
  {
    if (!a3) {
      goto LABEL_22;
    }
    v5 = (AVVideoComposition *)[a3 copy];
    v4->_videoComposition = v5;
    v6 = (AVVideoCompositing *)objc_alloc_init((Class)[(AVVideoComposition *)v5 customVideoCompositorClass]);
    v4->_clientCustomCompositor = v6;
    if (!v6) {
      goto LABEL_22;
    }
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (FigVideoCompositorCreateRemote()) {
      goto LABEL_22;
    }
    uint64_t clientCustomCompositor_low = LODWORD(v4->_clientCustomCompositor);
    uint64_t valuePtr = clientCustomCompositor_low | (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processIdentifier") << 32);
    CFNumberRef v9 = CFNumberCreate(v7, kCFNumberSInt64Type, &valuePtr);
    uint64_t FigBaseObject = FigVideoCompositorGetFigBaseObject();
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    v13 = *(uint64_t (**)(uint64_t, void, CFNumberRef))(v12 + 56);
    if (v13)
    {
      int v14 = v13(FigBaseObject, *MEMORY[0x1E4F34B78], v9);
      if (!v9) {
        goto LABEL_13;
      }
    }
    else
    {
      int v14 = -12782;
      if (!v9)
      {
LABEL_13:
        if (!v14)
        {
          v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          dispatch_queue_t v16 = dispatch_queue_create("com.apple.avcustomvideocompositorsession.clientcustomcompositorq", v15);
          v4->_clientCustomCompositorQ = (OS_dispatch_queue *)v16;
          if (v16)
          {
            v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
            dispatch_queue_t v18 = dispatch_queue_create("com.apple.avcustomvideocompositorsession.rendercontextq", v17);
            v4->_renderContextQ = (OS_dispatch_queue *)v18;
            if (v18)
            {
              v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
              dispatch_queue_t v20 = dispatch_queue_create("com.apple.avcustomvideocompositorsession.clienterrorq", v19);
              v4->_clientErrorQ = (OS_dispatch_queue *)v20;
              if (v20)
              {
                v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                dispatch_queue_t v22 = dispatch_queue_create("com.apple.avcustomvideocompositorsession.videocompositionq", v21);
                v4->_videoCompositionQ = (OS_dispatch_queue *)v22;
                if (v22)
                {
                  v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                  dispatch_queue_t v24 = dispatch_queue_create("com.apple.avcustomvideocompositorsession.finishedrequestq", v23);
                  v4->_finishedRequestQ = (OS_dispatch_queue *)v24;
                  if (v24)
                  {
                    v25 = [[AVWeakReference alloc] initWithReferencedObject:v4];
                    v4->_weakSelf = v25;
                    if (v25)
                    {
                      if (![(AVCustomVideoCompositorSession *)v4 _setupFigCallbacks]) {
                        return v4;
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_22:

        return 0;
      }
    }
    CFRelease(v9);
    goto LABEL_13;
  }
  return v4;
}

- (id)customVideoCompositor
{
  return self->_clientCustomCompositor;
}

- (BOOL)_validateSourcePixelBufferAttributes:(id)a3 andReturnException:(id *)a4
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [a3 objectForKey:*MEMORY[0x1E4F24D70]];
      if (v16)
      {
        dispatch_queue_t v22 = (void *)v16;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (![v22 count])
          {
            objc_super v28 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v29 = *MEMORY[0x1E4F1C3C8];
            uint64_t v30 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_sourcePixelBufferAttributes, @"Value of kCVPixelBufferPixelFormatTypeKey in AVVideoCompositing sourcePixelBufferAttributes must contain at least one item. (AVVideoCompositing=%p)", v23, v24, v25, v26, v27, (uint64_t)self->_clientCustomCompositor);
            goto LABEL_14;
          }
LABEL_11:
          v36 = 0;
          BOOL v37 = 1;
          if (!a4) {
            return v37;
          }
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_11;
        }
        objc_super v28 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v29 = *MEMORY[0x1E4F1C3C8];
        uint64_t v30 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_sourcePixelBufferAttributes, @"Value of kCVPixelBufferPixelFormatTypeKey in AVVideoCompositing sourcePixelBufferAttributes must be either an NSArray or an NSNumber. (AVVideoCompositing=%p)", v31, v32, v33, v34, v35, (uint64_t)self->_clientCustomCompositor);
      }
      else
      {
        objc_super v28 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v29 = *MEMORY[0x1E4F1C3C8];
        uint64_t v30 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_sourcePixelBufferAttributes, @"sourcePixelBufferAttributes must contain kCVPixelBufferPixelFormatTypeKey. (AVVideoCompositing=%p)", v17, v18, v19, v20, v21, (uint64_t)self->_clientCustomCompositor);
      }
    }
    else
    {
      objc_super v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v29 = *MEMORY[0x1E4F1C3C8];
      uint64_t v30 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_sourcePixelBufferAttributes, @"sourcePixelBufferAttributes must be an NSDictionary. (AVVideoCompositing=%p)", v11, v12, v13, v14, v15, (uint64_t)self->_clientCustomCompositor);
    }
  }
  else
  {
    objc_super v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    uint64_t v30 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_sourcePixelBufferAttributes, @"sourcePixelBufferAttributes must not be nil. (AVVideoCompositing=%p)", (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self->_clientCustomCompositor);
  }
LABEL_14:
  v36 = (void *)[v28 exceptionWithName:v29 reason:v30 userInfo:0];
  BOOL v37 = 0;
  if (a4) {
LABEL_15:
  }
    *a4 = v36;
  return v37;
}

- (BOOL)_validateRequiredPixelBufferAttributesForRenderContext:(id)a3 andReturnException:(id *)a4
{
  if (a3)
  {
    uint64_t v10 = [a3 objectForKey:*MEMORY[0x1E4F24D70]];
    if (v10)
    {
      uint64_t v16 = (void *)v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![v16 count])
        {
          dispatch_queue_t v22 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v23 = *MEMORY[0x1E4F1C3C8];
          uint64_t v24 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_requiredPixelBufferAttributesForRenderContext, @"Value of kCVPixelBufferPixelFormatTypeKey in requiredPixelBufferAttributesForRenderContext must contain at least one item. (AVVideoCompositing=%p)", v17, v18, v19, v20, v21, (uint64_t)self->_clientCustomCompositor);
          goto LABEL_12;
        }
LABEL_9:
        uint64_t v30 = 0;
        BOOL v31 = 1;
        if (!a4) {
          return v31;
        }
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_9;
      }
      dispatch_queue_t v22 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v23 = *MEMORY[0x1E4F1C3C8];
      uint64_t v24 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_requiredPixelBufferAttributesForRenderContext, @"Value of kCVPixelBufferPixelFormatTypeKey in requiredPixelBufferAttributesForRenderContext must be either an NSArray or an NSNumber. (AVVideoCompositing=%p)", v25, v26, v27, v28, v29, (uint64_t)self->_clientCustomCompositor);
    }
    else
    {
      dispatch_queue_t v22 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v23 = *MEMORY[0x1E4F1C3C8];
      uint64_t v24 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_requiredPixelBufferAttributesForRenderContext, @"requiredPixelBufferAttributesForRenderContext must contain kCVPixelBufferPixelFormatTypeKey. (AVVideoCompositing=%p)", v11, v12, v13, v14, v15, (uint64_t)self->_clientCustomCompositor);
    }
  }
  else
  {
    dispatch_queue_t v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = *MEMORY[0x1E4F1C3C8];
    uint64_t v24 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_requiredPixelBufferAttributesForRenderContext, @"requiredPixelBufferAttributesForRenderContext must not be nil. (AVVideoCompositing=%p)", (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self->_clientCustomCompositor);
  }
LABEL_12:
  uint64_t v30 = (void *)[v22 exceptionWithName:v23 reason:v24 userInfo:0];
  BOOL v31 = 0;
  if (a4) {
LABEL_13:
  }
    *a4 = v30;
  return v31;
}

- (BOOL)commitCustomVideoCompositorPropertiesAndReturnError:(id *)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v33 = 0;
  uint64_t v5 = [(AVVideoCompositing *)self->_clientCustomCompositor sourcePixelBufferAttributes];
  uint64_t v6 = [(AVVideoCompositing *)self->_clientCustomCompositor requiredPixelBufferAttributesForRenderContext];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000;
  uint64_t v30 = __Block_byref_object_copy__43;
  BOOL v31 = __Block_byref_object_dispose__43;
  uint64_t v32 = 0;
  uint64_t v32 = objc_msgSend((id)-[AVVideoCompositing requiredPixelBufferAttributesForRenderContext](self->_clientCustomCompositor, "requiredPixelBufferAttributesForRenderContext"), "copy");
  uint64_t v21 = 0;
  dispatch_queue_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__43;
  uint64_t v25 = __Block_byref_object_dispose__43;
  uint64_t v26 = 0;
  if (![(AVCustomVideoCompositorSession *)self _validateSourcePixelBufferAttributes:v5 andReturnException:&v33]|| ![(AVCustomVideoCompositorSession *)self _validateRequiredPixelBufferAttributesForRenderContext:v6 andReturnException:&v33])
  {
    goto LABEL_24;
  }
  uint64_t FigBaseObject = FigVideoCompositorGetFigBaseObject();
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(uint64_t (**)(uint64_t, void, uint64_t))(v9 + 56);
  if (!v10)
  {
    signed int v11 = -12782;
LABEL_13:
    uint64_t v12 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v11, 0);
    goto LABEL_25;
  }
  signed int v11 = v10(FigBaseObject, *MEMORY[0x1E4F34BD0], v5);
  if (v11) {
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(AVVideoCompositing *)self->_clientCustomCompositor canConformColorOfSourceFrames]&& ![(AVCustomVideoCompositorSession *)self supportsHDRSourceFrames])
  {
    [(AVCustomVideoCompositorSession *)self supportsWideColorSourceFrames];
  }
  UInt32 = (const void *)FigCFNumberCreateUInt32();
  uint64_t v14 = FigVideoCompositorGetFigBaseObject();
  uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = *(uint64_t (**)(uint64_t, void, const void *))(v16 + 56);
  if (v17) {
    signed int v11 = v17(v14, *MEMORY[0x1E4F34BC8], UInt32);
  }
  else {
    signed int v11 = -12782;
  }
  if (UInt32) {
    CFRelease(UInt32);
  }
  if (v11) {
    goto LABEL_13;
  }
  renderContextQ = self->_renderContextQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__AVCustomVideoCompositorSession_commitCustomVideoCompositorPropertiesAndReturnError___block_invoke;
  block[3] = &unk_1E57B3888;
  block[4] = self;
  block[5] = &v21;
  block[6] = &v27;
  dispatch_sync(renderContextQ, block);
LABEL_24:
  uint64_t v12 = 0;
LABEL_25:

  if (v33)
  {
    if (![(id)objc_opt_class() conformsToProtocol:&unk_1EE623578]) {
      objc_exception_throw(v33);
    }
    [(AVVideoCompositing *)self->_clientCustomCompositor customVideoCompositor:self->_clientCustomCompositor wouldHaveTriggeredException:v33];
    uint64_t v34 = *MEMORY[0x1E4F1D138];
    v35[0] = [v33 reason];
    uint64_t v12 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11841, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1]);
  }
  if (a3 && v12) {
    *a3 = v12;
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v12 == 0;
}

void *__86__AVCustomVideoCompositorSession_commitCustomVideoCompositorPropertiesAndReturnError___block_invoke(void *result)
{
  *(void *)(*(void *)(result[5] + 8) + 40) = *(void *)(result[4] + 24);
  *(void *)(result[4] + 24) = *(void *)(*(void *)(result[6] + 8) + 40);
  *(void *)(*(void *)(result[6] + 8) + 40) = 0;
  return result;
}

- (void)detachVideoComposition
{
  [(AVCustomVideoCompositorSession *)self _cleanupFigCallbacks];
  videoCompositionQ = self->_videoCompositionQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVCustomVideoCompositorSession_detachVideoComposition__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(videoCompositionQ, block);
}

void __56__AVCustomVideoCompositorSession_detachVideoComposition__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = 0;
}

- (void)_willDeallocOrFinalize
{
  [(AVCustomVideoCompositorSession *)self _cleanupFigCallbacks];
  renderContextQ = self->_renderContextQ;
  if (renderContextQ) {
    dispatch_release(renderContextQ);
  }
  clientErrorQ = self->_clientErrorQ;
  if (clientErrorQ) {
    dispatch_release(clientErrorQ);
  }
  clientCustomCompositorQ = self->_clientCustomCompositorQ;
  if (clientCustomCompositorQ) {
    dispatch_release(clientCustomCompositorQ);
  }
  videoCompositionQ = self->_videoCompositionQ;
  if (videoCompositionQ) {
    dispatch_release(videoCompositionQ);
  }
  finishedRequestQ = self->_finishedRequestQ;
  if (finishedRequestQ) {
    dispatch_release(finishedRequestQ);
  }
  figCustomCompositor = self->_figCustomCompositor;
  if (figCustomCompositor)
  {
    CFRelease(figCustomCompositor);
  }
}

- (void)dealloc
{
  [(AVCustomVideoCompositorSession *)self _willDeallocOrFinalize];

  v3.receiver = self;
  v3.super_class = (Class)AVCustomVideoCompositorSession;
  [(AVCustomVideoCompositorSession *)&v3 dealloc];
}

- (void)setVideoComposition:(id)a3
{
  videoCompositionQ = self->_videoCompositionQ;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__AVCustomVideoCompositorSession_setVideoComposition___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(videoCompositionQ, v4);
}

uint64_t __54__AVCustomVideoCompositorSession_setVideoComposition___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 40) + 56);
  if (*(void **)(result + 32) != v1)
  {
    uint64_t v2 = result;

    result = [*(id *)(v2 + 32) copy];
    *(void *)(*(void *)(v2 + 40) + 56) = result;
    *(unsigned char *)(*(void *)(v2 + 40) + 64) = 1;
  }
  return result;
}

- (OpaqueFigVideoCompositor)_copyFigVideoCompositor
{
  result = self->_figCustomCompositor;
  if (result) {
    return (OpaqueFigVideoCompositor *)CFRetain(result);
  }
  return result;
}

- (id)getAndClearClientError
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__43;
  uint64_t v10 = __Block_byref_object_dispose__43;
  uint64_t v11 = 0;
  clientErrorQ = self->_clientErrorQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVCustomVideoCompositorSession_getAndClearClientError__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(clientErrorQ, v5);
  objc_super v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __56__AVCustomVideoCompositorSession_getAndClearClientError__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(id *)(*(void *)(a1 + 32) + 96);

  *(void *)(*(void *)(a1 + 32) + 96) = 0;
}

- (void)compositionFrame:(OpaqueFigVideoCompositorFrame *)a3 didFinishWithComposedPixelBuffer:(__CVBuffer *)a4
{
  CFRetain(a4);
  finishedRequestQ = self->_finishedRequestQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__AVCustomVideoCompositorSession_compositionFrame_didFinishWithComposedPixelBuffer___block_invoke;
  block[3] = &unk_1E57B36D0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(finishedRequestQ, block);
}

void __84__AVCustomVideoCompositorSession_compositionFrame_didFinishWithComposedPixelBuffer___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void *)(a1[4] + 8);
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, void, uint64_t))(v6 + 40);
  if (v7) {
    v7(v3, v2, 0, v4);
  }
  uint64_t v8 = (const void *)a1[6];
  CFRelease(v8);
}

- (void)compositionFrame:(OpaqueFigVideoCompositorFrame *)a3 didFinishWithError:(id)a4
{
  clientErrorQ = self->_clientErrorQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__AVCustomVideoCompositorSession_compositionFrame_didFinishWithError___block_invoke;
  block[3] = &unk_1E57B2098;
  block[4] = self;
  void block[5] = a4;
  dispatch_sync(clientErrorQ, block);
  finishedRequestQ = self->_finishedRequestQ;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__AVCustomVideoCompositorSession_compositionFrame_didFinishWithError___block_invoke_2;
  v8[3] = &unk_1E57B2228;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(finishedRequestQ, v8);
}

id *__70__AVCustomVideoCompositorSession_compositionFrame_didFinishWithError___block_invoke(id *result)
{
  if (!*((void *)result[4] + 12))
  {
    v1 = result;
    result = (id *)result[5];
    *((void *)v1[4] + 12) = result;
  }
  return result;
}

uint64_t __70__AVCustomVideoCompositorSession_compositionFrame_didFinishWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v7 + 40);
  if (v8)
  {
    return v8(v2, v1, 4294951116, 0);
  }
  return result;
}

- (void)compositionFrameDidCancel:(OpaqueFigVideoCompositorFrame *)a3
{
  finishedRequestQ = self->_finishedRequestQ;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__AVCustomVideoCompositorSession_compositionFrameDidCancel___block_invoke;
  v4[3] = &unk_1E57B2228;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(finishedRequestQ, v4);
}

uint64_t __60__AVCustomVideoCompositorSession_compositionFrameDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v7 + 40);
  if (v8)
  {
    return v8(v2, v1, 4294954788, 0);
  }
  return result;
}

- (BOOL)supportsWideColorSourceFrames
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__43;
  uint64_t v11 = __Block_byref_object_dispose__43;
  uint64_t v12 = 0;
  if ([(AVCustomVideoCompositorSession *)self supportsHDRSourceFrames]) {
    goto LABEL_3;
  }
  videoCompositionQ = self->_videoCompositionQ;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__AVCustomVideoCompositorSession_supportsWideColorSourceFrames__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(videoCompositionQ, v6);
  if (+[AVCustomVideoCompositorSession _colorPropertiesAreSetInVideoComposition:v8[5]])
  {
LABEL_3:
    char v4 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    char v4 = [(AVVideoCompositing *)self->_clientCustomCompositor supportsWideColorSourceFrames];
  }
  else
  {
    char v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __63__AVCustomVideoCompositorSession_supportsWideColorSourceFrames__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 56);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)supportsHDRSourceFrames
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  clientCustomCompositor = self->_clientCustomCompositor;
  return [(AVVideoCompositing *)clientCustomCompositor supportsHDRSourceFrames];
}

- (int)_compositionFrame:(OpaqueFigVideoCompositorFrame *)a3 atTime:(id *)a4 requiresRenderUsingSources:(id)a5 requiresSampleBuffersUsingSources:(id)a6 withInstruction:(void *)a7
{
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3052000000;
  v38 = __Block_byref_object_copy__43;
  v39 = __Block_byref_object_dispose__43;
  uint64_t v40 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3052000000;
  v34[3] = __Block_byref_object_copy__43;
  v34[4] = __Block_byref_object_dispose__43;
  v34[5] = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  videoCompositionQ = self->_videoCompositionQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke;
  block[3] = &unk_1E57B74A8;
  block[4] = self;
  void block[5] = &v35;
  void block[7] = v32;
  block[8] = a7;
  void block[6] = v34;
  dispatch_sync(videoCompositionQ, block);
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  uint64_t v28 = __Block_byref_object_copy__43;
  uint64_t v29 = __Block_byref_object_dispose__43;
  uint64_t v30 = 0;
  renderContextQ = self->_renderContextQ;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_2;
  v24[3] = &unk_1E57B3BE0;
  v24[4] = self;
  v24[5] = v32;
  v24[6] = v34;
  v24[7] = &v25;
  dispatch_sync(renderContextQ, v24);
  if (v26[5])
  {
    uint64_t v14 = [AVAsynchronousVideoCompositionRequest alloc];
    uint64_t v15 = v26[5];
    uint64_t v16 = v36[5];
    long long v22 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    id v17 = [(AVAsynchronousVideoCompositionRequest *)v14 initUsingSession:self withRenderContext:v15 compositionFrame:a3 atTime:&v22 usingSources:a5 instruction:v16 withSampleBuffers:a6];
    clientCustomCompositorQ = self->_clientCustomCompositorQ;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_4;
    v21[3] = &unk_1E57B2098;
    v21[4] = self;
    v21[5] = v17;
    dispatch_async(clientCustomCompositorQ, v21);
    int v19 = 0;
  }
  else
  {
    int v19 = -12504;
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v35, 8);
  return v19;
}

id __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = (id)[*(id *)(a1[4] + 56) instructionForFigInstruction:a1[8]];
  id result = *(id *)(a1[4] + 56);
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(unsigned char *)(a1[4] + 64);
  *(unsigned char *)(a1[4] + 64) = 0;
  return result;
}

id __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_2(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 112);
  if (!v2 || *(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v3 = -[AVVideoCompositionRenderContext initWithFigVideoCompositor:clientRequiredPixelBufferAttributes:videoComposition:pixelBufferPool:]([AVVideoCompositionRenderContext alloc], "initWithFigVideoCompositor:clientRequiredPixelBufferAttributes:videoComposition:pixelBufferPool:", *(void *)(a1[4] + 8), *(void *)(a1[4] + 24), *(void *)(*(void *)(a1[6] + 8) + 40), [*(id *)(a1[4] + 112) pixelBufferPool]);

    *(void *)(a1[4] + 112) = v3;
    uint64_t v4 = a1[4];
    uint64_t v5 = *(NSObject **)(v4 + 72);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_3;
    v7[3] = &unk_1E57B2098;
    v7[4] = v4;
    v7[5] = v3;
    dispatch_async(v5, v7);
    uint64_t v2 = *(void **)(a1[4] + 112);
  }
  id result = v2;
  *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  return result;
}

uint64_t __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) renderContextChanged:*(void *)(a1 + 40)];
}

void __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x199715AE0]();
  [*(id *)(*(void *)(a1 + 32) + 80) startVideoCompositionRequest:*(void *)(a1 + 40)];
}

- (int)_customCompositorShouldAnticipateRenderingFromTime:(id *)a3 toTime:(id *)a4 andThenFromTime:(id *)a5 toTime:(id *)a6
{
  clientCustomCompositorQ = self->_clientCustomCompositorQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __167__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldAnticipateRenderingFromTime_toTime_andThenFromTime_toTime___block_invoke;
  block[3] = &unk_1E57B74D0;
  block[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a6;
  dispatch_sync(clientCustomCompositorQ, block);
  return 0;
}

void __167__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldAnticipateRenderingFromTime_toTime_andThenFromTime_toTime___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [AVVideoCompositionRenderHint alloc];
    long long v10 = *(_OWORD *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    long long v8 = *(_OWORD *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 80);
    long long v6 = *(_OWORD *)(a1 + 88);
    uint64_t v7 = *(void *)(a1 + 104);
    long long v4 = *(_OWORD *)(a1 + 112);
    uint64_t v5 = *(void *)(a1 + 128);
    uint64_t v3 = [(AVVideoCompositionRenderHint *)v2 initWithStartCompositionTime:&v10 endCompositionTime:&v8 subsequentStartCompositionTime:&v6 subsequentEndCompositionTime:&v4];
    [*(id *)(*(void *)(a1 + 32) + 80) anticipateRenderingUsingHint:v3];
  }
}

- (int)_customCompositorShouldPrerollForRenderingFromTime:(id *)a3 toTime:(id *)a4 andThenFromTime:(id *)a5 toTime:(id *)a6 requestID:(int64_t)a7
{
  clientCustomCompositorQ = self->_clientCustomCompositorQ;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __177__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldPrerollForRenderingFromTime_toTime_andThenFromTime_toTime_requestID___block_invoke;
  v9[3] = &unk_1E57B74F8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a6;
  v9[4] = self;
  v9[5] = a7;
  dispatch_sync(clientCustomCompositorQ, v9);
  return 0;
}

uint64_t __177__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldPrerollForRenderingFromTime_toTime_andThenFromTime_toTime_requestID___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [AVVideoCompositionRenderHint alloc];
    long long v18 = *(_OWORD *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 64);
    long long v16 = *(_OWORD *)(a1 + 72);
    uint64_t v17 = *(void *)(a1 + 88);
    long long v14 = *(_OWORD *)(a1 + 96);
    uint64_t v15 = *(void *)(a1 + 112);
    long long v12 = *(_OWORD *)(a1 + 120);
    uint64_t v13 = *(void *)(a1 + 136);
    uint64_t v3 = [(AVVideoCompositionRenderHint *)v2 initWithStartCompositionTime:&v18 endCompositionTime:&v16 subsequentStartCompositionTime:&v14 subsequentEndCompositionTime:&v12];
    [*(id *)(*(void *)(a1 + 32) + 80) prerollForRenderingUsingHint:v3];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(unsigned int *)(a1 + 40);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v9 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v8 = v9;
  if (v9) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *(uint64_t (**)(uint64_t, uint64_t, void))(v10 + 72);
  if (v11) {
    return v11(v4, v5, 0);
  }
  return result;
}

- (int)_customCompositorShouldCancelPendingFrames
{
  clientCustomCompositorQ = self->_clientCustomCompositorQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldCancelPendingFrames__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(clientCustomCompositorQ, block);
  return 0;
}

uint64_t __128__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldCancelPendingFrames__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
    return [v3 cancelAllPendingVideoCompositionRequests];
  }
  return result;
}

- (void)_customCompositorFigPropertyDidChange
{
  renderContextQ = self->_renderContextQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorFigPropertyDidChange__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(renderContextQ, block);
}

void __123__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorFigPropertyDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 112);
  if (v3)
  {
    if (([v3 hasEqualPropertiesToFigVideoCompositor:*(void *)(v2 + 8)] & 1) == 0)
    {

      *(void *)(*(void *)(a1 + 32) + 112) = 0;
    }
  }
}

- (int)_setupFigCallbacks
{
  CFRetain(self->_weakSelf);
  objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_weakSelf, _customCompositorPropertyChangedNotificationReceived, *MEMORY[0x1E4F34B68], self->_figCustomCompositor, 0);
  uint64_t v3 = objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "registerCallbackContextObject:", self->_weakSelf);
  self->_callbackContextToken = v3;
  figCustomCompositor = self->_figCustomCompositor;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigVideoCompositor *, void *, void *))(v6 + 48);
  if (!v7) {
    return -12782;
  }
  int result = v7(figCustomCompositor, &_setupFigCallbacks_callbacks, v3);
  if (!result) {
    self->_hasRegisteredFigCustomCompositorCallbacks = 1;
  }
  return result;
}

- (void)_cleanupFigCallbacks
{
  weakSelf = self->_weakSelf;
  if (weakSelf)
  {
    CFRelease(weakSelf);
    objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakSelf, _customCompositorPropertyChangedNotificationReceived, *MEMORY[0x1E4F34B68], self->_figCustomCompositor);

    self->_weakSelf = 0;
  }
  if (self->_callbackContextToken)
  {
    objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "unregisterCallbackContextForToken:", self->_callbackContextToken);
    self->_callbackContextToken = 0;
  }
  if (self->_hasRegisteredFigCustomCompositorCallbacks)
  {
    figCustomCompositor = self->_figCustomCompositor;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(OpaqueFigVideoCompositor *, void, void))(v6 + 48);
    if (v7) {
      v7(figCustomCompositor, 0, 0);
    }
    self->_hasRegisteredFigCustomCompositorCallbacks = 0;
  }
}

@end