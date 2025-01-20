@interface ASTIdentityAlias
+ (BOOL)isCoreRepairFrameworkAvailable;
+ (BOOL)supportsSecureCoding;
+ (id)identityAliasWithChipId:(id)a3 uniqueChipId:(id)a4;
+ (id)identityAliasWithMainLogicBoardSerialNumber:(id)a3;
+ (id)identityAliasWithSerialNumber:(id)a3;
- (ASTIdentityAlias)init;
- (ASTIdentityAlias)initWithChipId:(id)a3 uniqueChipId:(id)a4;
- (ASTIdentityAlias)initWithCoder:(id)a3;
- (ASTIdentityAlias)initWithMainLogicBoardSerialNumber:(id)a3;
- (ASTIdentityAlias)initWithSerialNumber:(id)a3;
- (BOOL)diagnosticMode;
- (NSDictionary)dictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDiagnosticMode:(BOOL)a3;
- (void)setDictionary:(id)a3;
@end

@implementation ASTIdentityAlias

+ (id)identityAliasWithSerialNumber:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSerialNumber:v4];

  return v5;
}

- (ASTIdentityAlias)initWithSerialNumber:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ASTIdentityAlias *)self init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v16[0] = @"type";
      v16[1] = @"serialNumber";
      v17[0] = @"FGSN";
      v17[1] = v4;
      v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      v8 = (void *)[v7 mutableCopy];

      if (+[ASTIdentityAlias isCoreRepairFrameworkAvailable])
      {
        uint64_t v15 = 0;
        v9 = [NSClassFromString(&cfstr_Crrepairstatus.isa) isServicePartWithError:&v15];
        v10 = v9;
        if (v9) {
          uint64_t v11 = [v9 isEqualToString:@"1"];
        }
        else {
          uint64_t v11 = 0;
        }
        v12 = [NSNumber numberWithBool:v11];
        [v8 setObject:v12 forKeyedSubscript:@"isServicePart"];
      }
      v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ASTIdentityAlias diagnosticMode](v6, "diagnosticMode"));
      [v8 setObject:v13 forKeyedSubscript:@"isDiagnosticMode"];

      [(ASTIdentityAlias *)v6 setDictionary:v8];
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)isCoreRepairFrameworkAvailable
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ASTIdentityAlias_FGSN__isCoreRepairFrameworkAvailable__block_invoke;
  block[3] = &unk_264E7D638;
  v5 = @"/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit";
  if (isCoreRepairFrameworkAvailable_coreRepairToken != -1) {
    dispatch_once(&isCoreRepairFrameworkAvailable_coreRepairToken, block);
  }
  char v2 = isCoreRepairFrameworkAvailable_isCoreRepairAvailable;

  return v2;
}

void *__56__ASTIdentityAlias_FGSN__isCoreRepairFrameworkAvailable__block_invoke(uint64_t a1)
{
  result = dlopen((const char *)[*(id *)(a1 + 32) UTF8String], 1);
  isCoreRepairFrameworkAvailable_isCoreRepairAvailable = result != 0;
  return result;
}

+ (id)identityAliasWithMainLogicBoardSerialNumber:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithMainLogicBoardSerialNumber:v4];

  return v5;
}

- (ASTIdentityAlias)initWithMainLogicBoardSerialNumber:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ASTIdentityAlias *)self init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v10[0] = @"type";
      v10[1] = @"serialNumber";
      v11[0] = @"MLBSN";
      v11[1] = v4;
      v10[2] = @"isDiagnosticMode";
      v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ASTIdentityAlias diagnosticMode](v5, "diagnosticMode"));
      v11[2] = v7;
      v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
      [(ASTIdentityAlias *)v6 setDictionary:v8];
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (ASTIdentityAlias)init
{
  v14[2] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)ASTIdentityAlias;
  char v2 = [(ASTIdentityAlias *)&v12 init];
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    v13[0] = @"type";
    v13[1] = @"serialNumber";
    v14[0] = @"FGSN";
    v14[1] = v3;
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSDictionary *)v4;

    v6 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AppleServiceToolkit"];
    if (+[ASTEnvironment isInternalBuild])
    {
      v7 = (NSDictionary *)[(NSDictionary *)v2->_dictionary mutableCopy];
      v8 = [v6 objectForKey:@"TimberLorrySession"];
      [(NSDictionary *)v7 setValue:v8 forKey:@"isTimberLorryTestSession"];
      v9 = v2->_dictionary;
      v2->_dictionary = v7;
    }
    if ([v6 BOOLForKey:@"DiagnosticMode"]) {
      char v10 = 1;
    }
    else {
      char v10 = [MEMORY[0x263F31AC0] isCheckerBoardActive];
    }
    v2->_diagnosticMode = v10;
  }
  return v2;
}

- (ASTIdentityAlias)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASTIdentityAlias;
  v5 = [(ASTIdentityAlias *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"dictionary"];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTIdentityAlias *)self dictionary];
  [v4 encodeObject:v5 forKey:@"dictionary"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDictionary *)self->_dictionary copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (BOOL)diagnosticMode
{
  return self->_diagnosticMode;
}

- (void)setDiagnosticMode:(BOOL)a3
{
  self->_diagnosticMode = a3;
}

- (void).cxx_destruct
{
}

+ (id)identityAliasWithChipId:(id)a3 uniqueChipId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithChipId:v7 uniqueChipId:v6];

  return v8;
}

- (ASTIdentityAlias)initWithChipId:(id)a3 uniqueChipId:(id)a4
{
  v16[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ASTIdentityAlias *)self init];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v6 && v7)
    {
      v16[0] = @"ECID";
      v15[0] = @"type";
      v15[1] = @"chipId";
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"0x%08llX", objc_msgSend(v6, "unsignedLongLongValue"));
      v16[1] = v10;
      v15[2] = @"ECID";
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"0x%016llX", objc_msgSend(v7, "unsignedLongLongValue"));
      void v16[2] = v11;
      v15[3] = @"isDiagnosticMode";
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ASTIdentityAlias diagnosticMode](v9, "diagnosticMode"));
      v16[3] = v12;
      v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
      [(ASTIdentityAlias *)v9 setDictionary:v13];
    }
    else
    {

      uint64_t v9 = 0;
    }
  }

  return v9;
}

@end