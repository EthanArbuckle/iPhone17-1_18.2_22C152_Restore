@interface ASTConnectionTestResult
- (ASTConnectionTestResult)initWithTestResults:(id)a3;
- (NSNumber)testId;
- (id)endpoint;
@end

@implementation ASTConnectionTestResult

- (ASTConnectionTestResult)initWithTestResults:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASTConnectionTestResult;
  v5 = [(ASTMaterializedConnection *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 testId];
    testId = v5->_testId;
    v5->_testId = (NSNumber *)v6;

    v8 = [v4 payload];

    if (v8)
    {
      v9 = [v4 payload];
      [(ASTMaterializedConnection *)v5 addBody:v9 gzip:+[ASTConnectionUtilities isGzipEnabled]];

      v10 = [v4 base64Signature];
      [(ASTMaterializedConnection *)v5 setSignature:v10];
    }
  }

  return v5;
}

- (id)endpoint
{
  return @"results";
}

- (NSNumber)testId
{
  return self->_testId;
}

- (void).cxx_destruct
{
}

@end