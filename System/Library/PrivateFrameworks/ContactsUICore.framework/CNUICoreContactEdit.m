@interface CNUICoreContactEdit
- (BOOL)isEqual:(id)a3;
- (BOOL)modifiesContact:(id)a3;
- (BOOL)originalAndModifiedDiffer;
- (CNContact)modified;
- (CNContact)original;
- (CNUICoreContactEdit)initWithContact:(id)a3;
- (CNUICoreContactEdit)initWithOriginalContact:(id)a3 modifiedContact:(id)a4;
- (id)description;
- (id)editBySettingModifiedContact:(id)a3;
- (unint64_t)hash;
@end

@implementation CNUICoreContactEdit

- (CNUICoreContactEdit)initWithContact:(id)a3
{
  return [(CNUICoreContactEdit *)self initWithOriginalContact:a3 modifiedContact:a3];
}

- (CNUICoreContactEdit)initWithOriginalContact:(id)a3 modifiedContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_12);
  }
  v8 = CNGuardOSLog_cn_once_object_0_2;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreContactEdit initWithOriginalContact:modifiedContact:](v8);
    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v7) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_12);
  }
  v9 = CNGuardOSLog_cn_once_object_0_2;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreContactEdit initWithOriginalContact:modifiedContact:](v9);
  }
LABEL_10:
  v17.receiver = self;
  v17.super_class = (Class)CNUICoreContactEdit;
  v10 = [(CNUICoreContactEdit *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v6 copy];
    original = v10->_original;
    v10->_original = (CNContact *)v11;

    uint64_t v13 = [v7 copy];
    modified = v10->_modified;
    v10->_modified = (CNContact *)v13;

    v15 = v10;
  }

  return v10;
}

- (id)editBySettingModifiedContact:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(CNUICoreContactEdit *)self original];
  id v7 = (void *)[v5 initWithOriginalContact:v6 modifiedContact:v4];

  return v7;
}

- (BOOL)originalAndModifiedDiffer
{
  v3 = [(CNUICoreContactEdit *)self original];
  id v4 = [(CNUICoreContactEdit *)self modified];
  char v5 = [v3 isEqual:v4] ^ 1;

  return v5;
}

- (BOOL)modifiesContact:(id)a3
{
  id v4 = a3;
  char v5 = [(CNUICoreContactEdit *)self original];
  id v6 = [v5 identifier];
  id v7 = [v4 identifier];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNUICoreContactEdit *)a3;
  BOOL v9 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (unint64_t v5 = (unint64_t)[(CNUICoreContactEdit *)self original],
          unint64_t v6 = (unint64_t)[(CNUICoreContactEdit *)v4 original],
          v5 | v6)
      && ![(id)v5 isEqual:v6]
      || (unint64_t v7 = (unint64_t)[(CNUICoreContactEdit *)self modified],
          unint64_t v8 = (unint64_t)[(CNUICoreContactEdit *)v4 modified],
          v7 | v8)
      && ![(id)v7 isEqual:v8])
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x263F335E8];
  id v4 = [(CNUICoreContactEdit *)self original];
  uint64_t v5 = [v3 objectHash:v4];

  unint64_t v6 = (void *)MEMORY[0x263F335E8];
  unint64_t v7 = [(CNUICoreContactEdit *)self modified];
  unint64_t v8 = [v6 objectHash:v7] - v5 + 32 * v5 + 16337;

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = [(CNUICoreContactEdit *)self original];
  id v5 = (id)[v3 appendObject:v4 withName:@"original"];

  unint64_t v6 = [(CNUICoreContactEdit *)self modified];
  id v7 = (id)[v3 appendObject:v6 withName:@"modified"];

  unint64_t v8 = [v3 build];

  return v8;
}

- (CNContact)original
{
  return self->_original;
}

- (CNContact)modified
{
  return self->_modified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_original, 0);
}

- (void)initWithOriginalContact:(os_log_t)log modifiedContact:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘modifiedContact’ must be nonnull", v1, 2u);
}

- (void)initWithOriginalContact:(os_log_t)log modifiedContact:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘originalContact’ must be nonnull", v1, 2u);
}

@end