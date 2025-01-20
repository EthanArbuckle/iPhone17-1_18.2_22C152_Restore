@interface BWDeferredProcessorControllerRequest
- (BOOL)readyForProcessing;
@end

@implementation BWDeferredProcessorControllerRequest

- (BOOL)readyForProcessing
{
  return [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)self input] container] != 0;
}

@end