@interface AVPlayerTaggedBufferOutput
+ (AVPlayerTaggedBufferOutput)taggedBufferOutputWithVideoOutput:(id)a3;
- (AVPlayerTaggedBufferOutput)init;
- (AVPlayerTaggedBufferOutput)initWithSpecification:(id)a3;
- (AVPlayerTaggedBufferOutput)initWithVideoOutput:(id)a3;
- (BOOL)_attachToPlayer:(id)a3;
- (BOOL)hasNewTaggedBufferGroupForHostTime:(id *)a3;
- (OpaqueCMTaggedBufferGroup)copyTaggedBufferGroupForHostTime:(id *)a3 presentationTimeStamp:(id *)a4;
- (id)realOutput;
- (void)_detachFromPlayer:(id)a3;
- (void)_setResourceLifeCycleHandler:(id)a3;
- (void)dealloc;
@end

@implementation AVPlayerTaggedBufferOutput

- (AVPlayerTaggedBufferOutput)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_initWithSpecification_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVPlayerTaggedBufferOutput)initWithSpecification:(id)a3
{
  v4 = -[AVPlayerVideoOutput initWithSpecification:]([AVPlayerVideoOutput alloc], "initWithSpecification:", [a3 realSpecification]);
  return [(AVPlayerTaggedBufferOutput *)self initWithVideoOutput:v4];
}

- (AVPlayerTaggedBufferOutput)initWithVideoOutput:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVPlayerTaggedBufferOutput;
  v4 = [(AVPlayerTaggedBufferOutput *)&v6 init];
  if (v4) {
    v4->_realOutput = (AVPlayerVideoOutput *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerTaggedBufferOutput;
  [(AVPlayerTaggedBufferOutput *)&v3 dealloc];
}

+ (AVPlayerTaggedBufferOutput)taggedBufferOutputWithVideoOutput:(id)a3
{
  objc_super v3 = [[AVPlayerTaggedBufferOutput alloc] initWithVideoOutput:a3];
  return v3;
}

- (id)realOutput
{
  v2 = self->_realOutput;
  return v2;
}

- (BOOL)hasNewTaggedBufferGroupForHostTime:(id *)a3
{
  realOutput = self->_realOutput;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  return [(AVPlayerVideoOutput *)realOutput hasNewTaggedBufferGroupForHostTime:&v5];
}

- (OpaqueCMTaggedBufferGroup)copyTaggedBufferGroupForHostTime:(id *)a3 presentationTimeStamp:(id *)a4
{
  realOutput = self->_realOutput;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  return [(AVPlayerVideoOutput *)realOutput copyTaggedBufferGroupForHostTime:&v6 presentationTimeStamp:a4 activeConfiguration:0];
}

- (BOOL)_attachToPlayer:(id)a3
{
  return [(AVPlayerVideoOutput *)self->_realOutput _attachToPlayer:a3 exceptionReason:0];
}

- (void)_detachFromPlayer:(id)a3
{
}

- (void)_setResourceLifeCycleHandler:(id)a3
{
}

@end