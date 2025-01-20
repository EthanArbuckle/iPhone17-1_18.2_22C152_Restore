@interface AVFigEndpointSecondDisplayModeToken
- (AVFigEndpointSecondDisplayModeToken)init;
- (AVFigEndpointSecondDisplayModeToken)initWithEndpoint:(OpaqueFigEndpoint *)a3;
- (void)dealloc;
@end

@implementation AVFigEndpointSecondDisplayModeToken

- (AVFigEndpointSecondDisplayModeToken)init
{
  return [(AVFigEndpointSecondDisplayModeToken *)self initWithEndpoint:0];
}

- (AVFigEndpointSecondDisplayModeToken)initWithEndpoint:(OpaqueFigEndpoint *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVFigEndpointSecondDisplayModeToken;
  v4 = [(AVFigEndpointSecondDisplayModeToken *)&v8 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (!a3)
  {
    v4->_endpoint = 0;
    goto LABEL_6;
  }
  v6 = (OpaqueFigEndpoint *)CFRetain(a3);
  v5->_endpoint = v6;
  if (!v6)
  {
LABEL_7:
    a3 = 0;
    goto LABEL_6;
  }
  a3 = v5;
LABEL_6:

  return (AVFigEndpointSecondDisplayModeToken *)a3;
}

- (void)dealloc
{
  endpoint = self->_endpoint;
  if (endpoint) {
    CFRelease(endpoint);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVFigEndpointSecondDisplayModeToken;
  [(AVFigEndpointSecondDisplayModeToken *)&v4 dealloc];
}

@end