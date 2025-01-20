@interface _CNDRemoteExtensionContext
- (CNDonationExtensionRequestHandler)requestHandler;
- (id)hostContext;
- (void)redonateAllValuesWithReason:(unint64_t)a3;
- (void)renewExpirationDateForDonatedValue:(id)a3 acknowledgementHandler:(id)a4;
- (void)setRequestHandler:(id)a3;
@end

@implementation _CNDRemoteExtensionContext

- (id)hostContext
{
  v2 = [(_CNDRemoteExtensionContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_4];

  return v3;
}

- (void)renewExpirationDateForDonatedValue:(id)a3 acknowledgementHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CNDRemoteExtensionContext *)self requestHandler];
  [v8 renewExpirationDateForDonatedValue:v7 acknowledgementHandler:v6];
}

- (void)redonateAllValuesWithReason:(unint64_t)a3
{
  id v4 = [(_CNDRemoteExtensionContext *)self requestHandler];
  [v4 redonateAllValuesWithReason:a3];
}

- (CNDonationExtensionRequestHandler)requestHandler
{
  return self->_requestHandler;
}

- (void)setRequestHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end