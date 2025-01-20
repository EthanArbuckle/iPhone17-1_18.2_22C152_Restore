@interface LACDTOServiceProcessor
- (BOOL)canProcessRequest:(id)a3;
- (LACDTOServiceProcessor)initWithSubprocessors:(id)a3;
- (id)_entitlementsForRequest:(id)a3;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACDTOServiceProcessor

- (void).cxx_destruct
{
}

- (BOOL)canProcessRequest:(id)a3
{
  id v3 = a3;
  if (LACPolicyIsLocationBasedPolicy([v3 policy]))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [v3 options];
    v6 = [NSNumber numberWithInteger:1068];
    v7 = [v5 objectForKey:v6];
    char v4 = [v7 BOOLValue];
  }
  return v4;
}

- (LACDTOServiceProcessor)initWithSubprocessors:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOServiceProcessor;
  v5 = [(LACDTOServiceProcessor *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[LACEvaluationRequestProcessorFactory makeProcessorWithSubprocessors:v4];
    compoundProcessor = v5->_compoundProcessor;
    v5->_compoundProcessor = (LACEvaluationRequestProcessor *)v6;
  }
  return v5;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v21 = a4;
  objc_super v9 = (void (**)(id, void *))a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = [(LACDTOServiceProcessor *)self _entitlementsForRequest:v8];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
        v16 = [v8 client];
        char v17 = [v16 checkEntitlement:v15];

        if ((v17 & 1) == 0)
        {
          v19 = +[LACError missingEntitlementError:v15];
          v20 = +[LACEvaluationResult resultWithFailure:v19];
          v9[2](v9, v20);

          v18 = v21;
          goto LABEL_11;
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v18 = v21;
  [(LACEvaluationRequestProcessor *)self->_compoundProcessor processRequest:v8 configuration:v21 completion:v9];
LABEL_11:
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = (void (**)(id, id))a5;
  id v9 = a4;
  if (objc_opt_respondsToSelector()) {
    [(LACEvaluationRequestProcessor *)self->_compoundProcessor postProcessRequest:v10 result:v9 completion:v8];
  }
  else {
    v8[2](v8, v9);
  }
}

- (id)_entitlementsForRequest:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  v17[0] = @"com.apple.private.CoreAuthentication.SPI";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  uint64_t v6 = (void *)[v4 initWithArray:v5];

  if ([v3 policy] == 1026) {
    [v6 addObject:@"com.apple.private.LocalAuthentication.DTO"];
  }
  v7 = [v3 options];
  id v8 = [NSNumber numberWithInteger:1061];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    [v6 addObject:@"com.apple.private.LocalAuthentication.DTO.ShortExpiration"];
  }
  id v10 = [NSNumber numberWithInteger:1062];
  uint64_t v11 = [v7 objectForKeyedSubscript:v10];

  if (v11) {
    [v6 addObject:@"com.apple.private.LocalAuthentication.DTO.FallbackToNoAuth"];
  }
  uint64_t v12 = [NSNumber numberWithInteger:1068];
  uint64_t v13 = [v7 objectForKeyedSubscript:v12];

  if (v13) {
    [v6 addObject:@"com.apple.private.LocalAuthentication.DTO.FallbackToNoAuth"];
  }
  uint64_t v14 = [NSNumber numberWithInteger:1085];
  uint64_t v15 = [v7 objectForKeyedSubscript:v14];

  if (v15) {
    [v6 addObject:@"com.apple.private.LocalAuthentication.DTO.AllowUnapprovedSensor"];
  }

  return v6;
}

@end