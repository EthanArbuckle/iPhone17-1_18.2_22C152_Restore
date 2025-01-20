@interface AISChildSetupFlowResult
- (AISAuthenticationResponse)authResponse;
- (AISChildSetupFlowResult)init;
- (NSError)error;
@end

@implementation AISChildSetupFlowResult

- (NSError)error
{
  return (NSError *)0;
}

- (AISAuthenticationResponse)authResponse
{
  return (AISAuthenticationResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR___AISChildSetupFlowResult_authResponse));
}

- (AISChildSetupFlowResult)init
{
  result = (AISChildSetupFlowResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end