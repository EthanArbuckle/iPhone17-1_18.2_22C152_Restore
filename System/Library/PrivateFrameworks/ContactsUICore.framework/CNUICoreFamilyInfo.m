@interface CNUICoreFamilyInfo
- (CNContact)meContact;
- (CNUICoreFamilyInfo)init;
- (CNUICoreFamilyInfo)initWithMeContact:(id)a3 elements:(id)a4;
- (NSArray)elements;
- (id)description;
@end

@implementation CNUICoreFamilyInfo

- (CNUICoreFamilyInfo)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyInfo)initWithMeContact:(id)a3 elements:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    if (CNGuardOSLog_cn_once_token_0_21 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_21, &__block_literal_global_70);
    }
    v9 = CNGuardOSLog_cn_once_object_0_21;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_21, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreFamilyInfo initWithMeContact:elements:](v9);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)CNUICoreFamilyInfo;
  v10 = [(CNUICoreFamilyInfo *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_meContact, a3);
    objc_storeStrong((id *)&v11->_elements, a4);
    v12 = v11;
  }

  return v11;
}

- (id)description
{
  id v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  v4 = [(CNUICoreFamilyInfo *)self meContact];
  id v5 = (id)[v3 appendObject:v4 withName:@"meContact"];

  v6 = [(CNUICoreFamilyInfo *)self elements];
  id v7 = (id)[v3 appendObject:v6 withName:@"elements"];

  id v8 = [v3 build];

  return v8;
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
}

- (void)initWithMeContact:(os_log_t)log elements:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘elements’ must be nonnull", v1, 2u);
}

@end