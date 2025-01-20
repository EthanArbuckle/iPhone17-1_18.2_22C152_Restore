@interface ASTProfileResult
+ (id)resultWithIdentity:(id)a3;
+ (id)sealedProfileResultWithPayload:(id)a3 signature:(id)a4;
- (ASTIdentity)identity;
- (ASTProfileResult)init;
- (ASTProfileResult)initWithIdentity:(id)a3;
- (NSArray)properties;
- (NSArray)tests;
- (id)generatePayload;
- (void)setProperties:(id)a3;
- (void)setTests:(id)a3;
@end

@implementation ASTProfileResult

- (ASTProfileResult)init
{
  v3 = objc_opt_new();
  v4 = [(ASTProfileResult *)self initWithIdentity:v3];

  return v4;
}

- (ASTProfileResult)initWithIdentity:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASTProfileResult;
  v6 = [(ASTProfileResult *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identity, a3);
    properties = v7->_properties;
    v9 = (NSArray *)MEMORY[0x263EFFA68];
    v7->_properties = (NSArray *)MEMORY[0x263EFFA68];

    tests = v7->_tests;
    v7->_tests = v9;
  }
  return v7;
}

+ (id)resultWithIdentity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithIdentity:v4];

  return v5;
}

- (id)generatePayload
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(ASTProfileResult *)self tests];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v6 = [(ASTProfileResult *)self tests];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionary];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }

  objc_super v12 = [(ASTProfileResult *)self identity];
  v13 = [v12 hostAppBuild];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x263EFF9D0] null];
  }
  v16 = v15;

  v17 = [(ASTProfileResult *)self identity];
  v18 = [v17 hostAppVersion];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [MEMORY[0x263EFF9D0] null];
  }
  v21 = v20;

  v22 = [(ASTProfileResult *)self properties];
  if (v22) {
    [(ASTProfileResult *)self properties];
  }
  else {
  v23 = [MEMORY[0x263EFF9D0] null];
  }

  v24 = +[ASTEnvironment currentEnvironment];
  uint64_t v25 = [v24 environmentType];

  v26 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  [v26 setObject:v23 forKeyedSubscript:@"profile"];
  [v26 setObject:v5 forKeyedSubscript:@"tests"];
  v27 = [NSNumber numberWithUnsignedInteger:v25];
  [v26 setObject:v27 forKeyedSubscript:@"environment"];

  [v26 setObject:v16 forKeyedSubscript:@"diagnosticsBuild"];
  [v26 setObject:v21 forKeyedSubscript:@"diagnosticsVersion"];
  if ((unint64_t)(v25 - 9) <= 1) {
    [v26 setObject:&unk_26F0B5838 forKeyedSubscript:@"context"];
  }
  v28 = (void *)[v26 copy];

  return v28;
}

+ (id)sealedProfileResultWithPayload:(id)a3 signature:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(ASTSealablePayload *)[ASTProfileResult alloc] initWithPayload:v6 signature:v5];

  return v7;
}

- (void)setTests:(id)a3
{
}

- (NSArray)tests
{
  return self->_tests;
}

- (void)setProperties:(id)a3
{
}

- (NSArray)properties
{
  return self->_properties;
}

- (ASTIdentity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_tests, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end