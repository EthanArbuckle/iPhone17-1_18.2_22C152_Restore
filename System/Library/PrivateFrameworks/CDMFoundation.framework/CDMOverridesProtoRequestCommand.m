@interface CDMOverridesProtoRequestCommand
- (CDMOverridesProtoRequestCommand)initWithRequest:(id)a3;
- (SIRINLUINTERNALOVERRIDESOverridesRequest)request;
@end

@implementation CDMOverridesProtoRequestCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALOVERRIDESOverridesRequest)request
{
  return self->_request;
}

- (CDMOverridesProtoRequestCommand)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMOverridesProtoRequestCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

@end