@interface MADVideoRemoveBackgroundPreviewFrame
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- (MADVideoRemoveBackgroundPreviewFrame)initWithCoder:(id)a3;
- (MADVideoRemoveBackgroundPreviewFrame)initWithPresentationTimeStamp:(id *)a3 surface:(id)a4;
- (__CVBuffer)pixelBuffer;
- (id).cxx_construct;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVideoRemoveBackgroundPreviewFrame

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoRemoveBackgroundPreviewFrame)initWithPresentationTimeStamp:(id *)a3 surface:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADVideoRemoveBackgroundPreviewFrame;
  v8 = [(MADVideoRemoveBackgroundPreviewFrame *)&v12 init];
  v9 = (MADVideoRemoveBackgroundPreviewFrame *)v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a3->var0;
    *((void *)v8 + 5) = a3->var3;
    *(_OWORD *)(v8 + 24) = v10;
    objc_storeStrong((id *)v8 + 1, a4);
  }

  return v9;
}

- (MADVideoRemoveBackgroundPreviewFrame)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVideoRemoveBackgroundPreviewFrame;
  v5 = [(MADVideoRemoveBackgroundPreviewFrame *)&v9 init];
  if (v5)
  {
    v5->_presentationTimeStamp.value = [v4 decodeInt64ForKey:@"PresentationTimeStampValue"];
    v5->_presentationTimeStamp.timescale = [v4 decodeInt32ForKey:@"PresentationTimeStampScale"];
    v5->_presentationTimeStamp.flags = [v4 decodeInt32ForKey:@"PresentationTimeStampFlags"];
    v5->_presentationTimeStamp.epoch = [v4 decodeInt64ForKey:@"PresentationTimeStampEpoch"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Surface"];
    surface = v5->_surface;
    v5->_surface = (IOSurface *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_presentationTimeStamp.value forKey:@"PresentationTimeStampValue"];
  [v4 encodeInt32:self->_presentationTimeStamp.timescale forKey:@"PresentationTimeStampScale"];
  [v4 encodeInt32:self->_presentationTimeStamp.flags forKey:@"PresentationTimeStampFlags"];
  [v4 encodeInt64:self->_presentationTimeStamp.epoch forKey:@"PresentationTimeStampEpoch"];
  [v4 encodeObject:self->_surface forKey:@"Surface"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  uint64_t timescale = self->_presentationTimeStamp.timescale;
  CMTime time = (CMTime)self->_presentationTimeStamp;
  [v3 appendFormat:@"presentationTimeStamp: %lld/%d (%0.3fs), ", time.value, timescale, CMTimeGetSeconds(&time)];
  [v3 appendFormat:@"surface: %@>", self->_surface];
  return v3;
}

- (__CVBuffer)pixelBuffer
{
  p_pixelBuffer = &self->_pixelBuffer;
  result = self->_pixelBuffer.value_;
  if (!result)
  {
    CVReturn v5 = CVPixelBufferCreateWithIOSurface(0, (IOSurfaceRef)self->_surface, 0, &p_pixelBuffer->value_);
    result = self->_pixelBuffer.value_;
    if (!result)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADRemoveBackgroundMatteResult pixelBuffer](v5);
      }
      return p_pixelBuffer->value_;
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void).cxx_destruct
{
  CF<CGColorSpace *>::~CF((const void **)&self->_pixelBuffer.value_);
  objc_storeStrong((id *)&self->_surface, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end