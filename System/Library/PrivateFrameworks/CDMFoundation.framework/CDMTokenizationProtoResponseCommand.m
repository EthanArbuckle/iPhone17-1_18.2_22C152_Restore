@interface CDMTokenizationProtoResponseCommand
- (CDMTokenizationProtoResponseCommand)initWithPreviousResponses:(id)a3 withPreviousSiriResponse:(id)a4;
- (CDMTokenizationProtoResponseCommand)initWithResponse:(id)a3;
- (CDMTokenizationProtoResponseCommand)initWithResponses:(id)a3;
- (NSArray)previousSiriResponseTokenResponses;
- (NSArray)responses;
- (SIRINLUINTERNALTOKENIZERTokenizerResponse)response;
- (id)description;
- (void)setPreviousSiriResponseTokenResponses:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponses:(id)a3;
@end

@implementation CDMTokenizationProtoResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSiriResponseTokenResponses, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

- (void)setPreviousSiriResponseTokenResponses:(id)a3
{
}

- (NSArray)previousSiriResponseTokenResponses
{
  return self->_previousSiriResponseTokenResponses;
}

- (void)setResponses:(id)a3
{
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponse:(id)a3
{
}

- (SIRINLUINTERNALTOKENIZERTokenizerResponse)response
{
  return self->_response;
}

- (id)description
{
  v2 = [(SIRINLUINTERNALTOKENIZERTokenizerResponse *)self->_response dictionaryRepresentation];
  v3 = [v2 description];

  return v3;
}

- (CDMTokenizationProtoResponseCommand)initWithPreviousResponses:(id)a3 withPreviousSiriResponse:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CDMTokenizationProtoResponseCommand;
  v9 = [(CDMBaseCommand *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v7 firstObject];
    response = v9->_response;
    v9->_response = (SIRINLUINTERNALTOKENIZERTokenizerResponse *)v10;

    objc_storeStrong((id *)&v9->_responses, a3);
    objc_storeStrong((id *)&v9->_previousSiriResponseTokenResponses, a4);
  }

  return v9;
}

- (CDMTokenizationProtoResponseCommand)initWithResponses:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDMTokenizationProtoResponseCommand;
  v6 = [(CDMBaseCommand *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 firstObject];
    response = v6->_response;
    v6->_response = (SIRINLUINTERNALTOKENIZERTokenizerResponse *)v7;

    objc_storeStrong((id *)&v6->_responses, a3);
  }

  return v6;
}

- (CDMTokenizationProtoResponseCommand)initWithResponse:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMTokenizationProtoResponseCommand;
  v6 = [(CDMBaseCommand *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_response, a3);
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObject:v5];
    responses = v7->_responses;
    v7->_responses = (NSArray *)v8;
  }
  return v7;
}

@end