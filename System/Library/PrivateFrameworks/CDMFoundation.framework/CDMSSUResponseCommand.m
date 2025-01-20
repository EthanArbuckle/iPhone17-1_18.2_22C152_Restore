@interface CDMSSUResponseCommand
- (CDMSSUResponseCommand)initWithCmdError:(id)a3;
- (CDMSSUResponseCommand)initWithSSUResponse:(id)a3;
- (CDMSSUResponseCommand)initWithSSUResponse:(id)a3 cmdError:(id)a4;
- (SIRINLUINTERNALSSUSSUResponse)ssuResponse;
@end

@implementation CDMSSUResponseCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALSSUSSUResponse)ssuResponse
{
  return self->_ssuResponse;
}

- (CDMSSUResponseCommand)initWithSSUResponse:(id)a3 cmdError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMSSUResponseCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ssuResponse, a3);
    [(CDMBaseCommand *)v10 setCmdError:v8];
  }

  return v10;
}

- (CDMSSUResponseCommand)initWithCmdError:(id)a3
{
  return [(CDMSSUResponseCommand *)self initWithSSUResponse:0 cmdError:a3];
}

- (CDMSSUResponseCommand)initWithSSUResponse:(id)a3
{
  return [(CDMSSUResponseCommand *)self initWithSSUResponse:a3 cmdError:0];
}

@end