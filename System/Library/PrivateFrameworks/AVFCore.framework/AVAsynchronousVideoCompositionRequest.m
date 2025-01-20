@interface AVAsynchronousVideoCompositionRequest
- (AVTimedMetadataGroup)sourceTimedMetadataByTrackID:(CMPersistentTrackID)trackID;
- (AVVideoCompositionRenderContext)renderContext;
- (CMSampleBufferRef)sourceSampleBufferByTrackID:(CMPersistentTrackID)trackID;
- (CMTime)compositionTime;
- (CVPixelBufferRef)sourceFrameByTrackID:(CMPersistentTrackID)trackID;
- (NSArray)sourceSampleDataTrackIDs;
- (NSArray)sourceTrackIDs;
- (OpaqueFigVideoCompositorFrame)compositionFrame;
- (__CVBuffer)sourceFrameByTrackID:(int)a3 atIndexInWindow:(int64_t)a4 presentationTimeStamp:(id *)a5;
- (id)initUsingSession:(id)a3 withRenderContext:(id)a4 compositionFrame:(OpaqueFigVideoCompositorFrame *)a5 atTime:(id *)a6 usingSources:(id)a7 instruction:(id)a8 withSampleBuffers:(id)a9;
- (id)sourceTimedMetadataByTrackID:(int)a3 atIndexInWindow:(int64_t)a4 presentationTimeStamp:(id *)a5;
- (id)videoCompositionInstruction;
- (int64_t)numberOfSourceFramesInWindowForTrackID:(int)a3;
- (int64_t)numberOfSourceSampleBuffersInWindowForTrackID:(int)a3;
- (opaqueCMSampleBuffer)sourceSampleBufferByTrackID:(int)a3 atIndexInWindow:(int64_t)a4 presentationTimeStamp:(id *)a5;
- (void)_willDeallocOrFinalize;
- (void)dealloc;
- (void)finishCancelledRequest;
- (void)finishWithComposedVideoFrame:(CVPixelBufferRef)composedVideoFrame;
- (void)finishWithError:(NSError *)error;
@end

@implementation AVAsynchronousVideoCompositionRequest

- (void)_willDeallocOrFinalize
{
  internal = self->_internal;
  if (internal)
  {
    if (![(AVAsynchronousVideoCompositionRequestInternal *)internal isFinished])
    {
      NSLog(&cfstr_UnfinishedAvas.isa);
      id v4 = [(AVWeakReference *)[(AVAsynchronousVideoCompositionRequestInternal *)self->_internal session] referencedObject];
      v5 = [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal compositionFrame];
      objc_msgSend(v4, "compositionFrame:didFinishWithError:", v5, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"AVFoundationErrorDomain", -11841, 0));
    }
    v6 = self->_internal;
    if (v6)
    {
      CFRelease(v6);
    }
  }
}

- (void)dealloc
{
  [(AVAsynchronousVideoCompositionRequest *)self _willDeallocOrFinalize];

  v3.receiver = self;
  v3.super_class = (Class)AVAsynchronousVideoCompositionRequest;
  [(AVAsynchronousVideoCompositionRequest *)&v3 dealloc];
}

- (AVVideoCompositionRenderContext)renderContext
{
  return [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal renderContext];
}

- (CMTime)compositionTime
{
  result = (CMTime *)self->_internal;
  if (result) {
    return (CMTime *)[(CMTime *)result compositionTime];
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (NSArray)sourceTrackIDs
{
  return [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal sourceTrackIDsInClientOrder];
}

- (NSArray)sourceSampleDataTrackIDs
{
  return [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal sourceSampleBufferTrackIDsInClientOrder];
}

- (id)videoCompositionInstruction
{
  return [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal instruction];
}

- (CVPixelBufferRef)sourceFrameByTrackID:(CMPersistentTrackID)trackID
{
  uint64_t v3 = *(void *)&trackID;
  v5 = [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal sourceVideoFrameTimedSamplesByTrackID];
  CVPixelBufferRef result = -[NSDictionary objectForKey:](v5, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithInt:v3]);
  if (result)
  {
    internal = self->_internal;
    if (internal) {
      [(AVAsynchronousVideoCompositionRequestInternal *)internal compositionTime];
    }
    FigVCPGetTimedSampleAtTimeFromOrderedArray();
    FigVCPTimedSampleGetPixelBuffer();
    return 0;
  }
  return result;
}

- (CMSampleBufferRef)sourceSampleBufferByTrackID:(CMPersistentTrackID)trackID
{
  uint64_t v3 = *(void *)&trackID;
  v5 = [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal sourceSampleBufferTimedSamplesByTrackID];
  CMSampleBufferRef result = -[NSDictionary objectForKey:](v5, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithInt:v3]);
  if (result)
  {
    internal = self->_internal;
    if (internal) {
      [(AVAsynchronousVideoCompositionRequestInternal *)internal compositionTime];
    }
    FigVCPGetTimedSampleAtTimeFromOrderedArray();
    FigVCPTimedSampleGetSampleBuffer();
    return 0;
  }
  return result;
}

