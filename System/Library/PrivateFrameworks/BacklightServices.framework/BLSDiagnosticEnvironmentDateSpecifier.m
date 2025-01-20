@interface BLSDiagnosticEnvironmentDateSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)createWithSpecifier:(id)a3;
- (BLSAlwaysOnDateSpecifier)dateSpecifier;
- (BLSDiagnosticEnvironmentDateSpecifier)initWithCoder:(id)a3;
- (BLSDiagnosticEnvironmentDateSpecifier)initWithDateSpecifier:(id)a3 environmentIdentifier:(id)a4;
- (BLSDiagnosticEnvironmentDateSpecifier)initWithXPCDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)environmentIdentifier;
- (id)bls_shortLoggingString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSDiagnosticEnvironmentDateSpecifier

+ (id)createWithSpecifier:(id)a3
{
  id v3 = a3;
  v4 = [BLSDiagnosticEnvironmentDateSpecifier alloc];
  v5 = [v3 dateSpecifier];
  v6 = [v3 environmentIdentifier];

  v7 = [(BLSDiagnosticEnvironmentDateSpecifier *)v4 initWithDateSpecifier:v5 environmentIdentifier:v6];

  return v7;
}

- (BLSDiagnosticEnvironmentDateSpecifier)initWithDateSpecifier:(id)a3 environmentIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSDiagnosticEnvironmentDateSpecifier;
  v9 = [(BLSDiagnosticEnvironmentDateSpecifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateSpecifier, a3);
    objc_storeStrong((id *)&v10->_environmentIdentifier, a4);
  }

  return v10;
}

- (id)bls_shortLoggingString
{
  id v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __63__BLSDiagnosticEnvironmentDateSpecifier_bls_shortLoggingString__block_invoke;
  v10 = &unk_1E6106FA8;
  id v11 = v3;
  objc_super v12 = self;
  id v4 = v3;
  [v4 appendProem:0 block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

uint64_t __63__BLSDiagnosticEnvironmentDateSpecifier_bls_shortLoggingString__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 8) date];
  id v4 = objc_msgSend(v3, "bls_shortLoggingString");
  [v2 appendString:v4 withName:0 skipIfEmpty:1];

  v5 = *(void **)(a1 + 32);
  v6 = NSStringFromBLSUpdateFidelity([*(id *)(*(void *)(a1 + 40) + 8) fidelity]);
  [v5 appendString:v6 withName:0 skipIfEmpty:1];

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 16);

  return [v7 appendString:v8 withName:0 skipIfEmpty:1];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(BLSAlwaysOnDateSpecifier *)self->_dateSpecifier date];
  v5 = objc_msgSend(v4, "bls_shortLoggingString");
  [v3 appendString:v5 withName:@"presentationDate"];

  v6 = NSStringFromBLSUpdateFidelity([(BLSAlwaysOnDateSpecifier *)self->_dateSpecifier fidelity]);
  [v3 appendString:v6 withName:@"fidelity"];

  [v3 appendString:self->_environmentIdentifier withName:@"environment"];
  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_dateSpecifier];
  id v5 = (id)[v3 appendString:self->_environmentIdentifier];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  dateSpecifier = self->_dateSpecifier;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__BLSDiagnosticEnvironmentDateSpecifier_isEqual___block_invoke;
  v18[3] = &unk_1E61073D8;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:dateSpecifier counterpart:v18];
  environmentIdentifier = self->_environmentIdentifier;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __49__BLSDiagnosticEnvironmentDateSpecifier_isEqual___block_invoke_2;
  v16 = &unk_1E61079D8;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendString:environmentIdentifier counterpart:&v13];
  LOBYTE(environmentIdentifier) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)environmentIdentifier;
}

uint64_t __49__BLSDiagnosticEnvironmentDateSpecifier_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dateSpecifier];
}

uint64_t __49__BLSDiagnosticEnvironmentDateSpecifier_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) environmentIdentifier];
}

- (BLSDiagnosticEnvironmentDateSpecifier)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_dictionary(v4, (const char *)[@"specifier" UTF8String]);
  if (v5)
  {
    unint64_t v6 = [[BLSAlwaysOnDateSpecifier alloc] initWithXPCDictionary:v5];
  }
  else
  {
    id v7 = bls_diagnostics_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BLSDiagnosticFlipbookFrame initWithXPCDictionary:]();
    }

    unint64_t v6 = 0;
  }
  string = xpc_dictionary_get_string(v4, (const char *)[@"environment" UTF8String]);
  if (string)
  {
    v9 = [NSString stringWithUTF8String:string];
  }
  else
  {
    id v10 = bls_diagnostics_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BLSDiagnosticEnvironmentDateSpecifier initWithXPCDictionary:]();
    }

    v9 = @"<null environment identifier>";
  }
  id v11 = [(BLSDiagnosticEnvironmentDateSpecifier *)self initWithDateSpecifier:v6 environmentIdentifier:v9];

  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (const char *)[@"specifier" UTF8String];
  xpc_object_t value = xpc_dictionary_create(0, 0, 0);
  [(BLSAlwaysOnDateSpecifier *)self->_dateSpecifier encodeWithXPCDictionary:value];
  xpc_dictionary_set_value(v4, v5, value);
  xpc_dictionary_set_string(v4, (const char *)[@"environment" UTF8String], -[NSString UTF8String](self->_environmentIdentifier, "UTF8String"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSDiagnosticEnvironmentDateSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specifier"];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
    self = [(BLSDiagnosticEnvironmentDateSpecifier *)self initWithDateSpecifier:v5 environmentIdentifier:v6];

    id v7 = self;
  }
  else
  {
    id v8 = bls_diagnostics_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BLSDiagnosticEnvironmentDateSpecifier initWithCoder:]();
    }

    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  dateSpecifier = self->_dateSpecifier;
  id v5 = a3;
  [v5 encodeObject:dateSpecifier forKey:@"specifier"];
  [v5 encodeObject:self->_environmentIdentifier forKey:@"environment"];
}

- (BLSAlwaysOnDateSpecifier)dateSpecifier
{
  return self->_dateSpecifier;
}

- (NSString)environmentIdentifier
{
  return self->_environmentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentIdentifier, 0);

  objc_storeStrong((id *)&self->_dateSpecifier, 0);
}

- (void)initWithXPCDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1B55DE000, v0, v1, "failed to decode explanation from %{public}@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1B55DE000, v0, v1, "invalid specifier from %{public}@", v2, v3, v4, v5, v6);
}

@end