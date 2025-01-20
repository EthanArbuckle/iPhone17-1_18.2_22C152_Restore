@interface AVAsynchronousVideoCompositionRequestInternal
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)compositionTime;
- (AVVideoCompositionInstruction)instruction;
- (AVVideoCompositionRenderContext)renderContext;
- (AVWeakReference)session;
- (BOOL)isFinished;
- (NSArray)sourceSampleBufferTrackIDsInClientOrder;
- (NSArray)sourceTrackIDsInClientOrder;
- (NSDictionary)sourceSampleBufferTimedSamplesByTrackID;
- (NSDictionary)sourceVideoFrameTimedSamplesByTrackID;
- (OpaqueFigVideoCompositorFrame)compositionFrame;
- (void)dealloc;
- (void)setCompositionFrame:(OpaqueFigVideoCompositorFrame *)a3;
- (void)setCompositionTime:(id *)a3;
- (void)setInstruction:(id)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setRenderContext:(id)a3;
- (void)setSession:(id)a3;
- (void)setSourceSampleBufferTimedSamplesByTrackID:(id)a3;
- (void)setSourceSampleBufferTrackIDsInClientOrder:(id)a3;
- (void)setSourceTrackIDsInClientOrder:(id)a3;
- (void)setSourceVideoFrameTimedSamplesByTrackID:(id)a3;
@end

@implementation AVAsynchronousVideoCompositionRequestInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAsynchronousVideoCompositionRequestInternal;
  [(AVAsynchronousVideoCompositionRequestInternal *)&v3 dealloc];
}

- (AVWeakReference)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (AVVideoCompositionRenderContext)renderContext
{
  return self->_renderContext;
}

- (void)setRenderContext:(id)a3
{
}

- (OpaqueFigVideoCompositorFrame)compositionFrame
{
  return self->_compositionFrame;
}

- (void)setCompositionFrame:(OpaqueFigVideoCompositorFrame *)a3
{
  self->_compositionFrame = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)compositionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setCompositionTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_compositionTime.epoch = a3->var3;
  *(_OWORD *)&self->_compositionTime.value = v3;
}

- (NSDictionary)sourceVideoFrameTimedSamplesByTrackID
{
  return self->_sourceVideoFrameTimedSamplesByTrackID;
}

- (void)setSourceVideoFrameTimedSamplesByTrackID:(id)a3
{
}

- (NSArray)sourceTrackIDsInClientOrder
{
  return self->_sourceTrackIDsInClientOrder;
}

- (void)setSourceTrackIDsInClientOrder:(id)a3
{
}

- (NSDictionary)sourceSampleBufferTimedSamplesByTrackID
{
  return self->_sourceSampleBufferTimedSamplesByTrackID;
}

- (void)setSourceSampleBufferTimedSamplesByTrackID:(id)a3
{
}

- (NSArray)sourceSampleBufferTrackIDsInClientOrder
{
  return self->_sourceSampleBufferTrackIDsInClientOrder;
}

- (void)setSourceSampleBufferTrackIDsInClientOrder:(id)a3
{
}

- (AVVideoCompositionInstruction)instruction
{
  return self->_instruction;
}

- (void)setInstruction:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

@end