@interface BWStillImageConditionalRouterConfiguration
- (BWStillImageConditionalRouterConfiguration)initWithNumberOfOutputs:(unsigned int)a3;
- (id)shouldEmitNodeErrorDecisionProvider;
- (id)shouldEmitSampleBufferDecisionProvider;
- (unsigned)numberOfInputs;
- (unsigned)numberOfOutputs;
- (void)dealloc;
- (void)setShouldEmitNodeErrorDecisionProvider:(id)a3;
- (void)setShouldEmitSampleBufferDecisionProvider:(id)a3;
@end

@implementation BWStillImageConditionalRouterConfiguration

- (unsigned)numberOfOutputs
{
  return self->_numberOfOutputs;
}

- (void)setShouldEmitSampleBufferDecisionProvider:(id)a3
{
}

- (BWStillImageConditionalRouterConfiguration)initWithNumberOfOutputs:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterConfiguration;
  result = [(BWStillImageConditionalRouterConfiguration *)&v5 init];
  if (result) {
    result->_numberOfOutputs = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageConditionalRouterConfiguration;
  [(BWStillImageConditionalRouterConfiguration *)&v3 dealloc];
}

- (id)shouldEmitSampleBufferDecisionProvider
{
  return self->_shouldEmitSampleBufferDecisionProvider;
}

- (unsigned)numberOfInputs
{
  return self->_numberOfInputs;
}

- (id)shouldEmitNodeErrorDecisionProvider
{
  return self->_shouldEmitNodeErrorDecisionProvider;
}

- (void)setShouldEmitNodeErrorDecisionProvider:(id)a3
{
}

@end