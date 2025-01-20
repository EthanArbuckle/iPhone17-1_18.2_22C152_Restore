@interface CNUICoreContactTypeAssessor
+ (NSArray)keysToFetch;
- (CNFuture)familyInfoFuture;
- (CNUICoreContactTypeAssessor)init;
- (CNUICoreContactTypeAssessor)initWithFamilyInfo:(id)a3;
- (CNUICoreContactTypeAssessor)initWithFamilyInfoFuture:(id)a3;
- (int64_t)estiamtedTypeOfContact:(id)a3;
@end

@implementation CNUICoreContactTypeAssessor

+ (NSArray)keysToFetch
{
  v5[5] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263EFEA20], "descriptorForRequiredKeysForStyle:", +[CNUICoreFamilyMemberContactsModelRetriever contactFormatterStyle](CNUICoreFamilyMemberContactsModelRetriever, "contactFormatterStyle", *MEMORY[0x263EFDFC8], *MEMORY[0x263EFDFB8], *MEMORY[0x263EFE070], *MEMORY[0x263EFDF78]));
  v5[4] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:5];

  return (NSArray *)v3;
}

- (CNUICoreContactTypeAssessor)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactTypeAssessor)initWithFamilyInfo:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_17 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_17, &__block_literal_global_57);
    }
    v5 = CNGuardOSLog_cn_once_object_0_17;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_17, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactTypeAssessor initWithFamilyInfo:](v5);
    }
  }
  v6 = [MEMORY[0x263F335E0] futureWithResult:v4];
  v7 = [(CNUICoreContactTypeAssessor *)self initWithFamilyInfoFuture:v6];

  return v7;
}

- (CNUICoreContactTypeAssessor)initWithFamilyInfoFuture:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_17 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_17, &__block_literal_global_57);
    }
    v6 = CNGuardOSLog_cn_once_object_0_17;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_17, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactTypeAssessor initWithFamilyInfoFuture:](v6);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CNUICoreContactTypeAssessor;
  v7 = [(CNUICoreContactTypeAssessor *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_familyInfoFuture, a3);
    v9 = v8;
  }

  return v8;
}

- (int64_t)estiamtedTypeOfContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUICoreContactTypeAssessor *)self familyInfoFuture];
  v6 = [v5 result:0];

  if (v6)
  {
    v7 = [v6 meContact];
    BOOL v8 = +[CNUICoreContactMatcher doesContact:v4 matchContact:v7];

    BOOL v9 = +[CNUICoreContactMatcher doesContact:v4 matchAnyParentOrGuardianInFamily:v6];
    if (v8) {
      int64_t v10 = 2;
    }
    else {
      int64_t v10 = v9;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (CNFuture)familyInfoFuture
{
  return self->_familyInfoFuture;
}

- (void).cxx_destruct
{
}

- (void)initWithFamilyInfo:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘initWithFamilyInfo’ must be nonnull", v1, 2u);
}

- (void)initWithFamilyInfoFuture:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘familyInfoFuture’ must be nonnull", v1, 2u);
}

@end