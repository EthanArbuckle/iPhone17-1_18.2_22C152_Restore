@interface CDMUaaPNLProtoRequestCommand
- (CDMUaaPNLProtoRequestCommand)initWithParserRequest:(id)a3 requestId:(id)a4;
- (SIRINLUEXTERNALRequestID)requestId;
- (SIRINLUINTERNALUAAP_PARSERUaaPParserRequest)parserRequest;
@end

@implementation CDMUaaPNLProtoRequestCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_parserRequest, 0);
}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (SIRINLUINTERNALUAAP_PARSERUaaPParserRequest)parserRequest
{
  return self->_parserRequest;
}

- (CDMUaaPNLProtoRequestCommand)initWithParserRequest:(id)a3 requestId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMUaaPNLProtoRequestCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parserRequest, a3);
    objc_storeStrong((id *)&v10->_requestId, a4);
  }

  return v10;
}

@end