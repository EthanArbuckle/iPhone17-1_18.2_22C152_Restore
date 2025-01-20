@interface BWInferenceEngineControllerRequest
- (BOOL)readyForProcessing;
@end

@implementation BWInferenceEngineControllerRequest

- (BOOL)readyForProcessing
{
  return [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)self input] expectsMoreData] ^ 1;
}

@end