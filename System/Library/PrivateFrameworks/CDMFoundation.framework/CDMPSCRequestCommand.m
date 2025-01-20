@interface CDMPSCRequestCommand
- (CDMPSCRequestCommand)initWithParserRequest:(id)a3 rewriteMsg:(id)a4;
- (SIRINLUEXTERNALRewriteMessage)rewriteMsg;
- (SIRINLUINTERNALITFMITFMParserRequest)parserRequest;
@end

@implementation CDMPSCRequestCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewriteMsg, 0);
  objc_storeStrong((id *)&self->_parserRequest, 0);
}

- (SIRINLUEXTERNALRewriteMessage)rewriteMsg
{
  return self->_rewriteMsg;
}

- (SIRINLUINTERNALITFMITFMParserRequest)parserRequest
{
  return self->_parserRequest;
}

- (CDMPSCRequestCommand)initWithParserRequest:(id)a3 rewriteMsg:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMPSCRequestCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parserRequest, a3);
    objc_storeStrong((id *)&v10->_rewriteMsg, a4);
  }

  return v10;
}

@end