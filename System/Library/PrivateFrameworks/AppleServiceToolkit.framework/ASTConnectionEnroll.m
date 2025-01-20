@interface ASTConnectionEnroll
- (ASTConnectionEnroll)initWithIdentity:(id)a3;
- (id)endpoint;
@end

@implementation ASTConnectionEnroll

- (ASTConnectionEnroll)initWithIdentity:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASTConnectionEnroll;
  v5 = [(ASTMaterializedConnection *)&v10 init];
  if (v5)
  {
    v6 = [v4 json];

    if (v6)
    {
      v11 = @"identifiers";
      v7 = [v4 json];
      v12[0] = v7;
      v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
      [(ASTMaterializedConnection *)v5 addBody:v8];
    }
  }

  return v5;
}

- (id)endpoint
{
  return @"enroll";
}

@end