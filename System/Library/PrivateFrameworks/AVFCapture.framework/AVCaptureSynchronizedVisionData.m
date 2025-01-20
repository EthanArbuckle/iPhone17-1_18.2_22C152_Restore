@interface AVCaptureSynchronizedVisionData
- (BOOL)visionDataWasDropped;
- (__CVBuffer)visionDataPixelBuffer;
- (id)_initWithVisionDataPixelBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 visionDataWasDropped:(BOOL)a5 droppedReason:(int64_t)a6;
- (int64_t)droppedReason;
- (void)dealloc;
@end

@implementation AVCaptureSynchronizedVisionData

- (id)_initWithVisionDataPixelBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 visionDataWasDropped:(BOOL)a5 droppedReason:(int64_t)a6
{
  v13.receiver = self;
  v13.super_class = (Class)AVCaptureSynchronizedVisionData;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  v9 = [(AVCaptureSynchronizedData *)&v13 _initWithTimestamp:&v12];
  if (v9)
  {
    v10 = objc_alloc_init(AVCaptureSynchronizedVisionDataInternal);
    v9[2] = v10;
    if (v10)
    {
      *(void *)(v9[2] + 8) = CVPixelBufferRetain(a3);
      *(unsigned char *)(v9[2] + 16) = a5;
      *(void *)(v9[2] + 24) = a6;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    CVPixelBufferRelease(internal->visionDataPixelBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureSynchronizedVisionData;
  [(AVCaptureSynchronizedData *)&v4 dealloc];
}

- (__CVBuffer)visionDataPixelBuffer
{
  return self->_internal->visionDataPixelBuffer;
}

- (BOOL)visionDataWasDropped
{
  return self->_internal->visionDataWasDropped;
}

- (int64_t)droppedReason
{
  return self->_internal->droppedReason;
}

@end