@interface ASTTestAttributes
+ (id)attributesWithTestId:(id)a3 version:(id)a4;
- (ASTTestAttributes)init;
- (ASTTestAttributes)initWithTestId:(id)a3 version:(id)a4;
- (NSDictionary)dictionary;
- (NSNumber)testId;
- (NSString)version;
- (id)description;
- (void)setTestId:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation ASTTestAttributes

- (ASTTestAttributes)init
{
  v3 = [MEMORY[0x263EFF9D0] null];
  v4 = [MEMORY[0x263EFF9D0] null];
  v5 = [(ASTTestAttributes *)self initWithTestId:v3 version:v4];

  return v5;
}

- (ASTTestAttributes)initWithTestId:(id)a3 version:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASTTestAttributes;
  v9 = [(ASTTestAttributes *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testId, a3);
    objc_storeStrong((id *)&v10->_version, a4);
  }

  return v10;
}

+ (id)attributesWithTestId:(id)a3 version:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithTestId:v7 version:v6];

  return v8;
}

- (NSDictionary)dictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"testId";
  v3 = [(ASTTestAttributes *)self testId];
  v7[1] = @"version";
  v8[0] = v3;
  v4 = [(ASTTestAttributes *)self version];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (id)description
{
  v3 = NSString;
  v4 = [(ASTTestAttributes *)self testId];
  v5 = [(ASTTestAttributes *)self version];
  id v6 = [v3 stringWithFormat:@"Test Id: %@, Version: %@", v4, v5];

  return v6;
}

- (NSNumber)testId
{
  return self->_testId;
}

- (void)setTestId:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_testId, 0);
}

@end