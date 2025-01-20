@interface LWCRTypeErrorContext
- (LWCRTypeErrorContext)init;
- (id)synthesizeError;
- (void)popKey;
- (void)pushKey:(id)a3;
- (void)setError:(unsigned int)a3;
@end

@implementation LWCRTypeErrorContext

- (LWCRTypeErrorContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)LWCRTypeErrorContext;
  v2 = [(LWCRTypeErrorContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    keyContext = v2->keyContext;
    v2->keyContext = (NSMutableArray *)v3;

    v2->code = 0;
  }
  return v2;
}

- (void)pushKey:(id)a3
{
}

- (void)popKey
{
}

- (void)setError:(unsigned int)a3
{
  self->code = a3;
}

- (id)synthesizeError
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  [v3 appendFormat:@"Error: %s, Context: ", LWCRTypeVerificationBackend_errorStringForCode(self->code)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->keyContext;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        if (v7 + (int)i < 1) {
          [v3 appendString:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        else {
          [v3 appendFormat:@" -> %@", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
      }
      v7 += v6;
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v10 = objc_opt_new();
  [v10 setObject:v3 forKeyedSubscript:*MEMORY[0x263F08320]];
  v11 = [MEMORY[0x263F087E8] errorWithDomain:@"LWCRVerificationError" code:self->code userInfo:v10];

  return v11;
}

- (void).cxx_destruct
{
}

@end