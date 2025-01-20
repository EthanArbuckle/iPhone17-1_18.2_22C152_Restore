@interface CDMSpanMatcherResponseCommand
- (CDMSpanMatcherResponseCommand)initWithResponse:(id)a3;
- (SIRINLUINTERNALSPANMATCHSpanMatchResponse)spanMatchResponse;
- (id)description;
- (void)setSpanMatchResponse:(id)a3;
@end

@implementation CDMSpanMatcherResponseCommand

- (void).cxx_destruct
{
}

- (void)setSpanMatchResponse:(id)a3
{
}

- (SIRINLUINTERNALSPANMATCHSpanMatchResponse)spanMatchResponse
{
  return self->_spanMatchResponse;
}

- (id)description
{
  if (self->_spanMatchResponse)
  {
    objc_msgSend(MEMORY[0x263F71F80], "printableSpanMatchResponse:");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = @"nil";
  }
  return v2;
}

- (CDMSpanMatcherResponseCommand)initWithResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSpanMatcherResponseCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_spanMatchResponse, a3);
  }

  return v7;
}

@end