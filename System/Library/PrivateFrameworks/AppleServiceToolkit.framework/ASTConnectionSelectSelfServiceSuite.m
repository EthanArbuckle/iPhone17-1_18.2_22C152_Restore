@interface ASTConnectionSelectSelfServiceSuite
- (ASTConnectionSelectSelfServiceSuite)initWithSuiteID:(id)a3;
- (id)endpoint;
- (id)rawBody;
@end

@implementation ASTConnectionSelectSelfServiceSuite

- (ASTConnectionSelectSelfServiceSuite)initWithSuiteID:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASTConnectionSelectSelfServiceSuite;
  v5 = [(ASTMaterializedConnection *)&v10 init];
  v6 = v5;
  if (v4 && v5)
  {
    v11 = @"suiteId";
    v12[0] = v4;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    rawBody = v6->_rawBody;
    v6->_rawBody = (NSDictionary *)v7;

    [(ASTMaterializedConnection *)v6 addBody:v6->_rawBody];
  }

  return v6;
}

- (id)endpoint
{
  return @"select/suite";
}

- (id)rawBody
{
  return self->_rawBody;
}

- (void).cxx_destruct
{
}

@end