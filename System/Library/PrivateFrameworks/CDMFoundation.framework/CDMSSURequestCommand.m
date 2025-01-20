@interface CDMSSURequestCommand
- (CDMSSURequestCommand)initWithParserRequest:(id)a3;
- (SIRINLUINTERNALSSUSSURequest)parserRequest;
@end

@implementation CDMSSURequestCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALSSUSSURequest)parserRequest
{
  return self->_parserRequest;
}

- (CDMSSURequestCommand)initWithParserRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSSURequestCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_parserRequest, a3);
  }

  return v7;
}

@end