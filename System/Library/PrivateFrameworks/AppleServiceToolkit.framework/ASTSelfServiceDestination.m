@interface ASTSelfServiceDestination
- (ASTSelfServiceDestination)initWithEndpoint:(int64_t)a3 suites:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)suites;
- (int64_t)endpoint;
- (void)setEndpoint:(int64_t)a3;
- (void)setSuites:(id)a3;
@end

@implementation ASTSelfServiceDestination

- (ASTSelfServiceDestination)initWithEndpoint:(int64_t)a3 suites:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ASTSelfServiceDestination;
  v7 = [(ASTSelfServiceDestination *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(ASTSelfServiceDestination *)v7 setEndpoint:a3];
    [(ASTSelfServiceDestination *)v8 setSuites:v6];
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = [(ASTSelfServiceDestination *)self endpoint];
    BOOL v6 = v5 == [v4 endpoint];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(int64_t)a3
{
  self->_endpoint = a3;
}

- (NSArray)suites
{
  return self->_suites;
}

- (void)setSuites:(id)a3
{
}

- (void).cxx_destruct
{
}

@end