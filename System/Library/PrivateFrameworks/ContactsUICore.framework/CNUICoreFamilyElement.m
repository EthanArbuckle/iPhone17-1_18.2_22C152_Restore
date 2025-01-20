@interface CNUICoreFamilyElement
- (BOOL)containsFamilyMember:(id)a3;
- (BOOL)hasMatchingContacts;
- (BOOL)isParent;
- (CNUICoreFamilyElement)initWithFamilyMember:(id)a3 matchingContacts:(id)a4;
- (FAFamilyMember)familyMember;
- (NSArray)matchingContacts;
- (id)description;
@end

@implementation CNUICoreFamilyElement

- (CNUICoreFamilyElement)initWithFamilyMember:(id)a3 matchingContacts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_15 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_15, &__block_literal_global_51);
  }
  v9 = CNGuardOSLog_cn_once_object_0_15;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_15, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyElement initWithFamilyMember:matchingContacts:](v9);
    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v8) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_15 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_15, &__block_literal_global_51);
  }
  v10 = CNGuardOSLog_cn_once_object_0_15;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_15, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyElement initWithFamilyMember:matchingContacts:](v10);
  }
LABEL_10:
  v15.receiver = self;
  v15.super_class = (Class)CNUICoreFamilyElement;
  v11 = [(CNUICoreFamilyElement *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_familyMember, a3);
    objc_storeStrong((id *)&v12->_matchingContacts, a4);
    v13 = v12;
  }

  return v12;
}

- (BOOL)hasMatchingContacts
{
  uint64_t v2 = *MEMORY[0x263F334B0];
  v3 = [(CNUICoreFamilyElement *)self matchingContacts];
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3) ^ 1;

  return v2;
}

- (BOOL)isParent
{
  uint64_t v2 = [(CNUICoreFamilyElement *)self familyMember];
  char v3 = [v2 isParent];

  return v3;
}

- (BOOL)containsFamilyMember:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUICoreFamilyElement *)self familyMember];

  if (v5 == v4)
  {
    char v9 = 1;
  }
  else
  {
    v6 = [v4 dsid];
    id v7 = [(CNUICoreFamilyElement *)self familyMember];
    id v8 = [v7 dsid];
    if ([v6 isEqual:v8])
    {
      char v9 = 1;
    }
    else
    {
      v10 = [v4 altDSID];
      v11 = [(CNUICoreFamilyElement *)self familyMember];
      v12 = [v11 altDSID];
      char v9 = [v10 isEqualToString:v12];
    }
  }

  return v9;
}

- (id)description
{
  char v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = [(CNUICoreFamilyElement *)self familyMember];
  id v5 = (id)[v3 appendObject:v4 withName:@"familyMember"];

  v6 = [(CNUICoreFamilyElement *)self matchingContacts];
  id v7 = (id)[v3 appendObject:v6 withName:@"matchingContacts"];

  id v8 = [v3 build];

  return v8;
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (NSArray)matchingContacts
{
  return self->_matchingContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingContacts, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

- (void)initWithFamilyMember:(os_log_t)log matchingContacts:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘matchingContacts’ must be nonnull", v1, 2u);
}

- (void)initWithFamilyMember:(os_log_t)log matchingContacts:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘familyMember’ must be nonnull", v1, 2u);
}

@end