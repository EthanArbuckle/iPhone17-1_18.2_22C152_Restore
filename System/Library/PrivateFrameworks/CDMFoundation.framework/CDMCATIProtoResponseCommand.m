@interface CDMCATIProtoResponseCommand
- (CDMCATIProtoResponseCommand)initWithResponse:(id)a3;
- (SIRINLUINTERNALCATICATIResponse)response;
- (void)setResponse:(id)a3;
@end

@implementation CDMCATIProtoResponseCommand

- (void).cxx_destruct
{
}

- (void)setResponse:(id)a3
{
}

- (SIRINLUINTERNALCATICATIResponse)response
{
  return self->_response;
}

- (CDMCATIProtoResponseCommand)initWithResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMCATIProtoResponseCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

@end