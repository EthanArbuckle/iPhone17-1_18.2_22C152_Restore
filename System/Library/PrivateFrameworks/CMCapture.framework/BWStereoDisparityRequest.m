@interface BWStereoDisparityRequest
- (BOOL)readyForProcessing;
@end

@implementation BWStereoDisparityRequest

- (BOOL)readyForProcessing
{
  uint64_t v3 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)self input] referenceSbuf];
  if (v3) {
    LOBYTE(v3) = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)self input] auxiliarySbuf] != 0;
  }
  return v3;
}

@end