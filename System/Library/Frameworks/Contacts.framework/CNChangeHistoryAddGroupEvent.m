@interface CNChangeHistoryAddGroupEvent
+ (BOOL)supportsSecureCoding;
+ (unint64_t)instanceSortOrder;
- (BOOL)isEqual:(id)a3;
- (CNChangeHistoryAddGroupEvent)init;
- (CNChangeHistoryAddGroupEvent)initWithCoder:(id)a3;
- (CNChangeHistoryAddGroupEvent)initWithGroup:(id)a3 containerIdentifier:(id)a4;
- (CNGroup)group;
- (NSString)containerIdentifier;
- (id)description;
- (int64_t)comparisonResultWithinSameClass:(id)a3;
- (unint64_t)hash;
- (void)acceptEventVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNChangeHistoryAddGroupEvent

- (CNChangeHistoryAddGroupEvent)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryAddGroupEvent)initWithGroup:(id)a3 containerIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    }
    v9 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNChangeHistoryAddGroupEvent initWithGroup:containerIdentifier:](v9);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)CNChangeHistoryAddGroupEvent;
  v10 = [(CNChangeHistoryAddGroupEvent *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_group, a3);
    uint64_t v12 = [v8 copy];
    containerIdentifier = v11->_containerIdentifier;
    v11->_containerIdentifier = (NSString *)v12;

    v14 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryAddGroupEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_group"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_containerIdentifier"];

  id v7 = [(CNChangeHistoryAddGroupEvent *)self initWithGroup:v5 containerIdentifier:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  group = self->_group;
  id v5 = a3;
  [v5 encodeObject:group forKey:@"_group"];
  [v5 encodeObject:self->_containerIdentifier forKey:@"_containerIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__CNChangeHistoryAddGroupEvent_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __40__CNChangeHistoryAddGroupEvent_isEqual___block_invoke_2;
  uint64_t v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __40__CNChangeHistoryAddGroupEvent_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) group];
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 40) group];
  id v6 = [v5 identifier];
  uint64_t v7 = [v2 isObject:v4 equalToOther:v6];

  return v7;
}

uint64_t __40__CNChangeHistoryAddGroupEvent_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) containerIdentifier];
  id v4 = [*(id *)(a1 + 40) containerIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CNChangeHistoryAddGroupEvent_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CNChangeHistoryAddGroupEvent_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  id v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __36__CNChangeHistoryAddGroupEvent_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) group];
  id v3 = [v2 identifier];
  uint64_t v4 = [v1 objectHash:v3];

  return v4;
}

uint64_t __36__CNChangeHistoryAddGroupEvent_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) containerIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  uint64_t v4 = [(CNChangeHistoryAddGroupEvent *)self group];
  id v5 = (id)[v3 appendName:@"group" object:v4];

  id v6 = [(CNChangeHistoryAddGroupEvent *)self containerIdentifier];
  id v7 = (id)[v3 appendName:@"containerIdentifier" object:v6];

  id v8 = [v3 build];

  return v8;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [[CNSafeChangeHistoryEventVisitorWrapper alloc] initWithChangeHistoryEventVisitor:v4];

  [(CNSafeChangeHistoryEventVisitorWrapper *)v5 visitAddGroupEvent:self];
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChangeHistoryAddGroupEvent *)self group];
  id v6 = [v5 identifier];
  id v7 = [v4 group];

  id v8 = [v7 identifier];
  int64_t v9 = [v6 compare:v8];

  return v9;
}

+ (unint64_t)instanceSortOrder
{
  return 3;
}

- (CNGroup)group
{
  return self->_group;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

- (void)initWithGroup:(void *)a1 containerIdentifier:.cold.1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v3, v4, "parameter ‘group’ must be nonnull and of type %{public}@", v5, v6, v7, v8, v9);
}

@end