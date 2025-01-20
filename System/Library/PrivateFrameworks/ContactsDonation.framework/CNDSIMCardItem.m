@interface CNDSIMCardItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNDSIMCardItem)initWithCoder:(id)a3;
- (CNDSIMCardItem)initWithIdentifier:(id)a3 value:(id)a4;
- (NSString)identifier;
- (NSString)value;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNDSIMCardItem

- (CNDSIMCardItem)initWithIdentifier:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_1 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_54);
  }
  v8 = CNGuardOSLog_cn_once_object_0_1;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT))
  {
    -[CNDSIMCardItem initWithIdentifier:value:](v8);
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
  if (CNGuardOSLog_cn_once_token_0_1 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_54);
  }
  v9 = CNGuardOSLog_cn_once_object_0_1;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT)) {
    -[CNDSIMCardItem initWithIdentifier:value:](v9);
  }
LABEL_10:
  v17.receiver = self;
  v17.super_class = (Class)CNDSIMCardItem;
  v10 = [(CNDSIMCardItem *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v6 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v7 copy];
    value = v10->_value;
    v10->_value = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  v4 = [(CNDSIMCardItem *)self identifier];
  id v5 = (id)[v3 appendName:@"identifier" object:v4];

  id v6 = [(CNDSIMCardItem *)self value];
  id v7 = (id)[v3 appendName:@"value" object:v6];

  v8 = [v3 build];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F335D0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __26__CNDSIMCardItem_isEqual___block_invoke;
  v15[3] = &unk_2641FBF68;
  v15[4] = self;
  id v16 = v4;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __26__CNDSIMCardItem_isEqual___block_invoke_2;
  v12 = &unk_2641FBF68;
  uint64_t v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = (void *)MEMORY[0x21669C740](&v9);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v15, v7, 0, v9, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __26__CNDSIMCardItem_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) identifier];
  id v4 = [*(id *)(a1 + 40) identifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __26__CNDSIMCardItem_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) value];
  id v4 = [*(id *)(a1 + 40) value];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x263F335E8];
  v6[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __22__CNDSIMCardItem_hash__block_invoke;
  v7[3] = &unk_2641FBF90;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __22__CNDSIMCardItem_hash__block_invoke_2;
  v6[3] = &unk_2641FBF90;
  v3 = (void *)MEMORY[0x21669C740](v6, a2);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __22__CNDSIMCardItem_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __22__CNDSIMCardItem_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) value];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNDSIMCardItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNDSIMCardItem;
  uint64_t v5 = [(CNDSIMCardItem *)&v14 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_value"];
    uint64_t v10 = [v9 copy];
    value = v5->_value;
    v5->_value = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_value forKey:@"_value"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log value:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_214267000, log, OS_LOG_TYPE_FAULT, "parameter ‘value’ must be nonnull", v1, 2u);
}

- (void)initWithIdentifier:(os_log_t)log value:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_214267000, log, OS_LOG_TYPE_FAULT, "parameter ‘identifier’ must be nonnull", v1, 2u);
}

@end