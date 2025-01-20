@interface CDMQRRequestCommand
- (CDMQRRequestCommand)initWithQRRequest:(id)a3;
- (SIRINLUINTERNALQUERYREWRITEQRRequest)qrRequest;
- (void)setQrRequest:(id)a3;
@end

@implementation CDMQRRequestCommand

- (void).cxx_destruct
{
}

- (void)setQrRequest:(id)a3
{
}

- (SIRINLUINTERNALQUERYREWRITEQRRequest)qrRequest
{
  return self->_qrRequest;
}

- (CDMQRRequestCommand)initWithQRRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMQRRequestCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_qrRequest, a3);
  }

  return v7;
}

@end