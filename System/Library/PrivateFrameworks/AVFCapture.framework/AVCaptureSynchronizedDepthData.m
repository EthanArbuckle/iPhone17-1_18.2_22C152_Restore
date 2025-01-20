@interface AVCaptureSynchronizedDepthData
+ (void)initialize;
- (AVCaptureOutputDataDroppedReason)droppedReason;
- (AVDepthData)depthData;
- (BOOL)depthDataWasDropped;
- (id)_initWithDepthData:(id)a3 timestamp:(id *)a4 depthDataWasDropped:(BOOL)a5 droppedReason:(int64_t)a6;
- (id)debugDescription;
- (id)description;
- (void)dealloc;
@end

@implementation AVCaptureSynchronizedDepthData

+ (void)initialize
{
}

- (id)_initWithDepthData:(id)a3 timestamp:(id *)a4 depthDataWasDropped:(BOOL)a5 droppedReason:(int64_t)a6
{
  if (!a3)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v12);
    }
    NSLog(&cfstr_SuppressingExc.isa, v12);
    return 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)AVCaptureSynchronizedDepthData;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  v10 = [(AVCaptureSynchronizedData *)&v15 _initWithTimestamp:&v14];
  if (v10)
  {
    v11 = objc_alloc_init(AVCaptureSynchronizedDepthDataInternal);
    v10[2] = v11;
    if (v11)
    {
      *(void *)(v10[2] + 8) = a3;
      *(unsigned char *)(v10[2] + 16) = a5;
      *(void *)(v10[2] + 24) = a6;
      return v10;
    }

    return 0;
  }
  return v10;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureSynchronizedDepthData;
  [(AVCaptureSynchronizedData *)&v4 dealloc];
}

- (id)debugDescription
{
  if ([(AVCaptureSynchronizedDepthData *)self depthDataWasDropped]) {
    v3 = (__CFString *)[NSString stringWithFormat:@", dropped reason (%d)", -[AVCaptureSynchronizedDepthData droppedReason](self, "droppedReason")];
  }
  else {
    v3 = &stru_1EF4D21D0;
  }
  return (id)[NSString stringWithFormat:@"%@%@", -[AVDepthData debugDescription](-[AVCaptureSynchronizedDepthData depthData](self, "depthData"), "debugDescription"), v3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureSynchronizedDepthData debugDescription](self, "debugDescription")];
}

- (AVDepthData)depthData
{
  return self->_internal->depthData;
}

- (BOOL)depthDataWasDropped
{
  return self->_internal->depthDataWasDropped;
}

- (AVCaptureOutputDataDroppedReason)droppedReason
{
  return self->_internal->droppedReason;
}

@end