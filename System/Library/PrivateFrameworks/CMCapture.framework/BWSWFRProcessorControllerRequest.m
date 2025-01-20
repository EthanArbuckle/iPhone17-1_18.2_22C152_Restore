@interface BWSWFRProcessorControllerRequest
- (BOOL)readyForProcessing;
- (int)demosaicedRawErr;
- (void)setDemosaicedRawErr:(int)a3;
@end

@implementation BWSWFRProcessorControllerRequest

- (BOOL)readyForProcessing
{
  if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)self input] flashFrame]&& [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)self input] ambientFrame])
  {
    return 1;
  }
  v4 = [(BWStillImageProcessorControllerRequest *)self input];
  return [(BWStillImageProcessorControllerInput *)v4 addFrameFailed];
}

- (int)demosaicedRawErr
{
  return self->_demosaicedRawErr;
}

- (void)setDemosaicedRawErr:(int)a3
{
  self->_demosaicedRawErr = a3;
}

@end