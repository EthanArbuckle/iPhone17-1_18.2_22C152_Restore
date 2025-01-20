@interface CDMMentionDetectorRequestCommand
- (CDMMentionDetectorRequestCommand)initWithMDRequest:(id)a3 withCurrTurn:(id)a4;
- (SIRINLUEXTERNALTurnInput)turnInput;
- (SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest)mdRequest;
- (id)description;
@end

@implementation CDMMentionDetectorRequestCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnInput, 0);
  objc_storeStrong((id *)&self->_mdRequest, 0);
}

- (SIRINLUEXTERNALTurnInput)turnInput
{
  return self->_turnInput;
}

- (SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest)mdRequest
{
  return self->_mdRequest;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  v4 = [(SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest *)self->_mdRequest dictionaryRepresentation];
  v5 = (void *)[v3 initWithDictionary:v4];

  [v5 removeObjectForKey:@"embedding_tensor"];
  [v5 removeObjectForKey:@"matching_spans"];
  v6 = [v5 description];

  return v6;
}

- (CDMMentionDetectorRequestCommand)initWithMDRequest:(id)a3 withCurrTurn:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMMentionDetectorRequestCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mdRequest, a3);
    objc_storeStrong((id *)&v10->_turnInput, a4);
  }

  return v10;
}

@end