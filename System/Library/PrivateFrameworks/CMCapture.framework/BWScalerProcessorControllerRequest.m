@interface BWScalerProcessorControllerRequest
- (BOOL)readyForProcessing;
@end

@implementation BWScalerProcessorControllerRequest

- (BOOL)readyForProcessing
{
  return [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)self input] frame] != 0;
}

@end