- (AVTimedMetadataGroup)sourceTimedMetadataByTrackID:(CMPersistentTrackID)trackID
{
  CMSampleBufferRef result = [(AVAsynchronousVideoCompositionRequest *)self sourceSampleBufferByTrackID:*(void *)&trackID];
  if (result)
  {
    id v4 = [[AVTimedMetadataGroup alloc] initWithSampleBuffer:result];
    return v4;
  }
  return result;
}

- (void)finishWithComposedVideoFrame:(CVPixelBufferRef)composedVideoFrame
{
  if (!composedVideoFrame)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"finishWithComposedVideoFrame requires a CVPixelBuffer", v3, v4, v5, v6, v7, v13), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if ([(AVAsynchronousVideoCompositionRequestInternal *)self->_internal isFinished])
  {
    NSLog(&cfstr_IgnoredAvasync.isa);
  }
  else
  {
    [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal setIsFinished:1];
    id v10 = [(AVWeakReference *)[(AVAsynchronousVideoCompositionRequestInternal *)self->_internal session] referencedObject];
    v11 = [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal compositionFrame];
    [v10 compositionFrame:v11 didFinishWithComposedPixelBuffer:composedVideoFrame];
  }
}

- (void)finishWithError:(NSError *)error
{
  if ([(AVAsynchronousVideoCompositionRequestInternal *)self->_internal isFinished])
  {
    NSLog(&cfstr_IgnoredAvasync_0.isa);
  }
  else
  {
    [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal setIsFinished:1];
    id v5 = [(AVWeakReference *)[(AVAsynchronousVideoCompositionRequestInternal *)self->_internal session] referencedObject];
    uint64_t v6 = [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal compositionFrame];
    [v5 compositionFrame:v6 didFinishWithError:error];
  }
}

- (void)finishCancelledRequest
{
  if ([(AVAsynchronousVideoCompositionRequestInternal *)self->_internal isFinished])
  {
    NSLog(&cfstr_IgnoredAvasync_1.isa);
  }
  else
  {
    [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal setIsFinished:1];
    id v3 = [(AVWeakReference *)[(AVAsynchronousVideoCompositionRequestInternal *)self->_internal session] referencedObject];
    uint64_t v4 = [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal compositionFrame];
    [v3 compositionFrameDidCancel:v4];
  }
}

- (int64_t)numberOfSourceFramesInWindowForTrackID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal sourceVideoFrameTimedSamplesByTrackID];
  id v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithInt:v3]);
  return [v5 count];
}

- (int64_t)numberOfSourceSampleBuffersInWindowForTrackID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal sourceSampleBufferTimedSamplesByTrackID];
  id v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithInt:v3]);
  return [v5 count];
}

- (__CVBuffer)sourceFrameByTrackID:(int)a3 atIndexInWindow:(int64_t)a4 presentationTimeStamp:(id *)a5
{
  if ((a4 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = *(void *)&a3;
    if (a5) {
      *a5 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
    }
    v8 = [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal sourceVideoFrameTimedSamplesByTrackID];
    id v9 = -[NSDictionary objectForKey:](v8, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithInt:v7]);
    if (v9)
    {
      id v10 = v9;
      if ([v9 count] > (unint64_t)a4)
      {
        [v10 objectAtIndexedSubscript:a4];
        int PixelBuffer = FigVCPTimedSampleGetPixelBuffer();
        if (a5)
        {
          if (!PixelBuffer)
          {
            FigVCPTimedSampleGetPTS();
            *(_OWORD *)&a5->var0 = v13;
            a5->var3 = v14;
          }
        }
      }
    }
  }
  return 0;
}

