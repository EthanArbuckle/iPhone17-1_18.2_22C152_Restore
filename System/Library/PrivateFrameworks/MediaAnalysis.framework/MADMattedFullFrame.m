@interface MADMattedFullFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimestamp;
- (MADMattedFullFrame)initWithPixelBuffer:(__CVBuffer *)a3 presentationTimestamp:(id *)a4 confidence:(double)a5;
- (__CVBuffer)pixelBuffer;
- (double)confidence;
- (void)dealloc;
- (void)setPresentationTimestamp:(id *)a3;
@end

@implementation MADMattedFullFrame

- (MADMattedFullFrame)initWithPixelBuffer:(__CVBuffer *)a3 presentationTimestamp:(id *)a4 confidence:(double)a5
{
  v15.receiver = self;
  v15.super_class = (Class)MADMattedFullFrame;
  v8 = [(MADMattedFullFrame *)&v15 init];
  if (v8)
  {
    *((void *)v8 + 1) = CFRetain(a3);
    long long v9 = *(_OWORD *)&a4->var0;
    *((void *)v8 + 5) = a4->var3;
    *(_OWORD *)(v8 + 24) = v9;
    *((double *)v8 + 2) = a5;
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F24A00];
    CFTypeRef cf = CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24A00], 0);
    if (!cf)
    {
      CGColorSpaceRef v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
      v13 = 0;
      CFTypeRef cf = v11;
      CF<opaqueCMSampleBuffer *>::~CF(&v13);
      CVBufferSetAttachment(a3, v10, cf, kCVAttachmentMode_ShouldPropagate);
    }
    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
  return (MADMattedFullFrame *)v8;
}

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer) {
    CFRelease(pixelBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)MADMattedFullFrame;
  [(MADMattedFullFrame *)&v4 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setPresentationTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_presentationTimestamp.epoch = a3->var3;
  *(_OWORD *)&self->_presentationTimestamp.value = v3;
}

- (double)confidence
{
  return self->_confidence;
}

@end