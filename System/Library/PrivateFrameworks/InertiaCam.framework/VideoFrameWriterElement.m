@interface VideoFrameWriterElement
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime;
- (__CVBuffer)pixelBuffer;
- (int64_t)frameNumber;
- (void)DeallocPixBuffer;
- (void)dealloc;
- (void)setFrameNumber:(int64_t)a3;
- (void)setFrameTime:(id *)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
@end

@implementation VideoFrameWriterElement

- (void)DeallocPixBuffer
{
  if ([(VideoFrameWriterElement *)self pixelBuffer])
  {
    CVPixelBufferRelease([(VideoFrameWriterElement *)self pixelBuffer]);
    [(VideoFrameWriterElement *)self setPixelBuffer:0];
  }
}

- (void)dealloc
{
  [(VideoFrameWriterElement *)self DeallocPixBuffer];
  v3.receiver = self;
  v3.super_class = (Class)VideoFrameWriterElement;
  [(VideoFrameWriterElement *)&v3 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setFrameTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_frameTime.epoch = a3->var3;
  *(_OWORD *)&self->_frameTime.value = v3;
}

- (int64_t)frameNumber
{
  return self->_frameNumber;
}

- (void)setFrameNumber:(int64_t)a3
{
  self->_frameNumber = a3;
}

@end