@interface BWRedEyeReductionRequest
- (BWRedEyeReductionControllerDelegate)delegate;
- (BWRedEyeReductionControllerInput)input;
- (BWRedEyeReductionRequest)initWithInput:(id)a3 delegate:(id)a4;
- (id)description;
- (int)mode;
- (void)dealloc;
- (void)setMode:(int)a3;
@end

@implementation BWRedEyeReductionRequest

- (BWRedEyeReductionRequest)initWithInput:(id)a3 delegate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWRedEyeReductionRequest;
  v6 = [(BWRedEyeReductionRequest *)&v8 init];
  if (v6)
  {
    v6->_input = (BWRedEyeReductionControllerInput *)a3;
    v6->_delegate = (BWRedEyeReductionControllerDelegate *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWRedEyeReductionRequest;
  [(BWRedEyeReductionRequest *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>: For %@", objc_opt_class(), self, self->_input];
}

- (BWRedEyeReductionControllerInput)input
{
  return self->_input;
}

- (BWRedEyeReductionControllerDelegate)delegate
{
  return self->_delegate;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

@end