- (opaqueCMSampleBuffer)sourceSampleBufferByTrackID:(int)a3 atIndexInWindow:(int64_t)a4 presentationTimeStamp:(id *)a5
{
  if ((a4 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = *(void *)&a3;
    if (a5) {
      *a5 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
    }
    v8 = [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal sourceSampleBufferTimedSamplesByTrackID];
    id v9 = -[NSDictionary objectForKey:](v8, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithInt:v7]);
    if (v9)
    {
      id v10 = v9;
      if ([v9 count] > (unint64_t)a4)
      {
        [v10 objectAtIndexedSubscript:a4];
        int SampleBuffer = FigVCPTimedSampleGetSampleBuffer();
        if (a5)
        {
          if (!SampleBuffer)
          {
            FigVCPTimedSampleGetPTS();
            *(_OWORD *)&a5->var0 = v13;
            a5->var3 = v14;
          }
        }
      }
    }
  }
  return 0;
}

- (id)sourceTimedMetadataByTrackID:(int)a3 atIndexInWindow:(int64_t)a4 presentationTimeStamp:(id *)a5
{
  id result = [(AVAsynchronousVideoCompositionRequest *)self sourceSampleBufferByTrackID:*(void *)&a3 atIndexInWindow:a4 presentationTimeStamp:a5];
  if (result)
  {
    uint64_t v6 = [[AVTimedMetadataGroup alloc] initWithSampleBuffer:result];
    return v6;
  }
  return result;
}

- (id)initUsingSession:(id)a3 withRenderContext:(id)a4 compositionFrame:(OpaqueFigVideoCompositorFrame *)a5 atTime:(id *)a6 usingSources:(id)a7 instruction:(id)a8 withSampleBuffers:(id)a9
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)AVAsynchronousVideoCompositionRequest;
  v15 = [(AVAsynchronousVideoCompositionRequest *)&v43 init];
  if (v15)
  {
    v16 = objc_alloc_init(AVAsynchronousVideoCompositionRequestInternal);
    v15->_internal = v16;
    CFRetain(v16);
    [(AVAsynchronousVideoCompositionRequestInternal *)v15->_internal setSession:[[AVWeakReference alloc] initWithReferencedObject:a3]];
    [(AVAsynchronousVideoCompositionRequestInternal *)v15->_internal setRenderContext:a4];
    [(AVAsynchronousVideoCompositionRequestInternal *)v15->_internal setCompositionFrame:a5];
    internal = v15->_internal;
    long long v41 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    [(AVAsynchronousVideoCompositionRequestInternal *)internal setCompositionTime:&v41];
    [(AVAsynchronousVideoCompositionRequestInternal *)v15->_internal setSourceVideoFrameTimedSamplesByTrackID:a7];
    [(AVAsynchronousVideoCompositionRequestInternal *)v15->_internal setSourceSampleBufferTimedSamplesByTrackID:a9];
    [(AVAsynchronousVideoCompositionRequestInternal *)v15->_internal setInstruction:a8];
    if ([a8 requiredSourceTrackIDs])
    {
      v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a8, "requiredSourceTrackIDs"), "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v19 = (void *)[a8 requiredSourceTrackIDs];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            if ([a7 objectForKey:v24]) {
              [v18 addObject:v24];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v21);
      }
    }
    else
    {
      v18 = (void *)[a7 allKeys];
    }
    [(AVAsynchronousVideoCompositionRequestInternal *)v15->_internal setSourceTrackIDsInClientOrder:v18];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [a8 requiredSourceSampleDataTrackIDs])
    {
      v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a8, "requiredSourceSampleDataTrackIDs"), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v26 = objc_msgSend(a8, "requiredSourceSampleDataTrackIDs", 0);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v44 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v34 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v33 + 1) + 8 * j);
            if ([a9 objectForKey:v31]) {
              [v25 addObject:v31];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v44 count:16];
        }
        while (v28);
      }
    }
    else
    {
      v25 = (void *)[a9 allKeys];
    }
    [(AVAsynchronousVideoCompositionRequestInternal *)v15->_internal setSourceSampleBufferTrackIDsInClientOrder:v25];
  }
  return v15;
}

- (OpaqueFigVideoCompositorFrame)compositionFrame
{
  return [(AVAsynchronousVideoCompositionRequestInternal *)self->_internal compositionFrame];
}

@end