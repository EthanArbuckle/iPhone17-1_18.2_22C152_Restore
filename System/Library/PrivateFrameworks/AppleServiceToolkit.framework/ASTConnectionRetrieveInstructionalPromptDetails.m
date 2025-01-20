@interface ASTConnectionRetrieveInstructionalPromptDetails
- (ASTConnectionRetrieveInstructionalPromptDetails)initWithInstructionID:(id)a3 type:(id)a4 language:(id)a5 locale:(id)a6;
- (id)endpoint;
- (id)rawBody;
@end

@implementation ASTConnectionRetrieveInstructionalPromptDetails

- (ASTConnectionRetrieveInstructionalPromptDetails)initWithInstructionID:(id)a3 type:(id)a4 language:(id)a5 locale:(id)a6
{
  v20[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ASTConnectionRetrieveInstructionalPromptDetails;
  v14 = [(ASTMaterializedConnection *)&v18 init];
  if (v14)
  {
    v19[0] = @"instructionId";
    v19[1] = @"type";
    v20[0] = v10;
    v20[1] = v11;
    v19[2] = @"language";
    v19[3] = @"locale";
    v20[2] = v12;
    v20[3] = v13;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
    rawBody = v14->_rawBody;
    v14->_rawBody = (NSDictionary *)v15;

    [(ASTMaterializedConnection *)v14 addBody:v14->_rawBody];
  }

  return v14;
}

- (id)endpoint
{
  return @"retrieve/instruction/details";
}

- (id)rawBody
{
  return self->_rawBody;
}

- (void).cxx_destruct
{
}

@end