@interface BWDeepFusionInputBuffer
- (BWDeepFusionInputBuffer)initWithBuffer:(__CVBuffer *)a3 type:(unint64_t)a4 captureFrameFlags:(unint64_t)a5 metadata:(id)a6 lscGainMap:(__CVBuffer *)a7 lscGainMapParameters:(id)a8;
- (NSDictionary)lscGainMapParameters;
- (NSDictionary)metadata;
- (__CVBuffer)buffer;
- (__CVBuffer)lscGainMap;
- (unint64_t)captureFrameFlags;
- (unint64_t)type;
- (void)dealloc;
- (void)releasePixelBuffers;
@end

@implementation BWDeepFusionInputBuffer

- (BWDeepFusionInputBuffer)initWithBuffer:(__CVBuffer *)a3 type:(unint64_t)a4 captureFrameFlags:(unint64_t)a5 metadata:(id)a6 lscGainMap:(__CVBuffer *)a7 lscGainMapParameters:(id)a8
{
  v14 = [(BWDeepFusionInputBuffer *)self init];
  if (v14)
  {
    v14->_buffer = CVPixelBufferRetain(a3);
    v14->_type = a4;
    v14->_captureFrameFlags = a5;
    v14->_metadata = (NSDictionary *)a6;
    v14->_lscGainMap = CVPixelBufferRetain(a7);
    v14->_lscGainMapParameters = (NSDictionary *)a8;
  }
  return v14;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_buffer);

  CVPixelBufferRelease(self->_lscGainMap);
  v3.receiver = self;
  v3.super_class = (Class)BWDeepFusionInputBuffer;
  [(BWDeepFusionInputBuffer *)&v3 dealloc];
}

- (void)releasePixelBuffers
{
  buffer = self->_buffer;
  if (buffer)
  {
    CFRelease(buffer);
    self->_buffer = 0;
  }
  lscGainMap = self->_lscGainMap;
  if (lscGainMap)
  {
    CFRelease(lscGainMap);
    self->_lscGainMap = 0;
  }
}

- (__CVBuffer)buffer
{
  return self->_buffer;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)captureFrameFlags
{
  return self->_captureFrameFlags;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (__CVBuffer)lscGainMap
{
  return self->_lscGainMap;
}

- (NSDictionary)lscGainMapParameters
{
  return self->_lscGainMapParameters;
}

@end