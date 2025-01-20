@interface CNContactRelation
+ (BOOL)supportsSecureCoding;
+ (CNContactRelation)contactRelationWithName:(NSString *)name;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid:(id *)a3;
- (CNContactRelation)initWithCoder:(id)a3;
- (CNContactRelation)initWithName:(NSString *)name;
- (NSString)description;
- (NSString)name;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CNContactRelation

- (CNContactRelation)initWithName:(NSString *)name
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactRelation;
  v3 = name;
  v4 = [(CNContactRelation *)&v6 init];
  -[CNContactRelation setName:](v4, "setName:", v3, v6.receiver, v6.super_class);

  return v4;
}

+ (CNContactRelation)contactRelationWithName:(NSString *)name
{
  v4 = name;
  v5 = (void *)[objc_alloc((Class)a1) initWithName:v4];

  return (CNContactRelation *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactRelation)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNContactRelation;
  id v3 = a3;
  v4 = [(CNContactRelation *)&v9 init];
  v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_name", v9.receiver, v9.super_class);

  uint64_t v6 = [v5 copy];
  name = v4->_name;
  v4->_name = (NSString *)v6;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [(CNContactRelation *)self name];
    if (v7 || ([v6 name], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [(CNContactRelation *)self name];
      objc_super v9 = [v6 name];
      char v10 = [v8 isEqual:v9];

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_10:

  return v10;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNContactRelation *)self name];
  id v5 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"name", v4, 0);

  id v6 = [v3 build];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __25__CNContactRelation_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __25__CNContactRelation_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (BOOL)isValid:(id *)a3
{
  if (isValid__cn_once_token_0_1 != -1) {
    dispatch_once(&isValid__cn_once_token_0_1, &__block_literal_global_68);
  }
  id v5 = (id)isValid__cn_once_object_0_1;
  if (isValid__cn_once_token_1_1 != -1) {
    dispatch_once(&isValid__cn_once_token_1_1, &__block_literal_global_9_1);
  }
  uint64_t v6 = isValid__cn_once_token_2_1;
  id v7 = (id)isValid__cn_once_object_1_1;
  if (v6 != -1) {
    dispatch_once(&isValid__cn_once_token_2_1, &__block_literal_global_11_0);
  }
  BOOL v8 = +[CN areValidKeyPaths:v5 forObject:self expectedClasses:v7 allowNil:isValid__cn_once_object_2_1 error:a3];

  return v8;
}

void __29__CNContactRelation_isValid___block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"name";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)isValid__cn_once_object_0_1;
  isValid__cn_once_object_0_1 = v1;
}

void __29__CNContactRelation_isValid___block_invoke_2()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)isValid__cn_once_object_1_1;
  isValid__cn_once_object_1_1 = v1;
}

uint64_t __29__CNContactRelation_isValid___block_invoke_3()
{
  isValid__cn_once_object_2_1 = [&unk_1EE089710 copy];

  return MEMORY[0x1F41817F8]();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end