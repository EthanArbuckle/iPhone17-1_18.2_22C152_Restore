@interface CDMUaaPNLProtoResponseCommand
- (CDMUaaPNLProtoResponseCommand)initWithParserResponse:(id)a3 nluResponse:(id)a4;
- (SIRINLUEXTERNALCDMNluResponse)nluResponse;
- (SIRINLUINTERNALUAAP_PARSERUaaPParserResponse)parserResponse;
@end

@implementation CDMUaaPNLProtoResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nluResponse, 0);
  objc_storeStrong((id *)&self->_parserResponse, 0);
}

- (SIRINLUEXTERNALCDMNluResponse)nluResponse
{
  return self->_nluResponse;
}

- (SIRINLUINTERNALUAAP_PARSERUaaPParserResponse)parserResponse
{
  return self->_parserResponse;
}

- (CDMUaaPNLProtoResponseCommand)initWithParserResponse:(id)a3 nluResponse:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMUaaPNLProtoResponseCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parserResponse, a3);
    objc_storeStrong((id *)&v10->_nluResponse, a4);
  }

  return v10;
}

@end