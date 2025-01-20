@interface BLSHEnvironmentDateSpecifier
+ (BLSHEnvironmentDateSpecifier)specifierWithPresentationDate:(id)a3 fidelity:(int64_t)a4 environment:(id)a5;
+ (BLSHEnvironmentDateSpecifier)specifierWithPresentationDate:(id)a3 fidelity:(int64_t)a4 environment:(id)a5 userObject:(id)a6;
- (BLSAlwaysOnDateSpecifier)dateSpecifier;
- (BLSHBacklightSceneHostEnvironment)environment;
- (BLSHEnvironmentDateSpecifier)initWithPresentationDate:(id)a3 fidelity:(int64_t)a4 environment:(id)a5 userObject:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)environmentIdentifier;
- (id)bls_shortLoggingString;
- (id)userObject;
- (unint64_t)hash;
@end

@implementation BLSHEnvironmentDateSpecifier

+ (BLSHEnvironmentDateSpecifier)specifierWithPresentationDate:(id)a3 fidelity:(int64_t)a4 environment:(id)a5 userObject:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithPresentationDate:v12 fidelity:a4 environment:v11 userObject:v10];

  return (BLSHEnvironmentDateSpecifier *)v13;
}

+ (BLSHEnvironmentDateSpecifier)specifierWithPresentationDate:(id)a3 fidelity:(int64_t)a4 environment:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithPresentationDate:v9 fidelity:a4 environment:v8 userObject:0];

  return (BLSHEnvironmentDateSpecifier *)v10;
}

- (BLSHEnvironmentDateSpecifier)initWithPresentationDate:(id)a3 fidelity:(int64_t)a4 environment:(id)a5 userObject:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BLSHEnvironmentDateSpecifier;
  v13 = [(BLSHEnvironmentDateSpecifier *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x263F29940]) initWithDate:v10 fidelity:a4 userObject:v12];
    dateSpecifier = v13->_dateSpecifier;
    v13->_dateSpecifier = (BLSAlwaysOnDateSpecifier *)v14;

    objc_storeStrong((id *)&v13->_environment, a5);
  }

  return v13;
}

- (NSString)environmentIdentifier
{
  return (NSString *)[(BLSHBacklightSceneHostEnvironment *)self->_environment identifier];
}

- (id)userObject
{
  return (id)[(BLSAlwaysOnDateSpecifier *)self->_dateSpecifier userObject];
}

- (id)bls_shortLoggingString
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __54__BLSHEnvironmentDateSpecifier_bls_shortLoggingString__block_invoke;
  id v10 = &unk_2645322D0;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:0 block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return v5;
}

void __54__BLSHEnvironmentDateSpecifier_bls_shortLoggingString__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) date];
  v3 = *(void **)(a1 + 40);
  id v9 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(v2, "bls_shortLoggingString");
    [v3 appendString:v4 withName:0];
  }
  else
  {
    [v3 appendString:@"<NULL>" withName:0];
  }
  v5 = *(void **)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 8) fidelity];
  v6 = NSStringFromBLSUpdateFidelity();
  [v5 appendString:v6 withName:0];

  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 16) identifier];
  [v7 appendString:v8 withName:0];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(BLSAlwaysOnDateSpecifier *)self->_dateSpecifier date];
  v5 = objc_msgSend(v4, "bls_shortLoggingString");
  [v3 appendString:v5 withName:@"presentationDate"];

  [(BLSAlwaysOnDateSpecifier *)self->_dateSpecifier fidelity];
  v6 = NSStringFromBLSUpdateFidelity();
  [v3 appendString:v6 withName:@"fidelity"];

  uint64_t v7 = NSString;
  environment = self->_environment;
  id v9 = [(BLSHBacklightSceneHostEnvironment *)environment identifier];
  id v10 = [v7 stringWithFormat:@"<%p:%@>", environment, v9];
  [v3 appendString:v10 withName:@"environment"];

  id v11 = [(BLSHEnvironmentDateSpecifier *)self userObject];

  if (v11)
  {
    id v12 = NSString;
    v13 = [(BLSHEnvironmentDateSpecifier *)self userObject];
    uint64_t v14 = [(BLSHEnvironmentDateSpecifier *)self userObject];
    v15 = [v12 stringWithFormat:@"<%p:%@>", v13, objc_opt_class()];
    [v3 appendString:v15 withName:@"userObject"];
  }
  v16 = [v3 build];

  return (NSString *)v16;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_dateSpecifier];
  id v5 = (id)[v3 appendPointer:self->_environment];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  dateSpecifier = self->_dateSpecifier;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __40__BLSHEnvironmentDateSpecifier_isEqual___block_invoke;
  v18[3] = &unk_264532810;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:dateSpecifier counterpart:v18];
  environment = self->_environment;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __40__BLSHEnvironmentDateSpecifier_isEqual___block_invoke_2;
  v16 = &unk_264532560;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendPointer:environment counterpart:&v13];
  LOBYTE(environment) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)environment;
}

uint64_t __40__BLSHEnvironmentDateSpecifier_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dateSpecifier];
}

uint64_t __40__BLSHEnvironmentDateSpecifier_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) environment];
}

- (BLSAlwaysOnDateSpecifier)dateSpecifier
{
  return self->_dateSpecifier;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_dateSpecifier, 0);
}

@end