@interface ASTConnectionRetrieveSelfServiceSuites
- (ASTConnectionRetrieveSelfServiceSuites)initWithConfigCode:(id)a3;
- (NSString)configCode;
- (id)endpoint;
- (id)method;
- (id)parameters;
- (void)setConfigCode:(id)a3;
@end

@implementation ASTConnectionRetrieveSelfServiceSuites

- (ASTConnectionRetrieveSelfServiceSuites)initWithConfigCode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASTConnectionRetrieveSelfServiceSuites;
  v6 = [(ASTMaterializedConnection *)&v9 init];
  v7 = v6;
  if (v5 && v6) {
    objc_storeStrong((id *)&v6->_configCode, a3);
  }

  return v7;
}

- (id)endpoint
{
  return @"retrieve/suites";
}

- (id)method
{
  return @"GET";
}

- (id)parameters
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"configCode";
  v2 = [(ASTConnectionRetrieveSelfServiceSuites *)self configCode];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (NSString)configCode
{
  return self->_configCode;
}

- (void)setConfigCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end