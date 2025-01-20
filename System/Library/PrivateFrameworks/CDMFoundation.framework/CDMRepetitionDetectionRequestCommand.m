@interface CDMRepetitionDetectionRequestCommand
- (CDMRepetitionDetectionRequestCommand)initWithQRRequest:(id)a3;
- (SIRINLUINTERNALQUERYREWRITEQRRequest)qrRequest;
@end

@implementation CDMRepetitionDetectionRequestCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALQUERYREWRITEQRRequest)qrRequest
{
  return self->_qrRequest;
}

- (CDMRepetitionDetectionRequestCommand)initWithQRRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMRepetitionDetectionRequestCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_qrRequest, a3);
  }

  return v7;
}

@end