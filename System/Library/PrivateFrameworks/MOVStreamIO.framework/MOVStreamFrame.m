@interface MOVStreamFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimeStamp;
- (MOVStreamFrame)initWithPixelBuffer:(__CVBuffer *)a3 timeStamp:(double)a4 context:(id)a5;
- (__CVBuffer)pixelBuffer;
- (double)timeStamp;
- (id)context;
- (id)description;
- (void)dealloc;
@end

@implementation MOVStreamFrame

- (MOVStreamFrame)initWithPixelBuffer:(__CVBuffer *)a3 timeStamp:(double)a4 context:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MOVStreamFrame;
  v10 = [(MOVStreamFrame *)&v13 init];
  if (v10)
  {
    CVPixelBufferRetain(a3);
    *((void *)v10 + 1) = a3;
    *((double *)v10 + 2) = a4;
    CMTimeMakeWithSeconds(&v12, a4, 1000000);
    *(CMTime *)(v10 + 32) = v12;
    objc_storeStrong((id *)v10 + 3, a5);
  }

  return (MOVStreamFrame *)v10;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)MOVStreamFrame;
  [(MOVStreamFrame *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Frame %f (%@)", *(void *)&self->_timeStamp, self->_context];
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimeStamp
{
  objc_copyStruct(retstr, &self->_cmTimeStamp, 24, 1, 0);
  return result;
}

- (id)context
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

@end