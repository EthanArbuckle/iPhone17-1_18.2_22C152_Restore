@interface CNUICoreFamilyMemberContactsModel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNUICoreFamilyMemberContactsModel)init;
- (CNUICoreFamilyMemberContactsModel)initWithCoder:(id)a3;
- (CNUICoreFamilyMemberContactsModel)initWithItems:(id)a3;
- (NSArray)items;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNUICoreFamilyMemberContactsModel

- (CNUICoreFamilyMemberContactsModel)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberContactsModel)initWithItems:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_10 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_10, &__block_literal_global_35);
    }
    v6 = CNGuardOSLog_cn_once_object_0_10;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_10, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreFamilyMemberContactsModel initWithItems:](v6);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CNUICoreFamilyMemberContactsModel;
  v7 = [(CNUICoreFamilyMemberContactsModel *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_items, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNUICoreFamilyMemberContactsModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNUICoreFamilyMemberContactsModel;
  id v5 = [(CNUICoreFamilyMemberContactsModel *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_items"];
    uint64_t v10 = [v9 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNUICoreFamilyMemberContactsModel *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (unint64_t v5 = (unint64_t)[(CNUICoreFamilyMemberContactsModel *)self items],
          unint64_t v6 = (unint64_t)[(CNUICoreFamilyMemberContactsModel *)v4 items],
          v5 | v6)
      && ![(id)v5 isEqual:v6])
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x263F335E8];
  id v3 = [(CNUICoreFamilyMemberContactsModel *)self items];
  unint64_t v4 = [v2 arrayHash:v3] + 527;

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  unint64_t v4 = [(CNUICoreFamilyMemberContactsModel *)self items];
  id v5 = (id)[v3 appendObject:v4 withName:@"items"];

  unint64_t v6 = [v3 build];

  return v6;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

- (void)initWithItems:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘items’ must be nonnull", v1, 2u);
}

@end