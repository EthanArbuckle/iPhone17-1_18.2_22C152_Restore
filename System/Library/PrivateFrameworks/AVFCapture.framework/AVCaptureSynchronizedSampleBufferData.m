@interface AVCaptureSynchronizedSampleBufferData
+ (void)initialize;
- (AVCaptureOutputDataDroppedReason)droppedReason;
- (BOOL)hasCorrespondingDepthData;
- (BOOL)hasCorrespondingVisionData;
- (BOOL)sampleBufferWasDropped;
- (CMSampleBufferRef)sampleBuffer;
- (id)_initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 sampleBufferWasDropped:(BOOL)a4;
- (int)constituentDeviceCaptureID;
- (void)dealloc;
@end

@implementation AVCaptureSynchronizedSampleBufferData

+ (void)initialize
{
}

- (id)_initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 sampleBufferWasDropped:(BOOL)a4
{
  if (!a3)
  {
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
    return 0;
  }
  BOOL v5 = a4;
  memset(&v18, 0, sizeof(v18));
  CMSampleBufferGetPresentationTimeStamp(&v18, a3);
  v17.receiver = self;
  v17.super_class = (Class)AVCaptureSynchronizedSampleBufferData;
  CMTime v16 = v18;
  v7 = [(AVCaptureSynchronizedData *)&v17 _initWithTimestamp:&v16];
  if (!v7) {
    return v7;
  }
  v8 = objc_alloc_init(AVCaptureSynchronizedSampleBufferDataInternal);
  v7[2] = v8;
  if (!v8)
  {

    return 0;
  }
  *(void *)(v7[2] + 8) = CFRetain(a3);
  *(unsigned char *)(v7[2] + 16) = v5;
  if (v5) {
    *(void *)(v7[2] + 24) = +[AVCaptureOutput dataDroppedReasonFromSampleBuffer:a3];
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F52820];
  *(unsigned char *)(v7[2] + 32) = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52820], 0), "BOOLValue");
  CMRemoveAttachment(a3, v9);
  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F52828];
  *(unsigned char *)(v7[2] + 33) = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52828], 0), "BOOLValue");
  CMRemoveAttachment(a3, v10);
  CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F52420];
  v12 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52420], 0);
  if (v12) {
    int v13 = [v12 intValue];
  }
  else {
    int v13 = -1;
  }
  *(_DWORD *)(v7[2] + 36) = v13;
  CMRemoveAttachment(a3, v11);
  return v7;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    sampleBuffer = internal->sampleBuffer;
    if (sampleBuffer)
    {
      CFRelease(sampleBuffer);
      internal = self->_internal;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureSynchronizedSampleBufferData;
  [(AVCaptureSynchronizedData *)&v5 dealloc];
}

- (CMSampleBufferRef)sampleBuffer
{
  return self->_internal->sampleBuffer;
}

- (BOOL)sampleBufferWasDropped
{
  return self->_internal->sampleBufferWasDropped;
}

- (AVCaptureOutputDataDroppedReason)droppedReason
{
  return self->_internal->droppedReason;
}

- (BOOL)hasCorrespondingDepthData
{
  return self->_internal->hasCorrespondingDepthData;
}

- (BOOL)hasCorrespondingVisionData
{
  return self->_internal->hasCorrespondingVisionData;
}

- (int)constituentDeviceCaptureID
{
  return self->_internal->constituentDeviceCaptureID;
}

@end