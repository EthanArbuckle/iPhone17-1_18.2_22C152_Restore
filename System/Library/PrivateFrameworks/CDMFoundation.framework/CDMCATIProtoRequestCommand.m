@interface CDMCATIProtoRequestCommand
- (CDMCATIProtoRequestCommand)initWithRequest:(id)a3;
- (SIRINLUINTERNALCATICATIRequest)request;
- (void)setRequest:(id)a3;
@end

@implementation CDMCATIProtoRequestCommand

- (void).cxx_destruct
{
}

- (void)setRequest:(id)a3
{
}

- (SIRINLUINTERNALCATICATIRequest)request
{
  return self->_request;
}

- (CDMCATIProtoRequestCommand)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMCATIProtoRequestCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

@end