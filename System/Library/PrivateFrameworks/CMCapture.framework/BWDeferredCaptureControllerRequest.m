@interface BWDeferredCaptureControllerRequest
- (BOOL)readyForProcessing;
- (int)err;
- (void)setErr:(int)a3;
@end

@implementation BWDeferredCaptureControllerRequest

- (BOOL)readyForProcessing
{
  v2 = [(BWStillImageProcessorControllerRequest *)self input];
  return -[BWDeferredCaptureControllerInput readyForProcessing]((id *)&v2->super.isa);
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

@end