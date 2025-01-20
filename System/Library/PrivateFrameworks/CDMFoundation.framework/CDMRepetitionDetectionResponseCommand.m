@interface CDMRepetitionDetectionResponseCommand
- (CDMRepetitionDetectionResponseCommand)initWithResponse:(id)a3;
- (SIRINLUINTERNALQUERYREWRITEQRResponse)response;
@end

@implementation CDMRepetitionDetectionResponseCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALQUERYREWRITEQRResponse)response
{
  return self->_response;
}

- (CDMRepetitionDetectionResponseCommand)initWithResponse:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMRepetitionDetectionResponseCommand;
  v5 = [(CDMBaseCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    response = v5->_response;
    v5->_response = (SIRINLUINTERNALQUERYREWRITEQRResponse *)v6;
  }
  return v5;
}

@end