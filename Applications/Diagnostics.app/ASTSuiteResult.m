@interface ASTSuiteResult
- (ASTSuiteResult)initWithDictionary:(id)a3 error:(id *)a4;
- (ASTSuiteResult)initWithName:(id)a3 components:(id)a4;
- (NSArray)components;
- (NSString)suiteName;
- (void)setComponents:(id)a3;
- (void)setSuiteName:(id)a3;
@end

@implementation ASTSuiteResult

- (ASTSuiteResult)initWithName:(id)a3 components:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ASTSuiteResult;
  return [(ASTSuiteResult *)&v5 init];
}

- (ASTSuiteResult)initWithDictionary:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ASTSuiteResult;
  return [(ASTSuiteResult *)&v5 init];
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_suiteName, 0);
}

@end