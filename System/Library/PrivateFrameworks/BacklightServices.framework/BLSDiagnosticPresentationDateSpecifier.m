@interface BLSDiagnosticPresentationDateSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)createWithSpecifier:(id)a3;
- (BLSDiagnosticPresentationDateSpecifier)initWithCoder:(id)a3;
- (BLSDiagnosticPresentationDateSpecifier)initWithPresentationDate:(id)a3 specifiers:(id)a4;
- (BLSDiagnosticPresentationDateSpecifier)initWithXPCDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)specifiers;
- (NSDate)presentationDate;
- (NSString)description;
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSDiagnosticPresentationDateSpecifier

+ (id)createWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 presentationDate];
  v7 = [v4 specifiers];

  v8 = (void *)[v5 initWithPresentationDate:v6 specifiers:v7];

  return v8;
}

- (BLSDiagnosticPresentationDateSpecifier)initWithPresentationDate:(id)a3 specifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLSDiagnosticPresentationDateSpecifier;
  v9 = [(BLSDiagnosticPresentationDateSpecifier *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentationDate, a3);
    uint64_t v11 = objc_msgSend(v8, "bs_map:", &__block_literal_global_11);
    specifiers = v10->_specifiers;
    v10->_specifiers = (NSArray *)v11;
  }
  return v10;
}

id __78__BLSDiagnosticPresentationDateSpecifier_initWithPresentationDate_specifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[BLSDiagnosticEnvironmentDateSpecifier createWithSpecifier:a2];
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (id)bls_loggingString
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NSDate *)self->_presentationDate bls_shortLoggingString];
  [v3 appendString:v4 withName:@"presentationDate"];

  [v3 appendArraySection:self->_specifiers withName:@"specifiers" skipIfEmpty:0 objectTransformer:&__block_literal_global_187];
  id v5 = [v3 build];

  return v5;
}

uint64_t __59__BLSDiagnosticPresentationDateSpecifier_bls_loggingString__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

- (id)bls_shortLoggingString
{
  v3 = objc_opt_new();
  id v4 = [(NSDate *)self->_presentationDate bls_shortLoggingString];
  [v3 appendString:v4 withName:0 skipIfEmpty:1];

  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSArray count](self->_specifiers, "count"), @"environments");
  v6 = [(NSArray *)self->_specifiers firstObject];
  id v7 = [v6 environmentIdentifier];
  id v8 = (id)[v3 appendObject:v7 withName:@"startingWith" skipIfNil:1];

  v9 = [v3 description];

  return v9;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NSDate *)self->_presentationDate bls_shortLoggingString];
  [v3 appendString:v4 withName:@"presentationDate"];

  [v3 appendArraySection:self->_specifiers withName:@"specifiers" skipIfEmpty:0];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_presentationDate];
  specifiers = self->_specifiers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__BLSDiagnosticPresentationDateSpecifier_hash__block_invoke;
  v9[3] = &unk_1E6107988;
  id v10 = v3;
  id v6 = v3;
  [(NSArray *)specifiers enumerateObjectsUsingBlock:v9];
  unint64_t v7 = [v6 hash];

  return v7;
}

id __46__BLSDiagnosticPresentationDateSpecifier_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  presentationDate = self->_presentationDate;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__BLSDiagnosticPresentationDateSpecifier_isEqual___block_invoke;
  v13[3] = &unk_1E61073D8;
  id v7 = v4;
  id v14 = v7;
  id v8 = (id)[v5 appendObject:presentationDate counterpart:v13];
  if ([v5 isEqual])
  {
    specifiers = self->_specifiers;
    id v10 = [v7 specifiers];
    BOOL v11 = [(NSArray *)specifiers isEqualToArray:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __50__BLSDiagnosticPresentationDateSpecifier_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentationDate];
}

- (BLSDiagnosticPresentationDateSpecifier)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:xpc_dictionary_get_double(v4, (const char *)objc_msgSend(@"presentationDate", "UTF8String"))];
  id v6 = (const char *)[@"specifiers" UTF8String];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = xpc_dictionary_get_array(v4, v6);

  if (v8)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke;
    applier[3] = &unk_1E61079B0;
    id v12 = v7;
    xpc_array_apply(v8, applier);
  }
  v9 = [(BLSDiagnosticPresentationDateSpecifier *)self initWithPresentationDate:v5 specifiers:v7];

  return v9;
}

uint64_t __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
  if (!v5)
  {
    id v6 = bls_diagnostics_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke_cold_1();
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = bls_diagnostics_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke_cold_2();
    }
LABEL_8:

    goto LABEL_9;
  }
  [*(id *)(a1 + 32) addObject:v5];
LABEL_9:

  return 1;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = (const char *)[@"presentationDate" UTF8String];
  [(NSDate *)self->_presentationDate timeIntervalSinceReferenceDate];
  xpc_dictionary_set_double(xdict, v4, v5);
  [@"specifiers" UTF8String];
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSDiagnosticPresentationDateSpecifier)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentationDate"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    id v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"specifiers"];

    self = [(BLSDiagnosticPresentationDateSpecifier *)self initWithPresentationDate:v5 specifiers:v9];
    id v10 = self;
  }
  else
  {
    v9 = bls_diagnostics_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BLSDiagnosticPresentationDateSpecifier initWithCoder:]();
    }
    id v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  presentationDate = self->_presentationDate;
  id v5 = a3;
  [v5 encodeObject:presentationDate forKey:@"presentationDate"];
  [v5 encodeObject:self->_specifiers forKey:@"specifiers"];
}

- (NSDate)presentationDate
{
  return self->_presentationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationDate, 0);

  objc_storeStrong((id *)&self->_specifiers, 0);
}

void __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1B55DE000, v0, v1, "unable to decode specifiers for %{public}@", v2, v3, v4, v5, v6);
}

void __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_4();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1B55DE000, v1, OS_LOG_TYPE_FAULT, "decoded object:%{public}@ for %{public}@ is not a BLSDiagnosticEnvironmentDateSpecifier class", v2, 0x16u);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1B55DE000, v0, v1, "invalid date from %{public}@", v2, v3, v4, v5, v6);
}

@end