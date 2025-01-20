@interface BLSHEnvironmentDateInterval
+ (id)intervalWithPresentationInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 environment:(id)a6;
- (BLSHBacklightSceneHostEnvironment)environment;
- (BLSHEnvironmentDateInterval)initWithPresentationInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 environment:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReset;
- (NSDate)previousPresentationDate;
- (NSDateInterval)presentationInterval;
- (id)description;
- (unint64_t)hash;
@end

@implementation BLSHEnvironmentDateInterval

+ (id)intervalWithPresentationInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 environment:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithPresentationInterval:v12 previousPresentationDate:v11 shouldReset:v6 environment:v10];

  return v13;
}

- (BLSHEnvironmentDateInterval)initWithPresentationInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 environment:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BLSHEnvironmentDateInterval;
  v14 = [(BLSHEnvironmentDateInterval *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_presentationInterval, a3);
    objc_storeStrong((id *)&v15->_previousPresentationDate, a4);
    v15->_shouldReset = a5;
    objc_storeStrong((id *)&v15->_environment, a6);
  }

  return v15;
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __42__BLSHEnvironmentDateInterval_description__block_invoke;
  id v10 = &unk_2645322D0;
  id v11 = v3;
  id v12 = self;
  id v4 = v3;
  [v4 appendProem:0 block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

void __42__BLSHEnvironmentDateInterval_description__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "bls_shortLoggingString");
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%p", *(void *)(a1 + 40));
  [v2 appendString:v3 withName:v4];

  v5 = *(void **)(a1 + 32);
  BOOL v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "bls_shortLoggingString");
  [v5 appendString:v6 withName:@"prev" skipIfEmpty:1];

  uint64_t v7 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v7 + 8))
  {
    [*(id *)(a1 + 32) appendString:@"shouldReset" withName:0];
    uint64_t v7 = *(void *)(a1 + 40);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(v7 + 32) identifier];
  id v11 = (id)v9;
  if (v9) {
    id v10 = (__CFString *)v9;
  }
  else {
    id v10 = @"<NULL>";
  }
  [v8 appendString:v10 withName:0];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_presentationInterval];
  id v5 = (id)[v3 appendObject:self->_previousPresentationDate];
  id v6 = (id)[v3 appendBool:self->_shouldReset];
  id v7 = (id)[v3 appendPointer:self->_environment];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  presentationInterval = self->_presentationInterval;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __39__BLSHEnvironmentDateInterval_isEqual___block_invoke;
  v28[3] = &unk_264532810;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendObject:presentationInterval counterpart:v28];
  previousPresentationDate = self->_previousPresentationDate;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_2;
  v26[3] = &unk_264532810;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendObject:previousPresentationDate counterpart:v26];
  BOOL shouldReset = self->_shouldReset;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_3;
  v24[3] = &unk_264533BC0;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendBool:shouldReset counterpart:v24];
  environment = self->_environment;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_4;
  v22 = &unk_264532560;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendPointer:environment counterpart:&v19];
  LOBYTE(environment) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return (char)environment;
}

uint64_t __39__BLSHEnvironmentDateInterval_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentationInterval];
}

uint64_t __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) previousPresentationDate];
}

uint64_t __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldReset];
}

uint64_t __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) environment];
}

- (NSDateInterval)presentationInterval
{
  return self->_presentationInterval;
}

- (NSDate)previousPresentationDate
{
  return self->_previousPresentationDate;
}

- (BOOL)shouldReset
{
  return self->_shouldReset;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_previousPresentationDate, 0);

  objc_storeStrong((id *)&self->_presentationInterval, 0);
}

@end